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
-- You must edit this file to set the IP and MAC addresses
--
-- Dave Newbold, 08/01/16

library IEEE;
use IEEE.STD_LOGIC_1164.all;

use work.ipbus.all;
use work.top_decl.all;

entity top is port(
    eth_clk_p          : in    std_logic;  -- 125MHz MGT clock
    eth_clk_n          : in    std_logic;
    eth_rx_p           : in    std_logic;  -- Ethernet MGT input
    eth_rx_n           : in    std_logic;
    eth_tx_p           : out   std_logic;  -- Ethernet MGT output
    eth_tx_n           : out   std_logic;
    sfp_los            : in    std_logic;
    sfp_tx_disable     : out   std_logic;
    sfp_scl            : out   std_logic;
    sfp_sda            : out   std_logic;
    leds               : out   std_logic_vector(1 downto 0);  -- TE712 LEDs
    leds_c             : out   std_logic_vector(3 downto 0);  -- carrier LEDs
    dip_sw             : in    std_logic_vector(3 downto 0);  -- carrier switches
    si5326_scl         : out   std_logic;
    si5326_sda         : inout std_logic;
    si5326_rstn        : out   std_logic;
    si5326_phase_inc   : out   std_logic;
    si5326_phase_dec   : out   std_logic;
    si5326_clk1_validn : in    std_logic;
    si5326_clk2_validn : in    std_logic;
    si5326_lol         : in    std_logic;
    si5326_clk_sel     : out   std_logic;
    si5326_rate0       : out   std_logic;
    si5326_rate1       : out   std_logic;
    clk40_p            : in    std_logic;
    clk40_n            : in    std_logic;
    adc_spi_cs         : out   std_logic_vector(1 downto 0);
    adc_spi_mosi       : out   std_logic;
    adc_spi_miso       : in    std_logic_vector(1 downto 0);
    adc_spi_sclk       : out   std_logic;
    adc_d_p            : in    std_logic_vector(N_CHAN - 1 downto 0);
    adc_d_n            : in    std_logic_vector(N_CHAN - 1 downto 0);
    analog_scl         : out   std_logic;
    analog_sda         : inout std_logic;
    sync_a_p           : inout std_logic;
    sync_a_n           : inout std_logic;
    sync_b_p           : inout std_logic;
    sync_b_n           : inout std_logic;
--              sync_c_p: inout std_logic;
--              sync_c_n: inout std_logic;
    clk_pll_p          : out   std_logic;
    clk_pll_n          : out   std_logic
    );

end top;

architecture rtl of top is

    signal clk_ipb, rst_ipb, clk125, rst125, nuke, soft_rst, userled, clk200 : std_logic;
    signal ipb_out                                                           : ipb_wbus;
    signal ipb_in                                                            : ipb_rbus;
    signal debug                                                             : std_logic_vector(3 downto 0);
    signal si5326_sda_o, analog_sda_o                                        : std_logic;

begin

-- Infrastructure

    -- Should work for artix also...
    infra : entity work.pc053a_infra
        port map(
            eth_clk_p             => eth_clk_p,
            eth_clk_n             => eth_clk_n,
            eth_tx_p              => eth_tx_p,
            eth_tx_n              => eth_tx_n,
            eth_rx_p              => eth_rx_p,
            eth_rx_n              => eth_rx_n,
            sfp_los               => sfp_los,
            clk_ipb_o             => clk_ipb,
            rst_ipb_o             => rst_ipb,
            clk125_o              => clk125,
            rst125_o              => rst125,
            clk200                => clk200,
            nuke                  => nuke,
            soft_rst              => soft_rst,
            leds                  => leds(1 downto 0),
            debug                 => leds_c,
            mac_addr(47 downto 4) => MAC_ADDR(47 downto 4),
            mac_addr(3 downto 0)  => dip_sw,
            ip_addr(31 downto 4)  => IP_ADDR(31 downto 4),
            ip_addr(3 downto 0)   => dip_sw,
            ipam_select           => '0',
            ipb_in                => ipb_in,
            ipb_out               => ipb_out
            );

    sfp_tx_disable <= '0';
    sfp_scl        <= '1';
    sfp_sda        <= '1';

    payload : entity work.payload
        port map(
            ipb_clk            => clk_ipb,
            ipb_rst            => rst_ipb,
            ipb_in             => ipb_out,
            ipb_out            => ipb_in,
            clk125             => clk125,
            rst125             => rst125,
            clk200             => clk200,
            nuke               => nuke,
            soft_rst           => soft_rst,
            userleds           => open,
            si5326_scl         => si5326_scl,
            si5326_sda_o       => si5326_sda_o,
            si5326_sda_i       => si5326_sda,
            si5326_rstn        => si5326_rstn,
            si5326_phase_inc   => si5326_phase_inc,
            si5326_phase_dec   => si5326_phase_dec,
            si5326_clk1_validn => si5326_clk1_validn,
            si5326_clk2_validn => si5326_clk2_validn,
            si5326_lol         => si5326_lol,
            si5326_clk_sel     => si5326_clk_sel,
            si5326_rate0       => si5326_rate0,
            si5326_rate1       => si5326_rate1,
            clk40_p            => clk40_p,
            clk40_n            => clk40_n,
            adc_cs             => adc_spi_cs,
            adc_mosi           => adc_spi_mosi,
            adc_miso           => adc_spi_miso,
            adc_sclk           => adc_spi_sclk,
            adc_d_p            => adc_d_p,
            adc_d_n            => adc_d_n,
            analog_scl         => analog_scl,
            analog_sda_o       => analog_sda_o,
            analog_sda_i       => analog_sda,
            sync_a_p           => sync_a_p,
            sync_a_n           => sync_a_n,
            sync_b_p           => sync_b_p,
            sync_b_n           => sync_b_n,
--                      sync_c_p => sync_c_p,
--                      sync_c_n => sync_c_n,
            clk_pll_p          => clk_pll_p,
            clk_pll_n          => clk_pll_n
            );

    si5326_sda <= '0' when si5326_sda_o = '0' else 'Z';
    analog_sda <= '0' when analog_sda_o = '0' else 'Z';

end rtl;
