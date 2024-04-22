-- VHDL implementation of AES
-- Copyright (C) 2019  Hosein Hadipour

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.


library ieee;
use ieee.std_logic_1164.all;

entity add_round_key is
	port (
		input1 : in std_logic_vector(127 downto 0);
		input2 : in std_logic_vector(127 downto 0);
		output : out std_logic_vector(127 downto 0)
	);
end add_round_key;

architecture rtl of add_round_key is
	
begin
	output <= input1 xor input2;		
end architecture rtl;
