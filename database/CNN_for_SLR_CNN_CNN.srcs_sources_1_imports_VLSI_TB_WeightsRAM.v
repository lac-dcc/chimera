// This program was cloned from: https://github.com/ilaydayaman/CNN_for_SLR
// License: BSD 2-Clause "Simplified" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2018 22:55:29
// Design Name: 
// Module Name: TB_WeightsRAM
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


module TB_WeightsRAM;
    reg clk;
    reg [2:0] addr;
    wire [127:0] weights;
    
    WeightsRAM_R uut( .clk(clk), .addr(addr), .weights(weights));
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        addr = 3'd0;
        #10;
        addr = 3'd1;
        #10;
        addr = 3'd5;
        #10;
        addr = 3'd7;
        #10;
    end
    
    
endmodule
