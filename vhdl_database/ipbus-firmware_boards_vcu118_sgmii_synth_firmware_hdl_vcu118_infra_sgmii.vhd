
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


-- Infrastructural firmware for the Xilinx VCU118 board; includes clock configuration, PCIe interface, IPbus transactor & master.
--
-- Tom Williams, July 2018


library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ipbus.all;
use work.ipbus_trans_decl.all;

library UNISIM;
use UNISIM.VComponents.all;


entity vcu118_infra_sgmii is
    generic(
        DHCP_not_RARP : std_logic := '0' -- Default use RARP not DHCP for now...
    );
    port (
        -- External oscillators
        osc_clk_300_p : in    std_logic;
        osc_clk_300_n : in    std_logic;
        osc_clk_125_p : in    std_logic;
        osc_clk_125_n : in    std_logic;
        osc_clk_300_o : out   std_logic;
        osc_clk_125_o : out   std_logic;
        -- status LEDs
        rst_in        : in    std_logic_vector(4 downto 0);  -- external reset button
        dip_sw        : in    std_logic_vector(3 downto 0);
        leds          : out   std_logic_vector(1 downto 0);
        debug_leds    : out   std_logic_vector(7 downto 0);  -- should be 1 on stable running
        -- SGMII clk and data
        sgmii_clk_p   : in    std_logic;
        sgmii_clk_n   : in    std_logic;
        sgmii_txp     : out   std_logic;
        sgmii_txn     : out   std_logic;
        sgmii_rxp     : in    std_logic;
        sgmii_rxn     : in    std_logic;
        phy_on        : out   std_logic;
        phy_resetb    : out   std_logic;
        phy_mdio      : inout std_logic;
        phy_mdc       : out   std_logic;
        -- IPbus clock and reset
        clk_ipb_o     : out   std_logic;
        rst_ipb_o     : out   std_logic;
        clk_aux_o     : out   std_logic;  -- 40MHz generated clock
        rst_aux_o     : out   std_logic;
        -- The signals of doom and lesser doom
        nuke          : in    std_logic;
        soft_rst      : in    std_logic;

        mac_addr      : in  std_logic_vector(47 downto 0);  -- MAC address
        ip_addr       : in  std_logic_vector(31 downto 0);  -- IP address
        ipam_select   : in  std_logic;      -- enable RARP or DHCP
        -- IPbus (from / to slaves)
        ipb_in        : in  ipb_rbus;
        ipb_out       : out ipb_wbus
        );
end vcu118_infra_sgmii;


architecture rtl of vcu118_infra_sgmii is

    signal osc_clk_300, osc_clk_125, clk_eth, clk_ipb, clk_ipb_i, clk_aux                                  : std_logic;
    signal locked, clk_locked, eth_locked, rst125, rst_ipb, rst_aux, rst_ipb_ctrl, rst_phy, rst_eth, onehz : std_logic;

    -- ipbus to ethernet
    signal tx_data, rx_data                                                   : std_logic_vector(7 downto 0);
    signal tx_valid, tx_last, tx_error, tx_ready, rx_valid, rx_last, rx_error : std_logic;


    signal pkt       : std_logic;
    signal trans_in  : ipbus_trans_in;
    signal trans_out : ipbus_trans_out;

begin

    osc_clk_300_ibuf : IBUFDS
        port map(
            i  => osc_clk_300_p,
            ib => osc_clk_300_n,
            o  => osc_clk_300
            );

    osc_clk_300_o <= osc_clk_300;

    osc_clk_125_ibuf : IBUFDS
        port map(
            i  => osc_clk_125_p,
            ib => osc_clk_125_n,
            o  => osc_clk_125
            );

    osc_clk_125_o <= osc_clk_125;

    --  DCM clock generation for internal bus, ethernet
    clocks : entity work.clocks_usp_serdes
        generic map (
            CLK_FR_FREQ => 300.0,
            CLK_VCO_FREQ => 1125.0
            )
        port map (
            clki_fr       => osc_clk_300,
            clki_125      => clk_eth,
            clko_ipb      => clk_ipb_i,
            clko_aux      => clk_aux,
            eth_locked    => eth_locked,
            locked        => clk_locked,
            nuke          => nuke,
            soft_rst      => soft_rst,
            rsto_125      => rst125,
            rsto_ipb      => rst_ipb,
            rsto_aux      => rst_aux,
            rsto_eth      => rst_phy,
            rsto_ipb_ctrl => rst_ipb_ctrl,
            onehz         => onehz
            );

    clk_ipb   <= clk_ipb_i;  -- Best to align delta delays on all clocks for simulation
    clk_ipb_o <= clk_ipb_i;
    rst_ipb_o <= rst_ipb;
    clk_aux_o <= clk_aux;
    rst_aux_o <= rst_aux;
    locked    <= clk_locked and eth_locked;

    eth : entity work.eth_sgmii_lvds_vcu118
        port map(
            -- free running 125 MHz clk
            clk125_fr              => osc_clk_125,
            -- reset in
            rst                    => rst_phy,
            -- reset out
            rst_o                  => rst_eth,
            -- status
            locked                 => eth_locked,
            debug_leds(7 downto 0) => debug_leds(7 downto 0),
            dip_sw                 => dip_sw,
            -- eth clock out
            clk125_eth             => clk_eth,
            -- mac ports (go to ipbus)
            tx_data                => tx_data,
            rx_data                => rx_data,
            tx_valid               => tx_valid,
            tx_last                => tx_last,
            tx_error               => tx_error,
            tx_ready               => tx_ready,
            rx_valid               => rx_valid,
            rx_last                => rx_last,
            rx_error               => rx_error,
            -- eth external ports (go to top level ports)
            sgmii_clk_p            => sgmii_clk_p,
            sgmii_clk_n            => sgmii_clk_n,
            sgmii_txp              => sgmii_txp,
            sgmii_txn              => sgmii_txn,
            sgmii_rxp              => sgmii_rxp,
            sgmii_rxn              => sgmii_rxn,
            phy_on                 => phy_on,
            phy_resetb             => phy_resetb,
            phy_mdio               => phy_mdio,
            phy_mdc                => phy_mdc
            );


    ipbus : entity work.ipbus_ctrl
        generic map(
            DHCP_RARP => DHCP_not_RARP
        )
        port map(
            mac_clk      => clk_eth,
            rst_macclk   => rst_eth,
            ipb_clk      => clk_ipb_i,
            rst_ipb      => rst_ipb_ctrl,
            mac_rx_data  => rx_data,
            mac_rx_valid => rx_valid,
            mac_rx_last  => rx_last,
            mac_rx_error => rx_error,
            mac_tx_data  => tx_data,
            mac_tx_valid => tx_valid,
            mac_tx_last  => tx_last,
            mac_tx_error => tx_error,
            mac_tx_ready => tx_ready,
            ipb_out      => ipb_out,
            ipb_in       => ipb_in,
            mac_addr     => mac_addr,
            ip_addr      => ip_addr,
            ipam_select  => ipam_select,
            pkt          => pkt
            );

    -- TODO: Add equivalent of 'stretched' "pkt" signal from ku105 design
    leds <= '0' & (locked and onehz);




end rtl;
