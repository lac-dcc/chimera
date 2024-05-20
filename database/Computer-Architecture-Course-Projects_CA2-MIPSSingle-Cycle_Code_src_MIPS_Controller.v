// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`timescale 1ps / 1ps
`define R_type 6'b0 
`define addi 6'b001000 
`define slti 6'b001010
`define lw 6'b100011
`define sw 6'b101011
`define beq 6'b000100
`define j 6'b000010
`define jal 6'b000011
`define f_add 6'b100000
`define f_sub 6'b100010
`define f_slt 6'b101010
`define f_and 6'b100100
`define f_or 6'b100101
`define f_jr 6'b001000
`define alu_add 2'b0
`define alu_sub 2'b01
`define alu_and 2'b10
`define alu_or 2'b11
module MIPSController (
    IR,
    zero,
    reg_wr_en,
    reg_wr_sel,
    pc_ld_en,
    pc_next_sel,
    Alu_opc,
    Alu_B_sel,
    data_mem_wr_en,
    data_mem_read_en,
    mem_out_sel,
    jal_sel,
    slt_Alu_sel
);
  input [31:0] IR;
  input zero;
  output reg reg_wr_en,pc_ld_en,Alu_B_sel,data_mem_wr_en,data_mem_read_en,mem_out_sel,jal_sel,slt_Alu_sel;
  output reg [1:0] reg_wr_sel, pc_next_sel;
  output reg [2:0] Alu_opc;
  reg ps, ns;
  wire [5:0] IR_opc, IR_func;
  assign IR_opc  = IR[31:26];
  assign IR_func = IR[5:0];
  always @(IR or zero) begin
    {reg_wr_en,Alu_B_sel,data_mem_wr_en,data_mem_read_en,mem_out_sel,jal_sel,slt_Alu_sel,
    reg_wr_sel,pc_next_sel,Alu_opc} = 'b0;
    pc_ld_en = 1'b1;
    case (IR_opc)
      `R_type: begin
        case (IR_func)
          `f_add: begin
            {reg_wr_en, slt_Alu_sel} = 2'b11;
            Alu_opc = `alu_add;
          end
          `f_sub: begin
            {reg_wr_en, slt_Alu_sel} = 2'b11;
            Alu_opc = `alu_sub;
          end
          `f_slt: begin
            reg_wr_en = 1'b1;
            slt_Alu_sel = 1'b0;
            Alu_opc = `alu_sub;
          end
          `f_and: begin
            {reg_wr_en, slt_Alu_sel} = 2'b11;
            Alu_opc = `alu_and;
          end
          `f_or: begin
            {reg_wr_en, slt_Alu_sel} = 2'b11;
            Alu_opc = `alu_or;
          end
          `f_jr: begin
            reg_wr_en   = 0;
            pc_next_sel = 2'b11;
          end
        endcase
      end
      `addi: begin
        {reg_wr_en, Alu_B_sel, slt_Alu_sel} = 3'b111;
        reg_wr_sel = 2'b01;
        Alu_opc = `alu_add;
      end
      `slti: begin
        {reg_wr_en, Alu_B_sel} = 2'b11;
        reg_wr_sel = 2'b01;
        Alu_opc = `alu_sub;
      end
      `lw: begin
        {reg_wr_en, Alu_B_sel, data_mem_read_en, mem_out_sel} = 4'b1111;
        reg_wr_sel = 2'b01;
        Alu_opc = `alu_add;
      end
      `sw: begin
        {Alu_B_sel, data_mem_wr_en} = 4'b1111;
        Alu_opc = `alu_add;
      end
      `beq: begin
        Alu_opc = `alu_sub;
        pc_next_sel = (zero == 1'b1) ? 2'b01 : 2'b0;
        slt_Alu_sel = 1'b1;
      end
      `j: begin
        pc_next_sel = 2'b10;
      end
      `jal: begin
        {reg_wr_en, jal_sel} = 2'b11;
        reg_wr_sel = 2'b10;
        pc_next_sel = 2'b10;
      end
      //default: pc_ld_en = 1'b0;

    endcase
  end
endmodule
