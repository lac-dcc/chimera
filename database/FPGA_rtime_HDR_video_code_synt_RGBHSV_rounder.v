// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//Author: Sharshin Vladislav shvladspb@gmail.com
`timescale 1 ns / 100 ps
module rounder
#(
	parameter BEFORE_ROUND	= 24,
	parameter LOW_BIT	  	= 7,
	parameter AFTER_ROUND	= 16//,
//	parameter HI_BIT = 
)
(
	input wire  										clk,             
	input wire 											reset_b,
	input wire		[BEFORE_ROUND-1: 0]					data_in,
	output wire		[AFTER_ROUND-1: 0]					data_out	
);

localparam WITHOUT_LOW = BEFORE_ROUND-LOW_BIT;

reg		[BEFORE_ROUND-1:0]	data_stp1;
reg		[WITHOUT_LOW-1:0]	data_stp2;
reg		[WITHOUT_LOW-1:0]	data_stp3;
reg		[AFTER_ROUND-1:0]	data_stp4;

//инверсия двоичного кода ( если надо)
always @( posedge clk or negedge reset_b )	
	if ( !reset_b )
		data_stp1	<= {(BEFORE_ROUND){1'b0}};
	else
		begin
			if ( data_in[BEFORE_ROUND-1] )
				begin
					data_stp1[BEFORE_ROUND-2:0]	<= ~data_in[BEFORE_ROUND-2:0] + 1'h1;
					data_stp1[BEFORE_ROUND-1]	<= data_in[BEFORE_ROUND-1];
				end
			else
				begin
					data_stp1	<= data_in;
				end
		end
//удаление младших разрядов
always @( posedge clk or negedge reset_b )	
	if ( !reset_b )
		data_stp2	<= {(WITHOUT_LOW){1'b0}};//17'h0;
	else
		if ( data_stp1[LOW_BIT-1] )
			data_stp2	<= data_stp1[BEFORE_ROUND-1:LOW_BIT] + 1;
		else
			data_stp2	<= data_stp1[BEFORE_ROUND-1:LOW_BIT];
		
//обратная инверсия ( если надо )		
always @( posedge clk or negedge reset_b )	
	if ( !reset_b )
		data_stp3	<= {(WITHOUT_LOW){1'b0}};//17'h0;	
	else
		begin
			if ( data_stp2[WITHOUT_LOW-1] )
				begin
					data_stp3[WITHOUT_LOW-2:0]	<= ~data_stp2[WITHOUT_LOW-2:0] + 1'h1;
					data_stp3[WITHOUT_LOW-1]	<= data_stp2[WITHOUT_LOW-1];
				end
			else
				begin
					data_stp3	<= data_stp2;
				end
		end

//удаление старших разрядов
always @( posedge clk or negedge reset_b )
	if ( !reset_b )
		data_stp4	<= {(AFTER_ROUND){1'b0}};//16'h0;	
	else
		data_stp4	<= { data_stp3[WITHOUT_LOW-1], data_stp3[AFTER_ROUND-2:0] };
		
assign data_out = ( |data_stp4[AFTER_ROUND-2:0] ) ? data_stp4 : {(AFTER_ROUND){1'b0}};

endmodule








