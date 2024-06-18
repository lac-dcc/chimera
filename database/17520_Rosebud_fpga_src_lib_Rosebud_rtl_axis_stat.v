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

module axis_stat # (
  parameter KEEP_WIDTH        = 8,
  // If KEEP_ENABLE is not 1, byte_count represents word count
  parameter KEEP_ENABLE       = KEEP_WIDTH>1,
  parameter BYTE_COUNT_WIDTH  = 32,
  parameter FRAME_COUNT_WIDTH = 32
) (
  input  wire                         clk,
  input  wire                         rst,
  input  wire                         clear,

  input  wire [KEEP_WIDTH-1:0]        monitor_axis_tkeep,
  input  wire                         monitor_axis_tvalid,
  input  wire                         monitor_axis_tready,
  input  wire                         monitor_axis_tlast,
  input  wire                         monitor_drop_pulse,

  output reg  [BYTE_COUNT_WIDTH-1:0]  byte_count,
  output reg  [FRAME_COUNT_WIDTH-1:0] frame_count,
  output reg  [FRAME_COUNT_WIDTH-1:0] drop_count,
  output reg  [FRAME_COUNT_WIDTH-1:0] stall_count
);

integer i, bit_cnt;

always @ (posedge clk) begin

  // valid transfer cycle
  if (monitor_axis_tready && monitor_axis_tvalid) begin
    if (KEEP_ENABLE) begin
      bit_cnt = 0;
      for (i = 0; i <= KEEP_WIDTH; i = i + 1) begin
        //bit_cnt = bit_cnt + monitor_axis_tkeep[i];
        if (monitor_axis_tkeep == ({KEEP_WIDTH{1'b1}}) >> (KEEP_WIDTH-i)) bit_cnt = i;
      end
      byte_count <= byte_count + bit_cnt;
    end else begin
      byte_count <= byte_count + 1;
    end

    if (monitor_axis_tlast)
      frame_count <= frame_count + 1;
  end

  if (!monitor_axis_tready && monitor_axis_tvalid)
    stall_count <= stall_count + 1;

  if (monitor_drop_pulse)
    drop_count <= drop_count + 1;


  if (rst || clear) begin
    byte_count  <= {BYTE_COUNT_WIDTH{1'b0}};
    frame_count <= {FRAME_COUNT_WIDTH{1'b0}};
    drop_count  <= {FRAME_COUNT_WIDTH{1'b0}};
    stall_count  <= {FRAME_COUNT_WIDTH{1'b0}};
  end

end

endmodule

`resetall
