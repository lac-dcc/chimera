`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
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

module rom
#(
  parameter Len = 32768 // rom深度  
)
(
    input   wire		clk,
    
    // write
    input   wire		rom_wen,
    input   wire [23:0]	rom_waddr,
    input   wire [7:0]	rom_wdata,
    
    // read
    input   wire		rom_ren,
    input   wire [23:0]	rom_raddr,
    output  reg	 [7:0]	rom_rdata
);

reg [7:0] rom_reg [0:Len-1];

// 加载rom程序
initial
begin
    $readmemh("./sources/rtl/mcu/rom.o",rom_reg);
end

// 写入数据到rom
always@(posedge clk)
begin
    if(rom_wen)
        rom_reg[rom_waddr] <= rom_wdata;
end

// 读取rom数据
always@(posedge clk)
begin
    if(rom_ren)
        rom_rdata <= rom_reg[rom_raddr];
end

endmodule
