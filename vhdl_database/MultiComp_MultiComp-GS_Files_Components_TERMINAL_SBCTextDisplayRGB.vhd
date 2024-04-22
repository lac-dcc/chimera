-- This file is copyright by Grant Searle 2014
-- You are free to use this file in your own projects but must never charge for it nor use it without
-- acknowledgement.
-- Please ask permission from Grant Searle before republishing elsewhere.
-- If you use this file or any part of it, please add an acknowledgement to myself and
-- a link back to my main web site http://searle.hostei.com/grant/    
-- and to the "multicomp" page at http://searle.hostei.com/grant/Multicomp/index.html
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

entity SBCTextDisplayRGB is
	generic(
		constant EXTENDED_CHARSET : integer := 0; -- 1 = 256 chars, 0 = 128 chars
		constant COLOUR_ATTS_ENABLED : integer := 1; -- 1=Colour for each character, 0=Colour applied to whole display
		-- VGA 640x480 Default values
		constant VERT_CHARS : integer := 25;
		constant HORIZ_CHARS : integer := 80;
		constant CLOCKS_PER_SCANLINE : integer := 1600; -- NTSC/PAL = 3200
		constant DISPLAY_TOP_SCANLINE : integer := 35+40;
		constant DISPLAY_LEFT_CLOCK : integer := 288; -- NTSC/PAL = 600+
		constant VERT_SCANLINES : integer := 525; -- NTSC=262, PAL=312
		constant VSYNC_SCANLINES : integer := 2; -- NTSC/PAL = 4
		constant HSYNC_CLOCKS : integer := 192;  -- NTSC/PAL = 235
		constant VERT_PIXEL_SCANLINES : integer := 2;
		constant CLOCKS_PER_PIXEL : integer := 2; -- min = 2
		constant H_SYNC_ACTIVE : std_logic := '0';
		constant V_SYNC_ACTIVE : std_logic := '0';
		
		constant DEFAULT_ATT : std_logic_vector(7 downto 0) := "00001111"; -- background iBGR | foreground iBGR (i=intensity)
		constant ANSI_DEFAULT_ATT : std_logic_vector(7 downto 0) := "00000111" -- background iBGR | foreground iBGR (i=intensity)
	);
	port (
		n_reset	: in std_logic;
		clk    	: in  std_logic;
		n_wr		: in  std_logic;
		n_rd		: in  std_logic;
		regSel	: in  std_logic;
		dataIn	: in  std_logic_vector(7 downto 0);
		dataOut	: out std_logic_vector(7 downto 0);
		n_int		: out std_logic; 
		n_rts		: out std_logic :='0';
		
		-- RGB video signals
		videoR0	: out std_logic;
		videoR1	: out std_logic;
		videoG0	: out std_logic;
		videoG1	: out std_logic;
		videoB0	: out std_logic;
		videoB1	: out std_logic;
		hSync  	: buffer  std_logic;
		vSync  	: buffer  std_logic;
		
		-- Monochrome video signals
		video		: buffer std_logic;
		sync  	: out  std_logic;		
		
		-- Keyboard signals
		ps2Clk	: inout std_logic;
		ps2Data	: inout std_logic;
 
		-- FN keys passed out as general signals (momentary and toggled versions)
		FNkeys	: out std_logic_vector(12 downto 0);
		FNtoggledKeys	: out std_logic_vector(12 downto 0)
 );
end SBCTextDisplayRGB;

architecture rtl of SBCTextDisplayRGB is

--VGA 640x400
--constant VERT_CHARS : integer := 25;
--constant HORIZ_CHARS : integer := 80;
--constant CLOCKS_PER_SCANLINE : integer := 1600;
--constant DISPLAY_TOP_SCANLINE : integer := 35;
--constant DISPLAY_LEFT_CLOCK : integer := 288;
--constant VERT_SCANLINES : integer := 448;
--constant VSYNC_SCANLINES : integer := 2;
--constant HSYNC_CLOCKS : integer := 192;
--constant VERT_PIXEL_SCANLINES : integer := 2;
--constant CLOCKS_PER_PIXEL : integer := 2; -- min = 2
--constant H_SYNC_ACTIVE : std_logic := '0';
--constant V_SYNC_ACTIVE : std_logic := '1';

