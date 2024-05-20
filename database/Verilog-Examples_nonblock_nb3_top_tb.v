// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/1ps  

module tb();

    reg         clk;

    reg [7:0]   a;
    reg [7:0]   b;
    reg [7:0]   q;

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;

        $monitor("%2d: q:%2d a:%2d b:%2d", $time, q, a, b);
        a = 0;
        b = 0;
        //q = 0;        // leave q uninitialized
        clk = 1;

        #30;
        $finish;
    end

    always #1 clk = ~clk;

    always @(posedge clk)
        q <= a + b;
    always @(posedge clk)
        a <= a + 1;
    always @(posedge clk)
        b <= b + 1;

endmodule
