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
--
-- Modifications made by Rienk Koolstra to include:
-- scancode lookup table relocated to a 512 byte ROM.
-- Addresses 000-0FF unshifted values, 100-1FF shifted values.
-- E0 dual values reside in 080-0BF and 180-1BF.
-- Numlock values are stored at 0C0-0DF and 1C0-1DF
-- Key values are 8 bits, Function keys have MSB set.F1-F12 map to 81-8C, shifted 91-9C
-- Arrow keys use Wordstar equivalents. Backspace = 08, DEL = 7F
-- the TAB character moves the cursor to the next 8 character position on the same line.

library ieee;
   use ieee.std_logic_1164.all;
   use ieee.numeric_std.all;
   use ieee.std_logic_unsigned.all;

entity SBCTextDisplayRGB is
   generic(
      constant EXTENDED_CHARSET     : integer := 1; -- 1 = 256 chars, 0 = 128 chars
      constant COLOUR_ATTS_ENABLED  : integer := 1; -- 1 = Colour for each character, 0=Colour applied to whole display
      -- VGA 640x480 Default values
      constant VERT_CHARS           : integer := 30;
      constant HORIZ_CHARS          : integer := 80;
      constant CLOCKS_PER_SCANLINE  : integer := 1609; -- NTSC/PAL = 3200
--    constant DISPLAY_TOP_SCANLINE : integer := 35+40;
      constant DISPLAY_TOP_SCANLINE : integer := 35;
      constant DISPLAY_LEFT_CLOCK   : integer := 288;  -- NTSC/PAL = 600+
--    constant VERT_SCANLINES       : integer := 525;  -- NTSC=262, PAL=312
      constant VERT_SCANLINES       : integer := 527;  -- NTSC=262, PAL=312; 1 Scanline on TOP and BOTTOM
      constant VSYNC_SCANLINES      : integer := 2;    -- NTSC/PAL = 4
      constant HSYNC_CLOCKS         : integer := 192;  -- NTSC/PAL = 235
      constant VERT_PIXEL_SCANLINES : integer := 2;
      constant CLOCKS_PER_PIXEL     : integer := 2;    -- min = 2
      constant H_SYNC_ACTIVE        : std_logic := '0';
      constant V_SYNC_ACTIVE        : std_logic := '0';

      constant DEFAULT_ATT          : std_logic_vector(7 downto 0) := "00001111"; -- background iBGR | foreground iBGR (i=intensity)
      constant ANSI_DEFAULT_ATT     : std_logic_vector(7 downto 0) := "00000111"  -- background iBGR | foreground iBGR (i=intensity)
   );
   port (
      n_reset        : in     std_logic;
      clk            : in     std_logic;

-- RGB video signals
      videoR0        : out    std_logic;
      videoR1        : out    std_logic;
      videoG0        : out    std_logic;
      videoG1        : out    std_logic;
      videoB0        : out    std_logic;
      videoB1        : out    std_logic;
      hSync          : buffer std_logic;
      vSync          : buffer std_logic;

-- Monochrome video signals
      video          : buffer std_logic;
      sync           : out    std_logic;

-- Common, PS/2-Keyboard
      n_wr           : in     std_logic;
      n_rd           : in     std_logic;
      n_int          : out    std_logic;
      n_rts          : out    std_logic :='0';
      regSel         : in     std_logic;
      dataIn         : in     std_logic_vector(7 downto 0);
      dataOut        : out    std_logic_vector(7 downto 0);

-- PS/2-Keyboard
      ps2Clk         : inout  std_logic;
      ps2Data        : inout  std_logic;

-- Graphic RAM exccess
      n_cwr          : in     std_logic;
      n_crd          : in     std_logic;
      n_gwr          : in     std_logic;
      n_grd          : in     std_logic;
      BlinkON        : in     std_logic;                        -- Controls Cursor blinking ON/OFF
      gON            : in     std_logic;
      gSEL           : in     std_logic;                        -- Graphic: direkt = '1'/ Cursor = '0

      cdataIn        : in     std_logic_vector(7 downto 0);     -- Daten schreiben in CHAR-ROM
      cdataOut       : out    std_logic_vector(7 downto 0);     -- Daten lesen von CHAR-ROM
      cAddrLow       : in     std_logic_vector(7 downto 0);     -- Direkte CHAR-ROM Adresse LOW
      cAddrHigh      : in     std_logic_vector(7 downto 0);     -- Direkte CHAR-ROM Adresse HIGH

      gdataIn        : in     std_logic_vector(7 downto 0);     -- Daten von der CPU
      gdataOut       : out    std_logic_vector(7 downto 0);     -- Daten gelesen von der CPU
      gAddrLow       : in     std_logic_vector(7 downto 0);     -- Direkte gRAM Adresse LOW
      gAddrHigh      : in     std_logic_vector(7 downto 0)      -- Direkte gRAM Adresse HIGH

 );
