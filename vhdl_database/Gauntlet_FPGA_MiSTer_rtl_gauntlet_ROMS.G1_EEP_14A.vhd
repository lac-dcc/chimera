library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity EEP_14A is
port (
	CLK : in  std_logic;
	WEn : in  std_logic;
	CEn : in  std_logic;
	OEn : in  std_logic;
	AD  : in  std_logic_vector(8 downto 0);
	DI  : in  std_logic_vector(7 downto 0);
	DO  : out std_logic_vector(7 downto 0)
	);
end entity;

-- EEPROM as RAM
architecture RTL of EEP_14A is
	type RAM_ARRAY is array (0 to 511) of std_logic_vector(7 downto 0);
--	signal RAM : RAM_ARRAY:=(others=>(others=>'0'));
	-- initialized EEPROM contents dumped from MAME
	signal RAM : RAM_ARRAY := (
		x"FF",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"70", -- 0x0000
		x"70",x"EB",x"00",x"04",x"FF",x"60",x"8F",x"04",x"00",x"10",x"00",x"00",x"00",x"14",x"FF",x"00", -- 0x0010
		x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"70",x"70",x"EB", -- 0x0020
		x"00",x"04",x"FF",x"60",x"8F",x"04",x"00",x"10",x"00",x"00",x"00",x"14",x"24",x"1B",x"8F",x"00", -- 0x0030
		x"22",x"1F",x"40",x"32",x"66",x"34",x"00",x"1D",x"B0",x"1F",x"E0",x"43",x"13",x"76",x"00",x"FC", -- 0x0040
		x"1C",x"20",x"19",x"D3",x"10",x"00",x"1A",x"90",x"1C",x"55",x"FC",x"EE",x"38",x"00",x"95",x"1F", -- 0x0050
		x"40",x"1F",x"24",x"EC",x"00",x"1D",x"B0",x"1F",x"7A",x"C5",x"81",x"CF",x"00",x"0D",x"1C",x"20", -- 0x0060
		x"45",x"F8",x"96",x"00",x"1A",x"90",x"54",x"B0",x"96",x"91",x"67",x"00",x"CC",x"1F",x"40",x"0C", -- 0x0070
		x"04",x"86",x"00",x"1D",x"B0",x"19",x"36",x"FD",x"35",x"74",x"00",x"73",x"1C",x"20",x"0C",x"F7", -- 0x0080
		x"AE",x"00",x"1A",x"90",x"91",x"42",x"F0",x"F0",x"32",x"00",x"8D",x"1F",x"40",x"1F",x"30",x"E0", -- 0x0090
		x"00",x"1D",x"B0",x"0D",x"70",x"D1",x"EB",x"52",x"00",x"E5",x"1C",x"20",x"4E",x"0F",x"82",x"00", -- 0x00A0
		x"1A",x"90",x"21",x"26",x"FF",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x00B0
		x"00",x"00",x"00",x"FF",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x00C0
		x"00",x"00",x"FF",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x00D0
		x"00",x"FF",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x00E0
		x"FF",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"FF", -- 0x00F0
		x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"FF",x"00", -- 0x0100
		x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"FF",x"00",x"00", -- 0x0110
		x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"FF",x"00",x"00",x"00", -- 0x0120
		x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0130
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0140
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0150
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0160
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0170
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0180
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0190
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x01A0
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x01B0
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x01C0
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x01D0
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"EF", -- 0x01E0
		x"18",x"80",x"07",x"17",x"00",x"98",x"00",x"6F",x"00",x"00",x"E0",x"8F",x"FF",x"FF",x"FF",x"FF"  -- 0x01F0
	);
	-- Ask Xilinx synthesis to use block RAMs if possible
	attribute ram_style : string;
	attribute ram_style of RAM : signal is "block";
	-- Ask Quartus synthesis to use block RAMs if possible
	attribute ramstyle : string;
	attribute ramstyle of RAM : signal is "MLAB";
begin
	mem_proc : process
	begin
		wait until rising_edge(CLK);
		DO <= (others=>'Z');
		if CEn = '0' then
			if OEn = '0' then
				DO <= RAM(to_integer(unsigned(AD)));
			elsif WEn = '0' then
				RAM(to_integer(unsigned(AD))) <= DI;
			end if;
		end if;
	end process;
end RTL;
