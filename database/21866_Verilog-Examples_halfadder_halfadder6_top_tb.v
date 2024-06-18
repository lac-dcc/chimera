// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/1ps

module tb();

    reg a;
    reg b;
    wire sum;
    wire cy;

    top uut (
        .a(a),
        .b(b),
        .sum(sum),
        .cy(cy)
        );

    initial begin
        $dumpfile("top_tb.vcd");    // where to write the dump
        $dumpvars;                  // dump EVERYTHING
    end

    initial begin
        // Only one $monitor task allowed, so we can NOT do this:
        //$monitor("time:%0t sum = %0d", $time, sum);
        //$monitor("time:%0t cy = %0d", $time, cy);

        // ... therefore do this:
        $monitor("time:%0t a=%b, b=%b, sum=%b, cy=%b", $time, a, b, sum, cy);

        // $monitor will report changes in all the signals that are listed as
        // parameters (except for $time since it always changes)
    
        a = 0;
        b = 0;
        #1

        a = 0;
        b = 1;
        #1

        a = 1;
        b = 0;
        #1

        a = 1;
        b = 1;
        #1

        a = 0;
        b = 0;
        #1

        $finish;
    end

endmodule
