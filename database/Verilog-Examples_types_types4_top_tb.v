// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 10ns/1ns

`default_nettype none

module tb();

    reg [3:0] aa [3:0];

    initial begin
        $dumpfile("top_tb.vcd");
        //$dumpvars;      // this will not dump the arrays :-(
        $dumpvars( 0, aa[0], aa[1], aa[2], aa[3] );     // this will warn but it is OK

        //aa = 0;         // XXX can not set all at once

        #1;
        aa[0] = 12;             // set vector 0 all at once
        $display("%b ", aa[0], aa[0], aa[1], aa[2], aa[3]);
        #1;

        aa[0][3] = 0;           // clear the MSB of vector zero
        $display("%b ", aa[0], aa[0], aa[1], aa[2], aa[3]);
        #1;

        $display();

        aa[2][2] = 0;          // a[2] will be an upper-case X because not all bits are set
        $display(aa[0], aa[1], aa[2], aa[3]);
        #1;

        aa[2][0] = 1;
        aa[2][1] = 1;
        aa[2][3] = 0;
        $display(aa[0], aa[1], aa[2], aa[3]);

        #30;
        $finish;
    end

endmodule
