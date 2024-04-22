-- ____________________________________________________________________________________
-- This is from Grant Searle's Multicomp project
-- Grant's main web site is: http://searle.hostei.com/grant/    
-- and "multicomp" page http://searle.hostei.com/grant/Multicomp/index.html
-- ____________________________________________________________________________________
-- Additional modifications for VGA output
-- Implements a memory mapped display
-- Uses 2K of Dual Ported RAM in an Altera FPGA
-- 64x32 display
-- 640x480 VGA output (monochrome)
-- Implements Grant Searle's modifications for 64x32 screens as described here:
-- http://searle.hostei.com/grant/uk101FPGA/index.html#Modification3
-- 

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;

entity UK101TextDisplay_vga is
	port (
		charAddr 	: out std_LOGIC_VECTOR(10 downto 0);
		charData 	: in std_LOGIC_VECTOR(7 downto 0);
		dispAddr 	: out std_LOGIC_VECTOR(10 downto 0);
		dispData 	: in std_LOGIC_VECTOR(7 downto 0);
		clk    	 	: in  std_logic;
		video			: out std_logic;
		vSync 		: out std_logic;
		hSync  		: out  std_logic;
		hAct			: out  std_logic
   );
end UK101TextDisplay_vga;

architecture rtl of UK101TextDisplay_vga is

	signal n_hSync   : std_logic := '1';	-- Active low horizontal sync
	signal n_vSync   : std_logic := '1';	-- Active low vertical sync

	signal vActive   : std_logic := '0';	-- Video is active when this is high (lines)
	signal hActive   : std_logic := '0';	-- Video is active when this is high (rows)

	signal	pixelClockCount: STD_LOGIC_VECTOR(3 DOWNTO 0); 
	signal	pixelCount: STD_LOGIC_VECTOR(2 DOWNTO 0); 
	
	signal	horizCount: STD_LOGIC_VECTOR(11 DOWNTO 0); 
	signal	vertLineCount: STD_LOGIC_VECTOR(9 DOWNTO 0); 

	signal	charVert: STD_LOGIC_VECTOR(4 DOWNTO 0); 
	signal	charScanLine: STD_LOGIC_VECTOR(2 DOWNTO 0); 

	signal	charHoriz: STD_LOGIC_VECTOR(5 DOWNTO 0); 
	signal	charBit: STD_LOGIC_VECTOR(3 DOWNTO 0); 

begin

	vSync <= n_vSync;
	hSync <= n_hSync;
	hAct <= hActive and vActive;
	
	dispAddr <= charVert & charHoriz;
	charAddr <= dispData & charScanLine;
	
	PROCESS (clk)
	BEGIN
	
-- http://www.batsocks.co.uk/readme/video_timing.htm
-- Memory Mapped VGA Character Display
--		8X8 fonts
--		64x32 characters displayed per screen
-- Horizontal Timing
--		Horizontal Line Rate Timing
--			VGA Timing spec 
--				25.175 MHz clock
--				800 clocks horizontal = 31.78 uS per line
--				31.469 Khz line frequency
--			Using FPGA (Clock is about 2x faster so more clocks are needed)
--				50 MHz clock
--				1588 clocks = 31.76uS per line
--				31.486 KHz line frequency
--		Horizontal Line Timing Details
--			VGA
--				640 active pixels = 25.42 uS
--				Sync Width = 96 clocks = 3.813 uS
--				Front Porch plus border = 8+8=16 clocks
--				Back Porch plus border = 40+8=48 clocks
--			Using FPGA
--				8 (bits/character) x 64 (characters/line) = 512 active pixels per line
--					Will need to overclock pixels (2:1)
--					512/640 = 80% of the horizontal space (screen will be narrowed by 20%)
--				2x overclocking = 512 x 2 = 1024 clocks per active part of line
--				20 nS/clock * 1024 clocks = 20.48 uS active time
--				Sync width is 188 clocks = 3.84 uS
--				Back Porch plus border = 188 clocks
--				Front Porch plus border = 188 clocks
--				May need to shift the front/back porch numbers to get screen centered horizontally
-- Vertical Timing
--		VGA
--			525 lines
--			480 active lines
--			2 lines front porch
--			2 lines vertical sync
--			25 lines back porch
--			8 lines top border
--			8 lines bottom border
--		FPGA
--			525 lines (same)
--			32x8=256 active lines (not enough active lines in VGA to do overscan)
--			130 lines border plus front porch
--			2 lines vertical sync
--			137 lines border plus back porch

		if rising_edge(clk) then
			if horizCount < 1288 THEN
				horizCount <= horizCount + 1;
				if (horizCount < 244) or (horizCount > 1268) then
					hActive <= '0';
					pixelClockCount <= (others => '0');
					charHoriz <= (others => '0');
				else
					hActive <= '1';
				end if;

			else
				horizCount<= (others => '0');
				pixelCount<= (others => '0');
				charHoriz<= (others => '0');
				if vertLineCount > 524 then		-- 525 lines = 60 Hz
					vertLineCount <= (others => '0');
				else
					if vertLineCount < 126 or vertLineCount > 380 then
						vActive <= '0';
						charVert <= (others => '0');
						charScanLine <= (others => '0');
					else
						vActive <= '1';
						if charScanLine = 7 then
							charScanLine <= (others => '0');
							charVert <= charVert+1;
						else
							if vertLineCount /= 6 then
								charScanLine <= charScanLine+1;
							end if;
						end if;
					end if;

					vertLineCount <= vertLineCount+1;
				end if;

			end if;
			if horizCount < 144 then
				n_hSync <= '0';
			else
				n_hSync <= '1';
			end if;
			if vertLineCount < 2 then
				n_vSync <= '0';
			else
				n_vSync <= '1';
			end if;
			
			if hActive='1' and vActive = '1' then
--				if pixelClockCount <3 then		-- original was 3 - changed to have less clocks per screen pixel
				if pixelClockCount <1 then
					pixelClockCount <= pixelClockCount+1;
				else
					video <= charData(7-to_integer(unsigned(pixelCount)));	-- 8:1 mux
					pixelClockCount <= (others => '0');
					if pixelCount = 7 then
						charHoriz <= charHoriz+1;
					end if;
					pixelCount <= pixelCount+1;
				end if;
			else
				video <= '0';
			end if;
		end if;
	END PROCESS;	
  
 end rtl;
