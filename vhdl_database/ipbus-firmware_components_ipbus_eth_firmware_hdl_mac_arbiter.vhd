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


-- mac_arbiter
--
-- Arbitrates access by several packet sources to a single MAC core
-- This version implements simple round-robin polling.
--
-- Dave Newbold, March 2011
--
-- $Id: mac_arbiter.vhd 350 2011-04-28 17:52:45Z phdmn $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.mac_arbiter_decl.all;

entity mac_arbiter is
	generic(NSRC: positive);
	port(
		clk: in std_logic;
		rst: in std_logic;
		src_tx_data_bus: in mac_arbiter_slv_array(NSRC-1 downto 0);
		src_tx_valid_bus: in mac_arbiter_sl_array(NSRC-1 downto 0);
		src_tx_last_bus: in mac_arbiter_sl_array(NSRC-1 downto 0);
		src_tx_error_bus: in mac_arbiter_sl_array(NSRC-1 downto 0);
		src_tx_ready_bus: out mac_arbiter_sl_array(NSRC-1 downto 0);
		mac_tx_data: out std_logic_vector(7 downto 0);
		mac_tx_valid: out std_logic;
		mac_tx_last: out std_logic;
		mac_tx_error: out std_logic;
		mac_tx_ready: in std_logic
	);
	
end mac_arbiter;

architecture rtl of mac_arbiter is

	signal src: unsigned(3 downto 0); -- Up to sixteen ports...
	signal sel: integer range 0 to NSRC - 1 := 0;
	signal busy: std_logic;

begin

	sel <= to_integer(src);

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				busy <= '0';
				src <= "0000";
			elsif busy = '0' then
				if src_tx_valid_bus(sel) = '0' then
					if src /= (NSRC-1) then
						src <= src + 1;
					else
						src <= (others => '0');
					end if;
				else
					busy <= '1';
				end if;
			elsif src_tx_last_bus(sel) = '1' and mac_tx_ready = '1' then
				busy <= '0';
			end if;
		end if;
	end process;

	mac_tx_valid <= src_tx_valid_bus(sel);
	mac_tx_last <= src_tx_last_bus(sel);
	mac_tx_error <= src_tx_error_bus(sel);
	mac_tx_data <= src_tx_data_bus(sel);

	ackgen: for i in NSRC - 1 downto 0 generate
	begin
		src_tx_ready_bus(i) <= mac_tx_ready when sel = i else '0';
	end generate;

end rtl;

