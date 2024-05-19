// This program was cloned from: https://github.com/emu-russia/breaks
// License: Creative Commons Zero v1.0 Universal


module PPU_CompositeDAC (RawIn, CompositeOut);

	input [10:0] RawIn;
	output [31:0] CompositeOut;

	assign CompositeOut = 32'b0;

endmodule // PPU_CompositeDAC
