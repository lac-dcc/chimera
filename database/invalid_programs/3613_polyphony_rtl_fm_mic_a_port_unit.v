// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_port_unit.v
//
// Abstract:
//   Memory Interconnect controller
//
//  Created:
//    8 October 2013
//
// Copyright (c) 2013  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//
// Copyright (c) 2020, Kenji Ishimaru
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  -Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//  -Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

module a_port_unit (
  clk_core,
  rst_x,
  // port side
  i_req,
  i_we,
  i_len,
  o_ack,
  i_strw,
  o_ackw,
  o_strr,
  o_dbr,
  // internal
  i_cack,
  o_wdata_read_end,
  i_wdata_ack,
  i_strr,
  i_dbr
);
`include "polyphony_params.v"
////////////////////////////
// Parameter definition
////////////////////////////
parameter P_SIDLE  = 1'b0;
parameter P_SDOUT  = 1'b1;
////////////////////////////
// I/O definitions
////////////////////////////
input         i_req;          // command request
input         i_we;           // write enable
input  [P_IB_LEN_WIDTH-1:0]
              i_len;          // burst length
output        o_ack;          // command acknowledge
input         i_strw;         // write data strobe
output        o_ackw;         // write data acknowledge
output        o_strr;         // read data strobe
output [P_IB_DATA_WIDTH-1:0] o_dbr;          // read data

input         i_cack;         // command acknowledge
output        o_wdata_read_end;// write data end
input         i_wdata_ack;    // write data acknowledge
input         i_strr;         // read data strobe
input  [P_IB_DATA_WIDTH-1:0] i_dbr;          // read data

input         clk_core;        // system clock
input         rst_x;          // system reset

/////////////////////////
//  register definition
/////////////////////////
reg            r_state;
reg [P_IB_LEN_WIDTH-1:0]
               r_len;
reg            r_strr;
reg [P_IB_DATA_WIDTH-1:0]
               r_dbr;

/////////////////////////
//  wire definition
/////////////////////////
wire                  w_accept;
wire                  w_not_burst;
wire                  w_idle_state;
wire                  w_wdata_ack;
/////////////////////////
//  assign statement
/////////////////////////
assign w_accept = i_req & i_cack & i_we;
assign w_not_burst = !i_we | (i_len == 1);
assign w_idle_state = (r_state == P_SIDLE);
// output port connection
assign o_ack = (i_req) ? i_cack : 1'b1;
assign w_wdata_ack = (i_req) ? i_cack & i_wdata_ack : 1'b1;

assign o_ackw = (w_idle_state) ? w_wdata_ack : i_wdata_ack;
assign o_wdata_read_end = (w_idle_state) ? (i_strw & w_not_burst & i_wdata_ack) :
                                           (i_strw & (r_len == 1) & i_wdata_ack);

assign o_strr = r_strr;
assign o_dbr = r_dbr;

/////////////////////////
//  always statement
/////////////////////////

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_state <= P_SIDLE;
  end else begin
    case (r_state)
      P_SIDLE :
        begin
          if (w_accept & !w_not_burst) begin
            r_state <= P_SDOUT;
          end
        end
      P_SDOUT :
        begin
          if (o_wdata_read_end) begin
            r_state <= P_SIDLE;
          end
        end
      default : r_state <= r_state;
    endcase
  end
end

// set input data
always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
      r_len <= 1;
  end else begin
    if (w_accept) begin
      r_len <= i_len - 1'b1;
    end else if (i_strw & i_wdata_ack) begin
      r_len <= r_len - 1'b1;
    end
  end
end

// read data
always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_strr <= 1'b0;
  end else begin
    r_strr <= i_strr;
  end
end

always @(posedge clk_core) begin
  r_dbr <= i_dbr;
end

endmodule


