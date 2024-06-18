// This program was cloned from: https://github.com/john9636/SortingNetwork
// License: Apache License 2.0

/////////////////////////////////////////
//
// Module Name: input_4.v
// Created date: 08/10/2020
// Last Modified: 08/10/2020
// Description: 4 input comparing/sorting
// Author: John Zhang
// Company: Shanghai Jiao Tong University
// 
///////////////////////////////////////////

`timescale 1ns / 1ps
module input_4 #
(
    parameter DATA_WIDTH = 8,
    parameter LABEL_WIDTH = 1,
    parameter SIGNED = 0,
    parameter ASCENDING = 1
)
(
    input clk, rst, x_valid,
    input [DATA_WIDTH-1 : 0] x_0, x_1, x_2, x_3,
    input [LABEL_WIDTH-1 : 0] x_label_0, x_label_1, x_label_2, x_label_3,
    output [DATA_WIDTH-1 : 0] y_0, y_1, y_2, y_3,
    output [LABEL_WIDTH-1 : 0] y_label_0, y_label_1, y_label_2, y_label_3,
    output y_valid
);

// Declare the wires which come out of the input_2 compare network of every stage
wire [DATA_WIDTH-1 : 0] stage0_rslt_0, stage0_rslt_1, stage0_rslt_2, stage0_rslt_3;
wire [LABEL_WIDTH-1: 0] stage0_labl_0, stage0_labl_1, stage0_labl_2, stage0_labl_3;
wire stage0_valid;


// Stage 1, use two 2-input comparators with opposite ascending features to sort.
// Stage0_0 has the same ascending feature with the entire network output.
// Stage0_1 has the opposite ascending feature with the entire network output.
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
    .x_0(x_0),
    .x_1(x_1),
    .x_label_0(x_label_0),
    .x_label_1(x_label_1),
    .y_0(stage0_rslt_0),
    .y_1(stage0_rslt_1),
    .y_label_0(stage0_labl_0),
    .y_label_1(stage0_labl_1),
    .y_valid(stage0_valid)
);

input_2 #
(
    .DATA_WIDTH(DATA_WIDTH),
    .LABEL_WIDTH(LABEL_WIDTH),
    .SIGNED(SIGNED),
    .ASCENDING(1-ASCENDING)
)
input_2_stage0_1 
(
    .clk(clk),
    .rst(rst),
    .x_valid(x_valid),
    .x_0(x_2),
    .x_1(x_3),
    .x_label_0(x_label_2),
    .x_label_1(x_label_3),
    .y_0(stage0_rslt_2),
    .y_1(stage0_rslt_3),
    .y_label_0(stage0_labl_2),
    .y_label_1(stage0_labl_3),
    .y_valid()
);

// Stage 2, use a 4-input bitonic required compare network to sort the outputs of the stage 1.
// input_4_bitonic_required module should have the same ascending feature with the entire network output.
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
    .x_0(stage0_rslt_0),
    .x_1(stage0_rslt_1),
    .x_2(stage0_rslt_2),
    .x_3(stage0_rslt_3),
    .x_label_0(stage0_labl_0),
    .x_label_1(stage0_labl_1),
    .x_label_2(stage0_labl_2),
    .x_label_3(stage0_labl_3),
    .y_0(y_0),
    .y_1(y_1),
    .y_2(y_2),
    .y_3(y_3),
    .y_label_0(y_label_0),
    .y_label_1(y_label_1),
    .y_label_2(y_label_2),
    .y_label_3(y_label_3),
    .y_valid(y_valid)
);


endmodule


