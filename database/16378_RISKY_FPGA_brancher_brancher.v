// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module brancher (
  input [31:0] inst,
  input [31:0] pc,
  input [31:0] pc_4,
  input cmp_in,
  output [31:0] addr_out
);

wire [12:0] imm;
wire [31:0] offset;

assign imm[12] = inst[31];
assign imm[11] = inst[7];
assign imm[10:5] = inst[30:25];
assign imm[4:1] = inst[11:8];
assign imm[0] = 1'b0;

sign_extender #(.WIDTH(32), .EXTENSION(19)) se0 (.imm(imm), .se_out(offset));

x_bit_mux_2 #(.WIDTH(32)) sel0 (
  .a(pc_4), .b(offset + pc), .s(cmp_in), .out(addr_out)
);
endmodule
