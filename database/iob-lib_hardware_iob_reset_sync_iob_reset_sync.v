// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

`include "iob_lib.vh"

module iob_reset_sync
  (
   `IOB_INPUT(clk, 1),
   `IOB_INPUT(rst, 1),
   `IOB_OUTPUT(rst_out, 1)
   );

   reg [1:0] sync_reg;
   always @(posedge clk, posedge rst)
     if (rst)
       sync_reg <= 2'b11;
     else
       sync_reg <= {sync_reg[0], 1'b0};

   assign rst_out = sync_reg[1];

endmodule
