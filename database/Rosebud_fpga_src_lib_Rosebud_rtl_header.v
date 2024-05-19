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

// header_valid should be asserted with or before s_axis_tvalid.
// If the ALWAYS_HDR is not set and header_valid is not asserted
// it would do simple forwarding
module header_adder # (
  parameter DATA_WIDTH = 128,
  parameter HDR_WIDTH  = 64,
  parameter DEST_WIDTH = 8,
  parameter USER_WIDTH = 8,
  parameter STRB_WIDTH = DATA_WIDTH/8,
  parameter HDR_STRB   = HDR_WIDTH/8,
  parameter ALWAYS_HDR = 0
)(
  input  wire clk,
  input  wire rst,

  input  wire [DATA_WIDTH-1:0] s_axis_tdata,
  input  wire [STRB_WIDTH-1:0] s_axis_tkeep,
  input  wire [DEST_WIDTH-1:0] s_axis_tdest,
  input  wire [USER_WIDTH-1:0] s_axis_tuser,
  input  wire                  s_axis_tlast,
  input  wire                  s_axis_tvalid,
  output wire                  s_axis_tready,

  input  wire [HDR_WIDTH-1:0]  header,
  input  wire                  header_valid,
  output wire                  header_ready,

  output reg  [DATA_WIDTH-1:0] m_axis_tdata,
  output reg  [STRB_WIDTH-1:0] m_axis_tkeep,
  output wire [DEST_WIDTH-1:0] m_axis_tdest,
  output wire [USER_WIDTH-1:0] m_axis_tuser,
  output reg                   m_axis_tlast,
  output wire                  m_axis_tvalid,
  input  wire                  m_axis_tready
);

  reg [HDR_WIDTH-1:0]  rest_tdata_r;
  reg [HDR_STRB-1:0]   rest_tkeep_r;
  reg [DEST_WIDTH-1:0] s_axis_tdest_r;
  reg [USER_WIDTH-1:0] s_axis_tuser_r;

  wire strb_left = |s_axis_tkeep[STRB_WIDTH-1:STRB_WIDTH-HDR_STRB];
  localparam SAME_WIDTH = (DATA_WIDTH==HDR_WIDTH);

  // State machine. HDR while waiting or sending the header,
  // LST when sending the last piece. MID in between
  localparam HDR = 2'b00;
  localparam MID = 2'b01;
  localparam LST = 2'b10;
  localparam FWD = 2'b11;

  reg [1:0] state;

  always @ (posedge clk)
    if (rst)
      state <= HDR;
    else case (state)
      HDR: if (s_axis_tvalid && m_axis_tready) begin
             if (s_axis_tlast) // one word data
                if (strb_left && (header_valid||ALWAYS_HDR)) state <= LST; else state <= HDR;
             else
                if (header_valid||ALWAYS_HDR) state <= MID; else state <= FWD;
           end
      MID: if (s_axis_tvalid && s_axis_tlast && m_axis_tready) begin
             if (strb_left) state <= LST; else state <= HDR;
           end
      LST: if (m_axis_tready) state <= HDR;
      FWD: if (ALWAYS_HDR||(s_axis_tvalid && s_axis_tlast && m_axis_tready))
             state <= HDR;
    endcase

  // Latch tdest and tuser at first cycle (for last cycle), and always latch tdata and tkeep
  always @ (posedge clk) begin
    if (s_axis_tvalid && s_axis_tready) begin
      rest_tdata_r <= s_axis_tdata[DATA_WIDTH-1:DATA_WIDTH-HDR_WIDTH];
      rest_tkeep_r <= s_axis_tkeep[STRB_WIDTH-1:STRB_WIDTH-HDR_STRB];
    end
    if (state == HDR) begin
      s_axis_tdest_r <= s_axis_tdest;
      s_axis_tuser_r <= s_axis_tuser;
    end
  end

  assign m_axis_tvalid = (state!=LST) ? s_axis_tvalid : 1'b1;

  always @ (*)
    case (state)
      HDR: begin
        if (header_valid||ALWAYS_HDR) begin
          m_axis_tdata = SAME_WIDTH ? header : {s_axis_tdata[DATA_WIDTH-HDR_WIDTH-1:0], header};
          m_axis_tkeep = SAME_WIDTH ? {HDR_STRB{1'b1}} : {s_axis_tkeep[STRB_WIDTH-HDR_STRB-1:0],  {HDR_STRB{1'b1}}};
          m_axis_tlast = (!strb_left) && s_axis_tlast;
        end else begin
          m_axis_tdata = s_axis_tdata;
          m_axis_tkeep = s_axis_tkeep;
          m_axis_tlast = s_axis_tlast;
        end
      end
      MID: begin
          m_axis_tdata = SAME_WIDTH ? rest_tdata_r : {s_axis_tdata[DATA_WIDTH-HDR_WIDTH-1:0], rest_tdata_r};
          m_axis_tkeep = SAME_WIDTH ? rest_tkeep_r : {s_axis_tkeep[STRB_WIDTH-HDR_STRB-1:0],  rest_tkeep_r};
          m_axis_tlast = (!strb_left) && s_axis_tlast;
      end
      LST: begin
          m_axis_tdata = SAME_WIDTH ? rest_tdata_r : {{(DATA_WIDTH-HDR_WIDTH){1'b0}}, rest_tdata_r};
          m_axis_tkeep = SAME_WIDTH ? rest_tkeep_r : {{(STRB_WIDTH-HDR_STRB){1'b0}},  rest_tkeep_r};
          m_axis_tlast = 1'b1;
      end
      FWD:begin
          m_axis_tdata = s_axis_tdata;
          m_axis_tkeep = s_axis_tkeep;
          m_axis_tlast = s_axis_tlast;
      end
    endcase

  assign m_axis_tdest  = (state==HDR) ? s_axis_tdest : s_axis_tdest_r;
  assign m_axis_tuser  = (state==HDR) ? s_axis_tuser : s_axis_tuser_r;
  assign s_axis_tready = (state==LST) ? 1'b0 : m_axis_tready;
  // Accepting header only on the first word, if any
  assign header_ready  = (state==HDR) && s_axis_tvalid && m_axis_tready;

endmodule

module header_remover # (
  parameter DATA_WIDTH = 128,
  parameter HDR_WIDTH  = 64,
  parameter DEST_WIDTH = 8,
  parameter USER_WIDTH = 8,
  parameter STRB_WIDTH = DATA_WIDTH/8,
  parameter HDR_STRB   = HDR_WIDTH/8,
  parameter ALWAYS_HDR = 0
)(
  input  wire clk,
  input  wire rst,

  input  wire                  has_header,

  input  wire [DATA_WIDTH-1:0] s_axis_tdata,
  input  wire [STRB_WIDTH-1:0] s_axis_tkeep,
  input  wire [DEST_WIDTH-1:0] s_axis_tdest,
  input  wire [USER_WIDTH-1:0] s_axis_tuser,
  input  wire                  s_axis_tlast,
  input  wire                  s_axis_tvalid,
  output wire                  s_axis_tready,

  // As long as output is valid header is also valid
  output wire [HDR_WIDTH-1:0]  header,
  output wire                  header_valid,

  output reg  [DATA_WIDTH-1:0] m_axis_tdata,
  output reg  [STRB_WIDTH-1:0] m_axis_tkeep,
  output wire [DEST_WIDTH-1:0] m_axis_tdest,
  output wire [USER_WIDTH-1:0] m_axis_tuser,
  output reg                   m_axis_tlast,
  output reg                   m_axis_tvalid,
  input  wire                  m_axis_tready
);

  reg [HDR_WIDTH-1:0]            header_r;
  reg [DATA_WIDTH-HDR_WIDTH-1:0] rest_tdata_r;
  reg [STRB_WIDTH-HDR_STRB-1:0]  rest_tkeep_r;
  reg [DEST_WIDTH-1:0]           s_axis_tdest_r;
  reg [USER_WIDTH-1:0]           s_axis_tuser_r;

  wire strb_left;
  localparam SAME_WIDTH = (DATA_WIDTH==HDR_WIDTH);

  assign strb_left = SAME_WIDTH ? 1'b0 : |s_axis_tkeep[STRB_WIDTH-1:HDR_STRB];

  // State machine. HDR while waiting or sending the header,
  // LST when sending the last piece. MID in between
  localparam HDR = 2'b00;
  localparam MID = 2'b01;
  localparam LST = 2'b10;
  localparam FWD = 2'b11;

  reg [1:0] state;

  always @ (posedge clk)
    if (rst)
      state <= HDR;
    else case (state)
      HDR: if (s_axis_tvalid && m_axis_tready) begin
             if (s_axis_tlast) // one word data
               state <= HDR;
             else begin
               if (has_header||ALWAYS_HDR)
                 state <= MID;
               else
                 state <= FWD;
              end
           end
      MID: if (s_axis_tvalid && s_axis_tlast && m_axis_tready) begin
             if (strb_left) state <= LST; else state <= HDR;
           end
      LST: if (m_axis_tready) state <= HDR;
      FWD: if ((s_axis_tvalid && s_axis_tlast && m_axis_tready)||ALWAYS_HDR)
             state <= HDR;
    endcase

  // Latch tdest and tuser at first cycle (for last cycle),
  // will not be used if SAME_WIDTH
  // Always latch tdata and tkeep
  always @ (posedge clk) begin
    if (s_axis_tvalid && s_axis_tready) begin
      rest_tdata_r <= SAME_WIDTH ? {DATA_WIDTH{1'b0}} : s_axis_tdata[DATA_WIDTH-1:HDR_WIDTH];
      rest_tkeep_r <= SAME_WIDTH ? {STRB_WIDTH{1'b0}} : s_axis_tkeep[STRB_WIDTH-1:HDR_STRB];
    end
    if (state == HDR) begin
      header_r       <= s_axis_tdata[HDR_WIDTH-1:0];
      s_axis_tdest_r <= s_axis_tdest;
      s_axis_tuser_r <= s_axis_tuser;
    end
  end

  assign header        = (state==HDR) ? s_axis_tdata[HDR_WIDTH-1:0] : header_r;
  assign header_valid  = ((state==HDR) && (has_header||ALWAYS_HDR) && s_axis_tvalid) || (state==MID) || (state==LST);

  always @ (*)
    case (state)
      HDR: begin
        if (has_header||ALWAYS_HDR) begin
         // If there is no data after header, data would be set to single word of all zeros.
         // Otherwise it would be not used and valid is asserted next cycle.
          m_axis_tdata  = SAME_WIDTH ? {DATA_WIDTH{1'b0}} : {{HDR_WIDTH{1'b0}}, s_axis_tdata[DATA_WIDTH-1:HDR_WIDTH]};
          m_axis_tkeep  = SAME_WIDTH ? {STRB_WIDTH{1'b0}} : {{HDR_STRB{1'b0}},  s_axis_tkeep[STRB_WIDTH-1:HDR_STRB]};
          m_axis_tlast  = s_axis_tlast;
          m_axis_tvalid = s_axis_tlast && s_axis_tvalid;
        end else begin
          m_axis_tdata  = s_axis_tdata;
          m_axis_tkeep  = s_axis_tkeep;
          m_axis_tlast  = s_axis_tlast;
          m_axis_tvalid = s_axis_tvalid;
        end
      end
      MID: begin
          m_axis_tdata  = SAME_WIDTH ? s_axis_tdata : {s_axis_tdata[HDR_WIDTH-1:0], rest_tdata_r};
          m_axis_tkeep  = SAME_WIDTH ? s_axis_tkeep : {s_axis_tkeep[HDR_STRB-1:0], rest_tkeep_r};
          m_axis_tlast  = (!strb_left) && s_axis_tlast;
          m_axis_tvalid = s_axis_tvalid;
      end
      LST: begin
          m_axis_tdata  = SAME_WIDTH ? s_axis_tdata : {{HDR_WIDTH{1'b0}}, rest_tdata_r};
          m_axis_tkeep  = SAME_WIDTH ? s_axis_tkeep : {{HDR_STRB{1'b0}},  rest_tkeep_r};
          m_axis_tlast  = 1'b1;
          m_axis_tvalid = 1'b1;
      end
      FWD:begin
          m_axis_tdata  = s_axis_tdata;
          m_axis_tkeep  = s_axis_tkeep;
          m_axis_tlast  = s_axis_tlast;
          m_axis_tvalid = s_axis_tvalid;
      end
    endcase

  assign m_axis_tdest  = (state==HDR) ? s_axis_tdest : s_axis_tdest_r;
  assign m_axis_tuser  = (state==HDR) ? s_axis_tuser : s_axis_tuser_r;
  assign s_axis_tready = ((state==HDR) && (has_header||ALWAYS_HDR)) || (m_axis_tready && (state!=LST));

endmodule

// s_axis_tvalid waits for header_valid
module header_adder_blocking # (
  parameter DATA_WIDTH = 128,
  parameter HDR_WIDTH  = 64,
  parameter DEST_WIDTH = 8,
  parameter USER_WIDTH = 8,
  parameter STRB_WIDTH = DATA_WIDTH/8,
  parameter HDR_STRB   = HDR_WIDTH/8,
  parameter ALWAYS_HDR = 0
)(
  input  wire clk,
  input  wire rst,

  input  wire [DATA_WIDTH-1:0] s_axis_tdata,
  input  wire [STRB_WIDTH-1:0] s_axis_tkeep,
  input  wire [DEST_WIDTH-1:0] s_axis_tdest,
  input  wire [USER_WIDTH-1:0] s_axis_tuser,
  input  wire                  s_axis_tlast,
  input  wire                  s_axis_tvalid,
  output reg                   s_axis_tready,

  input  wire [HDR_WIDTH-1:0]  header,
  input  wire                  drop,
  input  wire                  header_valid,
  output wire                  header_ready,

  output reg  [DATA_WIDTH-1:0] m_axis_tdata,
  output reg  [STRB_WIDTH-1:0] m_axis_tkeep,
  output wire [DEST_WIDTH-1:0] m_axis_tdest,
  output wire [USER_WIDTH-1:0] m_axis_tuser,
  output reg                   m_axis_tlast,
  output reg                   m_axis_tvalid,
  input  wire                  m_axis_tready
);

  reg [HDR_WIDTH-1:0]  rest_tdata_r;
  reg [HDR_STRB-1:0]   rest_tkeep_r;
  reg [DEST_WIDTH-1:0] s_axis_tdest_r;
  reg [USER_WIDTH-1:0] s_axis_tuser_r;

  wire strb_left = |s_axis_tkeep[STRB_WIDTH-1:STRB_WIDTH-HDR_STRB];
  localparam SAME_WIDTH = (DATA_WIDTH==HDR_WIDTH);

  // State machine. HDR while waiting or sending the header,
  // LST when sending the last piece. MID in between
  localparam HDR = 2'b00;
  localparam MID = 2'b01;
  localparam LST = 2'b10;
  localparam DRP = 2'b11;

  reg [1:0] state;

  always @ (posedge clk)
    if (rst)
      state <= HDR;
    else case (state)
      HDR: if (s_axis_tvalid && (header_valid||ALWAYS_HDR)) begin
             if (drop) begin
               if (s_axis_tlast) state <= HDR; else state <= DRP;
             end else if (m_axis_tready) begin
               if (s_axis_tlast) begin // one word data
                 if (strb_left) state <= LST; else state <= HDR;
               end else begin
                 state <= MID;
               end
             end //m_axis_tready
           end
      MID: if (s_axis_tvalid && s_axis_tlast && m_axis_tready) begin
             if (strb_left) state <= LST; else state <= HDR;
           end
      LST: if (m_axis_tready) state <= HDR;
      DRP: if (s_axis_tvalid && s_axis_tlast) state <= HDR;
    endcase

  // Latch tdest and tuser at first cycle (for last cycle), and always latch tdata and tkeep
  always @ (posedge clk) begin
    if (s_axis_tvalid && s_axis_tready) begin
      rest_tdata_r <= s_axis_tdata[DATA_WIDTH-1:DATA_WIDTH-HDR_WIDTH];
      rest_tkeep_r <= s_axis_tkeep[STRB_WIDTH-1:STRB_WIDTH-HDR_STRB];
    end
    if (state == HDR) begin
      s_axis_tdest_r <= s_axis_tdest;
      s_axis_tuser_r <= s_axis_tuser;
    end
  end

  always @ (*)
    case (state)
      HDR: begin
        if (header_valid||ALWAYS_HDR) begin
          m_axis_tdata  = SAME_WIDTH ? header : {s_axis_tdata[DATA_WIDTH-HDR_WIDTH-1:0], header};
          m_axis_tkeep  = SAME_WIDTH ? {HDR_STRB{1'b1}} : {s_axis_tkeep[STRB_WIDTH-HDR_STRB-1:0],  {HDR_STRB{1'b1}}};
          m_axis_tlast  = (!strb_left) && s_axis_tlast && !drop;
          m_axis_tvalid = s_axis_tvalid && !drop;
          s_axis_tready = m_axis_tready || drop;
        end else begin
          m_axis_tdata  = s_axis_tdata;
          m_axis_tkeep  = s_axis_tkeep;
          m_axis_tlast  = 1'b0;
          m_axis_tvalid = 1'b0;
          s_axis_tready = 1'b0;
        end
      end
      MID: begin
          m_axis_tdata  = SAME_WIDTH ? rest_tdata_r : {s_axis_tdata[DATA_WIDTH-HDR_WIDTH-1:0], rest_tdata_r};
          m_axis_tkeep  = SAME_WIDTH ? rest_tkeep_r : {s_axis_tkeep[STRB_WIDTH-HDR_STRB-1:0],  rest_tkeep_r};
          m_axis_tlast  = (!strb_left) && s_axis_tlast;
          m_axis_tvalid = s_axis_tvalid;
          s_axis_tready = m_axis_tready;
      end
      LST: begin
          m_axis_tdata  = SAME_WIDTH ? rest_tdata_r : {{(DATA_WIDTH-HDR_WIDTH){1'b0}}, rest_tdata_r};
          m_axis_tkeep  = SAME_WIDTH ? rest_tkeep_r : {{(STRB_WIDTH-HDR_STRB){1'b0}},  rest_tkeep_r};
          m_axis_tlast  = 1'b1;
          m_axis_tvalid = 1'b1;
          s_axis_tready = 1'b0;
      end
      DRP: begin
          m_axis_tdata  = s_axis_tdata;
          m_axis_tkeep  = s_axis_tkeep;
          m_axis_tlast  = 1'b0;
          m_axis_tvalid = 1'b0;
          s_axis_tready = 1'b1;
      end
    endcase

  assign m_axis_tdest  = (state==HDR) ? s_axis_tdest : s_axis_tdest_r;
  assign m_axis_tuser  = (state==HDR) ? s_axis_tuser : s_axis_tuser_r;
  // Accepting header only on the first word, if any
  assign header_ready  = (state==HDR) && s_axis_tvalid && (m_axis_tready||drop);

endmodule



`resetall
