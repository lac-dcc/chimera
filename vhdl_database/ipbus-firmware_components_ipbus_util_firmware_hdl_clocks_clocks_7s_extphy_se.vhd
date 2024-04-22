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


-- clocks_7s_extphy_se
--
-- Generates a 125MHz ethernet clock and 31MHz ipbus clock from the 50MHz reference
-- Also an unbuffered 200MHz clock for IO delay calibration block
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

entity clocks_7s_extphy_se is
	generic(
		CLK_FR_FREQ: real := 50.0; -- free-running clock frequency
		CLK_VCO_FREQ: real := 1000.0; -- VCO freq 1000MHz
		CLK_AUX_FREQ: real := 40.0 -- Aux Clock frequency
	);
	port(
		sysclk: in std_logic;
		clko_125: out std_logic;
		clko_125_90: out std_logic;
		clko_200: out std_logic;
		clko_ipb: out std_logic; 
		clko_aux: out std_logic;
		locked: out std_logic;
		nuke: in std_logic;
		soft_rst: in std_logic;
		rsto_125: out std_logic;
		rsto_ipb: out std_logic;
		rsto_aux: out std_logic;
		rsto_ipb_ctrl: out std_logic;
		onehz: out std_logic
	);

end clocks_7s_extphy_se;

architecture rtl of clocks_7s_extphy_se is
	
	signal dcm_locked, sysclk_u, sysclk_i, clk_ipb_i, clk_125_i, clk_125_90_i, clk_aux_i, clkfb, clk_ipb_b, clk_125_b, clk_aux_b, clk_200_i: std_logic;
	signal d17, d17_d: std_logic;
	signal nuke_i, nuke_d, nuke_d2: std_logic := '0';
	signal rst, srst, rst_ipb, rst_125, rst_aux, rst_ipb_ctrl: std_logic := '1';
	signal rctr: unsigned(3 downto 0) := "0000";

begin

	ibufgds0: IBUFG port map(
		i => sysclk,
		o => sysclk_u
	);
	
	bufhsys: BUFH port map(
		i => sysclk_u,
		o => sysclk_i
	);
	
	bufg125: BUFG port map(
		i => clk_125_i,
		o => clk_125_b
	);

	clko_125 <= clk_125_b;

	bufg125_90: BUFG port map(
		i => clk_125_90_i,
		o => clko_125_90
	);
	
	bufgipb: BUFG port map(
		i => clk_ipb_i,
		o => clk_ipb_b
	);
	
	clko_ipb <= clk_ipb_b;
	
	bufg200: BUFG port map(
		i => clk_200_i,
		o => clko_200
	);	
	
	bufgaux: BUFG port map(
		i => clk_aux_i,
		o => clk_aux_b
	);

	clko_aux <= clk_aux_b;

	mmcm: MMCME2_BASE
		generic map(
			clkin1_period => 1000.0 / CLK_FR_FREQ,
			clkfbout_mult_f => CLK_VCO_FREQ / CLK_FR_FREQ,
			clkout1_divide => integer(CLK_VCO_FREQ / 125.00), -- 125 MHz clock
			clkout2_divide => integer(CLK_VCO_FREQ / 125.00), -- 125 MHz clock, 90 deg phase
			clkout2_phase => 90.0,
			clkout3_divide => integer(CLK_VCO_FREQ / 31.25),
			clkout4_divide => integer(CLK_VCO_FREQ / 200.00),
			clkout5_divide => integer(CLK_VCO_FREQ / CLK_AUX_FREQ)
		)
		port map(
			clkin1 => sysclk_i,
			clkfbin => clkfb,
			clkfbout => clkfb,
			clkout1 => clk_125_i,
			clkout2 => clk_125_90_i,
			clkout3 => clk_ipb_i,
			clkout4 => clk_200_i,
			clkout5 => clk_aux_i,
			locked => dcm_locked,
			rst => '0',
			pwrdwn => '0'
		);
	
	clkdiv: entity work.ipbus_clock_div
		port map(
			clk => sysclk_i,
			d17 => d17,
			d28 => onehz
		);
	
	process(sysclk_i)
	begin
		if rising_edge(sysclk_i) then
			d17_d <= d17;
			if d17='1' and d17_d='0' then
				rst <= nuke_d2 or not dcm_locked;
				nuke_d <= nuke_i; -- Time bomb (allows return packet to be sent)
				nuke_d2 <= nuke_d;
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
	
	process(clk_125_b)
	begin
		if rising_edge(clk_125_b) then
			rst_125 <= rst;
		end if;
	end process;
	
	rsto_125 <= rst_125;

	process(clk_aux_b)
	begin
		if rising_edge(clk_aux_b) then
			rst_aux <= rst;
		end if;
	end process;
	
	rsto_aux <= rst_aux;
			
end rtl;
