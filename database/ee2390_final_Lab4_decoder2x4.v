// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

// decoder2x4.v for EE 2390 Lab #4
`timescale 1ns / 1ps
module decoder2x4(D,A,B,EN);
    output  [3:0]   D;
    input   A, B, EN;
    reg     [3:0]   D;
    // Specify the module behavior by truth table
    always @(A,B,EN)
    begin
        case({A,B,EN})
            3'b000 : D=4'b1111;
            3'b001 : D=4'b1110;
            3'b010 : D=4'b1111;
            3'b011 : D=4'b1101;
            3'b100 : D=4'b1111;
            3'b101 : D=4'b1011;
            3'b110 : D=4'b1111;
            3'b111 : D=4'b0111;
            default: D=4'b1111;
        endcase
    end
endmodule
