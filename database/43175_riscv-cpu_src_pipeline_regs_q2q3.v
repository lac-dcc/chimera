// This program was cloned from: https://github.com/matiasilva/riscv-cpu
// License: GNU General Public License v3.0

/* instruction decode/register file access to execute/ALU */
module q2q3 #(
    parameter CTRL_WIDTH = 16
) (
    input                   clk,
    input                   rst_n,
    input  [          31:0] pc_i,
    output [          31:0] pc_o,
    input  [          31:0] reg_rd_data1_i,
    output [          31:0] reg_rd_data1_o,
    input  [          31:0] reg_rd_data2_i,
    output [          31:0] reg_rd_data2_o,
    input  [           4:0] reg_wr_port_i,
    output [           4:0] reg_wr_port_o,
    input  [CTRL_WIDTH-1:0] ctrl_q2_i,
    output [CTRL_WIDTH-1:0] ctrl_q2_o,
    input  [          31:0] instr_i,
    output [          31:0] instr_o,
    input  [          31:0] pc_incr_i,
    output [          31:0] pc_incr_o

);

  reg [          31:0] next_pc;
  reg [          31:0] next_pc_incr;

  reg [          31:0] next_reg_rd_data1;
  reg [          31:0] next_reg_rd_data2;
  reg [           4:0] next_reg_wr_port;
  reg [CTRL_WIDTH-1:0] next_ctrl_q2;
  reg [          31:0] next_instr;

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      next_pc           <= 0;
      next_reg_rd_data1 <= 0;
      next_reg_rd_data2 <= 0;
      next_reg_wr_port  <= 0;
      next_ctrl_q2      <= 0;
      next_instr        <= 32'h00000013;  //  NOP;
      next_pc_incr      <= 0;

    end else begin
      next_pc           <= pc_i;
      next_reg_rd_data1 <= reg_rd_data1_i;
      next_reg_rd_data2 <= reg_rd_data2_i;
      next_reg_wr_port  <= reg_wr_port_i;
      next_ctrl_q2      <= ctrl_q2_i;
      next_instr        <= instr_i;
      next_pc_incr      <= pc_incr_i;

    end
  end

  assign pc_o           = next_pc;
  assign pc_incr_o      = next_pc_incr;

  assign reg_rd_data1_o = next_reg_rd_data1;
  assign reg_rd_data2_o = next_reg_rd_data2;
  assign reg_wr_port_o  = next_reg_wr_port;
  assign ctrl_q2_o      = next_ctrl_q2;
  assign instr_o        = next_instr;
endmodule