constant HORIZ_CHAR_MAX : integer := HORIZ_CHARS-1;
constant VERT_CHAR_MAX : integer := VERT_CHARS-1;
constant CHARS_PER_SCREEN : integer := HORIZ_CHARS*VERT_CHARS;

	signal	FNkeysSig	: std_logic_vector(12 downto 0) := (others => '0');
	signal	FNtoggledKeysSig	: std_logic_vector(12 downto 0) := (others => '0');

	signal	vActive   : std_logic := '0';
	signal	hActive   : std_logic := '0';

	signal	pixelClockCount: STD_LOGIC_VECTOR(3 DOWNTO 0); 
	signal	pixelCount: STD_LOGIC_VECTOR(2 DOWNTO 0); 
	
	signal	horizCount: STD_LOGIC_VECTOR(11 DOWNTO 0); 
	signal	vertLineCount: STD_LOGIC_VECTOR(9 DOWNTO 0); 

	signal	charVert: integer range 0 to VERT_CHAR_MAX; --unsigned(4 DOWNTO 0); 
	signal	charScanLine: STD_LOGIC_VECTOR(3 DOWNTO 0); 

	signal	charHoriz: integer range 0 to HORIZ_CHAR_MAX; --unsigned(6 DOWNTO 0); 
	signal	charBit: STD_LOGIC_VECTOR(3 DOWNTO 0); 

	signal	cursorVert: integer range 0 to VERT_CHAR_MAX :=0;
	signal	cursorHoriz: integer range 0 to HORIZ_CHAR_MAX :=0;

	signal	cursorVertRestore: integer range 0 to VERT_CHAR_MAX :=0;
	signal	cursorHorizRestore: integer range 0 to HORIZ_CHAR_MAX :=0;
	
	signal	savedCursorVert: integer range 0 to VERT_CHAR_MAX :=0;
	signal	savedCursorHoriz: integer range 0 to HORIZ_CHAR_MAX :=0;
	
	signal	startAddr: integer range 0 to CHARS_PER_SCREEN; 
	signal 	cursAddr : integer range 0 to CHARS_PER_SCREEN;
	  
	signal 	dispAddr : integer range 0 to CHARS_PER_SCREEN;
	signal 	charAddr : std_LOGIC_VECTOR(10 downto 0);

	signal	dispCharData : std_LOGIC_VECTOR(7 downto 0);
	signal	dispCharWRData : std_LOGIC_VECTOR(7 downto 0);
	signal	dispCharRDData : std_LOGIC_VECTOR(7 downto 0);
	
	signal	dispAttData : std_LOGIC_VECTOR(7 downto 0);
	signal	dispAttWRData : std_LOGIC_VECTOR(7 downto 0):=DEFAULT_ATT; -- iBGR(back) iBGR(text)
	signal	dispAttRDData : std_LOGIC_VECTOR(7 downto 0);
	
	signal	charData : std_LOGIC_VECTOR(7 downto 0);

	signal	cursorOn : std_logic := '1';
	signal	dispWR : std_logic := '0';
	signal	cursBlinkCount : unsigned(25 downto 0);
	signal	kbWatchdogTimer : integer range 0 to 50000000 :=0;
	signal	kbWriteTimer : integer range 0 to 50000000 :=0;

	signal	n_int_internal   : std_logic := '1';
	signal	statusReg : std_logic_vector(7 downto 0) := (others => '0'); 
	signal	controlReg : std_logic_vector(7 downto 0) := "00000000";
	 
	type		kbBuffArray is array (0 to 7) of std_logic_vector(6 downto 0);
	signal	kbBuffer : kbBuffArray;

	signal	kbInPointer: integer range 0 to 15 :=0;
	signal	kbReadPointer: integer range 0 to 15 :=0;
	signal	kbBuffCount: integer range 0 to 15 :=0;
	signal	dispByteWritten : std_logic := '0';
	signal	dispByteSent : std_logic := '0';

	signal	dispByteLatch: std_logic_vector(7 DOWNTO 0); 
	type		dispStateType is ( idle, dispWrite, dispNextLoc, clearLine, clearL2,
						clearScreen, clearS2, clearChar, clearC2, insertLine, ins2, ins3, deleteLine, del2, del3);
	signal	dispState : dispStateType :=idle;
	type		nextStateType is ( none, waitForLeftBracket, processingParams, processingAdditionalParams );
	signal	nextState : nextStateType :=none;

	signal	param1: integer range 0 to 127 :=0;
	signal	param2: integer range 0 to 127 :=0;
	signal	param3: integer range 0 to 127 :=0;
	signal	param4: integer range 0 to 127 :=0;
	signal	paramCount: integer range 0 to 4 :=0;

	signal	attInverse : std_logic := '0';
	signal	attBold : std_logic := DEFAULT_ATT(3);

	signal	ps2Byte: std_logic_vector(7 DOWNTO 0); 
	signal	ps2PreviousByte: std_logic_vector(7 DOWNTO 0); 
	signal	ps2ConvertedByte: std_logic_vector(6 DOWNTO 0); 
	signal	ps2ClkCount : integer range 0 to 10 :=0;
	signal	ps2WriteClkCount : integer range 0 to 20 :=0;
	signal	ps2WriteByte: std_logic_vector(7 DOWNTO 0) := x"FF"; 
	signal	ps2WriteByte2: std_logic_vector(7 DOWNTO 0):= x"FF"; 
	signal	ps2PrevClk: std_logic := '1';
	signal 	ps2ClkFilter : integer range 0 to 50; 
	signal 	ps2ClkFiltered : std_logic := '1';

	signal	ps2Shift: std_logic := '0';
	signal	ps2Ctrl: std_logic := '0';
	signal	ps2Caps: std_logic := '1';
	signal	ps2Num: std_logic := '0';
	signal	ps2Scroll: std_logic := '0';

	signal	ps2DataOut: std_logic := '1';
	signal	ps2ClkOut: std_logic := '1';
	signal	n_kbWR: std_logic := '1';
	signal	kbWRParity: std_logic := '0';
	
	type		kbDataArray is array (0 to 131) of std_logic_vector(6 downto 0);

	-- UK KEYBOARD MAPPING (except for shift-3 = "#")
	
	--Original 8-bit HEX values
