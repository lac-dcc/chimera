// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module t(
	input clk_sys,
	input _0_t,
	input taa,
	input tab,
	input trb,
	input clockta,
	input clocktb,
	input clocktc,
	input t_1_d,
	input [0:39] k,
	input m_1,
	output reg [-1:39] t
);

	always @ (posedge clk_sys, posedge _0_t) begin
		if (_0_t) t[0:15] <= 0;
		else if (clockta) case ({~tab, ~taa})
			2'b00: t[0:15] <= t[0:15];
			2'b01: t[0:15] <= t[-1:14];
			2'b10: t[0:15] <= t[1:16];
			2'b11: t[0:15] <= k[0:15];
		endcase
	end

	always @ (posedge clk_sys, posedge _0_t) begin
		if (_0_t) t[16:31] <= 0;
		else if (clocktb) case ({~trb, ~taa})
			2'b00: t[16:31] <= t[16:31];
			2'b01: t[16:31] <= t[15:30];
			2'b10: t[16:31] <= t[17:32];
			2'b11: t[16:31] <= k[16:31];
		endcase
	end

	always @ (posedge clk_sys, posedge _0_t) begin
		if (_0_t) t[32:39] <= 0;
		else if (clocktc) case ({~trb, ~taa})
			2'b00: t[32:39] <= t[32:39];
			2'b01: t[32:39] <= t[31:38];
			2'b10: t[32:39] <= {t[33:39], m_1};
			2'b11: t[32:39] <= k[32:39];
		endcase
	end

	always @ (posedge clk_sys, posedge _0_t) begin
		if (_0_t) t[-1] <= 1'b0;
		else if (clockta) t[-1] <= t_1_d;
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
