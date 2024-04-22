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

-- All board-specific stuff goes here.
--
-- Dave Newbold, June 2013

library IEEE;
use IEEE.STD_LOGIC_1164.all;

use work.ipbus.all;

entity sim_eth_infra is
    generic(
        CLK_AUX_FREQ : real := 40.0
        );
    port(
        clk_ipb_o : out std_logic;      -- IPbus clock
        rst_ipb_o : out std_logic;
        clk_aux_o : out std_logic;      -- Aux generated clock
        rst_aux_o : out std_logic;
        nuke      : in  std_logic;      -- The signal of doom
        soft_rst  : in  std_logic;      -- The signal of lesser doom
        mac_addr  : in  std_logic_vector(47 downto 0);  -- MAC address
        ip_addr   : in  std_logic_vector(31 downto 0);  -- IP address
        ipb_in    : in  ipb_rbus;       -- ipbus
        ipb_out   : out ipb_wbus
        );

end sim_eth_infra;

architecture rtl of sim_eth_infra is

    signal clk125, clk_ipb, clk_ipb_i, rst, rst125, rst_ipb, rst_ipb_ctrl, rst_aux                        : std_logic;
    signal mac_tx_data, mac_rx_data                                                                       : std_logic_vector(7 downto 0);
    signal mac_tx_valid, mac_tx_last, mac_tx_error, mac_tx_ready, mac_rx_valid, mac_rx_last, mac_rx_error : std_logic;

begin

-- Clock generation for ipbus, ethernet, POR

    clocks : entity work.clock_sim
        generic map(
            CLK_AUX_FREQ => CLK_AUX_FREQ
            )
        port map(
            clko125   => clk125,
            clko25    => clk_ipb_i,
            clko_aux  => clk_aux_o,
            nuke      => nuke,
            soft_rst  => soft_rst,
            rsto_ipb  => rst_ipb,
            rsto_ctrl => rst_ipb_ctrl,
            rsto_aux  => rst_aux
            );

    rst125  <= rst_ipb_ctrl;
    rst_ipb <= rst;

    clk_ipb   <= clk_ipb_i;  -- Best to align delta delays on all clocks for simulation
    clk_ipb_o <= clk_ipb_i;
    rst_ipb_o <= rst;
    rst_aux_o <= rst_aux;

--      Ethernet MAC core and PHY interface

    eth : entity work.eth_mac_sim
        generic map(
            MULTI_PACKET => true
            )
        port map(
            clk      => clk125,
            rst      => rst125,
            tx_data  => mac_tx_data,
            tx_valid => mac_tx_valid,
            tx_last  => mac_tx_last,
            tx_error => mac_tx_error,
            tx_ready => mac_tx_ready,
            rx_data  => mac_rx_data,
            rx_valid => mac_rx_valid,
            rx_last  => mac_rx_last,
            rx_error => mac_rx_error
            );

-- ipbus control logic

    ipbus : entity work.ipbus_ctrl
        port map(
            mac_clk      => clk125,
            rst_macclk   => rst125,
            ipb_clk      => clk_ipb,
            rst_ipb      => rst_ipb_ctrl,
            mac_rx_data  => mac_rx_data,
            mac_rx_valid => mac_rx_valid,
            mac_rx_last  => mac_rx_last,
            mac_rx_error => mac_rx_error,
            mac_tx_data  => mac_tx_data,
            mac_tx_valid => mac_tx_valid,
            mac_tx_last  => mac_tx_last,
            mac_tx_error => mac_tx_error,
            mac_tx_ready => mac_tx_ready,
            ipb_out      => ipb_out,
            ipb_in       => ipb_in,
            mac_addr     => mac_addr,
            ip_addr      => ip_addr,
            pkt          => open
            );

end rtl;
