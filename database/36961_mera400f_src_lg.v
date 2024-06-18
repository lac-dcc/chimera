// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Group counter

module lg(
	input clk_sys,
	input reset,
	input cu,
	input gr,
	input slg1, slg2,
	input [7:9] ir,
	output lg_0, lg_1, lg_2, lg_3,
	output lga, lgb, lgc
);

	// @ slg1: at the start of execution cycle loads ir[7:9]
	// @ slg2: for register group operations loads first register number

	reg [0:2] lg;
	always @ (posedge clk_sys, posedge reset) begin
		if (reset) lg <= 3'd0;
		else case ({slg1, slg2, cu})
			3'b100: lg <= ir[7:9];
			3'b010: lg <= {(ir[8] & ir[9]), 2'b01};
			3'b001: lg <= {gr, 2'b11} & (lg + 1'b1);
			default: lg <= lg;
		endcase
	end

	assign lga = lg[2];
	assign lgb = lg[1];
	assign lgc = lg[0];
	assign lg_3 = lg[1:2] == 3;
	assign lg_2 = lg[1:2] == 2;
	assign lg_1 = lg[1:2] == 1;
	assign lg_0 = lg[1:2] == 0;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
