// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`timescale 1ns / 1ns
`include "delay_output.v" //Import the main code into the testbench

module delay_output_tb;
    //Inputs as registers
    reg clk;
    reg datain;

    //Ouputs as wires
    wire dataout;

    // Unit instantiation
    delay_output #(.LENGTH(3)) uut (.clk(clk), .datain(datain), .dataout(dataout));

initial clk = 0;

always #2 clk = ~clk;

initial begin //Name of the graph file that gets generated after we run
    $dumpfile("delay_output_tb.vcd" );
    $dumpvars(0, delay_output_tb);
    datain = 0;
    #10;
    datain = 1;
    #20;
    datain = 0;
    #100;
    $display("Test complete");
    $finish;
    end
endmodule
