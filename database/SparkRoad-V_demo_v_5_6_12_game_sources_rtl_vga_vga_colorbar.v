`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: vga_colorbar
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

module vga_colorbar
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
	
	// vga输出彩条
	output	reg			hs_o,
	output	reg			vs_o,
	output	reg [15:0]	rgb_o
);

// 产生彩色条
always@(posedge clk)
begin
	if(axis_en)
	begin
		if(axis_x < X*1/8)
			rgb_o <= {5'b11111,6'b111111,5'b11111};
		else if(axis_x < X*2/8)
			rgb_o <= {5'b11111,6'b111111,5'b00000};
		else if(axis_x < X*3/8)
			rgb_o <= {5'b11111,6'b000000,5'b11111};
		else if(axis_x < X*4/8)
			rgb_o <= {5'b11111,6'b000000,5'b00000};
		else if(axis_x < X*5/8)
			rgb_o <= {5'b00000,6'b111111,5'b11111};
		else if(axis_x < X*6/8)
			rgb_o <= {5'b00000,6'b111111,5'b00000};
		else if(axis_x < X*7/8)
			rgb_o <= {5'b00000,6'b000000,5'b11111};
		else if(axis_x < X*8/8)
			rgb_o <= {5'b00000,6'b000000,5'b00000};
	end
end

always@(posedge clk)
begin
	hs_o <= hs_i;
	vs_o <= vs_i;
end

endmodule
