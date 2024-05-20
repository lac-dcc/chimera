// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 100ns/1ps

module tb();

    reg clk;        // the free running clock

    counter uut (
        .clk(clk)
        // don't need to connect every signal here if not want to
        );

    initial begin
        $dumpfile("counter_tb.vcd");    // where to write the dump
        $dumpvars;                      // dump EVERYTHING
        clk = 0;
    end
    
    always #1 clk = ~clk;

    initial begin
        #1000;
        //#16000000;
        $finish;
    end

endmodule
