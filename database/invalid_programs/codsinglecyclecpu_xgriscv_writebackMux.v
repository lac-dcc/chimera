// This program was cloned from: https://github.com/JeredGong/codsinglecyclecpu
// License: Apache License 2.0

`include "xgriscv_defines.v"
// 本模块用于将写回数据选择器
module writebackMux(
    input [2:0] WriteBackSel,
    input [31:0] aluout,
    input [31:0] memout,
    input [31:0] PC_out,
    input [31:0] imm,
    output wire [31:0] write_reg_data
    );
    assign write_reg_data = (WriteBackSel == 3'b001) ? aluout :   //R-TYPE 类型
    (WriteBackSel == 3'b011) ? memout :               //Load类型
    (WriteBackSel == 3'b010 ) ? PC_out + 4 : //Jump类型
    (WriteBackSel == 3'b110) ?  imm :                 //LUI指令
    (WriteBackSel == 3'b111) ? PC_out+imm:            //AUIPC指令
      aluout;
endmodule