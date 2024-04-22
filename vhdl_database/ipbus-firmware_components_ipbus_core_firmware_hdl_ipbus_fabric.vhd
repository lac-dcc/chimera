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
-- The address table is encoded in ipbus_addr_decode package - no need to change
-- anything in this file.
--
-- Dave Newbold, February 2011

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.ALL;
use work.ipbus_addr_decode.ALL;

entity ipbus_fabric is
  generic(
    NSLV: positive;
    STROBE_GAP: boolean := false
   );
  port(
    ipb_in: in ipb_wbus;
    ipb_out: out ipb_rbus;
    ipb_to_slaves: out ipb_wbus_array(NSLV - 1 downto 0);
    ipb_from_slaves: in ipb_rbus_array(NSLV - 1 downto 0) := (others => IPB_RBUS_NULL)
   );

end ipbus_fabric;

architecture rtl of ipbus_fabric is

	signal sel: integer range 0 to NSLV := 0;
	signal ored_ack, ored_err: std_logic_vector(NSLV downto 0);
	signal qstrobe: std_logic;

begin

	process(ipb_in.ipb_addr)
	begin
		sel <= ipbus_addr_sel(ipb_in.ipb_addr);
	end process;

	ored_ack(NSLV) <= '0';
	ored_err(NSLV) <= '0';
	
	qstrobe <= ipb_in.ipb_strobe when STROBE_GAP = false else
	 ipb_in.ipb_strobe and not (ored_ack(0) or ored_err(0));

	busgen: for i in NSLV-1 downto 0 generate
	begin

		ipb_to_slaves(i).ipb_addr <= ipb_in.ipb_addr;
		ipb_to_slaves(i).ipb_wdata <= ipb_in.ipb_wdata;
		ipb_to_slaves(i).ipb_strobe <= qstrobe when sel=i else '0';
		ipb_to_slaves(i).ipb_write <= ipb_in.ipb_write;
		ored_ack(i) <= ored_ack(i+1) or ipb_from_slaves(i).ipb_ack;
		ored_err(i) <= ored_err(i+1) or ipb_from_slaves(i).ipb_err;		

	end generate;

  ipb_out.ipb_rdata <= ipb_from_slaves(sel).ipb_rdata when sel /= 99 else (others => '0');
  ipb_out.ipb_ack <= ored_ack(0);
  ipb_out.ipb_err <= ored_err(0);
  
end rtl;

