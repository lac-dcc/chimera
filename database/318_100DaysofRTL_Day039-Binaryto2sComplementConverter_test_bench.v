// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg [3:0] data;
wire signed [3:0]out;

complement_2s dut(data, out);

initial begin
        data= 4'd0;
        #10;
        data= 4'd1;
        #10;
        data= 4'd2;
        #10;
        data= 4'd3;
        #10;
        data= 4'd4;
        #10;
        data= 4'd5;
        #10;
        data= 4'd6;
        #10;
        data= 4'd7;
        #10;
        data= 4'd8;
        #10;
        data= 4'd9;
        #10;
        data= 4'd10;
        #10;
        data= 4'd11;
        #10;
        data= 4'd12;
        #10;
        data= 4'd13;
        #10;
        data= 4'd14;
        #10;
        data= 4'd15;
    end

initial
    begin $monitor("input number: %d  2's Complement: %d", data, out);
    #160 $finish;
    end
endmodule
