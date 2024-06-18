// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`include "./LVL1/LVL2/input_control/LVL3/counter_up7_NR.v"
`timescale 1ms/1ms

module up7nr_tb;

    reg clk, clear;
    reg [9:0] keypad;
    wire out;

    counter_nr counterup7_inst (
        .clk(clk),
        .clear(clear),
        .keypad(keypad),
        .out(out)
    );

parameter clk_period = 10;
always #(clk_period/2) clk = ~clk;

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, up7nr_tb);

        clk = 0;
        clear = 0;
        keypad = 10'b0000000000;

        #10 keypad = 10'b0000000001; 
            clear = 1;

        #10 clear = 0;
            keypad = 10'b0000000001;
        #10 keypad = 10'b0000000001;

        #60 keypad = 10'b0000000010;
            clear = 1;

        #50 $finish;
    end
endmodule
