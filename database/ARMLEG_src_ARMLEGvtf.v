// This program was cloned from: https://github.com/ronitrex/ARMLEG
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "ARMLEG.v"
`include "Clock.v"

module ARMLEGvtf;
	wire CLOCK;
	reg RESET;

	Clock clock(CLOCK);

	ARMLEG ARMLEGv8(CLOCK, RESET);

	always @ ( RESET ) begin
		#0.01;
		RESET = ~RESET;
	end

	initial
	begin
		$dumpfile("ARMLEGvtf.vcd");
		$dumpvars(0,ARMLEGvtf);
		#2.5;
		RESET = 1;
	end
endmodule