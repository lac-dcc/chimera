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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

USE work.cpu86pack.ALL;

ENTITY segregfile IS
   PORT( 
      selsreg : IN     std_logic_vector (1 DOWNTO 0);
      sibus   : IN     std_logic_vector (15 DOWNTO 0);
      wrs     : IN     std_logic;
      reset   : IN     std_logic;
      clk     : IN     std_logic;
      sdbus   : OUT    std_logic_vector (15 DOWNTO 0);
      dimux   : IN     std_logic_vector (2 DOWNTO 0);
      es_s    : OUT    std_logic_vector (15 DOWNTO 0);
      cs_s    : OUT    std_logic_vector (15 DOWNTO 0);
      ss_s    : OUT    std_logic_vector (15 DOWNTO 0);
      ds_s    : OUT    std_logic_vector (15 DOWNTO 0)
   );
END segregfile ;

architecture rtl of segregfile is

signal  esreg_s : std_logic_vector(15 downto 0);
signal  csreg_s : std_logic_vector(15 downto 0);
signal  ssreg_s : std_logic_vector(15 downto 0);
signal  dsreg_s : std_logic_vector(15 downto 0);

signal  sdbus_s     : std_logic_vector (15 downto 0);   -- internal sdbus
signal  dimux_s     : std_logic_vector (2 downto 0);    -- replaced dimux


begin

----------------------------------------------------------------------------
-- 4 registers of 16 bits each
----------------------------------------------------------------------------
  process (clk,reset)
    begin
        if reset='1' then
            esreg_s <= RESET_ES_C;
            csreg_s <= RESET_CS_C;      -- Only CS set after reset
            ssreg_s <= RESET_SS_C;
            dsreg_s <= RESET_DS_C;
        elsif rising_edge(clk) then        
         if (wrs='1') then     
            case selsreg is 
                when "00"   => esreg_s <= sibus;
                when "01"   => csreg_s <= sibus;
                when "10"   => ssreg_s <= sibus;
                when others => dsreg_s <= sibus; 
            end case;                                                                                                             
         end if;
      end if;   
    end process;  
  
  dimux_s <= dimux; 

  process (dimux_s,esreg_s,csreg_s,ssreg_s,dsreg_s)
    begin
      case dimux_s is               -- Only 2 bits required
            when "100"  => sdbus_s <= esreg_s;
            when "101"  => sdbus_s <= csreg_s;
            when "110"  => sdbus_s <= ssreg_s;
            when others => sdbus_s <= dsreg_s; 
      end case;     
  end process;

  sdbus <= sdbus_s;             -- Connect to entity

  es_s <= esreg_s;
  cs_s <= csreg_s;
  ss_s <= ssreg_s;
  ds_s <= dsreg_s;

end rtl;
