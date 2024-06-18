// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 10ns/1ns

`default_nettype none

module tb();

    reg a;
    reg b;

    wire sum;
    wire cy;

    assign sum = a ^ b;
    assign  cy = a & b;


    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;
    end

    initial begin
        // Another way to print things when they change is to use $monitor()

        // Only one $monitor task allowed, so we can NOT do this:
        //$monitor("time:%0t sum = %0d", $time, sum);
        //$monitor("time:%0t cy = %0d", $time, cy);

        // ... therefore do this:
        $monitor("time:%5t a=%b, b=%b, sum=%b, cy=%b", $time, a, b, sum, cy);

        // $monitor will report changes in all the signals that are listed as
        // parameters (except for $time since it always changes)

        a = 0;
        b = 0;

        // NOTE: the monitor will fire here... because a and b changed from x to 0 !
        #1;

        a = 0;
        b = 0;
        // NOTE: no monitor will fire here... because nothing changed !!
        #1;

        a = 0;
        b = 1;
        #1;

        a = 1;
        b = 0;
        #1;

        a = 1;
        b = 1;
        #1;

        a = 0;
        b = 0;
        #2;
        
        $finish;    // The $finish 'system task' halts the simulation
    end

endmodule
