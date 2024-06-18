// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`timescale 1ns / 1ns
`include "mux21.v" //Import the main code into the testbench

module mux21_tb;
    //Inputs as registers
    reg A;
    reg B;
    reg SEL;

    //Ouputs as wires
    wire C;

    // Unit instantiation
    mux21 uut (A,B,SEL,C);

initial begin //Name of the graph file that gets generated after we run
    $dumpfile("mux21_tb.vcd" );
    $dumpvars(0, mux21_tb);
    A = 0;
    B = 0;
    SEL = 0;
    #10;
    A = 0;
    B = 1;
    SEL = 0;
    #10;
    A = 0;
    B = 1;
    SEL = 1;
    #10;
    A = 0;
    B = 0;
    SEL = 1;
    #10;
    A = 0;
    B = 1;
    SEL = 1;
    #10;
    A = 1;
    B = 0;
    SEL = 1;
    #10;
    $display("Test complete");
    end
endmodule