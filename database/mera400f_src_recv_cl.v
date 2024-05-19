// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module recv_cl(
	input clk_sys,
	input rcl,
	input tx_ena_cl,
	output reg tx_trig_cl,
	output [0:7] tx_reset_cmd
);

	localparam IDLE = 2'd0;
	localparam ACCESS = 2'd1;
	localparam WAIT = 2'd2;

	reg [0:1] rstate = IDLE;

	always @ (posedge clk_sys) begin
		case (rstate)
			IDLE: begin
				if (rcl) begin
					tx_trig_cl <= 1;
					rstate <= ACCESS;
				end
			end
			ACCESS: begin
				if (tx_ena_cl) begin
					tx_trig_cl <= 0;
					rstate <= WAIT;
				end
			end
			WAIT: begin
				if (!tx_ena_cl & !rcl) begin
					rstate <= IDLE;
				end
			end
		endcase
	end

	assign tx_reset_cmd = tx_ena_cl ? { `MSG_REQ, `CMD_CL, 3'b000 } : 8'd0;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
