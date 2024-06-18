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
	//adc
	input[7:0]                  ad9280_data,
	output                      ad9280_clk,
	//dac
	output[7:0]                 ad9708_data,
	output                      ad9708_clk,
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

wire                            adc_clk;
wire                            adc0_buf_wr;
wire[10:0]                      adc0_buf_addr;
wire[7:0]                       adc0_buf_data;
wire                            dac_clk;
wire[7:0]                       dac_data;
reg[8:0]                        rom_addr;
assign vga_out_hs = wave0_hs;
assign vga_out_vs = wave0_vs;
assign vga_out_r  = wave0_r[7:3]; //discard low bit data
assign vga_out_g  = wave0_g[7:2]; //discard low bit data
assign vga_out_b  = wave0_b[7:3]; //discard low bit data
assign ad9280_clk = adc_clk;
assign ad9708_clk = dac_clk;
assign ad9708_data = dac_data;

IBUFG IBUFG_INST
(    
      .O(clk_bufg),
		.I(clk)
);


//generate video pixel clock
video_pll video_pll_m0
(
	.clk_in(clk_bufg),
	.video_clk(video_clk),
	.reset(~rst_n),
	.locked()
);
adda_pll adda_pll_m0
(
	.clk_in(clk_bufg),
	.clk_out1(dac_clk),
	.clk_out2(adc_clk),
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
//dac 125Mhz/512 = 244.14khz
always@(posedge dac_clk)
begin
	rom_addr <= rom_addr + 9'd1;
end
da_rom da_rom_m0
(
	.addra               (rom_addr                   ),
	.clka                (dac_clk                    ),
	.douta               (dac_data                   )
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

ad9280_sample ad9280_sample_m0(
	.adc_clk               (adc_clk                    ),
	.rst                   (~rst_n                     ),
	.adc_data              (ad9280_data                ),
	.adc_data_valid        (1'b1                       ),
	.adc_buf_wr            (adc0_buf_wr                ),
	.adc_buf_addr          (adc0_buf_addr              ),
	.adc_buf_data          (adc0_buf_data              )
);

//display 50khz - 1Mhz
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
endmodule 