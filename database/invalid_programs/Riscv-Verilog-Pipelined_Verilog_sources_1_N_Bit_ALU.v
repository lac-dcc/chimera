// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 02:12:16 PM
// Design Name: 
// Module Name: N_Bit_ALU
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


`define     ALU_ADD         4'b00_00
`define     ALU_SUB         4'b00_01
`define     ALU_PASS        4'b00_11
`define     ALU_OR          4'b01_00
`define     ALU_AND         4'b01_01
`define     ALU_XOR         4'b01_11
`define     ALU_SRL         4'b10_00
`define     ALU_SRA         4'b10_10
`define     ALU_SLL         4'b10_01
`define     ALU_SLT         4'b11_01
`define     ALU_SLTU        4'b11_11



module N_Bit_ALU(
	input   wire [31:0] a, b,
		input   wire [3:0]  alufn,
	output  reg  [31:0] r,
	output  wire        cf, zf, vf, sf

);

    wire [31:0] add, sub, op_b;
    wire cfa, cfs;
    
    assign op_b = (~b);
    
    assign {cf, add} = alufn[0] ? (a + op_b + 1'b1) : (a + b); //Addition and sub
    
    assign zf = (add == 0); //zero flag
    assign sf = add[31];    //sign flag
    assign vf = (a[31] ^ (op_b[31]) ^ add[31] ^ cf);
    
    wire[31:0] sh;
    wire [4:0]  shamt;
    assign shamt = b[4:0];
    shifter shifter0(.a(a), .shamt(shamt), .type(alufn[1:0]),  .r(sh));
    //type
    // 00 SLLI 
    // 01 SRLI s
    // 11 SRAI
    
    always @ * begin
        r = 0;
          (* parallel_case *)
        case (alufn)
            // arithmetic
            4'b00_00 : r = add; //add
            4'b00_01 : r = add; //sub
            4'b00_11 : r = b;   //pass
            // logic
            4'b01_00:  r = a | b;
            4'b01_01:  r = a & b;
            4'b01_11:  r = a ^ b;
            // shift
            `ALU_SLL:  r=sh;//SLL
            `ALU_SRL:  r=sh; //SRL                                     
            `ALU_SRA:  r=sh;//SRA
            // slt & sltu
            `ALU_SLT:  r = {31'b0,(sf != vf)}; 
            `ALU_SLTU:  r = {31'b0,(~cf)};     
             
             default:        r= 0;       	
        endcase
    end
endmodule