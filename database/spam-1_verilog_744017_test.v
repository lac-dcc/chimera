// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "hc744017.v"
`include "../lib/assertion.v"

`timescale 1ns/1ns

module test();

    logic cp0, _cp1, mr;
    wire [9:0] q;
    wire _co;

    hc744017 decade(.cp0, ._cp1, .mr, .q, ._co);

    localparam PD=30;

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, test );
`ifndef verilator
        $monitor("%9t", $time, " cp0=", cp0, " _cp1=", _cp1, " mr=", mr, " q=%1d", q, " _co=", _co);
`endif

        $display("mr=0");
        cp0 = 0;
        _cp1 = 1;
        mr = 1;
        #PD
        `Equals(q, 10'b1);

        $display("_cp1 clk but not count");
        cp0 = 1;
        _cp1 = 0;
        #PD

        $display("_cp1 clk but not count");
        cp0 = 0;
        _cp1 = 0;
        #PD
        `Equals(q, 10'b1);

        $display("_cp1 clk but not count");
        cp0 = 1;
        _cp1 = 0;
        #PD
        `Equals(q, 10'b1);

        $display("cp0 clk mr=0 clk ----");
        cp0 = 0;
        _cp1 = 0;
        mr = 0;
        #PD
        `Equals(q, 10'b1);

        $display("cp0 clk mr=0 clk");
        cp0 = 1;
        mr = 0;
        #PD
        `Equals(q, 10'b10);

        $display("cp0 clk mr=0 clk ----");
        cp0 = 0;
        _cp1 = 0;
        mr = 0;
        #PD
        `Equals(q, 10'b10);

        $display("cp0 clk mr=0 clk");
        cp0 = 1;
        mr = 0;
        #PD
        `Equals(q, 10'b100);
        `Equals(_co, 1'b1);

        $display("cp0 clk mr=0 clk ----");
        cp0 = 0;
        _cp1 = 0;
        mr = 0;
        #PD
        `Equals(q, 10'b100);

        $display("cp0 clk mr=0 clk");
        cp0 = 1;
        mr = 0;
        #PD
        `Equals(q, 10'b1000);
        `Equals(_co, 1'b1);

        $display("cp0 clk mr=0 clk ----");
        cp0 = 0;
        _cp1 = 0;
        mr = 0;
        #PD
        `Equals(q, 10'b1000);

        $display("cp0 clk mr=0 clk");
        cp0 = 1;
        mr = 0;
        #PD
        `Equals(q, 10'b10000);
        `Equals(_co, 1'b1);

        $display("cp0 clk mr=0 clk ----");
        cp0 = 0;
        _cp1 = 0;
        mr = 0;
        #PD
        `Equals(q, 10'b10000);

        $display("cp0 clk mr=0 clk");
        cp0 = 1;
        mr = 0;
        #PD
        `Equals(q, 10'b100000);
        `Equals(_co, 1'b0);

        $display("cp0 clk mr=0 clk ----");
        cp0 = 0;
        _cp1 = 0;
        mr = 0;
        #PD
        `Equals(q, 10'b100000);

        $display("cp0 clk mr=0 clk");
        cp0 = 1;
        mr = 0;
        #PD
        `Equals(q, 10'b1000000);
        `Equals(_co, 1'b0);

        $display("cp0 clk mr=0 clk ----");
        cp0 = 0;
        _cp1 = 0;
        mr = 0;
        #PD
        `Equals(q, 10'b1000000);

        $display("cp0 clk mr=0 clk");
        cp0 = 1;
        mr = 0;
        #PD
        `Equals(q, 10'b10000000);
        `Equals(_co, 1'b0);

        $display("cp0 clk mr=0 clk ----");
        cp0 = 0;
        _cp1 = 0;
        mr = 0;
        #PD
        `Equals(q, 10'b10000000);

        $display("cp0 clk mr=0 clk");
        cp0 = 1;
        mr = 0;
        #PD
        `Equals(q, 10'b100000000);
        `Equals(_co, 1'b0);

        $display("cp0 clk mr=0 clk ----");
        cp0 = 0;
        _cp1 = 0;
        mr = 0;
        #PD
        `Equals(q, 10'b100000000);

        $display("cp0 clk mr=0 clk");
        cp0 = 1;
        mr = 0;
        #PD
        `Equals(q, 10'b1000000000);
        `Equals(_co, 1'b0);

        $display("wrap ----");
        cp0 = 0;
        _cp1 = 0;
        mr = 0;
        #PD
        `Equals(q, 10'b1000000000);

        $display("cp0 clk mr=0 clk");
        cp0 = 1;
        mr = 0;
        #PD
        `Equals(q, 10'b1);
        `Equals(_co, 1'b1);

        $display("wrap ----");
        cp0 = 0;
        _cp1 = 0;
        mr = 0;
        #PD
        `Equals(q, 10'b1);

        $display("cp0 clk mr=0 clk");
        cp0 = 1;
        mr = 0;
        #PD
        `Equals(q, 10'b10);
        `Equals(_co, 1'b1);

        $display("mr");
        mr = 1;
        #PD
        `Equals(q, 10'b1);
        `Equals(_co, 1'b1);

        #PD
        $finish; 

    end

endmodule
