// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module m(
	input clk_sys,
	input _0_m,
	input clockm,
	input ma,
	input mb,
	input m_32,
	input m_40,
	input m_1_d,
	input [0:39] t,
	output reg [-1:39] m
);

	always @ (posedge clk_sys, posedge _0_m) begin
		if (_0_m) m[0:39] <= 0;
		else if (clockm) case ({~mb, ~ma})
			2'b00: m[0:39] <= m[0:39];
			2'b01: m[0:39] <= m[-1:38];
			2'b10: m[0:39] <= {m[1:31], m_32, m[33:39], m_40};
			2'b11: m[0:39] <= t[0:39];
		endcase
	end

	always @ (posedge clk_sys, posedge _0_m) begin
		if (_0_m) m[-1] <= 1'b0;
		else if (clockm) m[-1] <= m_1_d;
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
