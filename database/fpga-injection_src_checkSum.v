// This program was cloned from: https://github.com/JosephBerman/fpga-injection
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2024 12:30:50 AM
// Design Name: 
// Module Name: checkSum
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


module CheckSum(
    input [23:0] shift_reg,
    input [7:0] inject_data,
    output reg [7:0]checksum
    );
    
    always @* begin
        checksum = 8'b0;
    
        checksum = checksum ^ shift_reg[7:0];
        checksum = checksum ^ shift_reg[15:8];
        checksum = checksum ^ shift_reg[23:16];
    
        checksum = checksum ^ inject_data;
    end
    
endmodule
