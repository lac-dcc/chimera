// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2020-05-23 by mza
// last updated 2024-05-08 by mza

`ifndef RESET_LIB
`define RESET_LIB

`include "generic.v"
`include "synchronizer.v"

//	reset_wait4pll_synchronized #(.COUNTER_BIT_PICKOFF(CLOCK1_BIT_PICKOFF), .PLL_LOCKED_PIPELINE_PICKOFF(PLL_LOCKED_PIPELINE_CLOCK1_PICKOFF), .RESET_PIPELINE_PICKOFF(RESET_PIPELINE_PICKOFF)) reset1_wait4pll (.reset1_input(reset1), .reset2_input(reset2), .pll_locked1_input(pll_locked1_input), .clock1_input(clock1_input), .clock2_input(clock2_input), .reset2_output(reset2_output));
module reset_wait4pll_synchronized #(
	parameter COUNTER_BIT_PICKOFF = 20,
	parameter PIPELINE_PICKOFF = 6
) (
	input reset1_input,
	input pll_locked1_input,
	input clock1_input,
	input clock2_input,
	output reg reset2_output = 1
);
	reg [COUNTER_BIT_PICKOFF:0] counter = 0;
	wire should_be_in_reset_pre = ~pll_locked1_input || reset1_input;
	wire should_be_in_reset_post;
	//pipeline #(.WIDTH(1), .DEPTH(PIPELINE_PICKOFF)) z (.clock(clock1_input), .in(should_be_in_reset_pre), .out(should_be_in_reset_post));
	pipeline_synchronizer #(.WIDTH(1), .DEPTH(PIPELINE_PICKOFF)) myps (.clock1(clock1_input), .clock2(clock2_input), .reset1(reset1_input), .reset2(1'b0), .in1(should_be_in_reset_pre), .out2(should_be_in_reset_post));
	always @(posedge clock2_input) begin
		if (should_be_in_reset_post) begin
			counter <= 0;
			reset2_output <= 1;
		end else begin
			if (counter[COUNTER_BIT_PICKOFF]) begin
				reset2_output <= 0;
			end else begin
				counter <= counter + 1'b1;
			end
		end
	end
endmodule

//	reset_wait4pll #(.COUNTER_BIT_PICKOFF(CLOCK1_BIT_PICKOFF), .PLL_LOCKED_PIPELINE_PICKOFF(PLL_LOCKED_PIPELINE_CLOCK1_PICKOFF), .RESET_PIPELINE_PICKOFF(RESET_PIPELINE_PICKOFF)) reset1_wait4pll (.reset_input(reset_input), .pll_locked_input(pll_locked1_input), .clock_input(clock1_input), .reset_output(reset1_output));
module reset_wait4pll #(
	parameter COUNTER_BIT_PICKOFF = 20,
	parameter PIPELINE_PICKOFF = 6
) (
	input reset_input,
	input pll_locked_input,
	input clock_input,
	output reg reset_output = 1
);
	reg [COUNTER_BIT_PICKOFF:0] counter = 0;
	wire should_be_in_reset_pre = ~pll_locked_input || reset_input;
	wire should_be_in_reset_post;
	//pipeline #(.WIDTH(1), .DEPTH(PIPELINE_PICKOFF)) z (.clock(clock_input), .in(should_be_in_reset_pre), .out(should_be_in_reset_post));
	pipeline_synchronizer #(.WIDTH(1), .DEPTH(PIPELINE_PICKOFF)) myps (.clock1(clock_input), .clock2(clock_input), .reset1(reset_input), .reset2(reset_input), .in1(should_be_in_reset_pre), .out2(should_be_in_reset_post));
	always @(posedge clock_input) begin
		if (should_be_in_reset_post) begin
			counter <= 0;
			reset_output <= 1;
		end else begin
			if (counter[COUNTER_BIT_PICKOFF]) begin
				reset_output <= 0;
			end else begin
				counter <= counter + 1'b1;
			end
		end
	end
endmodule

