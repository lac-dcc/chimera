// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module msg_cmd_dec(
	input [0:7] cmd,
	output r, w, in, pa, ok, pe, en,
	output cpd, cpr, cpf, cps
);

	wire [0:10] bus;
	always @ (*) begin
		case (cmd)
			{ `MSG_REQ,  `CMD_R,   3'b110 } : bus = 11'b10000000000;
			{ `MSG_REQ,  `CMD_W,   3'b111 } : bus = 11'b01000000000;
			{ `MSG_REQ,  `CMD_IN,  3'b101 } : bus = 11'b00100000000;
			{ `MSG_REQ,  `CMD_PA,  3'b000 } : bus = 11'b00010000000;
			{ `MSG_RESP, `CMD_OK,  3'b000 } : bus = 11'b00001000000;
			{ `MSG_RESP, `CMD_OK,  3'b001 } : bus = 11'b00001000000;
			{ `MSG_RESP, `CMD_PE,  3'b000 } : bus = 11'b00001100000;
			{ `MSG_RESP, `CMD_PE,  3'b001 } : bus = 11'b00001100000;
			{ `MSG_RESP, `CMD_EN,  3'b000 } : bus = 11'b00000010000;
			{ `MSG_REQ,  `CMD_CPD, 3'b001 } : bus = 11'b00000001000;
			{ `MSG_REQ,  `CMD_CPR, 3'b100 } : bus = 11'b00000000100;
			{ `MSG_REQ,  `CMD_CPF, 3'b100 } : bus = 11'b00000000010;
			{ `MSG_REQ,  `CMD_CPS, 3'b000 } : bus = 11'b00000000001;
			default: bus = 11'd0;
		endcase
	end

	assign { r, w, in, pa, ok, pe, en, cpd, cpr, cpf, cps } = bus;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
