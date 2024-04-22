
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity servo_controller is
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
end servo_controller;


architecture Behavioral of servo_controller is

constant servo_PWM_period_ns : integer := 25000000;  -- Between 30-60 pulses per second recommended. (i.e. 16mS --> 33mS period time)
constant servo_PWM_clock_periods : integer := servo_PWM_period_ns / clock_period_ns;  -- Number of clock periods in PWM period


signal PWM_resolution_per_step_ns : integer;
signal PWM_resolution_per_step_clock_periods : integer;
signal minimum_low_pulse_width_ns : integer;
signal minimum_high_pulse_width_clock_periods : integer;
signal maximum_high_pulse_width_clock_periods : integer;
signal variable_low_pulse_width_ns : integer;
signal variable_high_pulse_width_ns :  integer;
signal high_pulse_width_ns :  integer;
signal low_pulse_width_ns : integer;
signal high_pulse_width_clock_periods : integer;
signal low_pulse_width_clock_periods :  integer;
signal control_counter : integer range 0 to servo_PWM_clock_periods;
signal reset_control_counter : std_logic;


type main_fsm_type is (reset, low_period, high_period);
signal current_state, next_state : main_fsm_type;



begin

minimum_low_pulse_width_ns <= servo_PWM_period_ns - to_integer(unsigned(maximum_high_pulse_width_ns));
minimum_high_pulse_width_clock_periods <= to_integer(unsigned(minimum_high_pulse_width_ns)) / clock_period_ns;
maximum_high_pulse_width_clock_periods <= to_integer(unsigned(maximum_high_pulse_width_ns)) / clock_period_ns;
PWM_resolution_per_step_ns <= ((to_integer(unsigned(maximum_high_pulse_width_ns)) - to_integer(unsigned(minimum_high_pulse_width_ns))) / 2**(servo_position_input'LENGTH));
PWM_resolution_per_step_clock_periods <= PWM_resolution_per_step_ns / clock_period_ns;
variable_high_pulse_width_ns <= (to_integer(unsigned(servo_position_input))) * PWM_resolution_per_step_ns;
variable_low_pulse_width_ns <= to_integer(unsigned(maximum_high_pulse_width_ns)) - (to_integer(unsigned(minimum_high_pulse_width_ns)) + variable_high_pulse_width_ns);
high_pulse_width_ns <= to_integer(unsigned(minimum_high_pulse_width_ns)) + variable_high_pulse_width_ns;
low_pulse_width_ns <= minimum_low_pulse_width_ns + variable_low_pulse_width_ns;
high_pulse_width_clock_periods <= high_pulse_width_ns / clock_period_ns;
low_pulse_width_clock_periods <= low_pulse_width_ns / clock_period_ns;


state_machine_update : process (clk, rst)
begin
	if clk'event and clk = '1' then
		if rst = '1' then
			current_state <= reset;
		else
			current_state <= next_state;
		end if;
	end if;
end process;


state_machine_decisions : process (current_state, control_counter, high_pulse_width_clock_periods, low_pulse_width_clock_periods)
begin
	servo_control_out <= '0';
	reset_control_counter <= '0';
	case current_state is
		when reset =>
			reset_control_counter <= '1';
			next_state <= high_period;

		when low_period =>
			if (control_counter >= low_pulse_width_clock_periods) then
				reset_control_counter <= '1';
				next_state <= high_period;
			else
				next_state <= low_period;
			end if;

		when high_period =>
			servo_control_out <= '1';
			if (control_counter >= high_pulse_width_clock_periods) then
				reset_control_counter <= '1';
				next_state <= low_period;
			else
				next_state <= high_period;
			end if;
		
		when others  =>
			next_state <= reset;
	end case;
end process;



control_counter_process : process (clk, rst)
begin
	if clk'event and clk = '1' then
		if reset_control_counter = '1' then
			control_counter <= 0;
		else
			control_counter <= control_counter + 1;
		end if;
	end if;
end process;



end Behavioral;

