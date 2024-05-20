// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module register2(
    input wire clk,
    input wire rst_n,
    input wire ct,
    input wire mwg1,
    input wire [WIDTH:1] mwl1,
    input wire mwg2,
    input wire [WIDTH:1] mwl2,
    output reg [WIDTH:1] val
);

parameter WIDTH = 16;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        val <= {WIDTH{1'b0}};
    end else if (mwg1) begin
        val <= mwl1 | (ct ? {WIDTH{1'b0}} : val);
    end else if (mwg2) begin
        val <= mwl2 | (ct ? {WIDTH{1'b0}} : val);
    end
end

endmodule
`default_nettype wire
