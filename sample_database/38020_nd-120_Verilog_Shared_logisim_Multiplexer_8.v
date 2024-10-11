// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **                                                                          **
 ** Component : Multiplexer_8                                                **
 **                                                                          **
 *****************************************************************************/

module Multiplexer_8(
    input  muxIn_0,
    input  muxIn_1,
    input  muxIn_2,
    input  muxIn_3,
    input  muxIn_4,
    input  muxIn_5,
    input  muxIn_6,
    input  muxIn_7,
    input  [2:0] sel,
    output reg muxOut
);

    // Logic for the 8-to-1 multiplexer
    always @(*) begin
        case (sel)
            3'b000: muxOut = muxIn_0; // Select input 0
            3'b001: muxOut = muxIn_1; // Select input 1
            3'b010: muxOut = muxIn_2; // Select input 2
            3'b011: muxOut = muxIn_3; // Select input 3
            3'b100: muxOut = muxIn_4; // Select input 4
            3'b101: muxOut = muxIn_5; // Select input 5
            3'b110: muxOut = muxIn_6; // Select input 6
            3'b111: muxOut = muxIn_7; // Select input 7
            default: muxOut = 1'bx;   // Undefined state
        endcase
    end

endmodule
