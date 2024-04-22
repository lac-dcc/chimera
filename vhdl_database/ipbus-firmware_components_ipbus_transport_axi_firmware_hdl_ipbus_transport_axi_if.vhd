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


-- ipbus_transactor_axi_if
--
-- Bridges AXI interface for IPbus 'pages' to the IPbus transactor interface
--
-- Tom Williams, April 2018


library ieee;
use ieee.std_logic_1164.all;

use work.ipbus_trans_decl.all;
use work.ipbus_axi_decl.all;


entity ipbus_transport_axi_if is
	generic(
		-- Number of address bits to select RX or TX buffer
		-- Number of RX and TX buffers is 2 ** INTERNALWIDTH
		BUFWIDTH: natural := 2;

		-- Number of address bits within each buffer
		-- Size of each buffer is 2**ADDRWIDTH
		ADDRWIDTH: natural := 11
	);
	port(
		ipb_clk : in std_logic;
		rst_ipb : in std_logic;

		axi_in  : in axi4mm_ms(araddr(63 downto 0), awaddr(63 downto 0), wdata(63 downto 0));
		axi_out : out axi4mm_sm(rdata(63 downto 0));

		pkt_done : out std_logic;

		-- IPbus (from / to slaves)
		ipb_trans_rx : out ipbus_trans_in;
		ipb_trans_tx : in ipbus_trans_out
	);

end ipbus_transport_axi_if;

architecture rtl of ipbus_transport_axi_if is

	COMPONENT axi_bram_ctrl_0 IS
		PORT (
			s_axi_aclk : IN STD_LOGIC;
			s_axi_aresetn : IN STD_LOGIC;
			s_axi_awid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			s_axi_awaddr : IN STD_LOGIC_VECTOR(BUFWIDTH+ADDRWIDTH+2 DOWNTO 0);
			s_axi_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			s_axi_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			s_axi_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			s_axi_awlock : IN STD_LOGIC;
			s_axi_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			s_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			s_axi_awvalid : IN STD_LOGIC;
			s_axi_awready : OUT STD_LOGIC;
			s_axi_wdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
			s_axi_wstrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			s_axi_wlast : IN STD_LOGIC;
			s_axi_wvalid : IN STD_LOGIC;
			s_axi_wready : OUT STD_LOGIC;
			s_axi_bid : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			s_axi_bvalid : OUT STD_LOGIC;
			s_axi_bready : IN STD_LOGIC;
			s_axi_arid : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			s_axi_araddr : IN STD_LOGIC_VECTOR(BUFWIDTH+ADDRWIDTH+2 DOWNTO 0);
			s_axi_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			s_axi_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			s_axi_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			s_axi_arlock : IN STD_LOGIC;
			s_axi_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			s_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			s_axi_arvalid : IN STD_LOGIC;
			s_axi_arready : OUT STD_LOGIC;
			s_axi_rid : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			s_axi_rdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
			s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			s_axi_rlast : OUT STD_LOGIC;
			s_axi_rvalid : OUT STD_LOGIC;
			s_axi_rready : IN STD_LOGIC;
			bram_rst_a : OUT STD_LOGIC;
			bram_clk_a : OUT STD_LOGIC;
			bram_en_a : OUT STD_LOGIC;
			bram_we_a : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			bram_addr_a : OUT STD_LOGIC_VECTOR(BUFWIDTH+ADDRWIDTH+2 DOWNTO 0);
			bram_wrdata_a : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
			bram_rddata_a : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
			bram_rst_b : OUT STD_LOGIC;
			bram_clk_b : OUT STD_LOGIC;
			bram_en_b : OUT STD_LOGIC;
			bram_we_b : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			bram_addr_b : OUT STD_LOGIC_VECTOR(BUFWIDTH+ADDRWIDTH+2 DOWNTO 0);
			bram_wrdata_b : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
			bram_rddata_b : IN STD_LOGIC_VECTOR(63 DOWNTO 0)
		);
	END COMPONENT;

	signal bram_addr_a, bram_addr_b : std_logic_vector(BUFWIDTH+ADDRWIDTH+2 downto 0);
	signal ram_wr_en, ram_we, ram_rd_en : std_logic;
	signal ram_wr_we : std_logic_vector(7 downto 0);
	signal ram_wr_data, ram_rd_data : std_logic_vector(63 downto 0);


