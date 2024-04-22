library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity leds is
	Port(
		I_addr: in std_logic_vector(31 downto 0);
		I_clk: in std_logic;
		I_data: in std_logic_vector(31 downto 0);
		I_en: in std_logic;
		I_write: in std_logic;
		O_busy: out std_logic;
		O_data: out std_logic_vector(31 downto 0);
		O_leds: out std_logic_vector(7 downto 0)
	);
end leds;


architecture Behavioral of leds is
	signal led_value: std_logic_vector(7 downto 0) := X"00";
begin

	O_leds <= led_value;
	O_data <= led_value & X"000000";
	O_busy <= '0';

	process(I_clk)
	begin
		if rising_edge(I_clk) and I_en = '1' then
			if I_write = '1' then
				led_value <= I_data(31 downto 24);
			end if;
		end if;
	end process;
end Behavioral;