// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// OK interface signal driver

module dok(
	input clk_sys,
	input rin,
	input zw,
	input int_ext,
	output dok_trig,
	output dok
);

	localparam IDLE = 2'd0;
	localparam TRIG = 2'd1;
	localparam DOK	= 2'd2;

	reg [1:0] state;

	always @ (posedge clk_sys) begin
		case (state)
			IDLE: if (~zw & rin & int_ext) state <= TRIG;
			TRIG: state <= DOK;
			DOK:  if (~rin) state <= IDLE;
		endcase
	end

	assign dok_trig = (state == TRIG);
	assign dok = (state == DOK) & rin;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
