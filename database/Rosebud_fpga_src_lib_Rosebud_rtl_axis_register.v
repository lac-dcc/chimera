// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2023 Moein Khazraee
Copyright (c) 2014-2018 Alex Forencich

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

module pipe_register #(
  parameter WIDTH = 8,
  // 0 to bypass, 1 for simple buffer, 2 for skid buffer
  parameter TYPE  = 2
) (
  input  wire             clk,
  input  wire             rst,

  input  wire             din_valid,
  input  wire [WIDTH-1:0] din,
  output wire             din_ready,

  output wire             dout_valid,
  output wire [WIDTH-1:0] dout,
  input  wire             dout_ready
);

  if (TYPE > 1) begin // Skid buffer, practically a 2 element FIFO

    // Since dout_valid=!empty and din_ready=!full, their negate version
    // are used to make those signals registered without the not
    reg n_empty, n_full;

    // Two registers to buffer the data
    reg [WIDTH-1:0] dout_reg;
    reg [WIDTH-1:0] tmp_reg;

    always @ (posedge clk) begin
      if (rst) begin
        // Using the error state of both full and empty to detect cycle after reset
        // We don't want the din_ready to stay 1 during rst
        n_full  <= 1'b0; // full  <= 1'b1;
        n_empty <= 1'b0; // empty <= 1'b1;
      end else begin
        if (!n_full) begin // if (full)
          // ** both full and empty can only happen the cycle after reset
          if (dout_ready || !n_empty)
            n_full <= 1'b1; // full <= 1'b0;
        end else if (!n_empty) begin // if (empty)
          if (din_valid)
            n_empty <= 1'b1; // empty <= 1'b0;
        end else begin
          if (din_valid && !dout_ready)
            n_full  <= 1'b0; // full <= 1'b1;
          else if (!din_valid && dout_ready)
            n_empty <= 1'b0; // empty <= 1'b1;
        end
      end
    end

    always @ (posedge clk) begin
      if (!n_full) begin // if (full)
        if (dout_ready)
          dout_reg <= tmp_reg;
      end else begin
        // Can check for din_valid, but without it dout_valid won't be asserted
        if (dout_ready || !n_empty) // (dout_ready || empty)
          dout_reg <= din;
      end

      // Always load tmp_reg from input if there was a transaction,
      // to simplify the overall logic, even if not used
      if (din_valid && din_ready)
        tmp_reg <= din;
    end

    assign dout       = dout_reg;
    assign dout_valid = n_empty;
    assign din_ready  = n_full;

  end else if (TYPE == 1) begin // Simple buffer, inserts bubble cycle

    reg empty, full;
    reg [WIDTH-1:0] dout_reg;

    always @(posedge clk) begin
        if (rst) begin
          empty  <= 1'b0;
          full   <= 1'b0;
        end else if (full && dout_ready) begin
          full   <= 1'b0;
          empty  <= 1'b1;
        end else if (empty) begin
          full   <=  din_valid;
          empty  <= !din_valid; // To become 1 the cycle after rst
        end

        // Can check for din_valid, but without it dout_valid won't be asserted
        if (empty)
            dout_reg <= din;
    end

    assign dout_valid = full;
    assign din_ready  = empty;
    assign dout       = dout_reg;

  end else begin // Bypass

    assign dout       = din;
    assign dout_valid = din_valid;
    assign din_ready  = dout_ready;

  end

endmodule


