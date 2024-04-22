library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity clut_4p is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(8 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of clut_4p is
	type rom is array(0 to  511) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"FF",X"D7",X"6B",X"00",X"1F",X"93",X"FB",X"FF",X"FF",X"E3",X"00",X"4F",X"00",X"FF",X"7F",X"FE",
		X"FF",X"74",X"08",X"0F",X"00",X"FF",X"7F",X"FE",X"FF",X"1F",X"00",X"0F",X"00",X"FF",X"7F",X"FE",
		X"FF",X"00",X"03",X"1F",X"7F",X"13",X"92",X"FE",X"FF",X"00",X"E0",X"F4",X"FE",X"EC",X"92",X"5F",
		X"FF",X"00",X"08",X"1C",X"9E",X"5E",X"92",X"FE",X"FF",X"FC",X"E4",X"E3",X"F3",X"00",X"B2",X"DF",
		X"FF",X"00",X"FE",X"FF",X"1C",X"1F",X"03",X"6C",X"FF",X"00",X"FE",X"FF",X"E3",X"E0",X"00",X"6C",
		X"FF",X"FE",X"9B",X"0A",X"00",X"1F",X"13",X"FF",X"FF",X"E3",X"9B",X"0E",X"00",X"DF",X"BC",X"FF",
		X"FF",X"1F",X"C8",X"00",X"FC",X"F1",X"EA",X"E3",X"FF",X"17",X"7F",X"00",X"FF",X"0F",X"1F",X"97",
		X"FF",X"E8",X"FE",X"00",X"FF",X"6F",X"FC",X"7A",X"FF",X"07",X"B7",X"00",X"FF",X"BF",X"FC",X"7A",
		X"FF",X"FE",X"9B",X"0A",X"00",X"1F",X"13",X"7A",X"FF",X"E3",X"9B",X"0E",X"00",X"DF",X"BC",X"FF",
		X"FF",X"00",X"6E",X"92",X"DB",X"1F",X"9F",X"8E",X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"BF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FF",X"FF",
		X"FF",X"00",X"92",X"FE",X"DB",X"00",X"00",X"92",X"FF",X"FF",X"FF",X"FF",X"FF",X"EC",X"FF",X"FF",
		X"FF",X"00",X"FE",X"FF",X"00",X"8C",X"F9",X"FE",X"FF",X"00",X"FE",X"FF",X"F7",X"00",X"F9",X"FE",
		X"FF",X"A0",X"FE",X"FF",X"EF",X"F7",X"00",X"8C",X"FF",X"A0",X"FE",X"FF",X"83",X"EF",X"F7",X"00",
		X"FF",X"0F",X"5F",X"FF",X"00",X"83",X"EF",X"F7",X"FF",X"0F",X"5F",X"FF",X"FE",X"00",X"83",X"EF",
		X"FF",X"00",X"1E",X"FF",X"F9",X"FE",X"00",X"83",X"FF",X"00",X"1E",X"FF",X"8C",X"F9",X"FE",X"00",
		X"00",X"28",X"94",X"FF",X"E0",X"6C",X"04",X"00",X"00",X"1C",X"FF",X"B0",X"FF",X"00",X"80",X"01",
		X"00",X"8B",X"F7",X"F0",X"FF",X"00",X"80",X"01",X"00",X"E0",X"FF",X"F0",X"FF",X"00",X"80",X"01",
		X"00",X"FF",X"FC",X"E0",X"80",X"EC",X"6D",X"01",X"00",X"FF",X"1F",X"0B",X"01",X"13",X"6D",X"A0",
		X"00",X"FF",X"F7",X"E3",X"61",X"A1",X"6D",X"01",X"00",X"03",X"1B",X"1C",X"0C",X"FF",X"4D",X"20",
		X"00",X"FF",X"01",X"00",X"E3",X"E0",X"FC",X"93",X"00",X"FF",X"01",X"00",X"1C",X"1F",X"FF",X"93",
		X"00",X"01",X"64",X"F5",X"FF",X"E0",X"EC",X"00",X"00",X"1C",X"64",X"F1",X"FF",X"20",X"43",X"00",
		X"00",X"E0",X"37",X"FF",X"03",X"0E",X"15",X"1C",X"00",X"E8",X"80",X"FF",X"00",X"F0",X"E0",X"68",
		X"00",X"17",X"01",X"FF",X"00",X"90",X"03",X"85",X"00",X"F8",X"48",X"FF",X"00",X"40",X"03",X"85",
		X"00",X"01",X"64",X"F5",X"FF",X"E0",X"EC",X"85",X"00",X"1C",X"64",X"F1",X"FF",X"20",X"43",X"00",
		X"00",X"FF",X"91",X"6D",X"24",X"E0",X"60",X"71",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",
		X"00",X"FF",X"6D",X"01",X"24",X"FF",X"FF",X"6D",X"00",X"00",X"00",X"00",X"00",X"13",X"00",X"00",
		X"00",X"FF",X"01",X"00",X"FF",X"73",X"06",X"01",X"00",X"FF",X"01",X"00",X"08",X"FF",X"06",X"01",
		X"00",X"5F",X"01",X"00",X"10",X"08",X"FF",X"73",X"00",X"5F",X"01",X"00",X"7C",X"10",X"08",X"FF",
		X"00",X"F0",X"A0",X"00",X"FF",X"7C",X"10",X"08",X"00",X"F0",X"A0",X"00",X"01",X"FF",X"7C",X"10",
		X"00",X"FF",X"E1",X"00",X"06",X"01",X"FF",X"7C",X"00",X"FF",X"E1",X"00",X"73",X"06",X"01",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
