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


-- ipbus_dc_node
--
-- Bridge from daisy-chain style ipbus implementation to ipbus slave
--
-- Dave Newbold, July 2014

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.ALL;

entity ipbus_dc_node is
  generic(
  	I_SLV: integer;
  	SEL_WIDTH: integer := 5;
  	PIPELINE: boolean := true
   );
  port(
  	clk: in std_logic;
  	rst: in std_logic;
    ipb_out: out ipb_wbus;
    ipb_in: in ipb_rbus;
    ipbdc_in: in ipbdc_bus;
    ipbdc_out: out ipbdc_bus
   );

end ipbus_dc_node;

architecture rtl of ipbus_dc_node is

	signal resp, sel, cyc, stb: std_logic;
	signal ipbout, ipbout_d: ipbdc_bus;
	
begin

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				sel <= '0';
			elsif ipbdc_in.phase = "00" and ipbdc_in.flag = '1' then
				if ipbdc_in.ad(SEL_WIDTH - 1 downto 0) = std_logic_vector(to_unsigned(I_SLV, SEL_WIDTH)) then
					sel <= '1';
				else
					sel <= '0';
				end if;
			elsif ipbdc_in.phase = "01" then
				ipb_out.ipb_addr <= ipbdc_in.ad;
				ipb_out.ipb_write <= ipbdc_in.flag;
			elsif ipbdc_in.phase = "10" then
				ipb_out.ipb_wdata <= ipbdc_in.ad;
			end if;
		end if;
	end process;

	resp <= ipb_in.ipb_ack or ipb_in.ipb_err;
	cyc <= '1' when ipbdc_in.phase = "10" else '0';
	
	process(clk)
	begin
		if rising_edge(clk) then
			stb <= (stb or cyc) and not (resp or not sel);
		end if;
	end process;
	
	ipb_out.ipb_strobe <= stb;

	ipbout.phase <= "11" when resp = '1' and sel = '1' else ipbdc_in.phase;
	ipbout.ad <= ipb_in.ipb_rdata when resp = '1' and sel = '1' else ipbdc_in.ad;
	ipbout.flag <= ipb_in.ipb_ack when resp = '1' and sel = '1' else ipbdc_in.flag;
		
	process(clk)
	begin
		if rising_edge(clk) then
			ipbout_d <= ipbout;
		end if;
	end process;

	ipbdc_out <= ipbout_d when PIPELINE else ipbout;
  
end rtl;
