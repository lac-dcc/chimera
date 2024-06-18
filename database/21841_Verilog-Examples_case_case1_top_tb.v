// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/1ns  // time units & precision are both 1nsec

module tb();

    wire [1:0]  out;
    reg         aa,bb,cc,dd;

     bassackward uut ( 
            .Q(out), 
            .a(aa),
            .b(bb),
            .c(cc),
            .d(dd)
            );

    initial begin
        $monitor("time:%2t %b%b%b%b out=%b", $time, aa,bb,cc,dd,out );

        $dumpfile("top_tb.vcd");
        $dumpvars;

        {aa,bb,cc,dd} = 4'b1000;
        #1;
        {aa,bb,cc,dd} = 4'b0100;
        #1;
        {aa,bb,cc,dd} = 4'b0010;
        #1;
        {aa,bb,cc,dd} = 4'b0001;
        #1;

        {aa,bb,cc,dd} = 4'b0000;        // (no bits set) illegal value
        #1;
        {aa,bb,cc,dd} = 4'b1010;        // (more than 1 bit set) illegal value
        #1;
        {aa,bb,cc,dd} = 4'bxxxx;        // just not right
        #1;
        {aa,bb,cc,dd} = 4'bzzzz;        // badness
        #1;

        {aa,bb,cc,dd} = 4'bxx1x;        // what happens if we do this?
        #1;
        {aa,bb,cc,dd} = 4'b?1??;        // what happens if we do this?
        #1;

        $finish;
    end

endmodule
