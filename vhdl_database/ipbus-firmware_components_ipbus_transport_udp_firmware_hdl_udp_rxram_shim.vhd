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


--  Dave Sankey May 2013

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY udp_rxram_shim IS
  generic(
    BUFWIDTH: natural := 0
  );
  port (
    mac_clk: in std_logic;
    rst_macclk: in std_logic;
--
    rxram_end_addr: in std_logic_vector(12 downto 0);
    rxram_send: in std_logic;
    rxram_write_buf: in std_logic_vector(BUFWIDTH - 1 downto 0);
--
    rxram_req_send: in std_logic;
    rxram_send_buf: in std_logic_vector(BUFWIDTH - 1 downto 0);
--
    rxram_busy: in std_logic;
--
    rxram_end_addr_x: out std_logic_vector(12 downto 0);
    rxram_send_x: out std_logic;
    rxram_sent: out std_logic
  );
end udp_rxram_shim;

architecture simple of udp_rxram_shim is

  type address_buf is array (2**BUFWIDTH - 1 downto 0) of std_logic_vector(12 downto 0);
  signal end_address_buf: address_buf;
  signal last_busy: std_logic;

begin

input_block: process (mac_clk)
  begin
    if rising_edge(mac_clk) then
      if rst_macclk = '1' then
	end_address_buf <= (Others => (Others => '0'));
      elsif rxram_send = '1' then
	end_address_buf(to_integer(unsigned(rxram_write_buf))) <= rxram_end_addr;
      end if;
    end if;
  end process;

output_block: process (mac_clk)
  begin
    if rising_edge(mac_clk) then
      if rxram_req_send = '1' then
        rxram_send_x <= '1'
-- pragma translate_off
        after 4 ns
-- pragma translate_on
        ;
	rxram_end_addr_x <= end_address_buf(to_integer(unsigned(rxram_send_buf)))
-- pragma translate_off
        after 4 ns
-- pragma translate_on
        ;
      else
        rxram_send_x <= '0'
-- pragma translate_off
        after 4 ns
-- pragma translate_on
        ;
	rxram_end_addr_x <= (Others => '0')
-- pragma translate_off
        after 4 ns
-- pragma translate_on
        ;
      end if;
    end if;
  end process;

busy_block: process (mac_clk)
  begin
    if rising_edge(mac_clk) then
      if (rxram_busy = '0') and (last_busy = '1') then
        rxram_sent <= '1'
-- pragma translate_off
        after 4 ns
-- pragma translate_on
        ;
      else
        rxram_sent <= '0'
-- pragma translate_off
        after 4 ns
-- pragma translate_on
        ;
      end if;
      last_busy <= rxram_busy
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

end simple;
