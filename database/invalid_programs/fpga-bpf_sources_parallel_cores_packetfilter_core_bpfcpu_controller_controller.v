//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
controller.v

Hooks up all the controller stages into one module
*/

`ifdef FROM_CONTROLLER
`include "../../bpf_defs.vh"
`include "stage0.v"
`include "stage0_point_5.v"
`include "stage1.v"
`include "stage2.v"
`elsif FROM_BPFCPU
`include "../bpf_defs.vh"
`include "controller/stage0.v"
`include "controller/stage0_point_5.v"
`include "controller/stage1.v"
`include "controller/stage2.v"
`elsif FROM_PACKETFILTER_CORE
`include "bpf_defs.vh"
`include "bpfcpu/controller/stage0.v"
`include "bpfcpu/controller/stage0_point_5.v"
`include "bpfcpu/controller/stage1.v"
`include "bpfcpu/controller/stage2.v"
`elsif FROM_PARALLEL_CORES
`include "packetfilter_core/bpf_defs.vh"
`include "packetfilter_core/bpfcpu/controller/stage0.v"
`include "packetfilter_core/bpfcpu/controller/stage0_point_5.v"
`include "packetfilter_core/bpfcpu/controller/stage1.v"
`include "packetfilter_core/bpfcpu/controller/stage2.v"
`elsif FROM_AXISTREAM_PACKETFILT
`include "parallel_cores/packetfilter_core/bpf_defs.vh"
`include "parallel_cores/packetfilter_core/bpfcpu/controller/stage0.v"
`include "parallel_cores/packetfilter_core/bpfcpu/controller/stage0_point_5.v"
`include "parallel_cores/packetfilter_core/bpfcpu/controller/stage1.v"
`include "parallel_cores/packetfilter_core/bpfcpu/controller/stage2.v"
`else /* For Vivado */
`include "bpf_defs.vh"
`endif


`define genif generate if
`define endgen end endgenerate

module controller # (
    parameter CODE_ADDR_WIDTH = 10,
    parameter PESS = 0
) (
    input wire clk,
    input wire rst,
    
    //Inputs from datapath
    input wire eq,
    input wire gt,
    input wire ge,
    input wire set,
    input wire ALU_vld,
    
    //Inputs from packet memory
    input wire [63:0] instr_in,
    input wire mem_vld,
    
    
    //Outputs to code memory
    output wire inst_rd_en,
    
    //Outputs to packet memory
    output wire rd_en,
    output wire acc,
    output wire rej,
    
    //Outputs to datapath
    //stage0 (and stage2)
    output wire PC_en,
    //stage1
    output wire B_sel,
    output wire [3:0] ALU_sel,
    output wire ALU_en,
    output wire addr_sel,
    output wire [1:0] transfer_sz,
    output wire regfile_wr_en,
    output wire [31:0] imm_stage1,
    //stage2
    output wire [7:0] jt,
    output wire [7:0] jf,
    output wire [1:0] PC_sel, 
    output wire [2:0] A_sel,
    output wire A_en,
    output wire [2:0] X_sel,
    output wire X_en,
    output wire [3:0] regfile_sel,
    output wire [31:0] imm_stage2,
    output wire ALU_ack,
    output wire [CODE_ADDR_WIDTH-1:0] jmp_correction
    
);

    //Stage 0 outputs
    wire vld_stage0;
    
    //Stage 0.5 outputs (not always used)
    wire [63:0] instr_out_stage0_5;
    wire [5:0] ocount_stage0_5;
    wire rdy_stage0_5;
    wire vld_stage0_5;
    
    //Stage 1 outputs
    wire [3:0] regfile_sel_stage1;
    wire [63:0] instr_out_stage1;
    wire [5:0] ocount_stage1;
    wire rdy_stage1;
    wire vld_stage1;
    
    //Stage 2 outputs
    wire [1:0] PC_sel_stage2; //branch_mispredict signifies when to use stage2's PC_sel over stage0's
    wire [3:0] regfile_sel_stage2; //stage2_reads_regfile signifies when to use stage2's regfile_sel
    wire branch_mispredict;
    wire stage2_reads_regfile; 
    wire stage2_writes_A;
    wire stage2_writes_X;
    wire rdy_stage2;


`genif (PESS) begin : with_idle_stage
    stage0 fetch  (
        .clk(clk),
        .rst(rst),
        .branch_mispredict(branch_mispredict),
        .inst_rd_en(inst_rd_en),
        .PC_en(PC_en),
        .next_rdy(rdy_stage0_5),
        .vld(vld_stage0)
    );
    
    stage0_point_5 idle_stage  (
        .clk(clk),
        .rst(rst),
        .instr_in(instr_in),
        .instr_out(instr_out_stage0_5),
        .PC_en(PC_en),
        .icount(6'b0),
        .ocount(ocount_stage0_5),
        .branch_mispredict(branch_mispredict),
        .prev_vld(vld_stage0),
        .rdy(rdy_stage0_5),
        .next_rdy(rdy_stage1),
        .vld(vld_stage0_5)
    );
    
    stage1 decode  (
        .clk(clk),
        .rst(rst),
        .instr_in(instr_out_stage0_5),
        .branch_mispredict(branch_mispredict),
        .stage2_reads_regfile(stage2_reads_regfile), //TODO: maybe make regfile dual port?
        .stage2_writes_A(stage2_writes_A),
        .stage2_writes_X(stage2_writes_X),
        .B_sel(B_sel),
        .ALU_sel(ALU_sel),
        .ALU_en(ALU_en),
        .addr_sel(addr_sel),
        .transfer_sz(transfer_sz),
        .rd_en(rd_en),
        .regfile_sel_stage1(regfile_sel_stage1),
        .regfile_wr_en(regfile_wr_en),
        .imm_stage1(imm_stage1),
        .instr_out(instr_out_stage1),
        .PC_en(PC_en),
        .icount(ocount_stage0_5),
        .ocount(ocount_stage1),
        .prev_vld(vld_stage0_5),
        .rdy(rdy_stage1),
        .next_rdy(rdy_stage2),
        .vld(vld_stage1)
    );
end else begin : no_idle_stage   
    stage0 fetch  (
        .clk(clk),
        .rst(rst),
        .branch_mispredict(branch_mispredict),
        .inst_rd_en(inst_rd_en),
        .PC_en(PC_en),
        .next_rdy(rdy_stage1),
        .vld(vld_stage0)
    );
    
    stage1 decode  (
        .clk(clk),
        .rst(rst),
        .instr_in(instr_in),
        .branch_mispredict(branch_mispredict),
        .stage2_reads_regfile(stage2_reads_regfile), //TODO: maybe make regfile dual port?
        .stage2_writes_A(stage2_writes_A),
        .stage2_writes_X(stage2_writes_X),
        .B_sel(B_sel),
        .ALU_sel(ALU_sel),
        .ALU_en(ALU_en),
        .addr_sel(addr_sel),
        .transfer_sz(transfer_sz),
        .rd_en(rd_en),
        .regfile_sel_stage1(regfile_sel_stage1),
        .regfile_wr_en(regfile_wr_en),
        .imm_stage1(imm_stage1),
        .instr_out(instr_out_stage1),
        .PC_en(PC_en),
        .icount(6'b0),
        .ocount(ocount_stage1),
        .prev_vld(vld_stage0),
        .rdy(rdy_stage1),
        .next_rdy(rdy_stage2),
        .vld(vld_stage1)
    );
`endgen


    stage2 # (
        .CODE_ADDR_WIDTH(CODE_ADDR_WIDTH)
    ) writeback (
        .clk(clk),
        .rst(rst),
        .instr_in(instr_out_stage1),
        .mem_vld(mem_vld),
        .eq(eq),
        .gt(gt),
        .ge(ge),
        .set(set),
        .ALU_vld(ALU_vld),
        .jt_out(jt),
        .jf_out(jf),
        .PC_sel(PC_sel_stage2), //branch_mispredict signifies when to use stage2's PC_sel over stage0's
        .A_sel(A_sel),
        .A_en(A_en),
        .X_sel(X_sel),
        .X_en(X_en),
        .regfile_sel_stage2(regfile_sel_stage2),
        .imm_stage2(imm_stage2),
        .ALU_ack(ALU_ack),
        .branch_mispredict(branch_mispredict),
        .acc(acc),
        .rej(rej),
        .stage2_reads_regfile(stage2_reads_regfile), 
        .stage2_writes_A(stage2_writes_A),
        .stage2_writes_X(stage2_writes_X),
        .PC_en(PC_en),
        .icount(ocount_stage1),
        .jmp_correction(jmp_correction),
        .prev_vld(vld_stage1),
        .rdy(rdy_stage2)
    );

    //Arbitrate PC_sel and regfile_sel
    assign PC_sel = (branch_mispredict) ? PC_sel_stage2 : `PC_SEL_PLUS_1;
    assign regfile_sel = (stage2_reads_regfile) ? regfile_sel_stage2 : regfile_sel_stage1;

endmodule

`undef genif
`undef endgen
