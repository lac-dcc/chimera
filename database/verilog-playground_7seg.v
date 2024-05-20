// This program was cloned from: https://github.com/X-Illuminati/verilog-playground
// License: Apache License 2.0

module seven_seg #(parameter INVERT = 0)
(
	input [3:0] bcd,
	output      seg_a,
	output      seg_b,
	output      seg_c,
	output      seg_d,
	output      seg_e,
	output      seg_f,
	output      seg_g
);
	reg [6:0] out;
	always @(bcd) begin
		case(bcd)
			0: out = 7'b1111110;
			1: out = 7'b0110000;
			2: out = 7'b1101101;
			3: out = 7'b1111001;
			4: out = 7'b0110011;
			5: out = 7'b1011011;
			6: out = 7'b1011111;
			7: out = 7'b1110000;
			8: out = 7'b1111111;
			9: out = 7'b1111011;
			'hA: out = 7'b1110111;
			'hB: out = 7'b0011111;
			'hC: out = 7'b1001110;
			'hD: out = 7'b0111101;
			'hE: out = 7'b1001111;
			'hF: out = 7'b1000111;
			default: out = 7'b0000000;
		endcase
	end

	assign {seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g} =
		(INVERT) ? ~out : out;

endmodule
