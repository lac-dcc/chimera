// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

// Fujitsu AV cell
// 2:4 Decoder
// furrtek 2022

`timescale 1ns/100ps

module DE2(
	input A, B,
	output reg [3:0] X
);

always @(*) begin
	case({A, B})	// tmax = 1.3ns
		2'd0: X <= 4'b1110;
		2'd1: X <= 4'b1101;
		2'd2: X <= 4'b1011;
		2'd3: X <= 4'b0111;
	endcase
end

endmodule
