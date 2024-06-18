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

module simple_sync_sig # (
  parameter RST_VAL = 1'b0,
  parameter WIDTH   = 1
) (
  input  wire dst_clk,
  input  wire dst_rst,
  input  wire [WIDTH-1:0] in,
  output wire [WIDTH-1:0] out
);

(* KEEP = "TRUE" *) reg [WIDTH-1:0] sync_reg_1;
(* KEEP = "TRUE" *) reg [WIDTH-1:0] sync_reg_2;

always @ (posedge dst_clk)
  if (dst_rst) begin
    sync_reg_1 <= {WIDTH{RST_VAL}};
    sync_reg_2 <= {WIDTH{RST_VAL}};
  end else begin
    sync_reg_1 <= in;
    sync_reg_2 <= sync_reg_1;
  end

assign out = sync_reg_2;

endmodule

`resetall
