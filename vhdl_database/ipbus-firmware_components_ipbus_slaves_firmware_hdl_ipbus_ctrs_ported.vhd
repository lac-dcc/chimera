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


-- ipbus_ctrs_ported
--
-- Block of counters, accessed like ported RAM
--
-- Counters are sampled when first address is read
-- LIMIT controls whether counters are allowed to wrap
-- RST_ON_READ controls whether counters are reset on sampling
--
-- Dave Newbold, August 2016

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.ipbus.all;
use work.ipbus_reg_types.all;

entity ipbus_ctrs_ported is
	generic(
		N_CTRS: natural := 1;
		CTR_WDS: positive := 1;
		LIMIT: boolean := true;
		RST_ON_READ: boolean := false;
		READ_ONLY: boolean := true
	);
	port(
		ipb_clk: in std_logic;
		ipb_rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		clk: in std_logic;
		rst: in std_logic;
		inc: in std_logic_vector(N_CTRS - 1 downto 0) := (others => '0');
		dec: in std_logic_vector(N_CTRS - 1 downto 0) := (others => '0');
		q: out std_logic_vector(N_CTRS * CTR_WDS * 32 - 1 downto 0)
	);
	
end ipbus_ctrs_ported;

architecture rtl of ipbus_ctrs_ported is

	type ctrs_t is array(N_CTRS - 1 downto 0) of unsigned(CTR_WDS * 32 - 1 downto 0);
	signal ctrs: ctrs_t;
	signal ptr: unsigned(calc_width(N_CTRS * CTR_WDS) - 1 downto 0);
	signal s_ipb_in: ipb_wbus;
	signal s_ipb_out: ipb_rbus;
	signal d, qi: ipb_reg_v(N_CTRS * CTR_WDS - 1 downto 0);
	signal dr: ipb_reg_v(0 downto 0);
	signal rstb, stb: std_logic_vector(N_CTRS * CTR_WDS - 1 downto 0);

begin

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				ctrs <= (others => (others => '0'));
			elsif stb(N_CTRS * CTR_WDS - 1) = '1' then
				for i in N_CTRS - 1 downto 0 loop
					for j in CTR_WDS - 1 downto 0 loop
						ctrs(i)(32 * (j + 1) - 1 downto 32 * j) <= unsigned(qi(i * CTR_WDS + j));
					end loop;
				end loop;
			else
				for i in N_CTRS - 1 downto 0 loop
					if inc(i) = '1' and dec(i) = '0' then
						if ctrs(i) /= (ctrs(i)'range => '1') or not LIMIT then
							if rstb(0) = '1' and RST_ON_READ then
								ctrs(i) <= to_unsigned(1, ctrs(i)'length);
							else
								ctrs(i) <= ctrs(i) + 1;
							end if;
						end if;
					elsif inc(i) = '0' and dec(i) = '1' then
						if ctrs(i) /= (ctrs(i)'range => '0') or not LIMIT then
							if rstb(0) = '1' and RST_ON_READ then
								ctrs(i) <= to_unsigned(0, ctrs(i)'length);
							else
								ctrs(i) <= ctrs(i) - 1;
							end if;
						end if;
					elsif rstb(0) = '1' and RST_ON_READ then
						ctrs(i) <= to_unsigned(0, ctrs(i)'length);
					end if;
				end loop;
			end if;
			if rstb(0) = '1' then
				for i in N_CTRS - 1 downto 0 loop
					for j in CTR_WDS - 1 downto 0 loop
						d(i * CTR_WDS + j) <= std_logic_vector(ctrs(i)(32 * (j + 1) - 1 downto 32 * j));
					end loop;
				end loop;
			end if;
		end if;
	end process;
	
	process(ipb_clk)
	begin
		if rising_edge(ipb_clk) then
			if rst = '1' then
				ptr <= (others => '0');
			elsif ipb_in.ipb_strobe = '1' then
				if ipb_in.ipb_write = '1' and ipb_in.ipb_addr(0) = '0' then
					ptr <= unsigned(ipb_in.ipb_wdata(ptr'range));
				elsif ipb_in.ipb_addr(0) = '1' and s_ipb_out.ipb_ack = '1' then
					if ptr = to_unsigned(N_CTRS * CTR_WDS - 1, ptr'length) then
						ptr <= (others => '0');
					else
						ptr <= ptr + 1;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	dr(0) <= d(to_integer(ptr));
	
	sgen: if READ_ONLY generate
	
		s_ipb_in.ipb_addr(ptr'length) <= '0';

		sreg: entity work.ipbus_syncreg_v
			generic map(
				N_CTRL => 0,
				N_STAT => N_CTRS * CTR_WDS
			)
			port map(
				clk => ipb_clk,
				rst => ipb_rst,
				ipb_in => s_ipb_in,
				ipb_out => s_ipb_out,
				slv_clk => clk,
				d => d,
				rstb => rstb
			);
			
		qi <= (others	=> (others => '0'));
		stb <= (others => '0');
			
	end generate;
	
	nsgen: if not READ_ONLY generate
	
		s_ipb_in.ipb_addr(ptr'length) <= not s_ipb_in.ipb_write;

		sreg: entity work.ipbus_syncreg_v
			generic map(
				N_CTRL => N_CTRS * CTR_WDS,
				N_STAT => N_CTRS * CTR_WDS
			)
			port map(
				clk => ipb_clk,
				rst => ipb_rst,
				ipb_in => s_ipb_in,
				ipb_out => s_ipb_out,
				slv_clk => clk,
				q => qi,
				stb => stb,
				d => d,
				rstb => rstb
			);
			
	end generate;
	
	s_ipb_in.ipb_addr(31 downto ptr'length+1) <= (others => '0');
	s_ipb_in.ipb_addr(ptr'length - 1 downto 0) <= std_logic_vector(ptr);
	s_ipb_in.ipb_wdata <= ipb_in.ipb_wdata;
	s_ipb_in.ipb_write <= ipb_in.ipb_write and ipb_in.ipb_addr(0);
	s_ipb_in.ipb_strobe <= ipb_in.ipb_strobe and ipb_in.ipb_addr(0);
	
	ipb_out.ipb_rdata <= (31 downto ptr'length => '0') & std_logic_vector(ptr) when ipb_in.ipb_addr(0) = '0' else s_ipb_out.ipb_rdata;
	ipb_out.ipb_ack <= ipb_in.ipb_strobe when ipb_in.ipb_addr(0) = '0' else s_ipb_out.ipb_ack;
	ipb_out.ipb_err <= '0' when ipb_in.ipb_addr(0) = '0' else s_ipb_out.ipb_err;
	
	process(ctrs)
	begin
		for i in N_CTRS - 1 downto 0 loop
			q(32 * (i + 1) * CTR_WDS - 1 downto 32 * i * CTR_WDS) <= std_logic_vector(ctrs(i));
		end loop;
	end process;
			
end rtl;
