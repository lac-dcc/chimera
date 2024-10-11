// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg [3:0] gray_in;
wire [3:0]binary_out;

gray2binary dut(gray_in, binary_out);

initial begin
        gray_in= 4'd0;
        #10;
        gray_in= 4'd1;
        #10;
        gray_in= 4'd2;
        #10;
        gray_in= 4'd3;
        #10;
        gray_in= 4'd4;
        #10;
        gray_in= 4'd5;
        #10;
        gray_in= 4'd6;
        #10;
        gray_in= 4'd7;
        #10;
        gray_in= 4'd8;
        #10;
        gray_in= 4'd9;
        #10;
        gray_in= 4'd10;
        #10;
        gray_in= 4'd11;
        #10;
        gray_in= 4'd12;
        #10;
        gray_in= 4'd13;
        #10;
        gray_in= 4'd14;
        #10;
        gray_in= 4'd15;
    end

initial
    begin $monitor("gray: %b -> binary: %b", gray_in, binary_out);
    #160 $finish;
    end
endmodule
