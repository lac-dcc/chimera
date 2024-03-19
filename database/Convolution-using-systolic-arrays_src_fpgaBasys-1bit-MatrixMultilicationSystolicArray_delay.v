`timescale 1ns / 1ps


module De(a,b,o1,o2,clk);
    input clk;
    input a,b;
    output reg o1,o2;
    initial begin
        o1=a;
        o2=b;
    end
//    assign o1=a;
//    assign o2=b;
    always@(posedge clk)
        begin
        o1 = a;
        o2 = b;
        end
endmodule