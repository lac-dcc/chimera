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


-- clocks_v6_serdes
--
-- Generates a ~32MHz ipbus clock from 125MHz reference
-- Includes reset logic for ipbus
--
-- Dave Newbold, April 2011
--
-- $Id$

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.VComponents.all;

entity clocks_v6_serdes_noxtal_dual is port(
	clki_125_fr: in std_logic;
	clki_125: in std_logic;
	clki_125b: in std_logic;
	clko_ipb: out std_logic;
	eth_locked: in std_logic;
	eth_lockedb: in std_logic;
	locked: out std_logic;
	nuke: in std_logic;
	rsto_ipb: out std_logic;
	rsto_125: out std_logic;
	rsto_125b: out std_logic;
	rsto_eth: out std_logic;
	onehz: out std_logic
	);

end clocks_v6_serdes_noxtal_dual;

architecture rtl of clocks_v6_serdes_noxtal_dual is
	
	signal dcm_locked, sysclk, sysclk_ub, clk_ipb_i, clk_ipb_b, clkfb: std_logic;
	signal d17, d17_d: std_logic;
	signal nuke_i, nuke_d, nuke_d2: std_logic := '0';
	signal rst, rst_ipb, rst_125, rst_125b, rst_eth: std_logic := '1';

begin

	bufgipb: BUFG port map(
		i => clk_ipb_i,
		o => clk_ipb_b
	);
	
	clko_ipb <= clk_ipb_b;
	
	sysclk <= clki_125_fr;
	
	mmcm: MMCM_BASE
		generic map(
			clkfbout_mult_f => 8.0,
			clkout1_divide => 32,
			clkin1_period => 8.0
		)
		port map(
			clkin1 => sysclk,
			clkfbin => clkfb,
			clkfbout => clkfb,
			clkout1 => clk_ipb_i,
			locked => dcm_locked,
			rst => '0',
			pwrdwn => '0'
		);
			
	clkdiv: entity work.clock_div port map(
		clk => sysclk,
		d17 => d17,
		d28 => onehz
	);
	
	process(sysclk)
	begin
		if rising_edge(sysclk) then
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
	
	process(clki_125)
	begin
		if rising_edge(clki_125) then
			rst_125 <= rst or not eth_locked;
		end if;
	end process;
	
	rsto_125 <= rst_125;
	
	process(clki_125b)
	begin
		if rising_edge(clki_125b) then
			rst_125b <= rst or not eth_lockedb;
		end if;
	end process;
	
	rsto_125b <= rst_125b;
	
	process(sysclk)
	begin
		if rising_edge(sysclk) then
			rst_eth <= rst;
		end if;
	end process;
	
	rsto_eth <= rst_eth;
		
end rtl;

