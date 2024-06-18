// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`timescale 1ns / 1ns
`include "and2.v" //Import the main code into the testbench

module and2_tb;
    //Inputs as registers
    reg A;
    reg B;

    //Ouputs as wires
    wire C;

    // Unit instantiation
    and2 uut (A,B,C);

initial begin //Name of the graph file that gets generated after we run
    $dumpfile("and2_tb.vcd" );
    $dumpvars(0, and2_tb);
    A = 0;
    B = 0;
    #10;
    A = 0;
    B = 1;
    #10;
    A = 1;
    B = 0;
    #10;
    A = 1;
    B = 1;
    #10;
    $display("Test complete");
    end
endmodule
