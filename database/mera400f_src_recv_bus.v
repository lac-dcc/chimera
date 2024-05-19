// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module recv_bus(
	input clk_sys,
	input send_req,
	input send_resp,
	input tx_ena_bus,
	output reg tx_trig_bus,
	input rqb,
	input rpn,
	input [0:3] rnb,
	input [0:15] rad,
	input [0:15] rdt,
	input [0:7] enc_cmd,
	output [0:7] tx_bus_cmd,
	output [0:7] tx_bus_a1,
	output [0:15] tx_bus_a2,
	output [0:15] tx_bus_a3
);

	reg [0:7] reg_cmd;
	reg [0:7] reg_a1;
	reg [0:15] reg_a2;
	reg [0:15] reg_a3;

	localparam IDLE = 2'd0;
	localparam ACCESS = 2'd1;
	localparam WAIT = 2'd2;

	reg [0:1] bus_state = IDLE;

	reg is_req;

	always @ (posedge clk_sys) begin
		case (bus_state)
			IDLE: begin
				if (send_req | send_resp) begin
					is_req <= send_req;
					reg_cmd <= enc_cmd;
					reg_a1 <= {2'd0, rqb, rpn, rnb};
					reg_a2 <= rad;
					reg_a3 <= rdt;
					tx_trig_bus <= 1;
					bus_state <= ACCESS;
				end
			end
			ACCESS: begin
				if (tx_ena_bus) begin
					tx_trig_bus <= 0;
					bus_state <= WAIT;
				end
			end
			WAIT: begin
				if (!tx_ena_bus && ((!send_req && is_req) || (!send_resp && !is_req))) begin
					bus_state <= IDLE;
				end
			end
		endcase
	end

	assign tx_bus_cmd= tx_ena_bus ? reg_cmd : 8'd0;
	assign tx_bus_a1 = tx_ena_bus ? reg_a1  : 8'd0;
	assign tx_bus_a2 = tx_ena_bus ? reg_a2  : 16'd0;
	assign tx_bus_a3 = tx_ena_bus ? reg_a3  : 16'd0;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