begin

	axi_bram_ctrl: axi_bram_ctrl_0
		port map (
			s_axi_aclk       => axi_in.aclk,

			s_axi_aresetn    => axi_in.aresetn,
			s_axi_awid       => axi_in.awid,
			s_axi_awaddr     => axi_in.awaddr(BUFWIDTH+ADDRWIDTH+2 downto 0),
			s_axi_awlen      => axi_in.awlen,
			s_axi_awsize     => axi_in.awsize,
			s_axi_awburst    => axi_in.awburst,

			s_axi_awlock     => axi_in.awlock,
			s_axi_awcache    => axi_in.awcache,
			s_axi_awprot     => axi_in.awprot,

			s_axi_awvalid    => axi_in.awvalid,
			s_axi_awready    => axi_out.awready,
			s_axi_wdata      => axi_in.wdata,
			s_axi_wstrb      => axi_in.wstrb,
			s_axi_wlast      => axi_in.wlast,
			s_axi_wvalid     => axi_in.wvalid,
			s_axi_wready     => axi_out.wready,
			s_axi_bid        => axi_out.bid,
			s_axi_bresp      => axi_out.bresp,
			s_axi_bvalid     => axi_out.bvalid,
			s_axi_bready     => axi_in.bready,
			s_axi_arid       => axi_in.arid,
			s_axi_araddr     => axi_in.araddr(BUFWIDTH+ADDRWIDTH+2 downto 0),
			s_axi_arlen      => axi_in.arlen,
			s_axi_arsize     => axi_in.arsize,
			s_axi_arburst    => axi_in.arburst,

			s_axi_arlock     => axi_in.arlock,
			s_axi_arcache    => axi_in.arcache,
			s_axi_arprot     => axi_in.arprot,

			s_axi_arvalid    => axi_in.arvalid,
			s_axi_arready    => axi_out.arready,
			s_axi_rid        => axi_out.rid,
			s_axi_rdata      => axi_out.rdata,
			s_axi_rresp      => axi_out.rresp,
			s_axi_rlast      => axi_out.rlast,
			s_axi_rvalid     => axi_out.rvalid,
			s_axi_rready     => axi_in.rready,

			bram_rst_a       => open,
			bram_clk_a       => open,
			bram_en_a        => ram_wr_en,
			bram_we_a        => ram_wr_we,
			bram_addr_a      => bram_addr_a,
			bram_wrdata_a    => ram_wr_data,
			bram_rddata_a    => X"0000000000000000",

			bram_rst_b       => open,
			bram_clk_b       => open,
			bram_en_b        => ram_rd_en,
			bram_we_b        => open,
			bram_addr_b      => bram_addr_b,
			bram_wrdata_b    => open,
			bram_rddata_b    => ram_rd_data
		);

--	ram_rd_data_masked <= (Others => '0') when (bram_addr_b(12 downto BUFWIDTH + ADDRWIDTH + 3) = bram_addr_zero) else ram_rd_data;

	ram_we <= axi_in.aresetn and ram_wr_en and ram_wr_we(0);

	ram_to_trans : entity work.ipbus_transport_ram_if
		generic map (
			BUFWIDTH => BUFWIDTH,
			ADDRWIDTH => ADDRWIDTH
		)
		port map (
			ram_clk => axi_in.aclk,
		  	ipb_clk => ipb_clk,
		  	rst_ipb => rst_ipb,
		  	wr_addr => bram_addr_a (BUFWIDTH + ADDRWIDTH + 1 downto 3),
		  	wr_data => ram_wr_data,
		  	wr_en => ram_we,

			rd_addr => bram_addr_b (BUFWIDTH + ADDRWIDTH + 2 downto 3),
			rd_data => ram_rd_data,

			pkt_done => pkt_done,

			trans_in => ipb_trans_rx,
			trans_out => ipb_trans_tx
		);

end rtl;
