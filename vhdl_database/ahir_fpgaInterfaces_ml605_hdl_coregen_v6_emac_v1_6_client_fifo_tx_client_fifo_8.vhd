-------------------------------------------------------------------------------
-- Title      : 8-bit Client-to-LocalLink Transmitter FIFO
-- Project    : Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper
-- File       : tx_client_fifo_8.vhd
-- Version    : 1.6
-------------------------------------------------------------------------------
--
-- (c) Copyright 2009-2012 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-------------------------------------------------------------------------------
-- Description: This is a transmit-side LocalLink FIFO implementation for
--              the example design of the Virtex-6 Embedded Tri-Mode Ethernet
--              MAC Wrapper core.
--
--              The transmit FIFO is created from a Block RAM of size 4096
--              words of 8-bits per word.
--
--              Valid frame data received from LocalLink interface is written
--              into the Block RAM on the write clock. The FIFO will store
--              frames upto 4kbytes in length. If larger frames are written
--              to the FIFO the LocalLink interface will accept the rest of the
--              frame, but that frame will be dropped by the FIFO and
--              the overflow signal will be asserted.
--
--              The FIFO is designed to work with a minimum frame length of 14
--              bytes.
--
--              When there is at least one complete frame in the FIFO,
--              the MAC transmitter client interface will be driven to
--              request frame transmission by placing the first byte of
--              the frame onto tx_data[15:0] and by asserting
--              tx_data_valid. The MAC will later respond by asserting
--              tx_ack. At this point the remaining frame data is read
--              out of the FIFO in a continuous burst. Data is read out
--              of the FIFO on the rd_clk.
--
--              The FIFO has been designed to operate with different clocks
--              on the write and read sides. The write clock (LocalLink clock)
--              can be an equal or faster frequency than the read clock
--              (client clock). The minimum write clock frequency is the read
--              clock frequency divided by 2.5.
--
--              The FIFO memory size can be increased by expanding the rd_addr
--              and wr_addr signal widths, to address further BRAMs.
-------------------------------------------------------------------------------

library unisim;

use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tx_client_fifo_8 is
   generic (
      -- If FULL_DUPLEX_ONLY is true then all the half duplex logic in the FIFO is removed.
      -- The default for the fifo is to include the half duplex functionality
      FULL_DUPLEX_ONLY : boolean := false);
   port (
      -- MAC Interface
      rd_clk          : in  std_logic;
      rd_sreset       : in  std_logic;
      rd_enable       : in  std_logic;
      tx_data         : out std_logic_vector(7 downto 0);
      tx_data_valid   : out std_logic;
      tx_ack          : in  std_logic;
      tx_collision    : in  std_logic;
      tx_retransmit   : in  std_logic;
      overflow        : out std_logic;

      -- LocalLink Interface
      wr_clk          : in  std_logic;
      wr_sreset       : in  std_logic;  -- synchronous reset (write_clock)
      wr_data         : in  std_logic_vector(7 downto 0);
      wr_sof_n        : in  std_logic;
      wr_eof_n        : in  std_logic;
      wr_src_rdy_n    : in  std_logic;
      wr_dst_rdy_n    : out std_logic;
      wr_fifo_status  : out std_logic_vector(3 downto 0)
   );
end tx_client_fifo_8;

