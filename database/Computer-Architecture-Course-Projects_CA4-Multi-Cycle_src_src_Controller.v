// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`define IF 4'b0
`define RF 4'b0001
`define sw_s 4'b0010
`define ldw_s 4'b0011
`define mem_to_reg 4'b0100
`define jump_s 4'b1100
`define brz_s 4'b0101
`define move_to_s 4'b0110
`define move_from_s 4'b0111
`define alu_s 4'b1000
`define alu_to_reg 4'b1001
`define not_s 4'b1010
`define i_type 4'b1011

`define opc_ld 4'b0000
`define opc_sw 4'b0001
`define opc_j 4'b0010 
`define opc_brz 4'b0100
`define opc_R 4'b1000
`define opc_aadi 4'b1100
`define opc_subi 4'b1101
`define opc_andi 4'b1110 
`define opc_ori 4'b1111

`define fun_move_to 9'b000000001
`define fun_move_from 9'b000000010
`define fun_add 9'b000000100
`define fun_sub 9'b000001000
`define fun_and 9'b000010000
`define fun_or 9'b000100000
`define fun_not 9'b001000000
`define fun_nop 9'b010000000

`define alu_add 2'b0
`define alu_sub 2'b01
`define alu_and 2'b10
`define alu_or 2'b11

module Controller (
    mem_read,
    alu_src_a,
    mem_adr_sel,
    IR_write,
    alu_src_b,
    alu_op,
    pc_write,
    pc_sel,
    Inst,
    mem_write,
    reg_write_adr,
    reg_write_sel,
    reg_write_en,
    pc_write_cond,
    clk,
    rst
);

  output reg mem_read, alu_src_a, mem_adr_sel, mem_write, IR_write;
  output reg pc_write, reg_write_adr, reg_write_en, pc_write_cond;
  output reg [1:0] alu_op, alu_src_b, pc_sel;
  output reg [2:0] reg_write_sel;
  input [15:0] Inst;
  input clk, rst;
  reg [3:0] ps = 4'b0, ns;
  wire [3:0] op;
  wire [11:0] adr_12, imm_data;
  wire [2:0] ri;
  wire [8:0] adr_9, func;
  assign op = Inst[15:12];
  assign adr_12 = Inst[11:0];
  assign imm_data = Inst[11:0];
  assign adr_9 = Inst[8:0];
  assign func = Inst[8:0];
  assign ri = Inst[11:9];
  always @(Inst,ps) begin
    ns = 4'b0;
    {mem_read,alu_src_a,mem_adr_sel,mem_read,mem_write,IR_write,
      pc_write,reg_write_adr,reg_write_en,pc_write_cond,
      alu_op,alu_src_b,pc_sel,reg_write_sel} = 19'b0;
    case (ps)
      `IF: begin
        {mem_read, IR_write, pc_write} = 3'b111;
        alu_src_b = 2'b01;
        alu_op = `alu_add;
        {alu_src_a, mem_adr_sel, pc_sel} = 4'b0;
        ns = `RF;
      end
      `RF: begin
        case (op)
          `opc_sw: ns = `sw_s;
          `opc_ld: ns = `ldw_s;
          `opc_j: ns = `jump_s;
          `opc_brz: ns = `brz_s;
          `opc_R: begin
            case (func)
              `fun_move_to: ns = `move_to_s;
              `fun_move_from: ns = `move_from_s;
              `fun_not: ns = `not_s;
              `fun_nop: ns = `IF;
            endcase
            if (func == `fun_add || func == `fun_sub || func == `fun_and || func == `fun_or)
              ns = `alu_s;
          end
          `opc_aadi: ns = `i_type;
          `opc_subi: ns = `i_type;
          `opc_andi: ns = `i_type;
          `opc_ori: ns = `i_type;

        endcase
      end
      `sw_s: begin
        {mem_adr_sel, mem_write} = 2'b11;
        ns = `mem_to_reg;
      end
      `ldw_s: begin
        {mem_adr_sel, mem_read} = 2'b11;
        ns = `mem_to_reg;
      end
      `mem_to_reg: begin
        {reg_write_adr, reg_write_sel} = 4'b0;
        reg_write_en = 1'b1;
        ns = `IF;
      end
      `jump_s: begin
        pc_sel = 2'b01;
        pc_write = 1'b1;
        ns = `IF;
      end
      `brz_s: begin
        {alu_src_a, pc_write_cond} = 2'b11;
        alu_src_b = 2'b0;
        alu_op = `alu_sub;
        pc_sel = 2'b10;
        ns = `IF;
      end
      `move_to_s: begin
        {reg_write_adr, reg_write_en} = 2'b11;
        reg_write_sel = 3'b001;
        ns = `IF;
      end
      `move_from_s: begin
        reg_write_en = 1'b1;
        reg_write_adr = 1'b0;
        reg_write_sel = 3'b010;
        ns = `IF;
      end
      `alu_s: begin
        alu_src_a = 1'b1;
        alu_src_b = 2'b0;
        ns = `alu_to_reg;
        case (func)
          `fun_add: alu_op = `alu_add;
          `fun_sub: alu_op = `alu_sub;
          `fun_and: alu_op = `alu_and;
          `fun_or:  alu_op = `alu_or;
        endcase
      end
      `alu_to_reg: begin
        reg_write_sel = 3'b011;
        reg_write_en = 1'b1;
        reg_write_adr = 1'b0;
        ns = `IF;
      end
      `not_s: begin
        reg_write_sel = 3'b100;
        reg_write_en = 1'b1;
        reg_write_adr = 1'b0;
        ns = `IF;
      end
      `i_type: begin
        alu_src_a = 1'b1;
        alu_src_b = 2'b10;
        ns = `alu_to_reg;
        case (op)
          `opc_aadi: alu_op = `alu_add;
          `opc_subi: alu_op = `alu_sub;
          `opc_andi: alu_op = `alu_and;
          `opc_ori:  alu_op = `alu_or;
        endcase
      end
    endcase
  end

  always @(posedge clk, posedge rst) begin
    if (rst) ps <= 4'b0;
    else ps <= ns;
  end
endmodule
