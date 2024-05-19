// This program was cloned from: https://github.com/emeb/up5k_basic
// License: MIT License

// satu.v: saturate isz to osz for signed to unsigned data
// 2005-06-15 E. Brombaugh
// 2005-09-07 E. Brombaugh - backported FPGA architecture changes

module satsu(in, out);
	parameter isz = 17;				// input data width
	parameter osz = 12;				// output data width
	parameter warn = 1;				// enable runtime warnings
	
	input signed [isz-1:0] in;		// input data to be saturated
	output [osz-1:0] out;	// output data after saturation
	
	// Check low & high saturation conditions
	wire min =  in[isz-1];
	wire max = ~in[isz-1] &  |in[isz-2:osz];
	
	reg [osz-1:0] out;
	
	// select output
	always @(min or max or in)
		case({max,min})
			2'b01:		out = {osz{1'b0}};		// zero
			2'b10:		out = {osz{1'b1}};		// max pos
			default:	out = in[osz-1:0];		// pass thru
		endcase
	
	// runtime warnings
	// synthesis translate_off
		always @(min or max)
		if(warn & (min | max))
			$display("%m: saturation @ time %d (%d <> %d)", $time, in, (1<<(osz-1)));
	// synthesis translate_on
endmodule

