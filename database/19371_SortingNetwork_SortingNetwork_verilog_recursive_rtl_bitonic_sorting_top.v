// This program was cloned from: https://github.com/john9636/SortingNetwork
// License: Apache License 2.0

/////////////////////////////////////////
//
// Module Name: bitonic_sorting_top.v
// Created date: 08/10/2020
// Last Modified: 08/10/2020
// Description: 2**n input sorting
// Author: John Zhang
// Company: Shanghai Jiao Tong University
// 
///////////////////////////////////////////

`timescale 1ns / 1ps
module bitonic_sorting_top #
(
    parameter LOG_INPUT_NUM = 4, // Eg: If LOG_INPUT_NUM=4, then input number is 2**4=16 
    parameter DATA_WIDTH = 8,
    parameter LABEL_WIDTH = LOG_INPUT_NUM,
    parameter SIGNED = 0,
    parameter ASCENDING = 1

)
(
    input clk, rst, x_valid,
    // Put all the inputs into one vector.
    // x[DATA_WIDTH-1 : 0] is the first input x_0, 
    // x[DATA_WIDTH*2-1 : DATA_WIDTH] is the second input x_1, etc.
    input [DATA_WIDTH*(2**LOG_INPUT_NUM)-1 : 0] x,
    input [LABEL_WIDTH*(2**LOG_INPUT_NUM)-1 : 0] x_label,
    output [DATA_WIDTH*(2**LOG_INPUT_NUM)-1 : 0] y,
    output [LABEL_WIDTH*(2**LOG_INPUT_NUM)-1 : 0] y_label,
    output y_valid
);

bitonic_sorting_recursion # 
(
    .LOG_INPUT_NUM(LOG_INPUT_NUM),
    .DATA_WIDTH(DATA_WIDTH),
    .LABEL_WIDTH(LABEL_WIDTH),
    .SIGNED(SIGNED),
    .ASCENDING(ASCENDING)
)
bitonic_sorting_inst
(
    .clk(clk),
    .rst(rst),
    .x_valid(x_valid),
    .x(x),
    .x_label(x_label),
    .y(y),
    .y_label(y_label),
    .y_valid(y_valid)
);


endmodule


