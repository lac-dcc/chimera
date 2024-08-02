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
module top(
	input                       clk,
	input                       rst_n,

	input[15:0]                 ad7606_data,             //ad7606 data
	input                       ad7606_busy,             //ad7606 busy
	input                       ad7606_first_data,       //ad7606 first data
	output[2:0]                 ad7606_os,               //ad7606
	output                      ad7606_cs,               //ad7606 AD cs
	output                      ad7606_rd,               //ad7606 AD data read
	output                      ad7606_reset,            //ad7606 AD reset
	output                      ad7606_convstab,         //ad7606 AD convert start
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

wire                            grid_hs;
wire                            grid_vs;
wire                            grid_de;
wire[7:0]                       grid_r;
wire[7:0]                       grid_g;
wire[7:0]                       grid_b;

wire                            wave0_hs;
wire                            wave0_vs;
wire                            wave0_de;
wire[7:0]                       wave0_r;
wire[7:0]                       wave0_g;
wire[7:0]                       wave0_b;

wire                            wave1_hs;
wire                            wave1_vs;
wire                            wave1_de;
wire[7:0]                       wave1_r;
wire[7:0]                       wave1_g;
wire[7:0]                       wave1_b;

wire                            adc_clk;
wire                            adc0_buf_wr;
wire[10:0]                      adc0_buf_addr;
wire[7:0]                       adc0_buf_data;
wire                            adc1_buf_wr;
wire[10:0]                      adc1_buf_addr;
wire[7:0]                       adc1_buf_data;

wire                            ad_data_valid;
wire signed[15:0]               ad_ch1;
wire signed[15:0]               ad_ch2;
wire signed[15:0]               ad_ch3;
wire signed[15:0]               ad_ch4;
wire signed[15:0]               ad_ch5;
wire signed[15:0]               ad_ch6;
wire signed[15:0]               ad_ch7;
wire signed[15:0]               ad_ch8;
assign vga_out_hs = wave1_hs;
assign vga_out_vs = wave1_vs;
assign vga_out_r  = wave1_r[7:3]; //discard low bit data
assign vga_out_g  = wave1_g[7:2]; //discard low bit data
assign vga_out_b  = wave1_b[7:3]; //discard low bit data
assign adc_clk = clk_bufg;
//generate video pixel clock
IBUFG IBUFG_INST
(     .O(clk_bufg),
      .I(clk)
);
video_pll video_pll_m0
(
	.clk_in(clk_bufg),
	.video_clk(video_clk),
	.reset(~rst_n),
	.locked()
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

ad7606_if ad7606_if_m0(
	.clk                   (adc_clk                    ),
	.rst_n                 (rst_n                      ),
	.ad_data               (ad7606_data                ), //ad7606 data
	.ad_busy               (ad7606_busy                ), //ad7606 busy
	.first_data            (ad7606_first_data          ), //ad7606 first data
	.ad_os                 (ad7606_os                  ), //ad7606
	.ad_cs                 (ad7606_cs                  ), //ad7606 AD cs
	.ad_rd                 (ad7606_rd                  ), //ad7606 AD data read
	.ad_reset              (ad7606_reset               ), //ad7606 AD reset
	.ad_convstab           (ad7606_convstab            ), //ad7606 AD convert start
	.ad_data_valid         (ad_data_valid              ),
	.ad_ch1                (ad_ch1                     ),
	.ad_ch2                (ad_ch2                     ),
	.ad_ch3                (ad_ch3                     ),
	.ad_ch4                (ad_ch4                     ),
	.ad_ch5                (ad_ch5                     ),
	.ad_ch6                (ad_ch6                     ),
	.ad_ch7                (ad_ch7                     ),
	.ad_ch8                (ad_ch8                     )
);

grid_display  grid_display_m0(
	.rst_n                 (rst_n                      ),
	.pclk                  (video_clk                  ),
	.i_hs                  (video_hs                   ),
	.i_vs                  (video_vs                   ),
	.i_de                  (video_de                   ),
	.i_data                ({video_r,video_g,video_b}  ),
	.o_hs                  (grid_hs                    ),
	.o_vs                  (grid_vs                    ),
	.o_de                  (grid_de                    ),
	.o_data                ({grid_r,grid_g,grid_b}     )
);

ad7606_sample ad7606_sample_m0(
	.adc_clk               (adc_clk                    ),
	.rst                   (~rst_n                     ),
	.adc_data              (ad_ch1                     ),
	.adc_data_valid        (ad_data_valid              ),
	.adc_buf_wr            (adc0_buf_wr                ),
	.adc_buf_addr          (adc0_buf_addr              ),
	.adc_buf_data          (adc0_buf_data              )
);
ad7606_sample ad7606_sample_m1(
	.adc_clk               (adc_clk                    ),
	.rst                   (~rst_n                     ),
	.adc_data              (ad_ch2                     ),
	.adc_data_valid        (ad_data_valid              ),
	.adc_buf_wr            (adc1_buf_wr                ),
	.adc_buf_addr          (adc1_buf_addr              ),
	.adc_buf_data          (adc1_buf_data              )
);
//display 200hz ~ 2khz
wav_display wav_display_m0(
	.rst_n                 (rst_n                      ),
	.pclk                  (video_clk                  ),
	.wave_color            (24'hff0000                 ),
	.adc_clk               (adc_clk                    ),
	.adc_buf_wr            (adc0_buf_wr                ),
	.adc_buf_addr          (adc0_buf_addr              ),
	.adc_buf_data          (adc0_buf_data              ),
	.i_hs                  (grid_hs                    ),
	.i_vs                  (grid_vs                    ),
	.i_de                  (grid_de                    ),
	.i_data                ({grid_r,grid_g,grid_b}     ),
	.o_hs                  (wave0_hs                   ),
	.o_vs                  (wave0_vs                   ),
	.o_de                  (wave0_de                   ),
	.o_data                ({wave0_r,wave0_g,wave0_b}  )
);
wav_display wav_display_m1(
	.rst_n                 (rst_n                      ),
	.pclk                  (video_clk                  ),
	.wave_color            (24'h0000ff                 ),
	.adc_clk               (adc_clk                    ),
	.adc_buf_wr            (adc1_buf_wr                ),
	.adc_buf_addr          (adc1_buf_addr              ),
	.adc_buf_data          (adc1_buf_data              ),
	.i_hs                  (wave0_hs                   ),
	.i_vs                  (wave0_vs                   ),
	.i_de                  (wave0_de                   ),
	.i_data                ({wave0_r,wave0_g,wave0_b}  ),
	.o_hs                  (wave1_hs                   ),
	.o_vs                  (wave1_vs                   ),
	.o_de                  (wave1_de                   ),
	.o_data                ({wave1_r,wave1_g,wave1_b}  )
);
endmodule 