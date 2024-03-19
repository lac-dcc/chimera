//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          led
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        led指示
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//
`timescale 1ns/1ns
module led
#(
	parameter LED_WIDTH = 4
)
(
	//global clock
	input						clk,
	input						rst_n,
	
	//user interface
	input						led_en,
	input		[LED_WIDTH-1:0]	led_value,
	
	//led interface	
	output	reg	[LED_WIDTH-1:0]	led_data
);

//--------------------------------------
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		led_data <= {LED_WIDTH{1'b0}};
	else if(led_en)
		led_data <= led_value;
	else
		led_data <= led_data;
end

endmodule
