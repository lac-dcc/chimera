// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2022 Moein Khazraee

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

module lb_controller  # (
  parameter CORE_COUNT      = 8,
  parameter SLOT_COUNT      = 32,
  parameter CTRL_WIDTH      = 32+4,
  parameter LOOPBACK_PORT   = 3,
  parameter LOOPBACK_COUNT  = 1,
  parameter CORE_ID_WIDTH   = $clog2(CORE_COUNT),
  parameter SLOT_WIDTH      = $clog2(SLOT_COUNT+1),
  parameter TAG_WIDTH       = (SLOT_WIDTH>5)? SLOT_WIDTH:5,
  parameter ID_TAG_WIDTH    = CORE_ID_WIDTH+TAG_WIDTH
) (
  input  wire                             clk,
  input  wire                             rst,

  // Control lines to/from cores
  output wire [CTRL_WIDTH-1:0]            ctrl_m_axis_tdata,
  output wire                             ctrl_m_axis_tvalid,
  input  wire                             ctrl_m_axis_tready,
  output wire [CORE_ID_WIDTH-1:0]         ctrl_m_axis_tdest,

  input  wire [CTRL_WIDTH-1:0]            ctrl_s_axis_tdata,
  input  wire                             ctrl_s_axis_tvalid,
  output wire                             ctrl_s_axis_tready,
  input  wire [CORE_ID_WIDTH-1:0]         ctrl_s_axis_tuser,

  // Config registers
  input  wire [CORE_COUNT-1:0]            enabled_cores,
  input  wire [CORE_COUNT-1:0]            slots_flush,

  // Slots status readbacks
  output wire [CORE_COUNT*SLOT_WIDTH-1:0] slot_counts,
  output wire [CORE_COUNT-1:0]            slot_valids,
  output wire [CORE_COUNT-1:0]            slot_busys,
  output wire [CORE_COUNT-1:0]            slot_ins_errs,

  // Core select, and its pop signal assert and descriptor readback
  input  wire [CORE_ID_WIDTH-1:0]         selected_core,
  input  wire                             desc_pop,
  output wire [ID_TAG_WIDTH-1:0]          desc_data
);

  // Separate incoming ctrl messages
  localparam MSG_TYPE_WIDTH = 4;
  localparam DESC_WIDTH     = CTRL_WIDTH-MSG_TYPE_WIDTH;

  wire [MSG_TYPE_WIDTH-1:0] msg_type =
                ctrl_s_axis_tdata[CTRL_WIDTH-1:CTRL_WIDTH-MSG_TYPE_WIDTH];

  wire [MSG_TYPE_WIDTH-1:0] send_out_msg = {(MSG_TYPE_WIDTH){1'b0}};
  wire [MSG_TYPE_WIDTH-1:0] loopback_msg = {{(MSG_TYPE_WIDTH-1){1'b0}},1'b1};

  wire [DESC_WIDTH-1:0]    pkt_done_desc;
  wire [CORE_ID_WIDTH-1:0] pkt_done_src;
  wire                     pkt_done_valid;
  wire                     pkt_done_ready;

  wire [CORE_COUNT*(DESC_WIDTH+CORE_ID_WIDTH)-1:0] pkt_to_core_req;
  wire [CORE_COUNT*SLOT_WIDTH-1:0]                 next_slot;
  wire [CORE_COUNT-1:0] pkt_to_core_valid, pkt_to_core_ready, arb_to_core_ready;

  wire loopback_ready;

  basic_fifo # (
    .DEPTH(8),
    .DATA_WIDTH(CORE_ID_WIDTH+DESC_WIDTH)
  ) pkt_done_fifo (
    .clk(clk),
    .rst(rst),
    .clear(1'b0),

    .din_valid(ctrl_s_axis_tvalid && (msg_type==1)),
    .din({ctrl_s_axis_tuser,ctrl_s_axis_tdata[DESC_WIDTH-1:0]}),
    .din_ready(pkt_done_ready),

    .dout_valid(pkt_done_valid),
    .dout({pkt_done_src, pkt_done_desc}),
    .dout_ready(loopback_ready),

    .item_count(),
    .full(),
    .empty()
  );

  genvar m;
  generate
    for (m=0;m<CORE_COUNT;m=m+1) begin
      wire [CORE_ID_WIDTH-1:0] dest_core = ctrl_s_axis_tdata[24+:CORE_ID_WIDTH];
      basic_fifo # (
        .DEPTH(SLOT_COUNT),
        .DATA_WIDTH(CORE_ID_WIDTH+DESC_WIDTH)
      ) pkt_to_core_fifo (
        .clk(clk),
        .rst(rst),
        .clear(1'b0),

        .din_valid(ctrl_s_axis_tvalid && (msg_type==2) && (dest_core==m)),
        .din({ctrl_s_axis_tuser, ctrl_s_axis_tdata[DESC_WIDTH-1:0]}),
        .din_ready(pkt_to_core_ready[m]),

        .dout_valid(pkt_to_core_valid[m]),
        .dout(pkt_to_core_req[m*(DESC_WIDTH+CORE_ID_WIDTH) +:
                                (DESC_WIDTH+CORE_ID_WIDTH)]),
        .dout_ready(arb_to_core_ready[m] && slot_valids[m] && enabled_cores[m]),

        .item_count(),
        .full(),
        .empty()
      );
    end
  endgenerate

  wire [CORE_ID_WIDTH-1:0] selected_pkt_to_core_src;
  wire [SLOT_WIDTH-1:0]    selected_pkt_to_core_dest_slot;
  wire [DESC_WIDTH-1:0]    selected_pkt_to_core_desc;
  wire                     selected_pkt_to_core_valid,
                           selected_pkt_to_core_ready;
  axis_arb_mux #
  (
    .S_COUNT(CORE_COUNT),
    .DATA_WIDTH(CORE_ID_WIDTH+DESC_WIDTH),
    .KEEP_ENABLE(0),
    .DEST_ENABLE(0),
    .USER_ENABLE(1),
    .USER_WIDTH(SLOT_WIDTH),
    .ARB_TYPE_ROUND_ROBIN(1)
  ) pkt_to_core_arbiter
  (
    .clk(clk),
    .rst(rst),

    .s_axis_tdata(pkt_to_core_req),
    .s_axis_tkeep(),
    .s_axis_tvalid(pkt_to_core_valid & slot_valids & enabled_cores),
    .s_axis_tready(arb_to_core_ready),
    .s_axis_tlast({CORE_COUNT{1'b1}}),
    .s_axis_tid(),
    .s_axis_tdest(),
    .s_axis_tuser(next_slot),

    .m_axis_tdata({selected_pkt_to_core_src, selected_pkt_to_core_desc}),
    .m_axis_tkeep(),
    .m_axis_tvalid(selected_pkt_to_core_valid),
    .m_axis_tready(selected_pkt_to_core_ready),
    .m_axis_tlast(),
    .m_axis_tid(),
    .m_axis_tdest(),
    .m_axis_tuser(selected_pkt_to_core_dest_slot)
  );

  assign ctrl_s_axis_tready = ((msg_type==0)   ||   (msg_type==3)) ||
                              (pkt_done_ready    && (msg_type==1)) ||
                              (pkt_to_core_ready && (msg_type==2)) ;

  // Slot descriptor fifos, addressing msg type 0&3 requests
  wire [CORE_COUNT-1:0]            next_slot_pop;

  reg  [CORE_COUNT-1:0] enq_slot_v;
  reg  [CORE_COUNT-1:0] init_slot_v;
  reg  [SLOT_WIDTH-1:0] input_slot;

  always @ (posedge clk)
    input_slot <= ctrl_s_axis_tdata[16 +: SLOT_WIDTH];

  assign slot_busys = pkt_to_core_valid & arb_to_core_ready;

  genvar i;
  generate
    for (i=0;i<CORE_COUNT;i=i+1) begin
      assign next_slot_pop[i]    = (desc_pop && (selected_core==i)) ||
                                   (slot_busys [i] && enabled_cores[i]);

      // Register valid for better timing closure
      always @ (posedge clk)
        if (rst) begin
          enq_slot_v[i]  <= 1'b0;
          init_slot_v[i] <= 1'b0;
        end else begin
          enq_slot_v[i]  <= ctrl_s_axis_tvalid && (msg_type==0) && (ctrl_s_axis_tuser==i);
          init_slot_v[i] <= ctrl_s_axis_tvalid && (msg_type==3) && (ctrl_s_axis_tuser==i);
        end

      slot_keeper # (
        .SLOT_COUNT(SLOT_COUNT),
        .SLOT_WIDTH(SLOT_WIDTH)
      ) slot_keeper_inst (
        .clk(clk),
        .rst(rst|slots_flush[i]),

        .init_slots(input_slot),
        .init_valid(init_slot_v[i]),

        .slot_in(input_slot),
        .slot_in_valid(enq_slot_v[i]),

        .slot_out(next_slot[i*SLOT_WIDTH +: SLOT_WIDTH]),
        .slot_out_valid(slot_valids[i]),
        .slot_out_pop(next_slot_pop[i]),

        .slot_count(slot_counts[i*SLOT_WIDTH +: SLOT_WIDTH]),
        .enq_err(slot_ins_errs[i])
      );

    end
  endgenerate

  // Load the new desc
  assign desc_data = {selected_core, {(TAG_WIDTH-SLOT_WIDTH){1'b0}},
                      next_slot[selected_core*SLOT_WIDTH +: SLOT_WIDTH]};

  // Assigning looback port
  wire [CORE_ID_WIDTH-1:0] loopback_port;

  if (LOOPBACK_COUNT==1)
    assign loopback_port = LOOPBACK_PORT;
  else if (LOOPBACK_COUNT==2) begin

    reg loopback_port_select_r;

    always @ (posedge clk)
      if (rst)
        loopback_port_select_r <= 1'b0;
      else if (selected_pkt_to_core_valid && selected_pkt_to_core_ready)
        loopback_port_select_r <= ~loopback_port_select_r;

    assign loopback_port = loopback_port_select_r ? (LOOPBACK_PORT+1) : LOOPBACK_PORT;

  end else begin

    reg [$clog2(LOOPBACK_COUNT)-1:0] loopback_port_select_r;

    always @ (posedge clk)
      if (rst)
        loopback_port_select_r <= 0;
      else if (selected_pkt_to_core_valid && selected_pkt_to_core_ready)
        if (loopback_port_select_r==(LOOPBACK_COUNT-1))
          loopback_port_select_r <= 0;
        else
          loopback_port_select_r <= loopback_port_select_r+1;

    assign loopback_port = LOOPBACK_PORT + loopback_port_select_r;

  end

  wire [ID_TAG_WIDTH-1:0] dest_id_slot = {selected_pkt_to_core_desc[24 +: CORE_ID_WIDTH],
                               {(TAG_WIDTH-SLOT_WIDTH){1'b0}}, selected_pkt_to_core_dest_slot};

  wire [DESC_WIDTH-1:0] pkt_to_core_with_port =
              {{(8-CORE_ID_WIDTH){1'b0}}, loopback_port,
              selected_pkt_to_core_desc[23:16], //this is src slot
              {(16-ID_TAG_WIDTH){1'b0}}, dest_id_slot};

  // Arbiter for ctrl messaage output

  // arbiter between pkt done and pkt send to core, addressing msg type 1&2 requests
  wire [CORE_ID_WIDTH-1:0] ctrl_out_dest;
  wire [CTRL_WIDTH-1:0]    ctrl_out_desc;
  wire ctrl_out_valid, ctrl_out_ready;

  reg last_selected;
  reg ctrl_out_select;

  always @ (posedge clk)
    if (rst)
      last_selected <= 1'b0;
    else if (ctrl_out_valid && ctrl_out_ready)
      last_selected <= ctrl_out_select;

  always @ (*)
    if (selected_pkt_to_core_valid && pkt_done_valid)
      ctrl_out_select = ~last_selected;
    else if (selected_pkt_to_core_valid)
      ctrl_out_select = 1'b1;
    else if (pkt_done_valid)
      ctrl_out_select = 1'b0;
    else
      ctrl_out_select = last_selected;

  assign ctrl_out_valid = selected_pkt_to_core_valid || pkt_done_valid;
  assign ctrl_out_dest  = ctrl_out_select ? selected_pkt_to_core_src : pkt_done_src;
  assign ctrl_out_desc  = ctrl_out_select ? {loopback_msg, pkt_to_core_with_port}
                                          : {send_out_msg, pkt_done_desc};
  assign selected_pkt_to_core_ready = ctrl_out_select  && ctrl_out_ready;
  assign loopback_ready             = !ctrl_out_select && ctrl_out_ready;

  // Latching the output to deal with the next stage valid/ready
  reg [CORE_ID_WIDTH-1:0] ctrl_out_dest_r;
  reg [CTRL_WIDTH-1:0]    ctrl_out_desc_r;
  reg                     ctrl_out_valid_r;
  wire                    ctrl_out_ready_r;

  always @ (posedge clk) begin
    if (ctrl_out_valid && (!ctrl_out_valid_r || ctrl_out_ready_r)) begin
      ctrl_out_desc_r  <= ctrl_out_desc;
      ctrl_out_dest_r  <= ctrl_out_dest;
      ctrl_out_valid_r <= 1'b1;
    end else if (ctrl_out_ready_r && !ctrl_out_valid) begin
      ctrl_out_valid_r <= 1'b0;
    end
    if (rst) begin
      ctrl_out_valid_r <= 1'b0;
      ctrl_out_desc_r  <= {CTRL_WIDTH{1'b0}};
      ctrl_out_dest_r  <= {CORE_ID_WIDTH{1'b0}};
    end
  end

  assign ctrl_out_ready = (!ctrl_out_valid_r) || ctrl_out_ready_r;

  assign ctrl_m_axis_tdata  = ctrl_out_desc_r;
  assign ctrl_m_axis_tvalid = ctrl_out_valid_r;
  assign ctrl_m_axis_tdest  = ctrl_out_dest_r;
  assign ctrl_out_ready_r   = ctrl_m_axis_tready;

endmodule

`resetall
