// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire carry;
    
    parallel_adder dut (a,b,cin,sum,carry);
    
    always begin        
        a= $random;
        b= $random;
        cin= $random;
        #10; 
    end
    initial
    begin $monitor("a= %b  b= %b  cin= %b  sum= %b  carry= %b",a, b, cin, sum, carry);
    #60 $finish;
    end
endmodule
