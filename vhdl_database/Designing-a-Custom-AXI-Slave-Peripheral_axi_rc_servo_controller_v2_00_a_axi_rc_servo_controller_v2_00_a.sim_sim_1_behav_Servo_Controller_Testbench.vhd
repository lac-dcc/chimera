LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY servo_controller_Testbench IS
END servo_controller_Testbench;
 

ARCHITECTURE behavior OF servo_controller_Testbench IS 

 
-- Component Declaration for the Unit Under Test (UUT)
COMPONENT servo_controller is
	Generic
		(
		clock_period_ns : integer := 1024
		);
	Port
		(
		minimum_high_pulse_width_ns : in std_logic_vector(31 downto 0);
        maximum_high_pulse_width_ns : in std_logic_vector(31 downto 0);
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		servo_position_input : in std_logic_vector(7 downto 0);
		servo_control_out : out std_logic
		);
END COMPONENT;


-- Servo clock frequency declaration
constant clk_period_ns : integer := 120;
constant clk_period : time := clk_period_ns * 1 nS;

-- Testbench control signals
signal sim_end : boolean := false;
signal cycle_count : integer := 0;


signal clk : std_logic;
signal reset : std_logic;
signal servo_position_input : std_logic_vector(7 downto 0);
signal servo_control_out : std_logic;
signal minimum_high_pulse_width_ns : std_logic_vector(31 downto 0);
signal maximum_high_pulse_width_ns : std_logic_vector(31 downto 0);



BEGIN

servo_clk_gen : process
begin
   while (not sim_end) loop
	  clk <= '0';
	  wait for (clk_period / 2);
	  clk <= '1';
	  wait for (clk_period / 2);
   end loop;
   wait;
end process servo_clk_gen;


stimulus : process
begin
	minimum_high_pulse_width_ns <= std_logic_vector(to_unsigned(1000000, 32));
    maximum_high_pulse_width_ns <= std_logic_vector(to_unsigned(2000000, 32));

	servo_position_input <= X"00";
	reset <= '0';
	wait for 10 us;
	reset <= '1';
	wait for clk_period * 10;
	reset <= '0';

	servo_position_input <= X"00";
	wait for 100 ms;
	servo_position_input <= X"80";
	wait for 100 ms;
	servo_position_input <= X"FF";
	wait for 100 ms;
	
	-- Adjust the min and max pulse widths
	minimum_high_pulse_width_ns <= X"000CFFFF";
    maximum_high_pulse_width_ns <= std_logic_vector(to_unsigned(2500000, 32));
	wait for 100 ms;

	-- Adjust the min and max pulse widths
	minimum_high_pulse_width_ns <= std_logic_vector(to_unsigned(2000000, 32));
    maximum_high_pulse_width_ns <= std_logic_vector(to_unsigned(3000000, 32));
	wait for 100 ms;


	for i in 0 to 255 loop
		wait for 100 ms;
		servo_position_input <= std_logic_vector(to_signed(i, servo_position_input'length));
	end loop;
	
	-- End of Stimuli.
	wait for 200 ms;

	sim_end <= true;
	wait;
end process stimulus;
 


-- Instantiate the Unit Under Test (UUT)
UUT : servo_controller
	GENERIC MAP
		(
		clock_period_ns => clk_period_ns
		)
	PORT MAP
		(
		minimum_high_pulse_width_ns => minimum_high_pulse_width_ns,
        maximum_high_pulse_width_ns => maximum_high_pulse_width_ns,
		clk => clk,
		rst => reset,
		servo_position_input => servo_position_input,
		servo_control_out => servo_control_out
		);


END;
