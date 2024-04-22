library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Blink_LED is
	Port (
	PB : in STD_LOGIC;
	CLK_IN: in STD_LOGIC;
	LED1 : out STD_LOGIC;
	LED2 : out STD_LOGIC;
	LED3 : out STD_LOGIC;
	LED4 : out STD_LOGIC;
	ExtLED : out STD_LOGIC);
end Blink_LED;

architecture Behavioral of Blink_LED is

	signal counterOut	: std_logic_vector(27 downto 0);

begin

myCounter : entity work.counter
port map(
	clock => CLK_IN,
	clear => '0',
	count => '1',
	Q => counterOut
	);
	ExtLED <= counterOut(22);
	LED4 <= counterOut(26);
	LED3 <= counterOut(25);
	LED2 <= counterOut(24);
	LED1 <= counterOut(23);
	
end behavioral;
