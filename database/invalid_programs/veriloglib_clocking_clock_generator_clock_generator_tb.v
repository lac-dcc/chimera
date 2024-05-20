// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`timescale 1ns / 100 ps
`include "clock_generator.v"

module clock_generator_tb();

    parameter CLK_PERIOD = 20;
    wire clk;

    clock_generator #(.CLK_PERIOD(CLK_PERIOD)) uut (.clk(clk));

    initial
    begin: tb_process
        $dumpfile("clock_generator_tb.vcd" );
        $dumpvars(0, clock_generator_tb);
        #100;
        $finish;
    end

endmodule