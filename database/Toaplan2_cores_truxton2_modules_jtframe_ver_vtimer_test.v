// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

`timescale 1ns/1ps
`define SIMULATION_VTIMER

module test;

reg clk, pxl_cen;

initial begin
    clk = 0;
    pxl_cen = 0;
    forever #83.333 clk = ~clk;
end

initial #(16600*1000*4) $finish;

always @(posedge clk) pxl_cen <= ~pxl_cen;

jtframe_vtimer UUT(
    .clk        ( clk       ),
    .pxl_cen    ( pxl_cen   )
);

initial begin
    $dumpfile("test.lxt");  
    $dumpvars;  
end

endmodule