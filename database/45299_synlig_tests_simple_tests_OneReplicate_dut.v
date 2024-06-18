// This program was cloned from: https://github.com/chipsalliance/synlig
// License: Apache License 2.0

module dut (a, b);
	input a;
	output [3:0] b;
	reg [3:0] b;
	assign b = {4{a}};
endmodule
