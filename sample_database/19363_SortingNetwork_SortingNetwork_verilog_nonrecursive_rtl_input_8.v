// This program was cloned from: https://github.com/john9636/SortingNetwork
// License: Apache License 2.0

/////////////////////////////////////////
//
// Module Name: input_8.v
// Created date: 08/10/2020
// Last Modified: 08/10/2020
// Description: 8 input comparing/sorting
// Author: John Zhang
// Company: Shanghai Jiao Tong University
// 
///////////////////////////////////////////

`timescale 1ns / 1ps
module input_8 #
(
    parameter DATA_WIDTH = 8,
    parameter LABEL_WIDTH = 1,
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


// Stage 1, use two 4-input comparators with opposite ascending features to sort.
// Stage0_0 has the same ascending feature with the entire network output.
// Stage0_1 has the opposite ascending feature with the entire network output.
input_4 #
(
    .DATA_WIDTH(DATA_WIDTH),
    .LABEL_WIDTH(LABEL_WIDTH),
    .SIGNED(SIGNED),
    .ASCENDING(ASCENDING)
)
input_4_stage0_0 
(
    .clk(clk),
    .rst(rst),
    .x_valid(x_valid),
    .x_0(x[DATA_WIDTH*1-1:0]),
    .x_1(x[DATA_WIDTH*2-1:DATA_WIDTH*1]),
    .x_2(x[DATA_WIDTH*3-1:DATA_WIDTH*2]),
    .x_3(x[DATA_WIDTH*4-1:DATA_WIDTH*3]),
    .x_label_0(x_label[LABEL_WIDTH*1-1:0]),
    .x_label_1(x_label[LABEL_WIDTH*2-1:LABEL_WIDTH*1]),
    .x_label_2(x_label[LABEL_WIDTH*3-1:LABEL_WIDTH*2]),
    .x_label_3(x_label[LABEL_WIDTH*4-1:LABEL_WIDTH*3]),
    .y_0(stage0_rslt[DATA_WIDTH*1-1:0]),
    .y_1(stage0_rslt[DATA_WIDTH*2-1:DATA_WIDTH*1]),
    .y_2(stage0_rslt[DATA_WIDTH*3-1:DATA_WIDTH*2]),
    .y_3(stage0_rslt[DATA_WIDTH*4-1:DATA_WIDTH*3]),
    .y_label_0(stage0_labl[LABEL_WIDTH*1-1:0]),
    .y_label_1(stage0_labl[LABEL_WIDTH*2-1:LABEL_WIDTH*1]),
    .y_label_2(stage0_labl[LABEL_WIDTH*3-1:LABEL_WIDTH*2]),
    .y_label_3(stage0_labl[LABEL_WIDTH*4-1:LABEL_WIDTH*3]),
    .y_valid(stage0_valid)
);

input_4 #
(
    .DATA_WIDTH(DATA_WIDTH),
    .LABEL_WIDTH(LABEL_WIDTH),
    .SIGNED(SIGNED),
    .ASCENDING(1-ASCENDING)
)
input_4_stage0_1 
(
    .clk(clk),
    .rst(rst),
    .x_valid(x_valid),
    .x_0(x[DATA_WIDTH*5-1:DATA_WIDTH*4]),
    .x_1(x[DATA_WIDTH*6-1:DATA_WIDTH*5]),
    .x_2(x[DATA_WIDTH*7-1:DATA_WIDTH*6]),
    .x_3(x[DATA_WIDTH*8-1:DATA_WIDTH*7]),
    .x_label_0(x_label[LABEL_WIDTH*5-1:LABEL_WIDTH*4]),
    .x_label_1(x_label[LABEL_WIDTH*6-1:LABEL_WIDTH*5]),
    .x_label_2(x_label[LABEL_WIDTH*7-1:LABEL_WIDTH*6]),
    .x_label_3(x_label[LABEL_WIDTH*8-1:LABEL_WIDTH*7]),
    .y_0(stage0_rslt[DATA_WIDTH*5-1:DATA_WIDTH*4]),
    .y_1(stage0_rslt[DATA_WIDTH*6-1:DATA_WIDTH*5]),
    .y_2(stage0_rslt[DATA_WIDTH*7-1:DATA_WIDTH*6]),
    .y_3(stage0_rslt[DATA_WIDTH*8-1:DATA_WIDTH*7]),
    .y_label_0(stage0_labl[LABEL_WIDTH*5-1:LABEL_WIDTH*4]),
    .y_label_1(stage0_labl[LABEL_WIDTH*6-1:LABEL_WIDTH*5]),
    .y_label_2(stage0_labl[LABEL_WIDTH*7-1:LABEL_WIDTH*6]),
    .y_label_3(stage0_labl[LABEL_WIDTH*8-1:LABEL_WIDTH*7]),
    .y_valid()
);

// Stage 2, use a 8-input bitonic required compare network to sort the outputs of the stage 1.
// input_8_bitonic_required module should have the same ascending feature with the entire network output.
input_8_bitonic_required #
(
    .DATA_WIDTH(DATA_WIDTH),
    .LABEL_WIDTH(LABEL_WIDTH),
    .SIGNED(SIGNED),
    .ASCENDING(ASCENDING)
)
input_8_stage1_0 
(
    .clk(clk),
    .rst(rst),
    .x_valid(stage0_valid),
    .x(stage0_rslt),
    .x_label(stage0_labl),
    .y(y),
    .y_label(y_label),
    .y_valid(y_valid)
);


endmodule


