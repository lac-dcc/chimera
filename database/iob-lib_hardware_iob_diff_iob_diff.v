// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

module iob_diff
  #(
    parameter DATA_W = 32
    )
   (
    input               clk,
    input               rst,

    input               en,
    input [DATA_W-1:0]  data_in,
    output [DATA_W-1:0] data_out
    );

   reg [DATA_W-1:0]     data_in_reg;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         data_in_reg <= {DATA_W{1'b0}};
      end else if (en) begin
         data_in_reg <= data_in;
      end
   end

   assign data_out = data_in - data_in_reg;

endmodule
