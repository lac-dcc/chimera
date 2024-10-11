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

        // 1364-2005 11.3: An explicit zero delay (#0) requires that the 
        // process be suspended and added as an inactive event for the
        // current time so that the process is resumed in the next simulation 
        // cycle in the current time.
        //
        // This means that using #0 will cause everything else that is ALREADY
        // scheduled to finish 'now' to be completed before proceeding.
        // #0 is a request to move myself to the back of a queue.  As long as 
        // nothing else gets put in that queue before the time advances then
        // all will be fine.  But if something in the queue now causes more
        // things to get in the queue then those new things will happen
        // after the $display() 
        //
        // In this simple application using #0 like this is OK.
        #0 $display("%5t: a=%b, b=%b, sum=%b, cy=%b %s", $time, a, b, sum, cy, (sum==0 && cy==0)? "pass" : "fail" );
        #1;

        a = 0;
        b = 1;

        #0 $display("%5t: a=%b, b=%b, sum=%b, cy=%b %s", $time, a, b, sum, cy, (sum==1 && cy==0)? "pass" : "fail" );
        #1;

        a = 1;
        b = 0;

        #0 $display("%5t: a=%b, b=%b, sum=%b, cy=%b %s", $time, a, b, sum, cy, (sum==1 && cy==0)? "pass" : "fail" );
        #1;

        a = 1;
        b = 1;

        #0 $display("%5t: a=%b, b=%b, sum=%b, cy=%b %s", $time, a, b, sum, cy, (sum==0 && cy==1)? "pass" : "fail" );
        #1;

        a = 0;
        b = 0;
        #0 $display("%5t: a=%b, b=%b, sum=%b, cy=%b %s", $time, a, b, sum, cy, (sum==0 && cy==0)? "pass" : "fail" );
        #2;
        
        $finish;    // The $finish 'system task' halts the simulation
    end

endmodule
