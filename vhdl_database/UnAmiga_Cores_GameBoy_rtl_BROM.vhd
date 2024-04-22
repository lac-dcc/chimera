library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity BROM is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of BROM is
	type ROM_ARRAY is array(0 to 255) of std_logic_vector(7 downto 0);
  signal ROM : ROM_ARRAY := (
    x"31",x"FE",x"FF",x"AF",x"21",x"FF",x"9F",x"32", -- 0x0000
    x"CB",x"7C",x"20",x"FB",x"21",x"26",x"FF",x"0E", -- 0x0008
    x"11",x"3E",x"80",x"32",x"E2",x"0C",x"3E",x"F3", -- 0x0010
    x"E2",x"32",x"3E",x"77",x"77",x"3E",x"FC",x"E0", -- 0x0018
    x"47",x"F0",x"50",x"FE",x"42",x"28",x"75",x"11", -- 0x0020
    x"04",x"01",x"21",x"10",x"80",x"1A",x"4F",x"CD", -- 0x0028
    x"A0",x"00",x"CD",x"A0",x"00",x"13",x"7B",x"FE", -- 0x0030
    x"34",x"20",x"F2",x"11",x"B2",x"00",x"06",x"08", -- 0x0038
    x"1A",x"22",x"22",x"13",x"05",x"20",x"F9",x"3E", -- 0x0040
    x"19",x"EA",x"10",x"99",x"21",x"2F",x"99",x"0E", -- 0x0048
    x"0C",x"3D",x"28",x"08",x"32",x"0D",x"20",x"F9", -- 0x0050
    x"2E",x"0F",x"18",x"F3",x"67",x"3E",x"64",x"57", -- 0x0058
    x"E0",x"42",x"3E",x"91",x"E0",x"40",x"04",x"1E", -- 0x0060
    x"02",x"0E",x"0C",x"F0",x"44",x"FE",x"90",x"20", -- 0x0068
    x"FA",x"0D",x"20",x"F7",x"1D",x"20",x"F2",x"0E", -- 0x0070
    x"13",x"24",x"7C",x"1E",x"83",x"FE",x"62",x"28", -- 0x0078
    x"06",x"1E",x"C1",x"FE",x"64",x"20",x"06",x"7B", -- 0x0080
    x"E2",x"0C",x"3E",x"87",x"E2",x"F0",x"42",x"90", -- 0x0088
    x"E0",x"42",x"15",x"20",x"D2",x"05",x"20",x"64", -- 0x0090
    x"16",x"20",x"18",x"CB",x"E0",x"40",x"18",x"5C", -- 0x0098
    x"06",x"04",x"C5",x"CB",x"11",x"17",x"C1",x"CB", -- 0x00A0
    x"11",x"17",x"05",x"20",x"F5",x"22",x"22",x"22", -- 0x00A8
    x"22",x"C9",x"3C",x"42",x"A5",x"81",x"A5",x"99", -- 0x00B0
    x"42",x"3C",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00B8
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00C0
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00C8
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00D0
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00D8
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00E0
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00E8
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00F0
    x"FF",x"FF",x"FF",x"FF",x"3E",x"01",x"E0",x"50"  -- 0x00F8
  );

begin
process(clk)
begin
	if rising_edge(clk) then
		data <= ROM (to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
