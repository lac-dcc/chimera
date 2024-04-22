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

entity key_sch_round_function is
	port (		
		subkey : in std_logic_vector(127 downto 0);
		round_const : in std_logic_vector(7 downto 0);
		next_subkey : out std_logic_vector(127 downto 0)		
	);
end key_sch_round_function;

architecture behavioral of key_sch_round_function is
	signal substitued_sk : std_logic_vector(31 downto 0);
	signal shifted_sk : std_logic_vector(31 downto 0);
	signal w3, w2, w1, w0 : std_logic_vector(31 downto 0);
begin
	gen_sboxes : for i in 12 to 15 generate
		sbox_inst : entity work.sbox
			port map(
				input_byte  => subkey((i + 1)*8 - 1 downto i*8),
				output_byte => substitued_sk((i + 1 - 12)*8 - 1 downto (i - 12)*8)
			);			
	end generate gen_sboxes;
	shifted_sk <= substitued_sk(7 downto 0) & substitued_sk(31 downto 8);
	w0(31 downto 8) <= subkey(31 downto 8) xor shifted_sk(31 downto 8);
    w0(7 downto 0) <= subkey(7 downto 0) xor round_const xor shifted_sk(7 downto 0);
    w1 <= subkey(63 downto 32) xor w0;
    w2 <= subkey(95 downto 64) xor w1;
    w3 <= subkey(127 downto 96) xor w2;
	next_subkey <= w3 & w2 & w1 & w0;
		
end architecture behavioral;

