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
//2017/8/28                   1.0          Original
//*******************************************************************************/
`timescale 1ns / 1ps
module ad7606_if(
	input                        clk,
	input                        rst_n,
	input [15:0]                 ad_data,             //ad7606 data
	input                        ad_busy,             //ad7606 busy
	input                        first_data,          //ad7606 first data
	output [2:0]                 ad_os,               //ad7606
	output reg                   ad_cs,               //ad7606 AD cs
	output reg                   ad_rd,               //ad7606 AD data read
	output reg                   ad_reset,            //ad7606 AD reset
	output reg                   ad_convstab,         //ad7606 AD convert start
	output                       ad_data_valid,
	output reg [15:0]            ad_ch1,
	output reg [15:0]            ad_ch2,
	output reg [15:0]            ad_ch3,
	output reg [15:0]            ad_ch4,
	output reg [15:0]            ad_ch5,
	output reg [15:0]            ad_ch6,
	output reg [15:0]            ad_ch7,
	output reg [15:0]            ad_ch8
);



reg [15:0]  rst_cnt;
reg [5:0]   i;
reg [3:0]   state;

parameter IDLE=4'd0;
parameter AD_CONV=4'd1;
parameter Wait_1=4'd2;
parameter Wait_busy=4'd3;
parameter READ_CH1=4'd4;
parameter READ_CH2=4'd5;
parameter READ_CH3=4'd6;
parameter READ_CH4=4'd7;
parameter READ_CH5=4'd8;
parameter READ_CH6=4'd9;
parameter READ_CH7=4'd10;
parameter READ_CH8=4'd11;
parameter READ_DONE=4'd12;

assign ad_os=3'b000;//NO OS
assign ad_data_valid = state == READ_DONE ? 1'b1 : 1'b0;
//The ad chip's reset signal must be set high pluse 50ns at least,then start to convert
always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
	begin
		rst_cnt <= 16'd0;
		ad_reset <= 1'b0;
	end
	else if(rst_cnt < 16'hffff)
	begin
		rst_cnt <= rst_cnt + 16'd1;
		ad_reset <= 1'b1;
	end
	else
		ad_reset <= 1'b0;
end

always@(posedge clk)
begin
	if(ad_reset==1'b1)
	begin
		state <= IDLE;
		ad_ch1 <= 0;
		ad_ch2 <= 0;
		ad_ch3 <= 0;
		ad_ch4 <= 0;
		ad_ch5 <= 0;
		ad_ch6 <= 0;
		ad_ch7 <= 0;
		ad_ch8 <= 0;
		ad_cs <= 1'b1;
		ad_rd <= 1'b1;
		ad_convstab <= 1'b1;
		i <= 6'd0;
	end
	else
	begin
		case(state)
			IDLE:
			begin
				ad_cs<=1'b1;
				ad_rd<=1'b1;
				ad_convstab<=1'b1;
				if(i==20)
				begin
					i <= 6'd0;
					state<=AD_CONV;
				end
				else
					i <= i + 6'd1;
			end
			AD_CONV:
			begin
				if(i==2)                                  //wait 2 clock
				begin                          
					i <= 6'd0;
					state<=Wait_1;
					ad_convstab<=1'b1;
				end
				else 
				begin
					i <= i + 6'd1;
					ad_convstab<=1'b0;       
				end
			end
			Wait_1:
			begin
				if(i==5) 
				begin                                     //wait 5 clock
					i <= 6'd0;
					state<=Wait_busy;
				end
				else
					i <= i + 6'd1;
			end
			Wait_busy:
			begin
				if(ad_busy==1'b0) 
				begin                                     //wait busy low
					i <= 6'd0;
					state<=READ_CH1;
				end
			end
			READ_CH1:
			begin
				ad_cs<=1'b0;                              //cs valid
				if(i==3) 
				begin
					ad_rd<=1'b1;
					i <= 6'd0;
					ad_ch1<=ad_data;                        //read CH1
					state<=READ_CH2;
				end
				else 
				begin
					ad_rd<=1'b0;
					i <= i + 6'd1;
				end
			end
			READ_CH2:
			begin
				if(i==3) 
				begin
					ad_rd<=1'b1;
					i <= 6'd0;
					ad_ch2<=ad_data;                        //read CH2
					state<=READ_CH3;
				end
				else 
				begin
					ad_rd<=1'b0;
					i <= i + 6'd1;
				end
			end
			READ_CH3:
			begin
				if(i==3) 
				begin
					ad_rd<=1'b1;
					i <= 6'd0;
					ad_ch3<=ad_data;                        //read CH3
					state<=READ_CH4;
				end
				else 
				begin
					ad_rd<=1'b0;
					i <= i + 6'd1;
				end
			end
			READ_CH4: 
			begin
				if(i==3) 
				begin
					ad_rd<=1'b1;
					i <= 6'd0;
					ad_ch4<=ad_data;                        //read CH4
					state<=READ_CH5;
				end
				else 
				begin
					ad_rd<=1'b0;
					i <= i + 6'd1;
				end
			end
			READ_CH5:
			begin
				if(i==3) 
				begin
					ad_rd<=1'b1;
					i <= 6'd0;
					ad_ch5<=ad_data;                        //read CH5
					state<=READ_CH6;
				end
				else 
				begin
					ad_rd<=1'b0;
					i <= i + 6'd1;
				end
			end
			READ_CH6:
			begin
				if(i==3) 
				begin
					ad_rd<=1'b1;
					i <= 6'd0;
					ad_ch6<=ad_data;                        //read CH6
					state<=READ_CH7;
				end
				else 
				begin
					ad_rd<=1'b0;
					i <= i + 6'd1;
				end
			end
			READ_CH7:
			begin
				if(i==3) 
				begin
					ad_rd<=1'b1;
					i <= 6'd0;
					ad_ch7<=ad_data;                        //read CH7
					state<=READ_CH8;
				end
				else 
				begin
					ad_rd<=1'b0;
					i <= i + 6'd1;
				end
			end
			READ_CH8:
			begin
				if(i==3) 
				begin
					ad_rd<=1'b1;
					i <= 6'd0;
					ad_ch8<=ad_data;                        //read CH8
					state<=READ_DONE;
				end
				else 
				begin
					ad_rd<=1'b0;
					i <= i + 6'd1;
				end
			end
			READ_DONE:
			begin
				ad_rd<=1'b1;
				ad_cs<=1'b1;
				state<=IDLE;
			end
			default:
				state<=IDLE;
		 endcase
	end

 end

endmodule
