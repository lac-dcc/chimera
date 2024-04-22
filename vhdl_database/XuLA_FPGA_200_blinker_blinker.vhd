--**********************************************************************
-- Copyright 2014 by XESS Corp <http://www.xess.com>.
-- All rights reserved.

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--**********************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blinker is
    Port ( clk_i : in  STD_LOGIC;
           blinker_o : out  STD_LOGIC);
end blinker;

architecture Behavioral of blinker is
signal cnt_r : std_logic_vector(22 downto 0) := (others=>'0');
begin

process(clk_i) is
begin
  if rising_edge(clk_i) then
    cnt_r <= cnt_r + 1;
  end if;  
end process;

blinker_o <= cnt_r(22);

end Behavioral;

