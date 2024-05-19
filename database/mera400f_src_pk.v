// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// P-K unit (control panel, heavily modified for the FPGA implementation)

`define FN_START	4'd0
`define FN_MODE		4'd1
`define FN_CLOCK	4'd2
`define FN_STOPN	4'd3
`define FN_STEP		4'd4
`define FN_FETCH	4'd5
`define FN_STORE	4'd6
`define FN_CYCLE	4'd7
`define FN_LOAD		4'd8
`define FN_BIN		4'd9
`define FN_OPRQ		4'd10
`define FN_CLEAR	4'd11

module pk(
	input clk_sys,
	input hlt_n,
	input off,
	output work,
	output stop,
	output start,
	output mode,
	output stop_n,
	input p0,
	output [0:15] kl,
	output dcl,
	output step,
	output fetch,
	output store,
	output cycle,
	output load,
	output bin,
	output oprq,
	output reg zegar,
	input p,
	input mc_0,
	input alarm,
	input _wait,
	input irq,
	input q,
	input run,
	output wre,
	output rsa,
	output rsb,
	output rsc,
	output wic,
	output wac,
	output war,
	output wir,
	output wrs,
	output wrz,
	output wkb,

	// to IOBUS
	output [0:3] rotary_pos,
	output [0:9] indicators,

	// from IOBUS
	input [0:3] rotary_in,
	input rotary_trig,
	input [0:15] keys,
	input keys_trig,
	input [0:3] fn,
	input fn_v,
	input fn_trig
);

	parameter CLK_SYS_HZ;
	parameter TIMER_CYCLE_MS;

	// --- Input from IOBUS

	reg [11:0] fnkey;

	always @ (posedge clk_sys) begin
		// reset all monostable switches
		fnkey[`FN_STOPN] <= 1'b0;
		fnkey[`FN_STEP] <= 1'b0;
		fnkey[`FN_FETCH] <= 1'b0;
		fnkey[`FN_STORE] <= 1'b0;
		fnkey[`FN_CYCLE] <= 1'b0;
		fnkey[`FN_LOAD] <= 1'b0;
		fnkey[`FN_BIN] <= 1'b0;
		fnkey[`FN_OPRQ] <= 1'b0;
		fnkey[`FN_CLEAR] <= 1'b0;
		if (keys_trig) kl <= keys;
		if (rotary_trig) rotary_pos <= rotary_in;
		if (fn_trig) begin
			fnkey[fn] <= fn_v;
		end
	end

	// --- To IOBUS

	assign indicators = {mode, stop_n, zeg, q, p, ~mc_0, irq, run, _wait, alarm};

	// --- Rotary switch position decoder

	rot_dec ROT_DEC(
		.in(rotary_pos),
		.out({wre, rsc, rsb, rsa, wic, wac, war, wir, wrs, wrz, wkb})
	);

	// --- Virtual switches assignments

	reg owork;
	always @ (posedge clk_sys) begin
		owork <= fnkey[`FN_START];
	end

	assign work = fnkey[`FN_START];
	assign start = ~owork & work;
	assign stop = owork & ~work;
	assign mode = fnkey[`FN_MODE];

	reg ostop_n;
	always @ (posedge clk_sys, posedge hlt_n) begin
		if (hlt_n) stop_n <= 1'b0;
		else begin
			ostop_n <= fnkey[`FN_STOPN];
			if (~ostop_n & fnkey[`FN_STOPN]) stop_n <= ~stop_n;
		end
	end

	assign dcl = fnkey[`FN_CLEAR];
	assign step = fnkey[`FN_STEP];
	assign fetch = fnkey[`FN_FETCH] & p0;
	assign store = fnkey[`FN_STORE] & p0;
	assign cycle = fnkey[`FN_CYCLE] & p0;
	assign load = fnkey[`FN_LOAD] & p0;
	assign bin = fnkey[`FN_BIN] & p0;
	assign oprq = fnkey[`FN_OPRQ];

	// --- Timer

	wire zeg = fnkey[`FN_CLOCK];

	timer #(
		.TIMER_CYCLE_MS(TIMER_CYCLE_MS),
		.CLK_SYS_HZ(CLK_SYS_HZ)
	) TIMER(
		.clk_sys(clk_sys),
		.enable(zeg),
		.zegar(zegar)
	);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
