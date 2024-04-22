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
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY multiplier IS
   GENERIC( 
      WIDTH : integer := 16
   );
   PORT( 
      multiplicant : IN     std_logic_vector (WIDTH-1 DOWNTO 0);
      multiplier   : IN     std_logic_vector (WIDTH-1 DOWNTO 0);
      product      : OUT    std_logic_vector (WIDTH+WIDTH-1 DOWNTO 0);  -- result
      twocomp      : IN     std_logic
   );
END multiplier ;


architecture rtl of multiplier is

function rectify (r    : in  std_logic_vector (WIDTH-1 downto 0);       -- Rectifier for signed multiplication
                  twoc : in  std_logic)                                 -- Signed/Unsigned
  return std_logic_vector is 
  variable rec_v       : std_logic_vector (WIDTH-1 downto 0);             
begin
    if ((r(WIDTH-1) and twoc)='1') then 
        rec_v := not(r); 
    else 
        rec_v := r;
    end if;
    return (rec_v + (r(WIDTH-1) and twoc));        
end; 

signal multiplicant_s : std_logic_vector (WIDTH-1 downto 0);          
signal multiplier_s   : std_logic_vector (WIDTH-1 downto 0);          

signal product_s    : std_logic_vector (WIDTH+WIDTH-1 downto 0);      -- Result
signal sign_s       : std_logic;

begin
    
    multiplicant_s <= rectify(multiplicant,twocomp);
    multiplier_s   <= rectify(multiplier,twocomp);

    sign_s <= multiplicant(WIDTH-1) xor multiplier(WIDTH-1);            -- sign product
    
    product_s <= multiplicant_s * multiplier_s;

    product <= ((not(product_s)) + '1') when (sign_s and twocomp)='1' else product_s;   

end rtl;
