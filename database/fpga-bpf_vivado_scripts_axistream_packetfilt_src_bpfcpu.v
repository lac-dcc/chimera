//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
bpfcpu.v

Wires together the controller and the datapath. Also handles handshaking 
signals with P3 controller
*/

`ifdef FROM_BPFCPU
`include "controller/controller.v"
`include "datapath/datapath.v"
`elsif FROM_PACKETFILTER_CORE
`include "bpfcpu/controller/controller.v"
`include "bpfcpu/datapath/datapath.v"
`elsif FROM_PARALLEL_CORES
`include "packetfilter_core/bpfcpu/controller/controller.v"
`include "packetfilter_core/bpfcpu/datapath/datapath.v"
`elsif FROM_AXISTREAM_PACKETFILT
`include "parallel_cores/packetfilter_core/bpfcpu/controller/controller.v"
`include "parallel_cores/packetfilter_core/bpfcpu/datapath/datapath.v"
`endif

`ifdef ICARUS_VERILOG
`define localparam parameter
`else /*For Vivado*/
`define localparam localparam
`endif

module bpfcpu # (
    parameter BYTE_ADDR_WIDTH = 12,
    parameter PLEN_WIDTH = 32,
    parameter CODE_ADDR_WIDTH = 10,
    parameter CODE_DATA_WIDTH = 64,
    parameter PESS = 0
) (
    input wire clk,
    input wire rst,

    //Interface to P3
    input wire rdy_for_cpu,
    input wire [31:0] resized_mem_data, 
    input wire resized_mem_data_vld,
    input wire [PLEN_WIDTH-1:0] cpu_byte_len,
    
    output wire [BYTE_ADDR_WIDTH-1:0] byte_rd_addr,
    output wire cpu_rd_en,
    output wire [1:0] transfer_sz,
    output wire cpu_acc,
    output wire cpu_rej,
    output wire rdy_for_cpu_ack,
    
    //Interface to intruction memory
    output wire [CODE_ADDR_WIDTH-1:0] inst_rd_addr,
    output wire inst_rd_en,
    input wire [CODE_DATA_WIDTH-1:0] instr_in

);
    wire hold_in_rst;
    
    //Helpful wires
    wire start_sig;
    assign start_sig = rdy_for_cpu && rdy_for_cpu_ack;
    wire done_sig;
    assign done_sig = (cpu_acc || cpu_rej);
    
    //Control FSM for P3 handshaking
    `localparam STOPPED = 0;
    `localparam STARTED = 1;
    reg state = STOPPED;
    
    //next-state logic
    //Note: I know it's impossible for both sigs to go high on the same cycle,
    //since rdy_for_cpu_ack can only be high in the stopped state
    //I'll have to be more careful in the snooper... if data comes in on every
    //single clock cycle then we won't tolerate little "bubbles" when not 
    //completely necessary
    always @(posedge clk) begin
        if (rst) begin
            state <= STOPPED;
        end else begin
            if (state == STOPPED) begin
                state <= (start_sig) ? STARTED : STOPPED;
            end else begin
                state <= (done_sig) ? STOPPED : STARTED;
            end
        end
    end
    //state machine outputs
    assign rdy_for_cpu_ack = (state == STOPPED); //For high performance: assign rdy_for_cpu_ack = (state == STOPPED) || done_sig, and check for both sigs in (state == STARTED) case
    assign hold_in_rst = (state == STOPPED);
    
    //Controller outputs
    wire PC_en;
    wire B_sel;
    wire [3:0] ALU_sel;
    wire ALU_en;
    wire addr_sel;
    wire regfile_wr_en;
    wire [31:0] imm_stage1;
    wire [7:0] jt;
    wire [7:0] jf;
    wire [1:0] PC_sel; 
    wire [2:0] A_sel;
    wire A_en;
    wire [2:0] X_sel;
    wire X_en;
    wire [3:0] regfile_sel;
    wire [31:0] imm_stage2;
    wire ALU_ack;
    wire [CODE_ADDR_WIDTH-1:0] jmp_correction;
    
    //Datapath outputs
    wire eq;
    wire gt;
    wire ge;
    wire set;
    wire ALU_vld;
    
    controller # (
        .CODE_ADDR_WIDTH(CODE_ADDR_WIDTH),
        .PESS(PESS)
    ) ctrl (
        .clk(clk),
        .rst(rst || hold_in_rst),
        .eq(eq),
        .gt(gt),
        .ge(ge),
        .set(set),
        .ALU_vld(ALU_vld),
        .instr_in(instr_in),
        .mem_vld(resized_mem_data_vld), //TODO: add caching to cpu_adapter
        .inst_rd_en(inst_rd_en),
        .rd_en(cpu_rd_en),
        .acc(cpu_acc),
        .rej(cpu_rej),
        .PC_en(PC_en),
        .B_sel(B_sel),
        .ALU_sel(ALU_sel),
        .ALU_en(ALU_en),
        .addr_sel(addr_sel),
        .transfer_sz(transfer_sz),
        .regfile_wr_en(regfile_wr_en),
        .imm_stage1(imm_stage1),
        .jt(jt),
        .jf(jf),
        .PC_sel(PC_sel), 
        .A_sel(A_sel),
        .A_en(A_en),
        .X_sel(X_sel),
        .X_en(X_en),
        .regfile_sel(regfile_sel),
        .imm_stage2(imm_stage2),
        .ALU_ack(ALU_ack),
        .jmp_correction(jmp_correction)
    );

    datapath # (
        .BYTE_ADDR_WIDTH(BYTE_ADDR_WIDTH),
        .CODE_ADDR_WIDTH(CODE_ADDR_WIDTH),
        .PLEN_WIDTH(PLEN_WIDTH)
    ) dpath (
        .clk(clk),
        .rst(rst || hold_in_rst),
        .A_sel(A_sel),
        .A_en(A_en),
        .X_sel(X_sel),
        .X_en(X_en),
        .PC_sel(PC_sel),
        .PC_en(PC_en),
        .inst_rd_addr(inst_rd_addr),
        .B_sel(B_sel),
        .ALU_sel(ALU_sel),
        .ALU_en(ALU_en),
        .eq(eq),
        .gt(gt),
        .ge(ge),
        .set(set),
        .ALU_vld(ALU_vld),
        .ALU_ack(ALU_ack),
        .regfile_sel(regfile_sel),
        .regfile_wr_en(regfile_wr_en),
        .addr_sel(addr_sel),
        .packet_rd_addr(byte_rd_addr),
        .packet_data(resized_mem_data),
        .packet_len(cpu_byte_len),
        .imm_stage1(imm_stage1),
        .imm_stage2(imm_stage2),
        .jt(jt),
        .jf(jf),
        .jmp_correction(jmp_correction)
    );

endmodule

`undef localparam
