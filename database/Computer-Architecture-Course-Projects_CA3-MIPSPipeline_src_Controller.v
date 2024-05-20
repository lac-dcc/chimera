// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`define r_type 6'b0 

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

`define no_op 6'b0

`define no_op_alu 3'd0
`define add_alu_op 3'd1
`define sub_alu_op 3'd2
`define and_alu_op 3'd3
`define or_alu_op 3'd4
`define slt_alu_op 3'd5


module Controller (
    inst_op_code,
    inst_func_code,
    imm_sel,
    mem_write_en,
    mem_read_en,
    reg_dest_sel,
    reg_data_sel,
    reg_write_en,
    alu_op_code
);

  input [5:0] inst_op_code, inst_func_code;

  output reg imm_sel;
  output reg mem_write_en, mem_read_en;
  output reg [1:0] reg_dest_sel, reg_data_sel;
  output reg reg_write_en;
  output reg [2:0] alu_op_code;

  always @(inst_op_code, inst_func_code) begin
    imm_sel = 1'b0;
    mem_write_en = 1'b0;
    mem_read_en = 1'b0;
    reg_dest_sel = 2'b0;
    reg_data_sel = 2'b0;
    reg_write_en = 1'b0;
    alu_op_code = 3'd0;

    case (inst_op_code)
      `r_type: begin
        case (inst_func_code)
          `no_op: begin
            imm_sel = 1'b0;
            mem_write_en = 1'b0;
            mem_read_en = 1'b0;
            reg_dest_sel = 2'b0;
            reg_data_sel = 2'b0;
            reg_write_en = 1'b0;
            alu_op_code = 3'd0;
          end
          `f_add: begin
            imm_sel = 1'b0;
            mem_write_en = 1'b0;
            mem_read_en = 1'b0;
            reg_dest_sel = 2'd1;
            reg_data_sel = 2'd1;
            reg_write_en = 1'b1;
            alu_op_code = `add_alu_op;
          end
          `f_sub: begin
            imm_sel = 1'b0;
            mem_write_en = 1'b0;
            mem_read_en = 1'b0;
            reg_dest_sel = 2'd1;
            reg_data_sel = 2'd1;
            reg_write_en = 1'b1;
            alu_op_code = `sub_alu_op;
          end
          `f_slt: begin
            imm_sel = 1'b0;
            mem_write_en = 1'b0;
            mem_read_en = 1'b0;
            reg_dest_sel = 2'd1;
            reg_data_sel = 2'd1;
            reg_write_en = 1'b1;
            alu_op_code = `slt_alu_op;
          end
          `f_and: begin
            imm_sel = 1'b0;
            mem_write_en = 1'b0;
            mem_read_en = 1'b0;
            reg_dest_sel = 2'd1;
            reg_data_sel = 2'd1;
            reg_write_en = 1'b1;
            alu_op_code = `and_alu_op;
          end
          `f_or: begin
            imm_sel = 1'b0;
            mem_write_en = 1'b0;
            mem_read_en = 1'b0;
            reg_dest_sel = 2'd1;
            reg_data_sel = 2'd1;
            reg_write_en = 1'b1;
            alu_op_code = `or_alu_op;
          end
          `f_jr: begin
            imm_sel = 1'b0;
            mem_write_en = 1'b0;
            mem_read_en = 1'b0;
            reg_dest_sel = 2'd0;
            reg_data_sel = 2'd0;
            reg_write_en = 1'b0;
            alu_op_code = `no_op_alu;
          end
        endcase
      end
      `addi: begin
        imm_sel = 1'b1;
        mem_write_en = 1'b0;
        mem_read_en = 1'b0;
        reg_dest_sel = 2'd0;
        reg_data_sel = 2'd1;
        reg_write_en = 1'b1;
        alu_op_code = `add_alu_op;
      end
      `slti: begin
        imm_sel = 1'b1;
        mem_write_en = 1'b0;
        mem_read_en = 1'b0;
        reg_dest_sel = 2'd0;
        reg_data_sel = 2'd1;
        reg_write_en = 1'b1;
        alu_op_code = `slt_alu_op;
      end
      `lw: begin
        imm_sel = 1'b1;
        mem_write_en = 1'b0;
        mem_read_en = 1'b1;
        reg_dest_sel = 2'd0;
        reg_data_sel = 2'd2;
        reg_write_en = 1'b1;
        alu_op_code = `add_alu_op;
      end
      `sw: begin
        imm_sel = 1'b1;
        mem_write_en = 1'b1;
        mem_read_en = 1'b0;
        reg_dest_sel = 2'd0;
        reg_data_sel = 2'd0;
        reg_write_en = 1'b0;
        alu_op_code = `add_alu_op;
      end
      `beq: begin
        imm_sel = 1'b0;
        mem_write_en = 1'b0;
        mem_read_en = 1'b0;
        reg_dest_sel = 2'd0;
        reg_data_sel = 2'd0;
        reg_write_en = 1'b0;
        alu_op_code = `no_op_alu;
      end
      `j: begin
        imm_sel = 1'b0;
        mem_write_en = 1'b0;
        mem_read_en = 1'b0;
        reg_dest_sel = 2'd0;
        reg_data_sel = 2'd0;
        reg_write_en = 1'b0;
        alu_op_code = `no_op_alu;
      end
      `jal: begin
        imm_sel = 1'b0;
        mem_write_en = 1'b0;
        mem_read_en = 1'b0;
        reg_dest_sel = 2'd2;
        reg_data_sel = 2'd0;
        reg_write_en = 1'b1;
        alu_op_code = `no_op_alu;
      end

    endcase
  end


endmodule
