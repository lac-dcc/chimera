`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2018 12:26:06
// Design Name: 
// Module Name: ShiftReg
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


module ShiftReg(
    input [7:0] x,
    input clk,
    output reg [7:0] o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16
    );
    
    reg [7:0] Register [0:204];
    integer i;
    
 /* assign o1 = Register[0];
    assign o2 = Register[1];
    assign o3 = Register[2];
    assign o4 = Register[3];
    
    assign o5 = Register[67];
    assign o6 = Register[68];
    assign o7 = Register[69];
    assign o8 = Register[70];
    
    assign o9 = Register[134];
    assign o10 = Register[135];
    assign o11 = Register[136];
    assign o12 = Register[137];
    
    assign o13 = Register[201];
    assign o14 = Register[202];
    assign o15 = Register[203];
    assign o16 = Register[204];*/
    
    
    always@(posedge clk)
    begin
    Register[204] <= x;
    for(i=0; i < 204; i = i + 1)
    begin
        Register[i] <= Register[i+1];
    end
    
    o1 <= Register[0];
    o2 <= Register[1];
    o3 <= Register[2];
    o4 <= Register[3];
    
    o5 <= Register[67];
    o6 <= Register[68];
    o7 <= Register[69];
    o8 <= Register[70];
    
    o9 <= Register[134];
    o10 <= Register[135];
    o11 <= Register[136];
    o12 <= Register[137];
    
    o13 <= Register[201];
    o14 <= Register[202];
    o15 <= Register[203];
    o16 <= Register[204]; 
    end
    
endmodule
