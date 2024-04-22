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


-- del_array
--
-- Generic delay element (should synthesise to SRL16/32 in Xilinx devices)
--
-- Dave Newbold, March 2014.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.VComponents.all;

entity del_array is
	generic(
		DWIDTH: positive;
		DELAY: integer
	);
	port(
		clk: in std_logic;
		d: in std_logic_vector(DWIDTH - 1 downto 0);
		q: out std_logic_vector(DWIDTH - 1 downto 0)
	);

end del_array;

architecture rtl of del_array is

	type del_array_t is array(DELAY downto 0) of std_logic_vector(DWIDTH - 1 downto 0);
	signal del_array: del_array_t;

begin

	del_array(0) <= d;

	process(clk)
	begin
		if rising_edge(clk) then
			del_array(DELAY downto 1) <= del_array(DELAY - 1 downto 0);
		end if;
	end process;
	
	q <= del_array(DELAY);

end rtl;

