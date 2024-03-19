//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps
`default_nettype none

`ifdef FROM_P3
`include "p3ctrl/p3ctrl.v"
`include "muxes/muxes.v"
`include "p_ng/p_ng.v"
`include "agent_adapters/sn_adapter/sn_adapter.v"
`include "agent_adapters/cpu_adapter/cpu_adapter.v"
`include "agent_adapters/fwd_adapter/fwd_adapter.v"
`elsif FROM_PACKETFILTER_CORE
`include "p3/p3ctrl/p3ctrl.v"
`include "p3/muxes/muxes.v"
`include "p3/p_ng/p_ng.v"
`include "p3/agent_adapters/sn_adapter/sn_adapter.v"
`include "p3/agent_adapters/cpu_adapter/cpu_adapter.v"
`include "p3/agent_adapters/fwd_adapter/fwd_adapter.v"
`elsif FROM_PARALLEL_CORES
`include "packetfilter_core/p3/p3ctrl/p3ctrl.v"
`include "packetfilter_core/p3/muxes/muxes.v"
`include "packetfilter_core/p3/p_ng/p_ng.v"
`include "packetfilter_core/p3/agent_adapters/sn_adapter/sn_adapter.v"
`include "packetfilter_core/p3/agent_adapters/cpu_adapter/cpu_adapter.v"
`include "packetfilter_core/p3/agent_adapters/fwd_adapter/fwd_adapter.v"
`elsif FROM_AXISTREAM_PACKETFILT
`include "parallel_cores/packetfilter_core/p3/p3ctrl/p3ctrl.v"
`include "parallel_cores/packetfilter_core/p3/muxes/muxes.v"
`include "parallel_cores/packetfilter_core/p3/p_ng/p_ng.v"
`include "parallel_cores/packetfilter_core/p3/agent_adapters/sn_adapter/sn_adapter.v"
`include "parallel_cores/packetfilter_core/p3/agent_adapters/cpu_adapter/cpu_adapter.v"
`include "parallel_cores/packetfilter_core/p3/agent_adapters/fwd_adapter/fwd_adapter.v"
`endif
/*

p3.v: implements top-level module of the P3 system. Basically just wires all 
the stuff together.

TODO: This file got out of hand. It's extremely confusing to read and work with,
and the whole reason I'm rewriting this code is to make things easier to deal
with! So I gotta clean this up

*/

