// This program was cloned from: https://github.com/learn-cocotb/tutorial
// License: BSD 2-Clause "Simplified" License

module or_test(
	input wire a,
	input wire b,
	output wire y
);
or_gate or_gate(
	.a(a),
	.b(b),
	.y(y)
);

initial begin
	$dumpfile("or.vcd");
	$dumpvars;
end
endmodule
