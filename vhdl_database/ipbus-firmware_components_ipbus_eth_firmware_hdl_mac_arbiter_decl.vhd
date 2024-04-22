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


-- mac_arbiter_decl
--
-- Defines the array types for the ports of the mac_arbiter entity
--
-- Dave Newbold, March 2011
--
-- $Id: mac_arbiter_decl.vhd 326 2011-04-25 20:00:14Z phdmn $

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package mac_arbiter_decl is
  
	type mac_arbiter_slv_array is array(natural range <>) of std_logic_vector(7 downto 0);
	type mac_arbiter_sl_array is array(natural range <>) of std_logic; 

end mac_arbiter_decl;
