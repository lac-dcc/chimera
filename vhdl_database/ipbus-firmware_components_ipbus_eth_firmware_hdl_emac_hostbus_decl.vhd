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


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package emac_hostbus_decl is

-- The signals going from master to slaves
	type emac_hostbus_in is
		record
			hostclk: std_logic;
			hostopcode: std_logic_vector(1 downto 0);
			hostaddr: std_logic_vector(9 downto 0);
			hostwrdata: std_logic_vector(31 downto 0);
			hostmiimsel: std_logic;
			hostreq: std_logic;
			hostemac1sel: std_logic;
		end record;
	 
-- The signals going from slaves to master	 
	type emac_hostbus_out is
		record
			hostrddata: std_logic_vector(31 downto 0);
			hostmiimrdy: std_logic;
		end record;

end emac_hostbus_decl;

