// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    always @(posedge clk) begin
		if (load) begin
			q <= data;
		end
		else begin
			q <= { 1'b0, q[511:1] } ^ { q[510:0], 1'b0 };
		end
    end
endmodule

