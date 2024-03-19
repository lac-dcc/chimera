`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2020 06:47:03 PM
// Design Name: 
// Module Name: dFlipflop
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


module DFlipFlop(
    output q,
    input clock,
    input nreset,
    input d
    );
    
    reg q;
    
    always @(posedge clock or posedge nreset)
    begin
        if (nreset == 1)
            q = d;
        else
            q = 0;
    end
endmodule
