`timescale 1ns / 1ps


module PE(a,b,c,o1,o2,o3,clk);
    input clk;
    input a,b,c; //a,b,c are the floating point numeber
    output reg o1,o2;
    output reg o3;
    reg mul;
    always@(posedge clk)
        begin
            mul=a&b;
            o1=a;
            o2=b;
            o3=mul|c;
        end
    endmodule