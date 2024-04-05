//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
tree_node.v

Implements the tree node as per the README in the sources/arbitration folder. 
Can be parameterized to perform buffered handshaking, or to be combinational.

*/

`ifdef FROM_TREE_NODE
`include "../../../../generic/buffered_handshake/bhand.v"
`elsif FROM_TAG_TREE
`include "../../../generic/buffered_handshake/bhand.v"
`elsif FROM_SNOOP_ARB
`include "../../../generic/buffered_handshake/bhand.v"
`elsif FROM_PARALLEL_CORES
`include "../generic/buffered_handshake/bhand.v"
`elsif FROM_AXISTREAM_PACKETFILT
`include "generic/buffered_handshake/bhand.v"
`endif

`define genif generate if
`define endgen end endgenerate

module tree_node # (
    parameter TAG_SZ = 5,
    parameter ENABLE_DELAY = 0
) (
    input wire clk,
    input wire rst,
    
    input wire [TAG_SZ-1:0] left_tag,
    input wire left_rdy,
    output wire left_ack,
    
    input wire [TAG_SZ-1:0] right_tag,
    input wire right_rdy,
    output wire right_ack,
    
    output wire [TAG_SZ-1:0] tag,
    output wire rdy,
    input wire ack
    
);
    /************************************/
    /**Forward-declare internal signals**/
    /************************************/
    
    wire [TAG_SZ-1:0] left_tag_i;
    wire left_rdy_i;
    wire left_ack_i;
    
    wire [TAG_SZ-1:0] right_tag_i;
    wire right_rdy_i;
    wire right_ack_i;
    
    wire [TAG_SZ-1:0] tag_i;
    wire rdy_i;
    wire ack_i;
    
    wire lr_sel_i; //Which of left or right is selected (0 = left)
    
    
    /***************************************/
    /**Assign internal signals from inputs**/
    /***************************************/
    
    assign left_tag_i = left_tag;
    assign left_rdy_i = left_rdy;
    
    assign right_tag_i = right_tag;
    assign right_rdy_i = right_rdy;
    
    //If delay is enabled, ack_i is set from the bhand instance in the output
    //assignment section 
`genif (!ENABLE_DELAY) begin
    assign ack_i = ack;
`endgen


    /****************/
    /**Do the logic**/
    /****************/

    assign lr_sel_i = (right_rdy_i && !left_rdy_i); //Defaults to using left
    
    assign rdy_i = left_rdy_i || right_rdy_i;
    assign tag_i = (lr_sel_i) ? right_tag_i : left_tag_i;
    assign left_ack_i = ack_i && (lr_sel_i == 0);
    assign right_ack_i = ack_i && (lr_sel_i == 1);
    
    
    /****************************************/
    /**Assign outputs from internal signals**/
    /****************************************/
    
`genif (ENABLE_DELAY) begin
    
    bhand # (
        .DATA_WIDTH(TAG_SZ),
        .ENABLE_COUNT(0)
    ) sit_shake_good_boy (
        .clk(clk),
        .rst(rst),
        
        .idata(tag_i),
        .idata_vld(rdy_i), //This was an unfortunate choice of variable names...
        .idata_rdy(ack_i),
        
        .odata(tag),
        .odata_vld(rdy),
        .odata_rdy(ack)
    );
    
end else begin
    assign tag = tag_i;
    assign rdy = rdy_i;
`endgen

    assign left_ack = left_ack_i;
    assign right_ack = right_ack_i;

endmodule

`undef genif
`undef endgen
