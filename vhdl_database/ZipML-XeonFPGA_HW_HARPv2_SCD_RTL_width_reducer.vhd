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

entity width_reducer is
generic (
	OUTPUT_WIDTH : integer := 256);
port (
	clk : in std_logic;
	resetn : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(511 downto 0);

	out_valid : out std_logic;
	out_data : out std_logic_vector(OUTPUT_WIDTH-1 downto 0));
end width_reducer;

architecture behavioral of width_reducer is

constant FACTOR : integer := 512/OUTPUT_WIDTH;

type fifo_wdata_type is array (FACTOR-1 downto 0) of std_logic_vector(OUTPUT_WIDTH-1 downto 0);
signal fifo_we : std_logic_vector(FACTOR-1 downto 0);
signal fifo_wdata : fifo_wdata_type;
signal fifo_rvalid : std_logic_vector(FACTOR-1 downto 0);
signal fifo_rready : std_logic_vector(FACTOR-1 downto 0);
signal fifo_rdata : fifo_wdata_type;
signal fifo_almostfull : std_logic_vector(FACTOR-1 downto 0);

signal out_valid_internal : std_logic;
signal to_read_fifo : integer range 0 to FACTOR-1;

component normal2axis_fifo
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
end component;

begin

GenFIFOs: for i in 0 to FACTOR-1 generate
fifo_we(i) <= in_valid;
fifo_wdata(i) <= in_data( (i+1)*OUTPUT_WIDTH-1 downto i*OUTPUT_WIDTH );

normal2axis_fifo_inst: normal2axis_fifo
generic map (
	FIFO_WIDTH => OUTPUT_WIDTH,
	LOG2_FIFO_DEPTH => 8)
port map (
	clk => clk,
	resetn => resetn,

	write_enable => fifo_we(i),
	write_data => fifo_wdata(i),

	m_axis_tvalid => fifo_rvalid(i),
	m_axis_tready => fifo_rready(i),
	m_axis_tdata => fifo_rdata(i),

	almostfull => fifo_almostfull(i));

fifo_rready(i) <= '1' when (fifo_rvalid(i) = '1' and to_read_fifo = i) else '0';
end generate GenFIFOs;

out_valid_internal <= fifo_rvalid(to_read_fifo);
out_valid <= out_valid_internal;
out_data <= fifo_rdata(to_read_fifo);

process(clk)
begin
if clk'event and clk = '1' then
	if resetn = '0' then
		to_read_fifo <= 0;
	else
		if out_valid_internal = '1' then
			if to_read_fifo = FACTOR-1 then
				to_read_fifo <= 0;
			else
				to_read_fifo <= to_read_fifo + 1;
			end if;
		end if;
	end if;
end if;
end process;

end architecture;