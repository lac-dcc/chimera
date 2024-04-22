-------------------------------------------------------------------------
----                                                                 ----
---- Company:  University of Bonn                                    ----
---- Engineer: Daniel Hahne & John Bieling                           ----
----                                                                 ----
-------------------------------------------------------------------------
----                                                                 ----
---- Copyright (C) 2015 Daniel Hahne & John Bieling                  ----
----                                                                 ----
---- This program is free software; you can redistribute it and/or   ----
---- modify it under the terms of the GNU General Public License as  ----
---- published by the Free Software Foundation; either version 3 of  ----
---- the License, or (at your option) any later version.             ----
----                                                                 ----
---- This program is distributed in the hope that it will be useful, ----
---- but WITHOUT ANY WARRANTY; without even the implied warranty of  ----
---- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the    ----
---- GNU General Public License for more details.                    ----
----                                                                 ----
---- You should have received a copy of the GNU General Public       ----
---- License along with this program; if not, see                    ----
---- <http://www.gnu.org/licenses>.                                  ----
----                                                                 ----
-------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity leading_edge_clipper is
    Port ( input : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           output : out  STD_LOGIC := '0');
end leading_edge_clipper;

architecture Behavioral of leading_edge_clipper is
signal q1 : STD_LOGIC := '0';
signal q2 : STD_LOGIC := '0';

begin

process (input, CLK) is
begin
	if (CLK'event AND CLK = '1') then
		q2 <= q1;
		q1 <= input;
	end if;
end process;

process (CLK, q1, q2) is
begin
	if (CLK'event AND CLK = '1') then
		output <= q1 AND NOT q2;
	end if;
end process;

end Behavioral;