--	constant kbUnshifted : kbDataArray :=
--	(
--	--0     1     2     3     4     5     6     7     8     9     A     B     C     D     E     F
--	x"00",x"19",x"00",x"00",x"13",x"11",x"12",x"1C",x"00",x"1A",x"18",x"16",x"00",x"09",x"60",x"00", -- 0
--	x"00",x"00",x"00",x"00",x"00",x"71",x"31",x"00",x"00",x"00",x"7A",x"73",x"61",x"77",x"32",x"00", -- 1
--	x"00",x"63",x"78",x"64",x"65",x"34",x"33",x"00",x"00",x"20",x"76",x"66",x"74",x"72",x"35",x"00", -- 2
--	x"00",x"6E",x"62",x"68",x"67",x"79",x"36",x"00",x"00",x"00",x"6D",x"6A",x"75",x"37",x"38",x"00", -- 3
--	x"00",x"2C",x"6B",x"69",x"6F",x"30",x"39",x"00",x"00",x"2E",x"2F",x"6C",x"3B",x"70",x"2D",x"00", -- 4
--	x"00",x"00",x"27",x"00",x"5B",x"3D",x"00",x"00",x"00",x"00",x"0D",x"5D",x"00",x"00",x"00",x"00", -- 5
--	x"00",x"00",x"00",x"00",x"00",x"00",x"08",x"00",x"00",x"31",x"00",x"34",x"37",x"00",x"00",x"00", -- 6
--	x"30",x"2E",x"32",x"35",x"36",x"38",x"03",x"00",x"1B",x"2B",x"33",x"2D",x"2A",x"39",x"00",x"00", -- 7
--	x"00",x"00",x"00",x"17"
--	);
--	constant kbShifted : kbDataArray :=
--	(
--	--0     1     2     3     4     5     6     7     8     9     A     B     C     D     E     F
--	x"00",x"19",x"00",x"00",x"13",x"11",x"12",x"1C",x"00",x"1A",x"18",x"16",x"00",x"09",x"00",x"00", -- 0
--	x"00",x"00",x"00",x"00",x"00",x"51",x"21",x"00",x"00",x"00",x"5A",x"53",x"41",x"57",x"22",x"00", -- 1
--	x"00",x"43",x"58",x"44",x"45",x"24",x"23",x"00",x"00",x"20",x"56",x"46",x"54",x"52",x"25",x"00", -- 2
--	x"00",x"4E",x"42",x"48",x"47",x"59",x"5E",x"00",x"00",x"00",x"4D",x"4A",x"55",x"26",x"2A",x"00", -- 3
--	x"00",x"3C",x"4B",x"49",x"4F",x"29",x"28",x"00",x"00",x"3E",x"3F",x"4C",x"3A",x"50",x"5F",x"00", -- 4
--	x"00",x"00",x"40",x"00",x"7B",x"2B",x"00",x"00",x"00",x"00",x"0D",x"7D",x"00",x"00",x"00",x"00", -- 5
--	x"00",x"00",x"00",x"00",x"00",x"00",x"08",x"00",x"00",x"31",x"00",x"34",x"37",x"00",x"00",x"00", -- 6
--	x"30",x"2E",x"32",x"35",x"36",x"38",x"0C",x"00",x"1B",x"2B",x"33",x"2D",x"2A",x"39",x"00",x"00", -- 7
--	x"00",x"00",x"00",x"17"
--	);

	-- 7 bits to reduce logic count
	constant kbUnshifted : kbDataArray :=
	(
	--  0         1         2         3         4         5         6         7         8         9         A         B         C         D         E         F
	"0000000","0011001","0000000","0000000","0010011","0010001","0010010","0011100","0000000","0011010","0011000","0010110","0000000","0001001","1100000","0000000", -- 0
	"0000000","0000000","0000000","0000000","0000000","1110001","0110001","0000000","0000000","0000000","1111010","1110011","1100001","1110111","0110010","0000000", -- 1
	"0000000","1100011","1111000","1100100","1100101","0110100","0110011","0000000","0000000","0100000","1110110","1100110","1110100","1110010","0110101","0000000", -- 2
	"0000000","1101110","1100010","1101000","1100111","1111001","0110110","0000000","0000000","0000000","1101101","1101010","1110101","0110111","0111000","0000000", -- 3
	"0000000","0101100","1101011","1101001","1101111","0110000","0111001","0000000","0000000","0101110","0101111","1101100","0111011","1110000","0101101","0000000", -- 4
	"0000000","0000000","0100111","0000000","1011011","0111101","0000000","0000000","0000000","0000000","0001101","1011101","0000000","0000000","0000000","0000000", -- 5
	"0000000","0000000","0000000","0000000","0000000","0000000","0001000","0000000","0000000","0110001","0000000","0110100","0110111","0000000","0000000","0000000", -- 6
	"0110000","0101110","0110010","0110101","0110110","0111000","0000011","0000000","0011011","0101011","0110011","0101101","0101010","0111001","0000000","0000000", -- 7
	"0000000","0000000","0000000","0010111"
	);
	constant kbShifted : kbDataArray :=
	(
	--  0         1         2         3         4         5         6         7         8         9         A         B         C         D         E         F
	"0000000","0011001","0000000","0000000","0010011","0010001","0010010","0011100","0000000","0011010","0011000","0010110","0000000","0001001","0000000","0000000", -- 0
	"0000000","0000000","0000000","0000000","0000000","1010001","0100001","0000000","0000000","0000000","1011010","1010011","1000001","1010111","0100010","0000000", -- 1
	"0000000","1000011","1011000","1000100","1000101","0100100","0100011","0000000","0000000","0100000","1010110","1000110","1010100","1010010","0100101","0000000", -- 2
	"0000000","1001110","1000010","1001000","1000111","1011001","1011110","0000000","0000000","0000000","1001101","1001010","1010101","0100110","0101010","0000000", -- 3
	"0000000","0111100","1001011","1001001","1001111","0101001","0101000","0000000","0000000","0111110","0111111","1001100","0111010","1010000","1011111","0000000", -- 4
	"0000000","0000000","1000000","0000000","1111011","0101011","0000000","0000000","0000000","0000000","0001101","1111101","0000000","0000000","0000000","0000000", -- 5
	"0000000","0000000","0000000","0000000","0000000","0000000","0001000","0000000","0000000","0110001","0000000","0110100","0110111","0000000","0000000","0000000", -- 6
	"0110000","0101110","0110010","0110101","0110110","0111000","0001100","0000000","0011011","0101011","0110011","0101101","0101010","0111001","0000000","0000000", -- 7
	"0000000","0000000","0000000","0010111"
	);

	
begin

-- DISPLAY ROM AND RAM

GEN_EXT_CHARS: if (EXTENDED_CHARSET=1) generate
begin	
	fontRom : entity work.CGABoldRom -- 256 chars (2K)
	port map(
		address => charAddr,
		clock => clk,
		q => charData
	);
end generate GEN_EXT_CHARS;
	
GEN_REDUCED_CHARS: if (EXTENDED_CHARSET=0) generate
begin	
	fontRom : entity work.CGABoldRomReduced -- 128 chars (1K)
	port map(
		address => charAddr(9 downto 0),
		clock => clk,
		q => charData
	);
end generate GEN_REDUCED_CHARS;

GEN_2KRAM: if (CHARS_PER_SCREEN >1024) generate
begin	
 	dispCharRam: entity work.DisplayRam2K -- For 80x25 display character storage
	port map
	(
		clock	=> clk,

		address_b => std_logic_vector(to_unsigned(cursAddr,11)),
		data_b => dispCharWRData,
		q_b => dispCharRDData,
		wren_b => dispWR,

		address_a => std_logic_vector(to_unsigned(dispAddr,11)),
		data_a => (others => '0'),
		q_a => dispCharData,
		wren_a => '0'
	);
end generate GEN_2KRAM;

GEN_2KATTRAM: if (CHARS_PER_SCREEN >1024 and COLOUR_ATTS_ENABLED=1) generate
begin	

 	dispAttRam: entity work.DisplayRam2K -- For 80x25 display attribute storage
	port map
	(
		clock	=> clk,

		address_b => std_logic_vector(to_unsigned(cursAddr,11)),
		data_b => dispAttWRData,
		q_b => dispAttRDData,
		wren_b => dispWR,

		address_a => std_logic_vector(to_unsigned(dispAddr,11)),
		data_a => (others => '0'),
		q_a => dispAttData,
		wren_a => '0'
	);

end generate GEN_2KATTRAM;

GEN_1KRAM: if (CHARS_PER_SCREEN <1025) generate
begin	
 	dispCharRam: entity work.DisplayRam1K -- For 40x25 display character storage
	port map
	(
		clock	=> clk,

		address_b => std_logic_vector(to_unsigned(cursAddr,10)),
		data_b => dispCharWRData,
		q_b => dispCharRDData,
		wren_b => dispWR,

		address_a => std_logic_vector(to_unsigned(dispAddr,10)),
		data_a => (others => '0'),
		q_a => dispCharData,
		wren_a => '0'
	);
end generate GEN_1KRAM;

