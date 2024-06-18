// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

module iob_reg
  #(
    parameter DATA_W = 0,
    parameter RST_VAL = 0
    )
   (
    input                   clk,
    input                   arst,
    input                   rst,
    input                   en,
    input [DATA_W-1:0]      data_in,
    output reg [DATA_W-1:0] data_out
    );

   //prevent width mismatch
   localparam [DATA_W-1:0] RST_VAL_INT = RST_VAL;
   
   always @(posedge clk, posedge arst) begin
      if (arst) begin
         data_out <= RST_VAL_INT;
      end else if (rst) begin
         data_out <= RST_VAL_INT;
      end else if (en) begin
         data_out <= data_in;
      end
   end

endmodule
