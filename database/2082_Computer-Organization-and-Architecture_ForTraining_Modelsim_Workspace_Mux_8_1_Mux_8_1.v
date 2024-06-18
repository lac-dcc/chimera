// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module Mux_8_1 (
    input wire [7:0] inp, // 8-bit input data lines
    input wire [2:0] SelLine, // 3-bit select lines
    output reg [7:0] out // 8-bit output
);
    always @(*) begin
        case (SelLine)
            3'b000: out = inp[0]; // Select input 0 when SelLine is 3'b000
            3'b001: out = inp[1]; // Select input 1 when SelLine is 3'b001
            3'b010: out = inp[2]; // Select input 2 when SelLine is 3'b010
            3'b011: out = inp[3]; // Select input 3 when SelLine is 3'b011
            3'b100: out = inp[4]; // Select input 4 when SelLine is 3'b100
            3'b101: out = inp[5]; // Select input 5 when SelLine is 3'b101
            3'b110: out = inp[6]; // Select input 6 when SelLine is 3'b110
            3'b111: out = inp[7]; // Select input 7 when SelLine is 3'b111
            default; // Default case, output 0 if SelLine doesn't match any case
        endcase
    end
endmodule // Mux_8_1
