// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module VGAColor(
    input [3:0] index,
    output reg[11:0] color
);

    always @(*) begin
        case (index)
            4'b0000: color <= 12'h000;
            4'b0001: color <= 12'h00a;
            4'b0010: color <= 12'h0a0;
            4'b0011: color <= 12'h0aa;
            4'b0100: color <= 12'ha00;
            4'b0101: color <= 12'ha0a;
            4'b0110: color <= 12'haa0;
            4'b0111: color <= 12'haaa;
            4'b1000: color <= 12'h444;
            4'b1001: color <= 12'h44f;
            4'b1010: color <= 12'h4f4;
            4'b1011: color <= 12'h4ff;
            4'b1100: color <= 12'hf44;
            4'b1101: color <= 12'hf4f;
            4'b1110: color <= 12'hff4;
            4'b1111: color <= 12'hfff;
            default: color <= 12'h000;
        endcase
    end

endmodule // VGAColor
