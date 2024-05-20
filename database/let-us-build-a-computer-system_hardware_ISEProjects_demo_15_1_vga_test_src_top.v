// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   vga color bar test                                                         //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//2017/7/20                    1.0          Original
//*******************************************************************************/
module top(
	input                       clk,
	input                       rst_n,
	//vga output        
	output                      vga_out_hs, //vga horizontal synchronization         
	output                      vga_out_vs, //vga vertical synchronization                  
	output[4:0]                 vga_out_r,  //vga red
	output[5:0]                 vga_out_g,  //vga green
	output[4:0]                 vga_out_b   //vga blue
	
);

wire                            video_clk;
wire                            video_hs;
wire                            video_vs;
wire                            video_de;
wire[7:0]                       video_r;
wire[7:0]                       video_g;
wire[7:0]                       video_b;

assign vga_out_hs = video_hs;
assign vga_out_vs = video_vs;
assign vga_out_r  = video_r[7:3]; //discard low bit data
assign vga_out_g  = video_g[7:2]; //discard low bit data
assign vga_out_b  = video_b[7:3]; //discard low bit data

//generate video pixel clock
video_pll video_pll_m0(
	.CLK_IN1(clk),
	.CLK_OUT1(video_clk),
	.RESET(~rst_n),
	.LOCKED(LOCKED)
	);
color_bar color_bar_m0(
	.clk(video_clk),
	.rst(~rst_n),
	.hs(video_hs),
	.vs(video_vs),
	.de(video_de),
	.rgb_r(video_r),
	.rgb_g(video_g),
	.rgb_b(video_b)
);
endmodule