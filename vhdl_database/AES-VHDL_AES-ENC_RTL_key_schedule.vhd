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

entity key_schedule is
	port (
		clk : in std_logic;
		rst : in std_logic;
		key : in std_logic_vector(127 downto 0);
		round_const : in std_logic_vector(7 downto 0);
		round_key : out std_logic_vector(127 downto 0)
	);
end key_schedule;

architecture behavioral of key_schedule is
	signal feedback : std_logic_vector(127 downto 0);
	signal reg_input : std_logic_vector(127 downto 0);
	signal reg_output : std_logic_vector(127 downto 0);
begin
	reg_input <= key when rst = '0' else feedback;
	reg_inst : entity work.reg
		generic map(
			size => 128
		)
		port map(
			clk => clk,
			d   => reg_input,
			q   => reg_output
		);	
	key_sch_round_function_inst : entity work.key_sch_round_function
		port map(
			subkey      => reg_output,
			round_const => round_const,
			next_subkey => feedback
		);
	round_key <= reg_output;
end architecture behavioral;
