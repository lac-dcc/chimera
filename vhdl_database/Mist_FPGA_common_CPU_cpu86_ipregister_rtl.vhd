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

ENTITY ipregister IS
   PORT( 
      clk   : IN     std_logic;
      ipbus : IN     std_logic_vector (15 DOWNTO 0);
      reset : IN     std_logic;
      wrip  : IN     std_logic;
      ipreg : OUT    std_logic_vector (15 DOWNTO 0)
   );
END ipregister ;


architecture rtl of ipregister is

signal ipreg_s : std_logic_vector(15 downto 0);

begin

----------------------------------------------------------------------------
-- Instructon Pointer Register
----------------------------------------------------------------------------
process (clk, reset)
    begin 
        if reset='1' then
            ipreg_s <= RESET_IP_C; -- See cpu86pack
        elsif rising_edge(clk) then
            if (wrip='1') then                                      
                ipreg_s<= ipbus;  
            end if; 
        end if; 
end process;  

ipreg <= ipreg_s;

end rtl;
