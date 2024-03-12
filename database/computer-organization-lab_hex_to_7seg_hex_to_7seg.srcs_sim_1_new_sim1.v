`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/15 17:40:44
// Design Name: 
// Module Name: sim1
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


module sim1;
    reg clock;
    reg reset;
    wire [1:0] count;
    Counter4 uut(
        .clk(clock),
        .reset(reset),
        .count(count)
    );
    
    always #5 clock = ~clock;
    
    initial begin
        clock = 0;
        reset = 0;
        #100;
        reset = 1;
        
        
        #100;
        $stop;
    end
    
endmodule
