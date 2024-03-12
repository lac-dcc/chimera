`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: vram
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

module vram
(
	input	wire		clk,
	
	// 显存控制
	input	wire		vram_wen,
	input	wire		vram_wdata,
	input	wire		vram_ren,
	output	reg			vram_rdata,
	input	wire [7:0]	vram_addr,
	
	// vga输入(640 * 480)
	input	wire		hs_i,
	input	wire		vs_i,
	input	wire		axis_en,
	input	wire [10:0]	axis_x,
	input	wire [10:0] axis_y,
	
	// vga输出(640 * 480)
	output	reg			hs_o,
	output	reg			vs_o,
	output	reg [23:0]	rgb_o
);

reg state;
reg [4:0] mesh_x;
reg [4:0] mesh_y;
reg [7:0] mesh_addr;
reg vga_ram[0 : 18 * 13 - 1];

reg hs_i_d0;
reg vs_i_d0;
reg hs_i_d1;
reg vs_i_d1;
reg hs_i_d2;
reg vs_i_d2;
reg axis_en_d0;
reg [10:0] axis_x_d0;
reg [10:0] axis_y_d0;
reg axis_en_d1;
reg [10:0] axis_x_d1;
reg [10:0] axis_y_d1;
reg axis_en_d2;
reg [10:0] axis_x_d2;
reg [10:0] axis_y_d2;

// CPU显存控制
always@(posedge clk)
begin
	if(vram_wen)
		vga_ram[vram_addr] <= vram_wdata;
	if(vram_ren)
		vram_rdata <= vga_ram[vram_addr];
end

// 当前网格坐标(axis/32).
always@(posedge clk)
begin
	mesh_x <= axis_x[9:5] - 1;
	mesh_y <= axis_y[9:5] - 1;
end

// 显存地址
always@(posedge clk)
begin
	mesh_addr <=  mesh_y * 18 + mesh_x;
end

// 当前格子显示状态
always@(posedge clk)
begin
	state <= vga_ram[mesh_addr];
end

// 数据延时对齐
always@(posedge clk)
begin
	axis_en_d0 <= axis_en;
	axis_x_d0 <= axis_x;
	axis_y_d0 <= axis_y;
	
	axis_en_d1 <= axis_en_d0;
	axis_x_d1 <= axis_x_d0;
	axis_y_d1 <= axis_y_d0;
	
	axis_en_d2 <= axis_en_d1;
	axis_x_d2 <= axis_x_d1;
	axis_y_d2 <= axis_y_d1;
end

// 数据延时对齐
always@(posedge clk)
begin
	hs_i_d0 <= hs_i;
	vs_i_d0 <= vs_i;
	
	hs_i_d1 <= hs_i_d0;
	vs_i_d1 <= vs_i_d0;
	
	hs_i_d2 <= hs_i_d1;
	vs_i_d2 <= vs_i_d1;
end

// 图像数据输出
// always@(posedge clk)
always@(negedge clk)
begin
	if(axis_en_d2)
	begin
		if(axis_x_d2 < 32 || axis_x_d2 > (640 - 32) || axis_y_d2 < 32 || axis_y_d2 > (480 - 32)) // 黑色区域
			rgb_o <= 0;
		else if(axis_x_d2 == 32 || axis_x_d2 == (640 - 32) || axis_y_d2 == 32 || axis_y_d2 == (480 - 32)) // 边框线
			rgb_o <= {8'd240, 8'd240, 8'd120};
		else if(axis_y_d2[4:0] == 0 || axis_x_d2[4:0] == 0) // 网格线
			rgb_o <= {8'd80, 8'd40, 8'd80};
		else if(state) // 网格显示
			rgb_o <= {8'd40, 8'd180, 8'd80};
		else
			rgb_o <= 0;
	end
	else
		rgb_o <= 0;
end

// 行场时序输出
// always@(posedge clk)
always@(negedge clk)
begin
	hs_o <= hs_i_d2;
	vs_o <= vs_i_d2;
end

endmodule
