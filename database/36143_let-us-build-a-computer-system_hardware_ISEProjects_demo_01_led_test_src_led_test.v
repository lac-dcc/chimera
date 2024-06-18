// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
//  led test                                                                    //
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
//  2017/7/19     meisq          1.0         Original
//*******************************************************************************/

`timescale 1ns / 1ps
module led_test
(
	input           clk,           // system clock 50Mhz on board
	input           rst_n,         // reset ,low active
	output reg[3:0] led            // LED,use for control the LED signal on board
);

//define the time counter
reg [31:0]      timer;

// cycle counter:from 0 to 4 sec
always@(posedge clk or negedge rst_n)
begin
	if (rst_n == 1'b0)
		timer <= 32'd0;                     //when the reset signal valid,time counter clearing
	else if (timer == 32'd199_999_999)      //4 seconds count(50M*4-1=199999999)
		timer <= 32'd0;                     //count done,clearing the time counter
	else
		timer <= timer + 32'd1;             //timer counter = timer counter + 1
end

// LED control
always@(posedge clk or negedge rst_n)
begin
	if (rst_n == 1'b0)
		led <= 4'b0000;                     //when the reset signal active
	else if (timer == 32'd49_999_999)       //time counter count to 1st sec,LED1 lighten
		led <= 4'b0001;
	else if (timer == 32'd99_999_999)       //time counter count to 2nd sec,LED2 lighten
		led <= 4'b0010;
	else if (timer == 32'd149_999_999)      //time counter count to 3rd sec,LED3 lighten
		led <= 4'b0100;
	else if (timer == 32'd199_999_999)      //time counter count to 4th sec,LED4 lighten
		led <= 4'b1000;
end
endmodule
