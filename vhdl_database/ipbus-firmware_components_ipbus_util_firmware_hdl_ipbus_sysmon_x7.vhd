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


-- ipbus_sysmon_x7
--
-- Interface to the 7-series system monitor (which is technically called XADC)
--
-- Jeroen Hegeman, December 2019

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.VComponents.all;

use work.ipbus.all;
use work.drp_decl.all;

entity ipbus_sysmon_x7 is
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus
	);

end ipbus_sysmon_x7;

architecture rtl of ipbus_sysmon_x7 is
	
	signal drp_m2s: drp_wbus;
	signal drp_s2m: drp_rbus;

begin
	
	drp: entity work.ipbus_drp_bridge
		port map(
			clk => clk,
			rst => rst,
			ipb_in => ipb_in,
			ipb_out => ipb_out,
			drp_out => drp_m2s,
			drp_in => drp_s2m
		);
	
	sysm: XADC
		port map(
			convst => '0',
			convstclk => '0',
			daddr => drp_m2s.addr(6 downto 0),
			dclk => clk,
			den => drp_m2s.en,
			di => drp_m2s.data,
			do => drp_s2m.data,
			drdy => drp_s2m.rdy,
			dwe => drp_m2s.we,
			reset => rst,
			vauxp => X"0000",
			vauxn => X"0000",
			vn => '0',
			vp => '0'
		);
	
end rtl;
