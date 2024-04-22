library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity leds_wb8 is
	Port(
		-- naming according to Wishbone B4 spec
		ADR_I: in std_logic_vector(31 downto 0);
		CLK_I: in std_logic;
		DAT_I: in std_logic_vector(7 downto 0);
		STB_I: in std_logic;
		WE_I: in std_logic;
		ACK_O: out std_logic;
		DAT_O: out std_logic_vector(7 downto 0);
		-- control signal for onboard LEDs
		O_leds: out std_logic_vector(7 downto 0)
	);
end leds_wb8;


architecture Behavioral of leds_wb8 is
	signal led_value: std_logic_vector(7 downto 0) := X"00";
begin

	O_leds <= led_value;

	process(CLK_I)
	begin
		if rising_edge(CLK_I) then
		
			if STB_I = '1' then
				if WE_I = '1' and ADR_I(3 downto 0) = X"0" then
					led_value <= DAT_I;
				else
					DAT_O <= led_value;
				end if;
				ACK_O <= '1';
			else
				ACK_O <= '0';
			end if;
			
		end if;
	end process;
end Behavioral;