module axis_register #(
  // Width of AXI stream interfaces in bits
  parameter DATA_WIDTH = 8,
  // Propagate tkeep signal
  parameter KEEP_ENABLE = (DATA_WIDTH>8),
  // tkeep signal width (words per cycle)
  parameter KEEP_WIDTH = ((DATA_WIDTH+7)/8),
  // Propagate tlast signal
  parameter LAST_ENABLE = 1,
  // Propagate tid signal
  parameter ID_ENABLE = 0,
  // tid signal width
  parameter ID_WIDTH = 8,
  // Propagate tdest signal
  parameter DEST_ENABLE = 0,
  // tdest signal width
  parameter DEST_WIDTH = 8,
  // Propagate tuser signal
  parameter USER_ENABLE = 1,
  // tuser signal width
  parameter USER_WIDTH = 1,
  // 0 to bypass, 1 for simple buffer, 2 for skid buffer
  parameter REG_TYPE = 2
) (
  input  wire                  clk,
  input  wire                  rst,

  /*
   * AXI input
   */
  input  wire [DATA_WIDTH-1:0] s_axis_tdata,
  input  wire [KEEP_WIDTH-1:0] s_axis_tkeep,
  input  wire                  s_axis_tvalid,
  output wire                  s_axis_tready,
  input  wire                  s_axis_tlast,
  input  wire [ID_WIDTH-1:0]   s_axis_tid,
  input  wire [DEST_WIDTH-1:0] s_axis_tdest,
  input  wire [USER_WIDTH-1:0] s_axis_tuser,

  /*
   * AXI output
   */
  output wire [DATA_WIDTH-1:0] m_axis_tdata,
  output wire [KEEP_WIDTH-1:0] m_axis_tkeep,
  output wire                  m_axis_tvalid,
  input  wire                  m_axis_tready,
  output wire                  m_axis_tlast,
  output wire [ID_WIDTH-1:0]   m_axis_tid,
  output wire [DEST_WIDTH-1:0] m_axis_tdest,
  output wire [USER_WIDTH-1:0] m_axis_tuser
);

  // Merge AXIS data signals
  localparam KEEP_OFFSET = DATA_WIDTH;
  localparam LAST_OFFSET = KEEP_OFFSET + (KEEP_ENABLE ? KEEP_WIDTH : 0);
  localparam ID_OFFSET   = LAST_OFFSET + (LAST_ENABLE ? 1          : 0);
  localparam DEST_OFFSET = ID_OFFSET   + (ID_ENABLE   ? ID_WIDTH   : 0);
  localparam USER_OFFSET = DEST_OFFSET + (DEST_ENABLE ? DEST_WIDTH : 0);
  localparam WIDTH       = USER_OFFSET + (USER_ENABLE ? USER_WIDTH : 0);

  wire [WIDTH-1:0] s_axis,  m_axis;
  wire             s_valid, m_valid;
  wire             s_ready, m_ready;

  generate
    assign s_axis[DATA_WIDTH-1:0] = s_axis_tdata;
    if (KEEP_ENABLE) assign s_axis[KEEP_OFFSET +: KEEP_WIDTH] = s_axis_tkeep;
    if (LAST_ENABLE) assign s_axis[LAST_OFFSET]               = s_axis_tlast;
    if (ID_ENABLE)   assign s_axis[ID_OFFSET   +: ID_WIDTH]   = s_axis_tid;
    if (DEST_ENABLE) assign s_axis[DEST_OFFSET +: DEST_WIDTH] = s_axis_tdest;
    if (USER_ENABLE) assign s_axis[USER_OFFSET +: USER_WIDTH] = s_axis_tuser;
  endgenerate

  assign m_axis_tdata = m_axis[DATA_WIDTH-1:0];
  assign m_axis_tkeep = KEEP_ENABLE ? m_axis[KEEP_OFFSET +: KEEP_WIDTH] : {KEEP_WIDTH{1'b1}};
  assign m_axis_tlast = LAST_ENABLE ? m_axis[LAST_OFFSET]               : 1'b1;
  assign m_axis_tid   = ID_ENABLE   ? m_axis[ID_OFFSET   +: ID_WIDTH]   : {ID_WIDTH{1'b0}};
  assign m_axis_tdest = DEST_ENABLE ? m_axis[DEST_OFFSET +: DEST_WIDTH] : {DEST_WIDTH{1'b0}};
  assign m_axis_tuser = USER_ENABLE ? m_axis[USER_OFFSET +: USER_WIDTH] : {USER_WIDTH{1'b0}};

  assign s_valid       = s_axis_tvalid;
  assign m_ready       = m_axis_tready;
  assign m_axis_tvalid = m_valid;
  assign s_axis_tready = s_ready;

  // Seperate source and destination to enable assigning to pblocks accross SLR boundary
  pipe_register #(
    .WIDTH(WIDTH),
    .TYPE(REG_TYPE)
  ) internal_register (
    .clk        (clk),
    .rst        (rst),

    .din        (s_axis),
    .din_valid  (s_valid),
    .din_ready  (s_ready),

    .dout       (m_axis),
    .dout_valid (m_valid),
    .dout_ready (m_ready)
  );

endmodule

`resetall
