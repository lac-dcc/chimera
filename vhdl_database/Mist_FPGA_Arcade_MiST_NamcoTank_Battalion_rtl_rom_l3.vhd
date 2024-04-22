library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity l3 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(3 downto 0)
);
end entity;

architecture prom of l3 is
	type rom is array(0 to  255) of std_logic_vector(3 downto 0);
	signal rom_data: rom := (
		X"0",X"2",X"E",X"2",X"0",X"2",X"E",X"2",X"0",X"2",X"E",X"2",X"0",X"3",X"E",X"3",
		X"0",X"5",X"0",X"5",X"0",X"3",X"E",X"3",X"0",X"7",X"E",X"7",X"0",X"F",X"E",X"F",
		X"0",X"3",X"E",X"3",X"0",X"3",X"E",X"3",X"0",X"3",X"E",X"3",X"0",X"3",X"E",X"3",
		X"0",X"F",X"E",X"F",X"0",X"F",X"E",X"F",X"0",X"F",X"E",X"F",X"0",X"F",X"E",X"F",
		X"0",X"7",X"E",X"7",X"0",X"7",X"E",X"7",X"0",X"7",X"E",X"7",X"0",X"7",X"E",X"7",
		X"0",X"C",X"E",X"C",X"0",X"C",X"E",X"C",X"0",X"C",X"E",X"C",X"0",X"C",X"E",X"C",
		X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",
		X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",
		X"0",X"7",X"E",X"7",X"0",X"7",X"E",X"7",X"0",X"7",X"E",X"7",X"0",X"A",X"E",X"A",
		X"0",X"B",X"E",X"B",X"0",X"B",X"E",X"B",X"0",X"7",X"E",X"7",X"0",X"A",X"E",X"A",
		X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"3",X"E",X"3",
		X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",
		X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"C",X"E",X"C",
		X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"3",X"E",X"3",
		X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",
		X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"E",X"E",X"E",X"0",X"C",X"E",X"C");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
