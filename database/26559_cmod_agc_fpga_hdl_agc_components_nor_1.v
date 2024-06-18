// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns/1ps
`default_nettype none

module nor_1(y, a, rst, clk);
    parameter delay = 9;
    parameter iv = 1'b0;
    input wire a, rst, clk;

    output reg y = iv;
    reg next_val = iv;

    always @(posedge clk or posedge rst)
    begin
        if (rst) y = iv;
        else y = next_val;
    end

    always @(negedge clk or posedge rst)
    begin
        if (rst) next_val = iv;
        else next_val = ~a;
    end
endmodule
`default_nettype wire
