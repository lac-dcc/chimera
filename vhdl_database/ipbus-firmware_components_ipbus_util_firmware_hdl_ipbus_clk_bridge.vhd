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


-- ipbus_clk_bridge

-- Bridges ipbus signals between clock domains This version works with
-- fully asynchronous clocks, but you pay a latency penalty. A simpler
-- design could be used for related clocks.

-- The 'from' side initiates the transactions, and the 'to' side
-- responds.

-- This component is written (and has been tested) for transitions
-- from the IPBus clock to a faster clock. A typical use case is
-- interfacing to a Xilinx DRP port.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.all;

entity ipbus_clk_bridge is
  port (
    m_clk: in std_logic;
    m_rst: in std_logic;
    m_ipb_in: in ipb_wbus;
    m_ipb_out: out ipb_rbus;

    s_clk: in std_logic;
    s_rst: in std_logic;
    s_ipb_out: out ipb_wbus;
    s_ipb_in: in ipb_rbus
  );
end ipbus_clk_bridge;

architecture rtl of ipbus_clk_bridge is

  signal m_rst_t : std_logic;
  signal s_rst_f : std_logic;

  signal clk_f : std_logic;
  signal rst_f : std_logic;
  signal ipb_in_f : ipb_wbus;
  signal ipb_out_f : ipb_rbus;

  signal clk_t : std_logic;
  signal rst_t : std_logic;
  signal ipb_in_t : ipb_rbus;
  signal ipb_out_t : ipb_wbus;

  signal f_addr_i : std_logic_vector(31 downto 0);
  signal f_wdata_i : std_logic_vector(31 downto 0);
  signal f_write_i : std_logic;
  signal f_strobe_i : std_logic;
  signal f_rdata_o : std_logic_vector(31 downto 0);
  signal f_ack_o : std_logic;
  signal f_err_o : std_logic;

  signal t_addr_o : std_logic_vector(31 downto 0);
  signal t_wdata_o : std_logic_vector(31 downto 0);
  signal t_write_o : std_logic;
  signal t_strobe_o : std_logic;
  signal t_rdata_i : std_logic_vector(31 downto 0);
  signal t_ack_i : std_logic;
  signal t_err_i : std_logic;

  signal t_done : std_logic;

  signal f_done_d1 : std_logic;
  signal f_done_d2 : std_logic;
  signal f_done_d3 : std_logic;

  signal t_strobe_o_d1 : std_logic;
  signal t_strobe_o_d2 : std_logic;
  signal t_strobe_o_d3 : std_logic;

  -- NOTE: These attributes technically make this
  -- Xilinx-specific. This functionality could be easily extracted and
  -- turned into constraints, though. In that case the logic should
  -- become vendor-agnostic.
  attribute ASYNC_REG: string;
  attribute ASYNC_REG of f_done_d1 : signal is "yes";
  attribute ASYNC_REG of f_done_d2 : signal is "yes";
  attribute ASYNC_REG of f_done_d3 : signal is "yes";
  attribute ASYNC_REG of t_strobe_o_d1 : signal is "yes";
  attribute ASYNC_REG of t_strobe_o_d2 : signal is "yes";
  attribute ASYNC_REG of t_strobe_o_d3 : signal is "yes";

  attribute SHREG_EXTRACT: string;
  attribute SHREG_EXTRACT of f_done_d1 : signal is "no";
  attribute SHREG_EXTRACT of f_done_d2 : signal is "no";
  attribute SHREG_EXTRACT of f_done_d3 : signal is "no";
  attribute SHREG_EXTRACT of t_strobe_o_d1 : signal is "no";
  attribute SHREG_EXTRACT of t_strobe_o_d2 : signal is "no";
  attribute SHREG_EXTRACT of t_strobe_o_d3 : signal is "no";

