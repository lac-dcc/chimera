// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module Clock(
	output reg CLOCK
);

	always @(posedge CLOCK)
	begin
		#0.07
		CLOCK <= ~CLOCK;
	end

	always @(negedge CLOCK)
	begin
		#0.03
		CLOCK <= ~CLOCK;
	end

	initial begin
		CLOCK <= 1;
		#5;
		// Clock terminates after 4ns
		$finish;
	end
endmodule