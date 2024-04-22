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

entity reorder is
generic(ADDRESS_WIDTH : integer := 32);
port (
	clk : in std_logic;
	resetn : in std_logic;

	start_address_adjust : std_logic;
	start_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	in_trigger : in std_logic;
	in_address : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	in_data : in std_logic_vector(511 downto 0);
	out_data : out std_logic_vector(511 downto 0);
	out_valid : out std_logic);
end reorder;

architecture behavioral of reorder is

signal written_addresses : std_logic_vector(255 downto 0);
signal read_index : unsigned(7 downto 0);
signal read_triggered : std_logic;

signal rb_raddr : std_logic_vector(7 downto 0);
signal rb_q : std_logic_vector(511 downto 0);

component simple_dual_port_ram_single_clock
generic(
	DATA_WIDTH : integer := 32;
	ADDR_WIDTH : integer := 8);
port(
	clk :	in std_logic;
	raddr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	waddr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	data : 	in std_logic_vector(DATA_WIDTH-1 downto 0);
	we :	in std_logic;
	q : 	out std_logic_vector(DATA_WIDTH-1 downto 0));
end component;

begin

reorder_buffer: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => 512,
	ADDR_WIDTH => 8)
port map (
	clk => clk,
	raddr => rb_raddr,
	waddr => in_address(7 downto 0),
	data => in_data,
	we => in_trigger,
	q => rb_q);

rb_raddr <= std_logic_vector(read_index);

out_data <= rb_q when read_triggered = '1' else (others => '0');
out_valid <= read_triggered;

process(clk)
begin
if clk'event and clk = '1' then
	if resetn = '0' then
		written_addresses <= (others => '0');
		read_index <= (others => '0');
		read_triggered <= '0';
	else
		if start_address_adjust = '1' then
			read_index <= unsigned(start_address(7 downto 0));
		end if;

		if in_trigger = '1' then
			written_addresses( to_integer(unsigned(in_address(7 downto 0))) ) <= '1';
		end if;

		read_triggered <= '0';
		if written_addresses(to_integer(read_index)) = '1' then
			written_addresses(to_integer(read_index)) <= '0';
			read_triggered <= '1';
			read_index <= read_index + 1;
		end if;

	end if;
end if;
end process;

end architecture;