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


-- The ipbus bus fabric, address select logic, data multiplexers
--
-- This version selects the addressed slave depending on the state
-- of incoming control lines
--
-- Dave Newbold, February 2011
--
-- Updated to reflect true ack and err in case of misbehaving slave...
--
-- Dave Sankey April 2021

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.ALL;

entity ipbus_fabric_sel is
  generic(
    NSLV: natural;
    STROBE_GAP: boolean := false;
    SEL_WIDTH: natural
   );
  port(
  	sel: in std_logic_vector(SEL_WIDTH - 1 downto 0);
    ipb_in: in ipb_wbus;
    ipb_out: out ipb_rbus;
    ipb_to_slaves: out ipb_wbus_array(NSLV - 1 downto 0);
    ipb_from_slaves: in ipb_rbus_array(NSLV - 1 downto 0) := (others => IPB_RBUS_NULL)
   );

end ipbus_fabric_sel;

architecture rtl of ipbus_fabric_sel is

	signal sel_i: integer range 0 to NSLV := 0;
	signal true_ack, true_err, qstrobe: std_logic;

begin

	sel_i <= to_integer(unsigned(sel)) when NSLV > 1 else 0;
	
	qstrobe <= ipb_in.ipb_strobe when STROBE_GAP = false else
	 ipb_in.ipb_strobe and not (true_ack or true_err);

	busgen: for i in NSLV - 1 downto 0 generate
	begin

		ipb_to_slaves(i).ipb_addr <= ipb_in.ipb_addr;
		ipb_to_slaves(i).ipb_wdata <= ipb_in.ipb_wdata;
		ipb_to_slaves(i).ipb_strobe <= qstrobe when sel_i = i else '0';
		ipb_to_slaves(i).ipb_write <= ipb_in.ipb_write;

	end generate;

  true_ack <= ipb_from_slaves(sel_i).ipb_ack when sel_i /= NSLV else '0';
  true_err <= ipb_from_slaves(sel_i).ipb_err when sel_i /= NSLV else '0';
  ipb_out.ipb_rdata <= ipb_from_slaves(sel_i).ipb_rdata when sel_i /= NSLV else (others => '0');
  ipb_out.ipb_ack <= true_ack;
  ipb_out.ipb_err <= true_err;
  
end rtl;
