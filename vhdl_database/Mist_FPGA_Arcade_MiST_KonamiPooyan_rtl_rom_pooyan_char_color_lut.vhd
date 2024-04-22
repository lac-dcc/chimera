library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity pooyan_char_color_lut is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of pooyan_char_color_lut is
	type rom is array(0 to  255) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"03",X"01",X"02",X"03",X"04",X"05",X"06",X"07",X"08",X"09",X"0A",X"0B",X"0C",X"0D",X"0E",X"0F",
		X"03",X"01",X"03",X"03",X"04",X"04",X"07",X"08",X"09",X"0F",X"0B",X"0C",X"0D",X"0E",X"0F",X"03",
		X"03",X"01",X"02",X"03",X"04",X"05",X"06",X"07",X"08",X"09",X"0A",X"0B",X"0C",X"0D",X"0E",X"0F",
		X"03",X"04",X"05",X"06",X"0F",X"08",X"09",X"0A",X"0B",X"0C",X"0D",X"0E",X"0F",X"01",X"02",X"03",
		X"03",X"05",X"06",X"07",X"0F",X"09",X"07",X"08",X"06",X"0D",X"0E",X"0F",X"01",X"02",X"03",X"04",
		X"03",X"02",X"07",X"08",X"04",X"0A",X"08",X"06",X"07",X"0E",X"0F",X"01",X"02",X"03",X"04",X"05",
		X"03",X"07",X"08",X"09",X"0A",X"0B",X"07",X"06",X"08",X"0F",X"01",X"02",X"03",X"04",X"05",X"06",
		X"03",X"08",X"09",X"0A",X"05",X"0C",X"06",X"08",X"07",X"01",X"02",X"03",X"04",X"05",X"06",X"07",
		X"03",X"09",X"0A",X"0B",X"0C",X"0D",X"08",X"06",X"06",X"02",X"03",X"04",X"05",X"06",X"07",X"08",
		X"03",X"03",X"0B",X"0C",X"04",X"0E",X"07",X"07",X"08",X"03",X"04",X"05",X"06",X"07",X"08",X"09",
		X"03",X"0B",X"0C",X"0D",X"0E",X"0F",X"07",X"06",X"08",X"04",X"05",X"06",X"07",X"08",X"09",X"0A",
		X"03",X"0C",X"0D",X"0E",X"0F",X"01",X"08",X"07",X"06",X"05",X"06",X"07",X"08",X"09",X"0A",X"0B",
		X"03",X"0D",X"0E",X"0F",X"01",X"02",X"03",X"04",X"05",X"06",X"07",X"08",X"09",X"0A",X"0B",X"0C",
		X"03",X"0E",X"0F",X"01",X"02",X"03",X"04",X"05",X"06",X"07",X"08",X"09",X"0A",X"0B",X"0C",X"0D",
		X"03",X"0F",X"01",X"02",X"04",X"04",X"05",X"06",X"07",X"08",X"09",X"0A",X"0B",X"0C",X"0D",X"0E",
		X"03",X"01",X"02",X"03",X"04",X"05",X"06",X"07",X"08",X"09",X"0A",X"0B",X"0C",X"0D",X"0E",X"0F");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
