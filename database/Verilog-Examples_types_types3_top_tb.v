// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 10ns/1ns

`default_nettype none

module tb();

    reg a [3:0];        // one array of 4 bits
    reg b [3:0][3:0];   // 4 arrays of 4 bits

    integer i;          // this is used in the for loops below

    initial begin
        $dumpfile("top_tb.vcd");
        //$dumpvars;      // this will not dump the arrays :-(
        $dumpvars( 0, a[0], a[1], a[2], a[3] );     // this will warn but it is OK

        //a = 0;         // XXX can not set all at once

        #1;
        a[0] = 1;
        $display(a[0], a[1], a[2], a[3]);
        #1;

        a[1] = 0;
        $display(a[0], a[1], a[2], a[3]);
        #1;

        a[2] = 1;
        a[3] = 0;
        $display(a[0], a[1], a[2], a[3]);

        #1;

        $display(); // skip a line

        //b[0] = 1;     // can not set a row at once
        b[0][0] = 1;
        // we don't have a ++  :-(
        for (i=0; i<4; i=i+1) $display(b[i][0], b[i][1], b[i][2], b[i][3]);
        $display();

        b[0][1] = 1;
        for (i=0; i<4; i=i+1) $display(b[i][0], b[i][1], b[i][2], b[i][3]);
        $display();

        b[1][2] = 1;
        for (i=0; i<4; i=i+1) $display(b[i][0], b[i][1], b[i][2], b[i][3]);
        $display();

        #30;
        $finish;
    end


endmodule
