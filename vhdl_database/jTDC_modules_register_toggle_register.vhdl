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

entity toggle_register is
   Generic (myaddress: natural);
   Port ( databus : inout  STD_LOGIC_VECTOR (31 downto 0);
           addressbus : in  STD_LOGIC_VECTOR (15 downto 0);
           info : in  STD_LOGIC_VECTOR (31 downto 0);
           writesignal : in  STD_LOGIC;
           readsignal : in STD_LOGIC;  
           CLK : in  STD_LOGIC;
           registerbits : out  STD_LOGIC_VECTOR (31 downto 0));
end toggle_register;

architecture Behavioral of toggle_register is

signal memory : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

begin

	registerbits  <= memory;
	process (CLK) begin
		if (rising_edge(CLK)) then
			
			memory <= (others => '0');
			
			if (addressbus = myaddress) 
			then 

				if (writesignal = '1') then 
					memory <= databus;
				elsif (readsignal = '1') then
					databus(31 downto 0) <= info;
				else
					databus <= (others => 'Z');
				end if;
			else
				databus <= (others => 'Z');
			end if;

		end if;
	end process;
	
end Behavioral;
