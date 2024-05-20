// This program was cloned from: https://github.com/jasonkaufmann/ice40FPGAProjects
// License: MIT License

module alu (
    input wire [7:0] a,
    input wire [7:0] b,
    input sub,
    
    output wire [7:0] out, 
    output zeroFlag,
    output carryFlag );

wire [7:0] bTwosComplement; //create an intermediate for the two's complement for clarity

assign bTwosComplement = b ^ sub; //if we want to subtract, xor the b register with 1 to invert it

assign out = a + bTwosComplement + sub; //if subtracting add the sub bit as the carry in bit

assign zeroFlag = &out;
assign carryFlag = (a[7] & b[7] & !out[7]) | (!a[7] & !b[7] & out[7]);

endmodule