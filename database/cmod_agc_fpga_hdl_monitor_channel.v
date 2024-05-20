// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module channel(
    input wire clk,
    input wire rst_n,

    input wire ct,
    input wire mrchg,
    input wire mwchg,
    input wire [9:1] ch,
    input wire [WIDTH:1] mwl,
    output reg [WIDTH:1] val
);

parameter CHAN = 1;
parameter WIDTH = 15;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        val <= {WIDTH{1'b0}};
    end else if ((mwchg | mrchg) & (ch == CHAN)) begin
        val <= mwl | (ct ? {WIDTH{1'b0}} : val);
    end
end


endmodule
`default_nettype wire
