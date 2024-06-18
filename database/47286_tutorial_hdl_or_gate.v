// This program was cloned from: https://github.com/learn-cocotb/tutorial
// License: BSD 2-Clause "Simplified" License

module or_gate(
	input wire a,
	input wire b,
	output wire y
);
assign y=a|b;
endmodule
