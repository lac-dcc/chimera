// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

// expo_calc.v - exponential computation for 1V/Oct
// 03-19-21 E. Brombaugh

`default_nettype none
`include "../src/expo.vinc"

module expo_calc(
    input clk,              // 16MHz CPU clock
    input reset,            // Low-true reset
    input [1:0] range,		// range select
	input [11:0] in,		// 1V/Oct input
	input in_v,				// input valid flag
	output reg [31:0] out	// frequency output
);
	reg [3:0] inpipe;
	reg [27:0] inscl;
	reg [34:0] pout;
	wire [7:0] addr = inscl[23:16];
	wire [3:0] shf = inscl[27:24];
			
	reg [15:0] LUT[255:0], LUT_reg;
	initial
		$readmemh("../src/expo.hex",LUT);

	always @(posedge clk)
		if(reset)
		begin
			inpipe <= 4'd0;
			inscl <= 28'd0;
			pout <= 32'd0;
			out <= 32'd0;
		end
		else
		begin
			// pipeline the valid signal
			inpipe <= {inpipe[2:0],in_v};
			
			// scale the input
			if(in_v)
				inscl <= in * `ADC_cal;
			
			// lookup table
			if(inpipe[1])
				LUT_reg <= LUT[addr];
			
			// octave shifter
			if(inpipe[2])
				pout <= LUT_reg << shf;
			
			// range shifter
			if(inpipe[3])
				case(range)
					2'b00: out <= pout >>> 3;
					2'b01: out <= pout >>> 9;
					2'b10: out <= pout >>> 16;
					default out <= pout >>> 3;
				endcase
		end
endmodule

