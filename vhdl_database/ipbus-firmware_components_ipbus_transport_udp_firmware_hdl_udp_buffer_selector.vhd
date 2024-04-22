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

ENTITY udp_buffer_selector IS
  generic(
    BUFWIDTH: natural := 0
  );
  port (
    mac_clk: in std_logic;
    rst_macclk: in std_logic;
--
    written: in std_logic;
    we: in std_logic;
--
    sent: in std_logic;
--
    req_resend: in std_logic;
    resend_buf: in std_logic_vector(BUFWIDTH - 1 downto 0);
--
    busy: out std_logic;
    write_buf: out std_logic_vector(BUFWIDTH - 1 downto 0);
--
    req_send: out std_logic;
    send_buf: out std_logic_vector(BUFWIDTH - 1 downto 0);
    clean_buf: out std_logic_vector(2**BUFWIDTH - 1 downto 0)
  );
end udp_buffer_selector;

architecture simple of udp_buffer_selector is

  signal free, clean, send_pending: std_logic_vector(2**BUFWIDTH - 1 downto 0);
  signal send_sig, write_sig: unsigned(BUFWIDTH - 1 downto 0);
  signal sending, busy_sig: std_logic;
  signal rst_macclk_sig: std_logic;

begin

  write_buf <= std_logic_vector(write_sig);
  send_buf <= std_logic_vector(send_sig);
  busy <= busy_sig;
  clean_buf <= clean;

-- register reset...
	rst_macclk_block: process(mac_clk)
	begin
		if rising_edge(mac_clk) then
			rst_macclk_sig <= rst_macclk
-- pragma translate_off
			after 4 ns
-- pragma translate_on
			;
		end if;
	end process;

free_block: process (mac_clk)
  variable free_i: std_logic_vector(2**BUFWIDTH - 1 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	free_i := (Others => '1');
      else
	if written = '1' then
	  free_i(to_integer(write_sig)) := '0';
	end if;
	if req_resend = '1' and clean(to_integer(unsigned(resend_buf))) = '1' then
	  free_i(to_integer(unsigned(resend_buf))) := '0';
	end if;
        if sent = '1' then
	  free_i(to_integer(send_sig)) := '1';
	end if;
      end if;
      free <= free_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

clean_block: process (mac_clk)
  variable clean_i: std_logic_vector(2**BUFWIDTH - 1 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	clean_i := (Others => '0');
      else
        if written = '1' then
	  clean_i(to_integer(write_sig)) := '1';
	elsif we = '1' then
	  clean_i(to_integer(write_sig)) := '0';
	end if;
      end if;
      clean <= clean_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

send_pending_block: process (mac_clk)
  variable send_pending_i: std_logic_vector(2**BUFWIDTH - 1 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	send_pending_i := (Others => '0');
      else
        if written = '1' then
	  send_pending_i(to_integer(write_sig)) := '1';
	end if;
	if req_resend = '1' and clean(to_integer(unsigned(resend_buf))) = '1' then
	  send_pending_i(to_integer(unsigned(resend_buf))) := '1';
	end if;
        if sent = '1' then
	  send_pending_i(to_integer(send_sig)) := '0';
	end if;
      end if;
      send_pending <= send_pending_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

busy_block: process (mac_clk)
  variable busy_i: std_logic;
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	busy_i := '1';
      else
	if busy_i = '1' and free(to_integer(write_sig)) = '1' then
	  busy_i := '0';
	elsif written = '1' then
	  busy_i := '1';
	end if;
      end if;
      busy_sig <= busy_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

req_send_block: process (mac_clk)
  variable req_send_i, sending_i: std_logic;
  begin
    if rising_edge(mac_clk) then
      req_send_i := '0';
      if rst_macclk_sig = '1' then
	sending_i := '0';
      else
	if sending = '0' and send_pending(to_integer(send_sig)) = '1' then
	  sending_i := '1';
	  req_send_i := '1';
	elsif sent = '1' then
	  sending_i := '0';
	end if;
      end if;
      req_send <= req_send_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
      sending <= sending_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

write_block: process (mac_clk)
  variable write_i: unsigned(BUFWIDTH - 1 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	write_i := (Others => '0');
      else
	if busy_sig = '1' and free(to_integer(write_sig)) = '0' then
	  if write_sig = 2**BUFWIDTH - 1 then
	    write_i := (Others => '0');
	  else
	    write_i := write_sig + 1;
	  end if;
	end if;
      end if;
      write_sig <= write_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

send_block: process (mac_clk)
  variable send_i: unsigned(BUFWIDTH - 1 downto 0);
  begin
    if rising_edge(mac_clk) then
      if rst_macclk_sig = '1' then
	send_i := (Others => '0');
      else
	if sending = '0' and send_pending(to_integer(send_sig)) = '0' then
	  if send_sig = 2**BUFWIDTH - 1 then
	    send_i := (Others => '0');
	  else
	    send_i := send_sig + 1;
	  end if;
	end if;
      end if;
      send_sig <= send_i
-- pragma translate_off
      after 4 ns
-- pragma translate_on
      ;
    end if;
  end process;

end simple;
