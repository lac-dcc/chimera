`timescale 1ns / 1ps


module De(a,b,o1,o2,clk);
    parameter n=5;
    input clk;
    input [n-1:0]a,b;
    output reg [n-1:0]o1,o2;
    always@(posedge clk)
        begin
            o1 = a;
            o2 = b;
        end
endmodule