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


-- ipbus_drp_bridge
--
-- Interfaces ipbus master to Xilinx DRP targets (for access to MGT, MAC, etc).

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.drp_decl.all;

entity ipbus_drp_bridge is
	generic(
		INCLUDE_DRP_CLK_CDC: boolean := false
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		drp_clk: in std_logic := '0';
		drp_out: out drp_wbus;
		drp_in: in drp_rbus
	);

end ipbus_drp_bridge;

architecture rtl of ipbus_drp_bridge is

	signal busy, cyc, cyc_done, stb, stb_d: std_logic;
	signal ipb_out_drp_clk : ipb_rbus;
	signal ipb_in_drp_clk : ipb_wbus;

	signal clk_l : std_logic;
	signal rst_l : std_logic;
	signal ipb_in_l : ipb_wbus;
	signal ipb_out_l : ipb_rbus;

	signal drp_out_addr      : std_logic_vector(15 downto 0);
	signal drp_out_en        : std_logic;
	signal drp_out_data      : std_logic_vector(15 downto 0);
	signal drp_out_we        : std_logic;
	signal ipb_out_ipb_ack   : std_logic;
	signal ipb_out_ipb_err   : std_logic;
	signal ipb_out_ipb_rdata : std_logic_vector(15 downto 0);

begin
	gen_no_cdc : if not INCLUDE_DRP_CLK_CDC generate
		clk_l    <= clk;
		rst_l    <= rst;
		ipb_in_l <= ipb_in;
		ipb_out  <= ipb_out_l;
	end generate;

	gen_cdc : if INCLUDE_DRP_CLK_CDC generate
		clk_l           <= drp_clk;
		ipb_in_l        <= ipb_in_drp_clk;
		ipb_out_drp_clk <= ipb_out_l;

		cdc_rst : entity work.cdc_reset
			port map (
				reset_in  => rst,
				clk_dst   => clk_l,
				reset_out => rst_l
			);

		clk_bridge : entity work.ipbus_clk_bridge
			port map (
				m_clk     => clk,
				m_rst     => rst,
				m_ipb_in  => ipb_in,
				m_ipb_out => ipb_out,

				s_clk     => drp_clk,
				s_rst     => rst_l,
				s_ipb_out => ipb_in_drp_clk,
				s_ipb_in  => ipb_out_drp_clk
			);
	end generate;

	process(clk_l)
	begin
		if rising_edge(clk_l) then
			busy <= (busy or cyc) and not (cyc_done or rst_l);
			stb_d <= stb;
		end if;
	end process;

	stb  <= ipb_in_l.ipb_strobe and not busy;
	cyc      <= stb and not stb_d;
	cyc_done <= drp_in.rdy and ipb_in_l.ipb_strobe and not cyc;

	drp_out_addr <= ipb_in_l.ipb_addr(15 downto 0);
	drp_out_en   <= cyc;
	drp_out_data <= ipb_in_l.ipb_wdata(15 downto 0);
	drp_out_we   <= cyc and ipb_in_l.ipb_write;

	drp_out.addr <= drp_out_addr;
	drp_out.en   <= drp_out_en;
	drp_out.data <= drp_out_data;
	drp_out.we   <= drp_out_we;

	-- NOTE: The 'and not cyc' part protects against mishaps in
	-- case the DRP bus keeps the rdy signal latched high until
	-- the next transaction starts.
	ipb_out_ipb_ack   <= drp_in.rdy and ipb_in_l.ipb_strobe and not cyc;
	ipb_out_ipb_err   <= '0';
	ipb_out_ipb_rdata <= drp_in.data;

	ipb_out_l.ipb_ack   <= ipb_out_ipb_ack;
	ipb_out_l.ipb_err   <= ipb_out_ipb_err;
	ipb_out_l.ipb_rdata <= X"0000" & ipb_out_ipb_rdata;

end rtl;
