// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

/*
 * spram_16kx32.v - byte-addressable RAM in SPRAM
 * 07-01-19 E. Brombaugh
 */
 
`default_nettype none

module spram_16kx32(
	input clk,
	input sel,
	input [3:0] we,
	input [15:0] addr,
	input [31:0] wdat,
	output [31:0] rdat
);
    // instantiate the big RAMs
	SB_SPRAM256KA mem_lo (
		.ADDRESS(addr[15:2]),
		.DATAIN(wdat[15:0]),
		.MASKWREN({we[1],we[1],we[0],we[0]}),
		.WREN(|we),
		.CHIPSELECT(sel),
		.CLOCK(clk),
		.STANDBY(1'b0),
		.SLEEP(1'b0),
		.POWEROFF(1'b1),
		.DATAOUT(rdat[15:0])
	);
	SB_SPRAM256KA mem_hi (
		.ADDRESS(addr[15:2]),
		.DATAIN(wdat[31:16]),
		.MASKWREN({we[3],we[3],we[2],we[2]}),
		.WREN(|we),
		.CHIPSELECT(sel),
		.CLOCK(clk),
		.STANDBY(1'b0),
		.SLEEP(1'b0),
		.POWEROFF(1'b1),
		.DATAOUT(rdat[31:16])
	);
endmodule
