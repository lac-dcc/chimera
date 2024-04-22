library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pwm is
generic (
c_clkfreq	: integer := 100_000_000;
c_pwmfreq	: integer := 1000
);
port (
clk				: in std_logic;
duty_cycle_i	: in std_logic_vector (6 downto 0);
pwm_o			: out std_logic
);
end pwm;

architecture Behavioral of pwm is

constant c_timerlim	: integer := c_clkfreq/c_pwmfreq;

signal hightime		: integer range 0 to c_timerlim := c_timerlim/2;
signal timer		: integer range 0 to c_timerlim := 0;

begin

-- asagidaki gibi yazinca * operatoru tanimiyorum diye hata verdi
-- o yuzden STD_LOGIC_ARITH package ekledim ve CONV_INTEGER fonksiyonunu kullandim

-- hightime	<= (c_timerlim/100)*duty_cycle_i;	-- hatali kod

hightime	<= (c_timerlim/100)*CONV_INTEGER(duty_cycle_i);

process (clk) begin
if (rising_edge(clk)) then

	if (timer = c_timerlim-1) then
		timer	<= 0;
	elsif (timer < hightime) then
		pwm_o	<= '1';
		timer	<= timer + 1;
	else
		pwm_o	<= '0';
		timer	<= timer + 1;		
	end if;

end if;
end process;


end Behavioral;