// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

/*****************************************************************************

  Description: IOB_INOUT 3-State Buffer

  Copyright (C) 2020 IObundle, Lda  All rights reserved

******************************************************************************/
`timescale 1ns / 1ps

`include "iob_lib.vh"

module alt_iobuf
  (
   `IOB_INPUT(i, 1),
   `IOB_INPUT(oe, 1),
   `IOB_OUTPUT(o, 1),
   `IOB_INOUT(io, 1)
   );

   assign io = oe? i : 1'bz;
   assign o = io;

endmodule
