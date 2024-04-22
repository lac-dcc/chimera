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

entity InvShiftRows is
port (
	clk : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(127 downto 0);
	out_valid : out std_logic;
	out_data : out std_logic_vector(127 downto 0));
end InvShiftRows;

architecture behavioral of InvShiftRows is

begin

process(clk)
begin
if clk'event and clk = '1' then
	out_valid <= in_valid;

	out_data(7 downto 0) <= in_data(7 downto 0);
	out_data(5*8+7 downto 5*8) <= in_data(1*8+7 downto 1*8);
	out_data(10*8+7 downto 10*8) <= in_data(2*8+7 downto 2*8);
	out_data(15*8+7 downto 15*8) <= in_data(3*8+7 downto 3*8);
	out_data(4*8+7 downto 4*8) <= in_data(4*8+7 downto 4*8);
	out_data(9*8+7 downto 9*8) <= in_data(5*8+7 downto 5*8);
	out_data(14*8+7 downto 14*8) <= in_data(6*8+7 downto 6*8);
	out_data(3*8+7 downto 3*8) <= in_data(7*8+7 downto 7*8);
	out_data(8*8+7 downto 8*8) <= in_data(8*8+7 downto 8*8);
	out_data(13*8+7 downto 13*8) <= in_data(9*8+7 downto 9*8);
	out_data(2*8+7 downto 2*8) <= in_data(10*8+7 downto 10*8);
	out_data(7*8+7 downto 7*8) <= in_data(11*8+7 downto 11*8);
	out_data(12*8+7 downto 12*8) <= in_data(12*8+7 downto 12*8);
	out_data(1*8+7 downto 1*8) <= in_data(13*8+7 downto 13*8);
	out_data(6*8+7 downto 6*8) <= in_data(14*8+7 downto 14*8);
	out_data(11*8+7 downto 11*8) <= in_data(15*8+7 downto 15*8);
end if;
end process;

end architecture;