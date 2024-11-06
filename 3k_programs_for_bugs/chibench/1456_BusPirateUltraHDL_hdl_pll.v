// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

`ifndef __PLL__
`define __PLL__
/*F_PLLIN:    72.000 MHz (given)
F_PLLOUT:   16.000 MHz (requested)
F_PLLOUT:   15.975 MHz (achieved)

FEEDBACK: SIMPLE
F_PFD:   14.400 MHz
F_VCO: 1022.400 MHz

DIVR:  4 (4'b0100)
DIVF: 70 (7'b1000110)
DIVQ:  6 (3'b110)

FILTER_RANGE: 1 (3'b001)
*/
module pll(
	input  clock_in,
	output clock_out,
	output locked
	);

SB_PLL40_CORE #(
		.FEEDBACK_PATH("SIMPLE"),
		.DIVR(4'b0100),		// DIVR =  4
		.DIVF(7'b1000110),	// DIVF = 70
		.DIVQ(3'b110),		// DIVQ =  6
		.FILTER_RANGE(3'b010)	// FILTER_RANGE = 2
	) uut (
		.LOCK(locked),
		.RESETB(1'b1),
		.BYPASS(1'b0),
		.REFERENCECLK(clock_in),
		.PLLOUTCORE(clock_out)
		//.PACKAGEPIN(clock_in),
		//.PLLOUTGLOBALA(clock_out_a),
		//.PLLOUTGLOBALB(clock_out_b),
		//.PLLOUTCOREA(clock_out_a)
		//.PLLOUTCOREB(clock_out_b)
		);

endmodule
`endif
