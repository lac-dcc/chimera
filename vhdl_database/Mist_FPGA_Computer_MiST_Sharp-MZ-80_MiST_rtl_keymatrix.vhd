---------------------------------------------------------------------------------------------------------
--
-- Name:            keymatrix.vhd
-- Created:         July 2018
-- Author(s):       Philip Smart
-- Description:     Keyboard module to convert PS2 key codes into Sharp scan matrix key connections.
--                  For each scan output (10 lines) sent by the Sharp, an 8bit response is read in 
--                  and the bits set indicate keys pressed. This allows for multiple keys to be pressed
--                  at the same time. The PS2 scan code is mapped via a rom and the output is used to drive
--                  the data in lines of the 8255.
--
-- Credits:         Nibbles Lab (c) 2005-2012
-- Copyright:       (c) 2018 Philip Smart <philip.smart@net2net.org>
--
-- History:         July 2018   - Initial module written, originally based on the Nibbles Lab code but
--                                rewritten to match the overall design of this emulation.
--
---------------------------------------------------------------------------------------------------------
-- This source file is free software: you can redistribute it and-or modify
-- it under the terms of the GNU General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http:--www.gnu.org-licenses->.
---------------------------------------------------------------------------------------------------------

library IEEE;
library pkgs;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity keymatrix is
    Port (
        RST_n                : in  std_logic;
        -- i8255
        PA                   : in  std_logic_vector(3 downto 0);
        PB                   : out std_logic_vector(7 downto 0);
        STALL                : in  std_logic;
        -- PS/2 Keyboard Data
        PS2_KEY              : in  std_logic_vector(10 downto 0);        -- PS2 Key data.
		  KEY_BANK             : in  std_logic_vector(2 downto 0);
        -- Clock signals used by this module.
        CKCPU               		: in  std_logic
    );
end keymatrix;

architecture Behavioral of keymatrix is

--
-- prefix flag
--
signal FLGF0                 : std_logic;
signal FLGE0                 : std_logic;
--
-- MZ-series matrix registers
--
signal SCAN00                : std_logic_vector(7 downto 0);
signal SCAN01                : std_logic_vector(7 downto 0);
signal SCAN02                : std_logic_vector(7 downto 0);
signal SCAN03                : std_logic_vector(7 downto 0);
signal SCAN04                : std_logic_vector(7 downto 0);
signal SCAN05                : std_logic_vector(7 downto 0);
signal SCAN06                : std_logic_vector(7 downto 0);
signal SCAN07                : std_logic_vector(7 downto 0);
signal SCAN08                : std_logic_vector(7 downto 0);
signal SCAN09                : std_logic_vector(7 downto 0);
signal SCAN10                : std_logic_vector(7 downto 0);
signal SCAN11                : std_logic_vector(7 downto 0);
signal SCAN12                : std_logic_vector(7 downto 0);
signal SCAN13                : std_logic_vector(7 downto 0);
signal SCAN14                : std_logic_vector(7 downto 0);
signal SCANLL                : std_logic_vector(7 downto 0);
--
-- Key code exchange table
--
signal MTEN                  : std_logic_vector(3 downto 0);
signal F_KBDT                : std_logic_vector(7 downto 0);
signal MAP_DATA              : std_logic_vector(7 downto 0);

signal KEY_EXTENDED          : std_logic;
signal KEY_FLAG              : std_logic;
signal KEY_PRESS             : std_logic;
signal KEY_VALID             : std_logic;

