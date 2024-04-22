-- This file is copyright by Grant Searle 2014
-- You are free to use this file in your own projects but must never charge for it nor use it without
-- acknowledgement.
-- Please ask permission from Grant Searle before republishing elsewhere.
-- If you use this file or any part of it, please add an acknowledgement to myself and
-- a link back to my main web site http://searle.hostei.com/grant/    
-- and to the UK101 page at http://searle.hostei.com/grant/uk101FPGA/index.html
--
-- Please check on the above web pages to see if there are any updates before using this file.
-- If for some reason the page is no longer available, please search for "Grant Searle"
-- on the internet to see if I have moved to another web hosting service.
--
-- Grant Searle
-- eMail address available on my main web page link above.


library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;

entity UK101TextDisplay is
	port (
		charAddr : out std_LOGIC_VECTOR(10 downto 0);
		charData : in std_LOGIC_VECTOR(7 downto 0);
		dispAddr : out std_LOGIC_VECTOR(9 downto 0);
		dispData : in std_LOGIC_VECTOR(7 downto 0);
		clk    	: in  std_logic;
		video		: out std_logic;
		sync  	: out  std_logic
   );
end UK101TextDisplay;

architecture rtl of UK101TextDisplay is

	signal hSync   : std_logic := '1';
	signal vSync   : std_logic := '1';

	signal vActive   : std_logic := '0';
	signal hActive   : std_logic := '0';

	signal	pixelClockCount: STD_LOGIC_VECTOR(3 DOWNTO 0); 
	signal	pixelCount: STD_LOGIC_VECTOR(2 DOWNTO 0); 
	
	signal	horizCount: STD_LOGIC_VECTOR(11 DOWNTO 0); 
	signal	vertLineCount: STD_LOGIC_VECTOR(8 DOWNTO 0); 

	signal	charVert: STD_LOGIC_VECTOR(3 DOWNTO 0); 
	signal	charScanLine: STD_LOGIC_VECTOR(3 DOWNTO 0); 

	signal	charHoriz: STD_LOGIC_VECTOR(5 DOWNTO 0); 
	signal	charBit: STD_LOGIC_VECTOR(3 DOWNTO 0); 

begin

	sync <= hSync and vSync;
	
	dispAddr <= charVert & charHoriz;
	charAddr <= dispData & charScanLine(3 DOWNTO 1);
	
	PROCESS (clk)
	BEGIN
	
-- UK101 display...
-- 64 bytes per line (48 chars displayed)	
-- 16 lines of characters
-- 8x8 per char
	
-- 5 lines vsync
-- 30 lines to start of display
-- 313 lines per frame
-- 64uS per horiz line (3200 clocks)
-- 4.7us horiz sync (235 clocks)
		if rising_edge(clk) then
			IF horizCount < 3200 THEN
				horizCount <= horizCount + 1;
--				if (horizCount < 600) or (horizCount > 3000) then
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
				if vertLineCount > 312 then
					vertLineCount <= (others => '0');
				else
--					if vertLineCount < 42 or vertLineCount > 297 then
					if vertLineCount < 38 or vertLineCount > 293 then
						vActive <= '0';
						charVert <= (others => '0');
						charScanLine <= (others => '0');
					else
						vActive <= '1';
						if charScanLine = 15 then
							charScanLine <= (others => '0');
							charVert <= charVert+1;
						else
							if vertLineCount /= 38 then
								charScanLine <= charScanLine+1;
							end if;
						end if;
					end if;

					vertLineCount <=vertLineCount+1;
				end if;

			END IF;
			if horizCount < 235 then
				hSync <= '0';
			else
				hSync <= '1';
			end if;
			if vertLineCount < 5 then
				vSync <= '0';
			else
				vSync <= '1';
			end if;
			
			if hActive='1' and vActive = '1' then
				if pixelClockCount <5 then
					pixelClockCount <= pixelClockCount+1;
				else
					video <= charData(7-to_integer(unsigned(pixelCount)));
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
