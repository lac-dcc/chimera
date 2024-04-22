-- Author: Varun Nagpal
-- May 4th, 2019

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This design implements an FIR Moving Average filter
-- which averages L points 
--
-- y[n] = ( x[n] + x[n-1] + .. + x[n-L-1] ) / L
--
-- To design above FIR filer using minimum number of adders,
-- we modify the difference equation as follows:
-- 
-- y[n] = y[n-1] + ( x[n] - x[n-L] ) / L
-- => Ly[n] = Ly[n-1] + ( x[n] - x[n-L] )
--
-- Assume Y[n] = Ly[n]
--
-- 1. Y[n] = Y[n-1] + ( x[n] - x[n-L] )
-- 2. y[n] = Y[n]/L
-- 
-- In our design we implement the above two equations
-- L= length of filter
-- N = L-1 = order of the filter

entity fir is
	generic( L      : natural := 256;                           -- L = Filter length or number of points to be averaged
			 L_BW   : natural := 8;                             -- Ceil(Log2(L))
			 W      : natural := 16 );                          -- Bit width of input and output sample data(signed)
	port (clk       : in    std_logic;                          -- clock
		  reset_n   : in    std_logic;                          -- active low asynchronous reset
		  fir_en    : in    std_logic;                          -- handshake signal
		  fir_in    : in    std_logic_vector( W-1 downto 0 );   -- sample inout x[n]
		  fir_out   : out   std_logic_vector( W-1 downto 0 );   -- sample output y[n]
		  fir_rdy   : out   std_logic                           -- handshake signal
		  );
end fir;

architecture rtl of fir is
	type  t_reg_xn_del is array ( 0 to L-1 ) of signed( W-1 downto 0 );
	signal reg_x_del    : t_reg_xn_del                  := ( others => ( others => '0' ) );

	signal sig_x_diff   : signed( W downto 0 )          := ( others => '0' );   -- add/sub of two W-bit signed numbers requires W+1 bits
	signal sig_y_sum    : signed( W+L_BW-1 downto 0 )   := ( others => '0' );   -- add/sub of two W+1 bit signed number did L_BW = log2(L) 
																				-- times requires ((W+1)+L_BW)-1 = W+L_BW bits
	signal reg_y_del    : signed( W+L_BW-1 downto 0 )   := ( others => '0' );
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

	-- Get x[n-L], Y[n-1]
	process (clk, reset_n)
	begin
		if (reset_n = '0') then
			for i in reg_x_del'RANGE(1) loop
				reg_x_del(i) <= ( others => '0');
			end loop;
			reg_y_del <= ( others => '0' );
		elsif ( rising_edge(clk) ) then
			-- Shift new data only when filter is enabled
			if( fir_en = '1' ) then
				reg_x_del(0) <= signed(fir_in);
				for i in 1 to reg_x_del'RIGHT(1) loop
					reg_x_del(i) <= reg_x_del(i-1);
				end loop;
				reg_y_del <= sig_y_sum;
			end if;
		end if;
	end process;

	-- Calculate difference ( x[n] - x[n-L] ).
	-- Note sign extension done befofe subtracting the two (W+1)-bit numbers
	sig_x_diff <= signed( fir_in( W - 1 ) & fir_in ) - ( reg_x_del( L - 1 )( W - 1 ) & reg_x_del( L - 1 ) );

	-- calculate sum Y[n] = Y[n-1] + ( x[n] - x[n-L] )
	-- Note sign extension done befofe subtracting the two W-bit numbers
	comb_adder: process ( sig_x_diff, reg_y_del )
		-- sign extend sig_x_diff with bit size W+1 bits by L_BW-1 bits
		-- before it can be added to reg_y_del of bit-size W+L_BW bits
		variable signvec: signed( L_BW-2 downto 0 )            := ( others => '0' );
		variable tmp_sig_x_diff: signed( W+L_BW-1 downto 0 )   := ( others => '0' );
	begin
		signvec := ( others => sig_x_diff( W ) );
		tmp_sig_x_diff := signvec & sig_x_diff;
		sig_y_sum <= tmp_sig_x_diff + reg_y_del;
	end process;

	-- y[n] = Y[n]/L = Y[n] >> L_BW, where L_BW=log2(L)
	sig_y_out <= sig_y_sum srl L_BW;

	process ( clk, reset_n )
		 variable temp : signed( W-1 downto 0 ) := ( others => '0' );
	begin
		if ( reset_n = '0' ) then
			fir_out <= ( others => '0' );
		elsif ( rising_edge( clk ) ) then
			temp := ( others => '0' );

			-- Produce new output sample only when filter is enabled
			if( fir_en = '1' ) then
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
	end process;
end rtl;