//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

`ifndef PACKETFILTER_CORE_INCLUDE_GUARD
`define PACKETFILTER_CORE_INCLUDE_GUARD 1

/*

packetfilter_core.v

Simply wires up a cpu, instmem, and P3 system into one module (as per the 
diagram in the README)

TODO: we could actually honour the user's desired memory capacity. The user may
actually set it to a specific number just to cut down on BRAM usage

*/

`ifdef FROM_PACKETFILTER_CORE
`include "p3/p3.v"
`include "inst_mem/inst_mem.v"
`include "bpfcpu/bpfcpu.v"
`elsif FROM_PARALLEL_CORES
`include "packetfilter_core/p3/p3.v"
`include "packetfilter_core/inst_mem/inst_mem.v"
`include "packetfilter_core/bpfcpu/bpfcpu.v"
`elsif FROM_AXISTREAM_PACKETFILT
`include "parallel_cores/packetfilter_core/p3/p3.v"
`include "parallel_cores/packetfilter_core/inst_mem/inst_mem.v"
`include "parallel_cores/packetfilter_core/bpfcpu/bpfcpu.v"
`endif

`ifdef ICARUS_VERILOG
`define localparam parameter
`else /*For Vivado*/
`define localparam localparam
`endif

`define CLOG2(x) (\
   (((x) <= 2) ? 1 : \
   (((x) <= 4) ? 2 : \
   (((x) <= 8) ? 3 : \
   (((x) <= 16) ? 4 : \
   (((x) <= 32) ? 5 : \
   (((x) <= 64) ? 6 : \
   (((x) <= 128) ? 7 : \
   (((x) <= 256) ? 8 : \
   (((x) <= 512) ? 9 : \
   (((x) <= 1024) ? 10 : \
   (((x) <= 2048) ? 11 : \
   (((x) <= 4096) ? 12 : \
   (((x) <= 8192) ? 13 : \
   (((x) <= 16384) ? 14 : \
   (((x) <= 32768) ? 15 : \
   (((x) <= 65536) ? 16 : \
   -1)))))))))))))))))

module packetfilter_core # (
    parameter PACKET_MEM_BYTES = 2048,
    parameter INST_MEM_DEPTH = 512,
    parameter PACKMEM_DATA_WIDTH = 64,
    parameter BUF_IN = 0,
    parameter BUF_OUT = 0,
    parameter PESS = 0,
    
    //I normally wouldn't want these parameters here, but Verilog syntax
    //forces me to...
    //Or does it? I think maybe there's a way to just use the names in the
    //module definition?
    parameter CODE_ADDR_WIDTH = `CLOG2(INST_MEM_DEPTH),
    parameter CODE_DATA_WIDTH = 64,
    
    parameter BYTE_ADDR_WIDTH = `CLOG2(PACKET_MEM_BYTES),
    parameter PACKMEM_ADDR_WIDTH = BYTE_ADDR_WIDTH - `CLOG2(PACKMEM_DATA_WIDTH/8),
    
    parameter INC_WIDTH = `CLOG2(PACKMEM_DATA_WIDTH/8)+1,
    
    parameter PLEN_WIDTH = 32,
    
	parameter DBG_INFO_WIDTH = 
	  BYTE_ADDR_WIDTH	//byte_rd_addr
	+ 1					//cpu_rd_en
	+ 32				//resized_mem_data
	+ 1					//resized_mem_data_vld
	+ 1					//cpu_acc
	+ 1					//cpu_rej
	+ CODE_ADDR_WIDTH	//inst_rd_addr
	+ 1					//inst_rd_en
	+ CODE_DATA_WIDTH	//inst_rd_data
) (
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
    
    //Interface to forwarder
    input wire [PACKMEM_ADDR_WIDTH-1:0] fwd_addr,
    input wire fwd_rd_en,
    output wire [PACKMEM_DATA_WIDTH-1:0] fwd_rd_data,
    output wire fwd_rd_data_vld,
    output wire [PLEN_WIDTH-1:0] fwd_byte_len,
    input wire fwd_done,
    output wire rdy_for_fwd,
    input wire rdy_for_fwd_ack,
    
    //Interface for new code input
    input wire [CODE_ADDR_WIDTH-1:0] inst_wr_addr,
    input wire [CODE_DATA_WIDTH-1:0] inst_wr_data,
    input wire inst_wr_en,
    
    //Debug probes
    output wire [DBG_INFO_WIDTH -1:0] dbg_info
);
    `localparam P_NG_ADDR_WIDTH = PACKMEM_ADDR_WIDTH + 1;    
    
    /************************/
    /***P3 system <=> CPU ***/
    /************************/
    
    wire [BYTE_ADDR_WIDTH-1:0] byte_rd_addr;
    wire cpu_rd_en;
    wire [1:0] transfer_sz;
    wire [31:0] resized_mem_data; 
    wire resized_mem_data_vld;
    wire [PLEN_WIDTH-1:0] cpu_byte_len;

    wire cpu_acc;
    wire cpu_rej;

    wire rdy_for_cpu;
    wire rdy_for_cpu_ack;
    
    /***********************/
    /***inst_mem <=> CPU ***/
    /***********************/
    wire [CODE_ADDR_WIDTH-1:0] inst_rd_addr;
    wire [CODE_DATA_WIDTH-1:0] inst_rd_data;
    wire inst_rd_en;
    
    p3 # (
        .PACKMEM_ADDR_WIDTH(PACKMEM_ADDR_WIDTH),
        .PACKMEM_DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .INTERNAL_ADDR_WIDTH(P_NG_ADDR_WIDTH),
        .BYTE_ADDR_WIDTH(BYTE_ADDR_WIDTH),
        .INC_WIDTH(INC_WIDTH),
        .PLEN_WIDTH(PLEN_WIDTH),
        .BUF_IN(BUF_IN),
        .BUF_OUT(BUF_OUT),
        .PESS(PESS)
    ) the_p3_system (
        .clk(clk),
        .rst(rst),
        .sn_addr(sn_addr),
        .sn_wr_data(sn_wr_data),
        .sn_wr_en(sn_wr_en),
        .sn_byte_inc(sn_byte_inc),
        .sn_done(sn_done),
        .rdy_for_sn(rdy_for_sn),
        .rdy_for_sn_ack(rdy_for_sn_ack), //Yeah, I'm ready for a snack
        .byte_rd_addr(byte_rd_addr),
        .cpu_rd_en(cpu_rd_en),
        .transfer_sz(transfer_sz),
        .resized_mem_data(resized_mem_data),
        .resized_mem_data_vld(resized_mem_data_vld),
        .cpu_byte_len(cpu_byte_len),
        .cpu_acc(cpu_acc),
        .cpu_rej(cpu_rej),
        .rdy_for_cpu(rdy_for_cpu),
        .rdy_for_cpu_ack(rdy_for_cpu_ack),
        .fwd_addr(fwd_addr),
        .fwd_rd_en(fwd_rd_en),
        .fwd_rd_data(fwd_rd_data),
        .fwd_rd_data_vld(fwd_rd_data_vld),
        .fwd_byte_len(fwd_byte_len),
        .fwd_done(fwd_done),
        .rdy_for_fwd(rdy_for_fwd),
        .rdy_for_fwd_ack(rdy_for_fwd_ack)
    );  
    
    inst_mem # (
        .ADDR_WIDTH(CODE_ADDR_WIDTH),
        .DATA_WIDTH(64) //TODO: I might try shrinking the opcodes at some point
    ) the_inst_mem (
        .clk(clk),
        .wr_addr(inst_wr_addr),
        .wr_data(inst_wr_data),
        .wr_en(inst_wr_en),
        .rd_addr(inst_rd_addr),
        .rd_data(inst_rd_data),
        .rd_en(inst_rd_en)
    );


    bpfcpu # (
        .BYTE_ADDR_WIDTH(BYTE_ADDR_WIDTH),
        .PLEN_WIDTH(PLEN_WIDTH),
        .CODE_ADDR_WIDTH(CODE_ADDR_WIDTH),
        .CODE_DATA_WIDTH(64), //TODO: I might try shrinking the opcodes at some point
        .PESS(PESS)
    ) the_cpu (
        .clk(clk),
        .rst(rst),

        //Interface to P3
        .rdy_for_cpu(rdy_for_cpu),
        .resized_mem_data(resized_mem_data), 
        .resized_mem_data_vld(resized_mem_data_vld),
        .cpu_byte_len(cpu_byte_len),

        .byte_rd_addr(byte_rd_addr),
        .cpu_rd_en(cpu_rd_en),
        .transfer_sz(transfer_sz),
        .cpu_acc(cpu_acc),
        .cpu_rej(cpu_rej),
        .rdy_for_cpu_ack(rdy_for_cpu_ack),

        //Interface to intruction memory
        .inst_rd_addr(inst_rd_addr),
        .inst_rd_en(inst_rd_en),
        .instr_in(inst_rd_data)
    );
	
	assign dbg_info = {
		byte_rd_addr        ,
	    cpu_rd_en           ,
	    resized_mem_data    ,
	    resized_mem_data_vld,
	    cpu_acc             ,
	    cpu_rej             ,
	    inst_rd_addr        ,
	    inst_rd_en          ,
	    inst_rd_data
	};
	
	
	
	
endmodule

`undef CLOG2
`undef localparam

`endif //PACKETFILTER_CORE_INCLUDE_GUARD
