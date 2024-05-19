// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

module iob_acc
  #(
    parameter DATA_W = 32
    )
   (
    input                   clk,

    input                   rst,
    input [DATA_W-1:0]      rst_val,

    input                   en,
    input [DATA_W-1:0]      incr,
    output reg [DATA_W-1:0] data_out
    );

   always @(posedge clk, posedge rst) begin
      if (rst) begin
         data_out <= rst_val;
      end else if (en) begin
         data_out <= data_out + incr;
      end
   end

endmodule
