// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

`include "iob_lib.vh"

module iob_edge_detect
  (
   `IOB_INPUT(clk, 1),
   `IOB_INPUT(rst, 1),
   `IOB_INPUT(bit_in, 1),
   `IOB_OUTPUT(detected, 1)
   );

   reg bit_in_reg;
   always @(posedge clk, posedge rst)
     if (rst)
       bit_in_reg <= 1'b0;
     else
       bit_in_reg <= bit_in;

   assign detected = bit_in & ~bit_in_reg;

endmodule
