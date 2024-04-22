--
-- eseps2smx.vhd
--   PS/2 keyboard interface for SM-X and derivatives
--   Revision 1.00
--
-- Copyright (c) 2006 Kazuhiro Tsujikawa (ESE Artists' factory)
-- All rights reserved.
--
-- Redistribution and use of this source code or any derivative works, are
-- permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice,
--    this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright
--    notice, this list of conditions and the following disclaimer in the
--    documentation and/or other materials provided with the distribution.
-- 3. Redistributions may not be sold, nor may they be used in a commercial
--    product or activity without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
-- TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-- OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
--------------------------------------------------------------------------------
-- Update note by KdL
--------------------------------------------------------------------------------
-- Oct 25 2010 - Updated the led of CMT to make it work with the I/O ports.
-- Jun 04 2010 - Fixed a bug where the shift key is not broken after a pause.
-- Mar 15 2008 - Added the CMT switch.
-- Aug 05 2013 - Typing any key during an hard reset the keyboard could continue
--               that command after the reboot: press again the key to break it.
--------------------------------------------------------------------------------
-- Update note
--------------------------------------------------------------------------------
-- Oct 05 2006 - Removed 101/106 toggle switch.
-- Sep 23 2006 - Fixed a problem where some key events are lost after 101/106
--               keyboard type switching.
-- Sep 22 2006 - Added external default keyboard layout input.
-- May 21 2005 - Modified to support Quartus2we5.
-- Jan 24 2004 - Fixed a locking key problem if 101/106 keyboard type is
--               switched during pressing keys.
--             - Fixed a problem where a comma key is pressed after a
--               pause key.
-- Jan 23 2004 - Added a 101 keyboard table.
-- Jan 16 2017 - Improved compatibility for some PS/2 keyboards. (by プー)
-- Aug  6 2021 - Added control-key status in Fkeys(6). by t.hara
-- Apr 12 2022 - Version for SM-X having two extra pins, disable bi-drectional
--               that is needed for SMX-HB when using internal keyboard, and
--               internal keymap selection, that is need for SMX-HB when using
--               internal keyboard that requires a very specific layout
-- Apr 18 2022 - Version for SMX-HB now handles the FKEYS different when using
--               the second layout, as the internal Hotbit keyboard doesn't
--               have PAGE UP and PAGE DOWN as it is a MSX Keyboard :)
-- Apr 19 2022 - SMX-HB internal keyboard conversion to PS/2 keyboard doesn't
--               use the usual scan code for F8 / Select, adjusted the
--               alternative map to enable select, it uses 0xF8 instead
-- Apr 24 2022 - SMX-HB FKEYS replacement final version:
--                  Page-Up     : SELECT + =/+
--                  Page-Down   : SELECT + -/_
--                  F9-F12      : SELECT + F1-F4
--------------------------------------------------------------------------------
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity eseps2smx is
  port (
    clk21m   : in std_logic;
    reset    : in std_logic;
    clkena   : in std_logic;

    Kmap     : in std_logic;

    Caps     : inout std_logic;
    Kana     : inout std_logic;
    Paus     : inout std_logic;
    Scro     : inout std_logic;
    Reso     : inout std_logic;

    -- | b7    | b6    | b5     | b4     | b3     | b2     | b1     | b0  |
    -- | SHIFT | LCTRL | PgUp   | PgDn   | F9     | F10    | F11    | F12    | on regular map
    -- | SHIFT | LCTRL | SEL+Up | SEL+Dn | SEL+F1 | SEL+F2 | SEL+F3 | SEL+F4 | on EnAltMap
    Fkeys    : buffer std_logic_vector(7 downto 0);

    pPs2Clk  : inout std_logic;
    pPs2Dat  : inout std_logic;

    PpiPortC : in  std_logic_vector(7 downto 0);
    pKeyX    : out std_logic_vector(7 downto 0);

    CmtScro  : inout std_logic;
    DisBiDir : in std_logic := '0';
    HB_Model : in std_logic := '1';
    EnAltMap : in std_logic := '0'
    );
