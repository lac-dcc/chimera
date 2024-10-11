// This program was cloned from: https://github.com/esda-inesc-id/pt-float
// License: MIT License

`timescale 1ns / 1ps

module iob_mask
  #(
    parameter DATA_W = 32
    )
   (
    input [DATA_W-1:0]      maskl_i,
    output reg [DATA_W-1:0] mask_o 
    );

   wire [DATA_W:0]          mask_inv;
   assign mask_inv = $signed({1'b1, {(DATA_W){1'b0}}}) >>> maskl_i;

   integer              i;
   always @* begin
      for (i=0; i < DATA_W; i=i+1) begin
         mask_o[i] = mask_inv[DATA_W-i-1];
      end
   end

endmodule
