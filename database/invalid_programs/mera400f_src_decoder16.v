// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// 74154 4-bit to 16-bit decoder

module decoder16(
	input en1, en2,
	input [0:3] i,
	output [0:15] o
);

	always @ (*) begin
		case ({~en1, ~en2, i})
			6'h0: o <= 16'b1000000000000000;
			6'h1: o <= 16'b0100000000000000;
			6'h2: o <= 16'b0010000000000000;
			6'h3: o <= 16'b0001000000000000;
			6'h4: o <= 16'b0000100000000000;
			6'h5: o <= 16'b0000010000000000;
			6'h6: o <= 16'b0000001000000000;
			6'h7: o <= 16'b0000000100000000;
			6'h8: o <= 16'b0000000010000000;
			6'h9: o <= 16'b0000000001000000;
			6'ha: o <= 16'b0000000000100000;
			6'hb: o <= 16'b0000000000010000;
			6'hc: o <= 16'b0000000000001000;
			6'hd: o <= 16'b0000000000000100;
			6'he: o <= 16'b0000000000000010;
			6'hf: o <= 16'b0000000000000001;
			default: o <= 16'b0000000000000000;
		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
