// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341449297858921043(
	input [7:0] io_in, 
	output [7:0] io_out
);

	wire [10:0] result;
	assign io_out = result[7:0];

  	anfsqrt_sqrt_341449297858921043 sqrt_core(
		.clk(io_in[0]),
		.query({io_in[7:1], 4'b0}),
		.result(result)
  	);

endmodule

//  Any submodules should be included in this file,
//  so they are copied into the main TinyTapeout repo.
//  Appending your ID to any submodules you create 
//  ensures there are no clashes in full-chip simulation.


// SQRT Iteration Unit
// Copyright (C) 2022 Davit Margarian

module anfsqrt_sqrtiu_341449297858921043 (
	input [10:0] prev_att,
	input [10:0] prev_eps,
	input [10:0] prev_res,

	output [10:0] this_att,
	output [10:0] this_eps,
	output [10:0] this_res
);

	assign this_att = {1'b0, prev_att[10:1]};

	wire [10:0] this_delta_term1_half;
	wire [10:0] this_delta;
	reg [3:0] this_att_msb;
	wire [4:0] this_att_sq_exp;
	wire [10:0] this_att_sq;

	assign this_att_sq_exp = {this_att_msb, 1'b0};
	assign this_att_sq = 11'b1 << this_att_sq_exp;

	assign this_delta_term1_half = prev_res << this_att_msb;
	assign this_delta = {this_delta_term1_half[9:0], 1'b0} + this_att_sq;

	wire cond_met;
	assign cond_met = this_delta <= prev_eps;
	assign this_eps = cond_met ? prev_eps - this_delta : prev_eps; 
	assign this_res = cond_met ? prev_res | this_att : prev_res; 

	integer msb_idx;
	always @* begin
		this_att_msb = 0;

		for (msb_idx=0; msb_idx < 11; msb_idx++) begin
			if(this_att == (1 << msb_idx))
				this_att_msb = msb_idx[3:0];
		end

	end

endmodule

// SQRT Control Logic
// Copyright (C) 2022 Davit Margarian

module anfsqrt_sqrt_341449297858921043(
	input clk,
	input [10:0] query,
	output reg [10:0] result
);

	reg [10:0] att;
	reg [10:0] eps;
	reg [10:0] res;

	wire [10:0] att_mid;
	wire [10:0] res_mid;
	wire [10:0] eps_mid;

	wire [10:0] att_next;
	wire [10:0] res_next;
	wire [10:0] eps_next;

	anfsqrt_sqrtiu_341449297858921043 iteratorA(
						.prev_att(att),
						.prev_eps(eps), 
						.prev_res(res),
						.this_att(att_mid),
						.this_eps(eps_mid),
						.this_res(res_mid)
						);

	anfsqrt_sqrtiu_341449297858921043 iteratorB(
						.prev_att(att_mid),
						.prev_eps(eps_mid), 
						.prev_res(res_mid),
						.this_att(att_next),
						.this_eps(eps_next),
						.this_res(res_next)
						);

	reg [1:0] iteration;
	
	always @(posedge clk) begin
		if (iteration != 3) begin
				att <= att_next;
				eps <= eps_next;
				res <= res_next;
				iteration <= iteration + 1;
			end else begin
				result <= res;
				eps <= query;
				att <= 1 << 6;
				res <= 0;
				iteration <= 0;
			end
	end

endmodule