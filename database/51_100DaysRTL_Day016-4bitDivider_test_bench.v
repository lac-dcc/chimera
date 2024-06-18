// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
    reg [3:0]dividend,divisor;
    wire [3:0]quotient,remainder;

    divide dut(dividend,divisor,quotient,remainder);
		always begin
			
			dividend =$random;
			divisor =$random;
            #10;
		end
    initial
    begin $monitor("%0d / %0d = %0d with remainder %0d ",dividend,divisor,quotient,remainder);
    #100 $finish;
    end
endmodule
