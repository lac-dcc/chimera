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


-- kc705_basex_infra
--
-- All board-specific stuff goes here.
--
-- Dave Newbold, June 2013

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VComponents.all;

use work.ipbus.all;

entity zcu102_basex_infra is
    generic(
        CLK_AUX_FREQ : real;
        DHCP_not_RARP : std_logic := '0' -- Default use RARP not DHCP for now...
        );
    port(
        sysclk_p    : in  std_logic;
        sysclk_n    : in  std_logic;
        eth_clk_p   : in  std_logic;      -- 125MHz MGT clock
        eth_clk_n   : in  std_logic;
        eth_rx_p    : in  std_logic;      -- Ethernet MGT input
        eth_rx_n    : in  std_logic;
        eth_tx_p    : out std_logic;      -- Ethernet MGT output
        eth_tx_n    : out std_logic;
        sfp_los     : in  std_logic;
        clk_ipb_o   : out std_logic;      -- IPbus clock
        rst_ipb_o   : out std_logic;
        clk_aux_o   : out std_logic;      -- 40MHz generated clock
        rst_aux_o   : out std_logic;
        nuke        : in  std_logic;      -- The signal of doom
        soft_rst    : in  std_logic;      -- The signal of lesser doom
        leds        : out std_logic_vector(1 downto 0);   -- status LEDs
        mac_addr    : in  std_logic_vector(47 downto 0);  -- MAC address
        ip_addr     : in  std_logic_vector(31 downto 0);  -- IP address
        ipam_select : in  std_logic;      -- enable RARP or DHCP
        ipb_in      : in  ipb_rbus;       -- ipbus
        ipb_out     : out ipb_wbus
        );

end zcu102_basex_infra;

architecture rtl of zcu102_basex_infra is

    signal sysclk, clk125, clk_ipb, clk_ipb_i, clk_aux, locked, clk_locked, eth_locked, rst125, rst_ipb, rst_ipb_ctrl, rst_eth, rst_aux, onehz, pkt : std_logic;
    signal mac_tx_data, mac_rx_data                                                                                                                 : std_logic_vector(7 downto 0);
    signal mac_tx_valid, mac_tx_last, mac_tx_error, mac_tx_ready, mac_rx_valid, mac_rx_last, mac_rx_error                                           : std_logic;
    signal led_p                                                                                                                                    : std_logic_vector(0 downto 0);

begin

    ibuf : IBUFDS
        port map(
            i  => sysclk_p,
            ib => sysclk_n,
            o  => sysclk
            );

--      DCM clock generation for internal bus, ethernet

    clocks : entity work.clocks_us_serdes
        generic map(
            CLK_AUX_FREQ => CLK_AUX_FREQ
            )
        port map(
            clki_fr       => sysclk,
            clki_125      => clk125,
            clko_ipb      => clk_ipb_i,
            clko_aux      => clk_aux,
            eth_locked    => eth_locked,
            locked        => clk_locked,
            nuke          => nuke,
            soft_rst      => soft_rst,
            rsto_125      => rst125,
            rsto_ipb      => rst_ipb,
            rsto_eth      => rst_eth,
            rsto_ipb_ctrl => rst_ipb_ctrl,
            rsto_aux      => rst_aux,
            onehz         => onehz
            );

    clk_ipb   <= clk_ipb_i;  -- Best to align delta delays on all clocks for simulation
    clk_ipb_o <= clk_ipb_i;
    rst_ipb_o <= rst_ipb;
    clk_aux_o <= clk_aux;
    rst_aux_o <= rst_aux;

    locked <= clk_locked and eth_locked;

    stretch : entity work.led_stretcher
        generic map(
            WIDTH => 1
            )
        port map(
            clk  => clk125,
            d(0) => pkt,
            q    => led_p
            );

    leds <= (led_p(0), locked and onehz);

-- Ethernet MAC core and PHY interface

    eth : entity work.eth_us_1000basex
        port map(
            gt_clkp      => eth_clk_p,
            gt_clkn      => eth_clk_n,
            gt_txp       => eth_tx_p,
            gt_txn       => eth_tx_n,
            gt_rxp       => eth_rx_p,
            gt_rxn       => eth_rx_n,
            sfp_los      => sfp_los,
            clk125_out   => clk125,
            indep_clk_in => clk_ipb,  -- Might as well use the IPB clock for this
            rsti         => rst_eth,
            locked       => eth_locked,
            tx_data      => mac_tx_data,
            tx_valid     => mac_tx_valid,
            tx_last      => mac_tx_last,
            tx_error     => mac_tx_error,
            tx_ready     => mac_tx_ready,
            rx_data      => mac_rx_data,
            rx_valid     => mac_rx_valid,
            rx_last      => mac_rx_last,
            rx_error     => mac_rx_error
            );

-- ipbus control logic

    ipbus : entity work.ipbus_ctrl
        generic map(
            DHCP_RARP => DHCP_not_RARP
        )
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
            ipam_select  => ipam_select,
            pkt          => pkt
            );

end rtl;
