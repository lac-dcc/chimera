// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// KI bus

module bus_ki(
	input kia, kib,
	input [0:15] rz,
	input [0:15] sr,
	input [0:15] rb,
	input [0:15] zp,
	output [0:15] ki
);

	always @ (*) begin
		case ({kib, kia})
			2'b00 : ki <= rz;
			2'b01 : ki <= sr;
			2'b10 : ki <= rb;
			2'b11 : ki <= zp;
		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
