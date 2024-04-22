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

entity float_scalar_vector_mult is
generic (VECTOR_SIZE : integer := 16);
port (
	clk : in std_logic;
	trigger : in std_logic;
	scalar : in std_logic_vector(31 downto 0);
	vector : in std_logic_vector(32*VECTOR_SIZE-1 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(32*VECTOR_SIZE-1 downto 0));
end float_scalar_vector_mult;

architecture behavioral of float_scalar_vector_mult is

signal internal_trigger : std_logic_vector(4 downto 0);

type result_type is array (VECTOR_SIZE-1 downto 0) of std_logic_vector(31 downto 0);
signal internal_result : result_type;

component my_float_mult
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end component;

begin

Genfloat_MULT: for k in 0 to VECTOR_SIZE-1 generate
	my_float_mult_inst : my_float_mult PORT MAP (
		clock	 => clk,
		dataa	 => scalar,
		datab	 => vector(k*32+31 downto k*32),
		result	 => internal_result(k));

	result(k*32+31 downto k*32) <= internal_result(k);
end generate Genfloat_MULT;

result_almost_valid <= internal_trigger(3);
result_valid <= internal_trigger(4);

process(clk)
begin
if clk'event and clk = '1' then
	internal_trigger(0) <= trigger;
	for k in 1 to 4 loop
		internal_trigger(k) <= internal_trigger(k-1);
	end loop;
end if;
end process;

end architecture;