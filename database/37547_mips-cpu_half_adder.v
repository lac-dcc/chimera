// This program was cloned from: https://github.com/jmahler/mips-cpu
// License: GNU General Public License v3.0

`ifndef _half_adder
`define _half_adder

module half_adder(
		input	a,
		input	b,
		output	s,
		output	c);

	assign s = a ^ b;
	assign c = a & b;

endmodule

`endif
