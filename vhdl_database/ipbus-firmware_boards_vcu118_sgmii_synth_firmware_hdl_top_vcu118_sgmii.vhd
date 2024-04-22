
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


-- Top-level design for ipbus demo
--
-- This version is for the VCU118 eval board, using the PCIe itnerface
--
-- Tom Williams, July 2018


library IEEE;
use IEEE.std_logic_1164.all;

use work.ipbus.all;

library UNISIM;
use UNISIM.VComponents.all;


entity top is
    port(

        -- External oscillator 300 MHz
        osc_clk_300_p : in std_logic;
        osc_clk_300_n : in std_logic;

        osc_clk_125_p : in    std_logic;  -- 125 MHz
        osc_clk_125_n : in    std_logic;  -- 125 MHz
        -- status LEDs and buttons
        rst_in        : in    std_logic_vector(4 downto 0);  -- external reset button
        dip_sw        : in    std_logic_vector(3 downto 0);
        leds          : out   std_logic_vector(7 downto 0);
        -- ethernet
        sgmii_clk_p   : in    std_logic;  --> 625 MHz clock from external device
        sgmii_clk_n   : in    std_logic;
        sgmii_txp     : out   std_logic;
        sgmii_txn     : out   std_logic;
        sgmii_rxp     : in    std_logic;
        sgmii_rxn     : in    std_logic;
        phy_on        : out   std_logic;  -- on/off signal
        phy_resetb    : out   std_logic;  -- reset signal
        phy_mdio      : inout std_logic;  -- control line to program the PHY chip
        phy_mdc       : out   std_logic   -- clock line (must be < 2.5 MHz)
        );

end top;

architecture rtl of top is

    signal clk_ipb, rst_ipb, clk_aux, rst_aux, nuke, soft_rst, userled : std_logic;
    signal mac_addr                                                    : std_logic_vector(47 downto 0);
    signal ip_addr                                                     : std_logic_vector(31 downto 0);
    signal ipb_out                                                     : ipb_wbus;
    signal ipb_in                                                      : ipb_rbus;

    signal dleds : std_logic_vector(7 downto 0);

begin

-- Infrastructure
    mac_addr <= X"000a35037d07";
    ip_addr  <= X"c0a8c811";

    infra : entity work.vcu118_infra_sgmii
        port map(
            -- Input clocks
            osc_clk_300_p => osc_clk_300_p,
            osc_clk_300_n => osc_clk_300_n,
            osc_clk_125_p => osc_clk_125_p,
            osc_clk_125_n => osc_clk_125_n,
            -- ext_resets
            rst_in        => rst_in,
            dip_sw        => dip_sw,
            -- SGMII interface
            sgmii_clk_p   => sgmii_clk_p,
            sgmii_clk_n   => sgmii_clk_n,
            sgmii_txp     => sgmii_txp,
            sgmii_txn     => sgmii_txn,
            sgmii_rxp     => sgmii_rxp,
            sgmii_rxn     => sgmii_rxn,
            phy_on        => phy_on,
            phy_resetb    => phy_resetb,
            phy_mdio      => phy_mdio,
            phy_mdc       => phy_mdc,
            -- Other signals
            clk_ipb_o     => clk_ipb,
            rst_ipb_o     => rst_ipb,
            clk_aux_o     => clk_aux,
            rst_aux_o     => rst_aux,
            nuke          => nuke,
            soft_rst      => soft_rst,
            --leds          => leds(1 downto 0),
            debug_leds    => dleds,
            mac_addr      => mac_addr,
            ip_addr       => ip_addr,
            ipam_select   => '0',
            ipb_in        => ipb_in,
            ipb_out       => ipb_out
            );

    --leds(3 downto 2) <= '0' & userled;
    leds <= dleds;
    --leds <= b"01010011";

-- ipbus slaves live in the entity below, and can expose top-level ports.
-- The ipbus fabric is instantiated within.

    payload : entity work.payload
        port map(
            ipb_clk  => clk_ipb,
            ipb_rst  => rst_ipb,
            ipb_in   => ipb_out,
            ipb_out  => ipb_in,
            clk      => clk_aux,
            rst      => rst_aux,
            nuke     => nuke,
            soft_rst => soft_rst,
            userled  => userled
            );


end rtl;
