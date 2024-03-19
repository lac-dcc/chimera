`timescale 1ns / 1ps


module fullAdder(sum,a,b,cin);
    
    parameter n = 3;
    input [n-1:0]a,b;
    input cin;
    output reg [n:0]sum;
    always@(a,b)
        begin
         sum = a+b+cin;
        end
endmodule
