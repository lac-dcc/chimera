//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          Sobel_Threshold_Adj
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        Sobel阈值调节
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

`timescale 1ns/1ns
module Sobel_Threshold_Adj
(
	//global clock
	input				clk,  		//100MHz
	input				rst_n,		//global reset
	
	//user interface
	input				key_flag,		//key down flag
	input		[3:0]	key_value,		//key control data
	
	output	reg	[3:0]	Sobel_Grade,	//Sobel Grade output
	output	reg	[7:0]	Sobel_Threshold	//lcd pwn signal, l:valid
);

//---------------------------------
//Sobel Threshold adjust with key.
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		Sobel_Grade	<= 4'd8;
	else if(key_flag)
		begin
		case(key_value)	//{Sobel_Threshold--, Sobel_Threshold++}
		4'b0001:	Sobel_Grade <= (Sobel_Grade == 4'd0)  ? 4'd0  : Sobel_Grade - 1'b1;
		4'b0010:	Sobel_Grade <= (Sobel_Grade == 4'd15) ? 4'd15 : Sobel_Grade + 1'b1;
        4'b0100:	Sobel_Grade	<= 4'd8;
		4'b1000:	Sobel_Grade	<= 4'd8;
		default:;
		endcase
		end
	else
		Sobel_Grade <= Sobel_Grade;
end


//---------------------------------
//Sobel Grade Mapping with Sobel Threshold
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		Sobel_Threshold <= 35;
	else
		case(Sobel_Grade)
		4'h0:	Sobel_Threshold <= 20;
		4'h1:	Sobel_Threshold <= 25;
		4'h2:	Sobel_Threshold <= 30;
		4'h3:	Sobel_Threshold <= 35;
		4'h5:	Sobel_Threshold <= 40;
		4'h6:	Sobel_Threshold <= 45;
		4'h7:	Sobel_Threshold <= 50;
		4'h8:	Sobel_Threshold <= 100;
		
		4'h9:	Sobel_Threshold <= 60;
		4'ha:	Sobel_Threshold <= 65;
		4'hb:	Sobel_Threshold <= 70;
		4'hc:	Sobel_Threshold <= 75;
		4'hd:	Sobel_Threshold <= 80;
		4'he:	Sobel_Threshold <= 85;
		4'hf:	Sobel_Threshold <= 90;
		default:;
		endcase
end


endmodule
