-- Element Test Bed

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity Element_Test_Bed is
	port(
		n_reset		: in std_logic;
		clk			: in std_logic;
		
		VoutVect		: out std_logic_vector(17 downto 0) -- rrrrr,gggggg,bbbbb,hsync,vsync
	);
end Element_Test_Bed;

architecture struct of Element_Test_Bed is

	signal n_WR					: std_logic := '0';
	signal n_RD					: std_logic;
	signal cpuAddress			: std_logic_vector(15 downto 0) := "0000000000000000";
	signal cpuDataOut			: std_logic_vector(7 downto 0);
	signal cpuDataIn			: std_logic_vector(7 downto 0);
	signal displayRamData	: std_logic_vector(7 downto 0);
	
	signal n_memWR				: std_logic;
	
	signal n_dispRamCS		: std_logic;
	
	signal cpuClock			: std_logic;
	signal CLOCK_100		: std_ulogic;
	signal CLOCK_50		: std_ulogic;
	signal Video_Clk_25p6		: std_ulogic;
	
begin

	n_dispRamCS 	<= '0' when cpuAddress(15 downto 11) = "11010" else '1';				-- xD000-xD7FF (2KB)
 
	cpuDataIn <=
		displayRamData when n_dispRamCS = '0' else
		x"FF";

	-- ____________________________________________________________________________________
	-- Clocks
pll : work.VideoClk_SVGA_800x600 PORT MAP (
		inclk0	=> clk,
		c0	 		=> Video_Clk_25p6,	-- 25.6 MHz Video Clock
		c1			=> cpuClock,			-- 1 MHz CPU clock
		c2			=> CLOCK_50			-- Logic Clock
	);
	
		
	svga : entity work.Mem_Mapped_SVGA
	port map (
			n_reset 			=> n_reset,
			Video_Clk 		=> Video_Clk_25p6,
			CLK_50			=> CLOCK_50,
			n_dispRamCS		=> n_dispRamCS,
			n_memWR			=> n_memWR,
			cpuAddress 		=> cpuAddress(10 downto 0),
			cpuDataOut		=> cpuDataOut,
			dataOut			=> displayRamData,
			VoutVect			=> VoutVect(17 downto 0) -- rrrrr,gggggg,bbbbb,hsync,vsync
		);

end;
