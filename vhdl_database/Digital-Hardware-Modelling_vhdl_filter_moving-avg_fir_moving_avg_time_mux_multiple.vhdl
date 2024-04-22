-- Author: Varun Nagpal
-- May 4th, 2019

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This design implements an FIR Moving Average filter
-- which averages L points 
--
-- y[n] = ( x[n] + x[n-1] + .. + x[n-L-1] ) / L
--      = summation( x[n-k], k = 0 to L-1 ) / L
--
-- L= Number of points to be averaged or length of filter
-- N = L-1 = order of the filter
--
-- To design above FIR filer using R adders (resources),
-- we modify the difference equation in two ways below:
-- 
-- 1. y[n] = summation( summation( x[ n - r x M - s], s = 0 to M-1 ), r = 0 to R-1 ) / L
--
-- where, 
--      M = L/R = Samples to be processed per resource (adder)
--      r = resource id = 0 to R-1
--      s = sample id = 0 to M-1
--
-- This allocates resource id
--  0 with sub-sequence     : x[n]          x[n-1]          ... x[n-M+1]
--  1 with sub-sequence     : x[n-M]        x[n-M-1]        ... x[n-2M+1]
--  2 with sub-sequence     : x[n-2M]       x[n-2M-1]       ... x[n-3M+1]
--  ...
--  R-1 with sub-sequence   : x[n-(R-1)M]   x[n-(R-1)M-1]   ... x[n-RM+1] = x[n-L+1]
--
-- 2. y[n] = summation( summation( x[ n - R x s - r], s = 0 to M-1 ), r = 0 to R-1 ) / L
--
-- where, 
--      M = L/R = Samples to be processed per resource (adder)
--      r = resource id = 0 to R-1
--      s = sample id = 0 to M-1
--
-- This allocates rth resource id with subsequence
--              m = 0    m = 1         m = M-1 
--  r = 0   :   x[n-1]   x[n-1-R]  ... x[n-1-RM+R]
--  r = 1   :   x[n-2]   x[n-2-R]  ... x[n-2-RM+R]
--  r = 2   :   x[n-3]   x[n-3-R]  ... x[n-3-RM+R]
--  ..
--  r = R-1 :   x[n-R]   x[n-R-R]  ... x[n-R-RM+R] = x[n-RM]= x[n-L]
--
-- While we can implement any of above two equations, 
-- in our design we implement the second of the above 
-- two equations

entity fir is
    generic( L      : natural := 16;                            -- L = Filter length or number of points to be averaged
             L_BW   : natural := 4;                             -- L_BW = Ceil(Log2(L))
             R      : natural := 4;                             -- R = Number of resources (adders and multiplexers)
             R_BW   : natural := 2;                             -- R_BW = Ceil(Log2(R))
             M      : natural := 4;                             -- M = L/R = Samples to be processed per resource (adder)
             M_BW   : natural := 2;                             -- M_BW = Ceil(Log2(M)) = number of select bits for M samples
             W      : natural := 16 );                          -- W = Bit width of input and output sample data (signed)
    port (clk       : in    std_logic;                          -- clock
          reset_n   : in    std_logic;                          -- active low asynchronous reset
          fir_en    : in    std_logic;                          -- handshake signal
          fir_in    : in    std_logic_vector( W-1 downto 0 );   -- sample inout x[n]
          fir_out   : out   std_logic_vector( W-1 downto 0 );   -- sample output y[n]
          fir_rdy   : out   std_logic                           -- handshake signal
          );
end fir;

