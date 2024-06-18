// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench #(parameter N= 8);
    reg  [N-1:0] in1;
	reg  [N-1:0] in2;
	wire [N-1:0] HCF;

	HCF dut(in1, in2, HCF);

	initial begin
		in1 = 27; in2 = 45; #10;
		in1 = 56; in2 = 84; #10;
		in1 = 49; in2 = 77; #10;
		in1 = 108; in2 = 24; #10;
		in1 = 17; in2 = 103; #10;
		in1 = 100; in2 = 70; #10;
		$finish;
	end
	
	initial
	$monitor("\t 1st INPUT: %d   2nd INPUT: %d  Highest Common Factor: %d",in1,in2,HCF);
endmodule
