// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// A bus (ALU A input)

module bus_a(
	input bac, bab, baa,
	input aa, ab,
	input [0:15] l,
	input [0:15] ic,
	input [0:15] ar,
	input [0:15] ir,
	output [0:15] a
);

	always @ (*) begin
		if (bac) a[0:7] = 8'd0;
		else case ({ab, aa})
			2'b00: a[0:7] = l[0:7];
			2'b01: a[0:7] = ar[0:7];
			2'b10: a[0:7] = ic[0:7];
			2'b11: a[0:7] = l[8:15];
		endcase

		if (bab) a[8:9] = 2'd0;
		else case ({ab, aa})
			2'b00: a[8:9] = l[8:9];
			2'b01: a[8:9] = ar[8:9];
			2'b10: a[8:9] = ic[8:9];
			2'b11: a[8:9] = ir[8:9];
		endcase

		if (baa) a[10:15] = 6'd0;
		else case ({ab, aa})
			2'b00: a[10:15] = l[10:15];
			2'b01: a[10:15] = ar[10:15];
			2'b10: a[10:15] = ic[10:15];
			2'b11: a[10:15] = ir[10:15];
		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