architecture RTL of tx_client_fifo_8 is

  signal GND                  : std_logic;
  signal VCC                  : std_logic;
  signal GND_BUS              : std_logic_vector(31 downto 0);

  type rd_state_typ is (IDLE_s, QUEUE1_s, QUEUE2_s, QUEUE3_s, QUEUE_ACK_s, WAIT_ACK_s, FRAME_s, DROP_s, RETRANSMIT_s);
  signal rd_state             : rd_state_typ;
  signal rd_nxt_state         : rd_state_typ;
  type wr_state_typ is (WAIT_s, DATA_s, EOF_s, OVFLOW_s);
  signal wr_state             : wr_state_typ;
  signal wr_nxt_state         : wr_state_typ;

  type data_pipe is array(0 to 1) of std_logic_vector(7 downto 0);
  type cntl_pipe is array(0 to 1) of std_logic;

  signal wr_data_bram         : std_logic_vector(7 downto 0);
  signal wr_data_pipe         : data_pipe;
  signal wr_sof_pipe          : cntl_pipe;
  signal wr_eof_pipe          : cntl_pipe;
  signal wr_accept_pipe       : cntl_pipe;
  signal wr_accept_bram       : std_logic;
  signal wr_eof_bram          : std_logic_vector(0 downto 0);
  signal wr_addr              : unsigned(11 downto 0);
  signal wr_addr_inc          : std_logic;
  signal wr_start_addr_load   : std_logic;
  signal wr_addr_reload       : std_logic;
  signal wr_start_addr        : unsigned(11 downto 0);
  signal wr_fifo_full         : std_logic;
  signal wr_en                : std_logic;
  signal wr_ovflow_dst_rdy    : std_logic;
  signal wr_dst_rdy_int_n     : std_logic;

  signal frame_in_fifo        : std_logic;
  signal frame_in_fifo_sync   : std_logic;
  signal rd_eof_bram          : std_logic;
  signal rd_eof               : std_logic;
  signal rd_eof_reg           : std_logic;
  signal rd_addr              : unsigned(11 downto 0);
  signal rd_addr_inc          : std_logic;
  signal rd_addr_reload       : std_logic;
  signal rd_data_bram         : std_logic_vector(7 downto 0);
  signal rd_data_pipe         : std_logic_vector(7 downto 0);
  signal rd_en                : std_logic;
  signal rd_en_bram           : std_logic;
  signal dob_bram             : std_logic_vector(31 downto 0);
  signal dopb_bram            : std_logic_vector(3 downto 0);

  signal rd_tran_frame_tog     : std_logic;
  signal wr_tran_frame_tog     : std_logic;
  signal wr_tran_frame_sync    : std_logic;
  signal wr_tran_frame_delay   : std_logic;
  signal rd_retran_frame_tog   : std_logic;
  signal wr_retran_frame_tog   : std_logic;
  signal wr_retran_frame_sync  : std_logic;
  signal wr_retran_frame_delay : std_logic;
  signal wr_store_frame        : std_logic;
  signal wr_eof_state          : std_logic;
  signal wr_eof_state_reg      : std_logic;
  signal wr_transmit_frame     : std_logic;
  signal wr_retransmit_frame   : std_logic;
  signal wr_frames             : std_logic_vector(8 downto 0);
  signal wr_frame_in_fifo      : std_logic;

  signal rd_16_count          : unsigned(3 downto 0);
  signal rd_txfer_en          : std_logic;
  signal rd_addr_txfer        : unsigned(11 downto 0);
  signal rd_txfer_tog         : std_logic;
  signal wr_txfer_tog         : std_logic;
  signal wr_txfer_tog_sync    : std_logic;
  signal wr_txfer_tog_delay   : std_logic;
  signal wr_txfer_en          : std_logic;
  signal wr_rd_addr           : unsigned(11 downto 0);
  signal wr_addr_diff         : unsigned(11 downto 0);

  signal rd_drop_frame        : std_logic;
  signal rd_retransmit        : std_logic;

  signal rd_start_addr        : unsigned(11 downto 0);
  signal rd_start_addr_load   : std_logic;
  signal rd_start_addr_reload : std_logic;

  signal rd_dec_addr          : unsigned(11 downto 0);

  signal rd_transmit_frame    : std_logic;
  signal rd_retransmit_frame  : std_logic;
  signal rd_col_window_expire : std_logic;
  signal rd_col_window_pipe   : cntl_pipe;
  signal wr_col_window_pipe   : cntl_pipe;

  signal wr_fifo_overflow     : std_logic;

  signal rd_slot_timer        : unsigned(9 downto 0);
  signal wr_col_window_expire : std_logic;

  signal rd_idle_state        : std_logic;
  signal rd_enable_delay      : std_logic;
  signal rd_enable_delay2     : std_logic;

  -- Small delay for simulation purposes.
  constant dly : time := 1 ps;

  -----------------------------------------------------------------------------
  -- Attributes for FIFO simulation and synthesis
  -----------------------------------------------------------------------------
  -- ASYNC_REG attributes added to simulate actual behaviour under
  -- asynchronous operating conditions.
  attribute ASYNC_REG                          : string;
  attribute ASYNC_REG of wr_tran_frame_tog     : signal is "TRUE";
  attribute ASYNC_REG of wr_retran_frame_tog   : signal is "TRUE";
  attribute ASYNC_REG of frame_in_fifo_sync    : signal is "TRUE";
  attribute ASYNC_REG of wr_rd_addr            : signal is "TRUE";
  attribute ASYNC_REG of wr_txfer_tog          : signal is "TRUE";
  attribute ASYNC_REG of wr_col_window_pipe    : signal is "TRUE";


-------------------------------------------------------------------------------
-- Begin FIFO architecture
-------------------------------------------------------------------------------

