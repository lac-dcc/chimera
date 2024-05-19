// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input a,
    output q );
    always @(posedge clk) begin
        q <= !a;
    end
endmodule

