`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2020 11:05:28 PM
// Design Name: 
// Module Name: ram
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


module ram(
    input wire [7:0] d_in, // Data In 
    output reg [7:0] addr , // Address
    input wire oe , // Output Enable
    input wire clk,
    input wire we,
    input wire re,
    output reg [7:0] d_out // Data out
    );
    
reg [7:0] mem [255:0];
reg [7:0] addr_tem;

always @(posedge clk)
begin
    if(we)
        begin
            mem[addr] <= d_in;
            addr = addr + 1;
        end
    if(oe && addr != 0)
        begin
            d_out = mem[addr-1];
            mem[addr] <= 0;
            addr = addr - 1;
        end
    
    if(re)
        begin
            addr = 0;
            mem[addr] <= 0;
        end
    end
endmodule

