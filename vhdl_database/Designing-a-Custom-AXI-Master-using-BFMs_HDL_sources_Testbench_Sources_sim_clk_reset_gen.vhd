library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity clk_reset_gen is
    Port
        (
        -- User signals
        clk      : out STD_LOGIC;
        resetn   : out STD_LOGIC
        );
end clk_reset_gen;

architecture Behavioral of clk_reset_gen is

-- Simulation Constants
constant clk_FREQ_HZ : INTEGER := 100000000;
constant clk_period_NS : INTEGER := 1000000000 / clk_FREQ_HZ;
constant clk_period_PS : INTEGER := clk_period_NS * 1000;
constant clk_period_time : time := 1 ns * clk_period_NS;

-- Signal Declaration
signal clk_internal : STD_LOGIC;

-- Testbench control signals
signal sim_end : BOOLEAN := false;
signal cycle_count : INTEGER := 0;


begin

-- Concurrent assignments
clk <= clk_internal;

-- Generate a clock
clk_gen : process
begin
   while (not sim_end) loop
	  clk_internal <= '0';
		 wait for clk_period_time / 2;
	  clk_internal <= '1';
		 wait for clk_period_time / 2;
   end loop;
   wait;
end process clk_gen;

-- Generate a reset pulse
rst_gen : process
begin
    resetn <= '1';
    wait for clk_period_time * 20;
    resetn <= '0';
    wait for clk_period_time * 5;
    wait until clk_internal = '1';
    resetn <= '1';
    wait;
end process rst_gen;

end Behavioral;