end SBCTextDisplayRGB;

architecture rtl of SBCTextDisplayRGB is

--VGA 640x400
--constant VERT_CHARS            : integer := 30;
--constant HORIZ_CHARS           : integer := 80;
--constant CLOCKS_PER_SCANLINE   : integer := 1600;
--constant DISPLAY_TOP_SCANLINE  : integer := 35;
--constant DISPLAY_LEFT_CLOCK    : integer := 288;
--constant VERT_SCANLINES        : integer := 448;
--constant VSYNC_SCANLINES       : integer := 2;
--constant HSYNC_CLOCKS          : integer := 192;
--constant VERT_PIXEL_SCANLINES  : integer := 2;
--constant CLOCKS_PER_PIXEL      : integer := 2; -- min = 2
--constant H_SYNC_ACTIVE         : std_logic := '0';
--constant V_SYNC_ACTIVE         : std_logic := '1';

constant  HORIZ_CHAR_MAX         : integer := HORIZ_CHARS-1;
constant  VERT_CHAR_MAX          : integer := VERT_CHARS-1;
constant  CHARS_PER_SCREEN       : integer := HORIZ_CHARS*VERT_CHARS;

   signal   func_reset           : std_logic := '0';

   signal   vActive              : std_logic := '0';
   signal   hActive              : std_logic := '0';

   signal   pixelClockCount      : std_logic_vector(3 DOWNTO 0);
   signal   pixelCount           : std_logic_vector(2 DOWNTO 0);

   signal   horizCount           : std_logic_vector(11 DOWNTO 0);
   signal   vertLineCount        : std_logic_vector(9 DOWNTO 0);

   signal   charVert             : integer range 0 to VERT_CHAR_MAX; --unsigned(4 DOWNTO 0); ASCII-Screen
   signal   gcharVert            : integer range 0 to VERT_CHAR_MAX; --unsigned(4 DOWNTO 0); Graphic-Scren
   signal   charScanLine         : std_logic_vector(3 DOWNTO 0);

