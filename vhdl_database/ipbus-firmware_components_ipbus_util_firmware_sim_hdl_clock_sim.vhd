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


-- Behavioural model of clocks for ipbus testing
--
-- The clock edges are *not* delta cycle accurate
-- Do not assume any phase relationship between clk125, clk25
--
-- Dave Newbold, March 2011

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_sim is
	generic(
		CLK_AUX_FREQ: real := 40.0
	);
	port(
		clko125: out std_logic;
		clko25: out std_logic;
		clko_aux: out std_logic;
		clko62_5: out std_logic;
		nuke: in std_logic;
		soft_rst: in std_logic;
		rsto_ipb: out std_logic;
		rsto_aux: out std_logic;
		rsto_ctrl: out std_logic
	);

end clock_sim;

architecture behavioural of clock_sim is

	signal clk125, clk25, clk_aux, clk62_5, nuke_del, rst, srst: std_logic := '0';
	signal reset_vec: std_logic_vector(3 downto 0) := X"f";
	signal rctr: unsigned(3 downto 0) := "0000";

begin

	clk125 <= not clk125 after 4 ns;
	clk25 <= not clk25 after 20 ns;
	clk_aux <= not clk_aux after (500000.0 / CLK_AUX_FREQ) * 1 ps;
	clk62_5 <= not clk62_5 after 8 ns;
	
	clko125 <= clk125;
	clko25 <= clk25;
	clko_aux <= clk_aux;
	clko62_5 <= clk62_5;
	
	srst <= '1' when rctr /= "0000" else '0';
	
	process(clk25)
	begin
		if rising_edge(clk25) then
			reset_vec <= '0' & reset_vec(3 downto 1);
			if srst = '1' or soft_rst = '1' then
				rctr <= rctr + 1;
			end if;
		end if;
	end process;

	nuke_del <= nuke after 50 us;
	rst <= reset_vec(0) or nuke_del;
	rsto_ctrl <= rst;
	rsto_ipb <= rst or srst;

	process(clk_aux)
	begin
		if rising_edge(clk_aux) then
			rsto_aux <= rst;
		end if;
	end process;

end behavioural;
