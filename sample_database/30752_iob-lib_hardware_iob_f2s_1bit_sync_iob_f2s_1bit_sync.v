// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

module iob_f2s_1bit_sync
  (
   input  clk,
   input  in,
   output out
   );

   reg [1:0] sync;
   always @(posedge clk, posedge in) begin
      if (in) begin
         sync <= 2'b11;
      end else begin
         sync <= {sync[0], 1'b0};
      end
   end

   assign out = sync[1];

endmodule
