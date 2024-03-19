//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
mux_tree.v

*/

`ifdef FROM_MUX_TREE
`include "mux_tree_node/mux_tree_node.v"
`elsif FROM_FWD_ARB
`include "mux_tree/mux_tree_node/mux_tree_node.v"
`elsif FROM_PARALLEL_CORES
`include "arbitration/fwd_arb/mux_tree/mux_tree_node/mux_tree_node.v"
`elsif FROM_AXISTREAM_PACKETFILT
`include "parallel_cores/arbitration/fwd_arb/mux_tree/mux_tree_node/mux_tree_node.v"
`endif

`ifdef ICARUS_VERILOG
`define localparam parameter
`else /*For Vivado*/
`define localparam localparam
`endif

`define CLOG2(x) (\
   (((x) <= 1) ? 0 : \
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
   -1))))))))))))))))))

//I coudln't find a small enough closed-form expression, so here's another look-up table
//No one will have more than 5460 nodes... right?
`define H(x) (\
   (((x) <= 0) ? 0 : \
   (((x) <= 4) ? 1 : \
   (((x) <= 20) ? 2 : \
   (((x) <= 84) ? 3 : \
   (((x) <= 340) ? 4 : \
   (((x) <= 1364) ? 5 : \
   (((x) <= 5460) ? 6 : \
   -1))))))))
	

`define CLOG4(x) ((`CLOG2(x)+1)/2)
`define genfor generate for
`define endgen end endgenerate

`define MIN(A,B) (((A)<(B))?(A):(B))

module mux_tree # (
    parameter N = 4,
    parameter WIDTH = 32,
    
    //Auto-derived parameters. Do not set
	parameter PADDED = (N%3 == 1) ? N : ((N%3 == 0) ? (N+1) : (N+2)),
	parameter TAG_SZ = 2*`CLOG4(PADDED) //= 2 * ceil(log_4(PADDED))
) (
    input wire clk,
    input wire rst,
    
    input wire [TAG_SZ-1:0] sel,
    input wire [N*WIDTH-1:0] ins,
    output wire [WIDTH-1:0] result
    
);
    
	`localparam NUM_NODES = PADDED + (PADDED-1)/3; //Total nodes in tree
	`localparam MAX_H = `CLOG4(PADDED); //Tree height
	`localparam X_C = `MIN(N,NUM_NODES - (4**MAX_H - 1) / 3); //Cutoff between long and short paths
    
    //Tree nodes. Organized as usual array representation of an array
    wire [WIDTH-1:0] nodes[0:NUM_NODES-1];
    
    //Pipeline registers for MUX select
    wire [TAG_SZ-1:0] delayed_sel[0:MAX_H-1];
    assign delayed_sel[0] = sel;
    
    genvar i;
`genfor (i = 1; i < MAX_H; i = i + 1) begin : sel_pipeline_regs
    reg [TAG_SZ-1:0] delayed = 0;
    always @(posedge clk) begin
        if (rst) begin
            delayed <= 0;
        end else begin
            delayed <= delayed_sel[i-1];
        end
    end
    
    assign delayed_sel[i] = delayed;
`endgen
  
`genfor (i = 0; i < X_C; i = i + 1) begin : long_path_nodes
    //long path nodes
    assign nodes[i] = ins[WIDTH*(i+1) -1 -: WIDTH];
`endgen

`genfor (i = X_C; i < N; i = i + 1) begin : short_path_nodes
    //short path nodes. For simplicity, just delay them by one cycle
    reg [WIDTH-1:0] delayed = 0;
    always @(posedge clk) begin
        if (rst) begin
            delayed <= 0;
        end else begin
            delayed <= ins[WIDTH*(i+1) -1 -: WIDTH];
        end
    end
    
    assign nodes[i] = delayed;
`endgen
    
`genfor (i = N; i < PADDED; i = i + 1) begin : padding
    //padding to one more than a multiple of 3
    assign nodes[i] = 0;
`endgen
    
`genfor (i = 0; i < (PADDED-1)/3; i = i + 1) begin : construct_tree
	`define DIST_TO_ROOT (`H(NUM_NODES-1-(PADDED+i)))
	`define DIST_FROM_LEAF (MAX_H-1 - `DIST_TO_ROOT)
	
    //construct tree
    mux_tree_node # (
        .WIDTH(WIDTH),
        .ENABLE_DELAY(1) //For now, delay everything
    ) the_node (
    	.clk(clk),
    	.rst(rst),
        .sel(delayed_sel[`DIST_FROM_LEAF]  [2*(`DIST_FROM_LEAF+1) -1 -: 2]),
        .A(nodes[4*i]),
        .B(nodes[4*i+1]),
        .C(nodes[4*i+2]),
        .D(nodes[4*i+3]),
        .result(nodes[PADDED+i])
    );
    `undef DIST_TO_ROOT
    `undef DIST_FROM_LEAF
`endgen

	//assign final output
	assign result = nodes[NUM_NODES-1];

endmodule

`undef genfor
`undef endgen
`undef CLOG2
`undef CLOG4
    `undef H
`undef localparam
