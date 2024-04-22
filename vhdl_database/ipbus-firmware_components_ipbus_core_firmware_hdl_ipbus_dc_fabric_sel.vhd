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
-- This version designed to address the ipbus slaves daisy-chain style
-- rather than via a simple fanout.
--
-- This version selects the addressed slave depending on the state
-- of incoming control lines
--
-- Dave Newbold, July 2014

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.ALL;

entity ipbus_dc_fabric_sel is
  generic(
    SEL_WIDTH: positive := 5
   );
  port(
  	clk: in std_logic;
  	rst: in std_logic;
  	sel: in std_logic_vector(SEL_WIDTH - 1 downto 0);
    ipb_in: in ipb_wbus;
    ipb_out: out ipb_rbus;
    ipbdc_out: out ipbdc_bus;
    ipbdc_in: in ipbdc_bus
   );

end ipbus_dc_fabric_sel;

architecture rtl of ipbus_dc_fabric_sel is

	type state_type is (ST_IDLE, ST_SEL, ST_ADDR, ST_WDATA, ST_RDATA);
	signal state: state_type;
	signal sel_word: std_logic_vector(31 downto 0);
	signal ret: std_logic;

begin

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				state <= ST_IDLE;
			else		
				case state is
-- Starting state
				when ST_IDLE =>
					if ipb_in.ipb_strobe = '1' then
						state <= ST_SEL;
					end if;				
-- Send slave select word			
				when ST_SEL =>
					state <= ST_ADDR;
-- Send address word
				when ST_ADDR =>
					state <= ST_WDATA;
-- Send data
				when ST_WDATA =>
					state <= ST_RDATA;
-- Receive data
				when ST_RDATA =>
					if ret = '1' or ipb_in.ipb_strobe = '0' then
						state <= ST_IDLE;
					end if;

				end case;
			end if;
			
		end if;
	end process;

	sel_word(SEL_WIDTH - 1 downto 0) <= sel;
	sel_word(31 downto SEL_WIDTH) <= (others => '0');
	
	with state select ipbdc_out.phase <=
		"01" when ST_ADDR,
		"10" when ST_WDATA,
		"00" when others;
	
	with state select ipbdc_out.ad <=
		ipb_in.ipb_addr when ST_ADDR,
		ipb_in.ipb_wdata when ST_WDATA,
		sel_word when others;
		
	with state select ipbdc_out.flag <=
		ipb_in.ipb_write when ST_ADDR,
		'1' when ST_SEL,
		'0' when others;

	ret <= '1' when ipbdc_in.phase = "11" else '0';

	ipb_out.ipb_rdata <= ipbdc_in.ad;
	ipb_out.ipb_ack <= ret and ipbdc_in.flag;
	ipb_out.ipb_err <= ret and not ipbdc_in.flag;	
  
end rtl;
