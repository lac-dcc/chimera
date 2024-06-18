// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Cycle end / cycle start

module kcpc(
	input clk_sys,
	input kc_reset,
	input ekc,
	input ekc_fp,
	input ldstate,
	input rescyc,
	input dpr,
	output pr,
	input clm,
	input dprzerw,
	output przerw,
	output kc,
	output pc
);

	localparam ST_IDLE	= 2'd0;
	localparam ST_KC		= 2'd1;
	localparam ST_PC		= 2'd2;

	assign kc = (state == ST_KC);
	assign pc = (state == ST_PC);
	wire idle = (state == ST_IDLE);

	wire kc_trig = (ldstate & ekc) | ekc_fp;

	// KC, PC

	reg [1:0] state = ST_IDLE;
	always @ (posedge clk_sys) begin
		if (kc_reset) state <= ST_IDLE;
		else case (state)
			ST_IDLE: if (kc_trig) state <= ST_KC;
			ST_KC: state <= ST_PC;
			ST_PC: state <= ST_IDLE;
		endcase
	end

	// PR, PRZERW

	always @ (posedge clk_sys) begin
		if (rescyc) pr <= 1'b0;
		else if (idle & kc_trig) pr <= dpr;
		if (clm) przerw <= 1'b0;
		else if (idle & kc_trig) przerw <= dprzerw;
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
