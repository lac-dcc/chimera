// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module logical_and(input wire [31:0] a, b, output wire [31:0] result);

	assign result = a & b;

endmodule


module logical_or(input wire [31:0] a, b, output wire [31:0] result);
	
    assign result = a | b;

endmodule


module logical_neg(input wire [31:0] b, output wire [31:0] result);

	assign result = ~b + 1;

endmodule


module logical_not(input wire [31:0] b, output wire [31:0] result);

	assign result = ~b;

endmodule