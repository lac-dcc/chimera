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


-- ipbus_freq_ctr
--
-- General clock frequency monitor (slightly advanced version).
--
-- Optimised to measure a large number of clocks, without requiring large resources
-- in each local clock domain (e.g. for monitoring transceiver clocks).
--
-- Counts number of pulses of the (divided by 64) clock in 16M cycles of ipbus clock
-- Should deal with clocks between 1MHz and ~320MHz.
--
-- This version is just like the original ipbus_freq_ctr, but with a
-- dedicated reference clock for the counters, instead of relying on
-- the IPBus clock.

--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.ipbus.all;
use work.ipbus_reg_types.all;

library unisim;
use unisim.VComponents.all;

entity ipbus_freq_ctr is
	generic(
		N_CLK: natural := 1
	);
	port(
		clk_ref: in std_logic;
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		clkdiv: in std_logic_vector(N_CLK - 1 downto 0)
	);
	
end ipbus_freq_ctr;

architecture rtl of ipbus_freq_ctr is

	signal stat, ctrl: ipb_reg_v(0 downto 0);
	signal cyc: std_logic;

begin

	reg: entity work.ipbus_syncreg_v
		generic map(
			N_CTRL => 1,
			N_STAT => 1
		)
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in,
			ipb_out => ipb_out,
			slv_clk => clk_ref,
			d => stat,
			q => ctrl,
			stb(0) => cyc
		);

	freq_ctr: entity work.ipbus_freq_ctr_core
		generic map(
			N_CLK => N_CLK
		)
		port map(
			clk_ref => clk_ref,
			ctrl_cyc => cyc,
			ctrl => ctrl(0),
			stat => stat(0),
			clkdiv => clkdiv
		);

end rtl;

--------------------------------------------------------------------------------
