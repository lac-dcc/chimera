// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/1ps  

module tb();

    reg         clk;
    reg [7:0]   a;
    reg [7:0]   b;

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;
        //$monitor("%5d a:%2d b:%2d clk:%b", $time, a, b, clk);
        $monitor("%5d a:%2d b:%2d sum:%2d", $time, a, b, sum);
        a = 18;
        b = 00;
        clk = 0;
        #100;
        $finish;
    end

    always #1 clk = ~clk;

    // swap the values of a and b
    always @(posedge clk) begin
        b <= a;
        a <= b;
    end

    // lets make it interesting...
    // The assignment below gets scheduled in the active queue as a result
    // of the nonblocking assignmnet into b.

    wire [7:0] sum;
    assign sum = b+1;

endmodule
