// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

module iob_counter
  #(
    parameter DATA_W = 32
    )
   (
    input                   clk,
    input                   arst,
    input                   rst,

    input                   en,
    output reg [DATA_W-1:0] data_out
    );

   always @(posedge clk, posedge arst) begin
      if (arst) begin
         data_out <= {DATA_W{1'b0}};
      end else if (rst) begin
         data_out <= {DATA_W{1'b0}};
      end else if (en) begin
         data_out <= data_out + 1'b1;
      end
   end

endmodule
