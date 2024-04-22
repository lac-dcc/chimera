library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity decoder_4 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(8 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of decoder_4 is
	type rom is array(0 to  511) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"81",X"02",X"42",X"82",X"03",X"43",X"83",X"04",X"44",X"84",X"05",X"45",X"85",X"06",X"46",X"86",
		X"07",X"47",X"87",X"08",X"48",X"88",X"09",X"49",X"89",X"0A",X"4A",X"8A",X"0B",X"4B",X"8B",X"0C",
		X"4C",X"8C",X"0D",X"4D",X"8D",X"0E",X"4E",X"8E",X"0F",X"4F",X"8F",X"10",X"50",X"90",X"11",X"51",
		X"91",X"12",X"52",X"92",X"13",X"53",X"93",X"14",X"54",X"94",X"15",X"55",X"95",X"16",X"56",X"96",
		X"17",X"57",X"97",X"18",X"58",X"98",X"19",X"59",X"99",X"1A",X"5A",X"9A",X"1B",X"5B",X"9B",X"1C",
		X"5C",X"9C",X"1D",X"5D",X"9D",X"1E",X"5E",X"9E",X"1F",X"5F",X"9F",X"20",X"60",X"A0",X"21",X"61",
		X"A1",X"22",X"62",X"A2",X"23",X"63",X"A3",X"24",X"64",X"A4",X"25",X"65",X"A5",X"26",X"66",X"A6",
		X"27",X"67",X"A7",X"28",X"68",X"A8",X"29",X"69",X"A9",X"2A",X"6A",X"AA",X"2B",X"6B",X"AB",X"2C",
		X"6C",X"AC",X"2D",X"6D",X"AD",X"2E",X"6E",X"AE",X"2F",X"6F",X"AF",X"30",X"70",X"B0",X"31",X"71",
		X"B1",X"32",X"72",X"B2",X"33",X"73",X"B3",X"34",X"74",X"B4",X"35",X"75",X"B5",X"36",X"76",X"B6",
		X"37",X"77",X"B7",X"38",X"78",X"B8",X"39",X"79",X"B9",X"3A",X"7A",X"BA",X"3B",X"7B",X"BB",X"3C",
		X"7C",X"BC",X"3D",X"7D",X"BD",X"3E",X"7E",X"BE",X"3F",X"7F",X"BF",X"00",X"40",X"80",X"01",X"41",
		X"C3",X"CF",X"D0",X"D9",X"D2",X"C9",X"C7",X"C8",X"D4",X"80",X"A8",X"C3",X"A9",X"80",X"B1",X"B9",
		X"B8",X"B1",X"80",X"D7",X"C9",X"CC",X"CC",X"C9",X"C1",X"CD",X"D3",X"80",X"C5",X"CC",X"C5",X"C3",
		X"D4",X"D2",X"CF",X"CE",X"C9",X"C3",X"D3",X"80",X"C9",X"CE",X"C3",X"AE",X"80",X"C1",X"CC",X"CC",
		X"80",X"D2",X"C9",X"C7",X"C8",X"D4",X"D3",X"80",X"D2",X"C5",X"D3",X"C5",X"D2",X"D6",X"C5",X"C4",
		X"34",X"B3",X"73",X"33",X"B2",X"72",X"32",X"B1",X"71",X"31",X"B0",X"70",X"30",X"AF",X"6F",X"2F",
		X"AE",X"6E",X"2E",X"AD",X"6D",X"2D",X"AC",X"6C",X"2C",X"AB",X"6B",X"2B",X"AA",X"6A",X"2A",X"A9",
		X"69",X"29",X"A8",X"68",X"28",X"A7",X"67",X"27",X"A6",X"66",X"26",X"A5",X"65",X"25",X"A4",X"64",
		X"24",X"A3",X"63",X"23",X"A2",X"62",X"22",X"A1",X"61",X"21",X"A0",X"60",X"20",X"9F",X"5F",X"1F",
		X"9E",X"5E",X"1E",X"9D",X"5D",X"1D",X"9C",X"5C",X"1C",X"9B",X"5B",X"1B",X"9A",X"5A",X"1A",X"99",
		X"59",X"19",X"98",X"58",X"18",X"97",X"57",X"17",X"96",X"56",X"16",X"95",X"55",X"15",X"94",X"54",
		X"14",X"93",X"53",X"13",X"92",X"52",X"12",X"91",X"51",X"11",X"90",X"50",X"10",X"8F",X"4F",X"0F",
		X"8E",X"4E",X"0E",X"8D",X"4D",X"0D",X"8C",X"4C",X"0C",X"8B",X"4B",X"0B",X"8A",X"4A",X"0A",X"89",
		X"49",X"09",X"88",X"48",X"08",X"87",X"47",X"07",X"86",X"46",X"06",X"85",X"45",X"05",X"84",X"44",
		X"04",X"83",X"43",X"03",X"82",X"42",X"02",X"81",X"74",X"B4",X"35",X"75",X"B5",X"36",X"76",X"B6",
		X"37",X"77",X"B7",X"38",X"78",X"B8",X"39",X"79",X"B9",X"3A",X"7A",X"BA",X"3B",X"7B",X"BB",X"3C",
		X"7C",X"BC",X"3D",X"7D",X"BD",X"3E",X"7E",X"BE",X"3F",X"7F",X"BF",X"00",X"40",X"80",X"01",X"41",
		X"C3",X"CF",X"D0",X"D9",X"D2",X"C9",X"C7",X"C8",X"D4",X"80",X"A8",X"C3",X"A9",X"80",X"B1",X"B9",
		X"B8",X"B1",X"80",X"D7",X"C9",X"CC",X"CC",X"C9",X"C1",X"CD",X"D3",X"80",X"C5",X"CC",X"C5",X"C3",
		X"D4",X"D2",X"CF",X"CE",X"C9",X"C3",X"D3",X"80",X"C9",X"CE",X"C3",X"AE",X"80",X"C1",X"CC",X"CC",
		X"80",X"D2",X"C9",X"C7",X"C8",X"D4",X"D3",X"80",X"D2",X"C5",X"D3",X"C5",X"D2",X"D6",X"C5",X"C4");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