//	reset3_wait4plls #(.CLOCK1_BIT_PICKOFF(20), .CLOCK2_BIT_PICKOFF(20), .CLOCK3_BIT_PICKOFF(20)) r3 (.reset_input(reset), .pll_locked1_input(1'b1), .pll_locked2_input(pll_is_locked),  .pll_locked3_input(pll_is_locked), .clock1_input(clock_in), .clock2_input(word_clock0123_out), .clock3_input(word_clock45_out), .reset1_output(), .reset2_output(reset_clock0123), .reset3_output(reset_clock45));
module reset3_wait4plls #(
	parameter CLOCK1_BIT_PICKOFF = 20,
	parameter CLOCK2_BIT_PICKOFF = 20,
	parameter CLOCK3_BIT_PICKOFF = 20,
	parameter RESET_PIPELINE_PICKOFF = 5,
	parameter PLL_LOCKED_PIPELINE_CLOCK1_PICKOFF = 10,
	parameter PLL_LOCKED_PIPELINE_CLOCK2_PICKOFF = 10,
	parameter PLL_LOCKED_PIPELINE_CLOCK3_PICKOFF = 10
) (
	input reset_input,
	input pll_locked1_input, pll_locked2_input, pll_locked3_input,
	input clock1_input, clock2_input, clock3_input,
	output reset1_output,
	output reset2_output,
	output reset3_output
);
	reset_wait4pll #(.COUNTER_BIT_PICKOFF(CLOCK1_BIT_PICKOFF), .PLL_LOCKED_PIPELINE_PICKOFF(PLL_LOCKED_PIPELINE_CLOCK1_PICKOFF), .RESET_PIPELINE_PICKOFF(RESET_PIPELINE_PICKOFF)) reset1_wait4pll (.reset_input(reset_input), .pll_locked_input(pll_locked1_input), .clock_input(clock1_input), .reset_output(reset1_output));
	reset_wait4pll #(.COUNTER_BIT_PICKOFF(CLOCK2_BIT_PICKOFF), .PLL_LOCKED_PIPELINE_PICKOFF(PLL_LOCKED_PIPELINE_CLOCK2_PICKOFF), .RESET_PIPELINE_PICKOFF(RESET_PIPELINE_PICKOFF)) reset2_wait4pll (.reset_input(reset_input), .pll_locked_input(pll_locked2_input), .clock_input(clock2_input), .reset_output(reset2_output));
	reset_wait4pll #(.COUNTER_BIT_PICKOFF(CLOCK3_BIT_PICKOFF), .PLL_LOCKED_PIPELINE_PICKOFF(PLL_LOCKED_PIPELINE_CLOCK3_PICKOFF), .RESET_PIPELINE_PICKOFF(RESET_PIPELINE_PICKOFF)) reset3_wait4pll (.reset_input(reset_input), .pll_locked_input(pll_locked3_input), .clock_input(clock3_input), .reset_output(reset3_output));
endmodule

