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

-- NTSC timing
-- 63.5uS per horiz line = 15.7 KHz horizontal timing = (3175 clocks)
-- horizontal sync (235 clocks)
-- 5 lines vert sync 
-- 6 lines to start of display
-- 262 lines per frame

		if rising_edge(clk) then
			if horizCount < 3175 THEN -- NTSC
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
				if vertLineCount > 262 then		-- NTSC timing
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
			if horizCount < 235 then	-- NTSC
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
