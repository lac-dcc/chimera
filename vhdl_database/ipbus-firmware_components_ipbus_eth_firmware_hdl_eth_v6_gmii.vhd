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


-- Contains the instantiation of the Xilinx MAC IP plus the GMII PHY interface
--
-- Do not change signal names in here without correspondig alteration to the timing contraints file
--
-- Dave Newbold, April 2011
--
-- $Id$

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.VComponents.all;
use work.emac_hostbus_decl.all;

entity eth_v6_gmii is
	generic(
		IODEL: integer := 20
	);
	port(
		clk125: in std_logic;
		clk200: in std_logic;
		rst: in std_logic;
		locked: in std_logic;
		gmii_gtx_clk: out std_logic;
		gmii_txd: out std_logic_vector(7 downto 0);
		gmii_tx_en: out std_logic;
		gmii_tx_er: out std_logic;
		gmii_rx_clk: in std_logic;
		gmii_rxd: in std_logic_vector(7 downto 0);
		gmii_rx_dv: in std_logic;
		gmii_rx_er: in std_logic;
		txd: in std_logic_vector(7 downto 0);
		txdvld: in std_logic;
		txack: out std_logic;
		rxclko: out std_logic;
		rxd: out std_logic_vector(7 downto 0);
		rxdvld: out std_logic;
		rxgoodframe: out std_logic;
		rxbadframe: out std_logic
		hostbus_in: in emac_hostbus_in := ('0', "00", "0000000000", X"00000000", '0', '0', '0');
		hostbus_out: out emac_hostbus_out

	);

end eth_v6_gmii;

architecture rtl of eth_v6_gmii is

	signal rx_clk, rx_clk_io: std_logic;
	signal txd_e, rxd_r: std_logic_vector(7 downto 0);
	signal tx_en_e, tx_er_e, rx_dv_r, rx_er_r: std_logic;
	signal gmii_rxd_del: std_logic_vector(7 downto 0);
	signal gmii_rx_dv_del, gmii_rx_er_del: std_logic;

	attribute IODELAY_GROUP: string;
	attribute IODELAY_GROUP of idelayctrl0: label is "iodel_gmii_rx";
	attribute IODELAY_GROUP of iodelay_dv: label is "iodel_gmii_rx";
	attribute IODELAY_GROUP of iodelay_er: label is "iodel_gmii_rx";

begin

	rxclko <= rx_clk;
	
	idelayctrl0: idelayctrl port map(
		refclk => clk200,
		rst => rst
	); -- V5/6 delay element controller

	bufio0: bufio port map(
		i => gmii_rx_clk,
		o => rx_clk_io
	);
	
	bufr0: bufr port map(
		i => gmii_rx_clk,
		o => rx_clk,
		ce => '1',
		clr => '0'
	);
	
	iodelgen: for i in 7 downto 0 generate
		attribute IODELAY_GROUP of iodelay: label is "iodel_gmii_rx";
	begin

		iodelay: iodelaye1
			generic map(
				IDELAY_TYPE => "FIXED",
				IDELAY_VALUE => IODEL
			)
			port map(
				idatain => gmii_rxd(i),
				dataout => gmii_rxd_del(i),
				t => '1',
				ce => '0',
				inc => '0',
				c => '0',
				cinvctrl => '0',
				clkin => '0',
				cntvaluein => (others => '0'),
				datain => '0',
				odatain => '0',
				rst => '0'
			); -- Delay element for phase alignment
	
	end generate;
	
	iodelay_dv: iodelaye1
		generic map(
			IDELAY_TYPE => "FIXED",
			IDELAY_VALUE => IODEL
		)
		port map(
			idatain => gmii_rx_dv,
			dataout => gmii_rx_dv_del,
			t => '1',
			ce => '0',
			inc => '0',
			c => '0',
			cinvctrl => '0',
			clkin => '0',
			cntvaluein => (others => '0'),
			datain => '0',
			odatain => '0',
			rst => '0'
		); -- Delay element on rx clock for phase alignment
		
	iodelay_er: iodelaye1
		generic map(
			IDELAY_TYPE => "FIXED",
			IDELAY_VALUE => IODEL
		)
		port map(
			idatain => gmii_rx_er,
			dataout => gmii_rx_er_del,
			t => '1',
			ce => '0',
			inc => '0',
			c => '0',
			cinvctrl => '0',
			clkin => '0',
			cntvaluein => (others => '0'),
			datain => '0',
			odatain => '0',
			rst => '0'
		); -- Delay element for phase alignment

	process(rx_clk_io) -- FFs for incoming GMII data (need to be IOB FFs)
	begin
		if rising_edge(rx_clk_io) then
			rxd_r <= gmii_rxd_del;
			rx_dv_r <= gmii_rx_dv_del;
			rx_er_r <= gmii_rx_er_del;
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
		q => gmii_gtx_clk,
		c => clk125,
		ce => '1',
		d1 => '0',
		d2 => '1',
		r => '0',
		s => '0'
	); -- DDR register for clock forwarding

	emac0: entity work.v6_emac_v1_5 port map(
		EMACCLIENTRXCLIENTCLKOUT => open,
		CLIENTEMACRXCLIENTCLKIN => rx_clk,
		EMACCLIENTRXD => rxd,
		EMACCLIENTRXDVLD => rxdvld,
		EMACCLIENTRXDVLDMSW => open,
		EMACCLIENTRXGOODFRAME => rxgoodframe,
		EMACCLIENTRXBADFRAME => rxbadframe,
		EMACCLIENTRXFRAMEDROP => open,
   	EMACCLIENTRXSTATS => open,
		EMACCLIENTRXSTATSVLD => open,
		EMACCLIENTRXSTATSBYTEVLD => open,
		EMACCLIENTTXCLIENTCLKOUT => open,
		CLIENTEMACTXCLIENTCLKIN => clk125,
		CLIENTEMACTXD => txd,
		CLIENTEMACTXDVLD => txdvld,
		CLIENTEMACTXDVLDMSW => '0',
		EMACCLIENTTXACK => txack,
		CLIENTEMACTXFIRSTBYTE => '0',
		CLIENTEMACTXUNDERRUN => '0',
		EMACCLIENTTXCOLLISION => open,
		EMACCLIENTTXRETRANSMIT => open,
		CLIENTEMACTXIFGDELAY => (others => '0'),
		EMACCLIENTTXSTATS => open,
		EMACCLIENTTXSTATSVLD => open,
		EMACCLIENTTXSTATSBYTEVLD => open,
		CLIENTEMACPAUSEREQ => '0',
		CLIENTEMACPAUSEVAL => (others => '0'),
		GTX_CLK => '0',
		PHYEMACTXGMIIMIICLKIN => clk125,
		EMACPHYTXGMIIMIICLKOUT => open,
		GMII_TXD => txd_e,
		GMII_TX_EN => tx_en_e,
		GMII_TX_ER => tx_er_e,
		GMII_RXD => rxd_r,
		GMII_RX_DV => rx_dv_r,
		GMII_RX_ER => rx_er_r,
		GMII_RX_CLK => rx_clk,
		MMCM_LOCKED => locked,
		RESET => '0'
	);
	
	hostbus_out.hostrddata <= (others => '0');
	hostbus_out.hostmiimrdy <= '0';

end rtl;