end eseps2smx;

architecture RTL of eseps2smx is

  signal KeyWe   : std_logic;
  signal KeyRow  : std_logic_vector(7 downto 0);
  signal iKeyCol : std_logic_vector(7 downto 0);
  signal oKeyCol : std_logic_vector(7 downto 0);
  signal MtxIdx  : std_logic_vector(10 downto 0);
  signal MtxPtr  : std_logic_vector(7 downto 0);
  signal MtxPtr1 : std_logic_vector(7 downto 0);
  signal MtxPtr2 : std_logic_vector(7 downto 0);

  component ram is
    port (
      adr : in  std_logic_vector(7 downto 0);
      clk : in  std_logic;
      we  : in  std_logic;
      dbo : in  std_logic_vector(7 downto 0);
      dbi : out std_logic_vector(7 downto 0)
    );
  end component;

  component keymap is
    port (
      adr : in std_logic_vector(10 downto 0);
      clk : in std_logic;
      dbi : out std_logic_vector(7 downto 0)
    );
  end component;

  component keymapalt is
    port (
      adr : in std_logic_vector(10 downto 0);
      clk : in std_logic;
      dbi : out std_logic_vector(7 downto 0)
    );
  end component;

begin

  -- MtxPtr assignment
  MtxPtr <= MtxPtr1 when( EnAltMap = '0' ) else ( MtxPtr2 );

  process(clk21m, reset, Kmap)

    type typPs2Seq is (Ps2Idle, Ps2Rxd, Ps2Txd, Ps2Stop);
    variable Ps2Seq : typPs2Seq;
    variable Ps2Chg : std_logic;
    variable Ps2brk : std_logic;
    variable Ps2xE0 : std_logic;
    variable Ps2xE1 : std_logic;
    variable Ps2Cnt : std_logic_vector(3 downto 0);
    variable Ps2Clk : std_logic_vector(2 downto 0);
    variable Ps2Dat : std_logic_vector(7 downto 0);
    variable Ps2Led : std_logic_vector(8 downto 0);
    variable Ps2Skp : std_logic_vector(2 downto 0);
    variable timout : std_logic_vector(15 downto 0);

    variable Ps2Caps : std_logic;
    variable Ps2Kana : std_logic;
--  variable Ps2Paus : std_logic;
--  variable Ps2Scro : std_logic;       -- used for 101/106 key table switching
    variable Ps2Scro : std_logic;       -- used for CMT switching
    variable Ps2Shif : std_logic;       -- real shift status
    variable Ps2Vshi : std_logic;       -- virtual shift status
    variable Ps2Ctrl : std_logic;       -- real control status
    variable Ps2F8   : std_logic;       -- real F8 status for internal SMX-HB Keyboard or PS/2 Keyboard
    variable oFkeys  : std_logic_vector(7 downto 0);

    variable KeyId   : std_logic_vector(8 downto 0);

    type typMtxSeq is (MtxIdle, MtxSettle, MtxClean, MtxRead, MtxWrite, MtxEnd, MtxReset);
    variable MtxSeq : typMtxSeq;
    variable MtxTmp : std_logic_vector(3 downto 0);

    variable FAflag : std_logic;
  begin

    if( reset = '1' )then

      Ps2Seq  := Ps2Idle;
      Ps2Chg  := '0';
      Ps2brk  := '0';
      Ps2xE0  := '0';
      Ps2xE1  := '0';
      Ps2Cnt  := (others => '0');
      Ps2Clk  := (others => '1');
      Ps2Dat  := (others => '1');
      timout  := (others => '1');
      Ps2Led  := (others => '1');
      Ps2Vshi := '0';
      Ps2Skp  := "000";
      Ps2F8   := '0';

      Ps2Caps := '1';
      Ps2Kana := '1';
