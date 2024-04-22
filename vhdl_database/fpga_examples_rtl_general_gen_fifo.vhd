-- -----------------------------------------------------------------------
--
-- Syntiac's generic VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2010 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
--
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.
--
-- -----------------------------------------------------------------------
--
-- gen_fifo.vhd
--
-- -----------------------------------------------------------------------
--
-- FIFO (first in is first out) buffer for single clock domain.
-- Build with logic so can be used on any FPGA architecture.
-- 
--
-- -----------------------------------------------------------------------
-- width - width of data stored in the FIFO
-- depth - fifo depth in elements
-- -----------------------------------------------------------------------
-- clk   - clock input
-- d_ena - when high data on d input is writen into FIFO
-- d     - data input into the FIFO
-- q_ena - when high removed first item from the FIFO
-- q     - first item in the FIFO
-- empty - signal is high when there is nothing in the FIFO
-- full  - signal is high when there is no space left in the FIFO
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_fifo is
	generic (
		width : integer := 8;
		depth : integer := 4
	);
	port (
		clk : in std_logic;

		d_ena : in std_logic;
		d : in unsigned(width-1 downto 0);
		
		q_ena : in std_logic;
		q : out unsigned(width-1 downto 0);
		
		empty : out std_logic;
		full : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_fifo is
	type fifo_t is array(0 to depth-1) of unsigned(width-1 downto 0);
	signal fifo_reg : fifo_t := (others => (others => '0'));
	
	signal d_cnt_reg : integer range 0 to depth-1 := 0;
	signal d_tgl_reg : std_logic := '0';
	signal q_cnt_reg : integer range 0 to depth-1 := 0;
	signal q_tgl_reg : std_logic := '0';
	
	signal empty_loc : std_logic;
	signal full_loc : std_logic;
begin
	q <= fifo_reg(q_cnt_reg);
	empty <= empty_loc;
	full <= full_loc;

	empty_loc <= '1' when (d_cnt_reg = q_cnt_reg) and (d_tgl_reg = q_tgl_reg) else '0';
	full_loc <= '1' when  (d_cnt_reg = q_cnt_reg) and (d_tgl_reg /= q_tgl_reg) else '0';

	process(clk)
	begin
		if rising_edge(clk) then
			if (d_ena = '1') and (full_loc = '0') then
				fifo_reg(d_cnt_reg) <= d;
				if d_cnt_reg = depth-1 then
					d_cnt_reg <= 0;
					d_tgl_reg <= not d_tgl_reg;
				else
					d_cnt_reg <= d_cnt_reg + 1;
				end if;
			end if;
			if (q_ena = '1') and (empty_loc = '0') then
				if q_cnt_reg = depth-1 then
					q_cnt_reg <= 0;
					q_tgl_reg <= not q_tgl_reg;
				else
					q_cnt_reg <= q_cnt_reg + 1;
				end if;
			end if;
		end if;
	end process;
end architecture;
