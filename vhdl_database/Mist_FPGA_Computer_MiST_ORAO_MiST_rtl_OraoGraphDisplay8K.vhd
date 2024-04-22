-- 8K 256x256 graphics by Emard 2015
-- License=GPL

-- Modified Grant Searle's text display to show bitmap graphics
-- Acknowledgement to his great work!
-- main web site http://searle.hostei.com/grant/    
-- UK101 page at http://searle.hostei.com/grant/uk101FPGA/index.html

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;

entity OraoGraphDisplay8K is
	port (
		dispAddr : out std_LOGIC_VECTOR(12 downto 0);
		dispData : in std_LOGIC_VECTOR(7 downto 0);
		clk    	: in std_logic;
		video	: out std_logic;
		h_sync  : out std_logic;
		v_sync  : out std_logic;
		sync  	: out std_logic
   );

end OraoGraphDisplay8K;

architecture rtl of OraoGraphDisplay8K is

	signal hSync : std_logic := '1';
	signal vSync : std_logic := '1';

	signal vActive : std_logic := '0';
	signal hActive : std_logic := '0';

	signal pixelClockCount: STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal pixelCount: STD_LOGIC_VECTOR(2 DOWNTO 0);
	
	signal horizCount: STD_LOGIC_VECTOR(11 DOWNTO 0);
	signal vertLineCount: STD_LOGIC_VECTOR(8 DOWNTO 0);

	signal charHoriz: STD_LOGIC_VECTOR(12 DOWNTO 0);
	signal charBit: STD_LOGIC_VECTOR(3 DOWNTO 0);

	signal charData: std_LOGIC_VECTOR(7 downto 0);
	
begin

	sync <= hSync and vSync;
	h_sync <= hSync;
	v_sync <= vSync;
	
	dispAddr <= charHoriz;
	charData <= dispData;
	
	PROCESS (clk)
	BEGIN
	
-- Orao display 256x256 bitmap 8K

-- 5 lines vsync
-- 30 lines to start of display
-- 313 lines per frame
-- 64uS per horiz line (3200 clocks)
-- 4.7us horiz sync (235 clocks)
		if rising_edge(clk) then
			IF horizCount < 3200 THEN
				horizCount <= horizCount + 1;
				-- horizontal position of the screen
				if (horizCount < 780) or (horizCount > 2830) then
					hActive <= '0';
					pixelClockCount <= (others => '0');
				else
					hActive <= '1';
				end if;

			else
				horizCount<= (others => '0');
				pixelCount<= (others => '0');
				if vertLineCount > 312 then
					vertLineCount <= (others => '0');
				else
					if vertLineCount < 38 or vertLineCount > 293 then
						vActive <= '0';
                                                charHoriz <= (others => '0');
					else
						vActive <= '1';
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
				if pixelClockCount < 7 then
					pixelClockCount <= pixelClockCount+1;
				else
					video <= charData(conv_integer(pixelCount));
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
