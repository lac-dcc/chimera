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


-- ipbus_trans_decl
--
-- Defines the types for interface between ipbus transactor and
-- the memory buffers which hold input and output packets
--
-- Dave Newbold, September 2012


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ipbus_trans_decl is

	constant addr_width: positive := 16;

	-- Signals from buffer to transactor
	
	type ipbus_trans_in is
		record
			pkt_rdy: std_logic;
			rdata: std_logic_vector(31 downto 0);
			busy: std_logic;
		end record;

	type ipbus_trans_in_array is array(natural range <>) of ipbus_trans_in;
		
	-- Signals from transactor to buffer
	
	type ipbus_trans_out is
		record
			raddr: std_logic_vector(addr_width - 1 downto 0);
			pkt_done: std_logic;
			we: std_logic;
			waddr: std_logic_vector(addr_width - 1 downto 0);
			wdata: std_logic_vector(31 downto 0);
		end record;
  
	type ipbus_trans_out_array is array(natural range <>) of ipbus_trans_out;  

end ipbus_trans_decl;
