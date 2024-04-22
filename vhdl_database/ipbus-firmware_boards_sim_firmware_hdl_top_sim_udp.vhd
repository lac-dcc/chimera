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
-- This version is for simulation, using UDP interface to Modelsim
--
-- Dave Newbold, April 2019

library IEEE;
use IEEE.STD_LOGIC_1164.all;

use work.ipbus.all;

entity top is
end top;

architecture rtl of top is

    signal clk_ipb, rst_ipb, clk_aux, rst_aux, nuke, soft_rst : std_logic;
    signal ipb_w                                              : ipb_wbus;
    signal ipb_r                                              : ipb_rbus;

begin

-- Infrastructure

    infra : entity work.sim_udp_infra
        port map(
            clk_ipb_o => clk_ipb,
            rst_ipb_o => rst_ipb,
            clk_aux_o => clk_aux,
            rst_aux_o => rst_aux,
            nuke      => nuke,
            soft_rst  => soft_rst,
            ipb_in    => ipb_r,
            ipb_out   => ipb_w
            );

-- ipbus slaves live in the entity below, and can expose top-level ports
-- The ipbus fabric is instantiated within.

    payload : entity work.payload
        port map(
            ipb_clk  => clk_ipb,
            ipb_rst  => rst_ipb,
            ipb_in   => ipb_w,
            ipb_out  => ipb_r,
            clk      => clk_aux,
            rst      => rst_aux,
            nuke     => nuke,
            soft_rst => soft_rst,
            userled  => open
            );

end rtl;
