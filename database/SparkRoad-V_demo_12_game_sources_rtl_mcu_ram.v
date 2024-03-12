`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
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

module ram
#(
  parameter Len = 256 // ram深度
)
(
    input   wire		clk,
    
    // write
    input   wire		ram_wen,
    input   wire [7:0]	ram_waddr,
    input   wire [7:0]	ram_wdata,
    
    // read
    input   wire		ram_ren,
    input   wire [7:0]	ram_raddr,
    output  reg  [7:0]	ram_rdata
);

reg [7:0] ram_reg [0:Len-1];

// 写入数据到ram
always@(posedge clk)
begin
    if(ram_wen)
        ram_reg[ram_waddr] <= ram_wdata;
end

// 读取ram数据
always@(posedge clk)
begin
    if(ram_ren)
        ram_rdata <= ram_reg[ram_raddr];
end

endmodule
