// This program was cloned from: https://github.com/john9636/SortingNetwork
// License: Apache License 2.0

//////////////////////////////////////////
//
// Module Name: test_input_2.v
// Created date: 08/10/2020
// Last Modified: 08/10/2020
// Description: 2 input comparing/sorting test
// Author: John Zhang
// Company: Shanghai Jiao Tong University
// 
///////////////////////////////////////////

`timescale 1ns / 1ps
module test_input_2;

// Parameters
parameter DATA_WIDTH = 8;
parameter LABEL_WIDTH = 1;
parameter SIGNED = 1;
parameter ASCENDING = 1;

// Inputs
reg clk = 0;
reg rst = 0;
reg x_valid = 0;
reg [DATA_WIDTH-1 : 0] x_0 = 0;
reg [DATA_WIDTH-1 : 0] x_1 = 0;
reg [LABEL_WIDTH-1 : 0] x_label_0 = 0;
reg [LABEL_WIDTH-1 : 0] x_label_1 = 0;

// Outputs
wire [DATA_WIDTH-1 : 0] y_0;
wire [DATA_WIDTH-1 : 0] y_1;
wire [LABEL_WIDTH-1 : 0] y_label_0;
wire [LABEL_WIDTH-1 : 0] y_label_1;
wire y_valid;

initial begin
    // myhdl integration
    $from_myhdl(
        clk,
        rst,
	x_0,
	x_1,
	x_label_0,
	x_label_1,
        x_valid
        );
    $to_myhdl(
        y_0,
	y_1,
	y_label_0,
	y_label_1,
        y_valid
    );

    // dump file
    $dumpfile("test_input_2.lxt");
    $dumpvars(0, test_input_2);
end

input_2 #(
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
    .x_label_0(x_label_0),
    .x_label_1(x_label_1),
    .y_0(y_0),
    .y_1(y_1),
    .y_label_0(y_label_0),
    .y_label_1(y_label_1),
    .y_valid(y_valid)
);

endmodule

