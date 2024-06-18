// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2024 15:25:44
// Design Name: 
// Module Name: ROM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ROM(
    input [4:0] address,
    output reg [3:0] data,
    output reg update = 0
);

// Define operations
localparam LD_A         = 4'b0000;
localparam LD_B         = 4'b0001;
localparam LD_O         = 4'b0010;
localparam LD_SH_A      = 4'b0011;
localparam LD_SH_B      = 4'b0100;
localparam SHR          = 4'b0101;
localparam SHL          = 4'b0110;
localparam ACC_NZ_A     = 4'b0111;
localparam ACC_NZ_SH    = 4'b1000;
localparam ADD          = 4'b1001;
localparam SUB          = 4'b1010;
localparam INV          = 4'b1011;
localparam AND          = 4'b1100;
localparam OR           = 4'b1101;
localparam XOR          = 4'b1110;
localparam CLR_ACC      = 4'b1111;

reg [3:0] memory[31:0];

initial begin
    memory[0] = LD_A;
    memory[1] = LD_B;
    memory[2] = LD_SH_B;
    memory[3] = SHR;
    memory[4] = ACC_NZ_A;
    memory[5] = SHR;
    memory[6] = LD_SH_A;
    memory[7] = SHL;
    memory[8] = ACC_NZ_SH;
    memory[9] = LD_SH_B;
    memory[10] = SHR;
    memory[11] = SHR;
    memory[12] = SHR;
    memory[13] = LD_SH_A;
    memory[14] = SHL;
    memory[15] = SHL;
    memory[16] = ACC_NZ_SH;
    memory[17] = LD_SH_B;
    memory[18] = SHR;
    memory[19] = SHR;
    memory[20] = SHR;
    memory[21] = SHR;
    memory[22] = LD_SH_A;
    memory[23] = SHL;
    memory[24] = SHL;
    memory[25] = SHL;
    memory[26] = ACC_NZ_SH;
    memory[27] = LD_O;
    memory[28] = CLR_ACC;
    memory[29] = CLR_ACC;
    memory[30] = CLR_ACC;
    memory[31] = CLR_ACC;

    
end

always @(*) begin
    data = memory[address];
    update = ~update;
end

endmodule

