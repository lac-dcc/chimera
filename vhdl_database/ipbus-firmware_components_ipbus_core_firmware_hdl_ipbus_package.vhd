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

package ipbus is

-- The signals going from master to slaves - parallel bus
	type ipb_wbus is
		record
			ipb_addr: std_logic_vector(31 downto 0);
			ipb_wdata: std_logic_vector(31 downto 0);
			ipb_strobe: std_logic;
			ipb_write: std_logic;
		end record;

	type ipb_wbus_array is array(natural range <>) of ipb_wbus;

-- The signals going from slaves to master - parallel bus
	type ipb_rbus is
    record
			ipb_rdata: std_logic_vector(31 downto 0);
			ipb_ack: std_logic;
			ipb_err: std_logic;
    end record;

	type ipb_rbus_array is array(natural range <>) of ipb_rbus;
	
	constant IPB_RBUS_NULL: ipb_rbus := ((others => '0'), '0', '0');
	constant IPB_WBUS_NULL: ipb_wbus := ((others => '0'), (others => '0'), '0', '0');

-- Daisy-chain bus
--
-- Phase = 00: select phase (ipb_ad(4:0) is slave number, ipb_flag asserted to select new slave)
-- Phase = 01: address phase (ipb_ad is address, ipb_flag is write)
-- Phase = 10: wdata phase (ipb_ad is wdata)
-- Phase = 11: rdata phase (ipb_ad is rdata, ipb_flag is ack/nerr)

	constant IPBDC_SEL_WIDTH: integer := 5;
	
	type ipbdc_bus is
		record
			phase: std_logic_vector(1 downto 0);
			ad: std_logic_vector(31 downto 0);
			flag: std_logic;
		end record;
		
	type ipbdc_bus_array is array(natural range <>) of ipbdc_bus;
 
	constant IPBDC_BUS_NULL: ipbdc_bus := ("00", (others => '0'), '0');

-- For top-level generics
	
	type ipb_mac_cfg is (EXTERNAL, INTERNAL);
	type ipb_ip_cfg is (EXTERNAL, INTERNAL);

end ipbus;
