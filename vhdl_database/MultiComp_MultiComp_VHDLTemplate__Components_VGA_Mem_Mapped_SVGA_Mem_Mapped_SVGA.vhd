library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Mem_Mapped_SVGA is
	port(
		n_reset				: in std_logic;
		Video_Clk			: in std_logic;
		CLK_50				: in std_logic;
		n_dispRamCS			: in std_logic;
		n_memWR				: in std_logic;
		cpuAddress			: in std_logic_vector(10 downto 0);
		cpuDataOut			: in std_logic_vector(7 downto 0);
		dataOut				: out std_logic_vector(7 downto 0);
		VoutVect				: out std_logic_vector(17 downto 0) -- rrrrr,gggggg,bbbbb,hsync,vsync
		);
end Mem_Mapped_SVGA;

architecture struct of Mem_Mapped_SVGA is

	signal dispAddrB 			: std_logic_vector(10 downto 0);
	signal dispRamDataOutB 	: std_logic_vector(7 downto 0);
	signal charAddr 			: std_logic_vector(10 downto 0);
	signal charData 			: std_logic_vector(7 downto 0);
	signal video				: std_logic;
	signal hSync				: std_logic;
	signal vSync				: std_logic;
	signal hAct					: std_logic;

begin
	
	VoutVect <=	video&video&video&video&video&			-- Red
					video&video&video&video&video&video&	-- Grn
					hAct&hAct&hAct&hAct&hAct&			-- Blu
					hSync&vSync;
	
	Video_SVGA_64x32 : entity work.Video_SVGA_64x32
	port map (
		charAddr => charAddr,
		charData => charData,
		dispAddr => dispAddrB,
		dispData => dispRamDataOutB,
		clk => Video_Clk,
		video => video,
		vSync => vSync,
		hSync => hSync,
		hAct	=> hAct
	);	

	DisplayRAM: entity work.DisplayRam2k 
	port map
	(
		address_a => cpuAddress(10 downto 0),
		address_b => dispAddrB,
		clock	=> CLK_50,
		data_a => cpuDataOut,
		data_b => (others => '0'),
		wren_a => not(n_memWR or n_dispRamCS),
		wren_b => '0',
		q_a => dataOut,
		q_b => dispRamDataOutB
	);

	CharROM: entity work.CharRom
	port map
	(
		address => charAddr,
		q => charData
	);

end;