// This program was cloned from: https://github.com/gfg-development/grayblastVGA
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

// testbench is controlled by test.py
module tb_sqrt ();

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb_sqrt);
        #1;
    end

    // wire up the inputs and outputs
    reg [15 : 0]    x_in;
    wire [15 : 0]   x_out;

    sqrt #(.BIT_WIDTH(16)) sqrt (
        .x_in(x_in),
        .x_out(x_out)
    );

endmodule
