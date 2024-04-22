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
-- Dave Newbold, April 2019

library IEEE;
use IEEE.STD_LOGIC_1164.all;

use work.ipbus.all;
use work.ipbus_trans_decl.all;

entity sim_udp_infra is
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
        ipb_in    : in  ipb_rbus;       -- ipbus
        ipb_out   : out ipb_wbus
        );

end sim_udp_infra;

architecture rtl of sim_udp_infra is

    signal clk_ipb, clk_ipb_i, rst_ipb, rsti, rst_aux : std_logic;
    signal trans_in                      : ipbus_trans_in;
    signal trans_out                     : ipbus_trans_out;

begin

-- Clock generation for ipbus, ethernet, POR

    clocks : entity work.clock_sim
        generic map(
            CLK_AUX_FREQ => CLK_AUX_FREQ
            )
        port map(
            clko125   => open,
            clko25    => clk_ipb_i,
            clko_aux  => clk_aux_o,
            nuke      => nuke,
            soft_rst  => soft_rst,
            rsto_ipb  => rst_ipb,
            rsto_ctrl => rsti,
            rsto_aux  => rst_aux
            );

    clk_ipb   <= clk_ipb_i;  -- Best to align delta delays on all clocks for simulation
    clk_ipb_o <= clk_ipb_i;
    rst_ipb_o <= rst_ipb;
    rst_aux_o <= rst_aux;

-- sim UDP transport

    udp : entity work.ipbus_sim_udp
        port map(
            clk_ipb   => clk_ipb,
            rst_ipb   => rsti,
            trans_out => trans_in,
            trans_in  => trans_out
            );

-- IPbus transactor

    trans : entity work.transactor
        port map (
            clk            => clk_ipb,
            rst            => rsti,
            ipb_out        => ipb_out,
            ipb_in         => ipb_in,
            ipb_req        => open,
            ipb_grant      => '1',
            trans_in       => trans_in,
            trans_out      => trans_out,
            cfg_vector_in  => (others => '0'),
            cfg_vector_out => open
            );

end rtl;
