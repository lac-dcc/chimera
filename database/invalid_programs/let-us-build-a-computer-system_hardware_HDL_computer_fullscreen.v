// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`include "vgadisplay.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:12:41 09/21/2023 
// Design Name: 
// Module Name:    fullscreen 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fullscreen(
    input clock,
	 input reset,
    output hsync,
    output vsync,
    output [4:0] r,
    output [5:0] g,
    output [4:0] b
    );
	
	wire [23:0] addr;
	
	reg [15:0] rgb;
	reg vga_clk;
	
	always @(posedge clock) begin
		if (addr < 102400) begin // 160*640l
			rgb <= 16'b1111100000000000;
		end else if (addr < 204800) begin // 320*640
			rgb <= 16'b0000011111100000;
		end else begin
			rgb <= 16'b0000000000011111;
		end
		
		if (reset == 0) begin
			vga_clk <= 0;
		end else begin
			vga_clk <= ~vga_clk;
		end
	end
	
	vgadisplay vga_ctrl(.clock(vga_clk), .color(rgb), .hsync(hsync), .vsync(vsync), .red(r), .green(g), .blue(b), .addr(addr));
endmodule
