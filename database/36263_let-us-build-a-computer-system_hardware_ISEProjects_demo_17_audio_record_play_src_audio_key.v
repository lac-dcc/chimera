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
module audio_key
(
	input                            rst,                      //reset input
	input                            clk,                      //clock input
	input                            key,                      //press the button to record,release button play
	output reg                       record,                   //record ctrl for other module
	output reg                       play,                     //play ctrl for other module
	output reg                       write_req,                //start write request
	input                            write_req_ack,            //start write request response
	output reg                       read_req,                 //start read request
	input                            read_req_ack              //start read request response
);
//state machine code
localparam                           S_IDLE      = 0;
localparam                           S_RECORD    = 1;
localparam                           S_PLAY      = 2;

wire                                 button_negedge;           //press button ,one clock cycle
wire                                 button_posedge;           //button release,one clock cycle
reg[1:0]                             state;
reg[31:0]                            record_cnt;               //recording counter, recording the recording time
reg[31:0]                            play_cnt;                 //play counter, record play time
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
	begin
		state <= S_IDLE;
		record <= 1'b0;
		play   <= 1'b0;
		record_cnt <= 32'd0;
		play_cnt <= 32'd0;
		write_req <= 1'b0;
		read_req <= 1'b0;
	end
	else
		case(state)
			S_IDLE:
			begin
				//press the button to start recording and write requests simultaneously
				if(button_negedge == 1'b1)
				begin
					record <= 1'b1;
					write_req <= 1'b1;
					state <= S_RECORD;
				end
			end
			S_RECORD:
			begin
				if(write_req_ack)
					write_req <= 1'b0;
				//the button is released, the playback begins, and a read request is issued simultaneously
				if(button_posedge ==  1'b1)
				begin
					record <= 1'b0;
					play <= 1'b1;
					state <= S_PLAY;
					read_req <= 1'b1;
				end
				//recording counter
				record_cnt <= record_cnt + 32'd1;
				play_cnt <= 32'd0;
			end
			S_PLAY:
			begin
				if(read_req_ack == 1'b1)
					read_req <= 1'b0;
					
				if(button_negedge == 1'b1)
				begin
					record <= 1'b1;
					write_req <= 1'b1;
					state <= S_RECORD;
					record_cnt <= 32'd0;
					play <= 1'b0;
				end
				//Play time equals recording time
				else if(play_cnt == record_cnt)
				begin
					record_cnt <= 32'd0;
					state <= S_IDLE;
					play <= 1'b0;
				end
				else
					play_cnt <= play_cnt + 32'd1;
			end
			default:
				state <= S_IDLE;
		endcase
end

ax_debounce ax_debounce_m0
(
	.clk             (clk           ),
	.rst             (rst           ),
	.button_in       (key           ),
	.button_posedge  (button_posedge),
	.button_negedge  (button_negedge),
	.button_out      (              )
);
endmodule
