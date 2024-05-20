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
//  2017/7/12     meisq          1.0         Original
//*******************************************************************************/
`timescale 1ns/1ps
module audio_tx
(
	input                            rst,                  
	input                            clk,  
	input                            sck_bclk,     //audio bit clock
	input                            ws_lrc,       //DAC sample rate left right clock
	output reg                       sdata,        //DAC audio data output 
	input[31:0]                      left_data,    //left channel audio data,ws_lrc = 1
	input[31:0]                      right_data,   //right channel audio data,ws_lrc = 0
	output reg                       read_data_en  //read data enable

);
reg                                  sck_bclk_d0; //delay sck_bclk
reg                                  sck_bclk_d1; //delay sck_bclk
reg                                  ws_lrc_d0;   //delay ws_lrc
reg                                  ws_lrc_d1;   //delay ws_lrc
reg[31:0]                            left_data_shift; //left channel audio data shift register
reg[31:0]                            right_data_shift;//right channel audio data shift register

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
	begin
		sck_bclk_d0 <= 1'b0;
		sck_bclk_d1 <= 1'b0;
		ws_lrc_d0 <= 1'b0;
		ws_lrc_d1 <= 1'b0;
	end
	else
	begin
		//delay 
		sck_bclk_d0 <= sck_bclk;
		sck_bclk_d1 <= sck_bclk_d0;
		ws_lrc_d0 <= ws_lrc;
		ws_lrc_d1 <= ws_lrc_d0;
	end
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		left_data_shift <= 32'd0;
	else if(ws_lrc_d1 == 1'b0 && ws_lrc_d0 == 1'b1)//ws_lrc posedge 
		left_data_shift <= left_data;
	else if(ws_lrc_d1 == 1'b1 && sck_bclk_d1 == 1'b1 && sck_bclk_d0 == 1'b0)//ws_lrc = 1 ,sck_bclk negedge 
		left_data_shift <= {left_data_shift[30:0],1'b0};
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		right_data_shift <= 32'd0;
	else if(ws_lrc_d1 == 1'b0 && ws_lrc_d0 == 1'b1) //ws_lrc posedge 
		right_data_shift <= right_data;
	else if(ws_lrc_d1 == 1'b0 && sck_bclk_d1 == 1'b1 && sck_bclk_d0 == 1'b0)//ws_lrc = 0 ,sck_bclk negedge
		right_data_shift <= {right_data_shift[30:0],1'b0};
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdata <= 1'd0;
	else if(ws_lrc_d1 == 1'b1)
		sdata <= left_data_shift[31];
	else if(ws_lrc_d1 == 1'b0)
		sdata <= right_data_shift[31];
end


always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		read_data_en <= 1'b0;
	else if(ws_lrc_d1 == 1'b0 && ws_lrc_d0 == 1'b1)//ws_lrc posedge  read the next audio data
		read_data_en <= 1'b1;
	else
		read_data_en <= 1'b0;
end

endmodule
