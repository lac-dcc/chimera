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


-- Signals crossing clock domain...
--
-- Dave Sankey, January 2013

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity udp_clock_crossing_if is
  generic(
    BUFWIDTH: natural := 0
  );
  port (
    mac_clk: in std_logic;
    rst_macclk: in std_logic;
--
    busy_125: in std_logic;
    rx_read_buffer_125: in std_logic_vector(BUFWIDTH - 1 downto 0);
    rx_req_send_125: in std_logic;
    tx_write_buffer_125: in std_logic_vector(BUFWIDTH - 1 downto 0);
    enable_125: out std_logic;
    ipam_125: out std_logic;
    rst_ipb_125: out std_logic;
    rx_ram_sent: out std_logic;
    tx_ram_written: out std_logic;
    we_125: out std_logic;
--
    ipb_clk: in std_logic; 
    rst_ipb: in std_logic;
--
    enable: in std_logic;
    pkt_done_read: in std_logic;
    pkt_done_write: in std_logic;
    ipam: in std_logic;
    we: in std_logic;
    busy: out std_logic;
    pkt_rdy: out std_logic;
    rx_read_buffer: out std_logic_vector(BUFWIDTH - 1 downto 0);
    tx_write_buffer: out std_logic_vector(BUFWIDTH - 1 downto 0)
  );
end udp_clock_crossing_if;

architecture rtl of udp_clock_crossing_if is

  signal req_send_tff, busy_buf, busy_up_tff, busy_down_tff: std_logic;
  signal enable_buf, ipam_buf, we_buf, rst_ipb_buf: std_logic_vector(1 downto 0);
  signal req_send_buf, pkt_done_read_buf, pkt_done_write_buf, busy_up_buf,
  busy_down_buf, pkt_done_r_tff, pkt_done_w_tff: std_logic_vector(2 downto 0);
  signal rx_read_buf_buf, tx_write_buf_buf: std_logic_vector(BUFWIDTH - 1 downto 0);

  attribute ASYNC_REG: string;
  attribute ASYNC_REG of busy_down_buf: signal is "TRUE";
  attribute ASYNC_REG of busy_up_buf: signal is "TRUE";
  attribute ASYNC_REG of enable_buf: signal is "TRUE";
  attribute ASYNC_REG of pkt_done_read_buf: signal is "TRUE";
  attribute ASYNC_REG of pkt_done_write_buf: signal is "TRUE";
  attribute ASYNC_REG of ipam_buf: signal is "TRUE";
  attribute ASYNC_REG of req_send_buf: signal is "TRUE";
  attribute ASYNC_REG of rst_ipb_buf: signal is "TRUE";
  attribute ASYNC_REG of rx_read_buf_buf: signal is "TRUE";
  attribute ASYNC_REG of tx_write_buf_buf: signal is "TRUE";
  attribute ASYNC_REG of we_buf: signal is "TRUE";

begin

-- clock domain crossing logic based on
-- http://sc.morganisms.net/2010/06/rtl-for-passing-pulse-across-clock-domains-in-vhdl/
-- assumption is that ipbus clock is significantly slower than ethernet mac clock
-- so that transitions in ipbus clock domain are always caught in mac clock domain
-- whereas toggle flip flops are used to ensure the reciprocal
-- but just to be safe do the same for pkt_done...

  enable_125 <= enable_buf(1);
  ipam_125 <= ipam_buf(1);
  we_125 <= we_buf(1);
  rst_ipb_125 <= rst_ipb_buf(1);

pkt_done_ipb_clk: process(ipb_clk)
  begin
    if rising_edge(ipb_clk) then
      if rst_ipb = '1' then
        pkt_done_r_tff <= "000";
        pkt_done_w_tff <= "000";
      else
-- infer a (delayed) toggle flip flop in source domain
        pkt_done_r_tff <= pkt_done_r_tff(1 downto 0) & (pkt_done_r_tff(0) xor pkt_done_read);
        pkt_done_w_tff <= pkt_done_w_tff(1 downto 0) & (pkt_done_w_tff(0) xor pkt_done_write);
      end if;
    end if;
  end process;      

pkt_done_mac_clk: process(mac_clk)
  begin
    if rising_edge(mac_clk) then
-- rx_ram_sent and tx_ram_written only high for 1 tick...
      rx_ram_sent <= pkt_done_read_buf(2) xor pkt_done_read_buf(1);
      tx_ram_written <= pkt_done_write_buf(2) xor pkt_done_write_buf(1);
