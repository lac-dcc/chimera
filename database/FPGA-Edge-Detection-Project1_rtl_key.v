//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          key
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        按键
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//
`timescale 1ns/1ns
module key
#(
	parameter	KEY_WIDTH = 4
)
(
	//global clock
	input 							clk,
	input 							rst_n,
	
	//key interface
	input 		[KEY_WIDTH-1:0] 	key_data,
	
	//user interface
	output 	reg						key_flag,
	output	reg	[KEY_WIDTH-1:0]		key_value	//H Valid
);

//-----------------------------------
//Register key_data for compare
reg	[KEY_WIDTH-1:0]	key_data_r;
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		key_data_r <= {KEY_WIDTH{1'b1}};
	else
		key_data_r <= key_data;
end


//-----------------------------------
//Delay for 20ms
localparam DELAY_TOP = 20'd1000_000;
//localparam DELAY_TOP = 20'd1000;		//Just for test
reg	[19:0]	delay_cnt;
//-----------------------------------
//Key scan via counter detect.
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)	
		delay_cnt <= 0;
	else 
		begin
		if((key_data == key_data_r) && (key_data != {KEY_WIDTH{1'b1}}))	//20ms counter jitter
			begin
			if(delay_cnt < DELAY_TOP)
				delay_cnt <= delay_cnt + 1'b1;
			else
				delay_cnt <= DELAY_TOP;
			end
		else
			delay_cnt <= 0;
		end
end


//-----------------------------------
//the complete of key_data capture
wire	key_trigger = (delay_cnt == DELAY_TOP - 1'b1) ? 1'b1 : 1'b0;
	
//-----------------------------------
//output the valid key_value via key_trigger
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		key_value <= {KEY_WIDTH{1'b0}};
	else if(key_trigger)
		key_value <= ~key_data_r;
	else
		key_value <= key_value;
end

//---------------------------------
//Lag 1 clock for valid read enable 
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		key_flag <= 0;
	else
		key_flag <= key_trigger;
end

endmodule
