// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

`timescale  1ns / 1ps
`include "pe_bit.v"

module pe_bit_tb();
parameter BITWIDTH = 8;
parameter IS_BITWIDTH_DOUBLE_SCALE = 1;

// PE_top Inputs
reg clk = 0;
reg rst_n = 0;
reg en = 0;
reg [BITWIDTH - 1: 0] in_a = 0;
reg [BITWIDTH - 1: 0] in_b = 0;

// PE_top Outputs
wire [BITWIDTH - 1: 0] out_a_delay;
wire [BITWIDTH - 1: 0] out_b_delay;
wire [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] result;

initial begin
    forever
        #2 clk = ~clk;
end

initial begin
    #4;
    rst_n = 1;
    en = 1;
    #5;
    in_a = 3;
    in_b = 3;
    #5;
    in_a = 5;
    #5;
    in_a = 0;
    in_b = 0;
    #5;
    in_a = -3;
    in_b = 1;
    #5;
    en = 0;
    #5;
    in_a = 0;
    in_b = 0;
    #5;
    in_a = 3;
    in_b = 3;
end

initial begin
    $dumpfile("pe_bit_tb.vcd");
    $dumpvars();
    #1000;
    $finish;
end

pe_bit #(
           .BITWIDTH ( BITWIDTH ),
           .IS_BITWIDTH_DOUBLE_SCALE( 1 )
       )
       u_pe_bit (
           .clk ( clk ),
           .rst_n ( rst_n ),
           .en ( en ),
           .in_a ( in_a [BITWIDTH - 1: 0] ),
           .in_b ( in_b [BITWIDTH - 1: 0] ),

           .out_a_delay ( out_a_delay [BITWIDTH - 1: 0] ),
           .out_b_delay(out_b_delay [BITWIDTH - 1: 0]),
           .result ( result [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] )
       );

endmodule
