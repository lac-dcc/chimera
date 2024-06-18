// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2022 Moein Khazraee
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

// Language: Verilog-2001

`resetall
`timescale 1 ns / 1 ps
`default_nettype none

/*
 * Simple pipeline of N registers with reset.
 */
module pipe_reg_rst #(
    parameter WIDTH=1, // width of the input and output signals
    parameter N=2, // depth of synchronizer
    parameter INIT=1'b0
)(
    input  wire             clk,
    input  wire             rst,

    input  wire [WIDTH-1:0] in,
    output wire [WIDTH-1:0] out
);

 (* srl_style="register", keep="true", shreg_extract="no" *)
 reg [WIDTH-1:0] sync_reg [N-1:0];

  integer i;

  always @(posedge clk) begin
    if (rst)
      sync_reg[0] <= {WIDTH{INIT}};
    else
      sync_reg[0] <= in;

    for (i = 1; i < N; i = i + 1)
      if (rst)
        sync_reg[i] <= sync_reg[i-1];
      else
        sync_reg[i] <= {WIDTH{INIT}};
  end

  assign out = sync_reg[N-1];

endmodule

`resetall
