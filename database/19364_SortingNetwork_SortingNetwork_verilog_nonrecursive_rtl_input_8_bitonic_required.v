// This program was cloned from: https://github.com/john9636/SortingNetwork
// License: Apache License 2.0

/////////////////////////////////////////
//
// Module Name: input_8_bitonic_required.v
// Created date: 08/10/2020
// Last Modified: 08/10/2020
// Description: 8 input comparing/sorting
//		Requre the inputs have already been sorted with two 4-input compare network,
// 		and the two network have different asending features. 
// 		The first 4 inputs should have the same asending feature with this module,
// 		The last 4 inputs should have the opposite asending feature with this module.
// Author: John Zhang
// Company: Shanghai Jiao Tong University
// 
///////////////////////////////////////////

`timescale 1ns / 1ps
module input_8_bitonic_required #
(
    parameter DATA_WIDTH = 8,
    parameter LABEL_WIDTH = 3,
    parameter SIGNED = 0,
    parameter ASCENDING = 1
)
(
    input clk, rst, x_valid,
    input [DATA_WIDTH*8-1 : 0] x,
    input [LABEL_WIDTH*8-1 : 0] x_label,
    output [DATA_WIDTH*8-1 : 0] y,
    output [LABEL_WIDTH*8-1 : 0] y_label,
    output y_valid
);

// Declare the wires which come out of the input_2 compare network of every stage
wire [DATA_WIDTH*8-1 : 0] stage0_rslt;
wire [LABEL_WIDTH*8-1: 0] stage0_labl;
wire stage0_valid;
genvar i;

// Stage 1
// Stage0~3 has the same ascending feature with the entire network output.
for (i = 0; i < 4; i = i + 1) begin: stage0
	input_2 #
	(
	    .DATA_WIDTH(DATA_WIDTH),
	    .LABEL_WIDTH(LABEL_WIDTH),
	    .SIGNED(SIGNED),
	    .ASCENDING(ASCENDING)
	)
	input_2_stage0_0 
	(
	    .clk(clk),
	    .rst(rst),
	    .x_valid(x_valid),
	    .x_0(x[DATA_WIDTH*(i+1)-1:DATA_WIDTH*(i)]),
	    .x_1(x[DATA_WIDTH*(i+5)-1:DATA_WIDTH*(i+4)]),
	    .x_label_0(x_label[LABEL_WIDTH*(i+1)-1:LABEL_WIDTH*(i)]),
	    .x_label_1(x_label[LABEL_WIDTH*(i+5)-1:LABEL_WIDTH*(i+4)]),
	    .y_0(stage0_rslt[DATA_WIDTH*(i+1)-1:DATA_WIDTH*(i)]),
	    .y_1(stage0_rslt[DATA_WIDTH*(i+5)-1:DATA_WIDTH*(i+4)]),
	    .y_label_0(stage0_labl[LABEL_WIDTH*(i+1)-1:LABEL_WIDTH*(i)]),
	    .y_label_1(stage0_labl[LABEL_WIDTH*(i+5)-1:LABEL_WIDTH*(i+4)]),
	    .y_valid(stage0_valid)
	);
end

// Stage 2
// Stage1_0 has the same ascending feature with the entire network output.
// Stage1_1 has the same ascending feature with the entire network output as well.
input_4_bitonic_required #
(
    .DATA_WIDTH(DATA_WIDTH),
    .LABEL_WIDTH(LABEL_WIDTH),
    .SIGNED(SIGNED),
    .ASCENDING(ASCENDING)
)
input_4_stage1_0 
(
    .clk(clk),
    .rst(rst),
    .x_valid(stage0_valid),
    .x_0(stage0_rslt[DATA_WIDTH*1-1:0]),
    .x_1(stage0_rslt[DATA_WIDTH*2-1:DATA_WIDTH*1]),
    .x_2(stage0_rslt[DATA_WIDTH*3-1:DATA_WIDTH*2]),
    .x_3(stage0_rslt[DATA_WIDTH*4-1:DATA_WIDTH*3]),
    .x_label_0(stage0_labl[LABEL_WIDTH*1-1:0]),
    .x_label_1(stage0_labl[LABEL_WIDTH*2-1:LABEL_WIDTH*1]),
    .x_label_2(stage0_labl[LABEL_WIDTH*3-1:LABEL_WIDTH*2]),
    .x_label_3(stage0_labl[LABEL_WIDTH*4-1:LABEL_WIDTH*3]),
    .y_0(y[DATA_WIDTH*1-1:0]),
    .y_1(y[DATA_WIDTH*2-1:DATA_WIDTH*1]),
    .y_2(y[DATA_WIDTH*3-1:DATA_WIDTH*2]),
    .y_3(y[DATA_WIDTH*4-1:DATA_WIDTH*3]),
    .y_label_0(y_label[LABEL_WIDTH*1-1:0]),
    .y_label_1(y_label[LABEL_WIDTH*2-1:LABEL_WIDTH*1]),
    .y_label_2(y_label[LABEL_WIDTH*3-1:LABEL_WIDTH*2]),
    .y_label_3(y_label[LABEL_WIDTH*4-1:LABEL_WIDTH*3]),
    .y_valid(y_valid)
);

input_4_bitonic_required #
(
    .DATA_WIDTH(DATA_WIDTH),
    .LABEL_WIDTH(LABEL_WIDTH),
    .SIGNED(SIGNED),
    .ASCENDING(ASCENDING)
)
input_4_stage1_1 
(
    .clk(clk),
    .rst(rst),
    .x_valid(stage0_valid),
    .x_0(stage0_rslt[DATA_WIDTH*5-1:DATA_WIDTH*4]),
    .x_1(stage0_rslt[DATA_WIDTH*6-1:DATA_WIDTH*5]),
    .x_2(stage0_rslt[DATA_WIDTH*7-1:DATA_WIDTH*6]),
    .x_3(stage0_rslt[DATA_WIDTH*8-1:DATA_WIDTH*7]),
    .x_label_0(stage0_labl[LABEL_WIDTH*5-1:LABEL_WIDTH*4]),
    .x_label_1(stage0_labl[LABEL_WIDTH*6-1:LABEL_WIDTH*5]),
    .x_label_2(stage0_labl[LABEL_WIDTH*7-1:LABEL_WIDTH*6]),
    .x_label_3(stage0_labl[LABEL_WIDTH*8-1:LABEL_WIDTH*7]),
    .y_0(y[DATA_WIDTH*5-1:DATA_WIDTH*4]),
    .y_1(y[DATA_WIDTH*6-1:DATA_WIDTH*5]),
    .y_2(y[DATA_WIDTH*7-1:DATA_WIDTH*6]),
    .y_3(y[DATA_WIDTH*8-1:DATA_WIDTH*7]),
    .y_label_0(y_label[LABEL_WIDTH*5-1:LABEL_WIDTH*4]),
    .y_label_1(y_label[LABEL_WIDTH*6-1:LABEL_WIDTH*5]),
    .y_label_2(y_label[LABEL_WIDTH*7-1:LABEL_WIDTH*6]),
    .y_label_3(y_label[LABEL_WIDTH*8-1:LABEL_WIDTH*7]),
    .y_valid()
);


endmodule


