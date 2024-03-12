`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2018 09:44:48 PM
// Design Name: 
// Module Name: relu
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

module relu(
    din, dout
    );
    input [`DATA_SIZE-1:0] din;
    output [`DATA_SIZE-1:0] dout;
    
    assign dout = (din[`DATA_SIZE-1] == 1'b1) ? 8'b0 : din;
endmodule
