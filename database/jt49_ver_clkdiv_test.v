`timescale 1ns / 1ps

module test;

reg clk, cen=1'b1, rst_n;

initial begin
    clk = 0;
    forever clk = #5 ~clk;
end

initial begin
    rst_n = 1'b0;
    #50 rst_n = 1'b1;
end

initial begin
    $dumpfile("test.lxt");
    $dumpvars;
    $dumpon;
    #(10*15*4*16) $finish;
end

reg [3:0] period;

initial begin
    period = 4'h0;
    forever #(10*15*4) period = period+4'h1;
end

// always @(negedge clk)
//  cen <= ~cen;

wire cen_div;

jt49_div #(.width(4) ) uut (   
    .clk    ( clk       ),
    .cen    ( cen       ),
    .rst_n  ( rst_n     ),
    .period ( period    ),
    .cen_div( cen_div   )
);

endmodule // jt49_cen_div