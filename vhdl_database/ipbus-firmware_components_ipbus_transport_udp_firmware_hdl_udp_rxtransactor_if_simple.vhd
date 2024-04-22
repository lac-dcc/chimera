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


-- Interface to rx side of transactor...
-- Even simpler, but now multi-buffer RAM!
--
-- Dave Sankey, September 2012

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_rxtransactor_if is
  port (
    mac_clk: in std_logic;
    rx_reset: in std_logic;
    payload_send: in std_logic;
    payload_we: in std_logic;
    rx_ram_busy: in std_logic;
    pkt_rcvd: out std_logic;
    rx_wea : out std_logic;
    rxpayload_dropped: out std_logic
  );
end udp_rxtransactor_if;

architecture simple of udp_rxtransactor_if is

  signal ram_ok : std_logic;

begin

  rx_wea <= payload_we and ram_ok;

ram_status: process (mac_clk)
  variable pkt_rcvd_i, ram_ok_i, rxpayload_dropped_i: std_logic;
  begin
    if rising_edge(mac_clk) then
      rxpayload_dropped_i := '0';
      pkt_rcvd_i := '0';
      if rx_reset = '1' then
        ram_ok_i := '1';
      else
-- catch next packet arriving before we've disposed of this one...
        if payload_we = '1' and rx_ram_busy = '1' then
          ram_ok_i := '0';
        end if;
        if payload_send = '1' then
          if ram_ok_i = '1' then
            pkt_rcvd_i := '1';
	  else
            rxpayload_dropped_i := '1';
	  end if;
	  ram_ok_i := '1';
        end if;
      end if;
      ram_ok <= ram_ok_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      pkt_rcvd <= pkt_rcvd_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      rxpayload_dropped <= rxpayload_dropped_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

end simple;
