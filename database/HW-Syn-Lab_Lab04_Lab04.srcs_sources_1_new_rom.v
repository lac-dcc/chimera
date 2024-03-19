`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2020 09:36:56 AM
// Design Name: 
// Module Name: rom
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


module rom(
    output reg [7:0] data,
    input wire [7:0] addr,
    input clk
    );
    
parameter width = 8;
parameter bits = 5;

reg [width-1:0] rom [2**bits-1:0];
initial $readmemb("rom.data", rom);

always@(posedge clk)
begin
    data <= rom[addr];
end
endmodule
