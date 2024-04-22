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


-- eth_v5_1000basex
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

entity eth_v5_1000basex is
	port(
		gt_clkp, gt_clkn: in std_logic;
		gt_txp, gt_txn: out std_logic;
		gt_rxp, gt_rxn: in std_logic;
		locked: out std_logic;
		clk125_o : out std_logic;
		rsti: in std_logic;
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
		hostbus_out: out emac_hostbus_out;
		rxpolarity: in std_logic := '0';
		txpolarity: in std_logic := '0'
	);

end eth_v5_1000basex;

architecture rtl of eth_v5_1000basex is

	signal clkin, refclk125, refclk125_buf, clk125, clk125_buf, clk62_5, clk62_5_buf: std_logic;
	signal phy_locked, dcm_locked, sync_acq: std_logic;
	signal rxgoodframe, rxbadframe, txack, tx_ready_i: std_logic;

begin

	clkbuf: ibufds
		port map(
			i => gt_clkp,
			ib => gt_clkn,
			o => clkin
		);

	bufg_ref: bufg
		port map(
			i => refclk125,
			o => refclk125_buf
		);
	
	dcm: DCM_BASE
		generic map(
			clkin_period => 8.0
		)
		port map(
			clkin => refclk125_buf,
			clk0 => clk125,
			clkfb => clk125_buf,
			clkdv => clk62_5,
			locked => dcm_locked,
			rst => rsti
		);

	bufg_125: bufg
		port map(
			i => clk125,
			o => clk125_buf
		);
	
	bufg_62_5: bufg
		port map(
			i => clk62_5,
			o => clk62_5_buf
		);

	clk125_o <= clk125_buf;
	locked <= phy_locked and dcm_locked and sync_acq;

	mac: entity work.v5_emac_v1_8_serdes_block
		port map(
			CLK125_OUT => refclk125,
			CLK125 => clk125_buf,
			CLK62_5 => clk62_5_buf,
			EMAC0CLIENTRXD => rx_data,
			EMAC0CLIENTRXDVLD => rx_valid,
			EMAC0CLIENTRXGOODFRAME => rxgoodframe,
			EMAC0CLIENTRXBADFRAME => rxbadframe,
			EMAC0CLIENTRXFRAMEDROP => open,
			EMAC0CLIENTRXSTATS => open,
			EMAC0CLIENTRXSTATSVLD => open,
			EMAC0CLIENTRXSTATSBYTEVLD => open,
			CLIENTEMAC0TXD => tx_data,
			CLIENTEMAC0TXDVLD => tx_valid,
			EMAC0CLIENTTXACK => txack,
			CLIENTEMAC0TXFIRSTBYTE => '0',
			CLIENTEMAC0TXUNDERRUN => '0',
			EMAC0CLIENTTXCOLLISION => open,
			EMAC0CLIENTTXRETRANSMIT => open,
			CLIENTEMAC0TXIFGDELAY => X"00",
			EMAC0CLIENTTXSTATS => open,
			EMAC0CLIENTTXSTATSVLD => open,
			EMAC0CLIENTTXSTATSBYTEVLD => open,
			CLIENTEMAC0PAUSEREQ => '0',
			CLIENTEMAC0PAUSEVAL => X"0000",
			EMAC0CLIENTSYNCACQSTATUS => sync_acq,
			EMAC0ANINTERRUPT => open,
			TXP_0 => gt_txp,
			TXN_0 => gt_txn,
			RXP_0 => gt_rxp,
			RXN_0 => gt_rxn,
			PHYAD_0 => "00000",
			RESETDONE_0 => phy_locked,
			TXN_1_UNUSED => open,
			TXP_1_UNUSED => open,
			RXN_1_UNUSED => '0',
			RXP_1_UNUSED => '0',
			CLK_DS => clkin,
			GTRESET => rsti,
			RESET => rsti,
			rxpolarity(0) => rxpolarity,
			rxpolarity(1) => '0',
			txpolarity(0) => txpolarity,
			txpolarity(1) => '0'
		
		);
		
	rx_last <= rxgoodframe or rxbadframe;
	rx_error <= rxbadframe;
    
	process(clk125_buf) -- Shim between new and old-style MAC interfaces
	begin
		if rising_edge(clk125_buf) then
			tx_ready_i <= (tx_ready_i or txack) and not (tx_last or rsti); -- Assume long rst pulse
		end if;
	end process;
  
	tx_ready <= tx_ready_i or txack;
	
	hostbus_out.hostrddata <= (others => '0');
	hostbus_out.hostmiimrdy <= '0';

end rtl;
