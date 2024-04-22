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
use ieee.numeric_std.all;

library unisim;
use unisim.VComponents.all;

entity clocks_v6_serdes_noxtal is
	port(
		clki_125_fr: in std_logic;
		clki_125: in std_logic;
		clko_ipb: out std_logic;
		clko_62_5: out std_logic;
		clko_200: out std_logic; -- 200MHz clock for idelayctrl
		eth_locked: in std_logic;
		locked: out std_logic;
		nuke: in std_logic;
		soft_rst: in std_logic;
		rsto_125: out std_logic;
		rsto_ipb: out std_logic;
		rsto_ipb_ctrl: out std_logic;
		rsto_eth: out std_logic;
		rsto_fr: out std_logic;
		onehz: out std_logic
	);

end clocks_v6_serdes_noxtal;

architecture rtl of clocks_v6_serdes_noxtal is
	
	signal dcm_locked, sysclk, sysclk_ub, clk_ipb_i, clk_ipb_b, clkfb: std_logic;
	signal clk_62_5_i, clk_62_5_u: std_logic;
	signal d17, d17_d: std_logic;
	signal dcm_rst, nuke_i, nuke_d, nuke_d2, eth_done: std_logic := '0';
	signal rst, srst, rst_ipb, rst_125, rst_ipb_ctrl: std_logic := '1';
	signal rctr: unsigned(3 downto 0) := "0000";

begin

	bufgipb: BUFG port map(
		i => clk_ipb_i,
		o => clk_ipb_b
	);
	
	clko_ipb <= clk_ipb_b;
	
	sysclk <= clki_125_fr;
	
	bufg_62_5: BUFG port map(
		i => clk_62_5_u,
		o => clk_62_5_i
	);
	
	clko_62_5 <= clk_62_5_i;
	
	mmcm: MMCM_BASE
		generic map(
			clkin1_period => 8.0,
			clkfbout_mult_f => 8.0, -- VCO freq 1000MHz
			clkout1_divide => 32,
			clkout2_divide => 16,
			clkout3_divide => 5
		)
		port map(
			clkin1 => sysclk,
			clkfbin => clkfb,
			clkfbout => clkfb,
			clkout1 => clk_ipb_i,
			clkout2 => clk_62_5_u, -- No BUFG needed here, goes to an adjacent MMCM
			clkout3 => clko_200, -- No BUFG needed here, goes to idelayctrl on local routing
			locked => dcm_locked,
			rst => dcm_rst,
			pwrdwn => '0'
		);
			
	clkdiv: entity work.ipbus_clock_div port map(
		clk => sysclk,
		d17 => d17,
		d28 => onehz
	);
	
	process(sysclk)
	begin
		if rising_edge(sysclk) then
			d17_d <= d17;
			if d17='1' and d17_d='0' then
				dcm_rst <= not (dcm_locked or dcm_rst);
				rst <= nuke_d2 or not dcm_locked;
				nuke_d <= nuke_i; -- Time bomb (allows return packet to be sent)
				nuke_d2 <= nuke_d;
				eth_done <= (eth_done or eth_locked) and not rst;
				rsto_eth <= rst; -- delayed reset for ethernet block to avoid startup issues				
			end if;
		end if;
	end process;
	
	locked <= dcm_locked;
	srst <= '1' when rctr /= "0000" else '0';

	process(clk_ipb_b)
	begin
		if rising_edge(clk_ipb_b) then
			rst_ipb <= rst or srst;
			nuke_i <= nuke;
			if srst = '1' or soft_rst = '1' then
				rctr <= rctr + 1;
			end if;
		end if;
	end process;
	
	rsto_ipb <= rst_ipb;
	
	process(clk_ipb_b)
	begin
		if rising_edge(clk_ipb_b) then
			rst_ipb_ctrl <= rst;
		end if;
	end process;
	
	rsto_ipb_ctrl <= rst_ipb_ctrl;
	
	process(clki_125)
	begin
		if rising_edge(clki_125) then
			rst_125 <= rst or not eth_done;
		end if;
	end process;
	
	rsto_125 <= rst_125;
	
	rsto_fr <= rst;
		
end rtl;

