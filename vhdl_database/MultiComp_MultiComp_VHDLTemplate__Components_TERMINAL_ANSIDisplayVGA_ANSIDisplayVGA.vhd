-- This file is copyright by Grant Searle 2014 with modifications by Doug Gilliland
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
--
-- DG: Changed Grant's code to remove the PS/2 keyboard
--		Keyboard was not clean ASCII due to remapping certain keys
-- DG: Removes Composite Video and Composite video sync
-- DG: Removes RTS signal
--
-- Interface matches ACIA software interface address/control/status contents
-- http://www.swtpc.com/mholley/Notebook/Hardware_ACIA.pdf
-- Status Register
--		Register Select = 0
--		Read/Write = Read
-- 		d0 = RDRF	= Receive Data Register Full (1 = data is ready to read)
--			d1 = TDRE	= Transmit Data Register Empty (1 = transmit is ready to send out data)
--			d2 = DCD		= Data Carrier Detect (0 = carrier present - hardwired)
--			d3 = CTS		= Clear to Send (0 = Clear to Send - ready to accept data - hardwired)
--			d7 = IRQ		= Interrupt Request (1 = Interrupt present)
--	Control Register
--		Register Select = 0
--		Read/Write = Write
--			d1,d0		= Control (11 = Master Reset)
--			d6,d5		= TC = Transmitter Control (RTS = Transmitter Interrupt Enable/Disable)
--			d7 		= Interrupt Enable (1=enable interrupts)
-- Data Register
--		Register Select = 1
--		Read = Read data from the data register (not implemented due to kbd removal)
--		Write = Write data to the data register

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;

entity ANSIDisplayVGA is
	generic	(
		constant EXTENDED_CHARSET : integer := 1; -- 1 = 256 chars, 0 = 128 chars
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
		constant ANSI_DEFAULT_ATT : std_logic_vector(7 downto 0) := "00000111"; -- background iBGR | foreground iBGR (i=intensity)
		constant SANS_SERIF_FONT : integer := 1 -- 0 => use conventional CGA font, 1 => use san serif font
	);
	port (
		clk    		: in  std_logic;
		n_reset		: in	std_logic;
		n_wr			: in  std_logic;
		n_rd			: in  std_logic;
		regSel		: in  std_logic;
		dataIn		: in  std_logic_vector(7 downto 0);
		dataOut		: out std_logic_vector(7 downto 0);
		n_int			: out std_logic;

		-- RGB video signals
		videoR0		: out std_logic;
		videoR1		: out std_logic;
		videoG0		: out std_logic;
		videoG1		: out std_logic;
		videoB0		: out std_logic;
		videoB1		: out std_logic;
		hSync  		: buffer  std_logic;
		vSync  		: buffer  std_logic;
		o_hActive	: out std_logic
 );
end ANSIDisplayVGA;

architecture rtl of ANSIDisplayVGA is

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

	signal	dispByteWritten : std_logic := '0';
	signal	dispByteSent : std_logic := '0';

	signal	dispByteLatch: std_logic_vector(7 DOWNTO 0);
	type		dispStateType is ( idle, dispWrite, dispNextLoc, clearLine, clearL2,
						clearScreen, clearS2, clearChar, clearC2, insertLine, ins2, ins3, deleteLine, del2, del3);
	signal	dispState : dispStateType :=idle;
	type		escStateType is ( none, waitForLeftBracket, processingParams, processingAdditionalParams );
	signal	escState : escStateType :=none;

	signal	param1: integer range 0 to 127 :=0;
	signal	param2: integer range 0 to 127 :=0;
	signal	param3: integer range 0 to 127 :=0;
	signal	param4: integer range 0 to 127 :=0;
	signal	paramCount: integer range 0 to 4 :=0;

	signal	attInverse : std_logic := '0';
	signal	attBold : std_logic := DEFAULT_ATT(3);

	-- "globally static" versions of signals for use within generate
        -- statements below. Without these intermediate signals the simulator
        -- reports an error (even though the design synthesises OK)
	signal	cursAddr_xx: std_logic_vector(10 downto 0);
	signal	dispAddr_xx: std_logic_vector(10 downto 0);

	type		kbDataArray is array (0 to 131) of std_logic_vector(6 downto 0);


begin

	o_hActive <= hActive;
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

	charAddr <= dispCharData & charScanLine(VERT_PIXEL_SCANLINES+1 downto VERT_PIXEL_SCANLINES-1);

	dispAddr <= (startAddr + charHoriz+(charVert * HORIZ_CHARS)) mod CHARS_PER_SCREEN;
	cursAddr <= (startAddr + cursorHoriz+(cursorVert * HORIZ_CHARS)) mod CHARS_PER_SCREEN;

--	sync <= vSync and hSync; -- composite sync for mono video out

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

--						video <= '1'; -- Monochrome video out
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
						--video <= charData(7-to_integer(unsigned(pixelCount))); -- Monochrome video out
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

				--video <= '0'; -- Monochrome video out
                                pixelClockCount <= (others => '0');
			end if;
		end if;
	end process;


	-- Hardware cursor blink 1/2 sec on, 1/2 sec off
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
	statusReg(0) <= '0';
	statusReg(1) <= '1' when dispByteWritten=dispByteSent else '0';
	statusReg(2) <= '0'; --n_dcd;
	statusReg(3) <= '0'; --n_cts;
	statusReg(7) <= not(n_int_internal);

	-- interrupt mask
	n_int <= n_int_internal;
	n_int_internal <= '0' when (dispByteWritten=dispByteSent) and controlReg(6)='0' and controlReg(5)='1'
				else '1';

--	n_rts <= '0';

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
		if falling_edge(n_rd) then -- Standard CPU - present data on leading edge of rd
			dataOut <= statusReg;
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
								dispAttWRData(3) <= attBold;		-- TBD - this looks wrong to me DGG
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
