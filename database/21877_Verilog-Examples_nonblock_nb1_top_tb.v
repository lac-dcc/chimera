// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module tb();

    reg         clk;

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;

        clk = 0;

        #1 clk = 1;
        #1 clk = 0;
        #1 clk = 1;
        #1 clk = 0;
        #1 clk = 1;
        #1 clk = 0;

        #2;             // wait a while
        $finish;        // stop the simulation 
    end

    always @(clk)
        $display("%2t: @(*) clk is %b", $time, clk);

    always @(posedge clk)
        $display("%2t: @(pos) clk is %b", $time, clk);

    always @(negedge clk)
        $display("%2t: @(neg) clk is %b", $time, clk);

endmodule
