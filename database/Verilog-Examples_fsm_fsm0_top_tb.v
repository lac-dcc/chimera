// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/100ps  // time units & precision 

module tb();

    localparam  COUNTER_WIDTH = 4;
    localparam  COUNTER_MAX = $pow( 2, COUNTER_WIDTH );

    reg         clk = 1;        // what happens to setup & hold if we start high?
    reg         reset = 0;      // system is not reset by default

    wire [COUNTER_WIDTH-1:0]  count;

    fsm #( .WIDTH(COUNTER_WIDTH) ) uut ( .clk(clk), .reset(reset), .D(count) );

    always #1 clk = ~clk;       // free-running clock to run the FSM

    initial begin
        // NOTE: $monitor will not trigger on things changed in other modules
        $monitor("time:%2t reset=%b count=%h", $time, reset, count );
        $display("COUNTER_WIDTH:%3d COUNTER_MAX:%3d", COUNTER_WIDTH, COUNTER_MAX );

        $dumpfile("top_tb.vcd");
        $dumpvars;

        //#0.2    // be careful with this if precision is same as time units!
        #10;    // just to make the reset seem interesting
        reset = 1;
        #4;     // two simulation time units = one clock period
        reset = 0;

        #(COUNTER_MAX*2+6);  // wait long enough for count to wrap around

        reset = 1;
        #2;
        reset = 0;

        #20;     // count some more before we end the simulation

        $finish;
    end

endmodule
