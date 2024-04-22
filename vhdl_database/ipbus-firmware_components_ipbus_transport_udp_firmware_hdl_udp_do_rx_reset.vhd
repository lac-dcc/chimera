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


-- Generates reset for Ethernet RX logic
--
-- Dave Sankey, July 2012

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_do_rx_reset is
  port (
    mac_clk: in std_logic;
    rst_macclk: in std_logic;
    my_rx_last: in std_logic;
    my_rx_valid: in std_logic;
    rxpacket_ignored_sig: in std_logic;
    rx_reset: out std_logic
  );
end udp_do_rx_reset;

architecture rtl of udp_do_rx_reset is

  signal rx_reset_sig: std_logic;

begin

rx_reset <= rx_reset_sig and not my_rx_valid;

rx_reset_buf:  process (mac_clk)
  variable reset_buf: std_logic_vector(11 downto 0);
  variable reset_latch: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rst_macclk = '1' or rxpacket_ignored_sig = '1' then
-- Immediate reset
        reset_buf := x"800";
      else
-- delayed reset...
        reset_buf := reset_buf(10 downto 0) & my_rx_last;
      end if;
      if reset_buf(11) = '1' then
        reset_latch := '1';
      elsif my_rx_valid = '1' then
        reset_latch := '0';
      end if;
      rx_reset_sig <= reset_latch
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process rx_reset_buf;

end architecture rtl;
