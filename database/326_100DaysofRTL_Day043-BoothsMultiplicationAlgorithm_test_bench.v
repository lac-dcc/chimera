// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg signed [3:0] Q,M;
wire signed [7:0] result;

booth_algorithm dut(Q,M,result);

initial begin
Q= 3; M= 7; #10;
Q= 3; M= -7; #10;
Q= -3; M= -7; #10;
Q= 5; M= 6; #10;
Q= 5; M= -6; #10;
Q= -5; M= -6; #10;
end

initial begin
$monitor("%d * %d = %d", Q,M,result);
#60 $finish;
end
endmodule
