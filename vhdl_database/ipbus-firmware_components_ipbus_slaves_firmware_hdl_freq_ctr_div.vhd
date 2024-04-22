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


-- freq_ctr_div
--
-- General clock frequency monitor
--
-- This part divides a local clock by 64, the output to be sent to the
-- frequency counter part.
--
-- Dave Newbold, September 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity freq_ctr_div is
	generic(
		N_CLK: positive := 1
	);
	port(
		clk: in std_logic_vector(N_CLK - 1 downto 0);
		clkdiv: out std_logic_vector(N_CLK - 1 downto 0)
	);
	
end freq_ctr_div;

architecture rtl of freq_ctr_div is

	signal t: std_logic_vector(N_CLK - 1 downto 0) := (others => '0');

begin

	div_gen: for i in N_CLK - 1 downto 0 generate
	
		signal q: std_logic;
		signal cnt: natural range 0 to 31;
		
	begin
		
		process(clk(i))
		begin
			if rising_edge(clk(i)) then
				
				if cnt = 0 then
					cnt <= 31;
					q <= '1';
				else
					cnt <= cnt - 1;
					q <= '0';					
				end if;
					
				if q = '1' then
					t(i) <= not t(i);
				end if;
				
			end if;
		end process;
		
	end generate;
	
	clkdiv <= t;
	
end rtl;
