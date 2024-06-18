// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module zp(
	input _0_zp,
	input zpa,
	input zpb,
	input [0:39] t,
	input [0:7] d,
	input z_f,
	input m_f,
	input v_f,
	input c_f,
	output [0:15] zp
);

	always @ (*) begin
		if (_0_zp) zp <= 16'd0;
		else case ({zpb, zpa})
			2'b00: zp <= t[0:15];
			2'b01: zp <= t[16:31];
			2'b10: zp <= {t[32:39], d[0:7]};
			2'b11: zp <= {z_f, m_f, v_f, c_f, 12'd0};
		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
