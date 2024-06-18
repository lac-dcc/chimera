// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **                                                                          **
 ** Component : Multiplexer_bus_2                                            **
 **                                                                          **
 *****************************************************************************/

module Multiplexer_bus_2( muxIn_0, muxIn_1, sel, muxOut );

    // Parameters are declared here
    parameter nrOfBits = 1;

    // Inputs using the parameters in their declarations
    input [nrOfBits-1:0] muxIn_0;
    input [nrOfBits-1:0] muxIn_1;
    input sel;

    // Output using the parameters in its declaration
    output [nrOfBits-1:0] muxOut;

    // Logic for the 2-to-1 multiplexer bus
    assign muxOut = (sel == 1'b0) ? muxIn_0 : muxIn_1;

endmodule
