// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`include "config.vh"
`timescale 1ns/1ps

module accelerator_wrapper#(
    parameter inputBitwidth=`INPUT_BITWIDTH,
	parameter bitwidth=`BITWIDTH,
    parameter instBitwidth=`INST_BITWIDTH,
    parameter logNumCycle=`LOG_NUM_CYCLE,
    parameter numCycle=`NUM_CYCLE,
    parameter size= `SIZE,
	parameter numUnit=`NUMBER_UNIT
)(
    //input [bitwidth-1:0]data_in,
	// 4-0 for input_x, 9-5 for wright, 11-10 for output inference 14-10 for
	// output training
	input [7:0]addr,
	input [7:0]addr_out,
    input clk,
    input start,
    input rst,
    input [31:0]data_in_mem, 
    input [1:0]wea,
	input [inputBitwidth-1:0]mu,
	input [inputBitwidth-1:0]bias,
    input r_w,
    output [64-1:0]data_out
);
    //wire [inputBitwidth-1:0]bias;
    //wire [inputBitwidth-1:0]mu;
    wire [inputBitwidth*size*numUnit-1:0]data_in_x;
    wire [inputBitwidth*size*numUnit-1:0]data_in_w;
    wire [bitwidth*size*numUnit-1:0]data_out_r;
    //wire [inputBitwidth-1:0]rate;
    
    //block memory for inputx
   	//write width 32, read width 256, write depth 32, read depth 4
   	blk_mem_512_4 bram_x(
        .addra(addr),
        .clka(clk),
        .wea (wea[0]),
        .dina(data_in_mem),
        .douta(data_in_x),
        .ena(1'b1)
        );

    //block memory for weight
    //write width 32, read width 256, write depth 32, read depth 4
	blk_mem_512_4 bram_w(
        .addra(addr),
        .clka(clk),
        .wea (wea[1]),
        .dina(data_in_mem),
        .douta(data_in_w),
        .ena(1'b1)
        );
        
        
    //block memory for output
    // inference: write width 32, read width 32, write depth 4, read depth 4
   	// training: write width 256, read width 32, write depth 4, read depth 32
   	blk_mem_1024_4_out bram_out1(
    	//11-10 for output inference / 14-10 for output training
		.addra(addr_out),
        .clka(clk),
        .wea (r_w),
        .dina(data_out_r[1023:0]),
        .douta(data_out[31:0]),
        .ena(1'b1)
        );
     
    blk_mem_1024_4_out bram_out2(
    	//11-10 for output inference / 14-10 for output training
		.addra(addr_out),
        .clka(clk),
        .wea (r_w),
        .dina(data_out_r[1599:1024]),
        .douta(data_out[63:32]),
        .ena(1'b1)
        );
     
        

    (* dont_touch = "true" *) accelerator#(
        .inputBitwidth(inputBitwidth),
        .bitwidth(bitwidth),
        .instBitwidth(instBitwidth),
        .logNumCycle(logNumCycle),
        .numCycle(numCycle),
        .size(size),
        .numUnit(numUnit)
    )acc(
        .data_in_x(data_in_x),
        .data_in_w(data_in_w),
        .bias(bias),
        .rate(rate),
        .clk(clk),
        .start(start),
        .rst(rst),
        .mu(mu),
        .data_out_r(data_out_r)
    	);

endmodule
