// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_cmn_dinterface.v
//
// Abstract:
//   FIFO module
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

module fm_cmn_dinterface (
  clk_core,
  rst_x,
  // bus side port
  i_bstr,
  i_bdata,
  o_back,
  // internal port
  o_istr,
  o_idata,
  i_iack
);

parameter P_WIDTH = 36;
////////////////////////////
// I/O definitions
////////////////////////////
input         i_bstr;         // input strobe
input  [P_WIDTH-1:0]
              i_bdata;        // input data (Write Data + BE)
output        o_back;         // output acknowledge

output        o_istr;         // output strobe
output [P_WIDTH-1:0]
              o_idata;        // output data
input         i_iack;         // input acknowledge

input         clk_core;            // system clock
input         rst_x;          // system reset

/////////////////////////
//  register definition
/////////////////////////
// input register
reg           r_bstr;
reg    [P_WIDTH-1:0]
              r_bdata;
reg           r_back;

/////////////////////////
//  wire definition
/////////////////////////
wire          w_empty;
/////////////////////////
//  assign statement
/////////////////////////
assign o_istr = !w_empty;
assign o_back = r_back;
/////////////////////////
//  always statement
/////////////////////////
always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_bstr <= 1'b0;
  end else begin
    r_bstr <= i_bstr;
  end
end

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_back <= 1'b0;
  end else begin
    r_back <= i_iack;
  end
end

always @(posedge clk_core) begin
  r_bdata <= i_bdata;
end

/////////////////////////
//  module instanciation
/////////////////////////
// input data fifo
fm_cmn_ififo #(P_WIDTH) u_ififo (  // Write Data + BE
//fm_cmn_bfifo #(P_WIDTH,3) fifo (  // Write Data + BE
//  .o_dnum(),
  .i_wstrobe(r_bstr),
  .i_dt(r_bdata),
  .o_full(),
  .i_renable(i_iack),
  .o_dt(o_idata),
  .o_empty(w_empty),
  .clk_core(clk_core),
  .rst_x(rst_x)
);

endmodule