begin
    --
    -- Instantiation
    --
    -- 0 = MZ80K  KEYMAP = 256Bytes -> 0000:00ff 0000 bytes padding
    -- 1 = MZ80C  KEYMAP = 256Bytes -> 0100:01ff 0000 bytes padding
    -- 2 = MZ1200 KEYMAP = 256Bytes -> 0200:02ff 0000 bytes padding
    -- 3 = MZ80A  KEYMAP = 256Bytes -> 0300:03ff 0000 bytes padding
    -- 4 = MZ700  KEYMAP = 256Bytes -> 0400:04ff 0000 bytes padding
    -- 5 = MZ80B  KEYMAP = 256Bytes -> 0500:05ff 0000 bytes padding
 --   KEY_BANK     <= "000"   when CONFIG(MZ80K)  = '1'        else          -- Key map for MZ80K
 --                   "001"   when CONFIG(MZ80C)  = '1'        else          -- Key map for MZ80C
 --                   "010"   when CONFIG(MZ1200) = '1'        else          -- Key map for MZ1200
 --                   "011"   when CONFIG(MZ80A)  = '1'        else          -- Key map for MZ80A
 --                   "100"   when CONFIG(MZ700)  = '1'        else          -- Key map for MZ700
 --                   "101"   when CONFIG(MZ800)  = '1'        else          -- Key map for MZ800
 --                   "110"   when CONFIG(MZ80B)  = '1'        else          -- Key map for MZ80B
 --                   "111"   when CONFIG(MZ2000) = '1';                     -- Key map for MZ2000
 --KEY_BANK     <= "000";
 
    MAP0 : entity work.sprom
    GENERIC MAP (
      --init_file            => "./mif/key_80k_80b.mif",
      init_file            => "./roms/combined_keymap.mif",
        widthad_a            => 11,
        width_a              => 8
    ) 
    PORT MAP (
        clock              => CKCPU,
        address            => KEY_BANK & F_KBDT,
        q                  => MAP_DATA
    );

    -- Store changes to the key valid flag in a flip flop.
    process( CKCPU ) begin
        if rising_edge(CKCPU) then
            KEY_FLAG <= PS2_KEY(10);
        end if;
    end process;

    KEY_PRESS    <= PS2_KEY(9);
    KEY_EXTENDED <= PS2_KEY(8);
    KEY_VALID    <= '1'     when KEY_FLAG /= PS2_KEY(10)  else '0';

    --
    -- Convert
    --
    process( RST_n, CKCPU)  begin
        if RST_n = '0' then
            SCAN00   <= (others=>'0');
            SCAN01   <= (others=>'0');
            SCAN02   <= (others=>'0');
            SCAN03   <= (others=>'0');
            SCAN04   <= (others=>'0');
            SCAN05   <= (others=>'0');
            SCAN06   <= (others=>'0');
            SCAN07   <= (others=>'0');
            SCAN08   <= (others=>'0');
            SCAN09   <= (others=>'0');
            SCAN10   <= (others=>'0');
            SCAN11   <= (others=>'0');
            SCAN12   <= (others=>'0');
            SCAN13   <= (others=>'0');
            SCAN14   <= (others=>'0');
            FLGF0    <= '0';
            FLGE0    <= '0';
            MTEN     <= (others=>'0');

        elsif CKCPU'event and CKCPU='1' then
            MTEN     <= MTEN(2 downto 0) & KEY_VALID;
            if KEY_VALID='1' then
                if(KEY_EXTENDED='1') then
                    FLGE0  <= '1';
                end if;
                if(KEY_PRESS='0') then
                    FLGF0  <= '1';
                end if;
                if(PS2_KEY(7 downto 0) = X"AA" ) then
                    F_KBDT <= X"EF";
                else
                    F_KBDT <= FLGE0 & PS2_KEY(6 downto 0); FLGE0<='0';
                end if;
            end if;

            if MTEN(3)='1' then
                case MAP_DATA(7 downto 4) is                                 
                    when "0000" => SCAN00(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "0001" => SCAN01(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "0010" => SCAN02(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "0011" => SCAN03(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "0100" => SCAN04(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "0101" => SCAN05(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "0110" => SCAN06(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "0111" => SCAN07(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "1000" => SCAN08(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "1001" => SCAN09(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "1010" => SCAN10(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "1011" => SCAN11(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "1100" => SCAN12(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "1101" => SCAN13(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                    when "1110" => SCAN14(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0;
                    when others => SCAN14(conv_integer(MAP_DATA(2 downto 0))) <= not FLGF0; FLGF0 <= '0';
                end case;
            end if;
        end if;
    end process;

    PA_L : for I in 0 to 7 generate
        SCANLL(I) <= SCAN00(I) or SCAN01(I) or SCAN02(I) or SCAN03(I) or SCAN04(I) or
                     SCAN05(I) or SCAN06(I) or SCAN07(I) or SCAN08(I) or SCAN09(I) or
                     SCAN10(I) or SCAN11(I) or SCAN12(I) or SCAN13(I) or SCAN14(I);
    end generate PA_L;

    --
    -- response from key access
    --
    PB <= (not SCANLL) when STALL='0' and KEY_BANK="110"    else
          (not SCAN00) when PA="0000"                       else
          (not SCAN01) when PA="0001"                       else
          (not SCAN02) when PA="0010"                       else
          (not SCAN03) when PA="0011"                       else
          (not SCAN04) when PA="0100"                       else
          (not SCAN05) when PA="0101"                       else
          (not SCAN06) when PA="0110"                       else
          (not SCAN07) when PA="0111"                       else
          (not SCAN08) when PA="1000"                       else
          (not SCAN09) when PA="1001"                       else
          (not SCAN10) when PA="1010"                       else
          (not SCAN11) when PA="1011"                       else
          (not SCAN12) when PA="1100"                       else
          (not SCAN13) when PA="1101"                       else (others=>'1');



end Behavioral;
