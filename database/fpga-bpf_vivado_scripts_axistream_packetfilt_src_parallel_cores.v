//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*

parallel_cores.v

If everything goes to plan, this module should have the exact same interface as
a single packetfilter_core.

*/

`ifdef FROM_PARALLEL_CORES
`include "packetfilter_core/packetfilter_core.v"
`include "arbitration/snoop_arb/snoop_arb.v"
`include "arbitration/fwd_arb/fwd_arb.v"
`elsif FROM_AXISTREAM_PACKETFILT
`include "parallel_cores/packetfilter_core/packetfilter_core.v"
`include "parallel_cores/arbitration/snoop_arb/snoop_arb.v"
`include "parallel_cores/arbitration/fwd_arb/fwd_arb.v"
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


module parallel_cores # (
    parameter N = 4,
    parameter PACKET_MEM_BYTES = 2048,
    parameter INST_MEM_DEPTH = 512,
    parameter PACKMEM_DATA_WIDTH = 64,
    parameter BUF_IN = 0,
    parameter BUF_OUT = 0,
    parameter PESS = 0,
    
    
    //Derived parameters. Probably shouldn't set these manually, except maybe
    //DELAY_CONF
    
    //DELAY_CONF:
    //0 = all combinational
    //1 = delay stage on every second level
    //2 = delay stage on all levels
    parameter DELAY_CONF = (N>16)? 1 : 0,
    
    parameter TAG_SZ = `CLOG2(N),
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
    output wire [N*DBG_INFO_WIDTH -1:0] dbg_info
);
    /*************************************/
    /***snoop_arb <=> packetfiler_cores***/
    /*************************************/
    
    //Interface to packetfilter_cores
    wire [N-1:0] rdy_for_sn_i;
    
    wire [PACKMEM_ADDR_WIDTH-1:0] sn_addr_i;
    wire [PACKMEM_DATA_WIDTH-1:0] sn_wr_data_i;
    wire [N-1:0] sn_wr_en_i;
    wire [INC_WIDTH-1:0] sn_byte_inc_i;
    wire [N-1:0] sn_done_i;
    wire [N-1:0] rdy_for_sn_ack_i; //Yeah, I'm ready for a snack
    
    /************************************/
    /***fwd_arb <=> packetfilter_cores***/
    /************************************/
    wire [PACKMEM_ADDR_WIDTH-1:0] fwd_addr_i;
    wire [N-1:0] fwd_rd_en_i;
    wire [N*PACKMEM_DATA_WIDTH-1:0] fwd_rd_data_i;
    wire [N-1:0] fwd_rd_data_vld_i;
    wire [N*PLEN_WIDTH-1:0] fwd_byte_len_i;
    wire [N-1:0] fwd_done_i;
    wire [N-1:0] rdy_for_fwd_i;
    wire [N-1:0] rdy_for_fwd_ack_i; 
    
    
    /********************/
    /***Instantiations***/
    /********************/
    
    genvar i;
    generate for (i = 0; i < N; i = i + 1) begin
        packetfilter_core # (
            .PACKET_MEM_BYTES(PACKET_MEM_BYTES),
            .INST_MEM_DEPTH(INST_MEM_DEPTH),
            .PACKMEM_DATA_WIDTH(PACKMEM_DATA_WIDTH),
            .BUF_IN(BUF_IN),
            .BUF_OUT(BUF_OUT),
            .PESS(PESS)
        ) filt (
            .clk(clk),
            .rst(rst),


            //Interface to snooper
            .sn_addr(sn_addr_i),
            .sn_wr_data(sn_wr_data_i),
            .sn_wr_en(sn_wr_en_i[i]),
            .sn_byte_inc(sn_byte_inc_i),
            .sn_done(sn_done_i[i]),
            .rdy_for_sn(rdy_for_sn_i[i]),
            .rdy_for_sn_ack(rdy_for_sn_ack_i[i]), //Yeah, I'm ready for a snack

            //Interface to forwarder
            .fwd_addr(fwd_addr_i),
            .fwd_rd_en(fwd_rd_en_i[i]),
            .fwd_rd_data(fwd_rd_data_i[PACKMEM_DATA_WIDTH*(i+1)-1 -: PACKMEM_DATA_WIDTH]),
            .fwd_rd_data_vld(fwd_rd_data_vld_i[i]),
            .fwd_byte_len(fwd_byte_len_i[PLEN_WIDTH*(i+1)-1 -: PLEN_WIDTH]),
            .fwd_done(fwd_done_i[i]),
            .rdy_for_fwd(rdy_for_fwd_i[i]),
            .rdy_for_fwd_ack(rdy_for_fwd_ack_i[i]),

            //Interface for new code input
            .inst_wr_addr(inst_wr_addr),
            .inst_wr_data(inst_wr_data),
            .inst_wr_en(inst_wr_en),
            
            //Debug probes
            .dbg_info(dbg_info[DBG_INFO_WIDTH*(i+1) - 1 -: DBG_INFO_WIDTH])
        );
    end endgenerate
    
    //Yes I'm the arbiter, my word is laaaaaawwww-aaww-aw...
    snoop_arb # (
        .PACKMEM_ADDR_WIDTH(PACKMEM_ADDR_WIDTH),
        .PACKMEM_DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .INC_WIDTH(INC_WIDTH),
        .N(N),
        .TAG_SZ(TAG_SZ),
        .DELAY_CONF(DELAY_CONF),
        .PESS(PESS)
    ) snooper_arbiter (
        .clk(clk),
        .rst(rst),

        //Interface to snooper
        .addr(sn_addr),
        .wr_data(sn_wr_data),
        .wr_en(sn_wr_en),
        .byte_inc(sn_byte_inc),
        .done(sn_done),
        .ack(rdy_for_sn_ack),

        .rdy(rdy_for_sn),

        //Interface to packetfilter_cores
        .rdy_for_sn(rdy_for_sn_i),

        .sn_addr(sn_addr_i),
        .sn_wr_data(sn_wr_data_i),
        .sn_wr_en(sn_wr_en_i),
        .sn_byte_inc(sn_byte_inc_i),
        .sn_done(sn_done_i),
        .rdy_for_sn_ack(rdy_for_sn_ack_i) //Yeah, I'm ready for a snack   
    );
    
    //...from step one I'll be watching all... 2^6....
    fwd_arb # (
        .N(N),
        .PACKMEM_ADDR_WIDTH(PACKMEM_ADDR_WIDTH),
        .PACKMEM_DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .PLEN_WIDTH(PLEN_WIDTH),
        .DELAY_CONF(DELAY_CONF)
    ) forwarder_arbiter (
        .clk(clk),
        .rst(rst),
        
        //Interface to forwarder
        .addr(fwd_addr),
        .rd_en(fwd_rd_en),
        .rd_data(fwd_rd_data),
        .rd_data_vld(fwd_rd_data_vld),
        .byte_len(fwd_byte_len),
        .done(fwd_done),
        .rdy(rdy_for_fwd),
        .ack(rdy_for_fwd_ack),
        
        //Interface to packetfilter_cores
        .fwd_addr(fwd_addr_i),
        .fwd_rd_en(fwd_rd_en_i),
        .fwd_rd_data(fwd_rd_data_i),
        .fwd_rd_data_vld(fwd_rd_data_vld_i),
        .fwd_byte_len(fwd_byte_len_i),
        .fwd_done(fwd_done_i),
        .rdy_for_fwd(rdy_for_fwd_i),
        .rdy_for_fwd_ack(rdy_for_fwd_ack_i)
    );
endmodule

`undef CLOG2
