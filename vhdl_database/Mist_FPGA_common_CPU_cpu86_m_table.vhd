-------------------------------------------------------------------------------
--  CPU86 - VHDL CPU8088 IP core                                             --
--  Copyright (C) 2002-2008 HT-LAB                                           --
--                                                                           --
--  Contact/bugs : http://www.ht-lab.com/misc/feedback.html                  --
--  Web          : http://www.ht-lab.com                                     --
--                                                                           --
--  CPU86 is released as open-source under the GNU GPL license. This means   --
--  that designs based on CPU86 must be distributed in full source code      --
--  under the same license. Contact HT-Lab for commercial applications where --
--  source-code distribution is not desirable.                               --
--                                                                           --
-------------------------------------------------------------------------------
--                                                                           --
--  This library is free software; you can redistribute it and/or            --
--  modify it under the terms of the GNU Lesser General Public               --
--  License as published by the Free Software Foundation; either             --
--  version 2.1 of the License, or (at your option) any later version.       --
--                                                                           --
--  This library is distributed in the hope that it will be useful,          --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of           --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU        --
--  Lesser General Public License for more details.                          --
--                                                                           --
--  Full details of the license can be found in the file "copying.txt".      --
--                                                                           --
--  You should have received a copy of the GNU Lesser General Public         --
--  License along with this library; if not, write to the Free Software      --
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA  --
--                                                                           --
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity m_table is
  port ( ireg  : in std_logic_vector(7 downto 0);
         modrrm: in std_logic_vector(7 downto 0);
         muxout: out std_logic_vector(7 downto 0));
end m_table;


architecture rtl of m_table is

  signal lutout_s: std_logic_vector(1 downto 0);
  signal ea_s    : std_logic;     -- Asserted if mod=00 and rm=110
  signal m11_s   : std_logic;     -- Asserted if mod=11
  signal mux_s   : std_logic_vector(3 downto 0);

begin

  ea_s <= '1' when (modrrm(7 downto 6)="00" and modrrm(2 downto 0)="110") else '0';

  m11_s<= '1' when modrrm(7 downto 6)="11" else '0';

  mux_s <= lutout_s & m11_s & ea_s;

  process (mux_s,modrrm)
  begin
    case mux_s is
       when "1000" => muxout <= modrrm(7 downto 6)&"000000";   
       when "1010" => muxout <= modrrm(7 downto 6)&"000000";   
       when "1001" => muxout <= "00000110";                    
       when "1011" => muxout <= "00000110";                    
       when "1100" => muxout <= modrrm(7 downto 3)&"000";      
       when "1101" => muxout <= "00"&modrrm(5 downto 3)&"110"; 
       when "1110" => muxout <= "11"&modrrm(5 downto 3)&"000"; 
       when others => muxout <= (others => '0');               
    end case;
  end process;

  process(ireg)
  begin
    case ireg is
       when "11111111" => lutout_s <= "11"; 
       when "10001000" => lutout_s <= "10"; 
       when "10001001" => lutout_s <= "10"; 
       when "10001010" => lutout_s <= "10"; 
       when "10001011" => lutout_s <= "10"; 
       when "11000110" => lutout_s <= "11"; 
       when "11000111" => lutout_s <= "11"; 
       when "10001110" => lutout_s <= "10"; 
       when "10001100" => lutout_s <= "10"; 
       when "10001111" => lutout_s <= "11"; 
       when "10000110" => lutout_s <= "10"; 
       when "10000111" => lutout_s <= "10"; 
       when "10001101" => lutout_s <= "10"; 
       when "11000101" => lutout_s <= "10"; 
       when "11000100" => lutout_s <= "10"; 
       when "00000000" => lutout_s <= "10"; 
       when "00000001" => lutout_s <= "10"; 
       when "00000010" => lutout_s <= "10"; 
       when "00000011" => lutout_s <= "10"; 
       when "10000000" => lutout_s <= "11"; 
       when "10000001" => lutout_s <= "11"; 
       when "10000011" => lutout_s <= "11"; 
       when "00010000" => lutout_s <= "10"; 
       when "00010001" => lutout_s <= "10"; 
       when "00010010" => lutout_s <= "10"; 
       when "00010011" => lutout_s <= "10"; 
       when "00101000" => lutout_s <= "10"; 
       when "00101001" => lutout_s <= "10"; 
       when "00101010" => lutout_s <= "10"; 
       when "00101011" => lutout_s <= "10"; 
       when "00011000" => lutout_s <= "10"; 
       when "00011001" => lutout_s <= "10"; 
       when "00011010" => lutout_s <= "10"; 
       when "00011011" => lutout_s <= "10"; 
       when "11111110" => lutout_s <= "11"; 
       when "00111010" => lutout_s <= "10"; 
       when "00111011" => lutout_s <= "10"; 
       when "00111000" => lutout_s <= "10"; 
       when "00111001" => lutout_s <= "10"; 
       when "11110110" => lutout_s <= "11"; 
       when "11110111" => lutout_s <= "11"; 
       when "11010000" => lutout_s <= "10"; 
       when "11010001" => lutout_s <= "10"; 
       when "11010010" => lutout_s <= "10"; 
       when "11010011" => lutout_s <= "10"; 
       when "00100000" => lutout_s <= "10"; 
       when "00100001" => lutout_s <= "10"; 
       when "00100010" => lutout_s <= "10"; 
       when "00100011" => lutout_s <= "10"; 
       when "00001000" => lutout_s <= "10"; 
       when "00001001" => lutout_s <= "10"; 
       when "00001010" => lutout_s <= "10"; 
       when "00001011" => lutout_s <= "10"; 
       when "10000100" => lutout_s <= "10"; 
       when "10000101" => lutout_s <= "10"; 
       when "00110000" => lutout_s <= "10"; 
       when "00110001" => lutout_s <= "10"; 
       when "00110010" => lutout_s <= "10"; 
       when "00110011" => lutout_s <= "10"; 
       when "10000010" => lutout_s <= "01";        
       when others     => lutout_s <= "00"; 
    end case;
  end process;
end rtl;