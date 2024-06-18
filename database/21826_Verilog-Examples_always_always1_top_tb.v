// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/1ns  // time units & precision are both 1nsec

module tb();

    reg         a;
    reg         b;
    reg         c;
    reg [7:0]   Y;

    initial begin
        $dumpfile("top_tb.vcd");    // where to write the dump
        $dumpvars;                  // dump EVERYTHING
    end

    initial begin
        // %2t leaves room for 2-digts
        //$monitor("time:%2t addr=%d,%b Y=%b", $time, {a,b,c}, {a,b,c}, Y );
        $monitor("time:%2t addr=%b%b%b Y=%b", $time, a, b, c, Y );

        // the implied length of {a,b,c} is 3 because a, b, and c are 1 each
        {a,b,c} = 0;
        #1;
        {a,b,c} = 1;
        #1;
        {a,b,c} = 2;
        #1;
        {a,b,c} = 3;
        #1;
        {a,b,c} = 4;
        #1;
        {a,b,c} = 5;
        #1;
        {a,b,c} = 6;
        #1;
        {a,b,c} = 7;
        #1;
        
        $finish;
    end

    always @*                   // simple but subtle!
//    always @( * )             // same as @*
//    always @( a, b, c )       // if we list ALL the RHS signals here, then is same as *
//    always @( a or b or c )   // the original way... eewwwww! (punctuation is clearer!)
    begin
        // note that else-if, else-if,... is not necessairly the best way to do this.
        // also note that this uses the == operator so all comparisons are literal.
        if ( {a,b,c} == 0 )         Y = 8'b00000001;    // use begin/end if need mult statements
        else if ( {a,b,c} == 1 )    Y = 8'b00000010;
        else if ( {a,b,c} == 2 )    Y = 8'b00000100;
        else if ( {a,b,c} == 3 )    Y = 8'b00001000;
        else if ( {a,b,c} == 4 )    Y = 8'b00010000;
        else if ( {a,b,c} == 5 )    Y = 8'b00100000;
        else if ( {a,b,c} == 6 )    Y = 8'b01000000;
        else if ( {a,b,c} == 7 )    Y = 8'b10000000;
    end

endmodule
