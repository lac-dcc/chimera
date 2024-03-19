//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*

fwd_arb.v

Wires up a tag tree and a mux tree. Uses the tricky tag_gen module to generate 
tags for each packetfilter_core.

*/

`ifdef FROM_FWD_ARB
`include "tag_gen/tag_gen.v"
`include "mux_tree/mux_tree.v"
`include "../tag_tree/tag_tree.v"
`elsif FROM_PARALLEL_CORES
`include "arbitration/fwd_arb/tag_gen/tag_gen.v"
`include "arbitration/fwd_arb/mux_tree/mux_tree.v"
`include "arbitration/tag_tree/tag_tree.v"
`elsif FROM_AXISTREAM_PACKETFILT
`include "parallel_cores/arbitration/fwd_arb/tag_gen/tag_gen.v"
`include "parallel_cores/arbitration/fwd_arb/mux_tree/mux_tree.v"
`include "parallel_cores/arbitration/tag_tree/tag_tree.v"
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

module fwd_arb # (
    parameter N = 4,
    parameter PACKMEM_ADDR_WIDTH = 8,
    parameter PACKMEM_DATA_WIDTH = 64,
    parameter PLEN_WIDTH = 32,
    //DELAY_CONF:
    //0 = all combinational
    //1 = delay stage on every second level
    //2 = delay stage on all levels
    parameter DELAY_CONF = (N>16)? 1 : 0
) (
    input wire clk,
    input wire rst,
    
    //TODO: fix this terrible naming convention!
    
    //Interface to forwarder
    input wire [PACKMEM_ADDR_WIDTH-1:0] addr,
    input wire rd_en,
    output wire [PACKMEM_DATA_WIDTH-1:0] rd_data,
    output wire rd_data_vld,
    output wire [PLEN_WIDTH-1:0] byte_len,
    input wire done,
    output wire rdy,
    input wire ack,
    
    //Interface to packetfilter_cores
    
    //Only hot signals need to be gated, however, we need to take in all the
    //outputs and put them through a MUX. So, since Verilog doesn't support 2D
    //ports, we have to do some really ugly stuff
    output wire [PACKMEM_ADDR_WIDTH-1:0] fwd_addr,
    output wire [N-1:0] fwd_rd_en,
    input wire [N*PACKMEM_DATA_WIDTH-1:0] fwd_rd_data,
    input wire [N-1:0] fwd_rd_data_vld,
    input wire [N*PLEN_WIDTH-1:0] fwd_byte_len,
    output wire [N-1:0] fwd_done,
    
    input wire [N-1:0] rdy_for_fwd,
    output wire [N-1:0] rdy_for_fwd_ack
);
    
    //local parameters
    `localparam PADDED = (N%3 == 1) ? N : ((N%3 == 0) ? (N+1) : (N+2));
    `localparam TAG_SZ = 2*((`CLOG2(PADDED)+1)/2); //= 2 * ceil(log_4(PADDED))
    
    //Internal signals
    wire [TAG_SZ*N-1:0] tags_i; //holds tag_gen output
    wire [TAG_SZ-1:0] tags_arr[0:N-1]; //To make the code a little nicer
    
    wire [TAG_SZ-1:0] selection_next;
    reg [TAG_SZ-1:0] selection = 0;
    
    //Generate custom tags. Surprisingly, Vivado will figure out that this are
    //all compile-time constants!
    tag_gen # (
        .N(N)
    ) select_tags (
        .tags(tags_i)
    );
    
    genvar i;
    for (i = 0; i < N; i = i + 1) begin
        assign tags_arr[i] = tags_i[TAG_SZ*(i+1)-1 -: TAG_SZ];
    end

    //Use tag tree to manage handshaking signals
    //This computes the rdy output, as well as the internal rdy_for_fwd_ack_i
    //and selection signals. These internal signals are delayed in pessimistic 
    //mode.
    tag_tree # (
        .N(N),
        .DELAY_CONF(DELAY_CONF),
        .CUSTOM_TAGS(1), 
        .TAG_SZ(TAG_SZ)
    ) the_tag_tree (
        .clk(clk),
        .rst(rst),
        
        .tag(selection_next),
        .rdy(rdy),
        .ack(ack),
        
        .rdy_in(rdy_for_fwd),
        .ack_out(rdy_for_fwd_ack),
        
        .custom_tags(tags_i)
    );

    //selection_i is registered when a handshake completes
    always @(posedge clk) begin
        if (rdy && ack) begin
            selection <= selection_next;
        end
    end
    
    //MUX tree for filter -> forwarder direction
    
    //Need to reshape and reindex the inputs to work with the mux tree
    `define MEM_VLD 1
    `define MUX_WIDTH (PACKMEM_DATA_WIDTH + `MEM_VLD + PLEN_WIDTH)
    
    wire [N*`MUX_WIDTH-1:0] mux_ins;
    
    for (i = 0; i < N; i = i + 1) begin
        assign mux_ins[`MUX_WIDTH*(i+1)-1 -: `MUX_WIDTH] = {
            fwd_rd_data[PACKMEM_DATA_WIDTH*(i+1)-1 -: PACKMEM_DATA_WIDTH],
            fwd_rd_data_vld[i],
            fwd_byte_len[PLEN_WIDTH*(i+1)-1 -: PLEN_WIDTH]
        };
    end
    
    mux_tree # (
        .N(N),
        .WIDTH(PACKMEM_DATA_WIDTH + `MEM_VLD + PLEN_WIDTH)
    ) the_big_mux (
        .clk(clk),
        .rst(rst),
        
        .sel(selection), //TODO: delay this input by MEM_LAT cycles, then remove WAITING state from forwarder
        .ins(mux_ins),
        .result({rd_data, rd_data_vld, byte_len})
    );
    
    //Assign remaining signals in forwarder -> filter direction
    
    assign fwd_addr = addr;
    //Gate the hot signals
    for (i = 0; i < N; i = i + 1) begin : gate_hot
        assign fwd_done[i] = done && (selection == tags_arr[i]);
        assign fwd_rd_en[i] = rd_en && (selection == tags_arr[i]);
    end
endmodule

`undef CLOG2
`undef localparam
