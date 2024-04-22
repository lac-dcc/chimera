LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY clock_divider_testbench IS
END clock_divider_testbench;
 

ARCHITECTURE behavior OF clock_divider_testbench IS   
	 
-- Component Declaration for the Clock Divider
COMPONENT clock_divider
    Generic
		(
		Slow_Clock_Period_PS : integer := 20000;
		ORIGINAL_CLK_PERIOD_PS : integer := 10000
		);
	port
		(
		clk : in std_logic;
		rst : in std_logic;
		slow_clk : out std_logic;
		slow_rst : out std_logic
		);
END COMPONENT;


constant bus_clk_period : time := 10 ns;  -- 100MHz
signal BUS_CLK_PERIOD_PS : integer := (bus_clk_period / 1 ps);

-- Define the speed of the clock desired from the clock divider
constant Slow_Clock_Period_PS : integer := 128000;  -- 128ns

-- Testbench control signals
signal sim_end : boolean := false;
signal cycle_count : integer := 0;


signal Bus2IP_Clk : std_logic;
signal reset : std_logic;
signal slow_clk : std_logic;
signal slow_rst : std_logic;



BEGIN

bus_clk_gen : process
begin
   while (not sim_end) loop
	  Bus2IP_Clk <= '0';
		 wait for bus_clk_period / 2;
	  Bus2IP_Clk <= '1';
		 wait for bus_clk_period / 2;
   end loop;
   wait;
end process bus_clk_gen;


stimulus : process
begin
	reset <= '0';
	wait for 10 us;
	reset <= '1';
	wait for bus_clk_period * 10;
	reset <= '0';


	-- End of Stimuli.
	wait for 100 us;

	sim_end <= true;
	wait;
end process stimulus;
 


-- Instantiate the Unit Under Test (UUT)

UUT : clock_divider
	GENERIC MAP
		(
		Slow_Clock_Period_PS => Slow_Clock_Period_PS,
		ORIGINAL_CLK_PERIOD_PS => BUS_CLK_PERIOD_PS
		)
	PORT MAP
		(
		clk => Bus2IP_Clk,
		rst => reset,
		slow_clk => slow_clk,
		slow_rst => slow_rst
		);


END;