-- functionally this only needs to go to HORIZ_CHAR_MAX. However, at the end of a line
-- it goes 1 beyond in the hblank time. It could be avoided but it's fiddly with no
-- benefit. Without the +1 the design synthesises and works fine but gives a fatal
-- error in RTL simulation when the signal goes out of range.
   signal   charHoriz            : integer range 0 to 1+HORIZ_CHAR_MAX; --unsigned(6 DOWNTO 0);
   signal   charBit              : std_logic_vector(3 DOWNTO 0);

   -- top left-hand corner of the display is 0,0 aka "home".
   signal   cursorVert           : integer range 0 to VERT_CHAR_MAX :=0;
   signal   cursorHoriz          : integer range 0 to HORIZ_CHAR_MAX :=0;

   -- save cursor position during erase-to-end-of-screen etc.
   signal   cursorVertRestore    : integer range 0 to VERT_CHAR_MAX :=0;
   signal   cursorHorizRestore   : integer range 0 to HORIZ_CHAR_MAX :=0;

   -- save cursor position during ESC[s...ESC[u sequence
   signal   savedCursorVert      : integer range 0 to VERT_CHAR_MAX :=0;
   signal   savedCursorHoriz     : integer range 0 to HORIZ_CHAR_MAX :=0;

   signal   startAddr            : integer range 0 to CHARS_PER_SCREEN;
   signal  gstartAddr            : integer range 0 to CHARS_PER_SCREEN :=0;         -- set to '0' as start value
   signal   cursAddr             : integer range 0 to CHARS_PER_SCREEN;
   signal  gcursAddr             : integer range 0 to CHARS_PER_SCREEN :=0;

   signal   cursAddr_xx          : std_logic_vector(14 downto 0);
   signal  gcursAddr_xx          : std_logic_vector(14 downto 0);
   signal  gcursAddr_yy          : std_logic_vector(14 downto 0);
   signal   dispAddr_xx          : std_logic_vector(11 downto 0);
   signal  gDispAddr_xx          : std_logic_vector(14 downto 0);                   -- Adresse auf Grafik-Character
   signal  gDispAddr_yy          : std_logic_vector(14 downto 0);                   -- Adresse auf Grafik-Character

   signal   dispAddr             : integer range 0 to  CHARS_PER_SCREEN;
   signal  gdispAddr             : integer range 0 to  CHARS_PER_SCREEN;

   signal   charAddr             : std_logic_vector(10 downto 0);
   signal  gcharAddr             : std_logic_vector(2 downto 0);
   signal  cAddr                 : std_logic_vector(10 downto 0);                    -- Adresse fuer progr. Char-ROM
   signal  gAddr                 : std_logic_vector(14 downto 0);                    -- Adresse fuer Grafik-RAM
   signal  gDataOutp             : std_logic_vector(7 downto 0);                     -- Datenbus Grafik-RAM
   signal  cdataOutp             : std_logic_vector(7 downto 0);                     -- Datenbus Char-ROM

   signal   dispCharData         : std_logic_vector(7 downto 0);
   signal   dispCharWRData       : std_logic_vector(7 downto 0);
   signal   dispCharRDData       : std_logic_vector(7 downto 0);
   signal   dispAttData          : std_logic_vector(7 downto 0);
   signal   dispAttWRData        : std_logic_vector(7 downto 0) := DEFAULT_ATT;     -- iBGR(back) iBGR(text)
   signal   dispAttRDData        : std_logic_vector(7 downto 0);

   signal   dispGrafData         : std_logic_vector(7 downto 0);

   signal   charData             : std_logic_vector(7 downto 0);
   signal  grafData              : std_logic_vector(7 downto 0);
   signal  inv_grafData          : std_logic_vector(7 downto 0);
   signal  grafDataON            : std_logic_vector(7 downto 0);

   signal   keyAddr              : std_logic_vector(8 downto 0) := (others => '0');
   signal   keyData              : std_logic_vector(7 downto 0);

   signal   cursorOn             : std_logic := '1';
   signal   dispWR               : std_logic := '0';

   signal   cursBlinkCount       : unsigned(25 downto 0);
   signal   kbWatchdogTimer      : integer range 0 to 50000000 :=0;
   signal   kbWriteTimer         : integer range 0 to 50000000 :=0;

   signal   n_int_internal       : std_logic := '1';
   signal   statusReg            : std_logic_vector(7 downto 0) := (others => '0');
   signal   controlReg           : std_logic_vector(7 downto 0) := "00000000";

   type     kbBuffArray is array (0 to 7) of std_logic_vector(7 downto 0);
   signal   kbBuffer             : kbBuffArray;

   signal   kbInPointer          : integer range 0 to 15 :=0;   -- registered on clk
   signal   kbReadPointer        : integer range 0 to 15 :=0;   -- registered on n_rd
   signal   kbBuffCount          : integer range 0 to 15 :=0;   -- combinational
   signal   dispByteWritten      : std_logic := '0';
   signal   dispByteSent         : std_logic := '0';

   signal   dispByteLatch        : std_logic_vector(7 DOWNTO 0);
   type     dispStateType is ( idle, dispWrite, dispNextLoc, clearLine, clearL2,
                                     clearScreen, clearS2, clearChar, clearC2,
                                     insertLine, ins2, ins3, deleteLine, del2, del3);
   signal   dispState : dispStateType :=idle;
   type     escStateType is ( none, waitForLeftBracket, processingParams, processingAdditionalParams );
   signal   escState : escStateType :=none;

   signal   param1               : integer range 0 to 127 :=0;
   signal   param2               : integer range 0 to 127 :=0;
   signal   param3               : integer range 0 to 127 :=0;
   signal   param4               : integer range 0 to 127 :=0;
   signal   paramCount           : integer range 0 to 4 :=0;

   signal   attInverse           : std_logic := '0';
   signal   attBold              : std_logic := DEFAULT_ATT(3);

   signal   ps2Byte              : std_logic_vector(7 DOWNTO 0);
   signal   ps2PreviousByte      : std_logic_vector(7 DOWNTO 0);
   signal   ps2ConvertedByte     : std_logic_vector(7 DOWNTO 0);
   signal   ps2ClkCount          : integer range 0 to 10 :=0;
   signal   ps2WriteClkCount     : integer range 0 to 20 :=0;
   signal   ps2WriteByte         : std_logic_vector(7 DOWNTO 0) := x"FF";
   signal   ps2WriteByte2        : std_logic_vector(7 DOWNTO 0) := x"FF";
   signal   ps2PrevClk           : std_logic := '1';
   signal   ps2ClkFilter         : integer range 0 to 50;
   signal   ps2ClkFiltered       : std_logic := '1';

   signal   ps2Ctrl              : std_logic := '0';
   signal   ps2Caps              : std_logic := '0';
   signal   ps2Num               : std_logic := '0';
   signal   ps2Scroll            : std_logic := '0';

   signal   ps2DataOut           : std_logic := '1';
   signal   ps2ClkOut            : std_logic := '1';
   signal   n_kbWR               : std_logic := '1';
   signal   kbWRParity           : std_logic := '0';


begin

   cursAddr_xx  <= std_logic_vector(to_unsigned( cursAddr,15));
  gcursAddr_xx  <= std_logic_vector(to_unsigned(gcursAddr,15));
   dispAddr_xx  <= std_logic_vector(to_unsigned( dispAddr,12));
  gdispAddr_xx  <= std_logic_vector(to_unsigned(gdispAddr,15));

-- KEYBOARD ROM
   keyRom : entity work.keyMapRom -- (512 bytes)
   port map(
      address => keyAddr,
      clock => clk,
      q => keyData
   );


-- --------------------------------------------------
-- DISPLAY ROM, RAM AND GRAPHIC
-- --------------------------------------------------

-- Extended programable Char-ROM
-- RESET inits Char-ROM with "CGAFontBold.HEX"
-- For reprogramming by software use "CGAFontBold.bin"
GEN_EXT_CHARS: if (EXTENDED_CHARSET=1) generate
begin
   fontRom: entity work.CharROM2K0   -- For programable CharROM
   port map
   (
      clock => clk,

      --RD/WR Display-RAM
      address_b => cADDR,                          -- Adresse Char-ROM
      data_b    => cdataIn,                        -- Schreib-Kanal ins Char-RAM
      q_b       => cdataOutp,                      -- Lese-Kanal    aus Char-RAM
      wren_b    => not n_cWR,

      --RD-only  Display-RAM
      address_a => charAddr,
      data_a    => (others => '0'),
      q_a       => charData,
      wren_a    => '0'
   );
end generate GEN_EXT_CHARS;


-- --------------------------------------------------
-- Full 19K2-Graphic-RAM
--   No AttRAM for this !!!
-- --------------------------------------------------
GEN_2KGRFRAM: if (CHARS_PER_SCREEN >1024) generate
begin
   dispGrfRam: entity work.GraphicRam2K4 -- For 80x30 display character storage
   port map
   (
      clock => clk,

--RD/WR Graphic-RAM, accessed by CPU
      address_b => gADDR,                          -- Die CPU greift exkl. auf's gByte zu !
      data_b    => gdataIn,                        -- Schreib-Kanal ins G-RAM
      q_b       => gdataOutp,                      -- Lese-Kanal    aus G-RAM
      wren_b    => not n_gWR,                      -- Schreib-Clk (high-active)

--RD-only Graphic-RAM, read accessed by Curs-Position only
      address_a => gDispAddr_yy(14 downto 0),      -- Adresszaehler fuer Darstellung
      data_a    => (others => '0'),                -- Schreib-Kanal ungenutzt
      q_a       => grafData,                       -- Lese-Kanal fuer Darstellung auf Screen
      wren_a    => '0'                             -- Schreib-Clk abgeschaltet, Lesen immer aktiv
   );
end generate GEN_2KGrfRAM;

-- --------------------------------------------------
-- Full 2k Character-RAM
-- --------------------------------------------------
GEN_2KRAM: if (CHARS_PER_SCREEN >1024) generate
begin
   dispCharRam: entity work.DisplayRam2K4 -- For 80x30 display character storage
   port map
   (
      clock => clk,

      --RD/WR Display-RAM
      address_b => cursAddr_xx(11 downto 0),
      data_b    => dispCharWRData,
      q_b       => dispCharRDData,
      wren_b    => dispWR,

      --RD-only  Display-RAM
      address_a => dispAddr_xx(11 downto 0),
      data_a    => (others => '0'),
      q_a       => dispCharData,
      wren_a    => '0'
   );
end generate GEN_2KRAM;

GEN_2KATTRAM: if (CHARS_PER_SCREEN >1024 and COLOUR_ATTS_ENABLED=1) generate
begin
   dispAttRam: entity work.DisplayRam2K4 -- For 80x30 display attribute storage
   port map
   (
      clock => clk,

      --RD/WR Display-RAM
      address_b => cursAddr_xx(11 downto 0),
      data_b    => dispAttWRData,
      q_b       => dispAttRDData,
      wren_b    => dispWR,              -- "dispWR" wird von der FSM der ESC-CMD Auswertung gesteuert !

      --RD-only  Display-RAM
      address_a => dispAddr_xx(11 downto 0),
      data_a    => (others => '0'),
      q_a       => dispAttData,
      wren_a    => '0'
   );
end generate GEN_2KATTRAM;


-- --------------------------------------------------
-- Case if No AttRAM
-- --------------------------------------------------
GEN_NO_ATTRAM: if (COLOUR_ATTS_ENABLED=0) generate
   dispAttData <= dispAttWRData; -- If no attribute RAM then two colour output on RGB pins as defined by default/esc sequence
end generate GEN_NO_ATTRAM;

-- Use Char-Data / Graph-Data as pointer into Char-ROM / Graph-ROM !
    charAddr <= (dispCharData) & charScanLine(VERT_PIXEL_SCANLINES+1 downto VERT_PIXEL_SCANLINES-1); -- Char-ROM
   gcharAddr <=                  charScanLine(VERT_PIXEL_SCANLINES+1 downto VERT_PIXEL_SCANLINES-1); -- Graph-Character

-- Screen-RAM is seen as a barrel, LF rolls the barrel for one line, HOME sets the barrel back to zero
   dispAddr  <= ( startAddr + charHoriz   +(  charVert * HORIZ_CHARS)) mod CHARS_PER_SCREEN;   -- Startadresse immer von '0' bis max. CHARS_PER_SCREEN
   cursAddr  <= ( startAddr + cursorHoriz +(cursorVert * HORIZ_CHARS)) mod CHARS_PER_SCREEN;   --                      --"--

  gdispAddr  <= (gstartAddr + charHoriz  +(  charVert * HORIZ_CHARS)) mod  CHARS_PER_SCREEN;  -- NEW: Berechnung jetzt fuer 19200 Byte := 15-bit Adresse

-- ON/OFF schalten der Grafik inkl. Bit-Folge umsortieren von (7...0) auf (6...0;7). Muss sein, warum = ???
   inv_grafData(7 downto 0) <= grafData(6) & grafData(5) & grafData(4) & grafData(3) & grafData(2) & grafData(1) & grafData(0) & grafData(7);
-- inv_grafData(7 downto 0) <= grafData(7 DOWNTO 0);
   grafDataON <= inv_grafData when gON = '1' else (others=>'0');

-- Zusammenbau der gRAM-Adresse fuer Direkt-Zugriff durch CPU
   gADDR( 7 downto 0) <= gAddrLow(7 downto 0);
   gADDR(14 downto 8) <= gAddrHigh(6 downto 0);

-- Zusammenbau der CHAR-ROM-Adresse fuer Zugriff durch CPU
   cADDR( 7 downto 0) <= cAddrLow(7 downto 0);
   cADDR(10 downto 8) <= cAddrHigh(2 downto 0);

-- Zusammenbau der gDisp-Adresse fuer den Bildaufbau
   gdispAddr_yy( 2 downto 0) <= gcharAddr(2 downto 0);
   gdispAddr_yy(14 downto 3) <= gdispAddr_xx(11 downto 0);

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
                  gcharVert <= 0;               -- Ruecksetzen des Zeilenzaehler fuer gRAM-Darstellung
                  charScanLine <= (others => '0');
               else
                  vActive <= '1';
                  if charScanLine = (VERT_PIXEL_SCANLINES*8-1) then
                     charScanLine <= (others => '0');
                     charVert <= charVert+1;
                     gcharVert <= gcharVert+1;  -- weiterschalten der Zeile fuer gRAM-Darstellung
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
            -- if cursorOn = '1' and cursorVert = charVert and cursorHoriz =  charHoriz and charScanLine = (VERT_PIXEL_SCANLINES*8-1) then -- underline-cursor
               if cursorOn = '1' and cursorVert = charVert and cursorHoriz =  charHoriz                                               then -- block-cursor
                  -- OLD: Cursor (use current colour because cursor cell not yet written to)
                  -- NEW: show cursor allways in 'BRIGHT'-Mode
               -- if dispAttData(3)='1'         then -- OLD: cursor according to dispAttData(3)
                  if (dispAttData(3) XOR '1') = '1' then -- NEW: BRIGHT'nes inverted otherwise cursor blinks BLACK <--> black when invers Video activ
                     videoR1 <= '1';  --
                     videoG1 <= '1';  --
                     videoB1 <= '1';  -- NEW: Brightnes independ from 'dispAttWRData()'
                     videoR0 <= '1';  --
                     videoG0 <= '1';  --
                     videoB0 <= '1';  --
                  else
                     videoR0 <= '0';  --
                     videoG0 <= '0';  --
                     videoB0 <= '0';  -- NEW: Darknes independ from 'dispAttWRData()'
                     videoR1 <= '0';  --
                     videoG1 <= '0';  --
                     videoB1 <= '0';  --
                  end if;
                  videoR1 <= '1';  --
                  videoG1 <= '1';  --
                  videoB1 <= '1';  -- NEW: Brightnes independ from 'dispAttWRData()'
                  videoR0 <= '1';  --
                  videoG0 <= '1';  --
                  videoB0 <= '1';  --

                  video <= '1'; -- Monochrome video out
               else
                  -- combine char- with graphic-pixel on pixel-clock level
                  -- dispAttData has influence on Graphic-Brightness at the moment !!!
                  if (charData(7-to_integer(unsigned(pixelCount))) or                     -- from char-ROM
                      grafDataON(7-to_integer(unsigned(pixelCount)))) = '1' then          -- from graph-ROM
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
                  -- combine charData and grafData for Monochrome-Video
                  video <= charData(7-to_integer(unsigned(pixelCount))) or   -- Monochrome video out: Char
                           grafDataON(7+to_integer(unsigned(pixelCount)));   -- Monochrome video out: Graphic
               end if;
               if pixelCount = 6 then -- move output pipeline back by 1 clock to allow readout on posedge
                  charHoriz <=  charHoriz+1;
               end if;
               pixelCount <=  pixelCount+1;
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


   -- Hardware cursor blink with Blink ON/OFF control
   cursor_blink: process(clk,BlinkON)
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
            if BlinkON = '1' then
               cursorOn <= '1';
            else
               cursorOn <= '0';
            end if;
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

-- Here we read Data from the keyboard
   reg_rd: process( n_rd, func_reset )
   begin
      if func_reset='1' then
         kbReadPointer <= 0;
      elsif falling_edge(n_rd) then -- Standard CPU - present data on leading edge of rd
         if regSel='1' then
            dataOut <= kbBuffer(kbReadPointer);
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

-- 1st: Here we write Data to the Display-RAM via a 'dispByteLatch'
--      The Latch is written to the Display-RAM during Display-Idle-State of Display-FSM
   reg_wr: process( n_wr )
   begin
      if rising_edge(n_wr) then -- Standard CPU - capture data on trailing edge of wr
         if regSel='1' then
            if dispByteWritten=dispByteSent then
               dispByteWritten <= not dispByteWritten;
                if gSel='0' then
                  dispByteLatch <= dataIn;
                else
                   dispByteLatch <= gdataIn;
                end if;
            end if;
         else
            controlReg <= dataIn;
         end if;
      end if;
   end process;

-- 2nd: Here we Read gData from gRAM when gSEL = '1'. When "gSEL" = '0', the CPU reads
--      Ghost-Data from the last write, so "gdataOut" ist set to '0' to avoid missinter-
--      pretation. No Readback of "gSEL". That means if writen /= Readback gData, direct
--      graphic write is "OFF", only via cursor-positioning (with no data Readback)
   reg_grd: process( n_grd )
   begin
      if falling_edge(n_grd) then -- Standard CPU - capture data on trailing edge of wr
         if regSel='1' then
            if gSel='1' then
               gdataOut <= gdataOutp;
            else
               gdataOut <= (others => '0');
            end if;
         end if;
      end if;
   end process;


-- 3nd: Here we Read Data from char-ROM
   reg_crd: process( n_crd )
   begin
      if falling_edge(n_crd) then -- Standard CPU - capture data on trailing edge of wr
         cdataOut <= cdataOutp;
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
         ps2ConvertedByte <= keyData;                          -- load selected character

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
               keyAddr(7 downto 0) <= ps2Byte;                                   -- find character in ROM
               if ps2PreviousByte = x"E0" and ps2Byte /= x"F0" then              -- switch to extended map
                  keyAddr(7 downto 6) <= "10";                                   -- use addresses 80-BF
               elsif ps2Byte > x"68" and ps2Byte < x"7E" and ps2Num = '1' then   -- switch to Num Lock set
                  keyAddr(7 downto 5) <= "110";                                  -- use addresses C0-DF
               end if;
               ps2ClkCount<=ps2ClkCount+1;
            else -- stop bit - use this time to store
               -- left SHIFT or right SHIFT pressed
               if ps2Byte = x"12" or ps2Byte=x"59" then
                  if ps2PreviousByte /= x"F0" then
                     keyAddr(8) <= '1';   -- select shifted codes
                  else
                     keyAddr(8) <= '0';   -- select normal codes
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
                  if ps2Ctrl = '1' then
                     kbBuffer(kbInPointer) <= "000" & ps2ConvertedByte(4 downto 0);
                  elsif ps2ConvertedByte > x"40" and ps2ConvertedByte < x"5B" and ps2Caps='1' then
                                                        -- A-Z but caps lock on so convert to a-z.
                     kbBuffer(kbInPointer) <= ps2ConvertedByte or "00100000";
                  elsif ps2ConvertedByte > x"60" and ps2ConvertedByte < x"7B" and ps2Caps='1' then
                                                        -- a-z but caps lock on so convert to A-Z.
                     kbBuffer(kbInPointer) <= ps2ConvertedByte and "11011111";
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


   -- PROCESS DATA WRITTEN TO DISPLAY (Graphic-Display write only, no processing !)
   display_store: process( clk , n_reset)
   begin
      if n_reset='0' then
         dispAttWRData <= DEFAULT_ATT;
      elsif rising_edge(clk) then
         case dispState is
         when idle => -- here we WR the data to the Display-/Graphic-RAM when FSM is idle
            if (escState/=processingAdditionalParams) and (dispByteWritten /= dispByteSent) then
               dispCharWRData <= dispByteLatch;
               dispByteSent <= not dispByteSent;
            end if;
            if (escState=processingAdditionalParams) or (dispByteWritten /= dispByteSent) then
               if dispByteLatch = x"07" then -- BEEP
                  -- do nothing - ignore
               elsif dispByteLatch = x"09" then -- TAB
                  -- TAB only moves the cursor on the same line. no inserts
                  cursorHoriz <= cursorHoriz - (cursorHoriz rem 8) + 8;
                  if cursorHoriz > HORIZ_CHAR_MAX then
                     cursorHoriz <= HORIZ_CHAR_MAX;
                  end if;
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
                 gstartAddr <= 0;
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
                  if paramCount=1 then    -- ESC[{param1}
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
                    gstartAddr <= 0;
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
                    gstartAddr <= 0;
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
