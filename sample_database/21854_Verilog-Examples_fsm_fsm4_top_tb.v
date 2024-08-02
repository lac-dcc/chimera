// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/100ps  // time units & precision 

module tb();

    reg         clk = 1;        // start hi to match course handout
    reg         reset = 0;
    reg         D = 0;
    wire        Q;

    fsm uut ( .clk(clk), .reset(reset), .D(D), .Q(Q) );

    always #1 clk = ~clk;       // free-running clock to run the FSM

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;

        #2;
        reset = 1;
        #4;
        reset = 0;

        // match the example waveform in the course handout
        D = 0;
        #2;
        D = 1;
        #2;
        D = 0;
        #4;
        D = 1;
        #2;
        D = 0;
        #2;
        D = 1;
        #4;
        D = 0;
        #2;
        D = 1;
        #8;
        D = 0;
        #3;

        $finish;
    end

endmodule
