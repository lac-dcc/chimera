// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _vgadisplay_h_
`define _vgadisplay_h_

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:33:08 09/21/2023 
// Design Name: 
// Module Name:    vgadisplay 
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
module vgadisplay #(parameter 
	H_SYNC_A = 96, 
	H_BACK_PORCH_B = 48, 
	H_ACTIVE_VIDEO_TIME_C = 640,
	H_FRONT_PORCH_D = 16,
	V_SYNC_O = 2,
	V_BACK_PORCH_P = 33,
	V_ACTIVE_VIDEO_TIME_Q = 480, 
	V_FRONT_PORCH_R = 10,
	VM_ADDR_BITS = 23
	)
(
    input [15:0] color,
    input clock,
    output reg hsync,
    output reg vsync,
    output [4:0] red,
    output [5:0] green,
    output [4:0] blue,
	 output reg [VM_ADDR_BITS:0] addr
    );
	
	localparam H_LAST_POS = H_SYNC_A + H_BACK_PORCH_B + H_ACTIVE_VIDEO_TIME_C + H_FRONT_PORCH_D;
	localparam V_LAST_POS = V_SYNC_O + V_BACK_PORCH_P + V_ACTIVE_VIDEO_TIME_Q + V_FRONT_PORCH_R;
	
	reg [9:0] hcount, vcount;
	reg is_show;
	
	always @(posedge clock) begin
		if (hcount == H_LAST_POS) begin
			hcount <= 0;
		end else begin
			hcount <= hcount + 1;
		end
		
		if (vcount == V_LAST_POS) begin
			vcount <= 0;
		end else if (hcount == H_LAST_POS) begin 
			vcount <= vcount + 1;
		end
		
		if (hcount == 0) hsync <= 0;
		else if (hcount == H_SYNC_A) hsync <=1;
		else if (hcount == H_LAST_POS) hsync <= 0;
		
		if (vcount == 0) vsync <= 0;
		else if (vcount == V_SYNC_O) vsync <= 1;
		else if (vcount == V_LAST_POS) vsync <= 0;
		
		if (vcount > V_SYNC_O && vcount < V_LAST_POS) begin
			if (hcount > H_SYNC_A && hcount < H_LAST_POS) begin
				is_show <= 1;
				addr <= addr + 1;
			end else begin
				is_show <= 0;
			end
		end else begin
			addr <= 0;
			is_show <= 0;
		end
	end
	
	assign {red, green, blue} = is_show == 1 ? color[15:0] : 16'b0; 

endmodule

`endif