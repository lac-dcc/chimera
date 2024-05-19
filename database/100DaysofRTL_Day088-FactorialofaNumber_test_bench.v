// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg [3:0] n;
wire [31:0] result;
integer x;
factorial dut(n, result);

always for(x=0; x<11; x=x+1) #10 n=x;

initial begin 
$monitor("\t\t factorial of %d is %0d", n, result);
#120 $finish;
end
endmodule
