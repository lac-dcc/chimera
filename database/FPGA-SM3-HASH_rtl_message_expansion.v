// This program was cloned from: https://github.com/raymondrc/FPGA-SM3-HASH
// License: MIT License

/*
 * File: message_expansion.v
 * Project: rtl
 * File Created: Sunday, 5th August 2018 9:03:57 am
 * Author: Chen Rui (raymond.rui.chen@qq.com>)
 * -----
 * Last Modified: Sunday, 5th August 2018 9:12:44 am
 * Modified By: Chen Rui (raymond.rui.chen@qq.com>)
 * -----
 * Copyright (c) 2018 - Chen Rui
 * All rights reserved.
 */
module msg_expansion
	(
		clk_in,
		reset_n_in,
		message_in,
		start_in,
		index_j_in,
		word_p_out,
		word_out,
		msg_exp_finished_out
	);
	
`define	IDLE	2'b00
`define	WORKING	2'b01

input				clk_in;
input				reset_n_in;	
input	[511 : 0]	message_in;			
input				start_in;		
input	[5:0]		index_j_in;		

output	reg[31 : 0]	word_p_out;			
output	reg[31 : 0]	word_out;			
output				msg_exp_finished_out;

reg					working_en;
reg					msg_exp_finished_out;
reg		[1:0]		current_state,
					next_state;
reg		[31 : 0]	w0;
reg		[31 : 0]	w1;
reg		[31 : 0]	w2;
reg		[31 : 0]	w3;
reg		[31 : 0]	w4;
reg		[31 : 0]	w5;
reg		[31 : 0]	w6;
reg		[31 : 0]	w7;
reg		[31 : 0]	w8;
reg		[31 : 0]	w9;
reg		[31 : 0]	w10;
reg		[31 : 0]	w11;
reg		[31 : 0]	w12;
reg		[31 : 0]	w13;
reg		[31 : 0]	w14;
reg		[31 : 0]	w15;

wire	[31 : 0]	tmp_shift_15;	
wire	[31 : 0]	tmp_shift_7;	
wire	[31 : 0]	data_for_p1;
wire	[31 : 0]	data_after_p1;
wire	[31 : 0]	word_update;

assign	tmp_shift_15	=	{w13[31-15:0], w13[31:31-15+1]};
assign	tmp_shift_7		=	{w3[31-7:0],   w3[31:31-7+1]};
assign	data_for_p1		=	w0 ^ w7 ^ tmp_shift_15;
assign	data_after_p1	=	data_for_p1 ^ {data_for_p1[31-15:0], data_for_p1[31:31-15+1]} ^ {data_for_p1[31-23:0], data_for_p1[31:31-23+1]};
assign	word_update		=	data_after_p1 ^ tmp_shift_7 ^ w10;


always@(posedge clk_in)
	if(!reset_n_in)
		{w0, w1,  w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15}	<=	512'd0;
	else if(start_in)
		{w0, w1,  w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15}	<=	message_in;
	else if(working_en)
		{w0, w1,  w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15}	<=	{w1,  w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, word_update};
	else
		{w0, w1,  w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15}	<=	{w0, w1,  w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15};	


always@(posedge clk_in)
	if(!reset_n_in)
		begin
			word_p_out	<=	32'd0;
			word_out	<=	32'd0;
		end
	else if(working_en)
		begin
			word_p_out	<=	w0 ^ w4;
			word_out	<=	w0;
		end
	else
		begin
			word_p_out	<=	word_p_out;
			word_out	<=	word_out;
		end
	
	
	
always@(posedge clk_in)					
	if(!reset_n_in)
		current_state	<=	`IDLE;
	else
		current_state	<=	next_state;
		
always@(*)
	begin	
		next_state	=	`IDLE;
		case(current_state)
			`IDLE:
					if(start_in)
						next_state = `WORKING;
					else
						next_state = `IDLE;

			`WORKING:
					if(index_j_in == 'd63)
						next_state = `IDLE;
					else
						next_state = `WORKING;
			default:
					next_state = `IDLE;
		endcase
	end
	
always@(posedge clk_in)
	if(!reset_n_in)
		begin
			working_en				<=	1'b0;
			msg_exp_finished_out	<=	1'b0;
		end
	else 
		begin
			
			if(next_state == `WORKING)
				working_en <= 1'b1;
			else
				working_en	<=	1'b0;	
			
			if(current_state == `WORKING && next_state == `IDLE)
				msg_exp_finished_out	<=	'd1;
			else
				msg_exp_finished_out	<=	'd0;
		end
		
		
endmodule
	