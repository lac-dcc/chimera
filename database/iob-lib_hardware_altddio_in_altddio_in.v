// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

/*****************************************************************************

  Copyright (C) 2020 IObundle, Lda  All rights reserved

******************************************************************************/
`timescale 1ns / 1ps

`include "iob_lib.vh"

module altddio_in
  #(
    parameter WIDTH=1
    )
  (
   `IOB_INPUT(inclock, 1),
   `IOB_OUTPUT(dataout_l, WIDTH),
   `IOB_OUTPUT(dataout_h, WIDTH),
   `IOB_INPUT(datain, WIDTH)
   );

   `IOB_VAR(dataout_l_reg, WIDTH)
   `IOB_VAR(dataout_h_reg, WIDTH)

   always @(posedge inclock)
     dataout_h_reg <= datain;
   
   always @(negedge inclock)
     dataout_l_reg <= datain;
   
   assign dataout_l = dataout_l_reg;
   assign dataout_h = dataout_h_reg;
   
endmodule
