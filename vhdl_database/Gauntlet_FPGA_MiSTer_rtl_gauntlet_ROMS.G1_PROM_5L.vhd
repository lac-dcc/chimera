library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity PROM_5L is
port (
	CLK  : in  std_logic;
	ADDR : in  std_logic_vector(6 downto 0);
	DATA : out std_logic_vector(7 downto 0) := (others=>'0')
	);
end entity;

architecture RTL of PROM_5L is
	type ROM_ARRAY is array (0 to 127) of std_logic_vector(7 downto 0);
	signal ROM : ROM_ARRAY := (
		x"00",x"01",x"02",x"03",x"04",x"05",x"06",x"07",x"00",x"02",x"04",x"06",x"08",x"0A",x"0C",x"0E", -- 0x0000
		x"00",x"03",x"06",x"09",x"0C",x"0F",x"12",x"15",x"00",x"04",x"08",x"0C",x"10",x"14",x"18",x"1C", -- 0x0010
		x"00",x"05",x"0A",x"0F",x"14",x"19",x"1E",x"23",x"00",x"06",x"0C",x"12",x"18",x"1E",x"24",x"2A", -- 0x0020
		x"00",x"07",x"0E",x"15",x"1C",x"23",x"2A",x"31",x"00",x"08",x"10",x"18",x"20",x"28",x"30",x"38", -- 0x0030
		x"00",x"01",x"02",x"03",x"04",x"05",x"06",x"07",x"01",x"03",x"05",x"07",x"09",x"0B",x"0D",x"0F", -- 0x0040
		x"02",x"05",x"08",x"0B",x"0E",x"11",x"14",x"17",x"03",x"07",x"0B",x"0F",x"13",x"17",x"1B",x"1F", -- 0x0050
		x"04",x"09",x"0E",x"13",x"18",x"1D",x"22",x"27",x"05",x"0B",x"11",x"17",x"1D",x"23",x"29",x"2F", -- 0x0060
		x"06",x"0D",x"14",x"1B",x"22",x"29",x"30",x"37",x"07",x"0F",x"17",x"1F",x"27",x"2F",x"37",x"3F"  -- 0x0070
	);
	-- Ask Xilinx synthesis to use distributed logic RAMs if possible
	attribute ram_style : string;
	attribute ram_style of ROM : signal is "distributed";
	-- Ask Quartus synthesis to use distributed logic RAMs if possible
	attribute ramstyle : string;
	attribute ramstyle of ROM : signal is "logic";
begin
	mem_proc : process
	begin
		wait until rising_edge(CLK);
		DATA <= ROM(to_integer(unsigned(ADDR)));
	end process;
end RTL;
