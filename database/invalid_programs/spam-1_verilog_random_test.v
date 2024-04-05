// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "random.v"
`include "../lib/assertion.v"

`timescale 1ns/1ns
module tb();

wire [7:0] Q;
logic clk=0;
logic _OE1;
logic _OE2;

random rand1( .clk(clk), ._OE(_OE1), .Q );
random rand2( .clk(clk), ._OE(_OE2), .Q );

initial begin
`ifndef verilator
    $monitor("%9t ", $time, 
        //" : clk=%1b ",clk, " Q=%8b, _OE=%1b", Q, _OE1, " _OE=%1b", _OE2);
        " Q=%8b, _OE=%1b", Q, _OE1, " _OE=%1b", _OE2);
`endif

    _OE1=1;
    _OE2=1;
    #10
    $display("oe1=0");
    _OE1=0;
    #30
    $display("clk");
    clk=!clk;
    #30
    clk=!clk;
    #30
    $display("clk");
    clk=!clk;
    #30
    clk=!clk;

    #10
    $display("oe1=1");
    _OE1=1;
    #10
    $display("oe1=0");
    _OE1=0;
    #10
    $display("oe2=0");
    _OE2=0;
end

endmodule
