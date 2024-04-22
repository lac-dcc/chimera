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


-- ipbus_syncreg_v
--
-- Clock-domain crossing control / status register bank
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
-- Both control and status are moved across clock domains with full handshaking
-- This may be overkill for some applications
--
-- Dave Newbold, June 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

use work.ipbus.all;
use work.ipbus_reg_types.all;

entity ipbus_syncreg_v is
	generic(
		N_CTRL: natural := 1;
		N_STAT: natural := 1;
		SWAP_ORDER: boolean := false;
		ULTRA_SAFE: boolean := false
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		slv_clk: in std_logic;
		d: in ipb_reg_v(N_STAT - 1 downto 0) := (others => (others => '0'));
		q: out ipb_reg_v(N_CTRL - 1 downto 0);
		qmask: in ipb_reg_v(N_CTRL - 1 downto 0) := (others => (others => '1'));
		stb: out std_logic_vector(N_CTRL - 1 downto 0);
		rstb: out std_logic_vector(N_STAT - 1 downto 0)
	);
	
end ipbus_syncreg_v;

architecture rtl of ipbus_syncreg_v is

	constant ADDR_WIDTH: integer := integer_max(calc_width(N_CTRL), calc_width(N_STAT));

	signal sel: integer range 0 to 2 ** ADDR_WIDTH - 1 := 0;
	signal s_cyc, ctrl_cyc_w, ctrl_cyc_r, stat_cyc: std_logic;
	signal cq: ipb_reg_v(2 ** ADDR_WIDTH - 1 downto 0);
	signal sq, ds, cd: std_logic_vector(31 downto 0);
	signal crdy, cack: std_logic_vector(N_CTRL - 1 downto 0);
	signal sre, srdy, sack, sstb, cstab, sstab: std_logic;
	signal rdy, ack, rdy_d, pend: std_logic;

begin

-- Address selects

	sel <= to_integer(unsigned(ipb_in.ipb_addr(ADDR_WIDTH - 1 downto 0))) when ADDR_WIDTH > 0 else 0;
	s_cyc <= '0' when N_STAT = 0 else '1' when N_CTRL = 0 else
		ipb_in.ipb_addr(ADDR_WIDTH) when not SWAP_ORDER else not ipb_in.ipb_addr(ADDR_WIDTH);
	stat_cyc <= ipb_in.ipb_strobe and not ipb_in.ipb_write and s_cyc;
	ctrl_cyc_r <= ipb_in.ipb_strobe and not ipb_in.ipb_write and not s_cyc;
	ctrl_cyc_w <= ipb_in.ipb_strobe and ipb_in.ipb_write and not s_cyc;
	
-- Avoid race between data and handshake (optimised away if ULTRA_SAFE is false)

	cd <= ipb_in.ipb_wdata when rising_edge(clk);
	cstab <= '1' when cd = ipb_in.ipb_wdata else '0';	

-- Write registers
	
	w_gen: for i in N_CTRL - 1 downto 0 generate
	
		signal cwe: std_logic;
		signal ctrl_m: std_logic_vector(31 downto 0);
		
	begin
	
		cwe <= '1' when ctrl_cyc_w = '1' and sel = i and rdy = '1' and (cstab = '1' or not ULTRA_SAFE) else '0';
		ctrl_m <= ipb_in.ipb_wdata and qmask(i);
		
		wsync: entity work.syncreg_w
			port map(
				m_clk => clk,
				m_rst => rst,
				m_we => cwe,
				m_rdy => crdy(i),
				m_ack => cack(i),
				m_d => ctrl_m,
				s_clk => slv_clk,
				s_q => cq(i),
				s_stb => stb(i)
			);

	end generate;
	
	cq(2 ** ADDR_WIDTH - 1 downto N_CTRL) <= (others => (others => '0'));

-- Read register	
	
	ds <= d(sel) when sel < N_STAT else (others => '0');
	
	sre <= stat_cyc and rdy;
	
	rsync: entity work.syncreg_r
		generic map(
			ULTRA_SAFE => ULTRA_SAFE
		)
		port map(
			m_clk => clk,
			m_rst => rst,
			m_re => sre,
			m_rdy => srdy,
			m_ack => sack,
			m_q => sq,
			s_clk => slv_clk,
			s_d => ds,
			s_stb => sstb
		);

	process(sel, sstb)
	begin
		rstb <= (others => '0');
		for i in rstb'range loop
			if sel = i then
				rstb(i) <= sstb;
			else
				rstb(i) <= '0';
			end if;
		end loop;
	end process;
	
-- Interlock to catch situation where strobe is dropped in middle of write / read cycle

	process(clk)
	begin
		if rising_edge(clk) then
			rdy_d <= rdy;
			pend <= (pend or (not rdy and rdy_d)) and ipb_in.ipb_strobe and not rst and not ack;
		end if;
	end process;
	
	rdy <= and_reduce(crdy) and srdy;
	ack <= (or_reduce(cack) or sack) and pend;
	
-- ipbus interface
	
	ipb_out.ipb_rdata <= cq(sel) when ctrl_cyc_r = '1' else sq;
	ipb_out.ipb_ack <= ((ctrl_cyc_w or stat_cyc) and ack) or (ctrl_cyc_r and rdy);
	ipb_out.ipb_err <= '0';
	
	q <= cq(N_CTRL - 1 downto 0);
	
end rtl;
