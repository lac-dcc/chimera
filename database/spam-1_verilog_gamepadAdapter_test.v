// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
/* verilator lint_off ASSIGNDLY */
/* verilator lint_off STMTDLY */

`include "gamepadAdapter.v"
`include "../lib/assertion.v"
`timescale 1ns/1ns

module test();

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, test);

        $display("[%9t] TEST: START", $time);
    end

    logic  _OErandom=1;
    logic  _OEpad1=1;
    logic  _OEpad2=1;
    wire [7:0] Q;

    gamepadAdapter device (
        ._OErandom, 
        ._OEpad1, 
        ._OEpad2, 
        .Q
    );


    always @(*)
        $display("[%9t] TEST: ", $time, " Q=%8b", Q, );

    initial begin
        #1000
        $display("random on");
        _OErandom=0;

        #1000
        $display("random off");
        _OErandom=1;

        #1000
        $display("random on");
        _OErandom=0;

        #1000
        $display("random off");
        _OErandom=1;

        #1000
        $display("pad1 on");
        _OErandom=1;
        _OEpad1=0;

        #1000
        $display("pad2 on");
        _OEpad1=1;
        _OEpad2=0;

        #1000
        $display("off");
        _OEpad1=1;
        _OEpad2=1;

    end

endmodule

