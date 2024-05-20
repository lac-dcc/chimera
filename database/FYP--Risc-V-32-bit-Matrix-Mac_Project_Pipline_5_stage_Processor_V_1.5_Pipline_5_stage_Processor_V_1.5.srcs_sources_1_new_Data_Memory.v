// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 05:14:26 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input  rst,
    input [31:0] A,//address in memory
    input [31:0] WD,//data to store in memory or read it from memory
    input clk,WE,//write enable
    
    output [31:0] RD//read the address A data onto RD, read wxisting data basically
    );
    
    reg [31:0] Data_Memory_Registers [512:0];

    always @(posedge clk)
    begin
        if (WE)
            begin
                Data_Memory_Registers[A] <= WD;
            end
    
    end

    //read
    //assign RD = ( WE == 1'b0 ) ? Data_Memory_Registers[A] : 32'h00000000;//read data at address A if we is low
    assign RD = (~rst) ? 32'd0 : Data_Memory_Registers[A];

    initial begin
        //test-1
    //    Data_Memory_Registers[28] = 32'h00000020;
        //test-2
    //    Data_Memory_Registers[40] = 32'h00000002;

    end
    




endmodule














