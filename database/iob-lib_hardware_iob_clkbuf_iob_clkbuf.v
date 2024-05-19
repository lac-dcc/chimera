// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

`include "iob_lib.vh"

module iob_clkbuf
  (
   `IOB_INPUT(clk_in, 1),
   `IOB_OUTPUT(clk_out, 1)
   );

`ifdef XILINX
   BUFG BUFG_inst
     (
      .I(clk_in),
      .O(clk_out)
      );
`else
   assign clk_out = clk_in;
`endif

endmodule
