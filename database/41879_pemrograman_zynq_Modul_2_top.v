// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

module top
    (
        input wire  clk,
        input wire  rst,
        input wire  a,
        input wire  b,
        input wire  c,
        output wire sum,
        output wire carry 
    );
    
    wire a_w, b_w, c_w, sum_w, carry_w;
    
    dff
    (
        .clk(clk),
        .rst(rst),
        .d(a),
        .q(a_w)
    );

    dff
    (
        .clk(clk),
        .rst(rst),
        .d(b),
        .q(b_w)
    );

    dff
    (
        .clk(clk),
        .rst(rst),
        .d(c),
        .q(c_w)
    );
    
    full_adder full_adder_0
    (
        .a(a_w),
        .b(b_w),
        .c(c_w),
        .sum(sum_w),
        .carry(carry_w)
    );
    
    dff
    (
        .clk(clk),
        .rst(rst),
        .d(sum_w),
        .q(sum)
    );

    dff
    (
        .clk(clk),
        .rst(rst),
        .d(carry_w),
        .q(carry)
    );
    
endmodule
