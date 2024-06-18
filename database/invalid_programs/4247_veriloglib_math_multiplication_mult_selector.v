// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

`include "mult2i1o.v"
`include "mult2i1o_pipelined.v"

module mult_selector
#(
	parameter integer WIDTH = 8,
	parameter integer PIPELINED = 0,
	parameter integer GENERATE_PROCEDURALS = 0
)
(
	input clk, clr_n,
	input [WIDTH-1:0] a,
	input [WIDTH-1:0] b,
	output [(WIDTH*2)-1:0] result
);

// Generate variables that might be required in the next generate statement
generate
	if (GENERATE_PROCEDURALS == 1)
		if (PIPELINED == 0)
			begin
				reg [WIDTH-1:0] atemp, btemp;
			end
		else
			begin
				reg [WIDTH-1:0] atemp, btemp;
				reg [(WIDTH*2)-1:0] abtemp;
			end
endgenerate

// Generate the correct multiplier
generate
	if (PIPELINED == 1)
		begin: pipelined_multiplier
			if (GENERATE_PROCEDURALS == 0)
				mult2i1o_pipelined #(.WIDTH(WIDTH))
					uut_pipelined (.clk(clk), .clr_n(clr_n), .a(a), .b(b), .result(result));
			else
				always @ (posedge clk or negedge clr_n)
					begin
						if (!clr_n) begin
							atemp <= 0;
							btemp <= 0;
							abtemp <= 0;
							result <= 0;
						end
						else begin
							atemp <= a;
							btemp <= b;
							abtemp <= atemp * btemp;
							result <= abtemp;
						end
					end
		end
	else
		begin: non_pipelined_multiplier
			if (GENERATE_PROCEDURALS == 0)
				mult2i1o #(.WIDTH(WIDTH))
					uut_non_pipelined (.clk(clk), .clr_n(clr_n), .a(a), .b(b), .result(result));
			else
				always @ (posedge clk or negedge clr_n)
					begin
						if (!clr_n) begin
							atemp <= 0;
							btemp <= 0;
							result <= 0;
						end
						else begin
							atemp <= a;
							btemp <= b;
							result <= atemp * btemp;
						end
					end
		end
endgenerate

endmodule
