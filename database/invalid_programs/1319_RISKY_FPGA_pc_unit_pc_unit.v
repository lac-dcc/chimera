// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../brancher/brancher.v"
`include "../pc_sel/pc_sel.v"
`include "../jumper/jumper.v"
module pc_unit (
  input [31:0] reg1_data,
  input [31:0] inst,
  input [31:0] ecall,
  input cmp_in,
  input clk,
  input reset,
  output [31:0] pc,
  output [31:0] pc_4
);

reg [31:0] pc_reg = 32'b0;

wire [31:0] pcadd4;
wire [31:0] pc_mux_out;
wire [31:0] branch_out;
wire [31:0] jump_out;
wire [31:0] pc_in;
wire [1:0] control;

assign pcadd4 = pc_reg + 4;
assign pc_4 = pcadd4;
assign pc = pc_reg;

// pc_sel control
pc_sel pc_control (.inst(inst), .control(control));
// branch
brancher branch (.inst(inst), .pc(pc_reg), .pc_4(pcadd4),
  .cmp_in(cmp_in), .addr_out(branch_out)
);
// jump
jumper jump_unit (.pc(pc_reg), .inst(inst), .reg1_data(reg1_data), .addr_out(jump_out));
// pc_sel
x_bit_mux_4 #(.WIDTH(32)) pc_mux (
  .a(pcadd4), .b(branch_out), .c(jump_out), .d(ecall), .s0(control[0]), .s1(control[1]), .out(pc_mux_out)
);
// reset
x_bit_mux_2 #(.WIDTH(32)) reset_sel (.a(pc_mux_out), .b({32{1'b0}}), .s(reset), .out(pc_in));

always @ (posedge clk) begin
  pc_reg <= pc_in;
end

endmodule