--    Ps2Paus := '0';

      Paus    <= '0';
      Reso    <= '0';
      Scro    <= '0';
      Fkeys   <= (others => '0');
      oFkeys  := (others => '0');

      MtxSeq  := MtxIdle;

      if ( DisBiDir = '0' )then pPs2Dat <= 'Z'; end if;
      pKeyX   <= (others => '1');

      KeyWe   <= '0';
      KeyRow  <= (others => '0');
      iKeyCol <= (others => '0');
      FAflag := '0';

    elsif( clk21m'event and clk21m = '1' )then
      oFkeys := Fkeys;

      if clkena = '1' then
        -- "Scan table > MSX key-matrix" conversion
        case MtxSeq is
          when MtxIdle =>

            if Ps2Chg = '1' then

              KeyId := Ps2xE0 & Ps2Dat;
              -- Non Jap and PS2 Keyboard
              if Kmap = '1' and EnAltMap = '0' then
                MtxSeq := MtxSettle;
                MtxIdx <= "0" & (not Ps2Shif) & KeyId;
              -- Expert or Hotbit Keyboard, returns right map
              elsif Kmap = '1' and EnAltMap = '1' then
                MtxSeq := MtxSettle;
                MtxIdx <= (not HB_Model) & (not Ps2Shif) & KeyId;
              -- Jap and not Expert Keyboard
              else
                MtxSeq := MtxRead;
                MtxIdx <= "10" & KeyId;
              end if;
              pKeyX <= (others => '1');

            else

              for i in 7 downto 1 loop
                if oKeyCol(i) = '1' then
                  pKeyX(i) <= '0';
                else
                  pKeyX(i) <= '1';
                end if;
              end loop;
              if PpiPortC(3 downto 0) = "0110" then
                if( Kmap = '0' and oKeyCol(0) = '1') or (Kmap = '1' and Ps2Vshi = '1' )then
                  pKeyX(0) <= '0';
                else
                  pKeyX(0) <= '1';
                end if;
              else
                if oKeyCol(0) = '1' then
                  pKeyX(0) <= '0';
                else
                  pKeyX(0) <= '1';
                end if;
              end if;
              KeyRow <= "0000" & PpiPortC(3 downto 0);
            end if;

          when MtxSettle =>
            MtxSeq := MtxClean;
            KeyWe  <= '0';
            KeyRow <= "0000" & MtxPtr(3 downto 0);

          when MtxClean =>
            MtxSeq := MtxRead;
            KeyWe <= '1';
            iKeyCol <= oKeyCol;
            iKeyCol(conv_integer(MtxPtr(6 downto 4))) <= '0';
            if ( EnAltMap = '0' ) then
                MtxIdx <= "0" & Ps2Shif & KeyId;
            else
                MtxIdx <= (not HB_Model) & Ps2Shif & KeyId;
            end if;

          when MtxRead =>
            MtxSeq := MtxWrite;
            KeyWe <= '0';
            KeyRow <= "0000" & MtxPtr(3 downto 0);
            if( Ps2Brk = '0' )then
              Ps2Vshi := MtxPtr(7);
            else
              Ps2Vshi := Ps2Shif;
            end if;

          when MtxWrite  =>
            MtxSeq := MtxEnd;
            KeyWe <= '1';
            iKeyCol <= oKeyCol;
            iKeyCol(conv_integer(MtxPtr(6 downto 4))) <= not Ps2brk;

          when MtxEnd  =>
            MtxSeq := MtxIdle;
            KeyWe <= '0';
            KeyRow <= "0000" & PpiPortC(3 downto 0);
            Ps2Chg := '0';
            Ps2brk := '0';
            Ps2xE0 := '0';
            Ps2xE1 := '0';

          when MtxReset =>
            if MtxTmp = "1011" then
              MtxSeq := MtxIdle;
              KeyWe <= '0';
              KeyRow <= "0000" & PpiPortC(3 downto 0);
            end if;
            KeyWe   <= '1';
            KeyRow  <= "0000" & MtxTmp;
            iKeyCol <= (others => '0');
            MtxTmp := MtxTmp + '1';

          when others =>
            MtxSeq := MtxIdle;

        end case;

      end if;

      -- "PS/2 interface > Scan table" conversion
      if( clkena = '1' )then

        if( Ps2Clk = "100" )then        -- clk inactive
          Ps2Clk(2) := '0';
          timout := X"01FF";            -- countdown timeout (143us = 279ns x 512clk, exceed 100us)

          if( Ps2Seq = Ps2Idle )then
            if ( DisBiDir = '0' )then pPs2Dat <= 'Z'; end if;
            Ps2Seq := Ps2Rxd;
            Ps2Cnt := (others => '0');
          elsif( Ps2Seq = Ps2Txd )then
            if( Ps2Cnt < x"9" )then
              if ( DisBiDir = '0' )then
                if( Ps2Led(0) = '1' )then
                    pPs2Dat <= 'Z';
                else
                    pPs2Dat <= '0';
                end if;
              end if;
              Ps2Led := Ps2Led(0) & Ps2Led(8 downto 1);
              Ps2Dat := '1' & Ps2Dat(7 downto 1);
            elsif( Ps2Cnt = x"9" and DisBiDir = '0' )then
              pPs2Dat <= 'Z';
            elsif( Ps2Cnt = x"a" )then
              Ps2Caps := Caps;
              Ps2Kana := Kana;
--            Ps2Paus := Paus;
              Ps2Scro := CmtScro;
              Ps2Seq := Ps2Idle;
            end if;
            Ps2Cnt := Ps2Cnt + 1;
          elsif( Ps2Seq = Ps2Rxd )then
            if( Ps2Cnt < x"8" )then
              Ps2Dat := pPs2Dat & Ps2Dat(7 downto 1);
            elsif( Ps2Cnt = x"8" )then
              Ps2Seq := Ps2Stop;
            end if;
            Ps2Cnt := Ps2Cnt + 1;

          elsif( Ps2Seq = Ps2Stop )then
            Ps2Seq := Ps2Idle;
            if( Ps2Dat = X"AA" and FAflag = '0' )then    -- BAT code (basic assurance test)
              Ps2Caps := not Caps;
              Ps2Kana := not Kana;
--            Ps2Paus := not Paus;
              Ps2Scro := not CmtScro;
            elsif Ps2Skp /= "000" then  -- Skip some sequences
              Ps2Skp := Ps2Skp - 1;
            elsif( Ps2Dat = X"14" and Ps2xE0 = '0' and Ps2xE1 = '1' )then -- pause/break make
              if Ps2brk = '0' then
                Paus <= not Paus;       -- CPU pause or other purpose
                Ps2Skp := "110";        -- Skip the next 6 sequences

                Ps2Dat := X"12";        -- shift + pause bug fixed
                Ps2xE0 := '0';
                Ps2xE1 := '0';
              end if;
            elsif( Ps2Dat = X"7C" and Ps2xE0 = '1' and Ps2xE1 = '0' )then -- printscreen make
              if Ps2brk = '0' then
                Reso <= not Reso;       -- toggle display mode
              end if;
              Ps2Chg := '1';
            elsif( Ps2Dat = X"7D" and Ps2xE0 = '1' and Ps2xE1 = '0' )then -- PgUp make
              if Ps2brk = '0' then
                oFkeys(5) := not oFkeys(5);
              end if;
              Ps2Chg := '1';
            elsif( Ps2Dat = X"7A" and Ps2xE0 = '1' and Ps2xE1 = '0' )then -- PgDn make
              if Ps2brk = '0' then
                oFkeys(4) := not oFkeys(4);
              end if;
              Ps2Chg := '1';
            elsif( ( Ps2Dat = X"55" and Ps2xE0 = '0' ) and Ps2xE1 = '0' and EnAltMap = '1' and Ps2F8 = '1' )then -- PgUp make internal HB Keyboard (Select + =/+)
              if Ps2brk = '0' then
                oFkeys(5) := not oFkeys(5);
              end if;
              Ps2Chg := '1';
            elsif( ( Ps2Dat = X"4E" and Ps2xE0 = '0' ) and Ps2xE1 = '0' and EnAltMap = '1' and Ps2F8 = '1' )then -- PgDn make internal HB Keyboard (Select + -/_)
              if Ps2brk = '0' then
                oFkeys(4) := not oFkeys(4);
              end if;
              Ps2Chg := '1';
            elsif( ( Ps2Dat = X"05" and Ps2xE0 = '0' ) and Ps2xE1 = '0' and EnAltMap = '1' and Ps2F8 = '1' )then -- F9 make internal HB Keyboard (Select + F1)
              if Ps2brk = '0' then
                oFkeys(3) := not oFkeys(3);
              end if;
              Ps2Chg := '1';
            elsif( ( Ps2Dat = X"06" and Ps2xE0 = '0' ) and Ps2xE1 = '0' and EnAltMap = '1' and Ps2F8 = '1' )then -- F10 make internal HB Keyboard (Select + F2)
              if Ps2brk = '0' then
                oFkeys(2) := not oFkeys(2);
              end if;
              Ps2Chg := '1';
            elsif( ( Ps2Dat = X"04" and Ps2xE0 = '0' ) and Ps2xE1 = '0' and EnAltMap = '1' and Ps2F8 = '1' )then -- F11 make internal HB Keyboard (Select + F3)
              if Ps2brk = '0' then
                oFkeys(1) := not oFkeys(1);
              end if;
              Ps2Chg := '1';
            elsif( ( Ps2Dat = X"0C" and Ps2xE0 = '0' ) and Ps2xE1 = '0' and EnAltMap = '1' and Ps2F8 = '1' )then -- F12 make internal HB Keyboard (Select + F4)
              if Ps2brk = '0' then
                oFkeys(0) := not oFkeys(0);
              end if;
              Ps2Chg := '1';
            elsif( Ps2Dat = X"01" and Ps2xE0 = '0' and Ps2xE1 = '0' )then -- F9 make
              if Ps2brk = '0' then
                oFkeys(3) := not oFkeys(3);
              end if;
              Ps2Chg := '1';
            elsif( Ps2Dat = X"09" and Ps2xE0 = '0' and Ps2xE1 = '0' )then -- F10 make
              if Ps2brk = '0' then
                oFkeys(2) := not oFkeys(2);
              end if;
              Ps2Chg := '1';
            elsif( Ps2Dat = X"78" and Ps2xE0 = '0' and Ps2xE1 = '0' )then -- F11 make
              if Ps2brk = '0' then
                oFkeys(1) := not oFkeys(1);
              end if;
              Ps2Chg := '1';
            elsif( Ps2Dat = X"07" and Ps2xE0 = '0' and Ps2xE1 = '0' )then -- F12 make
              if Ps2brk = '0' then
                oFkeys(0) := not oFkeys(0);     --  old toggle OnScreenDisplay enable
              end if;
              Ps2Chg := '1';
            elsif( Ps2Dat = X"7E" and Ps2xE0 = '0' and Ps2xE1 = '0' )then -- scroll-lock make
              if Ps2brk = '0' then
                Scro <= not Scro;  -- toggle scroll lock (currently used for CMT or OPL3 switch)
            --    Scro <= not Scro;  -- toggle scroll lock (currently used for 101/106 keyboard switch)
            --    MtxTmp := "0000";
            --    MtxSeq := MtxReset;
              end if;
              Ps2Chg := '1';
            elsif( (Ps2Dat = X"12" or Ps2Dat = X"59") and Ps2xE0 = '0' and Ps2xE1 ='0' )then -- shift make
              Ps2Shif:= not Ps2brk;
              oFkeys(7) := Ps2Shif;
              Ps2Chg := '1';
            -- Added from sm_eseps2.v adapted here:
            -- CTRL Left == 'h14   (memo: CTRL Right == 'hE0:'h14 is EXECUTE, not CTRL)
            elsif( Ps2Dat = X"14" and Ps2xE1 = '0' and Ps2xE0 = '0' )then -- control make, Added by t.hara, 2021/Aug/6th
              Ps2Ctrl:= not Ps2brk;
              oFkeys(6) := Ps2Ctrl;
              Ps2Chg := '1';
            elsif( ( Ps2Dat = X"F8" or Ps2Dat = X"0A" ) and Ps2xE1 = '0' )then -- SELECT on PS/2 or SMX-HB Internal Keyboard, Added by Ducasp, 2022/Apr/19th
              Ps2F8:= not Ps2brk;
              Ps2Chg := '1';
            elsif( Ps2Dat = X"F0" )then -- break code
              Ps2brk := '1';
            elsif( Ps2Dat = X"E0" )then -- extnd code E0
              Ps2xE0 := '1';
            elsif( Ps2Dat = X"E1" )then -- extnd code E1 (ignore)
              Ps2xE1 := '1';
            elsif( Ps2Dat = X"FA" )then -- Ack of "EDh" command
              Ps2Seq := Ps2Idle;
              FAflag := '1';
            else
              Ps2Chg := '1';
            end if;

          end if;

        elsif( Ps2Clk = "011" )then     -- clk active
          Ps2Clk(2) := '1';
          timout := X"01FF";            -- countdown timeout (143us = 279ns x 512clk, exceed 100us)

        elsif( timout = X"0000" )then   -- timeout

          if ( DisBiDir = '0' )then pPs2Dat <= 'Z'; end if;
          Ps2Seq := Ps2Idle;            -- to Idle state

          if( Ps2Seq = Ps2Idle and Ps2Clk(2) = '1' and DisBiDir = '0' )then

            if( FAflag = '1' and Ps2Led = "111101101" )then
              Ps2Seq := Ps2Txd;         -- Tx data state
              pPs2Dat <= '0';
              Ps2Cnt := (others => '0');

              -- Ps2Led := (Caps xor Kana xor Paus xor '1') & "00000" & (not Caps) & (not Kana) & Paus;
              Ps2Led := (Caps xor Kana xor CmtScro xor '1') & "00000" & (not Caps) & (not Kana) & CmtScro;
              timout := X"FFFF";        -- countdown timeout (18.3ms = 279ns x 65536clk, exceed 1ms)

            elsif( Caps /= Ps2Caps or Kana /= Ps2Kana or CmtScro /= Ps2Scro )then
              Ps2Seq := Ps2Txd;         -- Tx data state
              pPs2Dat <= '0';
              Ps2Cnt := (others => '0');
              Ps2Led := "111101101";    -- Command EDh
              timout := X"FFFF";        -- countdown timeout (18.3ms = 279ns x 65536clk, exceed 1ms)

              FAflag := '0';
            end if;
          end if;

        else
          timout := timout - 1;         -- countdown timeout

        end if;

        Ps2Clk(1) := Ps2Clk(0);
        Ps2Clk(0) := pPs2Clk;


      end if;

    end if;

    Fkeys <= oFkeys;

  end process;

  pPs2Clk <= 'Z' when( DisBiDir = '0' );

  U1 : ram        port map( KeyRow, clk21m, KeyWe, iKeyCol, oKeyCol );
  U2 : keymap     port map( MtxIdx, clk21m, MtxPtr1 );
  U3 : keymapalt  port map( MtxIdx, clk21m, MtxPtr2 );

end RTL;
