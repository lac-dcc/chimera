`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2017 07:55:17 AM
// Design Name: 
// Module Name: relu_1
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

`define DATA_SIZE 8

module relu_1(
    din, dout
    );
    input [`DATA_SIZE-1:0] din;
    output [`DATA_SIZE-1:0] dout;
    
    assign dout = (din[`DATA_SIZE-1] == 1'b1) ? 8'b0 : din;
endmodule