architecture rtl of fir is
    type  t_reg_x is array ( 0 to L-1 ) of signed( W-1 downto 0 );
    signal reg_x : t_reg_x := ( others => ( others => '0' ) );

    -- R outputs of R muxes (one mux output per resource)
    type t_array_mux_out_x is array ( 0 to R-1 ) of signed( W-1 downto 0 );
    signal sig_array_mux_out_x : t_array_mux_out_x := ( others => ( others => '0') );

    -- Each of the R muxes has M data inputs requiring total of L=MR data inputs
    --type t_array_mux_in_x is array ( 0 to L-1 ) of signed( W-1 downto 0 );
    --signal sig_array_mux_in_x : t_array_mux_in_x := ( others => ( others => '0') );

    type t_mux_in is array ( 0 to R-1, 0 to M-1 ) of signed( W-1 downto 0 );
    signal sig_array_mux_in_x : t_mux_in := ( others => ( others => ( others => '0') ) );

    -- M_BW-bit select signal for each mux where M_BW = Ceil(Log2(M)), M = L/R
    signal sig_mux_sel_cnt      : unsigned( M_BW-1 downto 0 ) := ( others => '0' );
    signal sig_mux_sel_cnt_next : unsigned( M_BW-1 downto 0 ) := ( others => '0' );

    -- R-1 signed adders to add R mux outputs.
    -- i.e. 0, 1..., (R-2)th signed adders
    -- Note that we set bit size of each adder output equal to the 
    -- maximum bit-size required to accumulate addition of R signed 
    -- numbers which is W+R_BW bits where R_BW = Ceil(Log2(R))
    type t_array_signed_adders is array ( 0 to R-2 ) of signed( W+R_BW-1 downto 0 );
    signal sig_array_signed_adders: t_array_signed_adders := ( others => ( others => '0' ) );

    -- (R-1)th signed adder is used to accumulate result of 
    -- R-1 signed adders i.e output of the (R-2)th signed adder
    signal sig_y_sum    : signed( W+L_BW-1 downto 0 )   := ( others => '0' );   -- add/sub of L = MR signed numbers each of W bit-width
                                                                                -- requires total W+L_BW bits where L_BW = Ceil(log2(L))
    signal reg_y_sum    : signed( W+L_BW-1 downto 0 )   := ( others => '0' );
    signal sig_y_out    : signed( W+L_BW-1 downto 0 )   := ( others => '0' );

    signal reg_fir_rdy  : std_logic := '0';
