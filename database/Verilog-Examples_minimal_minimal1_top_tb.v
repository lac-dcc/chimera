// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/1ps

module tb();

    reg    x;       

    top uut (
        .btn1(x)
        // don't need to connect every signal here if not want to
        );

    initial begin
        $dumpfile("top_tb.vcd");    // where to write the dump
        $dumpvars;                  // dump EVERYTHING
    end
    
    initial begin
        // note that x does not have a known value here
        #1;
        x = 0;
        #1;
        x = 1;
        #1;
        x = 0;
        #1;

        $finish;
    end

endmodule