module p3 # (
    parameter PACKMEM_ADDR_WIDTH = 9,
	parameter PACKMEM_DATA_WIDTH = 64,
    parameter INTERNAL_ADDR_WIDTH = PACKMEM_ADDR_WIDTH+1,
    parameter BYTE_ADDR_WIDTH = 12,
    parameter INC_WIDTH = 8,
	parameter PLEN_WIDTH = 32,
    parameter BUF_IN = 0,
    parameter BUF_OUT = 0,
    parameter PESS = 0
)(
    input wire clk,
    input wire rst,
    
    //Interface to snooper
    input wire [PACKMEM_ADDR_WIDTH-1:0] sn_addr,
    input wire [PACKMEM_DATA_WIDTH-1:0] sn_wr_data,
    input wire sn_wr_en,
    input wire [INC_WIDTH-1:0] sn_byte_inc,
    
    input wire sn_done,
    
    output wire rdy_for_sn,
    input wire rdy_for_sn_ack, //Yeah, I'm ready for a snack
    
    //Interface to CPU
    input wire [BYTE_ADDR_WIDTH-1:0] byte_rd_addr,
    input wire cpu_rd_en,
    input wire [1:0] transfer_sz,
    output wire [31:0] resized_mem_data,
    output wire resized_mem_data_vld,
    output wire [PLEN_WIDTH-1:0] cpu_byte_len,
    
    input wire cpu_acc,
    input wire cpu_rej,
    
    output wire rdy_for_cpu,
    input wire rdy_for_cpu_ack,
    
    //Interface to forwarder
    input wire [PACKMEM_ADDR_WIDTH-1:0] fwd_addr,
    input wire fwd_rd_en,
    output wire [PACKMEM_DATA_WIDTH-1:0] fwd_rd_data,
    output wire fwd_rd_data_vld,
    output wire [PLEN_WIDTH-1:0] fwd_byte_len,
    
    input wire fwd_done,
    
    output wire rdy_for_fwd,
    input wire rdy_for_fwd_ack
);    
    
    //p3ctrl inputs
    wire A_done;
    wire rdy_for_A_ack;
    wire B_acc;
    wire B_rej;
    wire rdy_for_B_ack;
    wire C_done;
    wire rdy_for_C_ack; 
    
    //p3ctrl outputs
    wire rdy_for_A;
    wire rdy_for_B;
    wire rdy_for_C;
    wire [1:0] sn_sel;
    wire [1:0] cpu_sel;
    wire [1:0] fwd_sel;
    wire [1:0] ping_sel;
    wire [1:0] pang_sel;
    wire [1:0] pong_sel;
    
    
    //And you may ask yourself... 
    //...why are we going to all this extra trouble with putting every signal
    //through an adapter, even if it is the same as it ever was
    
    //The reason is in case I want to change the adapters to have buffering. 
    //I didn't add buffering right away cause it would take a lot of difficult 
    //thinking, and I'm not even sure if these are paths that will fail timing.
    
    //snooper adapter ports
    wire [INTERNAL_ADDR_WIDTH-1:0] sn_addr_i;
    wire sn_wr_en_i;
    wire [PACKMEM_DATA_WIDTH-1:0] sn_wr_data_i;
    wire [INC_WIDTH-1:0] sn_byte_inc_i;
    
    //CPU adapter ports    
    wire [INTERNAL_ADDR_WIDTH-1:0] cpu_addr_i;
    wire cpu_rd_en_i;
    wire [PACKMEM_DATA_WIDTH-1:0] cpu_bigword_i;
    wire cpu_bigword_vld_i;
    wire [PLEN_WIDTH-1:0] cpu_byte_len_i;
    
    //Forwarder adapter ports    
    wire [INTERNAL_ADDR_WIDTH-1:0] fwd_addr_i;
    wire fwd_rd_en_i;
    wire [PACKMEM_DATA_WIDTH-1:0] fwd_rd_data_i;
    wire fwd_rd_data_vld_i;
    wire [PLEN_WIDTH-1:0] fwd_byte_len_i;   
    
    //ping inputs
    wire ping_rd_en; 
    wire ping_wr_en; 
    wire [INTERNAL_ADDR_WIDTH-1:0] ping_addr; 
    wire [PACKMEM_DATA_WIDTH-1:0] ping_idata;
    wire [INC_WIDTH-1:0] ping_byte_inc;
    wire ping_reset_len;
    //ping outputs
    wire [PACKMEM_DATA_WIDTH-1:0] ping_odata;
    wire ping_odata_vld;
    wire [PLEN_WIDTH-1:0] ping_byte_length;
    
    //pang inputs
    wire pang_rd_en; 
    wire pang_wr_en; 
    wire [INTERNAL_ADDR_WIDTH-1:0] pang_addr; 
    wire [PACKMEM_DATA_WIDTH-1:0] pang_idata;
    wire [INC_WIDTH-1:0] pang_byte_inc;
    wire pang_reset_len;
    //pang outputs
    wire [PACKMEM_DATA_WIDTH-1:0] pang_odata;
    wire pang_odata_vld;
    wire [PLEN_WIDTH-1:0] pang_byte_length;
    
    //pong inputs
    wire pong_rd_en; 
    wire pong_wr_en; 
    wire [INTERNAL_ADDR_WIDTH-1:0] pong_addr; 
    wire [PACKMEM_DATA_WIDTH-1:0] pong_idata;
    wire [INC_WIDTH-1:0] pong_byte_inc;
    wire pong_reset_len;
    //pong outputs
    wire [PACKMEM_DATA_WIDTH-1:0] pong_odata;
    wire pong_odata_vld;
    wire [PLEN_WIDTH-1:0] pong_byte_length;
    
    sn_adapter # (
        .PACKMEM_ADDR_WIDTH(PACKMEM_ADDR_WIDTH),
        .PACKMEM_DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .INC_WIDTH(INC_WIDTH)
    ) to_snoop (
        .clk(clk),
        .rst(rst),
        
        //Interface to snooper
        .sn_addr(sn_addr),
        .sn_wr_data(sn_wr_data),
        .sn_wr_en(sn_wr_en),
        .sn_byte_inc(sn_byte_inc),
        .sn_done(sn_done),
        .rdy_for_sn_ack(rdy_for_sn_ack),
        .rdy_for_sn(rdy_for_sn),
        
        //Interface to P3 system
        .addr(sn_addr_i),
        .wr_en(sn_wr_en_i),
        .wr_data(sn_wr_data_i),
        .byte_inc(sn_byte_inc_i),
        .done(A_done),
        .rdy_ack(rdy_for_A_ack),
        .rdy(rdy_for_A)
    );  
    
    cpu_adapter # (
        .BYTE_ADDR_WIDTH(BYTE_ADDR_WIDTH),
        .ADDR_WIDTH(INTERNAL_ADDR_WIDTH),
        .PACKMEM_DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .PLEN_WIDTH(PLEN_WIDTH),
        .BUF_IN(BUF_IN),
        .BUF_OUT(BUF_OUT),
        .PESS(PESS)
    ) to_cpu (
        .clk(clk),
        .rst(rst),
        
        //Interface to CPU
        .byte_rd_addr(byte_rd_addr),
        .cpu_rd_en(cpu_rd_en),
        .transfer_sz(transfer_sz),
        .cpu_acc(cpu_acc),
        .cpu_rej(cpu_rej),
        .rdy_for_cpu_ack(rdy_for_cpu_ack),
        .rdy_for_cpu(rdy_for_cpu),
        .resized_mem_data(resized_mem_data),
        .resized_mem_data_vld(resized_mem_data_vld),
        .cpu_byte_len(cpu_byte_len),
        
        //Interface to P3 system
        .word_rd_addra(cpu_addr_i),
        .rd_en(cpu_rd_en_i),
        .acc(B_acc),
        .rej(B_rej),
        .rdy_ack(rdy_for_B_ack),
        .rdy(rdy_for_B),
        .bigword(cpu_bigword_i),
        .bigword_vld(cpu_bigword_vld_i),
        .byte_len(cpu_byte_len_i)
    );
    
    fwd_adapter # (
        .PACKMEM_ADDR_WIDTH(PACKMEM_ADDR_WIDTH),
        .PACKMEM_DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .PLEN_WIDTH(PLEN_WIDTH),
        //These control pessimistic registers in the p_ng buffers
        .BUF_IN(BUF_IN),
        .BUF_OUT(BUF_OUT),
        .PESS(PESS) //If 1, our output will be buffered
    ) to_fwd (
        .clk(clk),
        .rst(rst),
        
        //Interface to forwarder
        .fwd_addr(fwd_addr),
        .fwd_rd_en(fwd_rd_en),
        .fwd_done(fwd_done),
        .rdy_for_fwd_ack(rdy_for_fwd_ack),
        .rdy_for_fwd(rdy_for_fwd),
        .fwd_rd_data(fwd_rd_data),
        .fwd_rd_data_vld(fwd_rd_data_vld),
        .fwd_bytes(fwd_byte_len),
        
        //Interface to P3
        .addr(fwd_addr_i),
        .rd_en(fwd_rd_en_i),
        .done(C_done),
        .rdy_ack(rdy_for_C_ack),
        .rdy(rdy_for_C),
        .rd_data(fwd_rd_data_i),
        .rd_data_vld(fwd_rd_data_vld_i),
        .bytes(fwd_byte_len_i)
    ); 

    p3ctrl ctrlr (
        .clk(clk),
        .rst(rst),
        .A_done(A_done),
        .rdy_for_A(rdy_for_A),
        .rdy_for_A_ack(rdy_for_A_ack),
        .B_acc(B_acc),
        .B_rej(B_rej),
        .rdy_for_B(rdy_for_B),
        .rdy_for_B_ack(rdy_for_B_ack),
        .C_done(C_done),
        .rdy_for_C(rdy_for_C),
        .rdy_for_C_ack(rdy_for_C_ack),
        .sn_sel(sn_sel),
        .cpu_sel(cpu_sel),
        .fwd_sel(fwd_sel),
        .ping_sel(ping_sel),
        .pang_sel(pang_sel),
        .pong_sel(pong_sel)
    );

    muxes # (
        .ADDR_WIDTH(INTERNAL_ADDR_WIDTH),
        .DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .INC_WIDTH(INC_WIDTH),
        .PLEN_WIDTH(PLEN_WIDTH)
    ) themux (

        //Format is {addr, wr_data, wr_en, bytes_inc}
        .from_sn({sn_addr_i, sn_wr_data_i, sn_wr_en_i, sn_byte_inc_i}),
        //Format is {addr, reset_sig, rd_en}
        .from_cpu({cpu_addr_i, B_rej, cpu_rd_en_i}),
        .from_fwd({fwd_addr_i, C_done, fwd_rd_en_i}),
        
        //Format is {rd_data, rd_data_vld, packet_len}
        .from_ping({ping_odata, ping_odata_vld, ping_byte_length}),
        .from_pang({pang_odata, pang_odata_vld, pang_byte_length}),
        .from_pong({pong_odata, pong_odata_vld, pong_byte_length}),
        
        //Nothing to output to snooper
        //Format is {rd_data, rd_data_vld, packet_len}
        .to_cpu({cpu_bigword_i, cpu_bigword_vld_i, cpu_byte_len_i}),
        .to_fwd({fwd_rd_data_i, fwd_rd_data_vld_i, fwd_byte_len_i}),
        
        //Format here is {addr, wr_data, wr_en, bytes_inc, reset_sig, rd_en}
        .to_ping({ping_addr, ping_idata, ping_wr_en, ping_byte_inc, ping_reset_len, ping_rd_en}),
        .to_pang({pang_addr, pang_idata, pang_wr_en, pang_byte_inc, pang_reset_len, pang_rd_en}),
        .to_pong({pong_addr, pong_idata, pong_wr_en, pong_byte_inc, pong_reset_len, pong_rd_en}),
        
        .sn_sel(sn_sel),
        .cpu_sel(cpu_sel),
        .fwd_sel(fwd_sel),
        
        .ping_sel(ping_sel),
        .pang_sel(pang_sel),
        .pong_sel(pong_sel)
    );

    p_ng # (
        .ADDR_WIDTH(INTERNAL_ADDR_WIDTH),
        .DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .INC_WIDTH(INC_WIDTH),
        .PLEN_WIDTH(PLEN_WIDTH),
        .BUF_IN(BUF_IN),
        .BUF_OUT(BUF_OUT)
    ) ping (
        .clk(clk),
        .rst(rst || ping_reset_len), //Note: does not actually change the stored memory
        .rd_en(ping_rd_en), //@0
        .wr_en(ping_wr_en), //@0
        .addr(ping_addr), //@0
        .idata(ping_idata), //@0
        .byte_inc(ping_byte_inc), //@0
        .odata(ping_odata), //@1 + BUF_IN + BUF_OUT
        .odata_vld(ping_odata_vld), //@1 + BUF_IN + BUF_OUT
        .byte_length(ping_byte_length)
    );

    p_ng # (
        .ADDR_WIDTH(INTERNAL_ADDR_WIDTH),
        .DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .INC_WIDTH(INC_WIDTH),
        .PLEN_WIDTH(PLEN_WIDTH),
        .BUF_IN(BUF_IN),
        .BUF_OUT(BUF_OUT)
    ) pang (
        .clk(clk),
        .rst(rst || pang_reset_len), //Note: does not actually change the stored memory
        .rd_en(pang_rd_en), //@0
        .wr_en(pang_wr_en), //@0
        .addr(pang_addr), //@0
        .idata(pang_idata), //@0
        .byte_inc(pang_byte_inc), //@0
        .odata(pang_odata), //@1 + BUF_IN + BUF_OUT
        .odata_vld(pang_odata_vld), //@1 + BUF_IN + BUF_OUT
        .byte_length(pang_byte_length)
    );

    p_ng # (
        .ADDR_WIDTH(INTERNAL_ADDR_WIDTH),
        .DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .INC_WIDTH(INC_WIDTH),
        .PLEN_WIDTH(PLEN_WIDTH),
        .BUF_IN(BUF_IN),
        .BUF_OUT(BUF_OUT)
    ) pong (
        .clk(clk),
        .rst(rst || pong_reset_len), //Note: does not actually change the stored memory
        .rd_en(pong_rd_en), //@0
        .wr_en(pong_wr_en), //@0
        .addr(pong_addr), //@0
        .idata(pong_idata), //@0
        .byte_inc(pong_byte_inc), //@0
        .odata(pong_odata), //@1 + BUF_IN + BUF_OUT
        .odata_vld(pong_odata_vld), //@1 + BUF_IN + BUF_OUT
        .byte_length(pong_byte_length)
    );

endmodule
