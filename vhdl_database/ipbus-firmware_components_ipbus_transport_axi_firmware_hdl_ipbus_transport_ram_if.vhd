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
--
-- CPU-FPGA interface 
-- * Separated into N pages; 1 IPbus packet per page (same format as with IPbus 2.0 over UDP/TCP); i.e. N = maximum number of packets in flight
-- * *FPGA-to-CPU* (in 32-bit words)
--   * Word 0: N
--   * Word 1: M = number of 32-bit words per page
--   * Word 2: Index of next request (CPU-to-FPGA) page to fill
--   * Word 3: Number of reply pages that have been filled
--   * For `i` in `0` to `N-1`:
--     * Word `4 + M * i` : Start of page `i` ; `0x00010000` + number of words in IPbus reply packet excluding packet header
--     * Words `5 + M * i` to `5 + M * i + packet size`: IPbus reply packet
-- * *CPU-to-FPGA* (in 32-bit words)
--   * For `i` in `0` to `N-1`:
--     * Word `M * i` : Start of page `i`; `0x00010000` + number of words in IPbus request packet excluding packet header
--     * Word `M * i + 1` to `M * i + 1 + packet size` : IPbus request packet
--
-- Tom Williams, June 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ipbus_trans_decl.all;


entity ipbus_transport_ram_if is
  generic (
    -- Number of address bits to select RX or TX buffer
    -- Number of RX and TX buffers is 2 ** INTERNALWIDTH
    BUFWIDTH: natural;

    -- Number of address bits within each buffer
    -- Size of each buffer is 2**ADDRWIDTH
    ADDRWIDTH: natural
  );
  port (
    ram_clk: in std_logic;
    ipb_clk: in std_logic;
    rst_ipb: in std_logic;

    wr_addr : in std_logic_vector(BUFWIDTH + ADDRWIDTH - 2 downto 0);
    wr_data : in std_logic_vector(63 downto 0);
    wr_en   : in std_logic;

    rd_addr : in std_logic_vector(BUFWIDTH + ADDRWIDTH - 1 downto 0);
    rd_data : out std_logic_vector(63 downto 0);

    pkt_done : out std_logic;

    trans_out : in ipbus_trans_out;
    trans_in  : out ipbus_trans_in
  );

end ipbus_transport_ram_if;



architecture rtl of ipbus_transport_ram_if is

  signal wr_buf_idx : std_logic_vector(BUFWIDTH - 1 downto 0);
  signal num_filled_rd_buf : std_logic_vector(31 downto 0);

  signal wr_en_i , wr_end_pkt : std_logic;
  signal wr_addr_end_pkt : std_logic_vector(BUFWIDTH + ADDRWIDTH - 2 downto 0);
  signal wr_addr_end_pkt_i : std_logic_vector(BUFWIDTH + ADDRWIDTH - 1 downto 0);

  signal rd_data_ctrl, rd_data_stat : std_logic_vector(63 downto 0);
  signal rd_addr_ram_ctrl : std_logic_vector(BUFWIDTH + ADDRWIDTH - 1 downto 0);

  signal rst_ramclk, pkt_done_i : std_logic;

begin

  -------------------------------------------------------------------
  --  MAIN FUNCTIONALITY, incl CDC : Outsourced to multibuffer_if  --
  -------------------------------------------------------------------

  rd_addr_ram_ctrl <= std_logic_vector(unsigned(rd_addr) - 2);
  pkt_done <= pkt_done_i;

  multibuffer_if : entity work.ipbus_transport_multibuffer_if 
    generic map (
      BUFWIDTH => BUFWIDTH,
      ADDRWIDTH => ADDRWIDTH
    )
    port map (
      ram_clk => ram_clk,
      ipb_clk => ipb_clk,
      rst_ipb => rst_ipb,
      rst_ramclk => rst_ramclk,

      wr_buf_idx => wr_buf_idx,
      wr_addr => wr_addr(ADDRWIDTH - 2 downto 0),
      wr_data => wr_data,
      wr_en => wr_en_i,
      wr_done => wr_end_pkt,

      rd_idx => rd_addr_ram_ctrl(BUFWIDTH + ADDRWIDTH - 2 downto ADDRWIDTH - 1),
      rd_addr => rd_addr_ram_ctrl(ADDRWIDTH - 2 downto 0),
      rd_data => rd_data_ctrl,

      pkt_done => pkt_done_i,

      trans_out => trans_out,
      trans_in => trans_in
    );

  ---------------------------------------------------------------------------------
  --  WRITE PORTS : Spy on values to determine when last word of packets written --
  ---------------------------------------------------------------------------------

  wr_en_i <= wr_en when (wr_addr(BUFWIDTH + ADDRWIDTH - 2 downto ADDRWIDTH - 1) = wr_buf_idx) else '0';
  wr_addr_end_pkt_i <= wr_buf_idx & std_logic_vector(resize(unsigned(wr_data(15 downto 0)) + 1, ADDRWIDTH));

  wr_extract_pkt_size : process (ram_clk)
  begin
    if rising_edge(ram_clk) then
      if (rst_ramclk = '1') then
        wr_addr_end_pkt <= (Others => '1');
      elsif (wr_addr = (wr_buf_idx & (ADDRWIDTH - 2 downto 0 => '0'))) and (wr_en = '1') then
        wr_addr_end_pkt <= wr_addr_end_pkt_i(BUFWIDTH + ADDRWIDTH - 1 downto 1);
      end if;
    end if;
  end process;

  wr_end_pkt <= '1' when (wr_addr = wr_addr_end_pkt) and (wr_en_i = '1') else '0';

  -----------------------------------------------------------
  --  READ SIDE : Multiplex control packets & status info  --
  -----------------------------------------------------------
  
  rd_data <= rd_data_stat when (unsigned(rd_addr) < 2) else rd_data_ctrl;

  process (ram_clk)
  begin
    if rising_edge(ram_clk) then
      if (rst_ramclk = '1') then
        num_filled_rd_buf <= (Others => '0');
      elsif (pkt_done_i = '1') then
        num_filled_rd_buf <= std_logic_vector(unsigned(num_filled_rd_buf) + 1);
      end if;
    end if;
  end process;

  process (ram_clk)
  begin
    if rising_edge(ram_clk) then
      case rd_addr(0 downto 0) is
        when "0" =>
          rd_data_stat <= std_logic_vector(to_unsigned(2**ADDRWIDTH, 32)) &  std_logic_vector(to_unsigned(2**BUFWIDTH, 32));
        when "1" =>
          rd_data_stat <= num_filled_rd_buf & (31 downto BUFWIDTH => '0') & wr_buf_idx;
        when others =>
          null;
      end case;
    end if;
  end process;


end rtl;
