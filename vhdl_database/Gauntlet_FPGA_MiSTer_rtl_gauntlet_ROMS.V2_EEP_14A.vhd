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
		x"FF",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"1A", -- 0x0000
		x"7B",x"96",x"00",x"79",x"FF",x"0A",x"84",x"18",x"00",x"10",x"00",x"00",x"00",x"08",x"FF",x"00", -- 0x0010
		x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"1A",x"7B",x"96", -- 0x0020
		x"00",x"79",x"FF",x"0A",x"84",x"18",x"00",x"10",x"00",x"00",x"00",x"08",x"64",x"3B",x"9D",x"00", -- 0x0030
		x"9B",x"05",x"DC",x"7F",x"03",x"3B",x"00",x"05",x"79",x"7F",x"3B",x"64",x"3A",x"55",x"00",x"9B", -- 0x0040
		x"05",x"15",x"7F",x"CB",x"3B",x"00",x"04",x"B0",x"7F",x"3B",x"FF",x"00",x"00",x"00",x"00",x"00", -- 0x0050
		x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"FF",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x0060
		x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"00",x"00", -- 0x0070
		x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0080
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0090
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00A0
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00B0
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00C0
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00D0
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00E0
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x00F0
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0100
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0110
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0120
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0130
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
		x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"28", -- 0x01E0
		x"CF",x"18",x"00",x"C8",x"00",x"00",x"C8",x"D7",x"07",x"D0",x"00",x"00",x"00",x"00",x"FF",x"FF"  -- 0x01F0
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
