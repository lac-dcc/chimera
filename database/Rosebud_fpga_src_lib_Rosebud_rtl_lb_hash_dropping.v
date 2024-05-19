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

module lb_hash_dropping # (
  parameter IF_COUNT        = 3,
  parameter PORT_COUNT      = 5,
  parameter CORE_COUNT      = 8,
  parameter SLOT_COUNT      = 32,
  parameter DATA_WIDTH      = 512,
  parameter RX_LINES_WIDTH  = 13,
  parameter DATA_FIFO_DEPTH = 4096,
  parameter HASH_SEL_OFFSET = 14,
  parameter SLOT_WIDTH      = $clog2(SLOT_COUNT+1),
  parameter CORE_ID_WIDTH   = $clog2(CORE_COUNT),
  parameter INTERFACE_WIDTH = $clog2(IF_COUNT),
  parameter PORT_WIDTH      = $clog2(PORT_COUNT),
  parameter TAG_WIDTH       = (SLOT_WIDTH>5)? SLOT_WIDTH:5,
  parameter ID_TAG_WIDTH    = CORE_ID_WIDTH+TAG_WIDTH,
  parameter STRB_WIDTH      = DATA_WIDTH/8,
  parameter HASH_FIFO_DEPTH = DATA_FIFO_DEPTH/64
) (
  input  wire                               clk,
  input  wire                               rst,

  // Data input and output streams
  input  wire [IF_COUNT*DATA_WIDTH-1:0]     s_axis_tdata,
  input  wire [IF_COUNT*STRB_WIDTH-1:0]     s_axis_tkeep,
  input  wire [IF_COUNT-1:0]                s_axis_tvalid,
  output wire [IF_COUNT-1:0]                s_axis_tready,
  input  wire [IF_COUNT-1:0]                s_axis_tlast,
  input  wire [IF_COUNT*RX_LINES_WIDTH-1:0] s_axis_line_count,

  output wire [IF_COUNT*DATA_WIDTH-1:0]     m_axis_tdata,
  output wire [IF_COUNT*STRB_WIDTH-1:0]     m_axis_tkeep,
  output wire [IF_COUNT*ID_TAG_WIDTH-1:0]   m_axis_tdest,
  output wire [IF_COUNT*PORT_WIDTH-1:0]     m_axis_tuser,
  output wire [IF_COUNT-1:0]                m_axis_tvalid,
  input  wire [IF_COUNT-1:0]                m_axis_tready,
  output wire [IF_COUNT-1:0]                m_axis_tlast,

  // Host command interface
  input  wire [28:0]                        host_cmd,
  input  wire                               host_cmd_for_ints,
  input  wire [31:0]                        host_cmd_wr_data,
  output reg  [31:0]                        host_cmd_rd_data,
  input  wire                               host_cmd_wr_en,

  // Config registers outputs and slots status inputs
  output reg  [CORE_COUNT-1:0]              enabled_cores,
  output reg  [CORE_COUNT-1:0]              slots_flush,
  input  wire [CORE_COUNT*SLOT_WIDTH-1:0]   slot_counts,
  input  wire [CORE_COUNT-1:0]              slot_valids,
  input  wire [CORE_COUNT-1:0]              slot_busys,
  input  wire [CORE_COUNT-1:0]              slot_ins_errs,

  // Request and response to lb_controller
  // selecting target core and asserting pop, and ready desc
  output reg  [CORE_ID_WIDTH-1:0]           selected_core,
  output reg                                desc_pop,
  input  wire [ID_TAG_WIDTH-1:0]            desc_data
);

  localparam HASH_N_DESC = 32+ID_TAG_WIDTH+1;
  ///////////////////////////////////////////////////////////////////////////////
  //////////// Compute and append flow has, plus FIFOs for results //////////////
  ///////////////////////////////////////////////////////////////////////////////
  wire [IF_COUNT*DATA_WIDTH-1:0]    s_axis_tdata_f;
  wire [IF_COUNT*STRB_WIDTH-1:0]    s_axis_tkeep_f;
  wire [IF_COUNT-1:0]               s_axis_tvalid_f;
  wire [IF_COUNT-1:0]               s_axis_tready_f;
  wire [IF_COUNT-1:0]               s_axis_tlast_f;

  wire [IF_COUNT*32-1:0]            rx_hash;
  wire [IF_COUNT*4-1:0]             rx_hash_type;
  wire [IF_COUNT-1:0]               rx_hash_valid;
  // wire [IF_COUNT-1:0]               rx_hash_ready;

  wire [IF_COUNT*32-1:0]            rx_hash_f;
  wire [IF_COUNT*4-1:0]             rx_hash_type_f;
  wire [IF_COUNT-1:0]               rx_hash_valid_f;
  reg  [IF_COUNT-1:0]               rx_hash_ready_f;

  wire [IF_COUNT*CORE_ID_WIDTH-1:0] masked_hash;

  wire [IF_COUNT*HASH_N_DESC-1:0]   hash_n_dest_in;
  reg  [IF_COUNT-1:0]               hash_n_dest_in_v;
  wire [IF_COUNT-1:0]               hash_n_dest_in_ready;

  wire [IF_COUNT*32-1:0]            hash_out;
  wire [IF_COUNT*ID_TAG_WIDTH-1:0]  dest_out;
  wire [IF_COUNT-1:0]               drop_out;
  wire [IF_COUNT-1:0]               hash_n_dest_out_v;
  wire [IF_COUNT-1:0]               hash_n_dest_out_ready;

  genvar p;
  generate
    for (p=0; p<IF_COUNT; p=p+1) begin: hash_for_ints

      rx_hash #(
        .DATA_WIDTH(DATA_WIDTH),
        .KEEP_WIDTH(STRB_WIDTH)
      ) rx_Toeplitz_hash (
        .clk(clk),
        .rst(rst),

        .s_axis_tdata (s_axis_tdata[p*DATA_WIDTH +: DATA_WIDTH]),
        .s_axis_tkeep (s_axis_tkeep[p*STRB_WIDTH +: STRB_WIDTH]),
        .s_axis_tvalid(s_axis_tvalid[p] && s_axis_tready[p]),
        .s_axis_tlast (s_axis_tlast[p]),

        .hash_key(320'h6d5a56da255b0ec24167253d43a38fb0d0ca2bcbae7b30b477cb2da38030f20c6a42b73bbeac01fa),

        .m_axis_hash(rx_hash[p*32 +: 32]),
        .m_axis_hash_type(rx_hash_type[p*4 +: 4]),
        .m_axis_hash_valid(rx_hash_valid[p])
      );

      basic_fifo # (
        .DEPTH(HASH_FIFO_DEPTH),
        .DATA_WIDTH(32+4)
      ) rx_hash_fifo (
        .clk(clk),
        .rst(rst),
        .clear(1'b0),

        .din_valid(rx_hash_valid[p]),
        .din({rx_hash_type[p*4 +: 4], rx_hash[p*32 +: 32]}),
        .din_ready(), // rx_hash_ready[p]),
        // FIFO has more room than 64B packets in the data fifo

        .dout_valid(rx_hash_valid_f[p]),
        .dout({rx_hash_type_f[p*4 +: 4], rx_hash_f[p*32 +: 32]}),
        .dout_ready(rx_hash_ready_f[p]),

        .item_count(),
        .full(),
        .empty()
      );

      // integrate hash_type?
      wire [31:0] sel_hash = rx_hash_f[p*32 +: 32];
      assign masked_hash[p*CORE_ID_WIDTH +: CORE_ID_WIDTH] =
                sel_hash[HASH_SEL_OFFSET +: CORE_ID_WIDTH];

      /// *** DATA FIFO WHILE WAITING FOR HASH AND DESC ALLOCATION *** ///

      axis_fifo # (
          .DEPTH(DATA_FIFO_DEPTH),
          .DATA_WIDTH(DATA_WIDTH),
          .KEEP_ENABLE(1),
          .KEEP_WIDTH(STRB_WIDTH),
          .LAST_ENABLE(1),
          .ID_ENABLE(0),
          .DEST_ENABLE(0),
          .USER_ENABLE(0),
          .RAM_PIPELINE(2),
          .FRAME_FIFO(0)
      ) rx_fifo_inst (
          .clk(clk),
          .rst(rst),

          .s_axis_tdata (s_axis_tdata[p*DATA_WIDTH +: DATA_WIDTH]),
          .s_axis_tkeep (s_axis_tkeep[p*STRB_WIDTH +: STRB_WIDTH]),
          .s_axis_tvalid(s_axis_tvalid[p]),
          .s_axis_tready(s_axis_tready[p]),
          .s_axis_tlast (s_axis_tlast[p]),
          .s_axis_tid   (8'd0),
          .s_axis_tdest (8'd0),
          .s_axis_tuser (1'b0),

          .m_axis_tdata (s_axis_tdata_f[p*DATA_WIDTH +: DATA_WIDTH]),
          .m_axis_tkeep (s_axis_tkeep_f[p*STRB_WIDTH +: STRB_WIDTH]),
          .m_axis_tvalid(s_axis_tvalid_f[p]),
          .m_axis_tready(s_axis_tready_f[p]),
          .m_axis_tlast (s_axis_tlast_f[p]),
          .m_axis_tid   (),
          .m_axis_tdest (),
          .m_axis_tuser (),

          .status_overflow(),
          .status_bad_frame(),
          .status_good_frame()
      );

      /// *** FIFO FOR HASH AND ALLOCATED DESC, WAITING TO BE SENT OUT *** ///

      basic_fifo # (
        .DEPTH(HASH_FIFO_DEPTH),
        .DATA_WIDTH(HASH_N_DESC)
      ) rx_hash_n_desc_fifo (
        .clk(clk),
        .rst(rst),
        .clear(1'b0),

        .din_valid(hash_n_dest_in_v[p]),
        .din(hash_n_dest_in[p*HASH_N_DESC +: HASH_N_DESC]),
        .din_ready(hash_n_dest_in_ready[p]),

        .dout_valid(hash_n_dest_out_v[p]),
        .dout({drop_out[p], hash_out[p*32 +: 32], dest_out[p*ID_TAG_WIDTH +: ID_TAG_WIDTH]}),
        .dout_ready(hash_n_dest_out_ready[p]),

        .item_count(),
        .full(),
        .empty()
      );

      wire [PORT_WIDTH-1:0] port_num = p;

      /// *** ATTACHING HASH AT THE BEGINNING OF THE PACKET *** ///

      header_adder_blocking # (
        .DATA_WIDTH(DATA_WIDTH),
        .STRB_WIDTH(DATA_WIDTH/8),
        .HDR_WIDTH(32),
        .DEST_WIDTH(ID_TAG_WIDTH),
        .USER_WIDTH(PORT_WIDTH)
      ) hash_adder (
        .clk(clk),
        .rst(rst),

        .s_axis_tdata (s_axis_tdata_f[p*DATA_WIDTH +: DATA_WIDTH]),
        .s_axis_tkeep (s_axis_tkeep_f[p*STRB_WIDTH +: STRB_WIDTH]),
        .s_axis_tdest (dest_out[p*ID_TAG_WIDTH +: ID_TAG_WIDTH]),
        .s_axis_tuser (port_num),
        .s_axis_tlast (s_axis_tlast_f[p]),
        .s_axis_tvalid(s_axis_tvalid_f[p]),
        .s_axis_tready(s_axis_tready_f[p]),

        .header       (hash_out[p*32 +: 32]),
        .drop         (drop_out[p]),
        .header_valid (hash_n_dest_out_v[p]),
        .header_ready (hash_n_dest_out_ready[p]),

        .m_axis_tdata (m_axis_tdata[p*DATA_WIDTH +: DATA_WIDTH]),
        .m_axis_tkeep (m_axis_tkeep[p*STRB_WIDTH +: STRB_WIDTH]),
        .m_axis_tdest (m_axis_tdest[p*ID_TAG_WIDTH +: ID_TAG_WIDTH]),
        .m_axis_tuser (m_axis_tuser[p*PORT_WIDTH +: PORT_WIDTH]),
        .m_axis_tlast (m_axis_tlast[p]),
        .m_axis_tvalid(m_axis_tvalid[p]),
        .m_axis_tready(m_axis_tready[p])
      );

    end
  endgenerate

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////// Host command parsing ////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  wire [CORE_ID_WIDTH-1:0]   stat_read_core      = host_cmd[CORE_ID_WIDTH+4-1:4];
  wire [INTERFACE_WIDTH-1:0] stat_read_interface = host_cmd[INTERFACE_WIDTH+4-1:4];
  wire [3:0]                 host_cmd_reg        = host_cmd[3:0];

  reg [CORE_COUNT-1:0]     income_cores;
  reg [RX_LINES_WIDTH-1:0] drop_limit;

  always @ (posedge clk) begin
    if (host_cmd_wr_en)
      case ({host_cmd_for_ints, host_cmd_reg})
        // CORES
        5'h00: begin
          // A core to be reset cannot be an incoming core.
          income_cores  <= income_cores & host_cmd_wr_data[CORE_COUNT-1:0];
          enabled_cores <= host_cmd_wr_data[CORE_COUNT-1:0];
        end
        5'h01: begin
          income_cores  <= host_cmd_wr_data[CORE_COUNT-1:0] & enabled_cores;
        end
        5'h02: begin
          slots_flush   <= host_cmd_wr_data[CORE_COUNT-1:0];
        end
        // INTS
        5'h13: begin
          drop_limit    <= host_cmd_wr_data[RX_LINES_WIDTH-1:0];
        end

        default: begin //for one-cycle signals
          slots_flush  <= {CORE_COUNT{1'b0}};
        end
      endcase
    else begin // for one-cycle signals
          slots_flush  <= {CORE_COUNT{1'b0}};
    end

    if (rst) begin
      income_cores       <= {CORE_COUNT{1'b0}};
      enabled_cores      <= {CORE_COUNT{1'b0}};
      slots_flush        <= {CORE_COUNT{1'b0}};
      drop_limit         <= RX_LINES_WIDTH > 4 ?
                            {4'd7, {(RX_LINES_WIDTH-4){1'b0}}}:
                            {1'b1, {(RX_LINES_WIDTH-1){1'b0}}};
    end
  end

  reg [IF_COUNT-1:0] s_axis_almost_full;
  integer l;
  always @ (posedge clk) begin
    for (l=0;l<IF_COUNT;l=l+1)
      s_axis_almost_full[l] <=
          (s_axis_line_count[l*RX_LINES_WIDTH +: RX_LINES_WIDTH] >= drop_limit);
    if (rst)
      s_axis_almost_full <= {IF_COUNT{1'b0}};
  end

  /// *** STATUS FOR HOST READBACK *** ///
  reg                        selected_port_v_r;
  reg  [INTERFACE_WIDTH-1:0] selected_port_enc_r;
  wire [CORE_COUNT-1:0]      desc_avail;

  reg  [IF_COUNT*32-1:0]     drop_count;

  always @ (posedge clk) begin
    if (rst)
      drop_count <= {IF_COUNT*ID_TAG_WIDTH{1'b0}};
    else if (selected_port_v_r && !slot_busys[selected_core] &&
             !desc_avail[selected_core] && s_axis_almost_full[selected_port_enc_r])
      drop_count[selected_port_enc_r*32 +: 32] <=
        drop_count[selected_port_enc_r*32 +: 32] + 1;
  end

  always @ (posedge clk)
    case ({host_cmd_for_ints, host_cmd_reg})
      // CORES
      5'h00:   host_cmd_rd_data <= enabled_cores;
      5'h01:   host_cmd_rd_data <= income_cores;
      5'h03:   host_cmd_rd_data <= slot_counts[stat_read_core * SLOT_WIDTH +: SLOT_WIDTH];
      // INTS
      5'h12:   host_cmd_rd_data <= drop_count[stat_read_interface*32 +: 32];
      default: host_cmd_rd_data <= 32'hFEFEFEFE;
    endcase

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////// Load balancing policy ///////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////

  /// *** ARBITRATION AND DESC ALLOCATION FOR RX DATA *** ///

  // Arbiter among ports for desc request. The destination core based on hash
  // is registered for next cycle.
  wire [IF_COUNT-1:0] selected_port;
  wire [INTERFACE_WIDTH-1:0] selected_port_enc;
  wire selected_port_v;

  // arbiter results are saved for the next cycle
  reg  [IF_COUNT-1:0] selected_port_r;

  always @ (posedge clk)
    if (rst) begin
      selected_port_r     <= {IF_COUNT{1'b0}};
      selected_port_enc_r <= {INTERFACE_WIDTH{1'b0}};
      selected_port_v_r   <= 1'b0;
    end else begin
      selected_port_v_r   <= selected_port_v;
      selected_port_enc_r <= selected_port_enc;
      if (selected_port_v)
        selected_port_r   <= selected_port;
      else
        selected_port_r   <= {IF_COUNT{1'b0}};
    end

  // we have to wait one cycle for desc availability check, so the same core
  // should not be selected in consecutive cycles. An interface has data when
  // the corresponding hash fifo is valid. Also if next fifo is full there
  // should not be any requests.
  wire [IF_COUNT-1:0] desc_req;
  assign desc_req = rx_hash_valid_f & ~selected_port_r & hash_n_dest_in_ready;

  // Same cycle arbiter, with memory of last result
  simple_arbiter # (.PORTS(IF_COUNT),.ARB_TYPE_ROUND_ROBIN(1)) port_selector (
    .clk(clk),
    .rst(rst),

    .request(desc_req),
    .taken(1'b1), // We always use the results

    .grant(selected_port),
    .grant_valid(selected_port_v),
    .grant_encoded(selected_port_enc)
    );

  // selecting the destination core based on the selected interface and
  // corresponding masked hash
  always @ (posedge clk)
    if (rst)
      selected_core <= {CORE_ID_WIDTH{1'b0}};
    else
      selected_core <= masked_hash[selected_port_enc*CORE_ID_WIDTH +: CORE_ID_WIDTH];

  // Checking for slot availability, collision with intercore desc request and
  // if core is allowed to receive packets from interfaces
  assign desc_avail = slot_valids & income_cores;

  // MSB is to drop packet or not, followed by hash value and finally core desc
  // For now no intercore messages, so !desc_avail means desc was not available
  assign hash_n_dest_in = {IF_COUNT{!desc_avail[selected_core],
                           rx_hash_f[selected_port_enc_r*32 +: 32], desc_data}};

  // if a port is selected and desired core is not being used for intercore messaging,
  // pop the hash from the interface hash fifo, and push the hash
  // and full descriptor with core number into interface hash_n_desc fifo.
  // If core doesn't have descriptor available raise the drop bit and don't pop from
  // core's desc fifo
  always @ (*) begin
    desc_pop         = 1'b0;
    rx_hash_ready_f  = {IF_COUNT{1'b0}};
    hash_n_dest_in_v = {IF_COUNT{1'b0}};

    if (selected_port_v_r && !slot_busys[selected_core])
      if (desc_avail[selected_core]) begin
        desc_pop         = 1'b1;
        rx_hash_ready_f  = selected_port_r;
        hash_n_dest_in_v = selected_port_r;

      end else if (s_axis_almost_full[selected_port_enc_r]) begin
        rx_hash_ready_f  = selected_port_r;
        hash_n_dest_in_v = selected_port_r;
      end

  end

endmodule

`resetall
