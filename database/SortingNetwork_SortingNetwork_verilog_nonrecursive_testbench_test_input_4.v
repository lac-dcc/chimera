// This program was cloned from: https://github.com/john9636/SortingNetwork
// License: Apache License 2.0

//////////////////////////////////////////
//
// Module Name: test_input_4.v
// Created date: 08/10/2020
// Last Modified: 08/10/2020
// Description: 4 input comparing/sorting test
// Author: John Zhang
// Company: Shanghai Jiao Tong University
// 
///////////////////////////////////////////

`timescale 1ns / 1ps
module test_input_4;

// Parameters
parameter DATA_WIDTH = 8;
parameter LABEL_WIDTH = 2;
parameter SIGNED = 1;
parameter ASCENDING = 0;

// Inputs
reg clk = 0;
reg rst = 0;
reg x_valid = 0;
reg [DATA_WIDTH-1 : 0] x_0 = 0;
reg [DATA_WIDTH-1 : 0] x_1 = 0;
reg [DATA_WIDTH-1 : 0] x_2 = 0;
reg [DATA_WIDTH-1 : 0] x_3 = 0;
reg [LABEL_WIDTH-1 : 0] x_label_0 = 0;
reg [LABEL_WIDTH-1 : 0] x_label_1 = 0;
reg [LABEL_WIDTH-1 : 0] x_label_2 = 0;
reg [LABEL_WIDTH-1 : 0] x_label_3 = 0;

// Outputs
wire [DATA_WIDTH-1 : 0] y_0;
wire [DATA_WIDTH-1 : 0] y_1;
wire [DATA_WIDTH-1 : 0] y_2;
wire [DATA_WIDTH-1 : 0] y_3;
wire [LABEL_WIDTH-1 : 0] y_label_0;
wire [LABEL_WIDTH-1 : 0] y_label_1;
wire [LABEL_WIDTH-1 : 0] y_label_2;
wire [LABEL_WIDTH-1 : 0] y_label_3;
wire y_valid;

initial begin
    // myhdl integration
    $from_myhdl(
        clk,
        rst,
	x_0,
	x_1,
	x_2,
	x_3,
	x_label_0,
	x_label_1,
	x_label_2,
	x_label_3,
        x_valid
        );
    $to_myhdl(
        y_0,
	y_1,
        y_2,
	y_3,
	y_label_0,
	y_label_1,
	y_label_2,
	y_label_3,
        y_valid
    );

    // dump file
    $dumpfile("test_input_4.lxt");
    $dumpvars(0, test_input_4);
end

input_4 #(
    .DATA_WIDTH(DATA_WIDTH),
    .LABEL_WIDTH(LABEL_WIDTH),
    .SIGNED(SIGNED),
    .ASCENDING(ASCENDING)
)
UUT (
    .clk(clk),
    .rst(rst),
    .x_valid(x_valid),
    .x_0(x_0),
    .x_1(x_1),
    .x_2(x_2),
    .x_3(x_3),
    .x_label_0(x_label_0),
    .x_label_1(x_label_1),
    .x_label_2(x_label_2),
    .x_label_3(x_label_3),
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

