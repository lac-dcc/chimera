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
-- General clock frequency monitor (core component).
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

entity ipbus_freq_ctr_core is
	generic(
		N_CLK: natural := 1
	);
	port(
		clk_ref: in std_logic;
		ctrl_cyc: in std_logic;
		ctrl: in std_logic_vector(31 downto 0);
		stat: out std_logic_vector(31 downto 0);
		clkdiv: in std_logic_vector(N_CLK - 1 downto 0)
	);

begin

	assert N_CLK <= 16
		report "Too many clocks for freq_ctr"
		severity failure;

end ipbus_freq_ctr_core;

architecture rtl of ipbus_freq_ctr_core is

	constant ADDR_WIDTH: integer := calc_width(N_CLK);
	signal sel: integer range 0 to 2 ** ADDR_WIDTH - 1 := 0;
	signal ctr, tctr, sctr: unsigned(23 downto 0) := X"000000";
	signal cd: std_logic_vector(2 ** ADDR_WIDTH - 1 downto 0) := (others => '0');
	signal t_in, t, t_d, valid, svalid: std_logic;
	
	attribute SHREG_EXTRACT: string;
	attribute SHREG_EXTRACT of t_in: signal is "no"; -- Synchroniser not to be optimised into shreg

begin
		
	sel <= to_integer(unsigned(ctrl(ADDR_WIDTH - 1 downto 0))) when ADDR_WIDTH > 0 else 0;
	
	cd(N_CLK - 1 downto 0) <= clkdiv;
	cd(2 ** ADDR_WIDTH - 1 downto N_CLK) <= (others => '0');
	
	process(clk_ref) -- Synchroniser
	begin
		if rising_edge(clk_ref) then
			t_in <= cd(sel);
			t <= t_in;
			t_d <= t;
		end if;
	end process;
	
	process(clk_ref) -- Counters
	begin
		if rising_edge(clk_ref) then
		
			ctr <= ctr + 1;

			if ctr = X"000000" or (ctr(15 downto 0) = X"0000" and ctrl(4) = '1') then
				sctr <= tctr;
				tctr <= X"000000";
			elsif t = '1' and t_d = '0' then
				tctr <= tctr + 1;
			end if;

			if ctr = X"000000" then
				svalid <= valid;
				valid <= '1';
			elsif ctrl_cyc = '1' then
				svalid <= '0';
				valid <= '0';
			end if;
				
		end if;
	end process;
	
	stat <= "0000000" & svalid & std_logic_vector(sctr) when ctrl(4) = '0' else
		"0000000" & svalid & std_logic_vector(sctr(15 downto 0)) & X"00";
	
end rtl;

--------------------------------------------------------------------------------
