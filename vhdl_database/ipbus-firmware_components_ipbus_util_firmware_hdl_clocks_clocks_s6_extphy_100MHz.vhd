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


-- clocks_s6_extphy
--
-- Generates a 125MHz ethernet clock and 31MHz ipbus clock from the 100MHz reference
-- Includes reset logic for ipbus
--
-- Dave Newbold, April 2011
--
-- $Id$

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.VComponents.all;

entity clocks_s6_extphy_100MHz is port(
	sysclk: in std_logic;
	clko_125: out std_logic;
	clko_ipb: out std_logic;
	locked: out std_logic;
	nuke: in std_logic;
	rsto_125: out std_logic;
	rsto_ipb: out std_logic;
	onehz: out std_logic
	);

end clocks_s6_extphy_100MHz;

architecture rtl of clocks_s6_extphy_100MHz is

	signal clk_ipb_i, clk_ipb_b, clk_125_i, clk_125_b, sysclk_b: std_logic;
	signal d17, d17_d, dcm_locked: std_logic;
	signal nuke_i, nuke_d, nuke_d2: std_logic := '0';
	signal rst, rst_ipb, rst_125: std_logic := '1';
	
begin

	ibufgds0: IBUFG port map(
		i => sysclk,
		o => sysclk_b
	);

	bufg_125: BUFG port map(
		i => clk_125_i,
		o => clk_125_b
	);
	
	clko_125 <= clk_125_b;
	
	bufg_ipb: BUFG port map(
		i => clk_ipb_i,
		o => clk_ipb_b
	);
	
	clko_ipb <= clk_ipb_b;

	dcm0: DCM_CLKGEN
		generic map(
			CLKIN_PERIOD => 10.0,
			CLKFX_MULTIPLY => 10,
			CLKFX_DIVIDE => 8,
			CLKFXDV_DIVIDE => 4
		)
		port map(
			clkin => sysclk_b,
			clkfx => clk_125_i,
			clkfxdv => clk_ipb_i,
			locked => dcm_locked,
			rst => '0'
		);
		
	clkdiv: entity work.clock_div port map(
		clk => sysclk_b,
		d17 => d17,
		d28 => onehz
	);
	
	process(sysclk_b)
	begin
		if rising_edge(sysclk_b) then
			d17_d <= d17;
			if d17='1' and d17_d='0' then
				rst <= nuke_d2 or not dcm_locked;
				nuke_d <= nuke_i; -- Time bomb (allows return packet to be sent)
				nuke_d2 <= nuke_d;
			end if;
		end if;
	end process;
	
	locked <= dcm_locked;

	process(clk_ipb_b)
	begin
		if rising_edge(clk_ipb_b) then
			rst_ipb <= rst;
			nuke_i <= nuke;
		end if;
	end process;
	
	rsto_ipb <= rst_ipb;
	
	process(clk_125_b)
	begin
		if rising_edge(clk_125_b) then
			rst_125 <= rst;
		end if;
	end process;
	
	rsto_125 <= rst_125;

end rtl;

