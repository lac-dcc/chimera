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


-- ipbus_arb
--
-- Arbitrator for multiple ipbus masters
--
-- Dave Newbold, April 2013

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ipbus.all;

entity ipbus_arb is 
	generic(
		N_BUS: positive := 2
	);
  port(
  	clk: in std_logic;
  	rst: in std_logic;
  	ipb_m_out: in ipb_wbus_array(N_BUS - 1 downto 0);
  	ipb_m_in: out ipb_rbus_array(N_BUS - 1 downto 0);
  	ipb_req: in std_logic_vector(N_BUS - 1 downto 0);
  	ipb_grant: out std_logic_vector(N_BUS - 1 downto 0);
		ipb_out: out ipb_wbus;
		ipb_in: in ipb_rbus
	);

end ipbus_arb;

architecture rtl of ipbus_arb is

 	signal src: unsigned(1 downto 0); -- Up to four ports...
	signal sel: integer range 0 to N_BUS - 1;
	signal busy: std_logic;

begin

	sel <= to_integer(src);

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				busy <= '0';
				src <= (others => '0');
			elsif busy = '0' then
				if ipb_req(sel) = '0' then
					if src /= (N_BUS - 1) then
						src <= src + 1;
					else
						src <= (others=>'0');
					end if;
				else
					busy <= '1';
				end if;
			elsif ipb_req(sel) = '0' then
				busy <= '0';
			end if;
		end if;
	end process;

	busgen: for i in N_BUS - 1 downto 0 generate
	begin
		ipb_grant(i) <= '1' when sel = i and busy = '1' else '0';
		ipb_m_in(i) <= ipb_in;
	end generate;
	
	ipb_out <= ipb_m_out(sel);

end rtl;

