// This program was cloned from: https://github.com/manili/VSDBabySoC
// License: Apache License 2.0

`timescale 1ns / 1ps
`include "primitives.v"
`include "sky130_fd_sc_hd.v"

module testbench;
wire [9:0] OUT;
reg CLK;
reg reset;

supply0 vgnd;
supply1 vpwr;

rvmyth uut 
(
    .OUT(OUT),
`ifdef USE_POWER_PINS
    .VGND(vgnd),
    .VPWR(vpwr),
`endif
    .CLK (CLK),
    .reset (reset)
);

localparam CLK_PERIOD = 25;
always #(CLK_PERIOD/2) CLK=~CLK;

initial begin
    $dumpfile("post_routing_sim.vcd");
    $dumpvars(0, testbench);
end

initial begin
    CLK = 1'h0;
    reset = 1'h0;
    #(CLK_PERIOD) reset = 1'h1;
    #(CLK_PERIOD * 3) reset = 1'h0;
    #(CLK_PERIOD * 3000) $finish;
end

endmodule