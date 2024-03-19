// Simple 2-bit and 4-bit quantizer
// to be replaced with an AGC scheme later
//
// GNSS Firehose
// Copyright (c) 2012 Peter Monta <pmonta@gmail.com>

module quantize(
  input clk,
  input [7:0] x,
  input [7:0] offset,
  input [9:0] random,
  output reg [1:0] y,
  output reg [3:0] y4
);

  wire [17:0] t = {x,random};
  wire [17:0] t2 = t + {{5{offset[7]}},offset,5'd0};

  always @(posedge clk)
    casex (t2)
      18'b00000xxxxxxxxxxxxx: y <= 2'b10;
      18'b11111xxxxxxxxxxxxx: y <= 2'b01;
      18'b0xxxxxxxxxxxxxxxxx: y <= 2'b11;
      default:               y <= 2'b00;
    endcase

  always @(posedge clk)
    if ((t2[17]==0) && (t2[16:15]!=2'b00))
      y4 <= 4'b1111;
    else if ((t2[17]==1) && (t2[16:15]!=2'b11))
      y4 <= 4'b0000;
    else
      y4 <= t2[15:12] + 4'd8;

endmodule
