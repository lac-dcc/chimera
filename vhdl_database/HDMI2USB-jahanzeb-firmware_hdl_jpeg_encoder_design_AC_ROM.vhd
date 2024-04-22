-------------------------------------------------------------------------------
-- File Name :  AC_ROM.vhd
--
-- Project   : JPEG_ENC
--
-- Module    : AC_ROM
--
-- Content   : AC_ROM Luminance
--
-- Description : 
--
-- Spec.     : 
--
-- Author    : Michal Krepa
--
-------------------------------------------------------------------------------
-- History :
-- 20090228: (MK): Initial Creation.
-------------------------------------------------------------------------------
-- //////////////////////////////////////////////////////////////////////////////
-- /// Copyright (c) 2013, Jahanzeb Ahmad
-- /// All rights reserved.
-- ///
-- /// Redistribution and use in source and binary forms, with or without modification, 
-- /// are permitted provided that the following conditions are met:
-- ///
-- ///  * Redistributions of source code must retain the above copyright notice, 
-- ///    this list of conditions and the following disclaimer.
-- ///  * Redistributions in binary form must reproduce the above copyright notice, 
-- ///    this list of conditions and the following disclaimer in the documentation and/or 
-- ///    other materials provided with the distribution.
-- ///
-- ///    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
-- ///    EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
-- ///    OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
-- ///    SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
-- ///    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
-- ///    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
-- ///    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
-- ///    WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
-- ///    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- ///   POSSIBILITY OF SUCH DAMAGE.
-- ///
-- ///
-- ///  * http://opensource.org/licenses/MIT
-- ///  * http://copyfree.org/licenses/mit/license.txt
-- ///
-- //////////////////////////////////////////////////////////////////////////////
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
----------------------------------- LIBRARY/PACKAGE ---------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- generic packages/libraries:
-------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- user packages/libraries:
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
----------------------------------- ENTITY ------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
entity AC_ROM is
  port 
  (
        CLK                : in  std_logic;
        RST                : in  std_logic;
        runlength          : in  std_logic_vector(3 downto 0);
        VLI_size           : in  std_logic_vector(3 downto 0);
        
        VLC_AC_size        : out unsigned(4 downto 0);
        VLC_AC             : out unsigned(15 downto 0)
    );
end entity AC_ROM;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
----------------------------------- ARCHITECTURE ------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
architecture RTL of AC_ROM is

  signal rom_addr : std_logic_vector(7 downto 0);
  
