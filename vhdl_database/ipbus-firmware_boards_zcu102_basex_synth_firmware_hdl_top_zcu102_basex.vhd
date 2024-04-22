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
-- This version is for ZCU102 eval board, using SFP ethernet interface
--
-- You must edit this file to set the IP and MAC addresses
--
-- Dave Newbold, 24/10/16

library IEEE;
use IEEE.STD_LOGIC_1164.all;

use work.ipbus.all;

entity top is port(
    sysclk_p   : in  std_logic;
    sysclk_n   : in  std_logic;
    eth_clk_p  : in  std_logic;                     -- 125MHz MGT clock
    eth_clk_n  : in  std_logic;
    eth_rx_p   : in  std_logic;                     -- Ethernet MGT input
    eth_rx_n   : in  std_logic;
    eth_tx_p   : out std_logic;                     -- Ethernet MGT output
    eth_tx_n   : out std_logic;
    sfp_enable : out std_logic;
    leds       : out std_logic_vector(7 downto 0);  -- status LEDs
    dip_sw     : in  std_logic_vector(3 downto 0)   -- switches
    );

end top;

architecture rtl of top is

    signal clk_ipb, rst_ipb, clk_aux, rst_aux, nuke, soft_rst, userled : std_logic;
    signal mac_addr                                                    : std_logic_vector(47 downto 0);
    signal ip_addr                                                     : std_logic_vector(31 downto 0);
    signal ipb_out                                                     : ipb_wbus;
    signal ipb_in                                                      : ipb_rbus;

begin

-- Infrastructure

    infra : entity work.zcu102_basex_infra
        generic map(
            CLK_AUX_FREQ => 40.0
            )
        port map(
            sysclk_p  => sysclk_p,
            sysclk_n    => sysclk_n,
            eth_clk_p   => eth_clk_p,
            eth_clk_n   => eth_clk_n,
            eth_tx_p    => eth_tx_p,
            eth_tx_n    => eth_tx_n,
            eth_rx_p    => eth_rx_p,
            eth_rx_n    => eth_rx_n,
            sfp_los     => '0',
            clk_ipb_o   => clk_ipb,
            rst_ipb_o   => rst_ipb,
            clk_aux_o   => clk_aux,
            rst_aux_o   => rst_aux,
            nuke        => nuke,
            soft_rst    => soft_rst,
            leds        => leds(1 downto 0),
            mac_addr    => mac_addr,
            ip_addr     => ip_addr,
            ipam_select => '0',
            ipb_in      => ipb_in,
            ipb_out     => ipb_out
            );

    leds(7 downto 2) <= "00000" & userled;

    sfp_enable <= '1';

    mac_addr <= X"020ddba1151" & dip_sw;  -- Careful here, arbitrary addresses do not always work
    ip_addr  <= X"c0a8c81" & dip_sw;    -- 192.168.200.16+n

-- ipbus slaves live in the entity below, and can expose top-level ports
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
