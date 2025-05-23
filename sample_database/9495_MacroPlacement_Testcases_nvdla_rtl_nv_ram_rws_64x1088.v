// This program was cloned from: https://github.com/TILOS-AI-Institute/MacroPlacement
// License: BSD 3-Clause "New" or "Revised" License

// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: nv_ram_rws_64x1088.v
module nv_ram_rws_64x1088 (
  clk,
  ra,
  re,
  dout,
  wa,
  we,
  di,
  pwrbus_ram_pd
);
parameter FORCE_CONTENTION_ASSERTION_RESET_ACTIVE=1'b0;
// port list
input clk;
input [5:0] ra;
input re;
output [1087:0] dout;
input [5:0] wa;
input we;
input [1087:0] di;
input [31:0] pwrbus_ram_pd;
//reg and wire list
reg [5:0] ra_d;
wire [1087:0] dout;
reg [1087:0] M [63:0];
always @( posedge clk ) begin
    if (we)
       M[wa] <= di;
end
always @( posedge clk ) begin
    if (re)
       ra_d <= ra;
end
assign dout = M[ra_d];
endmodule