begin

  cdc_rst_m : entity work.cdc_reset
    port map (
      reset_in  => m_rst,
      clk_dst   => clk_t,
      reset_out => m_rst_t
    );

  cdc_rst_s : entity work.cdc_reset
    port map (
      reset_in  => s_rst,
      clk_dst   => clk_f,
      reset_out => s_rst_f
    );

  ----------

  -- 'From' side signals.
  clk_f     <= m_clk;
  rst_f     <= m_rst or s_rst_f;
  ipb_in_f  <= m_ipb_in;
  m_ipb_out <= ipb_out_f;

  -- 'To' side signals.
  clk_t     <= s_clk;
  rst_t     <= s_rst or m_rst_t;
  ipb_in_t  <= s_ipb_in;
  s_ipb_out <= ipb_out_t;

  ----------

  -- 'From' side management.
  proc_f : process(clk_f) is
  begin
    if rising_edge(clk_f) then
      if rst_f = '1' then
        f_addr_i   <= (others => '0');
        f_wdata_i  <= (others => '0');
        f_write_i  <= '0';
        f_strobe_i <= '0';
        f_rdata_o  <= (others => '0');
        f_ack_o    <= '0';
        f_err_o    <= '0';
      else
        if f_strobe_i = '1' then
          if not (f_done_d2 = '1' and f_done_d3 = '0') then
            -- A transaction is ongoing. Freeze the 'from' signals.
            f_addr_i   <= f_addr_i;
            f_wdata_i  <= f_wdata_i;
            f_write_i  <= f_write_i;
            f_strobe_i <= f_strobe_i;
            f_rdata_o  <= f_rdata_o;
            f_ack_o    <= f_ack_o;
            f_err_o    <= f_err_o;
          else
            -- The 'to' side of the transaction is done, and the
            -- signals have settled. Transfer the signals from the
            -- 'to' side to the 'from' side.
            f_addr_i   <= (others => '0');
            f_wdata_i  <= (others => '0');
            f_write_i  <= '0';
            f_strobe_i <= '0';
            f_rdata_o  <= t_rdata_i;
            f_ack_o    <= t_ack_i;
            f_err_o    <= t_err_i;
          end if;
        else
          -- No transaction ongoing. Just follow the incoming 'from'
          -- signals.
          f_addr_i   <= ipb_in_f.ipb_addr;
          f_wdata_i  <= ipb_in_f.ipb_wdata;
          f_write_i  <= ipb_in_f.ipb_write;
          f_strobe_i <= ipb_in_f.ipb_strobe and not f_ack_o and not f_err_o;
          f_rdata_o  <= (others => '0');
          f_ack_o    <= '0';
          f_err_o    <= '0';
        end if;
      end if;
      -- This part forms a traditional CDC for the synchronisation
      -- from the 'to' logic to the 'from' logic.
      f_done_d1 <= t_done;
      f_done_d2 <= f_done_d1;
      f_done_d3 <= f_done_d2;
    end if;
  end process;

  ipb_out_f.ipb_rdata <= f_rdata_o;
  ipb_out_f.ipb_ack   <= f_ack_o;
  ipb_out_f.ipb_err   <= f_err_o;

  ----------

  -- 'To' side management.
  proc_t : process(clk_t) is
  begin
    if rising_edge(clk_t) then
      if rst_t = '1' then
        t_addr_o   <= (others => '0');
        t_wdata_o  <= (others => '0');
        t_write_o  <= '0';
        t_strobe_o <= '0';
        t_rdata_i  <= (others => '0');
        t_ack_i    <= '0';
        t_err_i    <= '0';
        t_done     <= '0';
      else
        if ipb_in_t.ipb_ack = '1' or ipb_in_t.ipb_err = '1' then
          -- The 'to' side of the transaction finished (either
          -- correctly or with an error). Freeze the 'to' side
          -- signals.
          t_addr_o   <= (others => '0');
          t_wdata_o  <= (others => '0');
          t_write_o  <= '0';
          t_strobe_o <= '0';
          t_rdata_i  <= ipb_in_t.ipb_rdata;
          t_ack_i    <= ipb_in_t.ipb_ack;
          t_err_i    <= ipb_in_t.ipb_err;
          t_done     <= '1';
        elsif t_strobe_o_d2 = '1' and t_strobe_o_d3 = '0' then
          -- Start of a new transaction. Transfer the 'from' side
          -- signals to the 'to' side.
          t_addr_o   <= f_addr_i;
          t_wdata_o  <= f_wdata_i;
          t_write_o  <= f_write_i;
          t_strobe_o <= f_strobe_i;
          t_rdata_i  <= (others => '0');
          t_ack_i    <= '0';
          t_err_i    <= '0';
          t_done     <= '0';
        elsif t_strobe_o_d2 = '0' and t_strobe_o_d3 = '1' then
          -- End of a transaction. Clean up everything.
          t_addr_o   <= (others => '0');
          t_wdata_o  <= (others => '0');
          t_write_o  <= '0';
          t_strobe_o <= '0';
          t_rdata_i  <= (others => '0');
          t_ack_i    <= '0';
          t_err_i    <= '0';
          t_done     <= '0';
        else
          t_addr_o   <= t_addr_o;
          t_wdata_o  <= t_wdata_o;
          t_write_o  <= t_write_o;
          t_strobe_o <= t_strobe_o;
          t_rdata_i  <= t_rdata_i;
          t_ack_i    <= t_ack_i;
          t_err_i    <= t_err_i;
          t_done     <= t_done;
        end if;
      end if;
      -- This part forms a traditional CDC for the synchronisation
      -- from the 'from' logic to the 'to' logic.
      t_strobe_o_d1 <= f_strobe_i;
      t_strobe_o_d2 <= t_strobe_o_d1;
      t_strobe_o_d3 <= t_strobe_o_d2;
    end if;
  end process;

  ipb_out_t.ipb_addr   <= t_addr_o;
  ipb_out_t.ipb_wdata  <= t_wdata_o;
  ipb_out_t.ipb_write  <= t_write_o;
  ipb_out_t.ipb_strobe <= t_strobe_o;

end rtl;
