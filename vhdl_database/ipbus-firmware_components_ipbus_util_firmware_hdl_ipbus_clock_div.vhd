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


-- ipbus_clock_div
--
-- Various divided clocks for reset logic, flashing lights, etc
--
-- Dave Newbold, March 2013. Rewritten by Paschalis Vichoudis, June 2013

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.VComponents.all;

entity ipbus_clock_div is
	port(
		clk: in std_logic;
		d7 : out std_logic;
		d17: out std_logic;
		d25: out std_logic;
		d28: out std_logic
	);

end ipbus_clock_div;

architecture rtl of ipbus_clock_div is

	signal rst_b: std_logic;
	signal cnt: unsigned(27 downto 0);

begin

	reset_gen: component SRL16
		port map(
			a0 	=> '1',
			a1 	=> '1',
			a2 	=> '1',
			a3 	=> '1',
			clk => clk,
			d => '1',
			q => rst_b
		);	

	process(rst_b, clk)
	begin
		if rising_edge(clk) then
			if rst_b = '0' then
				cnt <= (others => '0');
			else
				cnt <= cnt + 1;
			end if;
		end if;
	end process;
	
	d28 <= cnt(27);
	d25 <= cnt(24);
	d17 <= cnt(16);
	d7  <= cnt(6);

end rtl;
