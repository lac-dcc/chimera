//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/* 
inst_mem.v Instantiates an sdpram module and presents an interface with rd_en 
and wr_en (instead of clock_en and wr_en). 
*/


/*
sdpram:

A simple Verilog module that implements SDP (simple dual port) RAM. The reason 
for choosing SDP is because the FPGA's BRAMs already support it "at no extra 
cost". If instead I tried multiplexing the address port, I would add 
propagation delays and a bunch of extra logic.

(inst_mem module is below)

*/

//Undefine this for normal usage
//`define PRELOAD_TEST_PROGRAM


`ifdef ICARUS_VERILOG
`define localparam parameter
`else /*For Vivado*/
`define localparam localparam

//(* keep_hierarchy = "yes" *)
`endif

//sdpram doesn't infer correctly! This is a Vivado bug. We'll use true dual port
//instead, even though I don't like it...
module sdpram # (parameter
    ADDR_WIDTH = 10,
    DATA_WIDTH = 64 //TODO: I might try shrinking the opcodes at some point
)(
    input wire clk,
    input wire en, //Clock enable
    input wire [ADDR_WIDTH-1:0] wr_addr,
    input wire [DATA_WIDTH-1:0] wr_data,
    input wire wr_en,
    input wire [ADDR_WIDTH-1:0] rd_addr,
    output reg [DATA_WIDTH-1:0] rd_data
);
    `localparam DEPTH = 2**ADDR_WIDTH;

    reg [DATA_WIDTH-1:0] data[0:DEPTH-1];
    initial data[0] = 64'h000600000000FFFF;

    //For testing purposes, this preloads the memory with a program
    `ifdef PRELOAD_TEST_PROGRAM
    `include "bpf_defs.vh"

    initial begin
        data[0]  = ({8'h0, `BPF_ABS, `BPF_H, `BPF_LD, 8'h88, 8'h88, 32'd12}); //ldh [12]                         
        data[1]  = ({8'b0, `BPF_JEQ, `BPF_COMP_IMM, `BPF_JMP, 8'd0, 8'd13, 32'h800}); //jeq #0x800 jt 2 jf 15    
        data[2]  = ({8'h0, `BPF_ABS, `BPF_B, `BPF_LD, 8'h88, 8'h88, 32'd23}); //ldb [23]                         
        data[3]  = ({8'h0, `BPF_JEQ, `BPF_COMP_IMM, `BPF_JMP, 8'd0, 8'd11, 32'h0006}); //jeq #0x6 jt 4 jf 15     
        data[4]  = ({8'h0, `BPF_ABS, `BPF_H, `BPF_LD, 8'h0, 8'h0, 32'd20}); //ldh [20]                           
        data[5]  = ({8'h0, `BPF_JSET, `BPF_COMP_IMM, `BPF_JMP, 8'd9, 8'd0, 32'h1FFF}); //jset 0x1FFF jt 15 jf 6  
        data[6]  = ({8'h0, `BPF_MSH, `BPF_B, `BPF_LDX, 8'h0, 8'h0, 32'd14}); //ldxb_msh addr 14                  
        data[7]  = ({8'h0, `BPF_IND, `BPF_H, `BPF_LD, 8'h0, 8'h0, 32'd14}); //ldh ind x+14                       
        data[8]  = ({8'h0, `BPF_JEQ, `BPF_COMP_IMM, `BPF_JMP, 8'd0, 8'd2, 32'h0064}); //jeq 0x64 jt 9 jf 11      
        data[9]  = ({8'h0, `BPF_IND, `BPF_H, `BPF_LD, 8'h0, 8'h0, 32'd16}); //ldh ind x+16                       
        data[10] = ({8'h0, `BPF_JEQ, `BPF_COMP_IMM, `BPF_JMP, 8'd3, 8'd4, 32'h00C8}); //jeq 0xC8 jt 14 jf 15    
        data[11] = ({8'h0, `BPF_JEQ, `BPF_COMP_IMM, `BPF_JMP, 8'd0, 8'd3, 32'h00C8}); //jeq 0xC8 jt 12 jf 15    
        data[12] = ({8'h0, `BPF_IND, `BPF_H, `BPF_LD, 8'h0, 8'h0, 32'd16}); //ldh ind x+16                      
        data[13] = ({8'h0, `BPF_JEQ, `BPF_COMP_IMM, `BPF_JMP, 8'd0, 8'd1, 32'h0064}); //jeq 0x64 jt 14 jf 15    
        data[14] = ({8'h0, 3'b0, `RET_IMM,   `BPF_RET, 8'd0, 8'd0, 32'd65535}); //ret #65535                    
        data[15] = ({8'h0, 3'b0, `RET_IMM,   `BPF_RET, 8'd0, 8'd0, 32'd0}); //ret #0       
    end
    `endif

    always @(posedge clk) begin
        if (en) begin
            if (wr_en) begin
                data[wr_addr] <= wr_data;
            end
            rd_data <= data[rd_addr];
        end
    end

endmodule

`ifndef ICARUS_VERILOG
(* keep_hierarchy = "yes" *)
`endif
module inst_mem # (
	parameter ADDR_WIDTH = 10,
    parameter DATA_WIDTH = 64 //TODO: I might try shrinking the opcodes at some point
)(
    input wire clk,
    input wire [ADDR_WIDTH-1:0] wr_addr,
    input wire [DATA_WIDTH-1:0] wr_data,
    input wire wr_en,
    input wire [ADDR_WIDTH-1:0] rd_addr,
    output wire [DATA_WIDTH-1:0] rd_data,
    input wire rd_en
);

wire clock_en;
assign clock_en = rd_en | wr_en;

sdpram # (.ADDR_WIDTH(ADDR_WIDTH),.DATA_WIDTH(DATA_WIDTH)) myram (
    .clk(clk),
    .en(clock_en),
    .wr_addr(wr_addr),
    .wr_data(wr_data),
    .wr_en(wr_en),
    .rd_addr(rd_addr),
    .rd_data(rd_data)
);

endmodule

`undef localparam