GEN_1KATTRAM: if (CHARS_PER_SCREEN <1025 and COLOUR_ATTS_ENABLED=1) generate
 	dispAttRam: entity work.DisplayRam1K -- For 40x25 display attribute storage
	port map
	(
		clock	=> clk,

		address_b => std_logic_vector(to_unsigned(cursAddr,10)),
		data_b => dispAttWRData,
		q_b => dispAttRDData,
		wren_b => dispWR,

		address_a => std_logic_vector(to_unsigned(dispAddr,10)),
		data_a => (others => '0'),
		q_a => dispAttData,
		wren_a => '0'
	);

end generate GEN_1KATTRAM;

GEN_NO_ATTRAM: if (COLOUR_ATTS_ENABLED=0) generate

dispAttData <= dispAttWRData; -- If no attribute RAM then two colour output on RGB pins as defined by default/esc sequence

end generate GEN_NO_ATTRAM;


	FNkeys <= FNkeysSig;
	FNtoggledKeys <= FNtoggledKeysSig;	

	charAddr <= dispCharData & charScanLine(VERT_PIXEL_SCANLINES+1 downto VERT_PIXEL_SCANLINES-1);

	dispAddr <= (startAddr + charHoriz+(charVert * HORIZ_CHARS)) mod CHARS_PER_SCREEN;
	cursAddr <= (startAddr + cursorHoriz+(cursorVert * HORIZ_CHARS)) mod CHARS_PER_SCREEN;

	sync <= vSync and hSync; -- composite sync for mono video out	
	
	-- SCREEN RENDERING
	
	process (clk)
	begin
		if falling_edge(clk) then

			if horizCount < CLOCKS_PER_SCANLINE then
				horizCount <= horizCount + 1;
				if (horizCount < DISPLAY_LEFT_CLOCK) or (horizCount > (DISPLAY_LEFT_CLOCK + HORIZ_CHARS*CLOCKS_PER_PIXEL*8)) then
					hActive <= '0';
					pixelClockCount <= (others => '0');
					charHoriz <= 0;
				else
					hActive <= '1';
				end if;
			else
				horizCount<= (others => '0');
				pixelCount<= (others => '0');
				charHoriz<= 0;
				if vertLineCount > (VERT_SCANLINES-1) then
					vertLineCount <= (others => '0');
				else
					if vertLineCount < DISPLAY_TOP_SCANLINE or vertLineCount > (DISPLAY_TOP_SCANLINE + 8 * VERT_PIXEL_SCANLINES * VERT_CHARS - 1) then
						vActive <= '0';
						charVert <= 0;
						charScanLine <= (others => '0');
					else
						vActive <= '1';
						if charScanLine = (VERT_PIXEL_SCANLINES*8-1) then
							charScanLine <= (others => '0');
							charVert <= charVert+1;
						else
							if vertLineCount /= DISPLAY_TOP_SCANLINE then
								charScanLine <= charScanLine+1;
							end if;
						end if;
					end if;
					vertLineCount <=vertLineCount+1;
				end if;
			end if;
			if horizCount < HSYNC_CLOCKS then
				hSync <= H_SYNC_ACTIVE;
			else
				hSync <= not H_SYNC_ACTIVE;
			end if;
			if vertLineCount < VSYNC_SCANLINES then
				vSync <= V_SYNC_ACTIVE;
			else
				vSync <= not V_SYNC_ACTIVE;
			end if;
			
			if hActive='1' and vActive = '1' then
				if pixelClockCount <(CLOCKS_PER_PIXEL-1) then
					pixelClockCount <= pixelClockCount+1;
				else
					if cursorOn = '1' and cursorVert = charVert and cursorHoriz = charHoriz and charScanLine = (VERT_PIXEL_SCANLINES*8-1) then
					   -- Cursor (use current colour because cursor cell not yet written to)
						if dispAttData(3)='1' then -- BRIGHT
							videoR0 <= dispAttWRData(0);
							videoG0 <= dispAttWRData(1);
							videoB0 <= dispAttWRData(2);
						else
							videoR0 <= '0';
							videoG0 <= '0';
							videoB0 <= '0';
						end if;
						videoR1 <= dispAttWRData(0);
						videoG1 <= dispAttWRData(1);
						videoB1 <= dispAttWRData(2);
						
						video <= '1'; -- Monochrome video out
					else
						if charData(7-to_integer(unsigned(pixelCount))) = '1' then
						-- Foreground
							if dispAttData (3 downto 0) = "1000" then -- special case = GREY
								videoR0 <= '1';
								videoG0 <= '1';
								videoB0 <= '1';
								videoR1 <= '0';
								videoG1 <= '0';
								videoB1 <= '0';
							else
								if dispAttData(3)='1' then -- BRIGHT
									videoR0 <= dispAttData(0);
									videoG0 <= dispAttData(1);
									videoB0 <= dispAttData(2);
								else
									videoR0 <= '0';
									videoG0 <= '0';
									videoB0 <= '0';
								end if;
								videoR1 <= dispAttData(0);
								videoG1 <= dispAttData(1);
								videoB1 <= dispAttData(2);
							end if;
						else
						-- Background
							if dispAttData (7 downto 4) = "1000" then -- special case = GREY
								videoR0 <= '1';
								videoG0 <= '1';
								videoB0 <= '1';
								videoR1 <= '0';
								videoG1 <= '0';
								videoB1 <= '0';
							else
								if dispAttData(7)='1' then -- BRIGHT
									videoR0 <= dispAttData(4);
									videoG0 <= dispAttData(5);
									videoB0 <= dispAttData(6);
								else
									videoR0 <= '0';
									videoG0 <= '0';
									videoB0 <= '0';
								end if;
								videoR1 <= dispAttData(4);
								videoG1 <= dispAttData(5);
								videoB1 <= dispAttData(6);
							end if;
						end if;
						video <= charData(7-to_integer(unsigned(pixelCount))); -- Monochrome video out
					end if;
					pixelClockCount <= (others => '0');
					if pixelCount = 7 then
						charHoriz <= charHoriz+1;
					end if;
					pixelCount <= pixelCount+1;
				end if;
			else
				videoR0 <= '0';
				videoG0 <= '0';
				videoB0 <= '0';
				videoR1 <= '0';
				videoG1 <= '0';
				videoB1 <= '0';
				
				video <= '0'; -- Monochrome video out
			end if;
		end if;
	end process;	
 
	
	-- Hardware cursor blink
	process (clk)
	begin
		if rising_edge(clk) then
			if cursBlinkCount < 49999999 then
				cursBlinkCount <= cursBlinkCount + 1;
			else
				cursBlinkCount <= (others=>'0');
			end if;
			if cursBlinkCount < 25000000 then
				cursorOn <= '0';
			else
				cursorOn <= '1';
			end if;
		end if;
	end process;	

	
	-- minimal 6850 compatibility
	statusReg(0) <= '0' when kbInPointer=kbReadPointer else '1';
	statusReg(1) <= '1' when dispByteWritten=dispByteSent else '0';
	statusReg(2) <= '0'; --n_dcd;
	statusReg(3) <= '0'; --n_cts;
	statusReg(7) <= not(n_int_internal);
	  
	-- interrupt mask
	n_int <= n_int_internal;
	n_int_internal <= '0' when (kbInPointer /= kbReadPointer) and controlReg(7)='1'
	         else '0' when (dispByteWritten=dispByteSent) and controlReg(6)='0' and controlReg(5)='1'
				else '1';

	kbBuffCount <= 0 + kbInPointer - kbReadPointer when kbInPointer >= kbReadPointer
		else 8 + kbInPointer - kbReadPointer;
	n_rts <= '1' when kbBuffCount > 4 else '0';	

	process( n_rd )
	begin
		if falling_edge(n_rd) then -- Standard CPU - present data on leading edge of rd
			if regSel='1' then
				dataOut <= '0' & kbBuffer(kbReadPointer);
				if kbInPointer /= kbReadPointer then
					if kbReadPointer < 7 then
						kbReadPointer <= kbReadPointer+1;
					else
						kbReadPointer <= 0;
					end if;
				end if;
			else
				dataOut <= statusReg;
			end if;
		end if;
	end process;

	process( n_wr )
	begin
		if rising_edge(n_wr) then -- Standard CPU - capture data on trailing edge of wr
			if regSel='1' then
				if dispByteWritten=dispByteSent then
					dispByteWritten <= not dispByteWritten;
					dispByteLatch <= dataIn;
				end if;
			else
				controlReg <= dataIn;
			end if;
		end if;
	end process;


	-- PROCESS DATA FROM PS2 KEYBOARD

	ps2Data <= ps2DataOut when ps2DataOut='0' else 'Z';
	ps2Clk <= ps2ClkOut when ps2ClkOut='0' else 'Z';

	-- PS2 clock de-glitcher - important because the FPGA is very sensistive
	-- Filtered clock will not switch low to high until there is 50 more high samples than lows
	-- hysteresis will then not switch high to low until there is 50 more low samples than highs.
	-- Introduces a minor (1uS) delay with 50MHz clock

	process (clk)
	begin
		if falling_edge(clk) then
			if ps2Clk = '1' and ps2ClkFilter=50 then
				ps2ClkFiltered <= '1';
			end if;
			if ps2Clk = '1' and ps2ClkFilter /= 50 then
				ps2ClkFilter <= ps2ClkFilter+1;
			end if;
			if ps2Clk = '0' and ps2ClkFilter=0 then
				ps2ClkFiltered <= '0';
			end if;
			if ps2Clk = '0' and ps2ClkFilter/=0 then
				ps2ClkFilter <= ps2ClkFilter-1;
			end if;
		end if;
	end process;
	
	process( clk )
	-- 11 bits
	-- start(0) b0 b1 b2 b3 b4 b5 b6 b7 parity(odd) stop(1)
	begin
		if falling_edge(clk) then

			ps2PrevClk <= ps2ClkFiltered;

			if n_kbWR = '0' and kbWriteTimer<25000 then
				ps2WriteClkCount<= 0;
				kbWRParity <= '1';
				kbWriteTimer<=kbWriteTimer+1;
				-- wait
			elsif n_kbWR = '0' and kbWriteTimer<50000 then
				ps2ClkOut <= '0';
				kbWriteTimer<=kbWriteTimer+1;
			elsif n_kbWR = '0' and kbWriteTimer<75000 then
				ps2DataOut <= '0';
				kbWriteTimer<=kbWriteTimer+1;
			elsif n_kbWR = '0' and kbWriteTimer=75000 then
				ps2ClkOut <= '1';
				kbWriteTimer<=kbWriteTimer+1;
			elsif n_kbWR = '0' and kbWriteTimer<76000 then
				kbWriteTimer<=kbWriteTimer+1;
			elsif  n_kbWR = '1' and ps2PrevClk = '1' and ps2ClkFiltered='0' then -- start of high-to-low cleaned ps2 clock
				kbWatchdogTimer<=0;
				if ps2ClkCount=0 then -- start
					ps2Byte <= (others =>'0');
					ps2ClkCount<=ps2ClkCount+1;
				elsif ps2ClkCount<9 then -- data
					ps2Byte <= ps2Data & ps2Byte(7 downto 1);
					ps2ClkCount<=ps2ClkCount+1;
				elsif ps2ClkCount=9 then -- parity - use this time to decode
					if (ps2Byte<132) then
						if ps2Shift='0' then
							ps2ConvertedByte <= kbUnshifted (to_integer(unsigned(ps2Byte)));
						else
							ps2ConvertedByte <= kbShifted (to_integer(unsigned(ps2Byte)));
						end if;
					else
						ps2ConvertedByte <= (others => '0');
					end if;
					ps2ClkCount<=ps2ClkCount+1;
				else -- stop bit - use this time to store
					-- F-keys
					if ps2ConvertedByte>x"10" and ps2ConvertedByte<x"1D" then
						if ps2PreviousByte /= x"F0" then
							FNtoggledKeysSig(to_integer(unsigned(ps2ConvertedByte))-16#10#) <= FNtoggledKeysSig(to_integer(unsigned(ps2ConvertedByte))-16#10#);
							FNKeysSig(to_integer(unsigned(ps2ConvertedByte))-16#10#) <= '1';
						else
							FNKeysSig(to_integer(unsigned(ps2ConvertedByte))-16#10#) <= '0';
						end if;
					-- SHIFT
					elsif ps2Byte = x"12" or ps2Byte=x"59" then
						if ps2PreviousByte /= x"F0" then
							ps2Shift <= '1';
						else
							ps2Shift <= '0';
						end if;
					-- CTRL
					elsif ps2Byte = x"14" then
						if ps2PreviousByte /= x"F0" then
							ps2Ctrl <= '1';
						else
							ps2Ctrl <= '0';
						end if;
					-- SCROLL, CAPS AND NUM
					elsif ps2Byte = x"AA" then
							ps2WriteByte <= x"ED";
							ps2WriteByte2(0) <= ps2Scroll;
							ps2WriteByte2(1) <= ps2Num;
							ps2WriteByte2(2) <= ps2Caps;
							ps2WriteByte2(7 downto 3) <= "00000";
							n_kbWR <= '0';
							kbWriteTimer<=0;
					elsif ps2Byte = x"7E" then
						if ps2PreviousByte /= x"F0" then
							ps2Scroll <= not ps2Scroll;
							ps2WriteByte <= x"ED";
							ps2WriteByte2(0) <= not ps2Scroll;
							ps2WriteByte2(1) <= ps2Num;
							ps2WriteByte2(2) <= ps2Caps;
							ps2WriteByte2(7 downto 3) <= "00000";
							n_kbWR <= '0';
							kbWriteTimer<=0;
						end if;
					elsif ps2Byte = x"77" then
						if ps2PreviousByte /= x"F0" then
							ps2Num <= not ps2Num;
							ps2WriteByte <= x"ED";
							ps2WriteByte2(0) <= ps2Scroll;
							ps2WriteByte2(1) <= not ps2Num;
							ps2WriteByte2(2) <= ps2Caps;
							ps2WriteByte2(7 downto 3) <= "00000";
							n_kbWR <= '0';
							kbWriteTimer<=0;
						end if;
					elsif ps2Byte = x"58" then
						if ps2PreviousByte /= x"F0" then
							ps2Caps <= not ps2Caps;
							ps2WriteByte <= x"ED";
							ps2WriteByte2(0) <= ps2Scroll;
							ps2WriteByte2(1) <= ps2Num;
							ps2WriteByte2(2) <= not ps2Caps;
							ps2WriteByte2(7 downto 3) <= "00000";
							n_kbWR <= '0';
							kbWriteTimer<=0;
						end if;
					-- ACK
					elsif ps2Byte = x"FA" then
						if ps2WriteByte /= x"FF" then
							n_kbWR <= '0';
							kbWriteTimer<=0;
						end if;
					-- ASCII CHARACTER
					elsif (ps2PreviousByte /= x"F0") and (ps2ConvertedByte /= x"00") then
						if ps2PreviousByte = x"E0" and ps2Byte = x"71" then -- DELETE
							kbBuffer(kbInPointer) <= "1111111"; -- 7F
						elsif ps2Ctrl = '1' then
							kbBuffer(kbInPointer) <= "00" & ps2ConvertedByte(4 downto 0);
						elsif ps2ConvertedByte > x"40" and ps2ConvertedByte < x"5B" and ps2Caps='1' then
							kbBuffer(kbInPointer) <= ps2ConvertedByte or "0100000";
						elsif ps2ConvertedByte > x"60" and ps2ConvertedByte < x"7B" and ps2Caps='1' then
							kbBuffer(kbInPointer) <= ps2ConvertedByte and "1011111";
						else
							kbBuffer(kbInPointer) <= ps2ConvertedByte;
						end if;
						if kbInPointer < 7 then
							kbInPointer <= kbInPointer+1;
						else
							kbInPointer <= 0;
						end if;
					end if;
					ps2PreviousByte<=ps2Byte;
					ps2ClkCount<=0;
				end if;

			-- write to keyboard
			elsif  n_kbWR = '0' and ps2PrevClk = '1' and  ps2ClkFiltered='0' then -- start of high-to-low cleaned ps2 clock
				kbWatchdogTimer<=0;
				if ps2WriteClkCount <8 then
					if (ps2WriteByte(ps2WriteClkCount)='1') then
						ps2DataOut <= '1';
						kbWRParity <= not kbWRParity;
					else
						ps2DataOut <= '0';
					end if;
					ps2WriteClkCount<=ps2WriteClkCount+1;
				elsif ps2WriteClkCount = 8 then
					ps2DataOut <= kbWRParity;
					ps2WriteClkCount<=ps2WriteClkCount+1;
				elsif ps2WriteClkCount = 9 then
					ps2WriteClkCount<=ps2WriteClkCount+1;
					ps2DataOut <= '1';
				elsif ps2WriteClkCount = 10 then
					ps2WriteByte <= ps2WriteByte2;
					ps2WriteByte2 <= x"FF";
					n_kbWR<= '1';
					ps2WriteClkCount <= 0;
					ps2DataOut <= '1';

				end if;
			else
				-- COMMUNICATION ERROR
				-- if no edge then increment the timer
				-- if a large time has elapsed since the last pulse was read then
				-- re-sync the keyboard
				if kbWatchdogTimer>30000000 then
					kbWatchdogTimer<=0;
					ps2ClkCount<=0;
					if n_kbWR = '0' then
							ps2WriteByte <= x"ED";
							ps2WriteByte2(0) <= ps2Scroll;
							ps2WriteByte2(1) <= ps2Num;
							ps2WriteByte2(2) <= ps2Caps;
							ps2WriteByte2(7 downto 3) <= "00000";
							kbWriteTimer<=0;
					end if;
				else
					kbWatchdogTimer<=kbWatchdogTimer+1;				
				end if;
			end if;

		end if;
	end process;


	-- PROCESS DATA WRITTEN TO DISPLAY
	
	process( clk , n_reset)
	begin
	
		if n_reset='0' then
			dispAttWRData <= DEFAULT_ATT;
		elsif falling_edge(clk) then
			case dispState is
			when idle =>
				if (nextState/=processingAdditionalParams) and (dispByteWritten /= dispByteSent) then
					dispCharWRData <= dispByteLatch;
					dispByteSent <= not dispByteSent;
				end if;
				if (dispByteWritten /= dispByteSent) or (nextState=processingAdditionalParams) then
					if dispByteLatch = x"07" then -- BEEP
						-- do nothing - ignore
					elsif dispByteLatch = x"1B" then -- ESC
						paramCount<=0;
						param1<=0;
						param2<=0;
						param3<=0;
						param4<=0;
						nextState<= waitForLeftBracket;
					elsif nextState=waitForLeftBracket and dispByteLatch=x"5B" then-- ESC[
						nextState<= processingParams;
						paramCount<=1;
					elsif paramCount=1 and dispByteLatch=x"48" and param1=0 then -- ESC[H
						cursorVert <= 0;
						cursorHoriz <= 0;
						paramCount<=0;
					elsif paramCount=1 and dispByteLatch=x"4B" and param1=0 then -- ESC[K - erase EOL
						dispState <= clearLine;
						paramCount<=0;
					elsif paramCount=1 and dispByteLatch=x"73" and param1=0 then -- ESC[s - save cursor pos
						savedCursorHoriz <= cursorHoriz;
						savedCursorVert <= cursorVert;
						paramCount<=0;
					elsif paramCount=1 and dispByteLatch=x"75" and param1=0 then -- ESC[u - restore cursor pos
						cursorHoriz <= savedCursorHoriz;
						cursorVert <= savedCursorVert;
						paramCount<=0;
					elsif paramCount>0 and dispByteLatch=x"3B" then-- ESC[{param1};{param2}...
						paramCount<=paramCount+1;
					elsif paramCount>0 and dispByteLatch>x"2F" and dispByteLatch<x"3A" then -- numeric
						if paramCount=1 then -- ESC[{param1}
							param1 <= param1 * 10 + (to_integer(unsigned(dispByteLatch))-48);
						elsif paramCount=2 then -- ESC[{param1};{param2}
							param2 <= param2 * 10 + (to_integer(unsigned(dispByteLatch))-48);
						elsif paramCount=3 then -- ESC[{param1};{param2};{param3}
							param3 <= param3 * 10 + (to_integer(unsigned(dispByteLatch))-48);
						elsif paramCount=4 then -- ESC[{param1};{param2};{param3};{param4}
							param4 <= param4 * 10 + (to_integer(unsigned(dispByteLatch))-48);
						end if;
					elsif paramCount=1 and param1=2 and dispByteLatch=x"4A" then-- ESC[2J - clear screen
						cursorVert <= 0;
						cursorHoriz <= 0;
						cursorVertRestore <= 0;
						cursorHorizRestore <= 0;
						dispState <= clearScreen;
						paramCount<=0;
					elsif paramCount=1 and param1=0 and dispByteLatch=x"4A" then-- ESC[0J or ESC[J - clear from cursor to end of screen
						cursorVertRestore <= cursorVert;
						cursorHorizRestore <= cursorHoriz;
						dispState <= clearScreen;
						paramCount<=0;
					elsif paramCount =1 and dispByteLatch=x"4C" then-- ESC[L - insert line
						cursorVertRestore <= cursorVert;
						cursorHorizRestore <= cursorHoriz;
						cursorHoriz <= HORIZ_CHAR_MAX;
						cursorVert <= VERT_CHAR_MAX-1;
						dispState <= insertLine;
						paramCount<=0;
					elsif paramCount =1 and dispByteLatch=x"4D" then-- ESC[M - delete line
						cursorVertRestore <= cursorVert;
						cursorHorizRestore <= cursorHoriz;
						cursorHoriz <= 0;
						cursorVert <= cursorVert+1;
						dispState <= deleteLine;
						paramCount<=0;
					elsif paramCount>0 and dispByteLatch=x"6D" then-- ESC[{param1}m or ESC[{param1};{param2}m- set graphics rendition
						if param1 = 0 then
							attInverse <= '0';
							attBold <= ANSI_DEFAULT_ATT(3);
							dispAttWRData <= ANSI_DEFAULT_ATT;
						end if;
						if param1 = 1 then
							attBold <= '1';
--							if attInverse='0' then
								dispAttWRData(3) <= '1';
--							else
--								dispAttWRData(7) <= '1';
--							end if;
						end if;
						if param1 = 22 then
							attBold <= '0';
--							if attInverse='0' then
								dispAttWRData(3) <= '0';
--							else
--								dispAttWRData(7) <= '0';
--							end if;
						end if;
						if param1 = 7 then
							if attInverse = '0' then
								attInverse <= '1';
								dispAttWRData(7 downto 4) <= dispAttWRData(3 downto 0);
								dispAttWRData(3 downto 0) <= dispAttWRData(7 downto 4);
							end if;
						end if;
						if param1 = 27 then
							if attInverse = '1' then
								attInverse <= '0';
								dispAttWRData(7 downto 4) <= dispAttWRData(3 downto 0);
								dispAttWRData(3 downto 0) <= dispAttWRData(7 downto 4);
							end if;
						end if;
						if param1 > 29 and param1 < 38 then
							if attInverse = '0' then
								dispAttWRData(2 downto 0) <=std_logic_vector(to_unsigned(param1-30,3));
								dispAttWRData(3) <= attBold;
							else
								dispAttWRData(6 downto 4) <=std_logic_vector(to_unsigned(param1-30,3));
								dispAttWRData(7) <= attBold;
							end if;
						end if;
						if param1 > 39 and param1 < 48 then
							if attInverse = '0' then
								dispAttWRData(6 downto 4) <=std_logic_vector(to_unsigned(param1-40,3));
								dispAttWRData(7) <= attBold;
							else
								dispAttWRData(2 downto 0) <=std_logic_vector(to_unsigned(param1-40,3));
								dispAttWRData(3) <= attBold;
							end if;
						end if;
						if param1 > 89 and param1 < 98 then
							if attInverse = '0' then
								dispAttWRData(2 downto 0) <=std_logic_vector(to_unsigned(param1-90,3));
								dispAttWRData(3) <= '1';
							else
								dispAttWRData(6 downto 4) <=std_logic_vector(to_unsigned(param1-90,3));
								dispAttWRData(7) <= '1';
							end if;
						end if;
						if param1 > 99 and param1 < 108 then
							if attInverse = '0' then
								dispAttWRData(6 downto 4) <=std_logic_vector(to_unsigned(param1-100,3));
								dispAttWRData(7) <= '1';
							else
								dispAttWRData(2 downto 0) <=std_logic_vector(to_unsigned(param1-100,3));
								dispAttWRData(3) <= '1';
							end if;
						end if;
						-- allow for second parameter - must process individually and in sequence
						if paramCount>1 then
							param1 <= param2;
							param2 <= param3;
							param3 <= param4;
							paramCount<=paramCount-1;
							nextState <= processingAdditionalParams;
						else
							paramCount<=0;
							nextState <= none;
						end if;
					elsif paramCount=1 and dispByteLatch=x"41" then-- ESC[{param1}A - Cursor up
						if  param1=0 and cursorVert>0 then -- no param to default to 1
							cursorVert<=cursorVert-1;
						elsif  param1<cursorVert then
							cursorVert<=cursorVert-param1;
						else
							cursorVert<=0;
						end if;
						paramCount<=0;
					elsif paramCount=1 and dispByteLatch=x"42" then-- ESC[{param1}B - Cursor down
						if  param1=0 and cursorVert<VERT_CHAR_MAX then -- no param to default to 1
							cursorVert<=cursorVert+1;
						elsif (cursorVert+param1)<VERT_CHAR_MAX then
							cursorVert<=cursorVert+param1;
						else
							cursorVert<=VERT_CHAR_MAX;
						end if;
						paramCount<=0;
					elsif paramCount=1 and dispByteLatch=x"43" then-- ESC[{param1}C - Cursor forward
						if  param1=0 and cursorHoriz<HORIZ_CHAR_MAX then -- no param to default to 1
							cursorHoriz<=cursorHoriz+1;
						elsif (cursorHoriz+param1)<HORIZ_CHAR_MAX then
							cursorHoriz<=cursorHoriz+param1;
						else
							cursorHoriz<=HORIZ_CHAR_MAX;
						end if;
						paramCount<=0;
					elsif paramCount=1 and dispByteLatch=x"44" then-- ESC[{param1}D - Cursor backward
						if  param1=0 and cursorHoriz>0 then -- no param to default to 1
							cursorHoriz<=cursorHoriz-1;
						elsif param1<cursorHoriz then
							cursorHoriz<=cursorHoriz-param1;
						else
							cursorHoriz <= 0;
						end if;
						paramCount<=0;
					elsif paramCount=2 and dispByteLatch=x"48" then -- ESC[{param1};{param2}H
						if param1<1 then
							cursorVert <= 0;
						elsif param1>VERT_CHARS then
							cursorVert <= VERT_CHARS-1;
						else
							cursorVert <= param1-1;
						end if;
						if param2<0 then
							cursorHoriz <= 0;
						elsif param2>HORIZ_CHARS then
							cursorHoriz <= HORIZ_CHARS-1;
						else
							cursorHoriz <= param2-1;
						end if;
						paramCount<=0;
					else
						dispState <= dispWrite;
						nextState <= none;
						paramCount<=0;
					end if;
				end if;
			when dispWrite =>
				if dispCharWRData=13 then
					cursorHoriz <= 0;
					dispState<=idle;
				elsif dispCharWRData=10 then
					if cursorVert<VERT_CHAR_MAX then
						cursorVert <= cursorVert+1;
						dispState<=idle;
					else
						if startAddr < (CHARS_PER_SCREEN - HORIZ_CHARS) then
							startAddr <= startAddr + HORIZ_CHARS;
						else
							startAddr <= 0;
						end if;
						cursorHorizRestore <= cursorHoriz;
						cursorVertRestore <= cursorVert;
						dispState<=clearLine;
					end if;
				elsif dispCharWRData=12 then
					cursorVert <= 0;
					cursorHoriz <= 0;
					cursorHorizRestore <= 0;
					cursorVertRestore <= 0;
					dispState<=clearScreen;
				elsif dispCharWRData=8 or dispCharWRData=127 then
					if cursorHoriz>0 then
						cursorHoriz <= cursorHoriz-1;
					elsif cursorHoriz=0 and cursorVert>0 then
						cursorHoriz <=HORIZ_CHAR_MAX;
						cursorVert <= cursorVert-1;
					end if;
					dispState<=clearChar;
				else
					dispWR <= '1';
					dispState<=dispNextLoc;
				end if;
			when dispNextLoc =>
				dispWR <= '0';
				if (cursorHoriz<HORIZ_CHAR_MAX) then
					cursorHoriz<=cursorHoriz+1;
					dispState <=idle;
				else
					cursorHoriz <= 0;
					if cursorVert<VERT_CHAR_MAX then
						cursorVert <= cursorVert+1;
						dispState <=idle;
					else
						if startAddr < (CHARS_PER_SCREEN - HORIZ_CHARS) then
							startAddr <= startAddr + HORIZ_CHARS;
						else
							startAddr <= 0;
						end if;
						cursorHorizRestore <= 0;
						cursorVertRestore <= cursorVert;
						dispState<=clearLine;
					end if;
				end if;
			when clearLine =>
				dispCharWRData <= x"20";
				dispWR <= '1';
				dispState <= clearL2;
			when clearL2 =>
				dispWR <= '0';
				if (cursorHoriz<HORIZ_CHAR_MAX) then
					cursorHoriz<=cursorHoriz+1;
					dispState <= clearLine;
				else
					cursorHoriz<=cursorHorizRestore;
					cursorVert<=cursorVertRestore;
					dispState<=idle;
				end if;
			when clearChar =>
				dispCharWRData <= x"20";
				dispWR <= '1';
				dispState <= clearC2;
			when clearC2 =>
				dispWR <= '0';
				dispState<=idle;
			when clearScreen =>
				dispCharWRData <= x"20";
				dispWR <= '1';
				dispState <= clearS2;
			when clearS2 =>
				dispWR <= '0';
				if (cursorHoriz<HORIZ_CHAR_MAX) then
					cursorHoriz<=cursorHoriz+1;
					dispState <= clearScreen;
				else
					if (cursorVert<VERT_CHAR_MAX) then
						cursorHoriz<=0;
						cursorVert<=cursorVert+1;
						dispState<=clearScreen;
					else
						cursorHoriz<=cursorHorizRestore;
						cursorVert<=cursorVertRestore;
						dispState<=idle;
					end if;
				end if;
			when insertLine =>
				dispCharWRData <= dispCharRDData;
				dispAttWRData <= dispAttRDData;
				cursorVert <= cursorVert+1;
				dispState <= ins2;
			when ins2 =>
				dispWR <= '1';
				dispState <= ins3;
			when ins3 =>
				dispWR <= '0';
				if cursorHoriz = 0 and cursorVert = cursorVertRestore+1 then
					cursorVert <= cursorVertRestore;
					dispState <= clearLine;
				elsif cursorHoriz>0 then
					cursorHoriz <= cursorHoriz-1;
					cursorVert <= cursorVert-1;
					dispState <= insertLine;
				else
					cursorHoriz <= HORIZ_CHAR_MAX;
					cursorVert <= cursorVert-2;
					dispState <= insertLine;
				end if;
			when deleteLine =>
				dispCharWRData <= dispCharRDData;
				dispAttWRData <= dispAttRDData;
				cursorVert <= cursorVert-1;
				dispState <= del2;
			when del2 =>
				dispWR <= '1';
				dispState <= del3;
			when del3 =>
				dispWR <= '0';
				if cursorHoriz = HORIZ_CHAR_MAX and cursorVert = VERT_CHAR_MAX-1 then
					cursorHoriz <= 0;
					cursorVert <= VERT_CHAR_MAX;
					dispState <= clearLine;
				elsif cursorHoriz<HORIZ_CHAR_MAX then
					cursorHoriz <= cursorHoriz+1;
					cursorVert <= cursorVert+1;
					dispState <= deleteLine;
				else
					cursorHoriz <= 0;
					cursorVert <= cursorVert+2;
					dispState <= deleteLine;
				end if;
			end case;
		end if;              
	end process;
	
 end rtl;
