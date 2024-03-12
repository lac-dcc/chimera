//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_mu_cif.v
//
// Abstract:
//   Memory interconnect command interface in 3d core
//
//  Created:
//    9 October 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
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

module fm_3d_mu_cif (
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
parameter P_WIDTH = 30;

////////////////////////////
// I/O definitions
////////////////////////////
input         i_bstr;         // input strobe
input  [P_WIDTH-1:0]
              i_bdata;        // input data
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

/////////////////////////
//  wire definition
/////////////////////////
/////////////////////////
//  assign statement
/////////////////////////
assign o_istr = r_bstr;
assign o_idata = r_bdata;
assign o_back = i_iack;
/////////////////////////
//  always statement
/////////////////////////
always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_bstr <= 1'b0;
  end else begin
    if (i_iack) r_bstr <= i_bstr;
  end
end

always @(posedge clk_core) begin
  if (i_iack) r_bdata <= i_bdata;
end


endmodule


