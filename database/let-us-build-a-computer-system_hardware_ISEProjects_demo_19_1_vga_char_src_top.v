// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
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
module top
(
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

wire                            osd_hs;
wire                            osd_vs;
wire                            osd_de;
wire[7:0]                       osd_r;
wire[7:0]                       osd_g;
wire[7:0]                       osd_b;


assign vga_out_hs = osd_hs;
assign vga_out_vs = osd_vs;
assign vga_out_r  = osd_r[7:3]; //discard low bit data
assign vga_out_g  = osd_g[7:2]; //discard low bit data
assign vga_out_b  = osd_b[7:3]; //discard low bit data

//generate video pixel clock

IBUFG IBFG_INST
(     .O(clk_bufg),
      .I(clk)
);

video_pll video_pll_m0
(
	.clk_in(clk_bufg),
	.video_clk(video_clk),
	.reset(~rst_n),
	.locked(locked)
);
	
color_bar color_bar_m0
(
	.clk(video_clk),
	.rst(~rst_n),
	.hs(video_hs),
	.vs(video_vs),
	.de(video_de),
	.rgb_r(video_r),
	.rgb_g(video_g),
	.rgb_b(video_b)
);

osd_display  osd_display_m0
(
	.rst_n                 (rst_n                      ),
	.pclk                  (video_clk                  ),
	.i_hs                  (video_hs                   ),
	.i_vs                  (video_vs                   ),
	.i_de	                 (video_de                   ),
	.i_data                ({video_r,video_g,video_b}  ),
	.o_hs                  (osd_hs                     ),
	.o_vs                  (osd_vs                     ),
	.o_de                  (osd_de                     ),
	.o_data                ({osd_r,osd_g,osd_b}        )
);

endmodule 