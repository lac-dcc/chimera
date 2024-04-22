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


-- clocks_v6
--
-- Generates a 125MHz ethernet clock and 31MHz ipbus clock from the 200MHz reference
-- Also an unbuffered 200MHz clock for IO delay calibration block
-- Includes reset logic for ipbus
--
-- Dave Newbold, April 2011
--
-- $Id$

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.VComponents.all;

entity clocks_v6 is port(
	sysclk_p, sysclk_n: in std_logic;
	clko_125: out std_logic;
	clko_200: out std_logic;
	clko_ipb: out std_logic;
	locked: out std_logic;
	rsto_125: out std_logic;
	rsto_ipb: out std_logic;
	onehz: out std_logic
	);

end clocks_v6;

architecture rtl of clocks_v6 is
	
	signal locked_int, sysclk, clk_ipb_i, clk_125_i, clkfb, clk_ipb_b, clk_125_b: std_logic;
	signal rst: std_logic := '1';
	signal d17, d17_d: std_logic;
	
	component clock_divider_s6 port(
		clk: in std_logic;
		d25: out std_logic;
		d28: out std_logic
	);
	end component;

begin

	ibufgds0: IBUFGDS port map(
		i => sysclk_p,
		ib => sysclk_n,
		o => sysclk
	);
	
	clko_200 <= sysclk; -- io delay ref clock only, no bufg

	bufg125: BUFG port map(
		i => clk_125_i,
		o => clk_125_b
	);
	
	clko_125 <= clk_125_b;
	
	bufgipb: BUFG port map(
		i => clk_ipb_i,
		o => clk_ipb_b
	);
	
	clko_ipb <= clk_ipb_b;
	
	mmcm: MMCM_BASE
		generic map(
			clkfbout_mult_f => 5.0,
			clkout1_divide => 8,
			clkout2_divide => 32,
			clkin1_period => 5.0
		)
		port map(
			clkin1 => sysclk,
			clkfbin => clkfb,
			clkfbout => clkfb,
			clkout1 => clk_125_i,
			clkout2 => clk_ipb_i,
			locked => locked_int,
			rst => '0',
			pwrdwn => '0'
		);
		
	locked <= locked_int;
	
	clkdiv: clock_divider_s6 port map(
		clk => sysclk,
		d17 => d17,
		d28 => onehz
	);
	
	-- Reset generator (~100ms reset pulse)
	
	process(sysclk)
	begin
		if rising_edge(sysclk) then
			d17_d <= d17;
			if d17='1' and d17_d='0' then
				rst <= not locked_int;
			end if;
		end if;
	end process;
	
	process(clk_ipb_b)
	begin
		if rising_edge(clk_ipb_b) then
			rsto_ipb <= rst;
		end if;
	end process;

	process(clk_125_b)
	begin
		if rising_edge(clk_125_b) then
			rsto_125 <= rst;
		end if;
	end process;
			
end rtl;

