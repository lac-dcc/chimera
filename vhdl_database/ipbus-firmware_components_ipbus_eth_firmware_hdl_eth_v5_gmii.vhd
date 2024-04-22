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


-- eth_v5_gmii
--
-- Contains the instantiation of the Xilinx MAC IP plus the PHY interface
--
-- Do not change signal names in here without correspondig alteration to the
-- timing contraints file
--
-- Dave Newbold, April 2011
--
-- $Id$


library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.VComponents.all;
use work.emac_hostbus_decl.all;

entity eth_v5_gmii is
	port(
		clk125: in std_logic;
		clk200: in std_logic;
		rst: in std_logic;
		locked: in std_logic;
		gmii_tx_clk: out std_logic;
		gmii_txd: out std_logic_vector(7 downto 0);
		gmii_tx_en: out std_logic;
		gmii_tx_er: out std_logic;
		gmii_rx_clk: in std_logic;
		gmii_rxd: in std_logic_vector(7 downto 0);
		gmii_rx_dv: in std_logic;
		gmii_rx_er: in std_logic;
		tx_data: in std_logic_vector(7 downto 0);
		tx_valid: in std_logic;
		tx_last: in std_logic;
		tx_error: in std_logic;
		tx_ready: out std_logic;
		rx_data: out std_logic_vector(7 downto 0);
		rx_valid: out std_logic;
		rx_last: out std_logic;
		rx_error: out std_logic;
		hostbus_in: in emac_hostbus_in := ('0', "00", "0000000000", X"00000000", '0', '0', '0');
		hostbus_out: out emac_hostbus_out
	);

end eth_v5_gmii;

architecture rtl of eth_v5_gmii is

	COMPONENT mac_fifo
		PORT (
			rst : IN STD_LOGIC;
			wr_clk : IN STD_LOGIC;
			rd_clk : IN STD_LOGIC;
			din : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
			wr_en : IN STD_LOGIC;
			rd_en : IN STD_LOGIC;
			dout : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
			full : OUT STD_LOGIC;
			empty : OUT STD_LOGIC
		);
	END COMPONENT;

	signal rx_clk, gmii_rx_clk_del: std_logic;
	signal txd_e, rxd_r: std_logic_vector(7 downto 0);
	signal tx_en_e, tx_er_e, rx_dv_r, rx_er_r: std_logic;
	signal rxgoodframe, rxbadframe, txack, tx_ready_i: std_logic;
	signal rx_data_e: std_logic_vector(7 downto 0);
	signal rx_valid_e, fifo_empty, rx_en: std_logic;
	signal fifo_d, fifo_q: std_logic_vector(10 downto 0);

	attribute IODELAY_GROUP: string;
	attribute IODELAY_GROUP of idelayctrl0: label is "iodel_gmii_rx";
	attribute IODELAY_GROUP of iodelay0: label is "iodel_gmii_rx";

