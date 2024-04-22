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

entity fixed_subtract_mult is
port (
	clk : in std_logic;
	trigger : in std_logic;
	dot_product : in std_logic_vector(31 downto 0);
	b_to_subtract : in std_logic_vector(31 downto 0);
	step_size : in std_logic_vector(5 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end fixed_subtract_mult;

architecture behavioral of fixed_subtract_mult is

signal integer_step_size : integer;
signal dot_product_minus_b : signed(31 downto 0);

begin

integer_step_size <= to_integer(unsigned(step_size));
dot_product_minus_b <= signed(dot_product) - signed(b_to_subtract);

result_almost_valid <= trigger;

process(clk)
begin
if clk'event and clk = '1' then
	result_valid <= trigger;
	result <= std_logic_vector( shift_right(dot_product_minus_b, integer_step_size) );
end if;
end process;

end architecture;