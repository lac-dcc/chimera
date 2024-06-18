// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **                                                                          **
 ** Component : MUX21LP  (2-to-1 Multiplexer NEGATED)                                                     **
 **                                                                          **
 *****************************************************************************/

module MUX21LP( 
   input A,    // Input A
   input B,    // Input B
   input S,    // Select input
   output ZN   // Negated Output
   );

   wire wire_plexer_out;
   assign ZN = ~wire_plexer_out;

   Multiplexer_2   PLEXERS_1 (
                              .muxIn_0(A),
                              .muxIn_1(B),
                              .muxOut(wire_plexer_out),
                              .sel(S)
   );


endmodule
