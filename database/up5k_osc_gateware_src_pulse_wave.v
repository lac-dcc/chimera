// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

// pulse_wave.v - pulse wave shaper
// 03-23-21 E. Brombaugh

`default_nettype none

// variable pulsewidth
module pulse_wave(
    input clk,              	// system clock
	input ena,					// system clock enable
	input [31:0] phs,			// phase input
	input [11:0] width,			// width input
	output signed [15:0] out,	// wave output
	output valid
);
	// compare threshold
	reg signed [15:0] out;
	reg valid;
	always @(posedge clk)
	begin
		valid <= ena;
		if(ena)
			out <= (phs[31:20] > width) ? 16'h7fff : 16'h8001;
	end
endmodule
