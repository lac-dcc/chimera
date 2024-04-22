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

package ipbus_reg_types is

	type ipb_reg_v is array(natural range <>) of std_logic_vector(31 downto 0);

-- Useful functions - compile-time only

	function calc_width(n: integer) return integer;
	function integer_max(left, right: integer) return integer;

end package ipbus_reg_types;

package body ipbus_reg_types is

	function calc_width(n: integer) return integer is
	begin
		for i in 0 to 31 loop
			if(2 ** i >= n) then
				return(i);
			end if;
		end loop;
		return(0);
	end function calc_width;

	function integer_max(left, right: integer) return integer is
	begin
		if left > right then
			return left;
		else
			return right;
		end if;
	end function integer_max;
	
end package body ipbus_reg_types;