begin

    -- Generate ready signal 1 cc after enable input changes
    process( clk, reset_n )
    begin
        if( reset_n = '0' ) then
            reg_fir_rdy <= '0';
            fir_rdy <= '0';
        elsif ( rising_edge(clk) ) then
            if( fir_en = '1' ) then
                reg_fir_rdy <= '1';
            else
                reg_fir_rdy <= '0';
            end if;
            fir_rdy <= reg_fir_rdy;
        end if;
    end process;
    
    -- Generate x[n-1],x[n-2]...x[n-L+1], x[n-L]
    -- Shift x[n] after every M clock cycles
    process ( clk, reset_n )
    begin
        if ( reset_n = '0' ) then
            for i in 0 to (L-1) loop
                reg_x(i) <= ( others => '0');
            end loop;
        elsif ( rising_edge(clk) ) then
            -- Shift new data only when filter is enabled
            if( fir_en = '1' ) then
                if ( sig_mux_sel_cnt = (M-1) ) then
                    reg_x(0) <= signed(fir_in);
                    for i in 1 to (L-1) loop
                        reg_x(i) <= reg_x(i-1);
                    end loop;
                end if;
            end if;
        end if;
    end process;

    -- Allocate following data lines as inputs to the rth multiplexer:
    --              j = 0    j = 1         j = M-1 
    --  i = 0   :   x[n-1]   x[n-1-R]  ... x[n-1-RM+R]
    --  i = 1   :   x[n-2]   x[n-2-R]  ... x[n-2-RM+R]
    --  i = 2   :   x[n-3]   x[n-3-R]  ... x[n-3-RM+R]
    --  ..
    --  i = R-1 :   x[n-R]   x[n-R-R]  ... x[n-R-RM+R] = x[n-RM]= x[n-L]
    process( reg_x )
    begin
        for i in 0 to R-1 loop
            for j in 0 to M-1 loop
                sig_array_mux_in_x( i, j ) <= reg_x( i + j*R );
            end loop;
        end loop;
    end process;

    -- Generate select signal for the muxes using a counter (mod M)
    process ( clk, reset_n )
    begin
        if ( reset_n = '0' ) then
            sig_mux_sel_cnt <= to_unsigned( 0, sig_mux_sel_cnt'LENGTH );
        elsif ( rising_edge( clk ) ) then
            if ( reg_fir_rdy = '1' ) then
                sig_mux_sel_cnt <= sig_mux_sel_cnt_next;
            end if;
        end if;
    end process;

    sig_mux_sel_cnt_next <= ( others => '0' ) when sig_mux_sel_cnt = ( M-1 ) else
                            ( sig_mux_sel_cnt + 1 );

    -- Generate the R muxes
    process ( sig_array_mux_in_x, sig_mux_sel_cnt )
    begin
        for i in 0 to R-1 loop
            sig_array_mux_out_x( i ) <= sig_array_mux_in_x( i, to_integer( sig_mux_sel_cnt ) );
        end loop;
    end process;

    -- Generate R-1 signed adders for R muxes.
    -- i.e. 0, 1..., (R-2)th signed adders
    -- A[0] = M[0]+M[1]
    -- A[1] = A[0]+M[2]
    -- A[2] = A[1]+M[3]
    -- ....
    -- A[R-2] = A[R-3]+M[R-1]
    --
    -- Note: The last signed adder to be used for 
    --       accumulation is generated separately   
    comb_adders : process ( sig_array_mux_out_x, sig_array_signed_adders )
    begin
        sig_array_signed_adders(0) <= resize( sig_array_mux_out_x(0), sig_array_signed_adders(0)'LENGTH ) + 
                                      resize( sig_array_mux_out_x(1), sig_array_signed_adders(0)'LENGTH );
        for i in 1 to R-2 loop
            sig_array_signed_adders(i)<= resize( sig_array_signed_adders(i-1), sig_array_signed_adders(i)'LENGTH ) + 
                                         resize( sig_array_mux_out_x(i+1), sig_array_signed_adders(i)'LENGTH );
        end loop;
    end process comb_adders;

    -- Generate Y[n] i.e. Rth signed adder which accumulates
    -- result of R-1 signed adders i.e the output of
    -- (R-1)th signed adder 
    -- A[R-1] = A[R-1] + A[R-2]
    -- Y[n] = Y[n-1] + A[R-2];
    sig_y_sum <= reg_y_sum + resize( sig_array_signed_adders( R-2 ), sig_y_sum'LENGTH )  ;

    -- Generate Y[n-1]
    process( clk, reset_n )
    begin
        if ( reset_n = '0' ) then
            reg_y_sum <= ( others => '0');
        elsif ( rising_edge(clk) ) then
            if( fir_en = '1' ) then
                if ( sig_mux_sel_cnt = (M-1) ) then
                    -- reset the accumulated sum after every M clock cycles
                    reg_y_sum <= ( others => '0');
                else
                    reg_y_sum <= sig_y_sum;
                end if;
            end if;
        end if;
    end process;

    -- y[n] = Y[n]/L = Y[n] >> L_BW, where L_BW=Ceil(log2(L))
    sig_y_out <= sig_y_sum srl L_BW;

    process ( clk, reset_n )
        variable temp : signed( W-1 downto 0 ) := ( others => '0' );
    begin
        if ( reset_n = '0' ) then
            fir_out <= ( others => '0' );
        elsif ( rising_edge( clk ) ) then
            temp := ( others => '0' );
            if( fir_en = '1' ) then
                -- Produce filter output after every M clock cycles
                if ( sig_mux_sel_cnt = (M-1) ) then
                    -- Round towards 0.
                    -- This means when doing binary division of a negative signed number
                    -- with a positive number through right shifting operation,
                    -- the rounding of quotient happens towards +infinity.
                    -- So there is a DC offset in negative quotients which needs to be eliminated
                    -- by rounding negative quotients towards zero instead of +infinity
                    temp := sig_y_out( W-1 downto 0 );
                    if ( temp(W-1) = '1' ) then
                        temp := temp+1;
                    end if;
                    fir_out <= std_logic_vector( temp );
                end if;
            end if;
        end if;
    end process;
end rtl;