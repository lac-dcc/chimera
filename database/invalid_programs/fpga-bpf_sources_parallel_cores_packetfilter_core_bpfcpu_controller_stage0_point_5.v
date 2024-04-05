//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
stage0_point_5.v

If needed, this stage can be used to ease timing by breaking up the 
combinational path from code memory output to datapath control signals.

*/

`ifdef FROM_CONTROLLER
`include "../../../../generic/buffered_handshake/bhand.v"
`elsif FROM_BPFCPU
`include "../../../generic/buffered_handshake/bhand.v"
`elsif FROM_PACKETFILTER_CORE
`include "../../generic/buffered_handshake/bhand.v"
`elsif FROM_PARALLEL_CORES
`include "../generic/buffered_handshake/bhand.v"
`elsif FROM_AXISTREAM_PACKETFILT
`include "generic/buffered_handshake/bhand.v"
`else /* For Vivado */
`include "bpf_defs.vh"
`endif

module stage0_point_5 (
    input wire clk,
    input wire rst,
    
    input wire [63:0] instr_in,
    output wire [63:0] instr_out,
    
    //counts how many cycles instruction has been in pipeline
    input wire PC_en,
    input wire [5:0] icount,
    output wire [5:0] ocount,
    
    input wire branch_mispredict,
    input wire prev_vld,
    output wire rdy,
    input wire next_rdy,
    output wire vld
);

    bhand # (
        .DATA_WIDTH(64),
        .ENABLE_COUNT(1),
        .COUNT_WIDTH(6)
    ) delay_stage (
        .clk(clk),
        .rst(rst || branch_mispredict),
            
        .idata(instr_in),
        .idata_vld(prev_vld),
        .idata_rdy(rdy),
            
        .odata(instr_out),
        .odata_vld(vld),
        .odata_rdy(next_rdy),
        
        .cnt_en(PC_en),
        .icount(icount),
        .ocount(ocount)
    );
    
endmodule
