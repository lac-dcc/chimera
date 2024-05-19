// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module recv_cp(
	input clk_sys,
	input send_cp,
	input tx_ena_cp,
	input [0:15] w,
	input [0:9] indicators,
	input [0:3] rotary_pos,
	output reg tx_trig_cp,
	output [0:7] tx_cp_cmd,
	output [0:15] tx_cp_a2,
	output [0:15] tx_cp_a3
);

	localparam IDLE = 2'd0;
	localparam ACCESS = 2'd1;
	localparam WAIT = 2'd2;

	reg [0:1] cp_state = IDLE;

	always @ (posedge clk_sys) begin
		case (cp_state)
			IDLE: begin
				if (send_cp) begin
					tx_trig_cp <= 1;
					cp_state <= ACCESS;
				end
			end
			ACCESS: begin
				if (tx_ena_cp) begin
					tx_trig_cp <= 0;
					cp_state <= WAIT;
				end
			end
			WAIT: begin
				if (!tx_ena_cp & !send_cp) begin
					cp_state <= IDLE;
				end
			end
		endcase
	end

	assign tx_cp_cmd = tx_ena_cp ? { `MSG_RESP, `CMD_OK, 3'b011 } : 8'd0;
	assign tx_cp_a2  = tx_ena_cp ? w : 16'd0;
	assign tx_cp_a3  = tx_ena_cp ? { indicators, 2'b00, rotary_pos } : 16'd0;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
