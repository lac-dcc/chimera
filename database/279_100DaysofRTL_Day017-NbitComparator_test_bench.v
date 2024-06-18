// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
	reg [7:0]a;
	reg [7:0]b;
	wire Lesser,Greater,Equal;

	N_bit_comparator dut(a,b,Lesser,Greater,Equal);
		
		always begin
			a=111;
			b=250;
			#10;
			a=147;
			b=103;
			#10;
			a=199;
			b=220;
			#10;
			a=137;
			b=171;
			#10;
			a=255;
			b=255;
			#10;
			a=169;
			b=169;
			#10;
			a=85;
			b=25;
			#10;
			a=21;
			b=50;
			#10;
			a=79;
			b=74;
			#10;
			a=96;
			b=96;
			#10;
		end
		initial
        begin $monitor("a= %0d  b= %0d  then Lesser= %0d  Greater= %0d  Equal= %0d ",a, b,Lesser,Greater,Equal );
        #100 $finish;
    end
endmodule
