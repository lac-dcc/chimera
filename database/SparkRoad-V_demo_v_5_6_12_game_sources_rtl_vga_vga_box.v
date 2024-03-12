`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: vga_box
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

module vga_box
#(
	parameter X = 640,
	parameter Y = 480
)
(
	input	wire		clk,
	
	// vga输入时序
	input	wire		hs_i,
	input	wire		vs_i,
	input	wire		axis_en,
	input	wire [10:0]	axis_x,
	input	wire [10:0] axis_y,
	
	// vga输出测试框
	output	reg			hs_o,
	output	reg			vs_o,
	output	reg [15:0]	rgb_o
);

// vga边界像素测试
always@(posedge clk)
begin
	if(axis_en)
	begin
		if(axis_x == 0)
			rgb_o <= {5'b11111,6'b000000,5'b00000}; // 红色
		else if(axis_x == X - 1)
			rgb_o <= {5'b00000,6'b000000,5'b11111}; // 蓝色
		else if(axis_y == 0)
			rgb_o <= {5'b00000,6'b111111,5'b00000}; // 绿色
		else if(axis_y == Y - 1)
			rgb_o <= {5'b11111,6'b111111,5'b11111}; // 白色
		else
			rgb_o <= {5'b00000,6'b00000,5'b00000}; // 黑色
	end
	else
		rgb_o <= {5'b00000,6'b00000,5'b00000}; // 无数据
end

always@(posedge clk)
begin
	hs_o <= hs_i;
	vs_o <= vs_i;
end

endmodule
