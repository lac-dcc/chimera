//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE


`ifndef TAG_TREE_INCLUDE_GUARD
`define TAG_TREE_INCLUDE_GUARD 1


`timescale 1ns / 1ps

/*
tag_tree.v

Wires up tree_nodes to make a tree. Is smart about not making a tree when N = 1.
*/

`ifdef FROM_TAG_TREE
`include "tree_node/tree_node.v"
`elsif FROM_SNOOP_ARB
`include "../tag_tree/tree_node/tree_node.v"
`elsif FROM_FWD_ARB
`include "../tag_tree/tree_node/tree_node.v"
`elsif FROM_PARALLEL_CORES
`include "arbitration/tag_tree/tree_node/tree_node.v"
`elsif FROM_AXISTREAM_PACKETFILT
`include "parallel_cores/arbitration/tag_tree/tree_node/tree_node.v"
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

module tag_tree # (
    parameter N = 4,
    //DELAY_CONF:
    //0 = all combinational
    //1 = delay stage on every second level
    //2 = delay stage on all levels
    parameter DELAY_CONF = 1,
    parameter CUSTOM_TAGS = 0,
    parameter TAG_SZ = `CLOG2(N)
) (
    input wire clk,
    input wire rst,
    
    output wire [TAG_SZ-1:0] tag,
    output wire rdy,
    input wire ack,
    
    input wire [N-1:0] rdy_in,
    output wire [N-1:0] ack_out,
    
    input wire [N*TAG_SZ-1:0] custom_tags //Unused when CUSTOM_TAGS = 0
);

    wire [TAG_SZ-1:0] tags_i[0:(2*N-1)-1];
    wire rdys_i[0:(2*N-1)-1];
    wire acks_i[0:(2*N-1)-1];
    
    
    genvar k;
    
    //Do assignments to leaves of tree
    for (k = 0; k < N; k = k + 1) begin : leaves
        if (CUSTOM_TAGS) begin
            assign tags_i[k] = custom_tags[TAG_SZ*(k+1)-1 -: TAG_SZ];
        end else begin
            assign tags_i[k] = k;
        end
        assign rdys_i[k] = rdy_in[k];
        assign ack_out[k] = acks_i[k];
    end
    
    //Build up internal nodes
    for (k = 0; k < N-1; k = k + 1) begin : internal_nodes
        tree_node # (
            .TAG_SZ(TAG_SZ),
            .ENABLE_DELAY(((DELAY_CONF == 1) && (`CLOG2(N-k) & 1'b1)) || (DELAY_CONF == 2))
        ) node (
            .clk(clk),
            .rst(rst),
            
            .left_tag(tags_i[2*k]),
            .left_rdy(rdys_i[2*k]),
            .left_ack(acks_i[2*k]),
            
            .right_tag(tags_i[2*k+1]),
            .right_rdy(rdys_i[2*k+1]),
            .right_ack(acks_i[2*k+1]),
            
            .tag(tags_i[k+N]),
            .rdy(rdys_i[k+N]),
            .ack(acks_i[k+N])
        );
    end
    
    //Assign outputs from tree root
    assign tag = tags_i[(2*N-1)-1];
    assign rdy = rdys_i[(2*N-1)-1];
    assign acks_i[(2*N-1)-1] = ack;


endmodule

`undef CLOG2

`endif
