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


-- drp_decl
--
-- Defines the array types for the ports of the drp_mux entity
--
-- Dave Newbold, September 2013

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package drp_decl is

-- The signals going from master to slaves
	type drp_wbus is
		record
			addr: std_logic_vector(15 downto 0);
			data: std_logic_vector(15 downto 0);
			en: std_logic;
			we: std_logic;
		end record;

	type drp_wbus_array is array(natural range <>) of drp_wbus;
	
	constant DRP_WBUS_NULL: drp_wbus := ((others => '0'), (others => '0'), '0', '0');
	
-- The signals going from slaves to master	 
	type drp_rbus is
		record
			data: std_logic_vector(15 downto 0);
			rdy: std_logic;
		end record;

	type drp_rbus_array is array(natural range <>) of drp_rbus;
	
	constant DRP_RBUS_NULL: drp_rbus := ((others => '0'), '0');

end drp_decl;

