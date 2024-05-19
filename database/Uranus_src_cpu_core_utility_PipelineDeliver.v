// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module PipelineDeliver #(parameter width = 1) (
    input clk,
    input rst,
    input flush,
    input stall_current_stage,
    input stall_next_stage,
    input [width - 1:0] in,
    output reg[width - 1:0] out
);

    always @(posedge clk) begin
        if (!rst) begin
            out <= 0;
        end
        else if (flush) begin
            out <= 0;
        end
        else if (stall_current_stage && !stall_next_stage) begin
            out <= 0;
        end
        else if (!stall_current_stage) begin
            out <= in;
        end
    end

endmodule // PipelineDeliver
