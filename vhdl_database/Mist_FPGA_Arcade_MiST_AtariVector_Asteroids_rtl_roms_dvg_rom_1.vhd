library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity dvg_rom_1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of dvg_rom_1 is
	type rom is array(0 to  255) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"01",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"00",X"0F",X"0C",X"0A",X"0E",
		X"00",X"01",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"00",X"0F",X"0C",X"0A",X"0E",
		X"00",X"01",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"0D",X"0F",X"0C",X"0B",X"0E",
		X"00",X"01",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"0B",X"0D",X"01",X"00",X"08",X"0C",X"0A",X"0E",
		X"00",X"01",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"00",X"08",X"0C",X"0A",X"0E",
		X"00",X"01",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"00",X"09",X"0C",X"0A",X"0E",
		X"00",X"01",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"00",X"09",X"0C",X"0A",X"0E",
		X"00",X"01",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"00",X"0A",X"0C",X"0A",X"0E",
		X"09",X"02",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"00",X"0F",X"0C",X"0A",X"0E",
		X"09",X"02",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"00",X"0F",X"0C",X"0A",X"0E",
		X"09",X"02",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"0D",X"0F",X"0C",X"0B",X"0E",
		X"09",X"02",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"0B",X"0D",X"01",X"00",X"08",X"0C",X"0A",X"0E",
		X"09",X"02",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"00",X"08",X"0C",X"0A",X"0E",
		X"09",X"02",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"00",X"09",X"0C",X"0A",X"0E",
		X"09",X"02",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"00",X"09",X"0C",X"0A",X"0E",
		X"09",X"02",X"0D",X"0D",X"05",X"06",X"07",X"0D",X"09",X"0D",X"01",X"00",X"0A",X"0C",X"0A",X"0E");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
