// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

/*****************************************************************************

  Description: IOB_INOUT 3-State Buffer

  Copyright (C) 2020 IObundle, Lda  All rights reserved

******************************************************************************/
`timescale 1ns / 1ps

`include "iob_lib.vh"

module iob_iobuf
  (
   `IOB_INPUT(I, 1), //from core
   `IOB_INPUT(T, 1), //from core: tristate control
   `IOB_INPUT(N, 1), //from core: inversion control
   `IOB_OUTPUT(O, 1),//to core
   `IOB_INOUT(IO, 1) //to device IO
   );

   `IOB_WIRE(O_int, 1)

`ifdef XILINX
   IOBUF IOBUF_inst
     (
      .I(I),
      .T(T),
      .O(O_int),
      .IO(IO)
      );
`else
   assign IO = T? 1'bz : I;
   assign O_int = IO;
`endif

   assign O = N^O_int;

endmodule
