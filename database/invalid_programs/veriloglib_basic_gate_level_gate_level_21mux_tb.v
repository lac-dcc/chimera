// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`timescale 1ns / 1ns
`include "gate_level_21mux.v"

module gate_level_21mux_tb;
    //Inputs as registers
    reg A;
    reg B;
    reg SEL;

    //Ouputs as wires
    wire Y;

    // Unit instantiation
    gate_level_21mux uut (A, B, SEL, Y);

initial begin
    $dumpfile("gate_level_21mux_tb.vcd" );
    $dumpvars(0, gate_level_21mux_tb);
    $monitor("A: %d     B: %d       SEL: %d     Y: %d", A, B, SEL, Y);

    A = 0;
    B = 0;
    SEL = 0;
    #10;
    A = 1;
    B = 0;
    SEL = 0;
    #10;
    A = 0;
    B = 1;
    SEL = 0;
    #10;
    A = 1;
    B = 1;
    SEL = 0;
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
    A = 1;
    B = 1;
    SEL = 1;
    #10;
    $display("Test complete");
    end
endmodule
