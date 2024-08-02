// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module register(
    input wire clk,
    input wire rst_n,
    input wire ct,
    input wire mwg,
    input wire [WIDTH:1] mwl,
    output reg [WIDTH:1] val
);

parameter WIDTH = 16;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        val <= {WIDTH{1'b0}};
    end else if (mwg) begin
        val <= mwl | (ct ? {WIDTH{1'b0}} : val);
    end
end

endmodule
`default_nettype wire
