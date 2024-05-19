// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
    reg a, b;
    wire and_out, or_out, not_out;
         
    gates_mux dut(a, b, and_out, or_out, not_out);
    
initial begin
            a= 1'b0; b= 1'b0;
        #10 a= 1'b0; b= 1'b1;
        #10 a= 1'b1; b= 1'b0;
        #10 a= 1'b1; b= 1'b1;
    end
   
 initial begin
	$monitor("a: %b  b: %b  and: %b  or: %b  not: %b , a, b, and_out, or_out, not_out")
	#40 $finish;
endmodule
