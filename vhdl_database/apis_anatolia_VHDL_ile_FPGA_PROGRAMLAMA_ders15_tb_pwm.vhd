library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_pwm is
generic (
c_clkfreq	: integer := 100_000_000;
c_pwmfreq	: integer := 1000
);
end tb_pwm;

architecture Behavioral of tb_pwm is

component pwm is
generic (
c_clkfreq	: integer := 100_000_000;
c_pwmfreq	: integer := 1000
);
port (
clk				: in std_logic;
duty_cycle_i	: in std_logic_vector (6 downto 0);
pwm_o			: out std_logic
);
end component;

signal clk			: std_logic := '0';
signal duty_cycle_i	: std_logic_vector (6 downto 0) := (others => '0');
signal pwm_o		: std_logic;

constant c_clkperiod	: time := 10 ns;

begin

DUT : pwm
generic map(
c_clkfreq	=> c_clkfreq,
c_pwmfreq	=> c_pwmfreq
)
port map(
clk				=> clk			 ,
duty_cycle_i	=> duty_cycle_i  ,
pwm_o			=> pwm_o		
);

P_CLKGEN : process begin
clk	<= '0';
wait for c_clkperiod/2;
clk	<= '1';
wait for c_clkperiod/2;
end process;

P_STIMULI : process begin

duty_cycle_i	<= CONV_STD_LOGIC_VECTOR(0,7);

wait for 5 ms;
duty_cycle_i	<= CONV_STD_LOGIC_VECTOR(10,7);

wait for 5 ms;
duty_cycle_i	<= CONV_STD_LOGIC_VECTOR(20,7);

wait for 5 ms;
duty_cycle_i	<= CONV_STD_LOGIC_VECTOR(30,7);

wait for 5 ms;
duty_cycle_i	<= CONV_STD_LOGIC_VECTOR(40,7);

wait for 5 ms;
duty_cycle_i	<= CONV_STD_LOGIC_VECTOR(50,7);

wait for 5 ms;
duty_cycle_i	<= CONV_STD_LOGIC_VECTOR(90,7);

wait for 5 ms;

assert false
report "SIM DONE"
severity failure;

end process;

end Behavioral;