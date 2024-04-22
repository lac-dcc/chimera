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

entity normal2axis_fifo is
generic (
	FIFO_WIDTH : integer;
	LOG2_FIFO_DEPTH : integer);
 port(
	clk : in std_logic;
	resetn : in std_logic;

	write_enable : in std_logic;
	write_data : in std_logic_vector(FIFO_WIDTH-1 downto 0);
	
	m_axis_tvalid : out std_logic;
	m_axis_tready : in std_logic;
	m_axis_tdata : out std_logic_vector(FIFO_WIDTH-1 downto 0);

	almostfull : out std_logic;
	count : out std_logic_vector(LOG2_FIFO_DEPTH-1 downto 0) );
end normal2axis_fifo;

architecture behavioral of normal2axis_fifo is

constant FIFO_DEPTH : integer := 2**LOG2_FIFO_DEPTH;
constant FIFO_DEPTH_MINUS1 : unsigned(LOG2_FIFO_DEPTH-1 downto 0) := to_unsigned(FIFO_DEPTH-1, LOG2_FIFO_DEPTH);

signal rpointer : unsigned(LOG2_FIFO_DEPTH-1 downto 0);
signal wpointer : unsigned(LOG2_FIFO_DEPTH-1 downto 0);

signal bram_we : std_logic;
signal bram_raddr : std_logic_vector(LOG2_FIFO_DEPTH-1 downto 0);
signal bram_waddr : std_logic_vector(LOG2_FIFO_DEPTH-1 downto 0);
signal bram_din : std_logic_vector(FIFO_WIDTH-1 downto 0);
signal bram_dout : std_logic_vector(FIFO_WIDTH-1 downto 0);

signal internal_count : unsigned(LOG2_FIFO_DEPTH-1 downto 0);

signal m_axis_tvalid_internal : std_logic;

component simple_dual_port_ram_single_clock
generic(
  DATA_WIDTH : integer := 32;
  ADDR_WIDTH : integer := 8);
port(
  clk :   in std_logic;
  raddr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
  waddr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
  data :  in std_logic_vector(DATA_WIDTH-1 downto 0);
  we :    in std_logic;
  q :     out std_logic_vector(DATA_WIDTH-1 downto 0));
end component;

begin

bram: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => FIFO_WIDTH,
	ADDR_WIDTH => LOG2_FIFO_DEPTH)
port map (
	clk => clk,
	raddr => bram_raddr,
	waddr => bram_waddr,
	data => bram_din,
	we => bram_we,
	q => bram_dout);

count <= std_logic_vector( internal_count );

m_axis_tvalid <= m_axis_tvalid_internal;
m_axis_tdata <= bram_dout(FIFO_WIDTH-1 downto 0);
bram_raddr <= std_logic_vector(rpointer);

process(clk)
begin
if clk'event and clk = '0' then
	if wpointer >= rpointer then
		internal_count <= wpointer - rpointer;
	else
		internal_count <= (wpointer + (FIFO_DEPTH+1)) - rpointer;
	end if;

	if FIFO_DEPTH_MINUS1 - internal_count < 16 then
		almostfull <= '1';
	else
		almostfull <= '0';
	end if;
end if;
end process;

process(clk)
begin
if clk'event and clk = '0' then
	if resetn = '0' then
		rpointer <= (others => '0');
	else
		if m_axis_tvalid_internal = '1' and m_axis_tready = '1' and wpointer /= rpointer then
			rpointer <= rpointer + 1;
		end if;
	end if;
end if;
end process;

bram_we <= write_enable;
bram_din(FIFO_WIDTH-1 downto 0) <= write_data;
bram_waddr <= std_logic_vector(wpointer);

process(clk)
begin
if clk'event and clk = '1' then
	if resetn = '0' then
		wpointer <= (others => '0');
		m_axis_tvalid_internal <= '0';
	else

		if write_enable = '1' then
			wpointer <= wpointer + 1;
		end if;

		m_axis_tvalid_internal <= '0';
		if wpointer /= rpointer then
			m_axis_tvalid_internal <= '1';
		end if;
	end if;
end if;
end process;

end architecture;