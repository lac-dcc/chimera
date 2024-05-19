// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

/*

Copyright (c) 2019-2023 Moein Khazraee

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

module basic_fifo # (
  parameter DEPTH      = 5,
  parameter DATA_WIDTH = 32,
  parameter INIT_ZERO  = 0,
  parameter ADDR_WIDTH = $clog2(DEPTH)
)(
  input  wire                  clk,
  input  wire                  rst,
  input  wire                  clear,

  input  wire                  din_valid,
  input  wire [DATA_WIDTH-1:0] din,
  output wire                  din_ready,

  output wire                  dout_valid,
  output wire [DATA_WIDTH-1:0] dout,
  input  wire                  dout_ready,

  output wire [ADDR_WIDTH:0]   item_count,
  output wire                  full,
  output wire                  empty
);

reg [DATA_WIDTH-1:0] mem [0:(2**ADDR_WIDTH)-1];
reg [ADDR_WIDTH-1:0] rptr, wptr;
reg [ADDR_WIDTH:0]   item_count_r;

wire enque = din_valid  & din_ready;
wire deque = dout_valid & dout_ready;

always @ (posedge clk)
  if (rst || clear) begin
    wptr <= {ADDR_WIDTH{1'b0}};
    rptr <= {ADDR_WIDTH{1'b0}};
  end else begin
    if (enque) begin
      mem[wptr] <= din;
      wptr      <= wptr + {{(ADDR_WIDTH-1){1'b0}},1'b1};
    end
    if (deque) begin
      rptr      <= rptr + {{(ADDR_WIDTH-1){1'b0}},1'b1};
    end
  end

assign dout = mem[rptr];

// Latching last transaction to know FIFO is full or empty
// Using not version of them to make din_ready and dout_valid registered
reg n_full, n_empty;

always @ (posedge clk)
  if (rst || clear) begin
    // Eventhough din_ready is asserted during rst due to n_full, enque is 0
    n_full  <= 1'b0;
    n_empty <= 1'b0;
  end else if (!n_full && !n_empty) begin // Detecting cycle after rst or clear
    n_full  <= 1'b1;
  end else if (enque ^ deque) begin
    n_full  <= !(((wptr + {{(ADDR_WIDTH-1){1'b0}},1'b1}) == rptr) && enque);
    n_empty <= !(((rptr + {{(ADDR_WIDTH-1){1'b0}},1'b1}) == wptr) && deque);
  end

always @ (posedge clk)
  if (rst || clear)
    item_count_r <= {(ADDR_WIDTH+1){1'b0}};
  else
    if (enque && !deque)
      item_count_r <= item_count_r + {{(ADDR_WIDTH){1'b0}},1'b1};
    else if (!enque && deque)
      item_count_r <= item_count_r - {{(ADDR_WIDTH){1'b0}},1'b1};

assign din_ready  = n_full;
assign dout_valid = n_empty;

// Status outputs, so a not is fine
assign empty = !n_empty;
assign full  = !n_full;

assign item_count = item_count_r;

integer i;
initial begin
  if (INIT_ZERO)
    for (i=0; i<2**ADDR_WIDTH; i=i+1)
      mem[i] <= {DATA_WIDTH{1'b0}};
end

endmodule

`resetall
