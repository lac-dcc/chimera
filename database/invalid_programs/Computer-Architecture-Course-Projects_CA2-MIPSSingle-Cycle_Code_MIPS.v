// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "src/MIPS_Controler.v"
`include "src/MIPS_DataPath.v"


module MIPS (
    clk,
    rst
);
  input clk, rst;

  wire [31:0] instruction_bus;

  wire reg_write_en,
    pc_load_en,
    ALU_B_sel,
    mem_write_en,
    mem_read_en,
    mem_out_sel,
    slt_ALU_sel,
    jal_sel,
    zer;

  wire [1:0] reg_write_sel, pc_next_sel;
  wire [2:0] ALU_op_code;

  MIPSControler controller (
      .IR(instruction_bus),
      .zero(zer),
      .reg_wr_en(reg_write_en),
      .reg_wr_sel(reg_write_sel),
      .pc_ld_en(pc_load_en),
      .pc_next_sel(pc_next_sel),
      .Alu_opc(ALU_op_code),
      .Alu_B_sel(ALU_B_sel),
      .data_mem_wr_en(mem_write_en),
      .data_mem_read_en(mem_read_en),
      .mem_out_sel(mem_out_sel),
      .jal_sel(jal_sel),
      .slt_Alu_sel(slt_ALU_sel)
  );

  MIPSDataPath data_path (
      .reg_write_en (reg_write_en),
      .reg_write_sel (reg_write_sel),
      .pc_load_en (pc_load_en),
      .pc_next_sel (pc_next_sel),
      .ALU_B_sel (ALU_B_sel),
      .ALU_op_code (ALU_op_code),
      .mem_write_en (mem_write_en),
      .mem_read_en (mem_read_en),
      .mem_out_sel (mem_out_sel),
      .slt_ALU_sel (slt_ALU_sel),
      .jal_sel (jal_sel),
      .clk (clk),
      .rst (rst),
      .zer (zer),
      .instruction_bus (instruction_bus)
  );

endmodule
