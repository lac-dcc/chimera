/* RISC-V的编码常量 */

`define OPC_SYSTEM	7'h73
`define OPC_FENCE	7'h0f
`define OPC_OP		7'h33
`define OPC_OP_IMM	7'h13
`define OPC_STORE	7'h23
`define OPC_LOAD	7'h03
`define OPC_BRANCH	7'h63
`define OPC_JALR	7'h67
`define OPC_JAL		7'h6f
`define OPC_AUIPC	7'h17
`define OPC_LUI		7'h37

`define ALU_ADD		3'b000
`define ALU_SLTI	3'b010
`define ALU_SLTIU	3'b011
`define ALU_XOR		3'b100
`define ALU_OR		3'b110
`define ALU_AND		3'b111

