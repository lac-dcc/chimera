`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB£¨Embeded System Lab£©
// Engineer: Haojun Xia
// Create Date: 2019/02/08
// Design Name: RISCV-Pipline CPU
// Module Name: ALU
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: ALU unit of RISCV CPU
//////////////////////////////////////////////////////////////////////////////////
`include "Parameters.v"   
module ALU(
    input wire [31:0] Operand1,
    input wire [31:0] Operand2,
    input wire [3:0] AluContrl,
    output reg [31:0] AluOut
    );
    //
    wire signed [31:0] Operand1S = $signed(Operand1);
    wire signed [31:0] Operand2S = $signed(Operand2);
    //
    always@(*)
    case(AluContrl)
        `SLL:        AluOut<=Operand1<<(Operand2[4:0]);
        `SRL:        AluOut<=Operand1>>(Operand2[4:0]);
        `SRA:        AluOut<=Operand1S >>> (Operand2[4:0]);
        `ADD:        AluOut<=Operand1 + Operand2; 
        `SUB:        AluOut<=Operand1 - Operand2;
        `XOR:        AluOut<=Operand1 ^ Operand2;
        `OR:         AluOut<=Operand1 | Operand2;   
        `AND:        AluOut<=Operand1 & Operand2;
        `SLT:        AluOut<=Operand1S < Operand2S ? 32'd1:32'd0;
        `SLTU:       AluOut<=Operand1 < Operand2 ? 32'd1:32'd0;
        `LUI:        AluOut<={ Operand2[31:12],12'b0 };
        default:    AluOut <= 32'hxxxxxxxx;                          
    endcase
endmodule