-------------------------------------------------------------------------------
-- Architecture: begin
-------------------------------------------------------------------------------
begin
  
  rom_addr <= runlength & VLI_size;

  -------------------------------------------------------------------
  -- AC-ROM
  -------------------------------------------------------------------
  p_AC_ROM : process(CLK, RST)
  begin
    if RST = '1' then
      VLC_AC_size <= (others => '0');
      VLC_AC      <= (others => '0'); 
    elsif CLK'event and CLK = '1' then
      case runlength is 
        when X"0" =>
        
          case VLI_size is
            when X"0" =>
              VLC_AC_size <= to_unsigned(4, VLC_AC_size'length);
              VLC_AC      <= resize("1010", VLC_AC'length); 
            when X"1" =>
              VLC_AC_size <= to_unsigned(2, VLC_AC_size'length);
              VLC_AC      <= resize("00", VLC_AC'length);
            when X"2" =>
              VLC_AC_size <= to_unsigned(2, VLC_AC_size'length);
              VLC_AC      <= resize("01", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(3, VLC_AC_size'length);
              VLC_AC      <= resize("100", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(4, VLC_AC_size'length);
              VLC_AC      <= resize("1011", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(5, VLC_AC_size'length);
              VLC_AC      <= resize("11010", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(7, VLC_AC_size'length);
              VLC_AC      <= resize("1111000", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(8, VLC_AC_size'length);
              VLC_AC      <= resize("11111000", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(10, VLC_AC_size'length);
              VLC_AC      <= resize("1111110110", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110000010", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110000011", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"1" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(4, VLC_AC_size'length);
              VLC_AC      <= resize("1100", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(5, VLC_AC_size'length);
              VLC_AC      <= resize("11011", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(7, VLC_AC_size'length);
              VLC_AC      <= resize("1111001", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(9, VLC_AC_size'length);
              VLC_AC      <= resize("111110110", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(11, VLC_AC_size'length);
              VLC_AC      <= resize("11111110110", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110000100", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110000101", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110000110", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110000111", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110001000", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
          
        when X"2" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(5, VLC_AC_size'length);
              VLC_AC      <= resize("11100", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(8, VLC_AC_size'length);
              VLC_AC      <= resize("11111001", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(10, VLC_AC_size'length);
              VLC_AC      <= resize("1111110111", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(12, VLC_AC_size'length);
              VLC_AC      <= resize("111111110100", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110001001", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110001010", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110001011", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110001100", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110001101", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110001110", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"3" =>
          
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(6, VLC_AC_size'length);
              VLC_AC      <= resize("111010", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(9, VLC_AC_size'length);
              VLC_AC      <= resize("111110111", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(12, VLC_AC_size'length);
              VLC_AC      <= resize("111111110101", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110001111", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110010000", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110010001", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110010010", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110010011", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110010100", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110010101", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"4" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(6, VLC_AC_size'length);
              VLC_AC      <= resize("111011", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(10, VLC_AC_size'length);
              VLC_AC      <= resize("1111111000", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110010110", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110010111", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110011000", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110011001", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110011010", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110011011", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110011100", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110011101", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"5" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(7, VLC_AC_size'length);
              VLC_AC      <= resize("1111010", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(11, VLC_AC_size'length);
              VLC_AC      <= resize("11111110111", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110011110", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110011111", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110100000", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110100001", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110100010", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110100011", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110100100", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110100101", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"6" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(7, VLC_AC_size'length);
              VLC_AC      <= resize("1111011", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(12, VLC_AC_size'length);
              VLC_AC      <= resize("111111110110", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110100110", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110100111", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110101000", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110101001", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110101010", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110101011", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110101100", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110101101", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"7" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(8, VLC_AC_size'length);
              VLC_AC      <= resize("11111010", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(12, VLC_AC_size'length);
              VLC_AC      <= resize("111111110111", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110101110", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110101111", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110110000", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110110001", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110110010", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110110011", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110110100", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110110101", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"8" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(9, VLC_AC_size'length);
              VLC_AC      <= resize("111111000", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(15, VLC_AC_size'length);
              VLC_AC      <= resize("111111111000000", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110110110", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110110111", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110111000", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110111001", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110111010", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110111011", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110111100", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110111101", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"9" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(9, VLC_AC_size'length);
              VLC_AC      <= resize("111111001", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110111110", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111110111111", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111000000", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111000001", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111000010", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111000011", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111000100", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111000101", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111000110", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"A" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(9, VLC_AC_size'length);
              VLC_AC      <= resize("111111010", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111000111", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111001000", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111001001", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111001010", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111001011", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111001100", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111001101", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111001110", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111001111", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"B" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(10, VLC_AC_size'length);
              VLC_AC      <= resize("1111111001", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111010000", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111010001", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111010010", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111010011", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111010100", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111010101", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111010110", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111010111", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111011000", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"C" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(10, VLC_AC_size'length);
              VLC_AC      <= resize("1111111010", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111011001", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111011010", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111011011", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111011100", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111011101", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111011110", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111011111", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111100000", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111100001", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"D" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(11, VLC_AC_size'length);
              VLC_AC      <= resize("11111111000", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111100010", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111100011", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111100100", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111100101", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111100110", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111100111", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111101000", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111101001", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111101010", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"E" =>
        
          case VLI_size is
            when X"1" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111101011", VLC_AC'length); 
            when X"2" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111101100", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111101101", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111101110", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111101111", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111110000", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111110001", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111110010", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111110011", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111110100", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
        
        when X"F" =>
        
          case VLI_size is
            when X"0" =>
              VLC_AC_size <= to_unsigned(11, VLC_AC_size'length);
              VLC_AC      <= resize("11111111001", VLC_AC'length); 
            when X"1" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111110101", VLC_AC'length);
            when X"2" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111110110", VLC_AC'length);
            when X"3" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111110111", VLC_AC'length);
            when X"4" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111111000", VLC_AC'length);
            when X"5" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111111001", VLC_AC'length);
            when X"6" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111111010", VLC_AC'length);
            when X"7" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111111011", VLC_AC'length);
            when X"8" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111111100", VLC_AC'length);
            when X"9" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111111101", VLC_AC'length);
            when X"A" =>
              VLC_AC_size <= to_unsigned(16, VLC_AC_size'length);
              VLC_AC      <= resize("1111111111111110", VLC_AC'length);
            when others =>
              VLC_AC_size <= to_unsigned(0, VLC_AC_size'length);
              VLC_AC      <= resize("0", VLC_AC'length);
          end case;
          
        when others =>
          VLC_AC_size <= (others => '0'); 
          VLC_AC      <= (others => '0'); 
      end case;
    end if;
  end process;
  
  

end architecture RTL;
-------------------------------------------------------------------------------
-- Architecture: end
-------------------------------------------------------------------------------