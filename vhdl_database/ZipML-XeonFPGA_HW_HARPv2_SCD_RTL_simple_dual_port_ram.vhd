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

entity simple_dual_port_ram_single_clock is
generic(
	DATA_WIDTH : natural := 8;
	ADDR_WIDTH : natural := 6);
port(
	clk		: in std_logic;
	raddr	: in std_logic_vector(ADDR_WIDTH-1 downto 0);
	waddr	: in std_logic_vector(ADDR_WIDTH-1 downto 0);
	data	: in std_logic_vector((DATA_WIDTH-1) downto 0);
	we		: in std_logic := '1';
	q		: out std_logic_vector((DATA_WIDTH -1) downto 0));
end simple_dual_port_ram_single_clock;

architecture rtl of simple_dual_port_ram_single_clock is

subtype word_t is std_logic_vector((DATA_WIDTH-1) downto 0);
type memory_t is array(2**ADDR_WIDTH-1 downto 0) of word_t;

signal ram : memory_t;

signal integer_raddr : integer range 0 to 2**ADDR_WIDTH-1;
signal integer_waddr : integer range 0 to 2**ADDR_WIDTH-1;

begin

integer_raddr <= to_integer(unsigned(raddr));
integer_waddr <= to_integer(unsigned(waddr));

process(clk)
begin
if clk'event and clk = '1' then 
	if(we = '1') then
		ram(integer_waddr) <= data;
	end if;
	q <= ram(integer_raddr);
end if;
end process;

end rtl;
