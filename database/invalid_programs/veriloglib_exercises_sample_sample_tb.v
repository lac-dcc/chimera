// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`timescale 1ns / 1ns
`include "sample.v" //Import the main code into the testbench

module sample_tb; 
    //Inputs as registers 
    reg A; 
    reg B;
    reg C; 

    //Ouputs as wires 
    wire D;
    wire E;

    //Initialiastion
    sample uut (A,B,C,D,E);

initial begin //Name of the graph file that gets generated after we run
    $dumpfile("sample_tb.vcd" );
    $dumpvars(0, sample_tb);
    A = 0;
    B = 0;
    C = 0;
    #10;
    A = 0;
    B = 0; 
    C = 1;
    #10;
    A = 0;
    B = 1; 
    C = 0;
    #10;
    A = 0;
    B = 1; 
    C = 1;
    #10;
    $display("Test complete");
    end
endmodule
