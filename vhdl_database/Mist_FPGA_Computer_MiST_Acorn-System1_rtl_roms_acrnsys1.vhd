library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity acrnsys1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(8 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of acrnsys1 is
	type rom is array(0 to  511) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"A0",X"06",X"B5",X"00",X"20",X"6F",X"FE",X"CA",X"88",X"88",X"10",X"F6",X"86",X"1A",X"A2",X"07",
		X"8E",X"22",X"0E",X"A0",X"00",X"B5",X"10",X"8D",X"21",X"0E",X"8E",X"20",X"0E",X"AD",X"20",X"0E",
		X"29",X"3F",X"24",X"0F",X"10",X"18",X"C9",X"38",X"B0",X"06",X"86",X"19",X"A9",X"40",X"85",X"0F",
		X"A1",X"00",X"88",X"D0",X"FB",X"CA",X"10",X"DB",X"A5",X"0E",X"30",X"D2",X"10",X"14",X"E4",X"19",
		X"D0",X"EE",X"C9",X"38",X"90",X"04",X"A9",X"80",X"D0",X"E4",X"C5",X"0F",X"F0",X"E2",X"85",X"0F",
		X"49",X"38",X"29",X"1F",X"C9",X"10",X"85",X"0D",X"A6",X"1A",X"8C",X"21",X"0E",X"60",X"A1",X"00",
		X"A0",X"06",X"D0",X"0B",X"A0",X"03",X"B5",X"00",X"20",X"6F",X"FE",X"88",X"88",X"B5",X"01",X"C8",
		X"48",X"20",X"7A",X"FE",X"88",X"68",X"4A",X"4A",X"4A",X"4A",X"84",X"1A",X"29",X"0F",X"A8",X"B9",
		X"EA",X"FF",X"A4",X"1A",X"99",X"10",X"00",X"60",X"20",X"64",X"FE",X"20",X"0C",X"FE",X"B0",X"20",
		X"A0",X"04",X"0A",X"0A",X"0A",X"0A",X"0A",X"36",X"00",X"36",X"01",X"88",X"D0",X"F8",X"F0",X"E8",
		X"F6",X"06",X"D0",X"02",X"F6",X"07",X"B5",X"06",X"D5",X"08",X"D0",X"04",X"B5",X"07",X"D5",X"09",
		X"60",X"A0",X"40",X"8C",X"22",X"0E",X"A0",X"07",X"8C",X"20",X"0E",X"6A",X"6A",X"20",X"CD",X"FE",
		X"6A",X"8D",X"20",X"0E",X"88",X"10",X"F6",X"20",X"CD",X"FE",X"8C",X"20",X"0E",X"20",X"D0",X"FE",
		X"84",X"1A",X"A0",X"48",X"88",X"D0",X"FD",X"88",X"D0",X"FD",X"A4",X"1A",X"60",X"A0",X"08",X"2C",
		X"20",X"0E",X"30",X"FB",X"20",X"D0",X"FE",X"20",X"CD",X"FE",X"0E",X"20",X"0E",X"6A",X"88",X"D0",
		X"F6",X"F0",X"DA",X"A2",X"FF",X"9A",X"8E",X"23",X"0E",X"86",X"0E",X"A0",X"80",X"A2",X"09",X"94",
		X"0E",X"CA",X"D0",X"FB",X"20",X"0C",X"FE",X"90",X"F2",X"29",X"07",X"C9",X"04",X"90",X"25",X"F0",
		X"6F",X"C9",X"06",X"F0",X"09",X"B0",X"0F",X"A5",X"0A",X"A6",X"0B",X"A4",X"0C",X"40",X"F6",X"00",
		X"D0",X"0C",X"F6",X"01",X"B0",X"08",X"B5",X"00",X"D0",X"02",X"D6",X"01",X"D6",X"00",X"20",X"64",
		X"FE",X"4C",X"45",X"FF",X"84",X"16",X"84",X"17",X"0A",X"AA",X"49",X"F7",X"85",X"10",X"20",X"88",
		X"FE",X"E0",X"02",X"B0",X"15",X"20",X"5E",X"FE",X"20",X"0C",X"FE",X"B0",X"BC",X"A1",X"00",X"0A",
		X"0A",X"0A",X"0A",X"05",X"0D",X"81",X"00",X"4C",X"45",X"FF",X"D0",X"03",X"6C",X"02",X"00",X"E0",
		X"04",X"F0",X"36",X"A2",X"08",X"86",X"10",X"20",X"88",X"FE",X"A2",X"04",X"B5",X"05",X"20",X"B1",
		X"FE",X"CA",X"D0",X"F8",X"A1",X"06",X"20",X"B1",X"FE",X"20",X"A0",X"FE",X"D0",X"F6",X"F0",X"2A",
		X"A2",X"04",X"20",X"DD",X"FE",X"95",X"05",X"CA",X"D0",X"F8",X"20",X"DD",X"FE",X"81",X"06",X"8D",
		X"21",X"0E",X"20",X"A0",X"FE",X"D0",X"F3",X"F0",X"11",X"A1",X"00",X"F0",X"06",X"85",X"18",X"A9",
		X"00",X"F0",X"02",X"A5",X"18",X"81",X"00",X"20",X"5E",X"FE",X"4C",X"04",X"FF",X"6C",X"1C",X"00",
		X"6C",X"1E",X"00",X"85",X"0A",X"86",X"0B",X"84",X"0C",X"68",X"48",X"85",X"0D",X"A2",X"0D",X"A9",
		X"FF",X"85",X"0E",X"20",X"00",X"FE",X"BA",X"86",X"13",X"C8",X"84",X"12",X"D8",X"BD",X"02",X"01",
		X"38",X"E5",X"1B",X"9D",X"02",X"01",X"85",X"11",X"BD",X"03",X"01",X"E9",X"00",X"9D",X"03",X"01",
		X"85",X"10",X"A2",X"13",X"20",X"00",X"FE",X"4C",X"07",X"FF",X"3F",X"06",X"5B",X"4F",X"66",X"6D",
		X"7D",X"07",X"7F",X"6F",X"77",X"7C",X"58",X"5E",X"79",X"71",X"AD",X"FF",X"F3",X"FE",X"B0",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
