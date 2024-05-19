// This program was cloned from: https://github.com/racerxdl/LVDS-7-to-1-Serializer
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 	Teske Virtual System
// Engineer: 	Lucas Teske
// 
// Create Date:    20:23:28 07/04/2013 
// Design Name: 	Video LVDS Serializer
// Module Name:     video_lvds
// GitHub: https://github.com/racerxdl/LVDS-7-to-1-Serializer
//////////////////////////////////////////////////////////////////////////////////

module video_lvds(
		input DotClock,
		input HSync,
		input VSync,
		input DataEnable,
		input [5:0] Red,
		input [5:0] Green,
		input [5:0] Blue,
		output channel1_p,
		output channel1_n,
		output channel2_p,
		output channel2_n,
		output channel3_p,
		output channel3_n,
		output clock_p,
		output clock_n
    );
	 
wire clk35, notclk35, c1,c2,c3,lvdsclk, rst_clk, DataClock;
wire [20:0] VideoData;

OBUFDS	#(.IOSTANDARD("LVDS_33")) lvds_channel1_obuf	(.I(c1),   		 .O(channel1_p),    .OB(channel1_n) );
OBUFDS	#(.IOSTANDARD("LVDS_33")) lvds_channel2_obuf	(.I(c2),   	    .O(channel2_p),    .OB(channel2_n) );
OBUFDS	#(.IOSTANDARD("LVDS_33")) lvds_channel3_obuf	(.I(c3),   		 .O(channel3_p),    .OB(channel3_n) );
OBUFDS	#(.IOSTANDARD("LVDS_33")) lvds_clock_obuf		(.I(lvdsclk),   .O(clock_p),	     .OB(clock_n) );


lvds_clockgen clockgenerator (
    .clk(DotClock), 
    .clk35(clk35), 
    .nclk35(notclk35), 
	 .rstclk(rst_clk),
	 .dataclock(DataClock),
    .lvdsclk(lvdsclk)
    );

serializer channel1_ser (
    .clk(DataClock), 
    .clk35(clk35), 
    .notclk35(notclk35), 
    .data(VideoData[6:0]), 
	 .rst(rst_clk),
    .out(c1)
    );
	 
serializer channel2_ser (
    .clk(DataClock), 
    .clk35(clk35), 
    .notclk35(notclk35), 
    .data(VideoData[13:7]), 
	 .rst(rst_clk),
    .out(c2)
    );

serializer channel3_ser (
    .clk(DataClock), 
    .clk35(clk35), 
    .notclk35(notclk35), 
    .data(VideoData[20:14]), 
	 .rst(rst_clk),
    .out(c3)
    );

assign VideoData[20:14]	= {Blue[2],Blue[3],Blue[4],Blue[5],HSync,VSync,DataEnable};
assign VideoData[13:7]  = {Green[1],Green[2],Green[3],Green[4],Green[5],Blue[0],Blue[1]};
assign VideoData[6:0]	= {Red[0],Red[1],Red[2],Red[3],Red[4],Red[5],Green[0]};


endmodule
