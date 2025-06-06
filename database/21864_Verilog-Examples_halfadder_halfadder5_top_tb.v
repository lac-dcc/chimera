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
        // brute force hardcoded
        a = 0;
        b = 0;
        #0;
        $display("%0t sum=%b, cy=%b", $time, sum, cy);      // 0t removes a ton of padding
        #1;

        a = 0;
        b = 1;
        #0 $display("%0t sum=%b, cy=%b", $time, sum, cy);   // can also combine the #0 with what follows 
        #1;

        a = 1;
        b = 0;
        #0 $display("%0t sum=%b, cy=%b", $time, sum, cy);
        #1;

        a = 1;
        b = 1;
        #0 $display("%0t sum=%b, cy=%b", $time, sum, cy);
        #1;

        a = 0;
        b = 0;
        #0 $display("%0t sum=%b, cy=%b", $time, sum, cy);
        #10;

       $finish;
    end

endmodule
