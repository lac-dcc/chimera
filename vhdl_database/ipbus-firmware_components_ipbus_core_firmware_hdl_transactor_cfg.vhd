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


-- Some registers to store the config information for the ipbus controller
--
-- Typically used to allow ucontroller to set the mac / ip address
--
-- Dave Newbold, January 2012
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

entity transactor_cfg is
	port(
		clk: in std_logic; -- IPbus clock
		rst: in std_logic; -- Sync reset
		we: in std_logic; -- local bus write enable
		addr: in std_logic_vector(1 downto 0); -- local bus address
		din: in std_logic_vector(31 downto 0); -- local bus data in
		dout: out std_logic_vector(31 downto 0); -- local bus data out
		vec_in: in std_logic_vector(127 downto 0);
		vec_out: out std_logic_vector(127 downto 0)
	);
		
end transactor_cfg;

architecture rtl of transactor_cfg is

	signal s: integer;
	
begin

	s <= to_integer(unsigned(addr));

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				vec_out <= (others => '0');
			elsif we = '1' then 
				vec_out(31 + s * 32 downto s * 32) <= din;
			end if;
		end if;
	end process;
	
	dout <= vec_in(31 + s * 32 downto s * 32);	

end rtl;
