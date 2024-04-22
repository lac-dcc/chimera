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
		constant EXTENDED_CHARSET : integer := 1; -- 1 = 256 chars, 0 = 128 chars
		constant COLOUR_ATTS_ENABLED : integer := 1; -- 1=Colour for each character, 0=Colour applied to whole display
		-- VGA 640x480 Default values
		constant VERT_CHARS : integer := 25;
		constant HORIZ_CHARS : integer := 80;
		constant CLOCKS_PER_SCANLINE : integer := 1600; -- NTSC/PAL = 3200
		constant DISPLAY_TOP_SCANLINE : integer := 35+40;
--		constant DISPLAY_LEFT_CLOCK : integer := 288; -- NTSC/PAL = 600+
		constant DISPLAY_LEFT_CLOCK : integer := 298; -- NTSC/PAL = 600+
		constant VERT_SCANLINES : integer := 525; -- NTSC=262, PAL=312
		constant VSYNC_SCANLINES : integer := 2; -- NTSC/PAL = 4
		constant HSYNC_CLOCKS : integer := 192;  -- NTSC/PAL = 235
		constant VERT_PIXEL_SCANLINES : integer := 2;
		constant CLOCKS_PER_PIXEL : integer := 2; -- min = 2
		constant H_SYNC_ACTIVE : std_logic := '0';
		constant V_SYNC_ACTIVE : std_logic := '0';

		constant DEFAULT_ATT : std_logic_vector(7 downto 0) := "00001111"; -- background iBGR | foreground iBGR (i=intensity)
		constant ANSI_DEFAULT_ATT : std_logic_vector(7 downto 0) := "00001111"; -- background iBGR | foreground iBGR (i=intensity)
		constant SANS_SERIF_FONT : integer := 1 -- 0 => use conventional CGA font, 1 => use san serif font
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
		FNkeys			: out std_logic_vector(12 downto 0);
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

	signal	func_reset: std_logic := '0';

	signal	vActive   : std_logic := '0';
	signal	hActive   : std_logic := '0';

	signal	pixelClockCount: std_logic_vector(3 DOWNTO 0);
	signal	pixelCount: std_logic_vector(2 DOWNTO 0);

	signal	horizCount: std_logic_vector(11 DOWNTO 0);
	signal	vertLineCount: std_logic_vector(9 DOWNTO 0);

	signal	charVert: integer range 0 to VERT_CHAR_MAX; --unsigned(4 DOWNTO 0);
	signal	charScanLine: std_logic_vector(3 DOWNTO 0);

