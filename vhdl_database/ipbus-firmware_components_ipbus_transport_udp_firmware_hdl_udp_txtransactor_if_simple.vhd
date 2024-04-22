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


-- Simple interface to tx side of transactor...
-- Even simpler, but now multi-buffer RAM!
--
-- Dave Sankey, September 2012

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_txtransactor_if is
  generic(
    BUFWIDTH: natural := 0
  );
  port (
    mac_clk: in std_logic;
    rst_macclk: in std_logic;
--
    pkt_resend: in std_logic;
    resend_pkt_id: in std_logic_vector(15 downto 0);
--
    ipbus_out_hdr: in std_logic_vector(31 downto 0);
    ipbus_out_valid: in std_logic;
    tx_read_buffer: in std_logic_vector(BUFWIDTH - 1 downto 0);
--
    udpram_busy: in std_logic;
    clean_buf: in std_logic_vector(2**BUFWIDTH - 1 downto 0);
--
    req_not_found: out std_logic;
    req_resend: out std_logic;
    resend_buf: out std_logic_vector(BUFWIDTH - 1 downto 0);
    udpram_sent: out std_logic
  );
end udp_txtransactor_if;

architecture simple of udp_txtransactor_if is

  type pktid_buf is array (2**BUFWIDTH - 1 downto 0) of std_logic_vector(15 downto 0);
  signal pkt_id_buf: pktid_buf;

begin

pkt_id_block: process (mac_clk)
  begin
    if rising_edge(mac_clk) then
      if rst_macclk = '1' then
	pkt_id_buf <= (Others => (Others => '0'));
      elsif ipbus_out_valid = '1' then
-- Take byte ordering into account and make packet ID big endian...
        if ipbus_out_hdr(31 downto 24) = x"20" then
	  pkt_id_buf(to_integer(unsigned(tx_read_buffer))) <= ipbus_out_hdr(23 downto 8);
	else
	  pkt_id_buf(to_integer(unsigned(tx_read_buffer))) <= 
	  ipbus_out_hdr(15 downto 8) & ipbus_out_hdr(23 downto 16);
	end if;
      end if;
    end if;
  end process;

resend_block: process (mac_clk)
  variable req_resend_i, req_not_found_i: std_logic;
  variable resend_buf_i: std_logic_vector(BUFWIDTH - 1 downto 0);
  begin
    if rising_edge(mac_clk) then
      req_resend_i := '0';
      req_not_found_i := '0';
      resend_buf_i := (Others => '0');
      if pkt_resend = '1' then
        for i in 0 to 2**BUFWIDTH - 1 loop
          if pkt_id_buf(i) = resend_pkt_id and clean_buf(i) = '1' then
	    req_resend_i := '1';
	    resend_buf_i := std_logic_vector(to_unsigned(i, BUFWIDTH));
	  end if;
        end loop;
	req_not_found_i := not req_resend_i;
      end if;
      req_not_found <= req_not_found_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      req_resend <= req_resend_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      resend_buf <= resend_buf_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

sent_block: process (mac_clk)
  variable last_busy: std_logic;
  begin
    if rising_edge(mac_clk) then
      udpram_sent <= last_busy and not udpram_busy
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      last_busy := udpram_busy;
    end if;
  end process;

end simple;