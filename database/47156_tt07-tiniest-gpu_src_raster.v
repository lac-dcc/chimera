// This program was cloned from: https://github.com/pongsagon/tt07-tiniest-gpu
// License: Apache License 2.0

//`timescale 1ns / 1ps


module raster(
	input clk, 		
	input reset,
	// from vga
	input [9:0] x,
	input [9:0] y,
	// from VS, 
	//input [1:0] tri_color,				// 2-bit intensity for each tri				
	input signed [19:0] y_screen_v0,		// change per frame, int20		
	input signed [19:0] y_screen_v1,		
	input signed [19:0] y_screen_v2,
	input signed [19:0] e0_init_t1,			// change per line, int20
	input signed [19:0] e1_init_t1,
	input signed [19:0] e2_init_t1,
	// to top
	output reg [5:0] rgb
	);

	
	reg signed [19:0] e0_t1;
	reg signed [19:0] e1_t1;
	reg signed [19:0] e2_t1;
	reg [1:0] state_pixel;


	always @(posedge clk) begin
		if (reset) begin
			e0_t1 <= 0;
			e1_t1 <= 0;
			e2_t1 <= 0;
			state_pixel <= 1;
			rgb <= 0;
		end
		else begin

			if (y < 480) begin
				if (x < 640) begin
					// @ each pixel, chk inside tri
					state_pixel <= state_pixel + 1;
					if (state_pixel == 1) begin 		
						state_pixel <= 0;
						//if ((e0_t1 <= 0)) begin
						//if ((e0_t1 <= 0) && (e1_t1 <= 0) && (e2_t1 <= 0)) begin
						if ((e0_t1 > 0) && (e1_t1 > 0) && (e2_t1 > 0)) begin 		// inside + (diff from pico verion)
							rgb <= 6'b001100;
						end
						else begin
							rgb <= 6'b000000;
						end
						e0_t1 <= e0_t1 + (y_screen_v1 - y_screen_v0);	// a0
						e1_t1 <= e1_t1 + (y_screen_v2 - y_screen_v1);	// a1
						e2_t1 <= e2_t1 + (y_screen_v0 - y_screen_v2);	// a2
					end 
				end 
				else if (x == 799) begin
					// update e0 = e0_init; each line
					e0_t1 <= e0_init_t1;
					e1_t1 <= e1_init_t1;
					e2_t1 <= e2_init_t1;
				end 	
			end 	// y < 480
			else if ((y == 524) && (x == 799)) begin
				// update e0 = e0_init; each frame, before begin line y = 0
				e0_t1 <= e0_init_t1;
				e1_t1 <= e1_init_t1;
				e2_t1 <= e2_init_t1;
			end
		end 	// reset
	end


endmodule

