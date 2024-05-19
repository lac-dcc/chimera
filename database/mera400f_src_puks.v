// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

/*
	PUKS-3 unit (power supply: reset circuit and voltage control)

	document: 12-006383-01-9A
	unit:     PUKS-3
	pages:    1-9
*/

module puks(
	input clk_sys,
	input rcl,	// received clear
	input dcl,	// clear driver
	output off,	// power lines not ready (in real hardware: goes high 0.5-2s after the power is switched on)
	output pout,// power out (0.2-2us strob, not implemented)
	output pon,	// power on (0.2-2us strob when power is ready)
	output clo,	// general reset
	output clm	// module reset
);

	reg on = 1'b0;
	reg [3:0] pwon_cnt = 4'd0;
	always @ (posedge clk_sys) begin
		if (pwon_cnt != 4'b111) pwon_cnt <= pwon_cnt + 1'b1;
		if (pwon_cnt == 4'd3) on <= 1'b1;
		if (pwon_cnt == 4'd3) pon <= 1'b1;
		else if (pwon_cnt == 4'd5) pon <= 1'b0;
	end

	assign off = ~on;
	assign pout = 1'b0;
	assign clm = off | dcl | rcl;
	assign clo = off | dcl;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
