`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/12 14:58:06
// Design Name: 
// Module Name: lcd_para
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
	//-----------------------------------------------------------------------
	//Define the color parameter RGB--8|8|8
	//define colors RGB--8|8|8
	/*`define RED		24'hFF0000
	`define GREEN	24'h00FF00
	`define BLUE  	24'h0000FF
	`define WHITE 	24'hFFFFFF
	`define BLACK 	24'h000000
	`define YELLOW	24'hFFFF00
	`define CYAN  	24'hFF00FF
	`define ROYAL 	24'h00FFFF*/

	//---------------------------------
	//define colors RGB--3|3|2
	/*`define	RED 8'b111_000_00
	`define	GREEN 8'b000_111_00
	`define	BLUE 8'b000_000_11
	`define	WHITE 8'b111_111_11
	`define	BLACK 8'b000_000_00
	`define	YELLOW 8'b111_111_00
	`define	CYAN 8'b111_000_11//青
	`define	ROYAL 8'b000_111_11//深蓝色*/
	
	
	/* //---------------------------------
	//define colors RGB--4|4|4
	`define	RED 12'b1111_0000_0000
	`define	GREEN 12'b0000_1111_0000
	`define	BLUE 12'b0000_0000_1111
	`define	WHITE 12'b1111_1111_1111
	`define	BLACK 12'b0000_0000_0000
	`define	YELLOW 12'b1111_1111_0000
	`define	CYAN 12'b1111_0000_1111//青
	`define	ROYAL 12'b0000_1111_1111//深蓝色 */
	
	//---------------------------------
	//define colors RGB--5|6|5
	`define	RED 	16'b11111_000000_00000
	`define	GREEN 	16'b00000_111111_00000
	`define	BLUE 	16'b00000_000000_11111
	`define	WHITE 	16'b11111_111111_11111
	`define	BLACK 	16'b00000_000000_00000
	`define	YELLOW 	16'b11111_111111_00000
	`define	CYAN 	16'b11111_000000_11111//紫色
	`define	ROYAL 	16'b00000_111111_11111//深蓝色
	
	//---------------------------------
	//`define	SYNC_POLARITY 1'b0
	
	//------------------------------------
	//vga parameter define
	
	//`define	VGA_640_480_60FPS_25MHz
	//`define	VGA_800_600_72FPS_50MHz
	`define	VGA_1024_768_60FPS_65MHz 
	//`define	VGA_1280_1024_60FPS_105MHz
	//`define	VGA_1600_1200_60FPS_105MHz
	//`define	VGA_1920_1200_60FPS_105MHz
	
	//---------------------------------
	//	640 * 480
	`ifdef	VGA_640_480_60FPS_25MHz
	`define	H_FRONT	11'd16
	`define	H_SYNC 	11'd96  
	`define	H_BACK 	11'd48  
	`define	H_DISP	11'd640 
	`define	H_TOTAL	11'd800 	
						
	`define	V_FRONT	11'd10  
	`define	V_SYNC 	11'd2   
	`define	V_BACK 	11'd33 
	`define	V_DISP 	11'd480   
	`define	V_TOTAL	11'd525
	`define	H_START  0
	`define	H_END	 640
	`define	V_START  0
	`define	V_END	 480
	//Just for simulation
/* 	`define	H_START  0
	`define	H_END	 256
	`define	V_START  0
	`define	V_END	 4

	`define H_SYNC  11'd5		
	`define H_BACK  11'd5		
	`define H_DISP  11'd256
	`define H_FRONT  11'd5		
	`define H_TOTAL  `H_SYNC + `H_BACK + `H_DISP + `H_FRONT	//10'd784
	
	`define V_SYNC  11'd1		
	`define V_BACK  11'd1		
	`define V_DISP  11'd4	
	`define V_FRONT  11'd2
	`define V_TOTAL  `V_SYNC + `V_BACK + `V_DISP + `V_FRONT	//10'd510*/
	`endif
	
	//---------------------------------
	//	800 * 600
	`ifdef VGA_800_600_72FPS_50MHz 
	`define	H_FRONT	11'd56 
	`define	H_SYNC 	11'd120  
	`define	H_BACK 	11'd64  
	`define	H_DISP 	11'd800
	`define	H_TOTAL	11'd1040 
						
	`define	V_FRONT	11'd37  
	`define	V_SYNC 	11'd6   
	`define	V_BACK 	11'd23  
	`define	V_DISP 	11'd600  
	`define	V_TOTAL	11'd666
	`endif
	
	//---------------------------------
	//	1024 * 768	
	`ifdef	VGA_1024_768_60FPS_65MHz
	`define H_FRONT	11'd24	 
	`define H_SYNC 	11'd136  
	`define H_BACK 	11'd160 
	`define H_DISP 	11'd1024  
	`define H_TOTAL	11'd1344 
						
	`define V_FRONT	11'd3 
	`define V_SYNC 	11'd6    
	`define V_BACK 	11'd29   
	`define V_DISP 	11'd768
	`define V_TOTAL	11'd806
	`endif
	
	
	//---------------------------------
	//	1280 * 1024
	`ifdef	VGA_1280_1024_60FPS_105MHz
	`define	H_FRONT	11'd48
	`define	H_SYNC 	11'd112
	`define	H_BACK 	11'd248
	`define	H_DISP	11'd1280
	`define	H_TOTAL	11'd1688
						
	`define	V_FRONT	11'd1
	`define	V_SYNC 	11'd3   
	`define	V_BACK 	11'd38 
	`define	V_DISP 	11'd1024   
	`define	V_TOTAL	11'd1066
	`endif
	
	//---------------------------------
	//	1600 * 1200
	`ifdef	VGA_1600_1200_60FPS_105MHz
	`define	H_FRONT	11'd64
	`define	H_SYNC 	11'd192
	`define	H_BACK 	11'd304
	`define	H_DISP	11'd1600
	`define	H_TOTAL	11'd2160
						
	`define	V_FRONT	11'd1
	`define	V_SYNC 	11'd3   
	`define	V_BACK 	11'd46
	`define	V_DISP 	11'd1200  
	`define	V_TOTAL	11'd1250
	`endif
	
	//---------------------------------
	//	1920 * 1200
	`ifdef	VGA_1920_1200_60FPS_105MHz
	`define	H_FRONT	11'd128
	`define	H_SYNC 	11'd208
	`define	H_BACK 	11'd336
	`define	H_DISP	11'd1920
	`define	H_TOTAL	11'd2592
						
	`define	V_FRONT	11'd1
	`define	V_SYNC 	11'd3   
	`define	V_BACK 	11'd38
	`define	V_DISP 	11'd1200  
	`define	V_TOTAL	11'd1242
	`endif
	
	
