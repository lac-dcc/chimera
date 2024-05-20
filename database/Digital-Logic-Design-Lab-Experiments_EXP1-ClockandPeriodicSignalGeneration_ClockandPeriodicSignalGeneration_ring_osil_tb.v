// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ps/1ps
`define delay 1800
module tb();
	wire clk;
	reg en;
	parameter w = `delay*10;
	ring_osil #(3,`delay)UUT(en, clk);
	initial begin
		en = 0;
		#w;
		en = 1;
		#10000000;
		$stop;
	end
endmodule
