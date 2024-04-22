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

entity mix_columns is
	port (
		input_data : in std_logic_vector(127 downto 0);
		output_data : out std_logic_vector(127 downto 0)
	);
end mix_columns;

architecture rtl of mix_columns is
	
begin
	mix_columns_inst0 : entity work.column_calculator
		port map(
			input_data  => input_data(31 downto 0),
			output_data => output_data(31 downto 0)
		);
	mix_columns_inst1 : entity work.column_calculator
		port map(
			input_data  => input_data(63 downto 32),
			output_data => output_data(63 downto 32)
		);		
	mix_columns_inst2 : entity work.column_calculator
		port map(
			input_data  => input_data(95 downto 64),
			output_data => output_data(95 downto 64)
		);
	mix_columns_inst3 : entity work.column_calculator
		port map(
			input_data  => input_data(127 downto 96),
			output_data => output_data(127 downto 96)
		);	
end architecture rtl;
