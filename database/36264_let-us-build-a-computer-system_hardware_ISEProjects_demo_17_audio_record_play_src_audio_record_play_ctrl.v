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
module audio_record_play_ctrl
(
	input                            rst,                 //reset input
	input                            clk,                 //clock input
	input                            key,                 //press the button to record,release button play
	input                            bclk,                //audio bit clock
	input                            daclrc,              //DAC sample rate left right clock
	output                           dacdat,              //DAC audio data output 
	input                            adclrc,              //ADC sample rate left right clock
	input                            adcdat,              //ADC audio data input
	output                           write_req,
	input                            write_req_ack,
	output                           write_en,
	output[63:0]                     write_data,
	output                           read_req,
	input                            read_req_ack,
	output                           read_en,
	input[63:0]                      read_data
);
wire                  record;
wire                  play;
wire                  read_data_en;
wire[31:0]            tx_left_data;
wire[31:0]            tx_right_data;
wire[31:0]            rx_left_data;
wire[31:0]            rx_right_data;
wire                  data_valid;

assign read_en = read_data_en & play;
assign tx_left_data = read_data[63:32];
assign tx_right_data = read_data[31:0];
assign write_data = {rx_left_data,rx_right_data};
assign write_en = data_valid & record;
//button control module
audio_key audio_key_m0
(
	.rst           (rst           ),
	.clk           (clk           ),
	.key           (key           ),
	.record        (record        ),
	.play          (play          ),
	.write_req     (write_req     ),
	.write_req_ack (write_req_ack ),
	.read_req      (read_req      ),
	.read_req_ack  (read_req_ack  )
);
//audio transmission
audio_tx audio_tx_m0
(
	.rst          (rst           ),        
	.clk          (clk           ),
	.sck_bclk     (bclk          ),
	.ws_lrc       (adclrc        ),
	.sdata        (dacdat        ),
	.left_data    (tx_left_data  ),
	.right_data   (tx_right_data ),
	.read_data_en (read_data_en  )
);
//audio receiver
audio_rx audio_rx_m0
(
	.rst          (rst           ),         
	.clk          (clk           ),
	.sck_bclk     (bclk          ),
	.ws_lrc       (adclrc        ),
	.sdata        (adcdat        ),
	.left_data    (rx_left_data  ), 
	.right_data   (rx_right_data ), 
	.data_valid   (data_valid    )

);	
	
endmodule
