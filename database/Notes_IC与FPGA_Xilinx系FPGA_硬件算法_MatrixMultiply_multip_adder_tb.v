// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

`timescale  1ns / 1ps
`include "multip_adder.v"

module multip_adder_tb();
parameter BITWIDTH = 8;
parameter IS_BITWIDTH_DOUBLE_SCALE = 0;

reg signed [BITWIDTH - 1: 0] in_a = 0;
reg signed [BITWIDTH - 1: 0] in_b = 0;
reg signed [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] in_c = 0;
wire signed [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0]	product;

initial begin
    #5;
    in_a = 3;
    in_b = 3;
    in_c = 1;
    #5;
    in_a = 5;
    in_c = 0;
    #5;
    in_a = 0;
    in_b = 0;
    #5;
    in_a = -3;
    in_b = 1;
end

multip_adder #(
                 .BITWIDTH ( BITWIDTH ),
                 .IS_BITWIDTH_DOUBLE_SCALE( IS_BITWIDTH_DOUBLE_SCALE )
             )
             u_multip_adder(
                 //ports
                 .in_a ( in_a ),
                 .in_b ( in_b ),
                 .in_c ( in_c ),
                 .product ( product )
             );

initial begin
    $dumpfile("multip_adder_tb.vcd");
    $dumpvars();
    #1000;
    $finish;
end

endmodule
