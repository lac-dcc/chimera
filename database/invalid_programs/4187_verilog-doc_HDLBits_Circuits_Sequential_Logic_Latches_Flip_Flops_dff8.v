// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk) begin
        q = d;
    end
endmodule

