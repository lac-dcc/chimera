// This program was cloned from: https://github.com/chipsalliance/UHDM-integration-tests
// License: Apache License 2.0

module dut(a0, a1, a2, a3, b);
	input a0, a1, a2, a3;
	output [3:0] b;
	reg [3:0] b;
	assign b = {a3, a2, a1, a0};
endmodule
