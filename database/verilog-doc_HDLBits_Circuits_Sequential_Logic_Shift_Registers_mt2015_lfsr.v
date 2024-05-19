// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
        input [2:0] SW,      // R
        input [1:0] KEY,     // L and clk
        output [2:0] LEDR);  // Q
    SubModuel ins0(SW[0], LEDR[2], KEY[0], KEY[1], LEDR[0]);
    SubModuel ins1(SW[1], LEDR[0], KEY[0], KEY[1], LEDR[1]);
    SubModuel ins2(SW[2], LEDR[1]^LEDR[2], KEY[0], KEY[1], LEDR[2]);
endmodule

module SubModuel(input R, input q_in, input clk, input L, output q);
    always @(posedge clk) begin
        case (L)
            1'b0: begin
                q <= q_in;
            end
            1'b1: begin
                q <= R;
            end
        endcase
    end
endmodule


