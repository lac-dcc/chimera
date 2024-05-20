// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/1ns  

module tb();

    reg         clk3;
    reg         clk11;
    reg         func;

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;

        clk3 = 0;
        clk11 = 0;

        #100;           // wait a while
        $finish;        // stop the simulation 
    end

    // Two processes that can not be synthesized. 
    // But are useful for simulation to generate clock signals.
    always begin
        #3;
        clk3 = ~clk3;
    end

    always #11 clk11 = ~clk11;

    // This is a synthesizable combinational process/circuit.
    // @* means: Run this once each time anything used as input changes.
    always @*
        func = clk3 & clk11;

endmodule
