// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../define/bus.v"

module HILO(
    input clk,
    input rst,
    input write_en,
    input [`DATA_BUS] hi_in,
    input [`DATA_BUS] lo_in,
    output reg[`DATA_BUS] hi,
    output reg[`DATA_BUS] lo
);

    always @(posedge clk) begin
        if (!rst) begin
            hi <= 0;
            lo <= 0;
        end
        else if (write_en) begin
            hi <= hi_in;
            lo <= lo_in;
        end
    end

endmodule // HILO
