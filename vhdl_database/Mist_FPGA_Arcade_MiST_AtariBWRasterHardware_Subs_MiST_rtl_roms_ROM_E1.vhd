library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ROM_E1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(3 downto 0)
);
end entity;

architecture prom of ROM_E1 is
	type rom is array(0 to  255) of std_logic_vector(3 downto 0);
	signal rom_data: rom := (
		X"C",X"C",X"C",X"F",X"0",X"1",X"2",X"0",X"0",X"9",X"5",X"3",X"5",X"0",X"0",X"F",
		X"2",X"0",X"6",X"9",X"3",X"8",X"1",X"0",X"0",X"0",X"1",X"0",X"0",X"5",X"9",X"5",
		X"2",X"0",X"3",X"5",X"2",X"0",X"3",X"4",X"1",X"2",X"4",X"0",X"0",X"0",X"0",X"0",
		X"0",X"0",X"5",X"C",X"3",X"1",X"2",X"0",X"3",X"4",X"1",X"2",X"4",X"0",X"0",X"0",
		X"0",X"0",X"9",X"E",X"4",X"2",X"F",X"4",X"5",X"9",X"2",X"5",X"0",X"C",X"5",X"3",
		X"0",X"0",X"9",X"5",X"3",X"5",X"3",X"0",X"0",X"0",X"9",X"E",X"3",X"5",X"2",X"4",
		X"5",X"0",X"6",X"9",X"3",X"8",X"1",X"3",X"0",X"0",X"0",X"0",X"6",X"F",X"5",X"3",
		X"0",X"1",X"6",X"5",X"A",X"0",X"0",X"0",X"3",X"2",X"5",X"4",X"9",X"4",X"3",X"0",
		X"4",X"9",X"5",X"E",X"5",X"0",X"0",X"0",X"3",X"2",X"5",X"4",X"9",X"4",X"F",X"3",
		X"0",X"0",X"1",X"0",X"0",X"9",X"5",X"3",X"5",X"0",X"1",X"0",X"D",X"F",X"E",X"5",
		X"4",X"1",X"0",X"1",X"2",X"0",X"A",X"F",X"5",X"5",X"5",X"2",X"0",X"0",X"F",X"2",
		X"0",X"A",X"5",X"7",X"1",X"4",X"F",X"2",X"6",X"F",X"3",X"0",X"0",X"F",X"9",X"E",
		X"4",X"3",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"8",
		X"5",X"E",X"E",X"5",X"D",X"9",X"0",X"0",X"3",X"5",X"3",X"0",X"0",X"5",X"E",X"4",
		X"F",X"3",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"4",X"5",X"C",
		X"0",X"5",X"E",X"5",X"D",X"9",X"7",X"F",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
