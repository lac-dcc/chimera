// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

`timescale 1 ns / 1 ps

// simplified CC_PLL model
module CC_PLL #(
	parameter REF_CLK = "", // e.g. "10.0"
	parameter OUT_CLK = "", // e.g. "50.0"
	parameter PERF_MD = "", // LOWPOWER, ECONOMY, SPEED
	parameter LOW_JITTER = 1,
	parameter CI_FILTER_CONST = 2,
	parameter CP_FILTER_CONST = 4
)(
	input  CLK_REF, CLK_FEEDBACK, USR_CLK_REF,
	input  USR_LOCKED_STDY_RST, USR_SET_SEL,
	output USR_PLL_LOCKED_STDY, USR_PLL_LOCKED,
	output CLK270, CLK180, CLK90, CLK0, CLK_REF_OUT
);

	reg r_user_pll_locked_stdy;
	reg r_user_pll_locked;
	reg r_clk270;
	reg r_clk180;
	reg r_clk90;
	reg r_clk0;
	reg r_clk_ref_out;

	assign USR_PLL_LOCKED_STDY = r_user_pll_locked_stdy;
	assign USR_PLL_LOCKED      = r_user_pll_locked;
	assign CLK270              = r_clk270;
	assign CLK180              = r_clk180;
	assign CLK90               = r_clk90;
	assign CLK0                = r_clk0;
	assign CLK_REF_OUT         = CLK_REF | USR_CLK_REF;

	integer clkcnt = 0;
	initial begin
		r_user_pll_locked_stdy = 1'b0;
		r_user_pll_locked = 1'b0;
		r_clk270 = 1'b0;
		r_clk180 = 1'b0;
		r_clk90 = 1'b0;
		r_clk0 = 1'b0;
	end

	always @(CLK_REF or USR_CLK_REF)
	begin
		if ((clkcnt > 1) && (clkcnt % 2 == 0)) begin
			r_clk0 = ~r_clk0;
		end
		if ((clkcnt > 2) && ((clkcnt-1) % 2 == 0)) begin
			r_clk90 = ~r_clk90;
		end
		if ((clkcnt > 3) && ((clkcnt-2) % 2 == 0)) begin
			r_clk180 = ~r_clk180;
		end
		if ((clkcnt > 4) && ((clkcnt-3) % 2 == 0)) begin
			r_clk270 = ~r_clk270;
		end
		clkcnt = clkcnt + 1;
	end
endmodule

module tb;

	reg clk;
	reg rst;
	wire led;

	initial begin
`ifdef CCSDF
		$sdf_annotate("blink_00.sdf", dut);
`endif
		$dumpfile("sim/blink_tb.vcd");
		$dumpvars(0, tb);
		clk = 0;
		rst = 0;
	end

	always clk = #1 ~clk;

	blink dut (
		.clk(clk),
		.rst(rst),
		.led(led)
	);

	initial begin
		#200;
		rst = 1;
		#500;
		$finish;
	end

endmodule
