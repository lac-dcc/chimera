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


-- Single port 32b memory
--
-- Dave Newbold, April 2019

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ipbus_udp_ram_buf is
	generic(
		ADDR_WIDTH: positive := 10
	);
	port(
		clk: in std_logic;
		addr: in std_logic_vector(ADDR_WIDTH - 1 downto 0);
		rd: out std_logic_vector(31 downto 0);
		wd: in std_logic_vector(31 downto 0);
		wen: in std_logic
	);  
  
end ipbus_udp_ram_buf;

architecture rtl of ipbus_udp_ram_buf is

	type ram_array is array(2 ** ADDR_WIDTH - 1 downto 0) of std_logic_vector(31 downto 0);
	shared variable ram: ram_array  := (others => (others => '0'));
	signal sel: integer range 0 to 2 ** ADDR_WIDTH + 1 := 0;
  
begin

	sel <= to_integer(unsigned(addr));

	process(clk)
	begin
		if rising_edge(clk) then
			rd <= ram(sel);
			if wen = '1' then
				ram(sel) := wd;
			end if;
		end if;
	end process;

end rtl;
