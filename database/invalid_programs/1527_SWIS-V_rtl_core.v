// This program was cloned from: https://github.com/RVECE-A-RISC-V-Community/SWIS-V
// License: MIT License

// MIT License
// 
// Copyright (c) 2023 Sudeep et al.
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

`timescale 1ns / 1ps
`default_nettype none
`include "rtl/IF.v"
`include "rtl/ID.v"
`include "rtl/EX.v"
`include "rtl/MEM.v"
`include "rtl/WB.v"
	
module core(
input wire clk,
input wire rst_n,
input wire [31:0] i_i_data, // data read from i-mem
input wire [31:0] i_d_data, // data read from d-mem
input wire i_i_ack, // ack from i-mem
input wire i_d_ack, // ack from d-mem
output wire o_i_stb, // stub signal for i-mem (to read)
output wire o_d_stb, // stub signal for d-mem (to read)
output wire o_d_wr_en, // write enable signal for d-mem
output wire [31:0] o_d_write_data, // data to be written to d-mem
output wire [31:0] o_i_addr, // address for i-mem
output wire [31:0] o_d_addr // address for d-mem
);

//// IF ////
wire [31:0] if_instr, if_pc;

IF if_module(
    .clk(clk),
    .rst_n(rst_n),
    .o_pc(if_pc),
    .o_instr(if_instr),
    .i_inst(i_i_data),
    .i_imem_ack(i_i_ack),
    .o_imem_stb(o_i_stb),
    .o_iaddr(o_i_addr),
    .i_imm(ex_imm_data),
    .i_result(ex_result),
    .i_boj(ex_boj),
    .i_jalr(ex_jalr)
);

//// ID ////
wire [31:0] id_rs1_data, id_rs2_data, id_imm_data, id_pc;
wire [6:0] id_opcode;
wire [2:0] id_func3;
wire [3:0] id_alu_ctrl;

ID id_module(
    .clk(clk),
    .rst_n(rst_n),
    .i_instr(if_instr),
    .i_write_data(wb_data),
    .i_pc(if_pc),
    .i_wr(wb_rf_wr),
    .o_rs1_data(id_rs1_data),
    .o_rs2_data(id_rs2_data),
    .o_imm_data(id_imm_data),
    .o_opcode(id_opcode),
    .o_func3(id_func3),
    .o_alu_ctrl(id_alu_ctrl),
    .o_pc(id_pc)
);

//// EX ////
wire [31:0] ex_result, ex_pc, ex_imm_data, ex_data_store;
wire [6:0] ex_opcode;
wire [2:0] ex_func3;
wire ex_boj;
wire ex_jalr;

EX ex_module(
    .clk(clk),
    .rst_n(rst_n),
    .i_rs1_data(id_rs1_data),
    .i_rs2_data(id_rs2_data),
    .i_imm_data(id_imm_data),
    .i_pc(id_pc),
    .i_alu_ctrl(id_alu_ctrl),
    .i_func3(id_func3),
    .i_opcode(id_opcode),
    .o_result(ex_result),
    .o_data_store(ex_data_store),
    .o_pc(ex_pc),
    .o_func3(ex_func3),
    .o_opcode(ex_opcode),
    .o_boj(ex_boj),
    .o_jalr(ex_jalr),
    .o_imm_data(ex_imm_data)
);

//// MEM ////
wire [31:0] mem_wb_data;
wire [6:0] mem_opcode;
wire mem_wr_en;

MEM mem_module(
    .clk(clk),
    .rst_n(rst_n),
    .i_result(ex_result),
    .i_data_store(ex_data_store),
    .i_pc(ex_pc),
    .i_opcode(ex_opcode),
    .i_func3(ex_func3),
    .o_wb_data(mem_wb_data),
    .o_opcode(mem_opcode),
    .i_rd_ack(i_d_ack),
    .i_read_data(i_d_data),
    .o_stb(o_d_stb),
    .o_wr_en(o_d_wr_en),
    .o_addr(o_d_addr),
    .o_wr_data(o_d_write_data)
);

//// WB ////
wire wb_rf_wr;
wire [31:0] wb_data;

WB wb_module(
    .clk(clk),
    .rst_n(rst_n),
    .i_wb_data(mem_wb_data),
    .i_opcode(mem_opcode),
    .o_rf_wr(wb_rf_wr),
    .o_wb_data(wb_data)
);

endmodule
