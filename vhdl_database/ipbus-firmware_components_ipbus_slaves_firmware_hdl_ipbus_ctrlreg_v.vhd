---------------------------------------------------------------------------------
--
--   Copyright 2017 - Rutherford Appleton Laboratory and University of Bristol
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.
--
--                                     - - -
--
--   Additional information about ipbus-firmare and the list of ipbus-firmware
--   contacts are available at
--
--       https://ipbus.web.cern.ch/ipbus
--
---------------------------------------------------------------------------------


-- ipbus_ctrlreg_v
--
-- Generic control / status register bank
--
-- Provides N_CTRL control registers (32b each), rw
-- Provides N_STAT status registers (32b each), ro
--
-- Address space needed is twice that needed by the largest block of registers, unless
-- one of N_CTRL or N_STAT is zero.
--
-- By default, bottom part of read address space is control, top is status.
-- Set SWAP_ORDER to reverse this.
--
-- Dave Newbold, July 2012

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.ipbus_reg_types.all;

entity ipbus_ctrlreg_v is
	generic(
		N_CTRL: natural := 1;
		N_STAT: natural := 1;
		SWAP_ORDER: boolean := false
	);
	port(
		clk: in std_logic;
		reset: in std_logic;
		ipbus_in: in ipb_wbus;
		ipbus_out: out ipb_rbus;
		d: in ipb_reg_v(N_STAT - 1 downto 0) := (others => (others => '0'));
		ctrl_default: in ipb_reg_v(N_CTRL - 1 downto 0) := (others => (others => '0'));
		q: out ipb_reg_v(N_CTRL - 1 downto 0);
		qmask: in ipb_reg_v(N_CTRL - 1 downto 0) := (others => (others => '1'));		
		stb: out std_logic_vector(N_CTRL - 1 downto 0)
	);
	
end ipbus_ctrlreg_v;

architecture rtl of ipbus_ctrlreg_v is

	constant ADDR_WIDTH: integer := integer_max(calc_width(N_CTRL), calc_width(N_STAT));

	signal sel: integer range 0 to 2 ** ADDR_WIDTH - 1 := 0;
	signal reg: ipb_reg_v(N_CTRL - 1 downto 0);
	signal si, ri: ipb_reg_v(2 ** ADDR_WIDTH - 1 downto 0);
	signal stat_cyc, cw_cyc: std_logic;

begin

	sel <= to_integer(unsigned(ipbus_in.ipb_addr(ADDR_WIDTH - 1 downto 0))) when ADDR_WIDTH > 0 else 0;
	stat_cyc <= '0' when N_STAT = 0 else '1' when N_CTRL = 0 else
		ipbus_in.ipb_addr(ADDR_WIDTH) when not SWAP_ORDER else not ipbus_in.ipb_addr(ADDR_WIDTH);
	cw_cyc <= ipbus_in.ipb_strobe and ipbus_in.ipb_write and not stat_cyc;

	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				reg <= ctrl_default;
			elsif cw_cyc = '1' and sel < N_CTRL then
				reg(sel) <= ipbus_in.ipb_wdata and qmask(sel);
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			for i in N_CTRL - 1 downto 0 loop
				if sel = i then
					stb(i) <= cw_cyc;
				else
					stb(i) <= '0';
				end if;
			end loop;
		end if;
	end process;
	
	si(N_STAT - 1 downto 0) <= d;
	si(2 ** ADDR_WIDTH - 1 downto N_STAT) <= (others => (others => '0'));
	ri(N_CTRL - 1 downto 0) <= reg;
	ri(2 ** ADDR_WIDTH - 1 downto N_CTRL) <= (others => (others => '0'));
	
	ipbus_out.ipb_rdata <= ri(sel) when stat_cyc = '0' else si(sel);	
	ipbus_out.ipb_ack <= ipbus_in.ipb_strobe;
	ipbus_out.ipb_err <= '0';

	q <= reg;
	
end rtl;
