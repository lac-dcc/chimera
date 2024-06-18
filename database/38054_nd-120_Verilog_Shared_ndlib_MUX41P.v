// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License


/******************************************************************************
 **                                                                          **
 ** Component : MUX41P                                                       **
 **                                                                          **
 *****************************************************************************/

module MUX41P(A, B, D0, D1, D2, D3, Z);

   // Inputs
   input A, B, D0, D1, D2, D3;

   // Output
   output Z;

   // 4-to-1 Multiplexer
   Multiplexer_4 PLEXER (
      .muxIn_0(D0),
      .muxIn_1(D1),
      .muxIn_2(D2),
      .muxIn_3(D3),
      .muxOut(Z),
      .sel({B, A})
   );

endmodule
