`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2018 16:40:20
// Design Name: 
// Module Name: TB_CONV2
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


module TB_CONV2;
    reg clk;
    reg reset;
    reg [21:0] G1, G2, G3, G4, G5, G6, G7, G8; 
    wire [6:0] addr2;
    wire signed [35:0] z;

    CONV2 uut( .G1(G1), .G2(G2), .G3(G3), .G4(G4), .G5(G5), .G6(G6), .G7(G7), .G8(G8), .clk(clk), .reset(reset), .addr(addr2),.y(z));    
    
    always #5 clk= ~clk;
    
    initial
    begin
        clk = 0;
        reset = 0;
        G1 = 1;
        G2 = 1;
        G3 = 1;
        G4 = 1;
        G5 = 1;
        G6 = 1;
        G7 = 1;
        G8 = 1;
        
        
    end
endmodule
