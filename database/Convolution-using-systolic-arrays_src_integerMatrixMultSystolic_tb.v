`timescale 0.1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2018 08:48:42 PM
// Design Name: 
// Module Name: tbi
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tbi();
    wire [4:0]o1,o2,o3,o4,o5,o6,o7,o8,o9;
    reg [4:0]a1,a2,a3,a4,a5,a6,a7,a8,a9;
    reg [4:0]b1,b2,b3,b4,b5,b6,b7,b8,b9;
    reg clk;
    multip m1(a1,a2,a3,a4,a5,a6,a7,a8,a9,b1,b2,b3,b4,b5,b6,b7,b8,b9,clk,o1,o2,o3,o4,o5,o6,o7,o8,o9);
    always
        begin
            #100
            clk=~clk; 
        end
    initial begin
        clk=0;
        #100
        a1=8'b00000100;
        a2=8'b00000100;
        a3=8'b00000100;
        a4=8'b00000100;
        a5=8'b00000100;
        a6=8'b00000100;
        a7=8'b00000100;
        a8=8'b00000100;
        a9=8'b00000100;
        b1=8'b00000001;
        b2=8'b00000001;
        b3=8'b00000001;
        b4=8'b00000001;
        b5=8'b00000001;
        b6=8'b00000001;
        b7=8'b00000001;
        b8=8'b00000001;
        b9=8'b00000001;
    end
endmodule
