// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`timescale 1ns / 1ns
`include "constant_bundle.v" // Import the main code into the testbench

module constant_bundle_tb;
    parameter WIDTH = 16;
    parameter VALUE = "ZERO";    // ZERO, ONE, Z, X
    wire [WIDTH-1:0] oput;

    // Unit instantiation
    constant_bundle #(.WIDTH(WIDTH), .VALUE(VALUE)) uut (.oput(oput));

    initial 
    begin
        $dumpfile("constant_bundle_tb.vcd" );   // Name of the graph file that gets generated after we run
        $dumpvars(0, constant_bundle_tb);
        #100
        $display("Test complete");
    end

        // Display y
    always @(oput)
        $display("oput = %b", oput);
endmodule
