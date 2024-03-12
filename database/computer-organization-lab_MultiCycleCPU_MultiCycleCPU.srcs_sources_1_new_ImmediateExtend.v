`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 19:21:36
// Design Name: 
// Module Name: ImmediateExtend
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


module ImmediateExtend(
    input [15:0] original,
    input ExtSel,    // 0: Zero-extend; 1: Sign-extend.
    output reg [31:0] extended
    );
    
    always @(*) begin
        extended[15:0] <= original;    // ??16¦Ë???????
        if(ExtSel == 0) begin    // Zero-extend ?????
            extended[31:16] <= 0;
        end
        else begin    // Sign-extended ???????
            if(original[15] == 0) extended[31:16] <= 0;
            else extended[31:16] <= 16'hFFFF;
        end
    end
    
endmodule
