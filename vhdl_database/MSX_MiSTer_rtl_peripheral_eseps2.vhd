--
-- eseps2.vhd
--   PS/2 keyboard interface for ESE-MSX
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
--------------------------------------------------------------------------------
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity eseps2 is
  port (
    clk21m   : in std_logic;
    reset    : in std_logic;
    clkena   : in std_logic;

    Kmap     : in std_logic;

    Paus     : inout std_logic;
    Scro     : inout std_logic;
    Reso     : inout std_logic;

    -- | b7  | b6   | b5   | b4   | b3  | b2  | b1  | b0  |
    -- | SHI | --   | PgUp | PgDn | F9  | F10 | F11 | F12 |
    Fkeys    : out std_logic_vector(7 downto 0);

    ps2_key  : in  std_logic_vector(10 downto 0);

    PpiPortC : in  std_logic_vector(7 downto 0);
    pKeyX    : out std_logic_vector(7 downto 0)
    );
end eseps2;

architecture RTL of eseps2 is

  signal KeyWe   : std_logic;
  signal KeyRow  : std_logic_vector(7 downto 0);
  signal iKeyCol : std_logic_vector(7 downto 0);
  signal oKeyCol : std_logic_vector(7 downto 0);
  signal MtxIdx  : std_logic_vector(10 downto 0);
  signal MtxPtr  : std_logic_vector(7 downto 0);
  signal oFkeys  : std_logic_vector(7 downto 0);
  signal stb     : std_logic;

begin

  process(clk21m, reset, Kmap)

    variable Ps2Chg : std_logic;
    variable Ps2brk : std_logic;
    variable Ps2xE0 : std_logic;
    variable Ps2Dat : std_logic_vector(7 downto 0);

    variable Ps2Shif : std_logic;       -- real shift status
    variable Ps2Vshi : std_logic;       -- virtual shift status

    variable KeyId   : std_logic_vector(8 downto 0);

    type typMtxSeq is (MtxIdle, MtxSettle, MtxClean, MtxRead, MtxWrite, MtxEnd, MtxReset);
    variable MtxSeq : typMtxSeq;
    variable MtxTmp : std_logic_vector(3 downto 0);

  begin

    if rising_edge(clk21m) then
		 
       stb <= ps2_key(10);
		 
       if( reset = '1' )then
   
         Ps2Chg  := '0';
         Ps2brk  := '0';
         Ps2xE0  := '0';
         Ps2Dat  := (others => '1');
         Ps2Vshi := '0';
   
         Paus    <= '0';
         Reso    <= '0';                   -- Sync to ff_Reso
         Scro    <= '0';                   -- Sync to ff_Scro
         oFkeys  <= (others => '0');       -- Sync to vFkeys
   
         MtxSeq  := MtxIdle;
   
         pKeyX   <= (others => '1');
   
         KeyWe   <= '0';
         KeyRow  <= (others => '0');
         iKeyCol <= (others => '0');

		elsif clkena = '1' then
        -- "Scan table > MSX key-matrix" conversion
        case MtxSeq is
          when MtxIdle =>

            if Ps2Chg = '1' then

              KeyId := Ps2xE0 & Ps2Dat;
              if Kmap = '1' then
                MtxSeq := MtxSettle;
                MtxIdx <= "0" & (not Ps2Shif) & KeyId;
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
            MtxIdx <= "0" & Ps2Shif & KeyId;

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
      if( stb /= ps2_key(10) )then
		
         Ps2Dat := ps2_key(7 downto 0);
         Ps2xE0 := ps2_key(8);
         Ps2brk := not ps2_key(9);

         if( Ps2Dat = X"77" and Ps2xE0 = '1')then -- pause/break make
           if Ps2brk = '0' then
             Paus <= not Paus;       -- CPU pause
           end if;
         elsif( Ps2Dat = X"7C" and Ps2xE0 = '1' )then -- printscreen make
           if Ps2brk = '0' then
             Reso <= not Reso;       -- toggle display mode
           end if;
           Ps2Chg := '1';
         elsif( Ps2Dat = X"7D" and Ps2xE0 = '1' )then -- PgUp make
           if Ps2brk = '0' then
             oFkeys(5) <= not oFkeys(5);
           end if;
           Ps2Chg := '1';
         elsif( Ps2Dat = X"7A" and Ps2xE0 = '1' )then -- PgDn make
           if Ps2brk = '0' then
             oFkeys(4) <= not oFkeys(4);
           end if;
           Ps2Chg := '1';
         elsif( Ps2Dat = X"01" and Ps2xE0 = '0' )then -- F9 make
           if Ps2brk = '0' then
             oFkeys(3) <= not oFkeys(3);
           end if;
           Ps2Chg := '1';
         elsif( Ps2Dat = X"09" and Ps2xE0 = '0' )then -- F10 make
           if Ps2brk = '0' then
             oFkeys(2) <= not oFkeys(2);
           end if;
           Ps2Chg := '1';
         elsif( Ps2Dat = X"78" and Ps2xE0 = '0' )then -- F11 make
           if Ps2brk = '0' then
             oFkeys(1) <= not oFkeys(1);
           end if;
           Ps2Chg := '1';
         elsif( Ps2Dat = X"07" and Ps2xE0 = '0' )then -- F12 make
           if Ps2brk = '0' then
             oFkeys(0) <= not oFkeys(0);     --  old toggle OnScreenDisplay enable
           end if;
           Ps2Chg := '1';
         elsif( Ps2Dat = X"7E" and Ps2xE0 = '0' )then -- scroll-lock make
           if Ps2brk = '0' then
             Scro <= not Scro;  -- toggle scroll lock (currently used for CMT switch)
           end if;
           Ps2Chg := '1';
         elsif( (Ps2Dat = X"12" or Ps2Dat = X"59") and Ps2xE0 = '0' )then -- shift make
           Ps2Shif:= not Ps2brk;
           oFkeys(7) <= Ps2Shif;
           Ps2Chg := '1';
         else
           Ps2Chg := '1';
         end if;
      end if;
    end if;
  end process;

  Fkeys <= oFkeys;

  U1 : work.ram    port map( KeyRow, clk21m, KeyWe, iKeyCol, oKeyCol );
  U2 : work.keymap port map( MtxIdx, clk21m, MtxPtr );

end RTL;
