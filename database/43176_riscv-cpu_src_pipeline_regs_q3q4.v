// This program was cloned from: https://github.com/matiasilva/riscv-cpu
// License: GNU General Public License v3.0

/* execute/ALU to memory access */
module q3q4 #(
    parameter CTRL_WIDTH = 16
) (
    input                      clk,
    input                      rst_n,
    input  [             31:0] pc_next_i,
    output [             31:0] pc_next_o,
    input  [             31:0] alu_out_i,
    output [             31:0] alu_out_o,
    input  [             31:0] reg_rd_data2_i,
    output [             31:0] reg_rd_data2_o,
    input  [              4:0] reg_wr_port_i,
    output [              4:0] reg_wr_port_o,
    input  [CTRL_WIDTH -1 : 0] ctrl_q3_i,
    output [CTRL_WIDTH -1 : 0] ctrl_q3_o,
    input  [             31:0] instr_i,
    output [             31:0] instr_o
);

  reg [           31:0] next_pc_next;
  reg [           31:0] next_alu_out;
  reg [           31:0] next_reg_rd_data2;
  reg [           31:0] next_reg_wr_port;
  reg [CTRL_WIDTH -1:0] next_ctrl_q3;
  reg [           31:0] next_instr;

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      next_pc_next <= 0;
      next_alu_out <= 0;
      next_reg_wr_port <= 0;
      next_reg_rd_data2 <= 0;
      next_ctrl_q3 <= 0;
      next_instr <= 32'h00000013;  //  NOP;
    end else begin
      next_pc_next <= pc_next_i;
      next_alu_out <= alu_out_i;
      next_reg_rd_data2 <= reg_rd_data2_i;
      next_reg_wr_port <= reg_wr_port_i;
      next_ctrl_q3 <= ctrl_q3_i;
      next_instr <= instr_i;
    end
  end

  assign pc_next_o = next_pc_next;
  assign alu_out_o = next_alu_out;
  assign reg_rd_data2_o = next_reg_rd_data2;
  assign reg_wr_port_o = next_reg_wr_port;
  assign ctrl_q3_o = next_ctrl_q3;
  assign instr_o = next_instr;

endmodule
