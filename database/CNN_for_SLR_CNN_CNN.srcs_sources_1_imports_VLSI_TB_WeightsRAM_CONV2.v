`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2018 14:06:00
// Design Name: 
// Module Name: TB_WeightsRAM_CONV2
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


module TB_WeightsRAM_CONV2;
    reg clk;
    reg enable;
    reg [3:0] addr;
    wire [35:0] weights;
    
    WeightsRAM_1 weightram1(.clk(clk), .enable(enable), .addr(addr), .weights(weights));
    
    always #5 clk = ~clk;
    
    initial begin
        clk=0;
        enable=0;
        addr=0;
        #3;
        enable = 1;
        #10;
        addr=1;
        #10;
        addr=2;
        #10;
        addr=5;
        #10;
        addr=15;
    end
endmodule
