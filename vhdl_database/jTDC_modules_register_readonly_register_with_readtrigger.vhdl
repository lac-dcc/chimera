-------------------------------------------------------------------------
----                                                                 ----
---- Company:  University of Bonn                                    ----
---- Engineer: John Bieling                                          ----
----                                                                 ----
-------------------------------------------------------------------------
----                                                                 ----
---- Copyright (C) 2015 John Bieling                                 ----
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

use ieee.numeric_std.all;

entity readonly_register_with_readtrigger is
   Generic (myaddress: natural := 16#FFFF#);
   Port ( databus : out  STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
           addressbus : in  STD_LOGIC_VECTOR (15 downto 0);
           readsignal : in  STD_LOGIC;
           readtrigger : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           registerbits : in  STD_LOGIC_VECTOR (31 downto 0));
end readonly_register_with_readtrigger;

architecture Behavioral of readonly_register_with_readtrigger is
begin
   
	process (CLK) begin
		if (rising_edge(CLK)) then

			if (addressbus = myaddress and readsignal='1') then
				databus <= registerbits;
				readtrigger <= '1';
			else	
				databus <= (others => 'Z');
				readtrigger <= '0';
			end if;
		end if;
	end process;

end Behavioral;