begin
	
	idelayctrl0: idelayctrl port map(
		refclk => clk200,
		rst => rst
	); -- V5 delay element controller

	iodelay0: iodelay
		generic map(
			IDELAY_TYPE => "FIXED",
			IDELAY_VALUE => 0,
			SIGNAL_PATTERN => "CLOCK"
		)
		port map(
			datain => '0',
			idatain => gmii_rx_clk,
			odatain => '0',
			dataout => gmii_rx_clk_del,
			t => '1',
			ce => '0',
			inc => '0',
			c => '0',
			rst => '0'
		); -- Delay element on rx clock for phase alignment
	
	bufg0: bufg port map(
		i => gmii_rx_clk_del,
		o => rx_clk
	);

	process(rx_clk) -- FFs for incoming GMII data (need to be IOB FFs)
	begin
		if rising_edge(rx_clk) then
			rxd_r <= gmii_rxd;
			rx_dv_r <= gmii_rx_dv;
			rx_er_r <= gmii_rx_er;
		end if;
	end process;

	process(clk125) -- FFs for outgoing GMII data (need to be IOB FFs)
	begin
		if rising_edge(clk125) then
			gmii_txd <= txd_e;
			gmii_tx_en <= tx_en_e;
			gmii_tx_er <= tx_er_e;
		end if;
	end process;
	
	oddr0: oddr port map(
		q => gmii_tx_clk,
		c => clk125,
		ce => '1',
		d1 => '0',
		d2 => '1',
		r => '0',
		s => '0'
	); -- DDR register for clock forwarding

	emac0: entity work.v5_emac_v1_8 port map(
--		EMAC0CLIENTRXCLIENTCLKOUT => open,
		CLIENTEMAC0RXCLIENTCLKIN => rx_clk,
		EMAC0CLIENTRXD => rx_data_e,
		EMAC0CLIENTRXDVLD => rx_valid_e,
--		EMAC0CLIENTRXDVLDMSW => open,
		EMAC0CLIENTRXGOODFRAME => rxgoodframe,
		EMAC0CLIENTRXBADFRAME => rxbadframe,
--		EMAC0CLIENTRXFRAMEDROP =>
--   	EMAC0CLIENTRXSTATS =>
--		EMAC0CLIENTRXSTATSVLD =>
--		EMAC0CLIENTRXSTATSBYTEVLD =>
-- 	EMAC0CLIENTTXCLIENTCLKOUT => 
		CLIENTEMAC0TXCLIENTCLKIN => clk125,
		CLIENTEMAC0TXD => tx_data,
		CLIENTEMAC0TXDVLD => tx_valid,
		CLIENTEMAC0TXDVLDMSW => '0',
		EMAC0CLIENTTXACK => txack,
		CLIENTEMAC0TXFIRSTBYTE => '0',
		CLIENTEMAC0TXUNDERRUN => '0',
--		EMAC0CLIENTTXCOLLISION =>
--		EMAC0CLIENTTXRETRANSMIT =>
		CLIENTEMAC0TXIFGDELAY => (others => '0'),
--		EMAC0CLIENTTXSTATS =>
--		EMAC0CLIENTTXSTATSVLD =>
--		EMAC0CLIENTTXSTATSBYTEVLD =>
		CLIENTEMAC0PAUSEREQ => '0',
		CLIENTEMAC0PAUSEVAL => (others => '0'),
		GTX_CLK_0 => '0',
		PHYEMAC0TXGMIIMIICLKIN => clk125,
--		EMAC0PHYTXGMIIMIICLKOUT =>
		GMII_TXD_0 => txd_e,
		GMII_TX_EN_0 => tx_en_e,
		GMII_TX_ER_0 => tx_er_e,
		GMII_RXD_0 => rxd_r,
		GMII_RX_DV_0 => rx_dv_r,
		GMII_RX_ER_0 => rx_er_r,
		GMII_RX_CLK_0 => rx_clk,
		DCM_LOCKED_0 => locked,
		RESET => rst
	);
	
	fifo_d <= rxbadframe & (rxgoodframe or rxbadframe) & rx_valid_e & rx_data_e;
	rx_en <= rx_valid_e or rxgoodframe or rxbadframe;
	
	fifo: mac_fifo
		port map(
			rst => rst,
			wr_clk => rx_clk,
			rd_clk => clk125,
			din => fifo_d,
			wr_en => rx_en,
			rd_en => '1',
			dout => fifo_q,
			full => open,
			empty => fifo_empty
		);
	
	rx_data <= fifo_q(7 downto 0);
	rx_valid <= fifo_q(8) and not fifo_empty;
	rx_last <= fifo_q(9) and not fifo_empty;
	rx_error <= fifo_q(10) and not fifo_empty;

	process(clk125) -- Shim between new and old-style MAC interfaces
	begin
		if rising_edge(clk125) then
			tx_ready_i <= (tx_ready_i or txack) and not (tx_last or rst); -- Assume long rst pulse
		end if;
	end process;
  
	tx_ready <= tx_ready_i or txack;
	
	hostbus_out.hostrddata <= (others => '0');
	hostbus_out.hostmiimrdy <= '0';

end rtl;

