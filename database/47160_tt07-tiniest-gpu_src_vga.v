// This program was cloned from: https://github.com/pongsagon/tt07-tiniest-gpu
// License: Apache License 2.0

//`timescale 1ns / 1ps
//`default_nettype wire

// 640x480 @60Hz
module vga(
	input clk, 		
	input reset,
	output HS, VS,
	output [9:0] x,
	output [9:0] y,
	output blank
	);
	
	// Counter Registers, two each for buffering to avoid glitches
	reg [9:0] xc, yc, xc_next, yc_next;
	reg [1:0] prescaler;
	reg HS_reg;
	reg VS_reg;
	wire HS_next, VS_next;
	
	// Horizontal 640 + fp 16 + HS 96 + bp 48 = 800 pixel clocks
	// Vertical, 480 + fp 10 lines + VS 2 lines + bp 33 lines = 525 lines
	assign blank = ((xc > 639) | (yc > 479));
	assign HS_next = ~ (xc > (655) && xc < (752));
	assign VS_next = ~ ((yc > 489) & (yc < 492));
	
	assign x = xc;
	assign y = yc;
	assign HS = HS_reg;
	assign VS = VS_reg;
	//assign newframe = ((xc == 0) && (yc == 1) && (prescaler == 0));
	//assign endframe = ((xc == 0) && (yc == 480) && (prescaler == 0));
	
	always @(posedge clk) begin
		if (reset) begin
			xc <= 0;
			yc <= 0;
			xc_next <= 0;
			yc_next <= 0;
			prescaler <= 0;
			HS_reg <= 0;
			VS_reg <= 0;
		end
		else begin
			prescaler <= prescaler + 1;
			if (prescaler == 1) begin		// do every 25Mhz, 
				prescaler <= 0;	
				if (xc == 799) begin
					xc_next <= 0;
					yc_next <= yc + 1;
				end else begin
					xc_next <= xc + 1;
				end
				if (yc == 524) begin
					yc_next <= 0;
				end
			end
			xc <= xc_next;
			yc <= yc_next;
			HS_reg <= HS_next;
			VS_reg <= VS_next;
		end
	end
	
endmodule


