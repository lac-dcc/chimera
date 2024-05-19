// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

/*****************************************************************************

  Description: Clock Wrapper

  Copyright (C) 2020 IObundle, Lda  All rights reserved

******************************************************************************/
`timescale 1ns / 1ps

`include "iob_lib.vh"

module iob_clkmux
  (
   `IOB_INPUT(clk_in0, 1),
   `IOB_INPUT(clk_in1, 1),
   `IOB_INPUT(clk_sel, 1),
   `IOB_OUTPUT(clk_out, 1)
   );

`ifdef XILINX
   BUFGMUX
     #(
       .CLK_SEL_TYPE("ASYNC")
	   )
   BUFGMUX_inst
     (
	  .I0(clk_in0), 
	  .I1(clk_in1), 
	  .S(clk_sel), 
	  .O(clk_out)
	  );
`else
   assign clk_out = clk_sel ? clk_in1 : clk_in0;
`endif

endmodule
