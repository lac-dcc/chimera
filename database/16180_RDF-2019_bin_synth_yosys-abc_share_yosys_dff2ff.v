// This program was cloned from: https://github.com/ieee-ceda-datc/RDF-2019
// License: MIT License

(* techmap_celltype = "$dff" *)
module dff2ff (CLK, D, Q);
	parameter WIDTH = 1;
	parameter CLK_POLARITY = 1;

	input CLK;
	input [WIDTH-1:0] D;
	output reg [WIDTH-1:0] Q;

	wire [1023:0] _TECHMAP_DO_ = "proc;;";

	always @($global_clock)
		Q <= D;
endmodule
