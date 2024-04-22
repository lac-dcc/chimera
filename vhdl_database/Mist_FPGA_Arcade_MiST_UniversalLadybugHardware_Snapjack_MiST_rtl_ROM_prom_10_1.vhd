library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity prom_10_1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of prom_10_1 is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"9D",X"11",X"B8",X"00",X"79",X"62",X"18",X"00",X"9E",X"25",X"DA",X"00",X"D7",X"A3",X"79",
		X"00",X"DE",X"29",X"74",X"00",X"D4",X"75",X"9D",X"00",X"AD",X"86",X"97",X"00",X"5A",X"4C",X"17");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
