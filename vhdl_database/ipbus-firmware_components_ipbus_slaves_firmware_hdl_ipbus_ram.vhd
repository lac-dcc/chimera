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


-- Generic ipbus ram block for testing
--
-- generic addr_width defines number of significant address bits
--
-- In order to allow Xilinx block RAM to be inferred:
-- 	Reset does not clear the RAM contents (not implementable in Xilinx)
--		There is one cycle of latency on the read / write
--
-- Note that the synthesis tool should automatically infer block or distributed RAM
-- according to the size requested. It is likely that it will NOT choose
-- an efficient implementation in terms of area / speed / power, so don't use this
-- method to infer large RAMs (noting also that reads are enabled at all times).
-- It's best to use the block ram core generator explicitly.
--
-- Occupies addr_width bits of ipbus address space
-- This RAM cannot be used with 100% bus utilisation due to the wait state
--
-- Dave Newbold, March 2011
--
-- $Id: ipbus_ram.vhd 1201 2012-09-28 08:49:12Z phdmn $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;

entity ipbus_ram is
	generic(
		ADDR_WIDTH: positive
	);
	port(
		clk: in std_logic;
		reset: in std_logic;
		ipbus_in: in ipb_wbus;
		ipbus_out: out ipb_rbus
	);
	
end ipbus_ram;

architecture rtl of ipbus_ram is

	type reg_array is array(2 ** ADDR_WIDTH - 1 downto 0) of std_logic_vector(31 downto 0);
	signal reg: reg_array := (others => (others => '0'));
	signal sel: integer range 0 to 2 ** ADDR_WIDTH - 1 := 0;
	signal ack: std_logic;

begin

	sel <= to_integer(unsigned(ipbus_in.ipb_addr(ADDR_WIDTH - 1 downto 0)));

	process(clk)
	begin
		if rising_edge(clk) then
			if ipbus_in.ipb_strobe='1' and ipbus_in.ipb_write='1' then
				reg(sel) <= ipbus_in.ipb_wdata;
			end if;
			
			ipbus_out.ipb_rdata <= reg(sel);
			ack <= ipbus_in.ipb_strobe and not ack;
			
		end if;
	end process;
	
	ipbus_out.ipb_ack <= ack;
	ipbus_out.ipb_err <= '0';

end rtl;
