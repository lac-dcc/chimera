// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module msg_cmd_enc(
	input f, s, r, w, in, ok, timeout, pe,
	output [0:7] cmd
);

	always @ (*) begin
		case ({f, s, r, w, in, ok, timeout, pe})
			8'b10000000 : cmd = { `MSG_REQ,  `CMD_F,  3'b110 }; // req: F
			8'b01000000 : cmd = { `MSG_REQ,  `CMD_S,  3'b111 }; // req: S
			8'b00100100 : cmd = { `MSG_RESP, `CMD_OK, 3'b001 }; // rsp: OK for R
			8'b00100101 : cmd = { `MSG_RESP, `CMD_PE, 3'b000 }; // rsp: OK+PE for R
			8'b00010100 : cmd = { `MSG_RESP, `CMD_OK, 3'b000 }; // rsp: OK for W
			8'b00001100 : cmd = { `MSG_RESP, `CMD_OK, 3'b000 }; // rsp: OK for IN
			8'b00100010 : cmd = { `MSG_RESP, `CMD_NO, 3'b000 }; // rsp: timeout for R
			8'b00010010 : cmd = { `MSG_RESP, `CMD_NO, 3'b000 }; // rsp: timeout for W
			8'b00001010 : cmd = { `MSG_RESP, `CMD_NO, 3'b000 }; // rsp: timeout for IN
			default     : cmd = 8'd0;
		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
