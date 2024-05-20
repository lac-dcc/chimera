// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License



//DesignProject_tb.v

`timescale 1ns/10ps

module DesignProject_tb;
	reg Clock, reset, stop;
	wire[31:0] InPortout, OutPortEnable, BusMuxOut;
	wire [4:0] ctrl;

datapath DUT(
	.Clock(Clock),
	.Reset(reset),
	.Stop(stop)
	
);

initial
	begin
		Clock = 0;
		reset = 0;
end

always
		#10 Clock <= ~Clock;

endmodule

