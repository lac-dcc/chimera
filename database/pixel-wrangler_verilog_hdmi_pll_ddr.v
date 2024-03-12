/**
 * PLL configuration
 *
 * This Verilog module was generated automatically
 * using the icepll tool from the IceStorm project.
 * Use at your own risk.
 *
 * Given input frequency:        25.000 MHz
 * Requested output frequency:  125.000 MHz
 * Achieved output frequency:   125.000 MHz
 */

// things to try for later
//.FEEDBACK_PATH("PHASE_AND_DELAY"),
//.DIVF(7'h4),	// DIVF = 4 for non-simple
//.DELAY_ADJUSTMENT_MODE_FEEDBACK("DYNAMIC"),

//.DYNAMICDELAY(delay)
//.DYNAMICDELAY(7'h11)
//input [7:0] delay

// 125 MHz == 8 ns/clock
// 16 * 150ps per delay == 2.4 ns
// maximum phase delay is 1/4 clock
// guessing at a value seems to work well?

module hdmi_pll(
	input  clock_in,
	output clock_out,
	output locked,
	input reset
	);

	// total guess that seems to work well
	parameter DELAY = 4'd8;

SB_PLL40_CORE #(
		.FEEDBACK_PATH("SIMPLE"),
		.DIVR(4'b0000),		// DIVR =  0
		.DIVF(7'd39),	// DIVF = 4 for non-simple
		.DIVQ(3'b011),		// DIVQ =  3
		.FILTER_RANGE(3'b010),	// FILTER_RANGE = 2
		.FDA_FEEDBACK(DELAY),
		.DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED")
	) uut (
		.LOCK(locked),
		.RESETB(~reset),
		.BYPASS(1'b0),
		.REFERENCECLK(clock_in),
		.PLLOUTGLOBAL(clock_out)
		);

endmodule
