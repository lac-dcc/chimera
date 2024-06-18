// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2021 Moein Khazraee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

module axis_dma # (
  parameter DATA_WIDTH       = 64,
  parameter ADDR_WIDTH       = 16,
  parameter LEN_WIDTH        = 16,
  parameter DEST_WIDTH_IN    = 8,
  parameter USER_WIDTH_OUT   = 8,
  parameter DEST_WIDTH_OUT   = 2,
  parameter USER_WIDTH_IN    = 2,
  parameter MAX_PKT_HDR_SIZE = 128,
  parameter HDR_ADDR_BITS    = $clog2(MAX_PKT_HDR_SIZE),
  parameter HDR_ADDR_WIDTH   = ADDR_WIDTH,
  parameter HDR_MSB_WIDTH    = HDR_ADDR_WIDTH-HDR_ADDR_BITS,
  parameter STRB_WIDTH       = (DATA_WIDTH/8),
  parameter MASK_BITS        = $clog2(STRB_WIDTH)
)(
  input  wire                      clk,
  input  wire                      rst,

  // ---------------- AXIS INTERFACE --------------- //
  // Incoming data
  input  wire [DATA_WIDTH-1:0]     s_axis_tdata,
  input  wire [STRB_WIDTH-1:0]     s_axis_tkeep,
  input  wire                      s_axis_tvalid,
  output wire                      s_axis_tready,
  input  wire                      s_axis_tlast,
  input  wire [DEST_WIDTH_IN-1:0]  s_axis_tdest,
  input  wire [USER_WIDTH_IN-1:0]  s_axis_tuser,

  input  wire [ADDR_WIDTH-1:0]     wr_base_addr,
  input  wire [HDR_MSB_WIDTH-1:0]  hdr_wr_addr_msb,
  // input  wire [HDR_ADDR_WIDTH-1:0] slot_desc_addr,
  input  wire                      hdr_en,

  // Outgoing data
  output wire [DATA_WIDTH-1:0]     m_axis_tdata,
  output wire [STRB_WIDTH-1:0]     m_axis_tkeep,
  output wire                      m_axis_tvalid,
  input  wire                      m_axis_tready,
  output wire                      m_axis_tlast,
  output wire [DEST_WIDTH_OUT-1:0] m_axis_tdest,
  output wire [USER_WIDTH_OUT-1:0] m_axis_tuser,

  // -------------- MEMORY INTERFACE -------------- //
  // Write port
  output wire                      mem_wr_en,
  output wire [STRB_WIDTH-1:0]     mem_wr_strb,
  output wire [ADDR_WIDTH-1:0]     mem_wr_addr,
  output wire [DATA_WIDTH-1:0]     mem_wr_data,
  output wire                      mem_wr_last,
  input  wire                      mem_wr_ready,

  output wire                      mem_hdr_wr_en,
  output wire [HDR_ADDR_WIDTH-1:0] mem_hdr_wr_addr,

  // Read port
  output wire                      mem_rd_en,
  output wire [ADDR_WIDTH-1:0]     mem_rd_addr,
  output wire                      mem_rd_last,
  input  wire                      mem_rd_ready,

  input  wire [DATA_WIDTH-1:0]     mem_rd_data,
  input  wire                      mem_rd_data_v,
  output wire                      mem_rd_data_ready,

  // ---------------- DESCRIPTORS ----------------- //
  // Output receive descriptor
  output wire                      recv_desc_valid,
  input  wire                      recv_desc_ready,
  output wire [ADDR_WIDTH-1:0]     recv_desc_addr,
  output wire [LEN_WIDTH-1:0]      recv_desc_len,
  output wire [DEST_WIDTH_IN-1:0]  recv_desc_tdest,
  output wire [USER_WIDTH_IN-1:0]  recv_desc_tuser,
  // output wire [HDR_ADDR_WIDTH-1:0] recv_desc_desc_addr,

  // Input send descriptor
  input  wire                      send_desc_valid,
  output wire                      send_desc_ready,
  input  wire [ADDR_WIDTH-1:0]     send_desc_addr,
  input  wire [LEN_WIDTH-1:0]      send_desc_len,
  input  wire [DEST_WIDTH_OUT-1:0] send_desc_tdest,
  input  wire [USER_WIDTH_OUT-1:0] send_desc_tuser,

  output wire                      pkt_sent
);

  ////////////////////////////////////////////////////////////////////////////////
  ///////////////////////// WRITE FROM AXIS TO MEM ///////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////

  // Write state machine
  localparam WR_IDLE = 1'b0;
  localparam WR_PROC = 1'b1;
  reg wr_state_n, wr_state_r;

  // wr signals
  reg [ADDR_WIDTH-1:0]     wr_start_addr;
  reg [USER_WIDTH_IN-1:0]  wr_tuser;
  reg [MASK_BITS:0]        wr_offset;
  reg [DEST_WIDTH_IN-1:0]  wr_tdest;
  reg                      wr_strb_left;
  reg [HDR_MSB_WIDTH-1:0]  hdr_msb_r;
  wire [ADDR_WIDTH-1:0]    wr_addr;
  // reg [HDR_ADDR_WIDTH-1:0] desc_addr_r;
  reg                      hdr_en_r;
  reg                      wr_data_en;
  reg                      wr_last;
  wire                     wr_last_pkt;
  wire                     wr_ready;
  wire                     extra_cycle;
  reg                      extra_cycle_r;

  always @ (*) begin
    wr_state_n = wr_state_r;
    if ((wr_state_r == WR_IDLE) && s_axis_tvalid && s_axis_tready)
      wr_state_n = WR_PROC;
    else if ((wr_state_r == WR_PROC) && wr_last_pkt && wr_ready && (!(s_axis_tvalid && s_axis_tready)))
      wr_state_n = WR_IDLE;
  end

  always @ (posedge clk)
    if (rst)
      wr_state_r <= WR_IDLE;
    else
      wr_state_r <= wr_state_n;

  // First packet is when there is new data and can be accpted. It can happen if
  // there was no data last cycle, or if there was and it was last data.
  // (Timing wise it is logic between 4 registers and wr_ready and s_axis_tvalid)
  wire latch_info = (((wr_state_r==WR_IDLE) || (wr_last_pkt && wr_ready))
                      && s_axis_tvalid && s_axis_tready);

  // Latch metadata in first cycle
  always @ (posedge clk) begin
    if (latch_info) begin
      wr_start_addr <= wr_base_addr;
      hdr_msb_r     <= hdr_wr_addr_msb;
      // desc_addr_r   <= slot_desc_addr;
      hdr_en_r      <= hdr_en;
      wr_offset     <= {1'b1,{MASK_BITS{1'b0}}} - {1'b0, wr_base_addr[MASK_BITS-1:0]};
      wr_tdest      <= s_axis_tdest;
      wr_tuser      <= s_axis_tuser;
    end
    // Header send stops after reaching the 128 byte address cap for the first time
    else if (wr_data_en && wr_ready && (&wr_addr[HDR_ADDR_BITS-1:MASK_BITS]))
      hdr_en_r      <= 1'b0;

    // To improve timing do part of logic in the previous cycle
    if (extra_cycle && wr_data_en && wr_ready)
      wr_strb_left <= 1'b0;
    else if (latch_info)
      wr_strb_left <= |(s_axis_tkeep >> ({1'b1,{MASK_BITS{1'b0}}} -
                                         {1'b0, wr_base_addr[MASK_BITS-1:0]}));
    else if (s_axis_tvalid && s_axis_tready)
      wr_strb_left <= |(s_axis_tkeep >> wr_offset);

    if (rst)
      hdr_en_r      <= 1'b0;
  end

  // two_stage pipeline register for the input from AXIS
  reg  [DATA_WIDTH-1:0] wr_data_1;
  reg  [DATA_WIDTH-1:0] wr_data_2;
  reg  [STRB_WIDTH-1:0] wr_strb_1;
  reg  [STRB_WIDTH-1:0] wr_strb_2;

  assign extra_cycle = wr_last && wr_strb_left;

  // Move forward the pipeline when data is received and can be sent
  // Extra cycle_r is when the data is read from second stage as extra
  // cycle.
  always @ (posedge clk) begin
    // Stall if in extra cycle, and devalidate the first stage
    if (extra_cycle && wr_data_en && wr_ready) begin
      wr_strb_1 <= {STRB_WIDTH{1'b0}};
      wr_last   <= 1'b0;
    end else if (s_axis_tvalid && s_axis_tready) begin
      wr_data_1 <= s_axis_tdata;
      wr_strb_1 <= s_axis_tkeep;
      wr_last   <= s_axis_tlast;
    end

    // If data is accepted
    if (wr_data_en && wr_ready) begin
      wr_data_2     <= wr_data_1;
      extra_cycle_r <= extra_cycle;
    end

    // invalidate the data in last stage
    if (wr_last_pkt && wr_ready)
      wr_strb_2 <= {STRB_WIDTH{1'b0}};
    else if (wr_data_en && wr_ready)
      wr_strb_2 <= wr_strb_1;

    if (rst) begin
      wr_last       <= 1'b0;
      extra_cycle_r <= 1'b0;
      wr_strb_1     <= {STRB_WIDTH{1'b0}};
      wr_strb_2     <= {STRB_WIDTH{1'b0}};
    end
  end

  // If data was accepted it can be written the next cycle.
  // If there is an extra cycle it would be valid after current data is taken.
  // If current data is not taken enable stays asserted.
  always @ (posedge clk)
    if (rst)
      wr_data_en <= 1'b0;
    else
      wr_data_en <= (s_axis_tvalid && s_axis_tready) ||
                    (wr_data_en && wr_ready && extra_cycle) ||
                    (wr_data_en && (~wr_ready));

  // If we have an extra cycle we don't accept new data. Also if
  // descriptor is blocked we don't accept last word of an incoming packet.
  wire desc_block = recv_desc_valid && !recv_desc_ready;
  assign s_axis_tready = wr_ready && (!extra_cycle) &&
                        (!(s_axis_tlast && desc_block));

  // wr_first_pkt aligns with wr_data_1, which is one cycle after latch_info.
  // Also if data cannot go out it keeps its first_pkt state
  reg wr_first_pkt;
  always @ (posedge clk)
    if (rst)
      wr_first_pkt <= 1'b0;
    else
      wr_first_pkt <= latch_info || (wr_first_pkt && !wr_ready);

  // If there is need for extra cycle the wr_last_pkt would be asserted then
  // (Timing wise it is a logic between 4 registers)
  assign wr_last_pkt = wr_data_en && ((wr_last && !extra_cycle) || (extra_cycle_r));

  // Calculating the write address
  reg  [ADDR_WIDTH-1:0] next_wr_addr;
  always @ (posedge clk)
    if (wr_data_en && wr_ready)
      next_wr_addr <= wr_addr + STRB_WIDTH;

  wire [ADDR_WIDTH-1:0] wr_aligned_addr = {wr_start_addr[ADDR_WIDTH-1:MASK_BITS],{MASK_BITS{1'b0}}};
  assign wr_addr = wr_first_pkt ? wr_aligned_addr : next_wr_addr;

  // count number of bytes in the last data
  // It can accept zeros in the input strb
  reg [$clog2(STRB_WIDTH):0] one_count;
  integer i;
  always @ (*) begin
    one_count = STRB_WIDTH;
    for (i=STRB_WIDTH-1; i>=0; i=i-1)
      if (!mem_wr_strb[i])
        one_count = one_count-1;
  end

  // Calculate total bytes
  reg  [LEN_WIDTH-1:0] wr_pkt_len;
  wire [LEN_WIDTH-1:0] next_wr_pkt_len = wr_first_pkt ? one_count : wr_pkt_len + one_count;

  always @ (posedge clk)
    if (rst)
        wr_pkt_len <= 0;
    else if (wr_data_en && wr_ready)
        wr_pkt_len <= next_wr_pkt_len;

  // Remember a descriptor is ready and is waiting for ready
  reg desc_late_write;
  always @ (posedge clk) begin
    if (rst)
      desc_late_write <= 1'b0;
    else if (wr_last_pkt && wr_ready && desc_block)
      desc_late_write <= 1'b1;
    else if (recv_desc_ready)
      desc_late_write <= 1'b0;
  end

  // Latching the descriptor
  reg [LEN_WIDTH-1:0]      recv_desc_len_r;
  reg [DEST_WIDTH_IN-1:0]  recv_desc_tdest_r;
  reg [USER_WIDTH_IN-1:0]  recv_desc_tuser_r;
  reg [ADDR_WIDTH-1:0]     recv_desc_addr_r;
  // reg [HDR_ADDR_WIDTH-1:0] recv_desc_desc_addr_r;
  reg                      recv_desc_v_r;

  always @ (posedge clk) begin
    if ((wr_last_pkt && wr_ready && (!desc_block))
        || (desc_late_write && recv_desc_ready)) begin
      recv_desc_len_r   <= next_wr_pkt_len;
      recv_desc_tdest_r <= wr_tdest;
      recv_desc_tuser_r <= wr_tuser;
      recv_desc_addr_r  <= wr_start_addr;
      // recv_desc_desc_addr_r <= desc_addr_r;
      recv_desc_v_r     <= 1'b1;
    end else if (recv_desc_v_r && recv_desc_ready)
      recv_desc_v_r     <= 1'b0;
    if (rst)
      recv_desc_v_r     <= 1'b0;
  end

  assign recv_desc_valid = recv_desc_v_r;
  assign recv_desc_len   = recv_desc_len_r;
  assign recv_desc_tdest = recv_desc_tdest_r;
  assign recv_desc_tuser = recv_desc_tuser_r;
  assign recv_desc_addr  = recv_desc_addr_r;
  // assign recv_desc_desc_addr = recv_desc_desc_addr_r;

  assign mem_wr_en   = wr_data_en;
  assign mem_wr_addr = wr_addr;
  assign mem_wr_last = wr_last_pkt;
  assign wr_ready    = mem_wr_ready;
  assign mem_wr_data = {wr_data_1,wr_data_2} >> {wr_offset,3'd0};
  assign mem_wr_strb = {wr_strb_1,wr_strb_2} >> wr_offset;

  assign mem_hdr_wr_en   = hdr_en_r && wr_data_en;
  assign mem_hdr_wr_addr = {hdr_msb_r,wr_addr[HDR_ADDR_BITS-1:0]};

  ////////////////////////////////////////////////////////////////////////////////
  ///////////////////////// READ FROM MEM TO AIXS ////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////

  // State machine to have an init state between idle and processing to calculate
  // offset and so.
  localparam RD_IDLE = 2'b00;
  localparam RD_INIT = 2'b01;
  localparam RD_PROC = 2'b10;
  localparam RD_ERR  = 2'b11;

  reg [1:0] rd_state_r, rd_state_n;
  reg       to_drop;

  always @ (posedge clk)
    if (rst)
      rd_state_r <= RD_IDLE;
    else
      rd_state_r <= rd_state_n;

  always @ (*) begin
    rd_state_n = rd_state_r;
    case (rd_state_r)
      RD_IDLE: if (send_desc_valid) rd_state_n = RD_INIT;
      RD_INIT: if (to_drop) rd_state_n = RD_IDLE; else rd_state_n = RD_PROC;
      RD_PROC: if (pkt_sent) rd_state_n = RD_IDLE;
      RD_ERR:  rd_state_n = RD_ERR;
    endcase
  end

  // Parsing the descriptor
  reg [ADDR_WIDTH-1:0]     send_base_addr;
  reg [LEN_WIDTH-1:0]      send_len;
  reg [DEST_WIDTH_OUT-1:0] send_tdest;
  reg [USER_WIDTH_OUT-1:0] send_tuser;
  reg [MASK_BITS:0]        remainder_bytes;


  always @ (posedge clk) begin
    if (send_desc_ready && send_desc_valid) begin
      send_base_addr  <= send_desc_addr;
      send_len        <= send_desc_len;
      send_tdest      <= send_desc_tdest;
      send_tuser      <= send_desc_tuser;
      // Lower bits of base_addr and send_len
      remainder_bytes <= send_desc_addr[MASK_BITS-1:0] +
                         send_desc_len[MASK_BITS-1:0];
      to_drop         <= (send_desc_len==0);
    end
    if (rst) begin
      to_drop         <= 1'b0;
    end
  end

  assign send_desc_ready = (rd_state_r == RD_IDLE);
  assign pkt_sent        = (to_drop&&(rd_state_r==RD_INIT)) ||
                    (m_axis_tvalid && m_axis_tready && m_axis_tlast);

  // Calculating offset, number of words and final tkeep in RD_INIT state
  reg [ADDR_WIDTH-1:0]          aligned_rd_addr;
  reg [MASK_BITS-1:0]           rd_offset;
  reg [LEN_WIDTH-MASK_BITS-1:0] rd_req_word_count;
  reg [LEN_WIDTH-MASK_BITS-1:0] rd_recv_word_count;
  reg [STRB_WIDTH-1:0]          rd_final_tkeep;
  reg                           rd_len_is_int;

  wire [1:0] extra_words = ((remainder_bytes == 0)||to_drop) ? 2'd0 :
                           (remainder_bytes[MASK_BITS] + 2'd1);

  // number of 0s in last tkeep. 0 becomes 0 due to dropping the MSB.
  wire [MASK_BITS-1:0] tkeep_zeros  = STRB_WIDTH - send_len[MASK_BITS-1:0];

  // Initialize offset, word_count, final tkeep and strat address. Also when
  // a data was recieved address and remainig words are updated.
  always @ (posedge clk) begin
    if (rd_state_r==RD_IDLE) begin
      rd_offset          <= 0;
      rd_req_word_count  <= 0;
      rd_recv_word_count <= 0;
      rd_final_tkeep     <= {STRB_WIDTH{1'b1}};
      rd_len_is_int      <= 1'b1;
    end
    else if (rd_state_r==RD_INIT) begin
      rd_offset          <= send_base_addr[MASK_BITS-1:0];
      rd_req_word_count  <= send_len[LEN_WIDTH-1:MASK_BITS] + extra_words;
      rd_recv_word_count <= send_len[LEN_WIDTH-1:MASK_BITS] + extra_words;
      rd_final_tkeep     <= {{(STRB_WIDTH-1){1'b0}},{STRB_WIDTH{1'b1}}} >> tkeep_zeros;
      aligned_rd_addr    <= {send_base_addr[ADDR_WIDTH-1:MASK_BITS],{MASK_BITS{1'b0}}};
      rd_len_is_int      <= (send_len[MASK_BITS-1:0]==0);
    end
    else begin
      if (mem_rd_en && mem_rd_ready) begin
        rd_req_word_count  <= rd_req_word_count - 1;
        aligned_rd_addr    <= aligned_rd_addr + STRB_WIDTH;
      end
      if (mem_rd_data_v && mem_rd_data_ready)
        rd_recv_word_count <= rd_recv_word_count - 1;
    end
    if (rst) begin
      rd_offset          <= 0;
      rd_req_word_count  <= 0;
      rd_recv_word_count <= 0;
      rd_final_tkeep     <= {STRB_WIDTH{1'b1}};
      rd_len_is_int      <= 1'b1;
    end
  end

  // During processing there are 2 pipeline registers for data and output data
  // is selected based on offset. data left is for last 2 words in pipe.
  // Depending on the offset and the remainder bytes they should be transfered
  // in one or two.
  reg [1:0] data_left;
  always @ (posedge clk)
    if (rst)
      data_left <= 2'd0;
    else if (rd_state_r != RD_PROC)
      data_left <= 2'd0;
    else if ((rd_recv_word_count == 1) && mem_rd_data_ready && mem_rd_data_v) begin
      // Both pipeline stages are full
      if (rd_offset == 0)
        data_left <= 2'd2;
      // If len was multiple of word width, offset would cover the data in
      // the last pipeline stage and data can be read out in single cycle
      else if (rd_len_is_int)
        data_left <= 2'd1;
      // If there was overflow from offset and LSB of len, offset would cover
      // the data in the last pipeline stage
      else if (remainder_bytes[MASK_BITS])
        data_left <= 2'd1;
      // There is more data than offset in the second pipeline stage
      else
        data_left <= 2'd2;
    // If data/empty register is sent out reduce remaining
    end else if ((data_left>2'd0) && (!(m_axis_tvalid && !m_axis_tready)))
        data_left <= data_left - 2'd1;

  // 2 pipe registers with valid. There is no need for individual ready signals.
  reg  [DATA_WIDTH-1:0] read_reg_1;
  reg  [DATA_WIDTH-1:0] read_reg_2;
  reg read_reg_1_v, read_reg_2_v;
  always @ (posedge clk) begin
    // since mem_rd_data_ready is high when m_axis_tready,
    // is asserted, it means the data can go out and pipe can go forward
    // This covers when mem is ready and axis is ready or not. Also if
    // its the first word coming in.
    if (mem_rd_data_v && mem_rd_data_ready) begin
      read_reg_1   <= mem_rd_data;
      read_reg_1_v <= 1'b1;
      read_reg_2   <= read_reg_1;
      read_reg_2_v <= read_reg_1_v;
    end
    // After loading data is done and the last 1 or 2 words are being sent
    // (based on the rx_offset and remainder_bytes two registers might be
    // 1 or 2 data values), the pipe is being emptied if it's not blocked by axis
    // This case does not depend on input memory any more and just waits to
    // be emptied over axis.
    else if ((data_left!=2'd0) && (!(m_axis_tvalid && !m_axis_tready))) begin
      read_reg_1_v <= 1'b0;
      read_reg_2   <= read_reg_1;
      // If there are 2 words read_reg_2 stays valid for another cycle
      // otherwise both registers become not valid
      read_reg_2_v <= (data_left==2'd2);
    end
    // If data was sent but no new data received we deassert the valid
    // of second stage not to repeat the same data. We cannot move the
    // pipe forward since in case of having offset we need both
    // registers to be valid for send and cannot insert a non_valid gap.
    // This is case is when mem is not ready but axis is.
    else if (m_axis_tvalid && m_axis_tready) begin
      read_reg_2_v <= 1'b0;
    end
    // If both of mem and axis are not ready there is no change.
    if (rst) begin
      read_reg_1_v <= 1'b0;
      read_reg_2_v <= 1'b0;
    end
  end

  // If I'm not ready to get data then I deassert my address valid too.
  // The sender module has to keep its valid and data until ready!
  assign mem_rd_data_ready = !(m_axis_tvalid && (!m_axis_tready));
  assign mem_rd_en         = (rd_req_word_count > 0);// && mem_rd_data_ready;
  assign mem_rd_addr       = aligned_rd_addr;
  assign mem_rd_last       = (rd_req_word_count == 1);

  assign m_axis_tdata  = {read_reg_1, read_reg_2} >> {rd_offset, 3'd0};
  assign m_axis_tvalid = read_reg_2_v;
  assign m_axis_tlast  = (data_left == 2'd1);
  assign m_axis_tkeep  = m_axis_tlast ? rd_final_tkeep : {STRB_WIDTH{1'b1}};
  assign m_axis_tdest  = send_tdest;
  assign m_axis_tuser  = send_tuser;

endmodule

`resetall
