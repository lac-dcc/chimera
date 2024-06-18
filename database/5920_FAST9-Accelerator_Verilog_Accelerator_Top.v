// This program was cloned from: https://github.com/ISKU/FAST9-Accelerator
// License: MIT License

module Accelerator_Top (clock, nReset, position, isMatching);
	input clock;
	input nReset;
	output [239:0] position;
	output isMatching;
	
	wire [14:0] outAddr;
	wire [7:0] outPixel;

	FAST9_Top fast9(
		.clock(clock),
		.nReset(nReset),
		.refAddr(outAddr),
		.outPixel(outPixel)
	);
	
	Mat_Top matching(
		.clock(clock),
		.nReset(nReset),
		.refAddr(outAddr),
		.isFeature(outPixel),
		.position(position),
		.isMatching(isMatching)
	);
endmodule 