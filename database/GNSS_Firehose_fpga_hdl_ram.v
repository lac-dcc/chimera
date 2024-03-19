// some simple RAMs expressed behaviorally
//
// GNSS Firehose
// Copyright (c) 2012 Peter Monta <pmonta@gmail.com>

//fixme: parameterize these

module dpram(
  input clk_a,
  input [10:0] addr_a,
  input [7:0] data_in_a,
  input we_a,
  input clk_b,
  input [10:0] addr_b,
  output reg [7:0] data_out_b
);

  reg [7:0] mem[0:2047];

  always @(posedge clk_a)
    if (we_a)
      mem[addr_a] <= data_in_a;

  always @(posedge clk_b)
    data_out_b <= mem[addr_b];

endmodule

module dpram_64(
  input clk_a,
  input [5:0] addr_a,
  input [7:0] data_in_a,
  input we_a,
  input clk_b,
  input [5:0] addr_b,
  output reg [7:0] data_out_b
);

  reg [7:0] mem[0:63];

  always @(posedge clk_a)
    if (we_a)
      mem[addr_a] <= data_in_a;

  always @(posedge clk_b)
    data_out_b <= mem[addr_b];

endmodule

module dpram14(
  input clk_a,
  input [13:0] addr_a,
  input [7:0] data_in_a,
  input we_a,
  input clk_b,
  input [13:0] addr_b,
  output reg [7:0] data_out_b
);

  reg [7:0] mem[0:16383];

  always @(posedge clk_a)
    if (we_a)
      mem[addr_a] <= data_in_a;

  always @(posedge clk_b)
    data_out_b <= mem[addr_b];

endmodule

module dpram13_14(
  input clk_a,
  input [12:0] addr_a,
  input [15:0] data_in_a,
  input we_a,
  input clk_b,
  input [13:0] addr_b,
  output [7:0] data_out_b
);

  reg [15:0] mem[0:8191];

  always @(posedge clk_a)
    if (we_a)
      mem[addr_a] <= data_in_a;

  reg [15:0] x;

  always @(posedge clk_b)
    x <= mem[addr_b[13:1]];

  assign data_out_b = addr_b[0] ? x[15:8] : x[7:0];

endmodule

module dpram_9_16(
  input clk_a,
  input [8:0] addr_a,
  input [15:0] data_in_a,
  input we_a,
  input clk_b,
  input [9:0] addr_b,
  output [7:0] data_out_b
);

  reg [15:0] mem[0:511];

  always @(posedge clk_a)
    if (we_a)
      mem[addr_a] <= data_in_a;

  reg [15:0] x;

  always @(posedge clk_b)
    x <= mem[addr_b[9:1]];

  assign data_out_b = addr_b[0] ? x[15:8] : x[7:0];

endmodule

module dpram_10_16(
  input clk_a,
  input [9:0] addr_a,
  input [15:0] data_in_a,
  input we_a,
  input clk_b,
  input [10:0] addr_b,
  output [7:0] data_out_b
);

  reg [15:0] mem[0:1023];

  always @(posedge clk_a)
    if (we_a)
      mem[addr_a] <= data_in_a;

  reg [15:0] x;

  always @(posedge clk_b)
    x <= mem[addr_b[10:1]];

  assign data_out_b = addr_b[0] ? x[15:8] : x[7:0];

endmodule
