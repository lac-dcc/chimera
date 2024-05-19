// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **                                                                          **
 ** Component : Multiplexer_4                                                **
 ** Functionality: 4-to-1 multiplexer                                        **
 ** Refactored 03.12.2023 Ronny Hansen                                       **
 *****************************************************************************/

module Multiplexer_4(
    input wire muxIn_0,
    input wire muxIn_1,
    input wire muxIn_2,
    input wire muxIn_3,
    input wire [1:0] sel,
    output reg muxOut
);

    // Combinational logic to select the output based on 'sel'
    always @(*) begin
        case(sel)
            2'b00: muxOut = muxIn_0; // Select input 0
            2'b01: muxOut = muxIn_1; // Select input 1
            2'b10: muxOut = muxIn_2; // Select input 2
            2'b11: muxOut = muxIn_3; // Select input 3
            default: muxOut = 1'bx;  // Undefined state
        endcase
    end
endmodule
