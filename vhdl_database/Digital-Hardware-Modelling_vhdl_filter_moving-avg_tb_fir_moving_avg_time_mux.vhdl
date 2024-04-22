library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;

-- Testbench for FIR Moving Average filter which averages L points
entity Testbench is
end Testbench;

architecture test of Testbench is

    -- Constants to initialize generics of DUT
    constant L      : natural := 256;
    constant L_BW   : natural := natural(ceil(log2(real(L))));
    constant W      : natural := 16;

    -- Simulation control
    constant CLK_CYCLE_TIME : time      := 10 ns;
    signal   sim_end        : boolean   := false;
    signal   sample_cnt     : natural   := 1024;--natural(2**(W-1));

    -- Signals to connect ports of DUT
    signal clk       : std_logic                        := '0';                 -- clock
    signal reset_n   : std_logic                        := '0';                 -- active low asynchronous reset
    signal fir_en    : std_logic                        := '0';                 -- handshake signal
    signal fir_in    : std_logic_vector( W-1 downto 0 ) := ( others => '0' );   -- sample inout x[n]
    signal fir_out   : std_logic_vector( W-1 downto 0 ) := ( others => '0' );   -- sample output y[n]
    signal fir_rdy   : std_logic                        := '0';                 -- handshake signal
begin

    -- create instance of FIR Filter (DUT)
    DUT: entity work.fir(rtl)
         generic map ( L    => L,       -- L = Filter length or number of points to be averaged
                       L_BW => L_BW,    -- L_BW = Ceil(Log2(L))
                       W    => W        -- W = Bit width of input and output sample data (signed)
                    )
         port map   ( clk       => clk,     -- clock
                      reset_n   => reset_n, -- active low asynchronous reset
                      fir_en    => fir_en,  -- handshake signal
                      fir_in    => fir_in,  -- sample inout x[n]
                      fir_out   => fir_out, -- sample output y[n]
                      fir_rdy   => fir_rdy  -- handshake signal
                    );

    -- Clock generation
    clk_gen: process
    begin
        if( not sim_end ) then
            clk <= '0';
            wait for CLK_CYCLE_TIME/2;
            clk <= '1';
            wait for CLK_CYCLE_TIME/2;
        else
            wait;
        end if;
    end process clk_gen;

      -- Reset generation
      reset_n <= '0',
                 '1' after 1.3*CLK_CYCLE_TIME;

    -- test vectors
    stimulus : process
        variable seed1, seed2 : positive    := 1;
        variable x: real                    := 0.0;
        variable en: std_logic              := '0';

        procedure apply_stimulus( constant en : in std_logic;
                                  constant x : in integer;
                                  constant DELAY: in time ) is
        begin
          fir_en <= en;
          fir_in <= std_logic_vector( to_signed( x, fir_in'LENGTH ) );
          wait for DELAY;
        end procedure apply_stimulus;

        procedure apply_stimulus( constant en : in std_logic;
                                  constant x : in integer ) is
        begin
          fir_en <= en;
          fir_in <= std_logic_vector( to_signed( x, fir_in'LENGTH ) );
        end procedure apply_stimulus;
    begin
        -- Reset
        en := '0';
        x := 0.0;
        apply_stimulus( en, integer(x) );
        wait until reset_n = '1';

        for i in 1 to 4 loop
            wait until falling_edge( clk );
        end loop;

        -- Enable filter and wait for M clock cycles (falling edges)
        en := '1';
        apply_stimulus( en, integer(x) );

        -- Apply simple increasing stimulus
        for i in 0 to (sample_cnt-1) loop
            wait until falling_edge( clk );
            apply_stimulus( en, i+1 );
        end loop;

        -- Apply random stimulus
        for i in 0 to (sample_cnt-1) loop
            wait until falling_edge( clk );
            
            -- x = random number between 0.0 and 1.0 (exclusive)
            uniform( seed1, seed2, x );
            apply_stimulus( en, integer(floor(x * real(2**W))) );
        end loop;

        -- Apply upward trend stimulus
        for i in 0 to (sample_cnt-1) loop
            wait until falling_edge( clk );
            if ( i rem 4 = 0 ) then
                -- x = random number between 0.0 and 1.0 (exclusive)
                uniform( seed1, seed2, x );
                apply_stimulus( en, integer(floor(x * real(2**W))) );
            else
                apply_stimulus( en, i );
            end if;
        end loop;

        -- Apply downward trend stimulus
        for i in (sample_cnt-1) downto 0  loop
            wait until falling_edge( clk );
            if ( i rem 4 = 0 ) then
                -- x = random number between 0.0 and 1.0 (exclusive)
                uniform( seed1, seed2, x );
                apply_stimulus( en, integer(floor(x * real(2**W))) );
            else
                apply_stimulus( en, i );
            end if;
        end loop;

        -- Disable the filter
        wait until falling_edge( clk );
        en := '0';
        apply_stimulus( en, 0 );

        wait until falling_edge( clk );
        wait until falling_edge( clk );
        
        -- End simulation
        sim_end <= true;
        wait;
    end process stimulus;
end architecture test;