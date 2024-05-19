// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Level 1 instruction decoder

module idec1(
	input [0:5] i,
	output [0:47] o
);

	always @ (*) begin
		if (i[0:1] == 2'b0)
			o = 48'd0;
		else
			o = 48'b100000000000000000000000000000000000000000000000 >> (i-16);
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
