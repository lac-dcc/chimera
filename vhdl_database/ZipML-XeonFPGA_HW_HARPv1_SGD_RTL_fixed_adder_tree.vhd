----------------------------------------------------------------------------
--  Copyright (C) 2017 Kaan Kara - Systems Group, ETH Zurich

--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU Affero General Public License as published
--  by the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.

--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU Affero General Public License for more details.

--  You should have received a copy of the GNU Affero General Public License
--  along with this program. If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fixed_adder_tree is
generic (VECTOR_SIZE_BITS : integer := 4);
port (
	clk : in std_logic;
	trigger : in std_logic;
	vector : in std_logic_vector(32*2**VECTOR_SIZE_BITS-1 downto 0);
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end fixed_adder_tree;

architecture behavioral of fixed_adder_tree is

constant TREE_DEPTH : integer := VECTOR_SIZE_BITS;
constant VECTOR_SIZE : integer := 2**VECTOR_SIZE_BITS;

type intermediate_vector_type is array (VECTOR_SIZE-1 downto 0) of signed(31 downto 0);
type intermediate_result_type is array (TREE_DEPTH downto 0) of intermediate_vector_type;
signal intermediate_result : intermediate_result_type;

signal internal_trigger : std_logic_vector(TREE_DEPTH downto 0);

begin

result_valid <= internal_trigger(TREE_DEPTH);
result <= std_logic_vector( intermediate_result(TREE_DEPTH)(0) );

process(clk)
begin
if clk'event and clk = '1' then
	for k in 0 to VECTOR_SIZE-1 loop
		intermediate_result(0)(k) <= signed(vector(k*32+31 downto k*32));
	end loop;

	for d in 0 to TREE_DEPTH-1 loop
		for k in 0 to 2**(TREE_DEPTH-d-1)-1 loop
			intermediate_result(d+1)(k) <= intermediate_result(d)(2*k) + intermediate_result(d)(2*k+1);
		end loop;
	end loop;

	internal_trigger(0) <= trigger;

	for d in 1 to TREE_DEPTH loop
		internal_trigger(d) <= internal_trigger(d-1);
	end loop;
end if;
end process;

end architecture;