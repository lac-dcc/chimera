// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ps/1ps

module tb1();
	reg en, preset;
	reg [7 : 0]l;
	wire co,clk;
	wire [7:0] out;
	ring_osil osi(en,clk);
	lab1 UUT(
	.out6(out[6]),
	.in7(l[7]),
	.in6(l[6]),
	.in5(l[5]),
	.in4(l[4]),
	.in3(l[3]),
	.in2(l[2]),
	.in1(l[1]),
	.in0(l[0]),
	.clk(clk),
	.preset(preset),
	.out7(out[7]),
	.out(co),
	.out0(out[0]),
	.out1(out[1]),
	.out2(out[2]),
	.out3(out[3]),
	.out4(out[4]),
	.out5(out[5]));

	initial begin
		l = 8'b10001111;
		en = 0;
		preset = 0;
		#100;
		en = 1;
		preset = 1;
		#100000;
		$stop;
	end
endmodule
