library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity PROM_4R_G2 is
port (
	CLK  : in  std_logic;
	ADDR : in  std_logic_vector(7 downto 0);
	DATA : out std_logic_vector(3 downto 0) := (others=>'0')
	);
end entity;

architecture RTL of PROM_4R_G2 is
	type ROM_ARRAY is array (0 to 255) of std_logic_vector(3 downto 0);
	signal ROM : ROM_ARRAY := (
		x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"F",x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"F", -- 0x0000
		x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"F",x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"F", -- 0x0010
		x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"F",x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"F", -- 0x0020
		x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"F",x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"F", -- 0x0030
		x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"F",x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"F", -- 0x0040
		x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"F",x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"D", -- 0x0050
		x"1",x"3",x"5",x"7",x"9",x"9",x"9",x"9",x"1",x"3",x"5",x"5",x"5",x"5",x"5",x"5", -- 0x0060
		x"1",x"1",x"1",x"1",x"1",x"1",x"1",x"1",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0", -- 0x0070
		x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0", -- 0x0080
		x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0", -- 0x0090
		x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0", -- 0x00A0
		x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0", -- 0x00B0
		x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0", -- 0x00C0
		x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0",x"0", -- 0x00D0
		x"0",x"0",x"0",x"0",x"0",x"0",x"D",x"F",x"0",x"0",x"0",x"0",x"9",x"B",x"D",x"F", -- 0x00E0
		x"0",x"0",x"5",x"7",x"9",x"B",x"D",x"F",x"1",x"3",x"5",x"7",x"9",x"B",x"D",x"F"  -- 0x00F0
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
--		DATA <= ADDR(2 downto 0) & '1'; -- 1,3,5,7,9,B,D,F pattern
	end process;
end RTL;
