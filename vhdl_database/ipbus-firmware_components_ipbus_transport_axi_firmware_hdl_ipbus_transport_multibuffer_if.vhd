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


-- Generic packet buffer interface to the IPbus transactor; instantiates BRAMs for
-- handling 2 ** BUFWIDTH request & reply packets, so that one can send up to
-- 2 ** BUFWIDTH request packets before having to wait for 1st request packet to
-- be processed.
--
-- All ports except for 'rst_ipb', 'trans_out' and 'trans_in' must be from the
-- 'ram_clk' clock domain
--
-- The 'wr_addr', 'wr_data' & 'wr_en' ports can be used to fill up a buffer with a
-- request packet. Once the request packet has been written, 'wr_done' should be
-- raised for *one* clock cycle; on the next clock cycle a different internal buffer
-- will be used for request packets. The 'wr_buf_idx' output port indicates the index
-- of the request buffer that is currently being used.
--
-- N.B. 'ram_clk' and 'ipb_clk' can be asynchrononous clocks, however if these clocks are
--     async then 'ram_clk' must have at least a factor of 5 higher frequency than 'ipb_clk'
--
-- Tom Williams, July 2018


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ipbus_trans_decl.all;


entity ipbus_transport_multibuffer_if is
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
    rst_ramclk : out std_logic;

    wr_buf_idx : out std_logic_vector(BUFWIDTH - 1 downto 0);
    wr_addr : in std_logic_vector(ADDRWIDTH - 2 downto 0);
    wr_data : in std_logic_vector(63 downto 0);
    wr_en   : in std_logic;
    wr_done : in std_logic;

    rd_idx  : in std_logic_vector(BUFWIDTH - 1 downto 0);
    rd_addr : in std_logic_vector(ADDRWIDTH - 2 downto 0);
    rd_data : out std_logic_vector(63 downto 0);

    pkt_done : out std_logic;

    trans_out : in ipbus_trans_out;
    trans_in  : out ipbus_trans_in
  );

end ipbus_transport_multibuffer_if;



architecture rtl of ipbus_transport_multibuffer_if is

  signal wr_buf_idx_i : unsigned(BUFWIDTH - 1 downto 0) := (Others => '0');
  signal buf_idx_transactor : unsigned(BUFWIDTH - 1 downto 0) := (Others => '0');

  signal idx_oldest_pending_rd_buf : unsigned(BUFWIDTH - 1 downto 0) := (Others => '0');

  signal wr_buf_filled_ramclk : std_logic_vector(2**BUFWIDTH - 1 downto 0) := (Others => '0');
  signal wr_buf_filled_ipbclk, wr_buf_filled_ipbclk_d : std_logic_vector(2**BUFWIDTH - 1 downto 0) := (Others => '0');
  signal buf_processed : std_logic_vector(2**BUFWIDTH - 1 downto 0) := (Others => '0');

  type state_type is (FSM_RESET, FSM_IDLE, FSM_TRANSFER_PACKET);
  signal state : state_type := FSM_RESET;
  signal next_state : state_type;

  signal rx_ram_addra : std_logic_vector(BUFWIDTH + ADDRWIDTH - 2 downto 0);
  signal rx_ram_addrb, tx_ram_addra : std_logic_vector(BUFWIDTH + ADDRWIDTH - 1 downto 0);
  signal tx_ram_addrb : std_logic_vector(BUFWIDTH + ADDRWIDTH - 2 downto 0);

  signal rst_ramclk_i, pkt_done_ramclk, pkt_done_ramclk_d : std_logic;


