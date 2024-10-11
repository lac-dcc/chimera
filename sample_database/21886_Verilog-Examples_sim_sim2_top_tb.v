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
        a = 0;
        b = 0;

        // Changing $display to $strobe tells the simuator to wait until 
        // the current time has advanced.  So the printing will wait until
        // after all pending changes have completed before the values are printed.
        $strobe("%5t: a=%b, b=%b, sum=%b, cy=%b", $time, a, b, sum, cy);

        // We wait before changing the values but not just to delay the printing.
        #1;

        a = 0;
        b = 1;

        $strobe("%5t: a=%b, b=%b, sum=%b, cy=%b", $time, a, b, sum, cy);
        #1;

        a = 1;
        b = 0;

        $strobe("%5t: a=%b, b=%b, sum=%b, cy=%b", $time, a, b, sum, cy);
        #1;

        a = 1;
        b = 1;

        $strobe("%5t: a=%b, b=%b, sum=%b, cy=%b", $time, a, b, sum, cy);
        #1;

        a = 0;
        b = 0;
        $strobe("%5t: a=%b, b=%b, sum=%b, cy=%b", $time, a, b, sum, cy);
        #2;
        
        $finish;    // The $finish 'system task' halts the simulation
    end

endmodule
