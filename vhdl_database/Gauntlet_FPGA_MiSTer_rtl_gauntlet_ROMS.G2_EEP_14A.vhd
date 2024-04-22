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
		x"6F",x"F4",x"00",x"1B",x"FF",x"60",x"90",x"04",x"00",x"10",x"00",x"00",x"00",x"14",x"FF",x"00", -- 0x0010
		x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"70",x"6F",x"F4", -- 0x0020
		x"00",x"1B",x"FF",x"60",x"90",x"04",x"00",x"10",x"00",x"00",x"00",x"14",x"CB",x"C4",x"37",x"00", -- 0x0030
		x"91",x"1F",x"40",x"09",x"01",x"DB",x"00",x"1D",x"B0",x"14",x"63",x"6F",x"72",x"3D",x"00",x"87", -- 0x0040
		x"1C",x"20",x"64",x"F9",x"3C",x"00",x"1A",x"90",x"2C",x"63",x"11",x"30",x"B4",x"00",x"46",x"1F", -- 0x0050
		x"40",x"73",x"76",x"01",x"00",x"1D",x"B0",x"40",x"9A",x"2A",x"5E",x"DE",x"00",x"1A",x"1C",x"20", -- 0x0060
		x"73",x"36",x"79",x"00",x"1A",x"90",x"52",x"97",x"EC",x"94",x"2B",x"00",x"D8",x"1F",x"40",x"2B", -- 0x0070
		x"4D",x"FC",x"00",x"1D",x"B0",x"41",x"5D",x"D3",x"D1",x"7A",x"00",x"F0",x"1C",x"20",x"4B",x"1D", -- 0x0080
		x"80",x"00",x"1A",x"90",x"1C",x"0B",x"18",x"7F",x"EB",x"00",x"51",x"1F",x"40",x"7D",x"66",x"08", -- 0x0090
		x"00",x"1D",x"B0",x"08",x"CB",x"AC",x"E5",x"16",x"00",x"90",x"1C",x"20",x"0C",x"45",x"FF",x"00", -- 0x00A0
		x"1A",x"90",x"10",x"20",x"FF",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x00B0
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
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"02", -- 0x01E0
		x"1A",x"72",x"05",x"F8",x"00",x"68",x"00",x"70",x"00",x"00",x"E0",x"90",x"FF",x"FF",x"FF",x"FF"  -- 0x01F0
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