-- pick up delayed tff from ipbus domain
      pkt_done_read_buf <= pkt_done_read_buf(1 downto 0) & pkt_done_r_tff(2);
      pkt_done_write_buf <= pkt_done_write_buf(1 downto 0) & pkt_done_w_tff(2);
    end if;
  end process;      

req_send_mac_clk: process(mac_clk)
  begin
    if rising_edge(mac_clk) then
      if rst_macclk = '1' then
        req_send_tff <= '0';
      else
-- infer a toggle flip flop in source domain
        req_send_tff <= req_send_tff xor rx_req_send_125;
      end if;
    end if;
  end process;      

req_send_buf_ipb_clk: process(ipb_clk)
  begin
    if rising_edge(ipb_clk) then
      req_send_buf <= req_send_buf(1 downto 0) & req_send_tff;
    end if;
  end process;

pkt_rdy_ipb_clk: process(ipb_clk)
  variable pkt_rdy_buf: std_logic_vector(2 downto 0);
  begin
    if rising_edge(ipb_clk) then
      if rst_ipb = '1' then
        pkt_rdy_buf := (Others => '0');
      elsif pkt_done_read = '1' then
        pkt_rdy_buf := (Others => '0');
      elsif (req_send_buf(2) xor req_send_buf(1)) = '1' then
        pkt_rdy_buf := pkt_rdy_buf(1 downto 0) & '1';
      else
        pkt_rdy_buf := pkt_rdy_buf(1 downto 0) & pkt_rdy_buf(0);
      end if;
      pkt_rdy <= pkt_rdy_buf(2);
    end if;
  end process;

enable_mac_clk: process(mac_clk)
  begin
    if rising_edge(mac_clk) then
      enable_buf <= enable_buf(0) & enable;
    end if;
  end process;      

ipam_mac_clk: process(mac_clk)
  begin
    if rising_edge(mac_clk) then
      ipam_buf <= ipam_buf(0) & ipam;
    end if;
  end process;      

we_mac_clk: process(mac_clk)
  begin
    if rising_edge(mac_clk) then
      we_buf <= we_buf(0) & we;
    end if;
  end process;      

rst_ipb_mac_clk: process(mac_clk)
  begin
    if rising_edge(mac_clk) then
      rst_ipb_buf <= rst_ipb_buf(0) & rst_ipb;
    end if;
  end process;      

busy_mac_clk: process(mac_clk)
  begin
    if rising_edge(mac_clk) then
      if rst_macclk = '1' then
        busy_up_tff <= '0';
        busy_down_tff <= '0';
	busy_buf <= '0';
      else
-- infer toggle flip flops in source domain
        busy_up_tff <= busy_up_tff xor (busy_125 and not busy_buf);
        busy_down_tff <= busy_down_tff xor (busy_buf and not busy_125);
        busy_buf <= busy_125;
      end if;
    end if;
  end process;      
  
busy_up_down_ipb_clk: process(ipb_clk)
  begin
    if rising_edge(ipb_clk) then
      busy_up_buf <= busy_up_buf(1 downto 0) & busy_up_tff;
      busy_down_buf <= busy_down_buf(1 downto 0) & busy_down_tff;
    end if;
  end process;

busy_ipb_clk: process(ipb_clk)
  variable busy_buf: std_logic_vector(3 downto 0);
  begin
    if rising_edge(ipb_clk) then
      if rst_ipb = '1' then
        busy_buf := (Others => '0');
      elsif pkt_done_write = '1' then
        busy_buf := (Others => '1');
      elsif (busy_up_buf(2) xor busy_up_buf(1)) = '1' then
        busy_buf := (Others => '1');
      end if;
      busy <= busy_buf(3);
      if (busy_down_buf(2) xor busy_down_buf(1)) = '1' then
        busy_buf := busy_buf(2 downto 0) & '0';
      else
        busy_buf := busy_buf(2 downto 0) & busy_buf(0);
      end if;
    end if;
  end process;    

rx_read_buffer_ipb_clk: process(ipb_clk)
  begin
    if rising_edge(ipb_clk) then
      rx_read_buf_buf <= rx_read_buffer_125;
      rx_read_buffer <= rx_read_buf_buf;
    end if;
  end process;    

tx_write_buffer_ipb_clk: process(ipb_clk)
  begin
    if rising_edge(ipb_clk) then
      tx_write_buf_buf <= tx_write_buffer_125;
      tx_write_buffer <= tx_write_buf_buf;
    end if;
  end process;    

end rtl;
