// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/100ps  // time units & precision 

module tb();

    reg         clk = 0;
    reg         reset = 0;
    reg         enable = 0;

    wire [1:0]  state;

    fsm uut ( .clk(clk), .reset(reset), .E(enable), .S(state) );

    always #1 clk = ~clk;       // free-running clock to run the FSM

    initial begin
        // NOTE: $monitor will not trigger on things changed in other modules
        $monitor("time:%2t reset:%b eanble:%b state:%b", $time, reset, enable, state );

        $dumpfile("top_tb.vcd");
        $dumpvars;

        #4;         // just to make the reset seem interesting
        reset = 1;
        #4;         // two simulation time units = one clock period
        reset = 0;

        #4;
        enable = 1; // enable the counter
        #12;
        enable = 0; // disable the counter
        #6;

        reset = 1;
        #2;
        enable = 1;
        #4;
        reset = 0;

        #12;

        $finish;
    end

endmodule
