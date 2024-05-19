// This program was cloned from: https://github.com/trun/fpgaboy
// License: MIT License

`default_nettype none
`timescale 1ns / 1ps

module async_mem2(
  input  wire           clkA,
  input  wire           clkB,
  input  wire [asz-1:0] addrA,
  input  wire [asz-1:0] addrB,
  input  wire           wr_csA,
  input  wire           wr_csB,
  input  wire     [7:0] wr_dataA,
  input  wire     [7:0] wr_dataB,
  output wire     [7:0] rd_dataA,
  output wire     [7:0] rd_dataB
);

  parameter asz = 15;
  parameter depth = 32768;
  
  reg [7:0] mem [0:depth-1];
  
  always @(posedge clkA) begin
    if (wr_csA)
      mem[addrA] <= wr_dataA;
  end
  
  always @(posedge clkB) begin
    if (wr_csB)
      mem[addrB] <= wr_dataB;
  end
  
  assign rd_dataA = mem[addrA];
  assign rd_dataB = mem[addrB];

endmodule
