// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`timescale 10ns / 10ns
`include "alu.v"

module alu_tb;
    parameter opcodeSize = 3;
    parameter dataSize = 8;
    //Inputs as registers
    reg clk, rst_n;
    reg [opcodeSize-1 : 0] func;
    reg [dataSize-1 : 0] data1, data2;

    //Outputs as wires
    wire [dataSize-1 : 0] dataOut;

    // Unit instantiation
    alu uut (.clk(clk), .rst_n(rst_n), .func(func), .data1(data1), .data2(data2), .dataOut(dataOut));


    initial begin
        clk = 0;
        forever #1 clk = !clk;
    end

    initial begin
        rst_n = 1'b0;
        #10;
        rst_n = 1'b1;
    end

    initial begin //Name of the graph file that gets generated after we run
        $dumpfile("alu_tb.vcd" );
        $dumpvars(0, alu_tb);
        data1 = 1;
        data2 = 2;
        func = 3'b000;
        #10;
        data1 = 1;
        data2 = 2;
        func = 3'b000;
        #10;
        data1 = 1;
        data2 = 2;
        func = 3'b001;
        #10;
        rst_n = 0;
        $display("Test complete");
        $stop;
        $finish;
        end
endmodule;
