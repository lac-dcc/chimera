// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg [15:0]number;
wire is_palindrome;

Palindrome dut(number, is_palindrome);

always 
begin
number=16'd18681;
#10;
number=16'd3453;
#10;
number=16'd14441;
#10;
number=16'd51125;
#10;
number=16'd12021;
#10;
number=16'd35153;
#10;
number=16'd8998;
#10;
number=16'd6196;
#10;
end

initial #80 $finish;
endmodule
