library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity PROM_7U is
port (
	CLK  : in  std_logic;
	ADDR : in  std_logic_vector(8 downto 0);
	DATA : out std_logic_vector(7 downto 0) := (others=>'0')
	);
end entity;

architecture RTL of PROM_7U is
	type ROM_ARRAY is array (0 to 511) of std_logic_vector(7 downto 0);
	signal ROM : ROM_ARRAY := (
		x"55",x"3F",x"7E",x"5D",x"55",x"7B",x"7C",x"5E",x"4D",x"3F",x"7E",x"45",x"4D",x"7B",x"7C",x"5E", -- 0x0000
		x"55",x"3F",x"7E",x"5D",x"55",x"7B",x"7C",x"5E",x"55",x"3F",x"7E",x"45",x"4D",x"7B",x"7C",x"5E", -- 0x0010
		x"D5",x"FF",x"7E",x"DD",x"D5",x"FB",x"FC",x"DE",x"CD",x"FF",x"7E",x"FF",x"CD",x"FB",x"FC",x"DE", -- 0x0020
		x"D5",x"FF",x"7E",x"DD",x"D5",x"FB",x"FC",x"DE",x"CD",x"FF",x"7E",x"FF",x"CD",x"FB",x"FC",x"DE", -- 0x0030
		x"55",x"3F",x"7E",x"5D",x"55",x"7B",x"7C",x"5E",x"4D",x"3F",x"7E",x"45",x"4D",x"7B",x"7C",x"5E", -- 0x0040
		x"55",x"3F",x"7E",x"5D",x"55",x"7B",x"7C",x"5E",x"55",x"3F",x"FE",x"45",x"4D",x"7B",x"7C",x"5E", -- 0x0050
		x"D5",x"FF",x"FE",x"DD",x"D5",x"FB",x"FC",x"DE",x"CD",x"FF",x"FE",x"FF",x"CD",x"FB",x"FC",x"DE", -- 0x0060
		x"D5",x"FF",x"FE",x"DD",x"D5",x"FB",x"FC",x"DE",x"CD",x"FF",x"FE",x"FF",x"CD",x"FB",x"FC",x"DE", -- 0x0070
		x"55",x"3F",x"7E",x"5D",x"55",x"7B",x"7C",x"5D",x"4D",x"3F",x"7E",x"45",x"4D",x"7B",x"7C",x"7F", -- 0x0080
		x"55",x"3F",x"7E",x"5D",x"55",x"7B",x"7C",x"5D",x"55",x"3F",x"7E",x"45",x"4D",x"7B",x"7C",x"5D", -- 0x0090
		x"D5",x"FF",x"7E",x"DD",x"D5",x"FB",x"FC",x"DD",x"CD",x"FF",x"7E",x"FF",x"CD",x"FB",x"FC",x"FF", -- 0x00A0
		x"D5",x"FF",x"7E",x"DD",x"D5",x"FB",x"FC",x"DD",x"CD",x"FF",x"7E",x"FF",x"CD",x"FB",x"FC",x"FF", -- 0x00B0
		x"55",x"3F",x"7E",x"5D",x"55",x"7B",x"7C",x"5D",x"4D",x"3F",x"7E",x"45",x"4D",x"7B",x"7C",x"7F", -- 0x00C0
		x"55",x"3F",x"7E",x"5D",x"55",x"7B",x"7C",x"5D",x"55",x"3F",x"FE",x"45",x"4D",x"7B",x"7C",x"5D", -- 0x00D0
		x"D5",x"FF",x"FE",x"DD",x"D5",x"FB",x"FC",x"DD",x"CD",x"FF",x"FE",x"FF",x"CD",x"FB",x"FC",x"FF", -- 0x00E0
		x"D5",x"FF",x"FE",x"DD",x"D5",x"FB",x"FC",x"DD",x"CD",x"FF",x"FE",x"FF",x"CD",x"FB",x"FC",x"FF", -- 0x00F0
		x"55",x"3F",x"7E",x"5D",x"55",x"7F",x"7C",x"5E",x"4D",x"3F",x"7E",x"45",x"4D",x"7F",x"7C",x"5E", -- 0x0100
		x"55",x"3F",x"7E",x"5D",x"55",x"7F",x"7C",x"5E",x"55",x"3F",x"7E",x"45",x"4D",x"7F",x"7C",x"5E", -- 0x0110
		x"D5",x"FF",x"7E",x"DD",x"D5",x"FF",x"FC",x"DE",x"CD",x"FF",x"7E",x"FF",x"CD",x"FF",x"FC",x"DE", -- 0x0120
		x"D5",x"FF",x"7E",x"DD",x"D5",x"FF",x"FC",x"DE",x"CD",x"FF",x"7E",x"FF",x"CD",x"FF",x"FC",x"DE", -- 0x0130
		x"55",x"3F",x"7E",x"5D",x"55",x"7F",x"7C",x"5E",x"4D",x"3F",x"7E",x"45",x"4D",x"7F",x"7C",x"5E", -- 0x0140
		x"55",x"3F",x"7E",x"5D",x"55",x"7F",x"7C",x"5E",x"55",x"3F",x"FE",x"45",x"4D",x"7F",x"7C",x"5E", -- 0x0150
		x"D5",x"FF",x"FE",x"DD",x"D5",x"FF",x"FC",x"DE",x"CD",x"FF",x"FE",x"FF",x"CD",x"FF",x"FC",x"DE", -- 0x0160
		x"D5",x"FF",x"FE",x"DD",x"D5",x"FF",x"FC",x"DE",x"CD",x"FF",x"FE",x"FF",x"CD",x"FF",x"FC",x"DE", -- 0x0170
		x"55",x"3F",x"7E",x"5D",x"55",x"7F",x"7C",x"5D",x"4D",x"3F",x"7E",x"45",x"4D",x"7F",x"7C",x"7F", -- 0x0180
		x"55",x"3F",x"7E",x"5D",x"55",x"7F",x"7C",x"5D",x"55",x"3F",x"7E",x"45",x"4D",x"7F",x"7C",x"5D", -- 0x0190
		x"D5",x"FF",x"7E",x"DD",x"D5",x"FF",x"FC",x"DD",x"CD",x"FF",x"7E",x"FF",x"CD",x"FF",x"FC",x"FF", -- 0x01A0
		x"D5",x"FF",x"7E",x"DD",x"D5",x"FF",x"FC",x"DD",x"CD",x"FF",x"7E",x"FF",x"CD",x"FF",x"FC",x"FF", -- 0x01B0
		x"55",x"3F",x"7E",x"5D",x"55",x"7F",x"7C",x"5D",x"4D",x"3F",x"7E",x"45",x"4D",x"7F",x"7C",x"7F", -- 0x01C0
		x"55",x"3F",x"7E",x"5D",x"55",x"7F",x"7C",x"5D",x"55",x"3F",x"FE",x"45",x"4D",x"7F",x"7C",x"5D", -- 0x01D0
		x"D5",x"FF",x"FE",x"DD",x"D5",x"FF",x"FC",x"DD",x"CD",x"FF",x"FE",x"FF",x"CD",x"FF",x"FC",x"FF", -- 0x01E0
		x"D5",x"FF",x"FE",x"DD",x"D5",x"FF",x"FC",x"DD",x"CD",x"FF",x"FE",x"FF",x"CD",x"FF",x"FC",x"FF"  -- 0x01F0
	);

	-- Ask Xilinx synthesis to use block RAMs if possible
	attribute ram_style : string;
	attribute ram_style of ROM : signal is "block";
	-- Ask Quartus synthesis to use block RAMs if possible
	attribute ramstyle : string;
	attribute ramstyle of ROM : signal is "M10K";
begin
	mem_proc : process
	begin
		wait until rising_edge(CLK);
		DATA <= ROM(to_integer(unsigned(ADDR)));
	end process;
end RTL;
