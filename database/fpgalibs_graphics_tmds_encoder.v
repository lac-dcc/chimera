// This program was cloned from: https://github.com/trabucayre/fpgalibs
// License: MIT License

/*
 * tmds_encoder.v
 *
 * Copyright (C) 2020  Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 * SPDX-License-Identifier: MIT
 */

module TMDS_encoder (
	input  wire       i_clk,
	input  wire [7:0] i_data,
	input  wire       i_c0,
	input  wire       i_c1,
	input  wire       i_de,
	output reg  [9:0] o_data
);

	/* generate xor and xnor representation */
	wire [8:0] dat_xor_s, dat_xnor_s;
	assign dat_xor_s[0] = i_data[0];
	assign dat_xnor_s[0] = i_data[0];
	genvar l_inst;
	generate
	for (l_inst = 1; l_inst < 8; l_inst = l_inst + 1) begin
		assign dat_xor_s[l_inst]  = i_data[l_inst] ^ dat_xor_s[l_inst-1];
		assign dat_xnor_s[l_inst] = ~(i_data[l_inst] ^ dat_xnor_s[l_inst-1]);
	end
	endgenerate
	assign dat_xor_s[8] = 1'b1;
	assign dat_xnor_s[8] = 1'b0;

	/* determine bit high count */
	wire [3:0] N1_in = i_data[0] + i_data[1] + i_data[2] + i_data[3] +
					i_data[4] + i_data[5] + i_data[6] + i_data[7];

	wire [8:0] q_m = (N1_in > 4 || (N1_in == 4 && i_data[0] == 0))?dat_xnor_s : dat_xor_s;
	wire [8:0] q_m_n = ~q_m;

	wire signed [4:0] N1 = {4'b0,q_m[0]} + {4'b0,q_m[1]}
			+ {4'b0,q_m[2]} + {4'b0,q_m[3]} + {4'b0,q_m[4]}
			+ {4'b0,q_m[5]} + {4'b0,q_m[6]} + {4'b0,q_m[7]};

	wire signed [4:0] N0 = 5'b01000 - N1;
	wire signed [4:0] disparity = N1 - N0;

	reg signed [4:0] cntTm;
	always @(posedge i_clk) begin
		if (cntTm == 5'b0 || disparity == 5'b0) begin
			if (q_m[8] == 1'b1) begin
				o_data <= {2'b01, q_m[7:0]};
				cntTm <= cntTm + disparity;
			end else begin
				o_data <= {2'b10, q_m_n[7:0]};
				cntTm <= cntTm - disparity;
			end
		end else if (cntTm[4] ^ disparity[4]) begin
			o_data <= {1'b0, q_m};
			cntTm <= cntTm - $signed({3'b0, q_m_n[8], 1'b0})
					+ disparity;
		end else begin
			o_data <= {1'b1, q_m[8], q_m_n[7:0]};
			cntTm <= cntTm + {3'b0, q_m[8], 1'b0}
					- disparity;
		end
		if (!i_de) begin
			case ({i_c1,i_c0})
			2'b00:
				o_data <= 10'b1101010100; // 0x354
			2'b01:
				o_data <= 10'b0010101011; // 0x0AB
			2'b10:
				o_data <= 10'b0101010100; // 0x154
			2'b11:
				o_data <= 10'b1010101011; // 0x2AB
			endcase
			cntTm <= 5'b0;
		end
	end
endmodule
