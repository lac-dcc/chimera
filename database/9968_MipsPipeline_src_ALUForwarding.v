// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

`timescale 1ns / 1ps
module ALUForwarding(
    input wire [4:0] rs_EX,
    input wire [4:0] rt_EX,
    input wire [4:0] Rw_MEM,
    input wire [4:0] Rw_WB,
    input wire RegWrite_MEM,
    input wire RegWrite_WB,
    input wire ALUSrcA_EX,
    input wire ALUSrcB_EX,
    output wire [1:0] ALUChooseA,       // A: 0-dataA  1-Shamt  2-WriteData_MEM  3-WriteData_WB 
    output wire [1:0] ALUChooseB        // B: 0-dataB  1-Imm    2-WriteData_MEM  3-WriteData_WB
);

    assign ALUChooseA = ALUSrcA_EX == 1 ? 1 :
                        (RegWrite_MEM && (Rw_MEM == rs_EX) && (Rw_MEM != 0)) ? 2 :   // 优先判断MEM阶段，即前一条指令
                        (RegWrite_WB && (Rw_WB == rs_EX) && (Rw_WB != 0)) ? 3 : 0;
    assign ALUChooseB = ALUSrcB_EX == 1 ? 1 : 
                        (RegWrite_MEM && (Rw_MEM == rt_EX) && (Rw_MEM != 0)) ? 2 :   // 优先判断MEM阶段，即前一条指令
                        (RegWrite_WB && (Rw_WB == rt_EX) && (Rw_WB != 0)) ? 3 : 0;

endmodule