-- functionally this only needs to go to HORIZ_CHAR_MAX. However, at the end of a line
-- it goes 1 beyond in the hblank time. It could be avoided but it's fiddly with no
-- benefit. Without the +1 the design synthesises and works fine but gives a fatal
-- error in RTL simulation when the signal goes out of range.
	signal	charHoriz: integer range 0 to 1+HORIZ_CHAR_MAX; --unsigned(6 DOWNTO 0);
	signal	charBit: std_logic_vector(3 DOWNTO 0);

	-- top left-hand corner of the display is 0,0 aka "home".
	signal	cursorVert: integer range 0 to VERT_CHAR_MAX :=0;
	signal	cursorHoriz: integer range 0 to HORIZ_CHAR_MAX :=0;

	-- save cursor position during erase-to-end-of-screen etc.
	signal	cursorVertRestore: integer range 0 to VERT_CHAR_MAX :=0;
	signal	cursorHorizRestore: integer range 0 to HORIZ_CHAR_MAX :=0;

	-- save cursor position during ESC[s...ESC[u sequence
	signal	savedCursorVert: integer range 0 to VERT_CHAR_MAX :=0;
	signal	savedCursorHoriz: integer range 0 to HORIZ_CHAR_MAX :=0;

	signal	startAddr: integer range 0 to CHARS_PER_SCREEN;
	signal 	cursAddr : integer range 0 to CHARS_PER_SCREEN;

	signal 	dispAddr : integer range 0 to CHARS_PER_SCREEN;
	signal 	charAddr : std_logic_vector(10 downto 0);

	signal	dispCharData : std_logic_vector(7 downto 0);
	signal	dispCharWRData : std_logic_vector(7 downto 0);
	signal	dispCharRDData : std_logic_vector(7 downto 0);

	signal	dispAttData : std_logic_vector(7 downto 0);
	signal	dispAttWRData : std_logic_vector(7 downto 0):=DEFAULT_ATT; -- iBGR(back) iBGR(text)
	signal	dispAttRDData : std_logic_vector(7 downto 0);

	signal	charData : std_logic_vector(7 downto 0);

	signal	cursorOn : std_logic := '1';
	signal	dispWR : std_logic := '0';
	signal	cursBlinkCount : unsigned(25 downto 0);
	signal	kbWatchdogTimer : integer range 0 to 50000000 :=0;
	signal	kbWriteTimer : integer range 0 to 50000000 :=0;

	signal	n_int_internal   : std_logic := '1';
	signal	statusReg : std_logic_vector(7 downto 0) := (others => '0');
	signal	controlReg : std_logic_vector(7 downto 0) := "00000000";

	type	kbBuffArray is array (0 to 7) of std_logic_vector(6 downto 0);
	signal	kbBuffer : kbBuffArray;

	signal	kbInPointer: integer range 0 to 15 :=0;   -- registered on clk
	signal	kbReadPointer: integer range 0 to 15 :=0; -- registered on n_rd
	signal	kbBuffCount: integer range 0 to 15 :=0;   -- combinational
	signal	dispByteWritten : std_logic := '0';
	signal	dispByteSent : std_logic := '0';

	signal	dispByteLatch: std_logic_vector(7 DOWNTO 0);
	type	dispStateType is ( idle, dispWrite, dispNextLoc, clearLine, clearL2,
						clearScreen, clearS2, clearChar, clearC2, insertLine, ins2, ins3, deleteLine, del2, del3);
	signal	dispState : dispStateType :=idle;
	type	escStateType is ( none, waitForLeftBracket, processingParams, processingAdditionalParams );
	signal	escState : escStateType :=none;

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

	-- "globally static" versions of signals for use within generate
        -- statements below. Without these intermediate signals the simulator
        -- reports an error (even though the design synthesises OK)
	signal	cursAddr_xx: std_logic_vector(10 downto 0);
	signal	dispAddr_xx: std_logic_vector(10 downto 0);

	type	kbDataArray is array (0 to 131) of std_logic_vector(6 downto 0);

	-- the ASCII codes are expressed in HEX and therefore are 8-bit.
	-- However, the MSB is always 0 so we don't want to store the MSB. This
	-- function allows us to express the codes here as pairs of hex digits,
	-- for readability, but truncates the value to return 7 bits for the
	-- hardware implementation.
	function t (
	  val: std_logic_vector(7 downto 0)
	  ) return std_logic_vector is
	begin
	  return val(6 downto 0);
	end t;

	-- scan-code-to-ASCII for UK KEYBOARD MAPPING (except for shift-3 = "#")
	-- Read it like this: row 4,col 9 represents scan code 0x49. From a map
	-- of the PS/2 keyboard scan codes this is the ". >" key so the unshifted
	-- table as has 0x2E (ASCII .) and the shifted table has 0x3E (ASCII >)
	-- Do not need a lookup for CTRL because this is simply the ASCII code
	-- with bits 6,5 cleared.
	-- A value of 0 represents either an unused keycode or a keycode like
	-- SHIFT that is processed separately (not looked up in the table).
	-- The FN keys do not generate ASCII values to the virtual UART here.
	-- Rather, they are used to generate direct output signals. The key
	-- codes in the table for the function keys are the values 0x11-0x1C
	-- which cannot be generated directly by any keypress and so do not
	-- conflict with normal operation.

	constant kbUnshifted : kbDataArray :=
	(
	--  0        1        2        3        4        5        6        7        8        9        A        B        C        D        E        F
	--       F9                F5       F3       F1       F2       F12               F10      F8       F6       F4       TAB      `
	t(x"00"),t(x"19"),t(x"00"),t(x"15"),t(x"13"),t(x"11"),t(x"12"),t(x"1C"),t(x"00"),t(x"1A"),t(x"18"),t(x"16"),t(x"14"),t(x"09"),t(x"60"),t(x"00"), -- 0
	--       l-ALT    l-SHIFT           l-CTRL   q        1                                   z        s        a        w        2
	t(x"00"),t(x"00"),t(x"00"),t(x"00"),t(x"00"),t(x"71"),t(x"31"),t(x"00"),t(x"00"),t(x"00"),t(x"7A"),t(x"73"),t(x"61"),t(x"77"),t(x"32"),t(x"00"), -- 1
	--       c        x        d        e        4        3                          SPACE    v        f        t        r        5
	t(x"00"),t(x"63"),t(x"78"),t(x"64"),t(x"65"),t(x"34"),t(x"33"),t(x"00"),t(x"00"),t(x"20"),t(x"76"),t(x"66"),t(x"74"),t(x"72"),t(x"35"),t(x"00"), -- 2
	--       n        b        h        g        y        6                                   m        j        u        7        8
	t(x"00"),t(x"6E"),t(x"62"),t(x"68"),t(x"67"),t(x"79"),t(x"36"),t(x"00"),t(x"00"),t(x"00"),t(x"6D"),t(x"6A"),t(x"75"),t(x"37"),t(x"38"),t(x"00"), -- 3
	--       ,        k        i        o        0        9                          .        /        l        ;        p        -
	t(x"00"),t(x"2C"),t(x"6B"),t(x"69"),t(x"6F"),t(x"30"),t(x"39"),t(x"00"),t(x"00"),t(x"2E"),t(x"2F"),t(x"6C"),t(x"3B"),t(x"70"),t(x"2D"),t(x"00"), -- 4
	--                '                 [        =                          CAPLOCK  r-SHIFT  ENTER    ]                 #~
	t(x"00"),t(x"00"),t(x"27"),t(x"00"),t(x"5B"),t(x"3D"),t(x"00"),t(x"00"),t(x"00"),t(x"00"),t(x"0D"),t(x"5D"),t(x"00"),t(x"23"),t(x"00"),t(x"00"), -- 5
	--       \|                                           BACKSP                     KP1               KP4      KP7
	t(x"00"),t(x"5C"),t(x"00"),t(x"00"),t(x"00"),t(x"00"),t(x"08"),t(x"00"),t(x"00"),t(x"31"),t(x"00"),t(x"34"),t(x"37"),t(x"00"),t(x"00"),t(x"00"), -- 6
	-- KP0   KP.      KP2      KP5      KP6      KP8      ESC      NUMLCK   F11      KP+      KP3      KP-      KP*      KP9      SCRLCK
	t(x"30"),t(x"2E"),t(x"32"),t(x"35"),t(x"36"),t(x"38"),t(x"1B"),t(x"00"),t(x"1B"),t(x"2B"),t(x"33"),t(x"2D"),t(x"2A"),t(x"39"),t(x"00"),t(x"00"), -- 7
	--                         F7
	t(x"00"),t(x"00"),t(x"00"),t(x"17") -- 8
	);
	constant kbShifted : kbDataArray :=
	(
	--  0        1        2        3        4        5        6        7        8        9        A        B        C        D        E        F
	t(x"00"),t(x"19"),t(x"00"),t(x"15"),t(x"13"),t(x"11"),t(x"12"),t(x"1C"),t(x"00"),t(x"1A"),t(x"18"),t(x"16"),t(x"14"),t(x"09"),t(x"00"),t(x"00"), -- 0
	t(x"00"),t(x"00"),t(x"00"),t(x"00"),t(x"00"),t(x"51"),t(x"21"),t(x"00"),t(x"00"),t(x"00"),t(x"5A"),t(x"53"),t(x"41"),t(x"57"),t(x"22"),t(x"00"), -- 1
	t(x"00"),t(x"43"),t(x"58"),t(x"44"),t(x"45"),t(x"24"),t(x"23"),t(x"00"),t(x"00"),t(x"20"),t(x"56"),t(x"46"),t(x"54"),t(x"52"),t(x"25"),t(x"00"), -- 2
	t(x"00"),t(x"4E"),t(x"42"),t(x"48"),t(x"47"),t(x"59"),t(x"5E"),t(x"00"),t(x"00"),t(x"00"),t(x"4D"),t(x"4A"),t(x"55"),t(x"26"),t(x"2A"),t(x"00"), -- 3
	t(x"00"),t(x"3C"),t(x"4B"),t(x"49"),t(x"4F"),t(x"29"),t(x"28"),t(x"00"),t(x"00"),t(x"3E"),t(x"3F"),t(x"4C"),t(x"3A"),t(x"50"),t(x"5F"),t(x"00"), -- 4
	t(x"00"),t(x"00"),t(x"40"),t(x"00"),t(x"7B"),t(x"2B"),t(x"00"),t(x"00"),t(x"00"),t(x"00"),t(x"0D"),t(x"7D"),t(x"00"),t(x"7E"),t(x"00"),t(x"00"), -- 5
	t(x"00"),t(x"7C"),t(x"00"),t(x"00"),t(x"00"),t(x"00"),t(x"08"),t(x"00"),t(x"00"),t(x"31"),t(x"00"),t(x"34"),t(x"37"),t(x"00"),t(x"00"),t(x"00"), -- 6
	t(x"30"),t(x"2E"),t(x"32"),t(x"35"),t(x"36"),t(x"38"),t(x"1B"),t(x"00"),t(x"1B"),t(x"2B"),t(x"33"),t(x"2D"),t(x"2A"),t(x"39"),t(x"00"),t(x"00"), -- 7
	t(x"00"),t(x"00"),t(x"00"),t(x"17") -- 8
	);

begin

	dispAddr_xx <= std_logic_vector(to_unsigned(dispAddr,11));
	cursAddr_xx <= std_logic_vector(to_unsigned(cursAddr,11));

-- DISPLAY ROM (CHARACTER GENERATOR)
GEN_EXT_CHARS: if (EXTENDED_CHARSET=1) and (SANS_SERIF_FONT=0)  generate
begin
	fontRom : entity work.CGABoldRom -- 256 chars (2K)
        port map(
		address => charAddr,
		clock => clk,
		q => charData
	);
end generate GEN_EXT_CHARS;

GEN_EXT_SCHARS: if (EXTENDED_CHARSET=1) and (SANS_SERIF_FONT=1)  generate
begin
	fontRom : entity work.SansBoldRom -- 256 chars (2K)
        port map(
		address => charAddr,
		clock => clk,
		q => charData
	);
end generate GEN_EXT_SCHARS;

GEN_REDUCED_CHARS: if (EXTENDED_CHARSET=0) and (SANS_SERIF_FONT=0) generate
begin
	fontRom : entity work.CGABoldRomReduced -- 128 chars (1K)
	port map(
		address => charAddr(9 downto 0),
		clock => clk,
		q => charData
	);
end generate GEN_REDUCED_CHARS;

GEN_REDUCED_SCHARS: if (EXTENDED_CHARSET=0) and (SANS_SERIF_FONT=1) generate
begin
	fontRom : entity work.SansBoldRomReduced -- 128 chars (1K)
	port map(
		address => charAddr(9 downto 0),
		clock => clk,
		q => charData
	);
end generate GEN_REDUCED_SCHARS;

-- DISPLAY RAM
GEN_2KRAM: if (CHARS_PER_SCREEN >1024) generate
begin
 	dispCharRam: entity work.DisplayRam2k -- For 80x25 display character storage
	port map
	(
		clock	=> clk,

		address_b => cursAddr_xx(10 downto 0),
		data_b => dispCharWRData,
		q_b => dispCharRDData,
		wren_b => dispWR,

		address_a => dispAddr_xx(10 downto 0),
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

		address_b => cursAddr_xx(10 downto 0),
		data_b => dispAttWRData,
		q_b => dispAttRDData,
		wren_b => dispWR,

		address_a => dispAddr_xx(10 downto 0),
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

		address_b => cursAddr_xx(9 downto 0),
		data_b => dispCharWRData,
		q_b => dispCharRDData,
		wren_b => dispWR,

		address_a => dispAddr_xx(9 downto 0),
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

		address_b => cursAddr_xx(9 downto 0),
		data_b => dispAttWRData,
		q_b => dispAttRDData,
		wren_b => dispWR,

		address_a => dispAddr_xx(9 downto 0),
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
	screen_render: process (clk)
	begin
		if rising_edge(clk) then
			if horizCount < CLOCKS_PER_SCANLINE then
				horizCount <= horizCount + 1;
				if (horizCount < DISPLAY_LEFT_CLOCK) or (horizCount >= (DISPLAY_LEFT_CLOCK + HORIZ_CHARS*CLOCKS_PER_PIXEL*8)) then
					hActive <= '0';
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
					pixelClockCount <= (others => '0');
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
					if pixelCount = 6 then -- move output pipeline back by 1 clock to allow readout on posedge
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
                                pixelClockCount <= (others => '0');
			end if;
		end if;
	end process;


	-- Hardware cursor blink
	cursor_blink: process(clk)
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

	-- write of xxxxxx11 to control reg will reset
	process (clk)
	begin
		if rising_edge(clk) then
			if n_wr = '0' and dataIn(1 downto 0) = "11" and regSel = '0' then
				func_reset <= '1';
                        else
				func_reset <= '0';
                        end if;
		end if;
	end process;

	reg_rd: process( n_rd, func_reset )
	begin
		if func_reset='1' then
			kbReadPointer <= 0;
		elsif falling_edge(n_rd) then -- Standard CPU - present data on leading edge of rd
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

	reg_wr: process( n_wr )
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
	kbd_filter: process(clk)
	begin
		if rising_edge(clk) then
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

	kbd_ctl: process( clk, func_reset )
	-- 11 bits
	-- start(0) b0 b1 b2 b3 b4 b5 b6 b7 parity(odd) stop(1)
	begin
		if rising_edge(clk) then

			ps2PrevClk <= ps2ClkFiltered;

			if func_reset = '1' then
				-- reset keyboard pointers
				kbInPointer <= 0;
			end if;

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
							ps2ConvertedByte <= kbShifted   (to_integer(unsigned(ps2Byte)));
						end if;
					else
						ps2ConvertedByte <= (others => '0');
					end if;
					ps2ClkCount<=ps2ClkCount+1;
				else -- stop bit - use this time to store
					-- FN1-FN10 keys return values 0x11-0x1A. They are not presented as ASCII codes through
					-- the virtual UART but instead toggle the FNkeys, FNtoggledKeys outputs.
					-- F11, F12 are not included because we need code 0x1B for ESC
					if ps2ConvertedByte>x"10" and ps2ConvertedByte<x"1B" then
						if ps2PreviousByte /= x"F0" then
							FNtoggledKeysSig(to_integer(unsigned(ps2ConvertedByte))-16#10#) <= FNtoggledKeysSig(to_integer(unsigned(ps2ConvertedByte))-16#10#);
							FNKeysSig(to_integer(unsigned(ps2ConvertedByte))-16#10#) <= '1';
						else
							FNKeysSig(to_integer(unsigned(ps2ConvertedByte))-16#10#) <= '0';
						end if;
					-- left SHIFT or right SHIFT pressed
					elsif ps2Byte = x"12" or ps2Byte=x"59" then
						if ps2PreviousByte /= x"F0" then
							ps2Shift <= '1';
						else
							ps2Shift <= '0';
						end if;
					-- CTRL pressed
					elsif ps2Byte = x"14" then
						if ps2PreviousByte /= x"F0" then
							ps2Ctrl <= '1';
						else
							ps2Ctrl <= '0';
						end if;
					-- Self-test passed (after power-up).
					-- Send SET-LEDs command to establish SCROLL, CAPS AND NUM
					elsif ps2Byte = x"AA" then
							ps2WriteByte <= x"ED";
							ps2WriteByte2(0) <= ps2Scroll;
							ps2WriteByte2(1) <= ps2Num;
							ps2WriteByte2(2) <= ps2Caps;
							ps2WriteByte2(7 downto 3) <= "00000";
							n_kbWR <= '0';
							kbWriteTimer<=0;
					-- SCROLL-LOCK pressed - set flags and
					-- update LEDs
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
					-- NUM-LOCK pressed - set flags and
					-- update LEDs
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
					-- CAPS-LOCK pressed - set flags and
					-- update LEDs
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
					-- ACK (from SET-LEDs)
					elsif ps2Byte = x"FA" then
						if ps2WriteByte /= x"FF" then
							n_kbWR <= '0';
							kbWriteTimer<=0;
						end if;
					-- ASCII key press - store it in the kbBuffer.
					elsif (ps2PreviousByte /= x"F0") and (ps2ConvertedByte /= x"00") then
						if ps2PreviousByte = x"E0" and ps2Byte = x"71" then -- DELETE
							kbBuffer(kbInPointer) <= "1111111"; -- 7F
						elsif ps2Ctrl = '1' then
							kbBuffer(kbInPointer) <= "00" & ps2ConvertedByte(4 downto 0);
						elsif ps2ConvertedByte > x"40" and ps2ConvertedByte < x"5B" and ps2Caps='1' then
                                                        -- A-Z but caps lock on so convert to a-z.
							kbBuffer(kbInPointer) <= ps2ConvertedByte or "0100000";
						elsif ps2ConvertedByte > x"60" and ps2ConvertedByte < x"7B" and ps2Caps='1' then
                                                        -- a-z but caps lock on so convert to A-Z.
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
	display_store: process( clk , n_reset)
	begin
		if n_reset='0' then
			dispAttWRData <= DEFAULT_ATT;
		elsif rising_edge(clk) then
			case dispState is
			when idle =>
				if (escState/=processingAdditionalParams) and (dispByteWritten /= dispByteSent) then
					dispCharWRData <= dispByteLatch;
					dispByteSent <= not dispByteSent;
				end if;
				if (escState=processingAdditionalParams) or (dispByteWritten /= dispByteSent) then
					if dispByteLatch = x"07" then -- BEEP
						-- do nothing - ignore
					elsif dispByteLatch = x"1B" then -- ESC
						paramCount<=0;
						param1<=0;
						param2<=0;
						param3<=0;
						param4<=0;
						escState<= waitForLeftBracket;
					elsif escState=waitForLeftBracket and dispByteLatch=x"5B" then -- ESC[
						escState<= processingParams;
						paramCount<=1;
					elsif paramCount=1 and dispByteLatch=x"48" and param1=0 then -- ESC[H - home
						cursorVert <= 0;
						cursorHoriz <= 0;
						paramCount<=0;
					elsif paramCount=1 and dispByteLatch=x"4B" and param1=0 then -- ESC[K - erase EOL
						cursorVertRestore <= cursorVert;
						cursorHorizRestore <= cursorHoriz;
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
						cursorHoriz <= 0;
						paramCount<=0;
						if cursorVert < VERT_CHAR_MAX then
							cursorVert <= VERT_CHAR_MAX-1;
							dispState <= insertLine;
						else
							dispState <= clearLine;
						end if;
					elsif paramCount =1 and dispByteLatch=x"4D" then-- ESC[M - delete line
						cursorVertRestore <= cursorVert;
						cursorHorizRestore <= cursorHoriz;
						cursorHoriz <= 0;
						paramCount<=0;
						if cursorVert < VERT_CHAR_MAX then
							cursorVert <= cursorVert + 1;
							dispState <= deleteLine;
						else
							dispState <= clearLine;
						end if;
					elsif paramCount>0 and dispByteLatch=x"6D" then-- ESC[{param1}m or ESC[{param1};{param2}m- set graphics rendition
						if param1 = 0 then
							attInverse <= '0';
							attBold <= ANSI_DEFAULT_ATT(3);
							dispAttWRData <= ANSI_DEFAULT_ATT;
						end if;
						if param1 = 1 then
							attBold <= '1';
							dispAttWRData(3) <= '1';
						end if;
						if param1 = 22 then
							attBold <= '0';
							dispAttWRData(3) <= '0';
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
							escState <= processingAdditionalParams;
						else
							paramCount<=0;
							escState <= none;
						end if;
					elsif paramCount=1 and dispByteLatch=x"41" then-- ESC[{param1}A - Cursor up
						if  param1=0 and cursorVert>0 then -- no param so default to 1
							cursorVert<=cursorVert-1;
						elsif  param1<cursorVert then
							cursorVert<=cursorVert-param1;
						else
							cursorVert<=0;
						end if;
						paramCount<=0;
					elsif paramCount=1 and dispByteLatch=x"42" then-- ESC[{param1}B - Cursor down
						if  param1=0 and cursorVert<VERT_CHAR_MAX then -- no param so default to 1
							cursorVert<=cursorVert+1;
						elsif (cursorVert+param1)<VERT_CHAR_MAX then
							cursorVert<=cursorVert+param1;
						else
							cursorVert<=VERT_CHAR_MAX;
						end if;
						paramCount<=0;
					elsif paramCount=1 and dispByteLatch=x"43" then-- ESC[{param1}C - Cursor forward
						if  param1=0 and cursorHoriz<HORIZ_CHAR_MAX then -- no param so default to 1
							cursorHoriz<=cursorHoriz+1;
						elsif (cursorHoriz+param1)<HORIZ_CHAR_MAX then
							cursorHoriz<=cursorHoriz+param1;
						else
							cursorHoriz<=HORIZ_CHAR_MAX;
						end if;
						paramCount<=0;
					elsif paramCount=1 and dispByteLatch=x"44" then-- ESC[{param1}D - Cursor backward
						if  param1=0 and cursorHoriz>0 then -- no param so default to 1
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
						escState <= none;
						paramCount<=0;
					end if;
				end if;
			when dispWrite =>
				if dispCharWRData=13 then -- CR
					cursorHoriz <= 0;
					dispState<=idle;
				elsif dispCharWRData=10 then -- LF
					if cursorVert<VERT_CHAR_MAX then -- move down to next line
						cursorVert <= cursorVert+1;
						dispState<=idle;
					else -- scroll
						if startAddr < (CHARS_PER_SCREEN - HORIZ_CHARS) then
							startAddr <= startAddr + HORIZ_CHARS;
						else
							startAddr <= 0;
						end if;
						cursorHoriz <= 0;
						cursorHorizRestore <= cursorHoriz;
						cursorVertRestore <= cursorVert;
						dispState<=clearLine;
					end if;
				elsif dispCharWRData=12 then -- CLS
					cursorVert <= 0;
					cursorHoriz <= 0;
					cursorHorizRestore <= 0;
					cursorVertRestore <= 0;
					dispState<=clearScreen;
				elsif dispCharWRData=8 or dispCharWRData=127 then -- BS
					if cursorHoriz>0 then
						cursorHoriz <= cursorHoriz-1;
					elsif cursorHoriz=0 and cursorVert>0 then
						cursorHoriz <=HORIZ_CHAR_MAX;
						cursorVert <= cursorVert-1;
					end if;
					dispState<=clearChar;
				else -- Displayable character
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
				cursorVert <= cursorVert+1;
				dispState <= ins2;
			when ins2 =>
				dispCharWRData <= dispCharRDData;
				dispAttWRData <= dispAttRDData;
				dispWR <= '1';
				dispState <= ins3;
			when ins3 =>
				dispWR <= '0';
				if cursorHoriz < HORIZ_CHAR_MAX then
					-- current line still in progress
					cursorHoriz <= cursorHoriz+1;
					cursorVert <= cursorVert-1;
					dispState <= insertLine;
				elsif cursorVert = cursorVertRestore+1 then
					-- current line finished, no more lines to move
					cursorHoriz <= 0;
					cursorVert <= cursorVertRestore;
					dispState <= clearLine;
				else
					-- current line finished, do next one
					cursorHoriz <= 0;
					cursorVert <= cursorVert-2;
					dispState <= insertLine;
				end if;
			when deleteLine =>
				cursorVert <= cursorVert-1;
				dispState <= del2;
			when del2 =>
				dispCharWRData <= dispCharRDData;
				dispAttWRData <= dispAttRDData;
				dispWR <= '1';
				dispState <= del3;
			when del3 =>
				dispWR <= '0';
				if cursorHoriz < HORIZ_CHAR_MAX then
					-- current line still in progress
					cursorHoriz <= cursorHoriz+1;
					cursorVert <= cursorVert+1;
					dispState <= deleteLine;
				elsif cursorVert = VERT_CHAR_MAX-1 then
					-- current line finished, no more lines to move
					cursorHoriz <= 0;
					cursorVert <= VERT_CHAR_MAX;
					dispState <= clearLine;
				else
					-- current line finished, do next one
					cursorHoriz <= 0;
					cursorVert <= cursorVert+2;
					dispState <= deleteLine;
				end if;
			end case;
		end if;
	end process;
end rtl;
