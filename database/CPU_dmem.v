`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/26 11:32:58
// Design Name: 
// Module Name: dmem
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


module dmem(
input clk,
input reset,
input CS,
input DM_W,
input DM_R,
input [31:0] addr,
input [31:0] wdata,
output [31:0] rdata
    );
    
reg [31:0] ROM [2047:0];
initial
begin
  $readmemh("D:/Downloads/CPU-master/rom.data",ROM);
end


assign rdata=(CS&DM_R)?ROM[addr[31:2]]:32'h0;

always @(posedge clk)
begin
  if(CS)
  begin
    if(DM_W)
      ROM[addr[31:2]]<=wdata;
  end
end
endmodule
