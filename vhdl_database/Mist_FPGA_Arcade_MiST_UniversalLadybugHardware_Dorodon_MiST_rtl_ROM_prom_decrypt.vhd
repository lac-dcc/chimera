-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity prom_decrypt is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(7 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of prom_decrypt is


  type ROM_ARRAY is array(0 to 255) of std_logic_vector(7 downto 0);
  constant ROM : ROM_ARRAY := (
    x"00",x"F1",x"3F",x"86",x"4F",x"66",x"07",x"73", -- 0x0000
    x"71",x"64",x"A7",x"59",x"2B",x"56",x"FB",x"8B", -- 0x0008
    x"8F",x"B6",x"9E",x"9D",x"04",x"11",x"BC",x"80", -- 0x0010
    x"12",x"CB",x"18",x"5D",x"D2",x"7A",x"85",x"75", -- 0x0018
    x"B5",x"BE",x"7E",x"05",x"6E",x"3E",x"D5",x"4B", -- 0x0020
    x"2E",x"52",x"15",x"84",x"38",x"6A",x"6C",x"53", -- 0x0028
    x"FA",x"C8",x"08",x"B8",x"D4",x"E9",x"5C",x"22", -- 0x0030
    x"1D",x"49",x"BD",x"AD",x"46",x"1F",x"E1",x"0A", -- 0x0038
    x"19",x"5B",x"41",x"45",x"4A",x"2A",x"B4",x"4D", -- 0x0040
    x"57",x"90",x"8E",x"3A",x"BB",x"9B",x"E4",x"29", -- 0x0048
    x"8A",x"EB",x"AA",x"F0",x"CE",x"EE",x"88",x"5F", -- 0x0050
    x"33",x"31",x"C6",x"60",x"3C",x"9A",x"3D",x"B7", -- 0x0058
    x"63",x"6D",x"AB",x"62",x"E3",x"78",x"E5",x"B9", -- 0x0060
    x"EF",x"5E",x"7B",x"83",x"94",x"E6",x"D6",x"A1", -- 0x0068
    x"D9",x"36",x"47",x"3B",x"C4",x"DF",x"21",x"0C", -- 0x0070
    x"14",x"E7",x"C3",x"1A",x"1C",x"28",x"4C",x"9C", -- 0x0078
    x"50",x"40",x"91",x"55",x"D8",x"A4",x"76",x"9F", -- 0x0080
    x"98",x"10",x"6B",x"2F",x"A3",x"43",x"39",x"B1", -- 0x0088
    x"42",x"72",x"7D",x"65",x"03",x"8D",x"F2",x"F5", -- 0x0090
    x"69",x"27",x"0D",x"CA",x"CF",x"1B",x"35",x"EC", -- 0x0098
    x"A2",x"F7",x"93",x"70",x"CD",x"68",x"97",x"2D", -- 0x00A0
    x"37",x"F9",x"AE",x"26",x"96",x"E8",x"48",x"99", -- 0x00A8
    x"95",x"D7",x"B0",x"06",x"DC",x"C9",x"ED",x"87", -- 0x00B0
    x"7F",x"B3",x"17",x"A0",x"0F",x"25",x"DB",x"DE", -- 0x00B8
    x"23",x"74",x"79",x"89",x"B2",x"FC",x"24",x"13", -- 0x00C0
    x"81",x"8C",x"D3",x"C5",x"BF",x"A6",x"16",x"44", -- 0x00C8
    x"0B",x"34",x"F8",x"D1",x"0E",x"E0",x"09",x"EA", -- 0x00D0
    x"02",x"DD",x"92",x"F4",x"C1",x"BA",x"32",x"D0", -- 0x00D8
    x"7C",x"2C",x"FD",x"F3",x"61",x"A5",x"CC",x"DA", -- 0x00E0
    x"5A",x"67",x"30",x"6F",x"82",x"20",x"AF",x"54", -- 0x00E8
    x"AC",x"E2",x"1E",x"C2",x"FE",x"A9",x"58",x"01", -- 0x00F0
    x"77",x"C0",x"4E",x"C7",x"A8",x"51",x"F6",x"FF"  -- 0x00F8
  );

begin

  p_rom : process
  begin
    wait until rising_edge(CLK);
     DATA <= ROM(to_integer(unsigned(ADDR)));
  end process;
end RTL;