begin

  ----------------
  --   RX RAM   --
  ----------------

  wr_buf_idx <= std_logic_vector(wr_buf_idx_i);

  rx_ram_addra <= std_logic_vector(wr_buf_idx_i) & wr_addr;
  rx_ram_addrb <= std_logic_vector(buf_idx_transactor) & trans_out.raddr(ADDRWIDTH - 1 downto 0);
  rx_ram : entity work.ipbus_transport_multibuffer_rx_dpram
    generic map (
      ADDRWIDTH => ADDRWIDTH + BUFWIDTH
    )
    port map (
      clka => ram_clk,
      wea => wr_en,
      addra => rx_ram_addra,
      dia => wr_data,

      clkb => ipb_clk,
      addrb => rx_ram_addrb,
      dob => trans_in.rdata
    );

  incr_wr_buf_idx : process (ram_clk)
  begin
    if rising_edge(ram_clk) then
      if (rst_ramclk_i = '1') then
        wr_buf_idx_i <= (Others => '0');
      elsif (wr_done = '1') then
        wr_buf_idx_i <= wr_buf_idx_i + 1;
      end if;
    end if;
  end process;

  update_wr_buf_filled : for i in 0 to 2**BUFWIDTH - 1 generate
    process (ram_clk)
    begin
      if rising_edge(ram_clk) then
        if (rst_ramclk_i = '1') then
          wr_buf_filled_ramclk(i) <= '0';
        elsif (to_integer(idx_oldest_pending_rd_buf) = i) and (pkt_done_ramclk = '1' and pkt_done_ramclk_d = '0') then
          wr_buf_filled_ramclk(i) <= '0';
        elsif (to_integer(wr_buf_idx_i) = i) then
          if (wr_done = '1') then
            wr_buf_filled_ramclk(i) <= '1';
          end if;
        end if;
      end if;
    end process;
  end generate update_wr_buf_filled;

  process (ram_clk)
  begin
    if rising_edge(ram_clk) then
      if (rst_ramclk_i = '1') then
        idx_oldest_pending_rd_buf <= (Others => '0');
     elsif (pkt_done_ramclk = '1' and pkt_done_ramclk_d = '0') then
        idx_oldest_pending_rd_buf <= idx_oldest_pending_rd_buf + 1;
      end if;
    end if;
  end process;


  ----------------
  --   TX RAM   --
  ----------------

  tx_ram_addra <= std_logic_vector(buf_idx_transactor) & trans_out.waddr(ADDRWIDTH - 1 downto 0);
  tx_ram_addrb <= rd_idx & rd_addr;
  tx_ram : entity work.ipbus_transport_multibuffer_tx_dpram
    generic map (
      ADDRWIDTH => ADDRWIDTH + BUFWIDTH
    )
    port map (
      clka => ipb_clk,
      wea => trans_out.we,
      addra => tx_ram_addra,
      dia => trans_out.wdata,

      clkb => ram_clk,
      addrb => tx_ram_addrb,
      dob => rd_data
    );


  -----------------------------------
  --   MAIN FINITE STATE MACHINE   --
  -----------------------------------

  process (ipb_clk)
  begin
    if rising_edge(ipb_clk) then
      if rst_ipb = '1' then
        state <= FSM_RESET;
      else
        state <= next_state;
      end if;
    end if;
  end process;

  -- Combinational process for next state
  process (state, buf_idx_transactor, wr_buf_filled_ipbclk, buf_processed, trans_out.pkt_done)
  begin
    case state is
      when FSM_RESET =>
        next_state <= FSM_IDLE;
      when FSM_IDLE =>
        if (wr_buf_filled_ipbclk(to_integer(buf_idx_transactor)) = '0') or (buf_processed(to_integer(buf_idx_transactor)) = '1') then
          next_state <= FSM_IDLE;
        else
          next_state <= FSM_TRANSFER_PACKET;
        end if;
      when FSM_TRANSFER_PACKET =>
        if (trans_out.pkt_done = '0') then
          next_state <= FSM_TRANSFER_PACKET;
        else
          next_state <= FSM_IDLE;
        end if;
    end case;
  end process;

  process (ipb_clk)
  begin
    if rising_edge(ipb_clk) then
      if (next_state = FSM_TRANSFER_PACKET) then
        trans_in.pkt_rdy <= '1';
        trans_in.busy <= '0';
      else
        trans_in.pkt_rdy <= '0';
        trans_in.busy <= '1';
      end if;
    end if;
  end process;

  process (ipb_clk)
  begin
    if rising_edge(ipb_clk) then
      if rst_ipb = '1' then
        buf_idx_transactor <= (Others => '0');
      elsif (state = FSM_TRANSFER_PACKET and next_state /= FSM_TRANSFER_PACKET) then
        buf_idx_transactor <= buf_idx_transactor + 1;
      end if;
    end if;
  end process;


  update_processed_ram_pages : for i in 0 to 2**BUFWIDTH - 1 generate
    process (ipb_clk)
    begin
      if rising_edge(ipb_clk) then
        if rst_ipb = '1' then
          buf_processed(i) <= '0';
        elsif wr_buf_filled_ipbclk(i) = '1' and wr_buf_filled_ipbclk_d(i) = '0' then
          buf_processed(i) <= '0';
        elsif (state = FSM_TRANSFER_PACKET and next_state /= FSM_TRANSFER_PACKET and to_integer(buf_idx_transactor) = i) then
          buf_processed(i) <= '1';
        end if;
      end if;
    end process;
  end generate;


  --------------------------------
  --   CLOCK DOMAIN CROSSINGS   --
  --------------------------------

  cdc : entity work.ipbus_transport_multibuffer_cdc
    generic map (
      N_BUFFERS => 2**BUFWIDTH
    )
    port map (
      ipb_clk => ipb_clk,
      master_clk => ram_clk,

      rst_ipbclk => rst_ipb,
      rst_mstclk => rst_ramclk_i,

      pkt_done_ipbclk => trans_out.pkt_done,
      pkt_done_mstclk => pkt_done_ramclk,

      buf_filled_mstclk => wr_buf_filled_ramclk,
      buf_filled_ipbclk => wr_buf_filled_ipbclk
    );

  rst_ramclk <= rst_ramclk_i;

  process (ram_clk)
  begin
    if rising_edge(ram_clk) then
      pkt_done_ramclk_d <= pkt_done_ramclk;
      if (pkt_done_ramclk = '1') and (pkt_done_ramclk_d = '0') then
        pkt_done <= '1';
      else
        pkt_done <= '0';
      end if;
    end if;
  end process;

  process (ipb_clk)
  begin
    if rising_edge(ipb_clk) then
      wr_buf_filled_ipbclk_d <= wr_buf_filled_ipbclk;
    end if;
  end process;

end rtl;
