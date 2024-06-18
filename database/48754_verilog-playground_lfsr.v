// This program was cloned from: https://github.com/X-Illuminati/verilog-playground
// License: Apache License 2.0

module lfsr #(parameter LFSRSIZE = 8, LFSRINIT = 1)
(
    input  clk,
    input  [LFSRSIZE-1:0] taps,
    output [LFSRSIZE-1:0] out
);

	reg [LFSRSIZE-1:0] lfsr = LFSRINIT;
	reg [LFSRSIZE-1:0] oldtaps = 0;
	reg next;
	reg [$clog2(LFSRSIZE):0] i;

	//use the taps to feedback bits into the LFSR
	always @(posedge clk) begin
		next = 0;
		if (taps != oldtaps) begin
			//reinitialize the LFSR if the taps change
			lfsr = LFSRINIT;
		end else begin
			for (i=0; i<LFSRSIZE; i=i+1) begin
				if (taps[i]) begin
					next = next ^ lfsr[i];
				end else begin
					next = next;
				end
			end
			lfsr = {lfsr[LFSRSIZE-2:0], next};
		end
		oldtaps = taps;
	end

	assign out = lfsr;
endmodule
