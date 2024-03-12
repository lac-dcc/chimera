`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/26 12:27:34
// Design Name: 
// Module Name: top
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


module top(
input clk_in,
input reset,

output clk,
output [31:0]pc,
output [31:0]inst,
output [31:0]addr,
output [31:0]rdata,
output [31:0]wdata,
output IM_R,
output DM_CS,
output DM_R,
output DM_W,
output [31:0]alu_r      
    );
    
    assign clk = clk_in;
    
    cpu sccpu(clk_in,inst,reset,rdata,pc,addr,wdata,IM_R,DM_CS,DM_R,DM_W,alu_r);
                
    imem imemory(pc, IM_R, inst);
                
    dmem scdmem(clk_in,reset,DM_CS,DM_W,DM_R,addr,wdata,rdata);
endmodule
