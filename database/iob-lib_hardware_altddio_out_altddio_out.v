// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

/*****************************************************************************

  Copyright (C) 2020 IObundle, Lda  All rights reserved

******************************************************************************/
`timescale 1ns / 1ps

`include "iob_lib.vh"

module altddio_out
  #(
    parameter WIDTH=1
    )
  (
   `IOB_INPUT(outclock, 1),
   `IOB_INPUT(datain_l, WIDTH),
   `IOB_INPUT(datain_h, WIDTH),
   `IOB_OUTPUT(dataout, WIDTH)
   );

   `IOB_VAR(datain_l_reg, WIDTH)
   `IOB_VAR(datain_h_reg, WIDTH)

   always @(posedge outclock)
     datain_h_reg <= datain_h;
   
   always @(negedge outclock)
     datain_l_reg <= datain_l;
   
   assign dataout = outclock ? datain_h_reg: datain_l_reg;
   
endmodule