module reset_promulgator #(
	parameter CLOCK1_BIT_PICKOFF = 20,
	parameter CLOCK2_BIT_PICKOFF = 20,
	parameter RESET_PIPELINE_PICKOFF = 5,
	parameter PLL_LOCKED_PIPELINE_CLOCK2_PICKOFF = 2
) (
	input reset_input,
	input clock1, clock2,
	input pll_locked_input,
	output reg reset1 = 1,
	output reg reset2 = 1,
	output reg pll_locked_output = 0
);
	reg [RESET_PIPELINE_PICKOFF:0] reset_pipeline_clock1 = 0;
	reg [RESET_PIPELINE_PICKOFF:0] reset_pipeline_clock2 = 0;
	reg [3:0] reset_counter = 0; // this counts how many times the reset input gets pulsed
	reg [CLOCK1_BIT_PICKOFF:0] counter_clock1 = 0;
	always @(posedge clock1) begin
		if (reset_pipeline_clock1[RESET_PIPELINE_PICKOFF:RESET_PIPELINE_PICKOFF-3]==4'b0011) begin
			reset_counter <= reset_counter + 1'b1; // this counts how many times the reset input gets pulsed
		end else if (reset_pipeline_clock1[RESET_PIPELINE_PICKOFF]) begin
			counter_clock1 <= 0;
			reset1 <= 1;
		end else if (reset1) begin
			if (counter_clock1[CLOCK1_BIT_PICKOFF]) begin
				reset1 <= 0;
			end
			counter_clock1 <= counter_clock1 + 1'b1;
		end
		reset_pipeline_clock1 <= { reset_pipeline_clock1[RESET_PIPELINE_PICKOFF-1:0], reset_input };
	end
	reg [2:0] reset_clock1_pipeline_clock2 = 0;
	reg [PLL_LOCKED_PIPELINE_CLOCK2_PICKOFF:0] pll_locked_pipeline_clock2 = 0;
	integer j;
	always @(posedge clock2) begin
		if (~pll_locked_pipeline_clock2[PLL_LOCKED_PIPELINE_CLOCK2_PICKOFF]) begin
			reset_clock1_pipeline_clock2 <= 0;
			reset_pipeline_clock2 <= 0;
		end else begin
			reset_clock1_pipeline_clock2 <= { reset_clock1_pipeline_clock2[1:0], reset1 };
			reset_pipeline_clock2 <= { reset_pipeline_clock2[RESET_PIPELINE_PICKOFF-1:0], reset_input };
		end
		pll_locked_output <= pll_locked_pipeline_clock2[PLL_LOCKED_PIPELINE_CLOCK2_PICKOFF];
		pll_locked_pipeline_clock2 <= { pll_locked_pipeline_clock2[PLL_LOCKED_PIPELINE_CLOCK2_PICKOFF-1:0], pll_locked_input };
	end
	reg [CLOCK2_BIT_PICKOFF:0] counter_clock2 = 0;
	always @(posedge clock2) begin
		if (reset_pipeline_clock2[RESET_PIPELINE_PICKOFF] || reset_clock1_pipeline_clock2[2] || ~pll_locked_pipeline_clock2[PLL_LOCKED_PIPELINE_CLOCK2_PICKOFF]) begin
			counter_clock2 <= 0;
			reset2 <= 1;
		end else if (reset2) begin
			if (counter_clock2[CLOCK2_BIT_PICKOFF]) begin
				reset2 <= 0;
			end
			counter_clock2 <= counter_clock2 + 1'b1;
		end
	end
endmodule

//	reset #(.FREQUENCY(10000000)) myr (.upstream_clock(), .upstream_reset(), .downstream_pll_locked(), .downstream_reset());
module reset #(
	parameter FREQUENCY_HZ = 10000000, // in Hertz
	parameter PLL_LOCK_TIME_IN_MILLISECONDS = 50, // in milliseconds
	parameter SYNCHRONOUS_ONLY = 1,
	parameter SIGNIFICANT_BIT_NUMBER_B = $clog2(FREQUENCY_HZ*PLL_LOCK_TIME_IN_MILLISECONDS/1000) + 1, // synthesis
//	parameter SIGNIFICANT_BIT_NUMBER_B = 5, // simulation
	parameter SIGNIFICANT_BIT_NUMBER_A = SIGNIFICANT_BIT_NUMBER_B/4
) (
	input upstream_clock,
	input upstream_reset,
	input downstream_pll_locked,
	output downstream_reset
);
	reg [SIGNIFICANT_BIT_NUMBER_A:0] counterA = 0;
	reg [SIGNIFICANT_BIT_NUMBER_B:0] counterB = 0;
	reg internal_reset_state = 1;
	reg sychronous_reset_source = 1;
	if (SYNCHRONOUS_ONLY) begin
		//assign asychronous_reset_source = upstream_reset;
		//assign asychronous_reset_source = 0;
		assign downstream_reset = sychronous_reset_source;
	end else begin
		wire asychronous_reset_source;
		assign asychronous_reset_source = upstream_reset || (counterB[SIGNIFICANT_BIT_NUMBER_B]&&(~downstream_pll_locked));
		assign downstream_reset = asychronous_reset_source || sychronous_reset_source;
	end
	always @(posedge upstream_clock) begin
		if (upstream_reset) begin
			counterA <= 0;
			sychronous_reset_source <= 1;
			counterB <= 0;
			internal_reset_state <= 1;
		end else if (internal_reset_state) begin
			if (counterA[SIGNIFICANT_BIT_NUMBER_A]) begin
				sychronous_reset_source <= 0;
				if (counterB[SIGNIFICANT_BIT_NUMBER_B]) begin
					internal_reset_state <= 0;
				end else begin
					counterB <= counterB + 1'b1;
				end
			end else begin
				counterA <= counterA + 1'b1;
			end
		end else if (~downstream_pll_locked) begin
			counterA <= 0;
			sychronous_reset_source <= 1;
			counterB <= 0;
			internal_reset_state <= 1;
		end
	end
endmodule

module reset_tb();
	reg clock_enabled = 1;
	reg upstream_clock = 0;
	reg upstream_reset = 0;
	reg downstream_pll_locked = 0;
	wire downstream_reset;
	reset #(.FREQUENCY(10000000), .SIGNIFICANT_BIT_NUMBER_B(5)) myr (.upstream_clock(upstream_clock), .upstream_reset(upstream_reset), .downstream_pll_locked(downstream_pll_locked), .downstream_reset(downstream_reset));
	initial begin
		// power-on reset
		#200; downstream_pll_locked <= 1;
		#1000; // ------------------------------------------------------------
		// global reset
		upstream_reset <= 1;
		#20; downstream_pll_locked <= 0;
		#100; upstream_reset <= 0;
		#200; downstream_pll_locked <= 1;
		#1000; // ------------------------------------------------------------
		// pll loses lock
		#100; downstream_pll_locked <= 0;
		#1000; // pretend the pll doesn't lock immediately
		#200; downstream_pll_locked <= 1;
		#1000;
		#1000; // ------------------------------------------------------------
		// losing pll lock after clock disappears
		#100; clock_enabled <= 0;
		#100; downstream_pll_locked <= 0;
		#100;
		#1000; // ------------------------------------------------------------
		$finish;
	end
	always begin
		#10;
		if (clock_enabled) begin
			upstream_clock <= ~upstream_clock;
		end
	end
endmodule

`endif

