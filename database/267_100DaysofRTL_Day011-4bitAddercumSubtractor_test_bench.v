// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
    reg [3:0] a;
    reg [3:0] b;
    reg en;
    wire [3:0] sdout;
    wire cbout;
    
    add_sub dut(a, b, en, sdout, cbout);
    initial begin        
        a = 4'b1010;
        b = 4'b0101;
        en = 1'b0;
        #10;        
        $display("a= %b b= %b sum = %b, carry = %b", a, b,sdout, cbout);
        
        en = 1'b1;
        #10;        
        $display("a= %b b= %b difference = %b, borrow = %b", a, b, sdout, cbout);
        
        a = 4'b0100;
        b = 4'b0111;
        en = 1'b0;
        #10;
        $display("a= %b b= %b sum = %b, carry = %b", a, b,sdout, cbout);
        
        en = 1'b1;
        #10;
        $display("a= %b b= %b difference = %b, borrow = %b", a, b, sdout, cbout);

        a = 4'b1001;
        b = 4'b1111;
        en = 1'b0;
        #10; 
        $display("a= %b b= %b sum = %b, carry = %b", a, b,sdout, cbout);
        
        en = 1'b1;;
        #10; 
        $display("a= %b b= %b difference = %b, borrow = %b", a, b, sdout, cbout);
        
        a = 4'b0101;
        b = 4'b1101;
        en = 1'b0;
        #10; 
        $display("a= %b b= %b sum = %b, carry = %b", a, b,sdout, cbout);
        
        en = 1'b1;
        #10; 
        $display("a= %b b= %b difference = %b, borrow = %b", a, b, sdout, cbout);
        
        $finish; 
    end
    
endmodule
