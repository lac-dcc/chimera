----------------------------------------------------------------------------------
-- flags.vhd
--
-- Copyright (C) 2006 Michael Poppitz
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
--
----------------------------------------------------------------------------------
--
-- Details: http://www.sump.org/projects/analyzer/
--
-- Flags register.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity flags is
    Port ( data : in  STD_LOGIC_VECTOR(7 downto 0);
           clock : in  STD_LOGIC;
           write : in  STD_LOGIC;
           demux : out  STD_LOGIC;
			  filter : out STD_LOGIC;
			  external : out std_logic;
			  inverted : out std_logic
	 );
end flags;

architecture Behavioral of flags is

begin
	
	-- write flags
	process (clock)
	begin
		if rising_edge(clock) and write = '1' then
			demux <= data(0);
			filter <= data(1);
			external <= data(6);
			inverted <= data(7);
		end if;
	end process;

end Behavioral;

