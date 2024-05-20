// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module Decoder(istruction, op, rs, rt, rd, shamt, func, imm, addr);
input [31:0] istruction;
output [5:0] op;
output [4:0] rs;
output [4:0] rt;
output [4:0] rd;
output [31:0] shamt; //0扩展
output [5:0] func;
output [15:0] imm;
output [25:0] addr;


assign op = istruction[31:26];
assign rs = istruction[25:21];
assign rt = istruction[20:16];
assign rd = istruction[15:11];
assign shamt = {27'b0,istruction[10:6]}; 
assign func = istruction[5:0];
assign imm = istruction[15:0];
assign addr = istruction[25:0];

endmodule


