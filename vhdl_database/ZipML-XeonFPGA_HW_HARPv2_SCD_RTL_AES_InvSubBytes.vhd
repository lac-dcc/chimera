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

entity InvSubBytes is
port (
	clk : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(127 downto 0);
	out_valid : out std_logic;
	out_data : out std_logic_vector(127 downto 0));
end InvSubBytes;

architecture structural of InvSubBytes is

component InvSBox
port (
	clk : in std_logic;

	in_data : in std_logic_vector(7 downto 0);
	out_data : out std_logic_vector(7 downto 0));
end component;

begin

GenInvSBox: for i in 0 to 15 generate

InvSBox_inst: InvSBox
port map (
	clk => clk,

	in_data => in_data(i*8+7 downto i*8),
	out_data => out_data(i*8+7 downto i*8));
end generate GenInvSBox;

process(clk)
begin
if clk'event and clk = '1' then
	out_valid <= in_valid;
end if;
end process;

end architecture;