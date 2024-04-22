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


-- Dual port memory with one 8b and one 32b port
--
-- Dave Newbold, April 2019

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ipbus_udp_ram_buf8 is
	generic(
		ADDR_WIDTH: positive := 10
	);
	port(
		clka: in std_logic;
		addra: in std_logic_vector(ADDR_WIDTH + 1 downto 0);
		rda: out std_logic_vector(7 downto 0);
		wda: in std_logic_vector(7 downto 0);
		wena: in std_logic;
		clkb: in std_logic;
		addrb: in std_logic_vector(ADDR_WIDTH - 1 downto 0);
		rdb: out std_logic_vector(31 downto 0);
		wdb: in std_logic_vector(31 downto 0);
		wenb: in std_logic
	);  
  
end ipbus_udp_ram_buf8;

architecture rtl of ipbus_udp_ram_buf8 is

	type ram_array is array(2 ** ADDR_WIDTH + 1 downto 0) of std_logic_vector(7 downto 0);
	shared variable ram: ram_array  := (others => (others => '0'));
	signal sela: integer range 0 to 2 ** ADDR_WIDTH + 1 := 0;
	signal selb: integer range 0 to 2 ** ADDR_WIDTH - 1 := 0;
  
begin

	sela <= to_integer(unsigned(addra));

	process(clka)
	begin
		if rising_edge(clka) then
			rda <= ram(sela);
			if wena = '1' then
				ram(sela) := wda;
			end if;
		end if;
	end process;
	
	selb <= to_integer(unsigned(addrb));

	process(clkb)
	begin
		if rising_edge(clkb) then
			rdb <= ram(selb * 4 + 3) & ram(selb * 4 + 2) & ram(selb * 4 + 1) & ram(selb * 4);
			if wenb = '1' then
				ram(selb * 4) := wdb(7 downto 0);
				ram(selb * 4 + 1) := wdb(15 downto 8);
				ram(selb * 4 + 2) := wdb(23 downto 16);
				ram(selb * 4 + 3) := wdb(31 downto 24);
			end if;
		end if;
	end process;

end rtl;
