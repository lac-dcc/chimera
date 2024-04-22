library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity PROM_5E is
port (
	CLK  : in  std_logic;
	ADDR : in  std_logic_vector(7 downto 0);
	DATA : out std_logic_vector(3 downto 0) := (others=>'1')
	);
end entity;

architecture RTL of PROM_5E is
	type ROM_ARRAY is array (0 to 255) of std_logic_vector(3 downto 0);
	signal ROM : ROM_ARRAY := (
		x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3", -- 0x0000
		x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3", -- 0x0010
		x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3", -- 0x0020
		x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3", -- 0x0030
		x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3", -- 0x0040
		x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3", -- 0x0050
		x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"3",x"B", -- 0x0060
		x"B",x"B",x"B",x"9",x"9",x"9",x"9",x"B",x"B",x"B",x"B",x"B",x"B",x"B",x"B",x"F", -- 0x0070
		x"F",x"F",x"F",x"F",x"F",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E", -- 0x0080
		x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E", -- 0x0090
		x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E", -- 0x00A0
		x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E", -- 0x00B0
		x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E", -- 0x00C0
		x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E", -- 0x00D0
		x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E", -- 0x00E0
		x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"E",x"3"  -- 0x00F0
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
