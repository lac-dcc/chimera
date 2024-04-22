-- ____________________________________________________________________________________
-- This is from Grant Searle's Multicomp project
-- Grant's main web site is: http://searle.hostei.com/grant/    
-- and "multicomp" page http://searle.hostei.com/grant/Multicomp/index.html
-- ____________________________________________________________________________________
-- Implements a memory mapped display
-- Uses 2K of Dual Ported RAM in an Altera FPGA
-- 48x16 display
-- NTSC Composite video output (monochrome)
-- 

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;

entity UK101TextDisplay is
	port (
		charAddr 	: out std_LOGIC_VECTOR(10 downto 0);
		charData 	: in std_LOGIC_VECTOR(7 downto 0);
		dispAddr 	: out std_LOGIC_VECTOR(9 downto 0);
		dispData 	: in std_LOGIC_VECTOR(7 downto 0);
		clk    	 	: in  std_logic;
		video		: out std_logic;
		sync  		: out  std_logic
   );
end UK101TextDisplay;

architecture rtl of UK101TextDisplay is

	signal n_hSync   : std_logic := '1';	-- Active low horizontal sync
	signal n_vSync   : std_logic := '1';	-- Active low vertical sync

	signal vActive   : std_logic := '0';	-- Video is active when this is high (lines)
	signal hActive   : std_logic := '0';	-- Video is active when this is high (rows)

	signal	pixelClockCount: STD_LOGIC_VECTOR(3 DOWNTO 0); 
	signal	pixelCount: STD_LOGIC_VECTOR(2 DOWNTO 0); 
	
	signal	horizCount: STD_LOGIC_VECTOR(11 DOWNTO 0); 
	signal	vertLineCount: STD_LOGIC_VECTOR(8 DOWNTO 0); 

	signal	charVert: STD_LOGIC_VECTOR(3 DOWNTO 0); 
	signal	charScanLine: STD_LOGIC_VECTOR(3 DOWNTO 0); 

	signal	charHoriz: STD_LOGIC_VECTOR(5 DOWNTO 0); 
	signal	charBit: STD_LOGIC_VECTOR(3 DOWNTO 0); 

begin

	sync <= n_hSync and n_vSync;
	
	dispAddr <= charVert & charHoriz;
	charAddr <= dispData & charScanLine(3 DOWNTO 1);
	
	PROCESS (clk)
	BEGIN
	
-- UK101 display...
-- 64 bytes per line (48 chars displayed)	
-- 16 lines of characters
-- 8x8 per char

-- Composite Video timing
-- NTSC without color information
-- http://land-boards.com/blwiki/index.php?title=EP2C5-DB#Video_Timing
-- http://www.batsocks.co.uk/readme/video_timing.htm
-- Horizontal Timing
--		Horizontal Bit Rate
--			50 MHz / 3175 clocks = 63.5uS per line (Spec calls for 63.55uS - close enough)
--			15.748 KHz line rate
--		Horizontal Active Time
--			50 MHz / (3000-40) 2960 clocks = 59.2 uS
--			2960 clocks/active_line / 48 chars/line = 61.6 clocks per character???
--		Horizontal sync
--			235 clocks * 20nS/clock = 4.7uS (spec calls for 4.7uS)
-- Vertical Timing
-- 		262 lines per frame
-- 		5 lines vert sync
-- 		6 lines to start of display
--		256 lines of active video
--		Characters are 8x8 fonts
--			8 horizontal
--			8 vertical
--		256 active lines/screen divided by 16 lines of characters/screen = 16 lines/character
--			Rows are duplicated 2x (count increments every other line)

		if rising_edge(clk) then
			if horizCount < 3175 THEN
				horizCount <= horizCount + 1;
				if (horizCount < 40) or (horizCount > 3000) then
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
				if vertLineCount > 262 then
					vertLineCount <= (others => '0');
				else
					if vertLineCount < 6 or vertLineCount > 261 then
						vActive <= '0';
						charVert <= (others => '0');
						charScanLine <= (others => '0');
					else
						vActive <= '1';
						if charScanLine = 14 then
							charScanLine <= (others => '0');
							charVert <= charVert+1;
						else
							if vertLineCount /= 6 then
								charScanLine <= charScanLine+1;
							end if;
						end if;
					end if;

					vertLineCount <=vertLineCount+1;
				end if;

			END IF;
			if horizCount < 235 then
				n_hSync <= '0';
			else
				n_hSync <= '1';
			end if;
			if vertLineCount < 5 then
				n_vSync <= '0';
			else
				n_vSync <= '1';
			end if;
			
			if hActive='1' and vActive = '1' then
				if pixelClockCount <5 then
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
