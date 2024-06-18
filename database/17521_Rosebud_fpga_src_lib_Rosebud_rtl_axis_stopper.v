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

// Sits on tvalid/tready/tlast to stop the interface on packet boundaries.
// Adds 2 bits logic for tvalid and tready
module axis_stopper # (
  parameter PORT_COUNT = 4,
  parameter REG_FOR_EN = 0
) (
  input  wire                  clk,
  input  wire                  rst,

  input  wire [PORT_COUNT-1:0] enable,

  input  wire [PORT_COUNT-1:0] s_axis_tvalid,
  input  wire [PORT_COUNT-1:0] s_axis_tlast,
  output wire [PORT_COUNT-1:0] s_axis_tready,

  output wire [PORT_COUNT-1:0] m_axis_tvalid,
  output wire [PORT_COUNT-1:0] m_axis_tlast,
  input  wire [PORT_COUNT-1:0] m_axis_tready
);

  // Register enable input if necessary
  reg [PORT_COUNT-1:0] enable_r;
  generate
    if (REG_FOR_EN) begin

      always @ (posedge clk)
        if (rst)
          enable_r <= {PORT_COUNT{1'b1}};
        else
          enable_r <= enable;

    end else begin

      always @ (*)
          enable_r = enable;

    end
  endgenerate

  // Detect Start of Packet
  reg [PORT_COUNT-1:0] SoP;
  integer i;

  always @ (posedge clk)
    if (rst)
      SoP <= {PORT_COUNT{1'b1}};
    else
      for (i=0;i<PORT_COUNT;i=i+1)
        if (s_axis_tvalid[i] && s_axis_tready[i]) // If there was a transaction
          SoP[i] <= s_axis_tlast[i]; // SoP becomes 1 only after tlast

  // Combinational logic for the outputs.
  // Blocking happens only from start of a packet until enable is re-asserted
  wire [PORT_COUNT-1:0] block = SoP & ~enable_r;

  assign m_axis_tlast  = s_axis_tlast;
  assign m_axis_tvalid = s_axis_tvalid & ~block;
  assign s_axis_tready = m_axis_tready & ~block;

endmodule

`resetall
