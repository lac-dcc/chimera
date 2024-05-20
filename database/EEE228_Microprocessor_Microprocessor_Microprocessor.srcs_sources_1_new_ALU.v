// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

module ALU(
    input wire [7:0] regA, // 4-bit input operand A
    input wire [7:0] regB, // 4-bit input operand B
    input [3:0] ALU_Sel, // Operation selector
    input ALU_update,
    output reg [7:0] regO=8'b0 // 4-bit result
);


// Define operations
localparam ACC_NZ_A     = 4'b0111;
localparam ACC_NZ_SH    = 4'b1000;
localparam ADD          = 4'b1001;
localparam SUB          = 4'b1010;
localparam INV          = 4'b1011;
localparam AND          = 4'b1100;
localparam OR           = 4'b1101;
localparam XOR          = 4'b1110;


// ALU operation
always @(ALU_update) begin
    case(ALU_Sel)
        ACC_NZ_A: regO = regA + regB;
        ACC_NZ_SH: regO = regA + regB;
        ADD: regO = regA + regB;
        SUB: regO = regA - regB;
        INV: regO = ~regA;
        AND: regO = regA & regB;
        OR:  regO = regA | regB;
        XOR: regO = regA ^ regB;
    endcase
end


endmodule
