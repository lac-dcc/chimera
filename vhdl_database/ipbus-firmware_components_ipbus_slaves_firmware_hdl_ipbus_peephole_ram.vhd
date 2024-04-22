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


-- Generic 'peephole' RAM
--
-- generic addr_width defines number of significant address bits
--
-- This design implements a RAM block, with correct behaviour to allow
-- inference of a Xilinx block RAM. Block RAM cannot normally be used 
-- without bus wait states. This design overcomes this. It uses two
-- ipbus addresses:
--
-- loc 0: pointer register
-- loc 1: data register
--
-- Upon read or write, the pointer register is automatically incremented.
-- When used with non-incrementing read or write ipbus transactions, this allows
-- full bus utilisation for block transfers with no wait states. Real designs
-- will probably want to replace the inferred block RAM with an instantiated
-- DPRAM, and use the other port for some purpose.
--
-- Dave Newbold, April 2011
--
-- $Id: ipbus_peephole_ram.vhd 1202 2012-09-28 08:53:07Z phdmn $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;

entity ipbus_peephole_ram is
	generic(
		ADDR_WIDTH: positive
	);
	port(
		clk: in std_logic;
		reset: in std_logic;
		ipbus_in: in ipb_wbus;
		ipbus_out: out ipb_rbus
	);
	
end ipbus_peephole_ram;

architecture rtl of ipbus_peephole_ram is

	type reg_array is array(2 ** ADDR_WIDTH - 1 downto 0) of std_logic_vector(31 downto 0);
	signal reg: reg_array := (others => (others => '0'));
	signal sel: integer range 0 to 2 ** ADDR_WIDTH - 1 := 0;
	signal ptr: unsigned(ADDR_WIDTH - 1 downto 0);
	signal data: std_logic_vector(31 downto 0);
	
begin

	sel <= to_integer(ptr);

	process(clk)
	begin
		if rising_edge(clk) then
			if reset='1' then
				ptr <= (others=>'0');
			elsif ipbus_in.ipb_strobe='1' then
				if ipbus_in.ipb_addr(0)='0' and ipbus_in.ipb_write='1' then
					ptr <= unsigned(ipbus_in.ipb_wdata(ADDR_WIDTH - 1 downto 0));
				elsif ipbus_in.ipb_addr(0)='1' then
					if ipbus_in.ipb_write='1' then
						reg(sel) <= ipbus_in.ipb_wdata;
					end if;
					ptr <= ptr + 1;
				end if;
			end if;

			data <= reg(sel);
						
		end if;
	end process;
	
	ipbus_out.ipb_ack <= ipbus_in.ipb_strobe;
	ipbus_out.ipb_err <= '0';
	ipbus_out.ipb_rdata <= std_logic_vector(to_unsigned(0, 32 - ADDR_WIDTH)) & std_logic_vector(ptr)
		when ipbus_in.ipb_addr(0)='0' else data;

end rtl;
