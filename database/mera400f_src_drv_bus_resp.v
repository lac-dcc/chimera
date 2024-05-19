// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module drv_bus_resp(
	input clk_sys,
	input ready,
	input ok,
	input en,
	input pe,
	input [0:15] a3,
	input req,
	output reg dok,
	output reg den,
	output reg dpe,
	output reg [0:15] ddt
);

	// response trigger: any response for an active request
	wire resp = req & ready & (ok | en);

	localparam IDLE = 4'd0;
	localparam RESP = 4'd1;
	reg [0:0] state = IDLE;

	always @ (posedge clk_sys) begin

		case (state)

			IDLE: begin
				if (resp) begin
					dok <= ok;
					den <= en;
					dpe <= pe;
					ddt <= a3;
					state <= RESP;
				end
			end

			RESP: begin
				if (!req) begin
					dok <= 0;
					den <= 0;
					dpe <= 0;
					ddt <= 16'd0;
					state <= IDLE;
				end
			end

		endcase

	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
