-------------------------------------------------------------------------
--  Copyright (C) 2018 Kaan Kara - Systems Group, ETH Zurich

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

entity width_assembler is
generic (
	INPUT_WIDTH : integer := 256);
port (
	clk : in std_logic;
	resetn : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(INPUT_WIDTH-1 downto 0);

	out_valid : out std_logic;
	out_data : out std_logic_vector(511 downto 0));
end width_assembler;

architecture behavioral of width_assembler is

constant FACTOR : integer := 512/INPUT_WIDTH;

signal counter : integer range 0 to FACTOR-1;
signal out_data_internal : std_logic_vector(511 downto 0);

begin

out_data <= out_data_internal;

process(clk)
begin
if clk'event and clk = '1' then
	if resetn = '0' then
		counter <= 0;
		out_valid <= '0';
	else
		out_valid <= '0';
		if in_valid = '1' then
			out_data_internal( (counter+1)*INPUT_WIDTH-1 downto counter*INPUT_WIDTH ) <= in_data;
			if counter = FACTOR-1 then
				out_valid <= '1';
				counter <= 0;
			else
				counter <= counter + 1;
			end if;
		end if;
	end if;
end if;
end process;

end architecture;