begin

  GND     <= '0';
  VCC     <= '1';
  GND_BUS <= (others => '0');

  rd_enable_del_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
       if rd_sreset = '1' then
         rd_enable_delay <= '0' after dly;
         rd_enable_delay2 <= '0' after dly;
       else
         rd_enable_delay <= rd_enable after dly;
         rd_enable_delay2 <= rd_enable_delay after dly;
       end if;
     end if;
  end process rd_enable_del_p;

  -----------------------------------------------------------------------------
  -- Write state machine and control
  -----------------------------------------------------------------------------
  -- Write state machine
  -- states are WAIT, DATA, EOF, OVFLOW
  -- clock through next state of sm
  clock_wrs_p : process(wr_clk)
  begin
     if (wr_clk'event and wr_clk = '1') then
        if wr_sreset = '1' then
           wr_state <= WAIT_s after dly;
        else
           wr_state <= wr_nxt_state after dly;
        end if;
     end if;
  end process clock_wrs_p;

  -- decode next state, combinitorial
  -- should never be able to overflow whilst not in the data state.
  next_wrs_p : process(wr_state, wr_sof_pipe(1), wr_eof_pipe, wr_eof_bram(0), wr_fifo_overflow)
  begin
  case wr_state is
     when WAIT_s =>
        -- when the sof is detected move to frame state
        if wr_sof_pipe(1) = '1' then
           wr_nxt_state <= DATA_s;
        else
           wr_nxt_state <= WAIT_s;
        end if;
     when DATA_s =>
        -- wait for the end of frame to be detected
        if wr_fifo_overflow = '1' and wr_eof_pipe = "00" then
           wr_nxt_state <= OVFLOW_s;
        elsif wr_eof_pipe(1) = '1' then
           wr_nxt_state <= EOF_s;
        else
           wr_nxt_state <= DATA_s;
        end if;
     when EOF_s =>
        -- if the start of frame is already in the pipe, a back to back frame
        -- transmission has occured.  move straight back to frame state
        if wr_sof_pipe(1) = '1' then
           wr_nxt_state <= DATA_s;
        elsif wr_eof_bram(0) = '1' then
           wr_nxt_state <= WAIT_s;
        else
           wr_nxt_state <= EOF_s;
        end if;
     when OVFLOW_s =>
        -- wait until the end of frame is reached before clearing the overflow
        if wr_eof_bram(0) = '1' then
           wr_nxt_state <= WAIT_s;
        else
           wr_nxt_state <= OVFLOW_s;
        end if;
     when others =>
        wr_nxt_state <= WAIT_s;
  end case;
  end process;

  -- decode output signals.
  wr_en <= '0' when wr_state = OVFLOW_s else wr_accept_bram;

  wr_addr_inc <= wr_en;

  wr_addr_reload <= '1' when wr_state = OVFLOW_s else '0';
  wr_start_addr_load <= '1' when wr_state = EOF_s and wr_nxt_state = WAIT_s else
                        '1' when wr_state = EOF_s and wr_nxt_state = DATA_s else  '0';

  -- pause the LocalLink flow when the fifo is full.
  wr_dst_rdy_int_n <= wr_ovflow_dst_rdy when wr_state = OVFLOW_s else wr_fifo_full;
  wr_dst_rdy_n <= wr_dst_rdy_int_n;

  overflow <= '1' when wr_state = OVFLOW_s else '0';

  -- when in overflow and have captured ovflow eof send dst rdy high again.
  p_ovflow_dst_rdy : process (wr_clk)
  begin
     if wr_clk'event and wr_clk = '1' then
        if wr_sreset = '1' then
           wr_ovflow_dst_rdy <= '0' after dly;
        else
           if wr_fifo_overflow = '1' and wr_state = DATA_s then
              wr_ovflow_dst_rdy <= '0' after dly;
           elsif wr_eof_n = '0' and wr_src_rdy_n = '0' then
              wr_ovflow_dst_rdy <= '1' after dly;
           end if;
        end if;
     end if;
  end process;

  -- eof signals for use in overflow logic
  wr_eof_state <= '1' when wr_state = EOF_s else '0';

  p_reg_eof_st : process (wr_clk)
  begin
     if wr_clk'event and wr_clk = '1' then
        if wr_sreset = '1' then
           wr_eof_state_reg <= '0' after dly;
        else
           wr_eof_state_reg <= wr_eof_state after dly;
        end if;
     end if;
  end process;

  -----------------------------------------------------------------------------
  -- Read state machine and control
  -----------------------------------------------------------------------------
  -- clock through the read state machine
  clock_rds_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_sreset = '1' then
           rd_state <= IDLE_s after dly;
        elsif rd_enable = '1' then
           rd_state <= rd_nxt_state after dly;
        end if;
     end if;
  end process clock_rds_p;

  -- Full duplex only state machine
  gen_fd_sm : if (FULL_DUPLEX_ONLY = TRUE) generate

  -- decode the next state
  next_rds_p : process(rd_state, frame_in_fifo, rd_eof, tx_ack)
  begin
  case rd_state is
           when IDLE_s =>
              -- if there is a frame in the fifo start to queue the new frame
              -- to the output
              if frame_in_fifo = '1' then
                 rd_nxt_state <= QUEUE1_s;
              else
                 rd_nxt_state <= IDLE_s;
              end if;
           when QUEUE1_s =>
                rd_nxt_state <= QUEUE2_s;
           when QUEUE2_s =>
                 rd_nxt_state <= QUEUE3_s;
           when QUEUE3_s =>
                 rd_nxt_state <= QUEUE_ACK_s;
           when QUEUE_ACK_s =>
                 rd_nxt_state <= WAIT_ACK_s;
           when WAIT_ACK_s =>
              -- the output pipe line is fully loaded, so wait for ack from mac
              -- before moving on
              if tx_ack = '1' then
                 rd_nxt_state <= FRAME_s;
              else
                 rd_nxt_state <= WAIT_ACK_s;
              end if;
           when FRAME_s =>
              -- when the end of frame has been reached wait another frame in
              -- the fifo
              if rd_eof = '1' then
                 rd_nxt_state <= IDLE_s;
              else
                 rd_nxt_state <= FRAME_s;
              end if;
           when others =>
                 rd_nxt_state <= IDLE_s;
        end case;
  end process next_rds_p;

  end generate gen_fd_sm;

  -- Full and Half Duplex State Machine
  gen_hd_sm : if (FULL_DUPLEX_ONLY = FALSE) generate
  -- decode the next state
  -- should never receive a rd_drop_frame pulse outside of the Frame state
  next_rds_p : process(rd_state, frame_in_fifo, rd_eof_reg, tx_ack, rd_drop_frame, rd_retransmit)
  begin
  case rd_state is
           when IDLE_s =>
              -- if a retransmit request is detected go to retransmit state
              if rd_retransmit = '1' then
                 rd_nxt_state <= RETRANSMIT_s;
              -- if there is a frame in the fifo then queue the new frame to
              -- the output
              elsif frame_in_fifo = '1' then
                 rd_nxt_state <= QUEUE1_s;
              else
                 rd_nxt_state <= IDLE_s;
              end if;
           when QUEUE1_s =>
              if rd_retransmit = '1' then
                 rd_nxt_state <= RETRANSMIT_s;
              else
                rd_nxt_state <= QUEUE2_s;
              end if;
           when QUEUE2_s =>
              if rd_retransmit = '1' then
                 rd_nxt_state <= RETRANSMIT_s;
              else
                 rd_nxt_state <= QUEUE3_s;
              end if;
           when QUEUE3_s =>
              if rd_retransmit = '1' then
                 rd_nxt_state <= RETRANSMIT_s;
              else
                 rd_nxt_state <= QUEUE_ACK_s;
              end if;
           when QUEUE_ACK_s =>
              if rd_retransmit = '1' then
                 rd_nxt_state <= RETRANSMIT_s;
              else
                 rd_nxt_state <= WAIT_ACK_s;
              end if;
           when WAIT_ACK_s =>
              -- the output pipeline is now fully loaded so wait for ack from
              -- mac before moving on.
              if rd_retransmit = '1' then
                 rd_nxt_state <= RETRANSMIT_s;
              elsif tx_ack = '1' then
                 rd_nxt_state <= FRAME_s;
              else
                 rd_nxt_state <= WAIT_ACK_s;
              end if;
           when FRAME_s =>
              -- if a collision only request, then must drop the rest of the
              -- current frame, move to drop state
              if rd_drop_frame = '1' then
                 rd_nxt_state <= DROP_s;
              elsif rd_retransmit = '1' then
                 rd_nxt_state <= RETRANSMIT_s;
              -- continue transmitting frame until the end of the frame is
              -- detected, then wait for a new frame to be sent.
              elsif rd_eof_reg = '1' then
                 rd_nxt_state <= IDLE_s;
              else
                 rd_nxt_state <= FRAME_s;
              end if;
           when DROP_s =>
              -- wait until rest of frame has been cleared.
              if rd_eof_reg = '1' then
                 rd_nxt_state <= IDLE_s;
              else
                 rd_nxt_state <= DROP_s;
              end if;
           when RETRANSMIT_s =>
              -- reload the data pipe from the start of the frame
                 rd_nxt_state <= QUEUE1_s;
           when others =>
                 rd_nxt_state <= IDLE_s;
        end case;
  end process next_rds_p;

  end generate gen_hd_sm;

  -- decode output signals
  -- decode output data
  rd_data_decode_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_enable = '1' then
           if rd_nxt_state = FRAME_s then
              tx_data <= rd_data_pipe after dly;
           else
              case rd_state is
                 when QUEUE_ACK_s =>
                    tx_data <= rd_data_pipe after dly;
                 when WAIT_ACK_s => null;
                 when FRAME_s =>
                    tx_data <= rd_data_pipe after dly;
                 when others =>
                    tx_data <= (others => '0') after dly;
              end case;
           end if;
        end if;
     end if;
  end process rd_data_decode_p;

  -- decode output data valid
  rd_dv_decode_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_enable = '1' then
           if rd_nxt_state = FRAME_s then
              tx_data_valid <= not(tx_collision and not(tx_retransmit)) after dly;
           else
              case rd_state is
                 when QUEUE_ACK_s =>
                    tx_data_valid <= '1' after dly;
                 when WAIT_ACK_s =>
                    tx_data_valid <= '1' after dly;
                 when FRAME_s =>
                    if (rd_nxt_state /= DROP_s) then
                      tx_data_valid <= '1' after dly;
                    else
                      tx_data_valid <= '0' after dly;
                    end if;
                 when others =>
                    tx_data_valid <= '0' after dly;
              end case;
           end if;
        end if;
     end if;
  end process rd_dv_decode_p;

  -- decode full duplex only control signals
  gen_fd_decode : if (FULL_DUPLEX_ONLY = TRUE) generate

  rd_en <= '0' when rd_state = IDLE_s else
           '1' when rd_nxt_state = FRAME_s else
           '0' when rd_state = WAIT_ACK_s else '1';

  rd_addr_inc <=  rd_en;

  rd_addr_reload <= '1' when rd_state = FRAME_s and rd_nxt_state = IDLE_s else '0';

  -- Transmit frame pulse is only 1 clock enabled pulse long.
  -- Transmit frame pulse must never be more frequent than 64 clocks to allow toggle to cross clock domain
  rd_transmit_frame <= '1' when rd_state = WAIT_ACK_s and rd_nxt_state = FRAME_s else '0';

  -- unused for full duplex only
  rd_start_addr_reload <= '0';
  rd_start_addr_load   <= '0';
  rd_retransmit_frame  <= '0';

  end generate gen_fd_decode;

  -- decode half duplex control signals
  gen_hd_decode : if (FULL_DUPLEX_ONLY = FALSE) generate

  rd_en <= '0' when rd_state = IDLE_s else
           '0' when (rd_nxt_state = DROP_s and rd_eof = '1') else
           '1' when rd_nxt_state = FRAME_s else
           '0' when rd_state = RETRANSMIT_s else
           '0' when rd_state = WAIT_ACK_s else '1';

  rd_addr_inc <=  rd_en;

  rd_addr_reload <= '1' when rd_state = FRAME_s and rd_nxt_state = IDLE_s else
                    '1' when rd_state = DROP_s and rd_nxt_state = IDLE_s else '0';

  rd_start_addr_reload <= '1' when rd_state = RETRANSMIT_s else '0';

  rd_start_addr_load <= '1' when rd_state = WAIT_ACK_s and rd_nxt_state = FRAME_s else
                        '1' when rd_col_window_expire = '1' else '0';

  -- Transmit frame pulse must never be more frequent than 64 clocks to allow toggle to cross clock domain
  rd_transmit_frame <= '1' when rd_state = WAIT_ACK_s and rd_nxt_state = FRAME_s else '0';

  -- Retransmit frame pulse must never be more frequent than 16 clocks to allow toggle to cross clock domain
  rd_retransmit_frame <= '1' when rd_state = RETRANSMIT_s else '0';

  end generate gen_hd_decode;

  -----------------------------------------------------------------------------
  -- Frame Count
  -- We need to maintain a count of frames in the fifo, so that we know when a
  -- frame is available for transmission.  The counter must be held on the
  -- write clock domain as this is the faster clock.
  -----------------------------------------------------------------------------

  -- A frame has been written to the fifo
  wr_store_frame <= '1' when wr_state = EOF_s and wr_nxt_state /= EOF_s else '0';

  -- generate a toggle to indicate when a frame has been transmitted from the fifo
  p_rd_trans_tog : process (rd_clk)
  begin  -- process
     if rd_clk'event and rd_clk = '1' then
        if rd_sreset = '1' then
           rd_tran_frame_tog <= '0' after dly;
        elsif rd_enable = '1' then
           if rd_transmit_frame = '1' then
              rd_tran_frame_tog <= not rd_tran_frame_tog after dly;
           end if;
        end if;
     end if;
  end process;

  -- move the read transmit frame signal onto the write clock domain
  p_sync_wr_trans : process (wr_clk)
  begin
    if wr_clk'event and wr_clk = '1' then
      if wr_sreset = '1' then
        wr_tran_frame_tog  <= '0' after dly;
        wr_tran_frame_sync <= '0' after dly;
        wr_tran_frame_delay <= '0' after dly;
        wr_transmit_frame  <= '0' after dly;
      else
        wr_tran_frame_tog  <= rd_tran_frame_tog after dly;
        wr_tran_frame_sync <= wr_tran_frame_tog after dly;
        wr_tran_frame_delay <= wr_tran_frame_sync after dly;
        -- edge detector
        if (wr_tran_frame_delay xor wr_tran_frame_sync) = '1' then
          wr_transmit_frame    <= '1' after dly;
        else
          wr_transmit_frame    <= '0' after dly;
        end if;
      end if;
    end if;
  end process p_sync_wr_trans;

  gen_fd_count : if (FULL_DUPLEX_ONLY = TRUE) generate

  -- count the number of frames in the fifo.  the counter is incremented when a
  -- frame is stored and decremented when a frame is transmitted.  Need to keep
  -- the counter on the write clock as this is the fastest clock.
  p_wr_frames : process (wr_clk)
  begin
    if wr_clk'event and wr_clk = '1' then
      if wr_sreset = '1' then
        wr_frames <= (others => '0') after dly;
      else
         if (wr_store_frame and not wr_transmit_frame) = '1' then
            wr_frames <= wr_frames + 1 after dly;
         elsif (not wr_store_frame and wr_transmit_frame) = '1' then
            wr_frames <= wr_frames - 1 after dly;
         end if;
      end if;
    end if;
  end process p_wr_frames;

  end generate gen_fd_count;

  gen_hd_count : if (FULL_DUPLEX_ONLY = FALSE) generate

  -- generate a toggle to indicate when a frame has been transmitted from the fifo
  p_rd_retran_tog : process (rd_clk)
  begin  -- process
     if rd_clk'event and rd_clk = '1' then
        if rd_sreset = '1' then
           rd_retran_frame_tog <= '0' after dly;
        elsif rd_enable = '1' then
           if rd_retransmit_frame = '1' then
              rd_retran_frame_tog <= not rd_retran_frame_tog after dly;
           end if;
        end if;
     end if;
  end process;

  -- move the read retransmit frame signal onto the write clock domain
  p_sync_wr_trans : process (wr_clk)
  begin
    if wr_clk'event and wr_clk = '1' then
      if wr_sreset = '1' then
        wr_retran_frame_tog  <= '0' after dly;
        wr_retran_frame_sync <= '0' after dly;
        wr_retran_frame_delay <= '0' after dly;
        wr_retransmit_frame  <= '0' after dly;
      else
        wr_retran_frame_tog  <= rd_retran_frame_tog after dly;
        wr_retran_frame_sync <= wr_retran_frame_tog after dly;
        wr_retran_frame_delay <= wr_retran_frame_sync after dly;
        -- edge detector
        if (wr_retran_frame_delay xor wr_retran_frame_sync) = '1' then
          wr_retransmit_frame    <= '1' after dly;
        else
          wr_retransmit_frame    <= '0' after dly;
        end if;
      end if;
    end if;
  end process p_sync_wr_trans;

  -- count the number of frames in the fifo.  the counter is incremented when a
  -- frame is stored or retransmitted and decremented when a frame is transmitted.  Need to keep
  -- the counter on the write clock as this is the fastest clock.
  -- Assumes transmit and retransmit cannot happen at same time
  p_wr_frames : process (wr_clk)
  begin
    if wr_clk'event and wr_clk = '1' then
      if wr_sreset = '1' then
        wr_frames <= (others => '0') after dly;
      else
         if (wr_store_frame and wr_retransmit_frame) = '1' then
            wr_frames <= wr_frames + 2 after dly;
         elsif ((wr_store_frame or wr_retransmit_frame) and not wr_transmit_frame) = '1' then
            wr_frames <= wr_frames + 1 after dly;
         elsif (wr_transmit_frame and not wr_store_frame) = '1' then
            wr_frames <= wr_frames - 1 after dly;
         end if;
      end if;
    end if;
  end process p_wr_frames;

  end generate gen_hd_count;

  -- generate a frame in fifo signal for use in control logic
  p_wr_avail : process (wr_clk)
  begin
    if wr_clk'event and wr_clk = '1' then
      if wr_sreset = '1' then
        wr_frame_in_fifo <= '0' after dly;
      else
        if wr_frames /= (wr_frames'range => '0') then
          wr_frame_in_fifo <= '1' after dly;
        else
          wr_frame_in_fifo <= '0' after dly;
        end if;
      end if;
    end if;
  end process p_wr_avail;

  -- register back onto read domain for use in the read logic
  p_rd_avail : process (rd_clk)
  begin
    if rd_clk'event and rd_clk = '1' then
      if rd_sreset = '1' then
         frame_in_fifo_sync <= '0' after dly;
         frame_in_fifo <= '0' after dly;
      elsif rd_enable = '1' then
         frame_in_fifo_sync <= wr_frame_in_fifo after dly;
         frame_in_fifo <= frame_in_fifo_sync after dly;
      end if;
    end if;
  end process p_rd_avail;

  -----------------------------------------------------------------------------
  -- Address counters
  -----------------------------------------------------------------------------
  -- Address counters
  -- write address is incremented when write enable signal has been asserted
  wr_addr_p : process(wr_clk)
  begin
     if (wr_clk'event and wr_clk = '1') then
        if wr_sreset = '1' then
           wr_addr <= (others => '0') after dly;
        elsif wr_addr_reload = '1' then
           wr_addr <= wr_start_addr after dly;
        elsif wr_addr_inc = '1' then
           wr_addr <= wr_addr + 1 after dly;
        end if;
     end if;
  end process wr_addr_p;

  -- store the start address incase the address must be reset
  wr_staddr_p : process(wr_clk)
  begin
     if (wr_clk'event and wr_clk = '1') then
        if wr_sreset = '1' then
           wr_start_addr <= (others => '0') after dly;
        elsif wr_start_addr_load = '1' then
           wr_start_addr <= wr_addr + 1 after dly;
        end if;
     end if;
  end process wr_staddr_p;

  gen_fd_addr : if (FULL_DUPLEX_ONLY = TRUE) generate
  -- read address is incremented when read enable signal has been asserted
  rd_addr_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_sreset = '1' then
           rd_addr <= (others => '0') after dly;
        elsif rd_enable = '1' then
           if rd_addr_reload = '1' then
              rd_addr <= rd_dec_addr after dly;
           elsif rd_addr_inc = '1' then
              rd_addr <= rd_addr + 1 after dly;
           end if;
        end if;
     end if;
  end process rd_addr_p;

  -- do not need to keep a start address, but the address is needed to
  -- calculate fifo occupancy.
  rd_start_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_sreset = '1' then
           rd_start_addr <= (others => '0') after dly;
        elsif rd_enable = '1' then
           rd_start_addr <= rd_addr after dly;
       end if;
     end if;
  end process rd_start_p;

  end generate gen_fd_addr;

  gen_hd_addr : if (FULL_DUPLEX_ONLY = FALSE) generate
  -- read address is incremented when read enable signal has been asserted
  rd_addr_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_sreset = '1' then
           rd_addr <= (others => '0') after dly;
        elsif rd_enable = '1' then
           if rd_addr_reload = '1' then
              rd_addr <= rd_dec_addr after dly;
           elsif rd_start_addr_reload = '1' then
              rd_addr <= rd_start_addr after dly;
           elsif rd_addr_inc = '1' then
              rd_addr <= rd_addr + 1 after dly;
           end if;
        end if;
     end if;
  end process rd_addr_p;

  rd_staddr_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_sreset = '1' then
           rd_start_addr <= (others => '0') after dly;
        elsif rd_enable = '1' then
           if rd_start_addr_load = '1' then
              rd_start_addr <= rd_addr - 4 after dly;
           end if;
        end if;
     end if;
  end process rd_staddr_p;

  -- Collision window expires after MAC has been transmitting for required slot
  -- time.  This is 512 clock cycles at 1G.  Also if the end of frame has fully
  -- been transmitted by the mac then a collision cannot occur. This collision
  -- expire signal goes high at 768 cycles from the start of the frame.
  -- Inefficient for short frames, however should be enough to prevent fifo
  -- locking up.
  rd_col_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_sreset = '1' then
           rd_col_window_expire <= '0' after dly;
        elsif rd_enable = '1' then
           if rd_transmit_frame = '1' then
              rd_col_window_expire <= '0' after dly;
           elsif rd_slot_timer(9 downto 8) = "11" then
              rd_col_window_expire <= '1' after dly;
           end if;
        end if;
     end if;
  end process;

  rd_idle_state <= '1' when rd_state = IDLE_s else '0';

  rd_colreg_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_enable = '1' then
           rd_col_window_pipe(0) <= rd_col_window_expire and rd_idle_state after dly;
           if rd_txfer_en = '1' then
              rd_col_window_pipe(1) <= rd_col_window_pipe(0) after dly;
           end if;
        end if;
     end if;
  end process;

  rd_slot_time_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_sreset = '1' then  -- will not count until after first
                                 -- frame is sent.
           rd_slot_timer <= (others => '0') after dly;
        elsif rd_enable = '1' then
           if rd_transmit_frame = '1' then  -- reset counter
              rd_slot_timer <= (others => '0') after dly;
           -- do not allow counter to role over.
           -- only count when frame is being transmitted.
           elsif rd_slot_timer /= "1111111111" then
              rd_slot_timer <= rd_slot_timer + 1 after dly;
           end if;
        end if;
     end if;
  end process;


  end generate gen_hd_addr;

  -----------------------------------------------------------------------------
  -- rd_dec addr dhouls be addr-2 assumes that rd_addr_reload will NOT happen
  -- on very first packet in the fifo
  -- should be ok as pipe is not loaded until data is present
  rd_decaddr_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_sreset = '1' then
           rd_dec_addr <= (others => '0') after dly;
        elsif rd_enable = '1' then
           if rd_addr_inc = '1' then
              rd_dec_addr <= rd_addr - 1 after dly;
           end if;
        end if;
     end if;
  end process rd_decaddr_p;

  -----------------------------------------------------------------------------
  -- Data pipelines
  -----------------------------------------------------------------------------
  -- register input signals to fifo
  -- no reset to allow srl16 target
  reg_din_p : process(wr_clk)
  begin
     if (wr_clk'event and wr_clk = '1') then
        wr_data_pipe(0) <= wr_data after dly;
        if wr_accept_pipe(0) = '1' then
           wr_data_pipe(1) <= wr_data_pipe(0) after dly;
        end if;
        if wr_accept_pipe(1) = '1' then
           wr_data_bram    <= wr_data_pipe(1) after dly;
        end if;
     end if;
  end process reg_din_p;

   -- no reset to allow srl16 target
  reg_sof_p : process(wr_clk)
  begin
     if (wr_clk'event and wr_clk = '1') then
         wr_sof_pipe(0) <= not wr_sof_n after dly;
         if wr_accept_pipe(0) = '1' then
            wr_sof_pipe(1) <= wr_sof_pipe(0) after dly;
         end if;
     end if;
  end process reg_sof_p;

  reg_acc_p : process(wr_clk)
  begin
     if (wr_clk'event and wr_clk = '1') then
        if (wr_sreset = '1') then
           wr_accept_pipe(0) <= '0' after dly;
           wr_accept_pipe(1) <= '0' after dly;
           wr_accept_bram    <= '0' after dly;
        else
           wr_accept_pipe(0) <= wr_src_rdy_n nor wr_dst_rdy_int_n after dly;
           wr_accept_pipe(1) <= wr_accept_pipe(0) after dly;
           wr_accept_bram    <= wr_accept_pipe(1) after dly;
        end if;
     end if;
  end process reg_acc_p;

  reg_eof_p : process(wr_clk)
  begin
     if (wr_clk'event and wr_clk = '1') then
        wr_eof_pipe(0) <= not wr_eof_n after dly;
        if wr_accept_pipe(0) = '1' then
           wr_eof_pipe(1) <= wr_eof_pipe(0) after dly;
        end if;
        if wr_accept_pipe(1) = '1' then
           wr_eof_bram(0) <= wr_eof_pipe(1) after dly;
        end if;
     end if;
  end process reg_eof_p;

  -- register data output
  -- no reset to allow srl16 target
  reg_dout_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_enable = '1' then
           if rd_en = '1' then
              rd_data_pipe <= rd_data_bram after dly;
           end if;
        end if;
     end if;
  end process reg_dout_p;

   -- register data output
  -- no reset to allow srl16 target
  reg_eofout_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_enable = '1' then
           if rd_en = '1' then
              rd_eof <= rd_eof_bram after dly;
              rd_eof_reg <= rd_eof or rd_eof_bram after dly;
           end if;
        end if;
     end if;
  end process reg_eofout_p;

  gen_hd_input : if (FULL_DUPLEX_ONLY = FALSE) generate
  -- register the collision and retransmit signals
  reg_col_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_enable = '1' then
          rd_drop_frame <= tx_collision and not tx_retransmit after dly;
        end if;
     end if;
  end process reg_col_p;

  reg_retr_p : process(rd_clk)
  begin
     if (rd_clk'event and rd_clk = '1') then
        if rd_enable = '1' then
           rd_retransmit <= tx_collision and tx_retransmit after dly;
        end if;
     end if;
  end process reg_retr_p;

 end generate gen_hd_input;

  -----------------------------------------------------------------------------
  -- FIFO full functionality
  -----------------------------------------------------------------------------
  -- when full duplex full functionality is difference between read and write addresses.
  -- when in half duplex is difference between read start and write addresses.
  -- Cannot use gray code this time as the read address and read start addresses jump by more than 1

  -- generate an enable pulse for the read side every 16 read clocks.  This provides for the worst case
  -- situation where wr clk is 20Mhz and rd clk is 125 Mhz.
  p_rd_16_pulse : process (rd_clk)
  begin
     if rd_clk'event and rd_clk = '1' then
        if rd_sreset = '1' then
           rd_16_count <= (others => '0') after dly;
        elsif rd_enable = '1' then
           rd_16_count <= rd_16_count + 1 after dly;
        end if;
     end if;
  end process;

  rd_txfer_en <= '1' when rd_16_count = "1111" else '0';

  -- register the start address on the enable pulse
  p_rd_addr_txfer : process (rd_clk)
  begin
    if rd_clk'event and rd_clk = '1' then
       if rd_sreset = '1' then
          rd_addr_txfer <= (others => '0') after dly;
       elsif rd_enable = '1' then
          if rd_txfer_en = '1' then
             rd_addr_txfer <= rd_start_addr after dly;
          end if;
       end if;
    end if;
  end process;

  -- generate a toggle to indicate that the address has been loaded.
  p_rd_tog_txfer : process (rd_clk)
  begin
    if rd_clk'event and rd_clk = '1' then
       if rd_sreset = '1' then
          rd_txfer_tog <= '0' after dly;
       elsif rd_enable = '1' then
          if rd_txfer_en = '1' then
             rd_txfer_tog <= not rd_txfer_tog after dly;
          end if;
       end if;
    end if;
  end process;

  -- pass the toggle to the write side
  p_wr_tog_txfer : process (wr_clk)
  begin
     if wr_clk'event and wr_clk = '1' then
        if wr_sreset = '1' then
           wr_txfer_tog <= '0' after dly;
           wr_txfer_tog_sync <= '0' after dly;
           wr_txfer_tog_delay <= '0' after dly;
        else
           wr_txfer_tog <= rd_txfer_tog after dly;
           wr_txfer_tog_sync <= wr_txfer_tog after dly;
           wr_txfer_tog_delay <= wr_txfer_tog_sync after dly;
        end if;
     end if;
  end process;

  -- generate an enable pulse from the toggle, the address should have been steady on the wr clock input for at least one clock
  wr_txfer_en <= wr_txfer_tog_delay xor wr_txfer_tog_sync;

  -- capture the address on the write clock when the enable pulse is high.
  p_wr_addr_txfer : process (wr_clk)
  begin
     if wr_clk'event and wr_clk = '1' then
        if wr_sreset = '1' then
           wr_rd_addr <= (others => '0') after dly;
        elsif wr_txfer_en = '1' then
           wr_rd_addr <= rd_addr_txfer after dly;
        end if;
     end if;
  end process;

  -- Obtain the difference between write and read pointers
  p_wr_addr_diff : process (wr_clk)
  begin
     if wr_clk'event and wr_clk = '1' then
        if wr_sreset = '1' then
           wr_addr_diff <= (others => '0') after dly;
        else
           wr_addr_diff <= wr_rd_addr - wr_addr after dly;
        end if;
     end if;
  end process;

  -- Detect when the FIFO is full
  p_wr_full : process (wr_clk)
  begin
     if wr_clk'event and wr_clk = '1' then
       if wr_sreset = '1' then
         wr_fifo_full <= '0' after dly;
       else
         -- The FIFO is considered to be full if the write address
         -- pointer is within 1 to 3 of the read address pointer.
         if wr_addr_diff(11 downto 4) = 0 and wr_addr_diff(3 downto 2) /= "00" then
           wr_fifo_full <= '1' after dly;
         else
           wr_fifo_full <= '0' after dly;
         end if;
       end if;
     end if;
  end process p_wr_full;

  -- memory overflow occurs when the fifo is full and there are no frames
  -- available in the fifo for transmission.  If the collision window has
  -- expired and there are no frames in the fifo and the fifo is full, then the
  -- fifo is in an overflow state.  we must accept the rest of the incoming
  -- frame in overflow condition.

  gen_fd_ovflow : if (FULL_DUPLEX_ONLY = TRUE) generate
          -- in full duplex mode, the fifo memory can only overflow if the fifo goes
     -- full but there is no frame available to be retranmsitted
     -- prevent signal from being asserted when store_frame signal is high, as frame count is being updated
     wr_fifo_overflow <= '1' when wr_fifo_full = '1' and wr_frame_in_fifo = '0'
                              and wr_eof_state = '0' and wr_eof_state_reg = '0' else '0';
  end generate gen_fd_ovflow;

  gen_hd_ovflow : if (FULL_DUPLEX_ONLY = FALSE) generate
    -- register wr col window to give address counter sufficient time to update.
    -- prevent signal from being asserted when store_frame signal is high, as frame count is being updated
    wr_fifo_overflow <= '1' when wr_fifo_full = '1' and wr_frame_in_fifo = '0'
                             and wr_eof_state = '0' and wr_eof_state_reg = '0' and wr_col_window_expire = '1' else '0';

    -- register rd_col_window signal
    -- this signal is long, and will remain high until overflow functionality
    -- has finished, so save just to register the once.
    p_wr_col_expire : process (wr_clk)
    begin  -- process
       if wr_clk'event and wr_clk = '1' then
          if wr_sreset = '1' then
             wr_col_window_pipe(0) <= '0' after dly;
             wr_col_window_pipe(1) <= '0' after dly;
             wr_col_window_expire  <= '0' after dly;
          else
             if wr_txfer_en = '1' then
               wr_col_window_pipe(0) <= rd_col_window_pipe(1) after dly;
             end if;
             wr_col_window_pipe(1) <= wr_col_window_pipe(0) after dly;
             wr_col_window_expire  <= wr_col_window_pipe(1) after dly;
          end if;
       end if;
    end process;

  end generate gen_hd_ovflow;

  ----------------------------------------------------------------------
  -- Create FIFO Status Signals in the Write Domain
  ----------------------------------------------------------------------

  -- The FIFO status signal is four bits which represents the occupancy
  -- of the FIFO in 16'ths.  To generate this signal we therefore only
  -- need to compare the 4 most significant bits of the write address
  -- pointer with the 4 most significant bits of the read address
  -- pointer.

  -- The 4 most significant bits of the write pointer minus the 4 msb of
  -- the read pointer gives us our FIFO status.
  p_fifo_status : process (wr_clk)
  begin
     if wr_clk'event and wr_clk = '1' then
        if wr_sreset = '1' then
           wr_fifo_status <= "0000" after dly;
        else
           if wr_addr_diff = (wr_addr_diff'range => '0') then
              wr_fifo_status <= "0000" after dly;
           else
              wr_fifo_status(3) <= not wr_addr_diff(11) after dly;
              wr_fifo_status(2) <= not wr_addr_diff(10) after dly;
              wr_fifo_status(1) <= not wr_addr_diff(9) after dly;
              wr_fifo_status(0) <= not wr_addr_diff(8) after dly;
           end if;
        end if;
     end if;
  end process p_fifo_status;

  -----------------------------------------------------------------------------
  -- Memory
  -----------------------------------------------------------------------------
  rd_en_bram <= rd_en and rd_enable_delay2;

  ramgen : RAMB36E1
    generic map (
      DOB_REG                  => 1,
      READ_WIDTH_A             => 9,
      READ_WIDTH_B             => 9,
      RSTREG_PRIORITY_B        => "RSTREG",
      SIM_COLLISION_CHECK      => "ALL",
      SRVAL_B                  => X"000000000000000000",
      WRITE_MODE_A             => "WRITE_FIRST",
      WRITE_MODE_B             => "WRITE_FIRST",
      WRITE_WIDTH_A            => 9,
      WRITE_WIDTH_B            => 9)
    port map (
      ENARDEN                  => VCC,
      CLKARDCLK                => wr_clk,
      RSTRAMARSTRAM            => wr_sreset,
      RSTREGARSTREG            => GND,
      CASCADEINA               => GND,
      REGCEAREGCE              => GND,
      ENBWREN                  => rd_en_bram,
      CLKBWRCLK                => rd_clk,
      RSTRAMB                  => rd_sreset,
      RSTREGB                  => rd_sreset,
      CASCADEINB               => GND,
      REGCEB                   => rd_en_bram,
      INJECTDBITERR            => GND,
      INJECTSBITERR            => GND,
      ADDRARDADDR(15)          => GND,
      ADDRARDADDR(14 downto 3) => std_logic_vector(wr_addr),
      ADDRARDADDR(2 downto 0)  => GND_BUS(2 downto 0),
      ADDRBWRADDR(15)          => GND,
      ADDRBWRADDR(14 downto 3) => std_logic_vector(rd_addr),
      ADDRBWRADDR(2 downto 0)  => GND_BUS(2 downto 0),
      DIADI(31 downto 8)       => GND_BUS(23 downto 0),
      DIADI(7 downto 0)        => wr_data_bram,
      DIBDI                    => GND_BUS,
      DIPADIP(3 downto 1)      => GND_BUS(2 downto 0),
      DIPADIP(0)               => wr_eof_bram(0),
      DIPBDIP                  => GND_BUS(3 downto 0),
      WEA(3 downto 1)          => GND_BUS(2 downto 0),
      WEA(0)                   => wr_en,
      WEBWE                    => GND_BUS(7 downto 0),
      CASCADEOUTA              => open,
      CASCADEOUTB              => open,
      DOADO                    => open,
      DOBDO                    => dob_bram,
      DOPADOP                  => open,
      DOPBDOP                  => dopb_bram,
      ECCPARITY                => open,
      RDADDRECC                => open,
      SBITERR                  => open,
      DBITERR                  => open
  );

  rd_data_bram <= dob_bram(7 downto 0);
  rd_eof_bram  <= dopb_bram(0);

end RTL;
