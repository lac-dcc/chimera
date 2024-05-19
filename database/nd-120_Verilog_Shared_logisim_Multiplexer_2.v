// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **                                                                          **
 ** Component : Multiplexer_2                                                **
 **                                                                          **
 ** Refactored 03.12.2023 Ronny Hansen                                       **
 *****************************************************************************/
/* */

module Multiplexer_2( input muxIn_0,
                      input muxIn_1,                      
                      input sel,
                      output wire muxOut
                      );   

      // Logic for 2-to-1 Multiplexer
    assign muxOut = sel ? muxIn_1 : muxIn_0;

endmodule
