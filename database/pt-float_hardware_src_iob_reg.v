// This program was cloned from: https://github.com/esda-inesc-id/pt-float
// License: MIT License

`timescale 1ns / 1ps

module iob_reg
  #(
    parameter DATA_W  = 32,
    parameter RST_VAL = {DATA_W{1'b0}}
    )
   (
    input                   clk_i,
    input                   arst_i,
    input                   cke_i,

    input [DATA_W-1:0]      data_i,
    output reg [DATA_W-1:0] data_o
    );

   always @(posedge clk_i, posedge arst_i) begin
      if (arst_i) begin
         data_o <= RST_VAL;
      end else if (cke_i) begin
         data_o <= data_i;
      end
   end

endmodule
