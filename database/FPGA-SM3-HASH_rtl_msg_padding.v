// This program was cloned from: https://github.com/raymondrc/FPGA-SM3-HASH
// License: MIT License

/*
 * File: msg_padding.v
 * Project: rtl
 * File Created: Sunday, 5th August 2018 9:03:57 am
 * Author: Chen Rui (raymond.rui.chen@qq.com>)
 * -----
 * Last Modified: Sunday, 5th August 2018 9:12:47 am
 * Modified By: Chen Rui (raymond.rui.chen@qq.com>)
 * -----
 * Copyright (c) 2018 - Chen Rui
 * All rights reserved.
 */
module msg_padding
#(
	parameter	WIDTH = 32
)
	(
		clk_in,
		reset_n_in,
		SM3_en_in,
		padding_en_in,
		msg_in,
		msg_valid_in,
		is_last_word_in,
		last_word_byte_in,
		is_1st_msg_block_out,
		msg_padded_out,
		padding_1_block_finished_out,
		padding_all_finished_out
	);
	
`define		IDLE					5'd0
`define		DIRECT_PASS				5'd1
`define		CASE1					5'd2
`define		CASE2_2B00				5'd3
`define		CASE2_2B01				5'd4
`define		CASE2_2B10				5'd5
`define		CASE2_2B11				5'd6
`define		CASE2_2B11_S			5'd7
`define		CASE3_2B00				5'd8
`define		CASE3_2B01				5'd9
`define		CASE3_2B10				5'd10
`define		CASE3_2B11				5'd11
`define		CASE3_2B11_S			5'd12
`define		SPECIAL_ALL_ZERO		5'd13
`define		CASE4_2B11_S			5'd14
`define		SPECIAL_80_ZERO			5'd15
`define		FINISH_GENERAL			5'd16
`define		FINISH_SPECIAL_ALL_ZERO	5'd17	
`define		FINISH_80_ZERO			5'd18

input					clk_in,
						reset_n_in,
						SM3_en_in,
						padding_en_in;		
input	[WIDTH - 1 : 0]	msg_in;				
input					msg_valid_in;		
input					is_last_word_in;	
input	[1:0]			last_word_byte_in;	//2'b00, |X|0|0|0|; 
											//2'b01, |X|X|0|0|;
											//2'b10, |X|X|X|0|;
											//2'b11, |X|X|X|X|
output	[511:0]			msg_padded_out;		
output					padding_1_block_finished_out;
output					padding_all_finished_out;
output					is_1st_msg_block_out;

reg		[4:0]			current_state,
						next_state;				
reg		[511:0]			msg_padded_out;
reg		[31:0]			tmp_0,
						tmp_1,
						tmp_2,
						tmp_3,
						tmp_4,
						tmp_5,
						tmp_6,
						tmp_7,
						tmp_8,
						tmp_9,
						tmp_a,
						tmp_b,
						tmp_c,
						tmp_d,
						tmp_e,
						tmp_f;
reg		[3:0]			count;
reg						count_enable;
reg		[8:0]			bit_count;
reg		[54:0]			block_count;
reg		[31:0]			next_input_data;
reg						padding_1_block_finished_out;
reg						padding_all_finished_out;
wire	[511:0]			data_concatenation;
reg		[63:0]			msg_length;
reg						special_zero;		
reg						special_80;		

assign	is_1st_msg_block_out = block_count == 'd0; 
	
assign	data_concatenation	=	{
									tmp_0,
									tmp_1,
									tmp_2,
									tmp_3,
									tmp_4,
									tmp_5,
									tmp_6,
									tmp_7,
									tmp_8,
									tmp_9,
									tmp_a,
									tmp_b,
									tmp_c,
									tmp_d,
									tmp_e,
									tmp_f
								};
								
always@(*)
	if(current_state == `FINISH_GENERAL ||
		special_zero ||
		special_80)
		msg_length = {block_count,9'd0} +  {55'b0,bit_count};
	else
		msg_length = 'd0;

reg						reg_msg_valid;
wire					valid_data_start;
reg						reg_is_last_word;
reg		[1:0]			reg_last_word_byte;
						
always@(posedge clk_in)
	if(!reset_n_in)
		reg_msg_valid	<=	'd0;
	else 
		reg_msg_valid	<=	msg_valid_in;
		
		
always@(posedge clk_in)
	if(!reset_n_in)
		reg_is_last_word	<=	'd0;
	else 
		reg_is_last_word	<=	is_last_word_in;
		

always@(posedge clk_in)
	if(!reset_n_in)
		reg_last_word_byte	<=	'd0;
	else 
		reg_last_word_byte	<=	last_word_byte_in;
		
		
assign	valid_data_start = reg_msg_valid == 1'b0 && msg_valid_in == 1'b1;
	
always@(posedge clk_in)
if(!reset_n_in)
	begin
		tmp_0	<=	32'd0;
		tmp_1	<=	32'd0;
		tmp_2	<=	32'd0;
		tmp_3	<=	32'd0;
		tmp_4	<=	32'd0;
		tmp_5	<=	32'd0;
		tmp_6	<=	32'd0;
		tmp_7	<=	32'd0;
		tmp_8	<=	32'd0;
		tmp_9	<=	32'd0;
		tmp_a	<=	32'd0;
		tmp_b	<=	32'd0;
		tmp_c	<=	32'd0;
		tmp_d	<=	32'd0;
        tmp_e	<=	32'd0;
        tmp_f	<=	32'd0;
    end
else if(count_enable)
	begin  
		case(count)
			4'h0:	tmp_0	<=	next_input_data;
			4'h1:	tmp_1	<=	next_input_data;
			4'h2:	tmp_2	<=	next_input_data;
			4'h3:	tmp_3	<=	next_input_data;
			4'h4:	tmp_4	<=	next_input_data;
			4'h5:	tmp_5	<=	next_input_data;
			4'h6:	tmp_6	<=	next_input_data;
			4'h7:	tmp_7	<=	next_input_data;
			4'h8:	tmp_8	<=	next_input_data;
			4'h9:	tmp_9	<=	next_input_data;
			4'ha:	tmp_a	<=	next_input_data;
			4'hb:	tmp_b	<=	next_input_data;
			4'hc:	tmp_c	<=	next_input_data;
			4'hd:	tmp_d	<=	next_input_data;
			4'he:	tmp_e	<=	next_input_data;
			4'hf:	tmp_f	<=	next_input_data;
		endcase
	end
else
	begin
		tmp_0	<=	tmp_0;
	    tmp_1	<=  tmp_1;
	    tmp_2	<=  tmp_2;
	    tmp_3	<=  tmp_3;
	    tmp_4	<=  tmp_4;
	    tmp_5	<=  tmp_5;
	    tmp_6	<=  tmp_6;
	    tmp_7	<=  tmp_7;
	    tmp_8	<=  tmp_8;
	    tmp_9	<=  tmp_9;
	    tmp_a	<=  tmp_a;
	    tmp_b	<=  tmp_b;
	    tmp_c	<=  tmp_c;
	    tmp_d	<=  tmp_d;
	    tmp_e	<=  tmp_e;
	    tmp_f	<=  tmp_f;
	end

always@(*)
if(padding_1_block_finished_out)
	begin
		if(current_state == `FINISH_GENERAL)
			msg_padded_out	=	{data_concatenation[511:64], msg_length};
		else if(special_zero)
			msg_padded_out	=	{448'd0, msg_length};		
		else if(special_80)
			msg_padded_out	=	{32'h8000_0000, 416'd0, msg_length};
		else
			msg_padded_out	=	data_concatenation;
	end
else
		msg_padded_out	=	'd0;
		
always@(posedge clk_in)
	if(!reset_n_in)
		count	<=	'd0;
	else if(count_enable)
		count	<=	count + 1'b1;			
	else
		count	<=	'd0;
		
reg		is_last_block;		
always@(posedge clk_in)
	if(!reset_n_in)
		is_last_block 	<=	1'b0;
	else if(reg_is_last_word)	
		is_last_block	<=	1'b1;
	else if(count == 'd15)
		is_last_block	<=	1'b0;
	else
		is_last_block	<=	is_last_block;
		
always@(posedge clk_in)
	if(!reset_n_in)
		block_count	<=	'd0;
	else if(count == 'd15 && !is_last_block)
		block_count	<=	block_count + 1'b1;
	else
		block_count	<=	block_count;
	
always@(posedge clk_in)
	if(!reset_n_in)
		bit_count	<=	'd0;
	else if(reg_is_last_word)
		bit_count	<=	{count, 5'd0} +  {4'd0,reg_last_word_byte,3'd0}+9'b0_0000_1000;
	else
		bit_count	<=	bit_count;
							

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
					if(padding_en_in)
						next_state	=	`DIRECT_PASS;
					else
						next_state	=	`IDLE;
			`DIRECT_PASS:
					if(!reg_is_last_word && count == 'd15)	
						next_state	=	`CASE1;
					else if(reg_is_last_word && (count <'d13 || (count == 'd13 && reg_last_word_byte != 2'b11)))
						begin
							case(last_word_byte_in)
								2'b00:	next_state = `CASE2_2B00;
								2'b01:	next_state = `CASE2_2B01;
								2'b10:	next_state = `CASE2_2B10;
								2'b11:	next_state = `CASE2_2B11;
							endcase
						end
					else if(reg_is_last_word && ((count == 'd13 && reg_last_word_byte == 2'b11) ||
												 count == 'd14 ||
												 (count == 'd15 && reg_last_word_byte == 2'b00) ||
												 (count == 'd15 && reg_last_word_byte == 2'b01) ||
												 (count == 'd15 && reg_last_word_byte == 2'b10))
							)
						begin
							case(reg_last_word_byte)
								2'b00:	next_state = `CASE3_2B00;
								2'b01:	next_state = `CASE3_2B01;
								2'b10:	next_state = `CASE3_2B10;
								2'b11:	next_state = `CASE3_2B11;
							endcase
						end								
					else if(reg_is_last_word && count == 'd15 && reg_last_word_byte == 2'b11)
						next_state	=	`CASE4_2B11_S;
					else
						next_state = `DIRECT_PASS;
			`CASE1:
				next_state = `IDLE;
			
			`CASE2_2B00:
				if(count == 4'd15)
					next_state = `FINISH_GENERAL;
				else
					next_state = `CASE2_2B00;
					
			`CASE2_2B01:
				if(count == 4'd15)
					next_state = `FINISH_GENERAL;
				else
					next_state = `CASE2_2B01;
			`CASE2_2B10:
				if(count == 4'd15)
					next_state = `FINISH_GENERAL;
				else
					next_state = `CASE2_2B10;					
			`CASE2_2B11:
				next_state	=	`CASE2_2B11_S;
			
			`CASE2_2B11_S:
				if(count == 'd15)
					next_state = `FINISH_GENERAL;
				else
					next_state = `CASE2_2B11_S;					
			
			`CASE3_2B00:
				if(count == 'd15)
					next_state = `SPECIAL_ALL_ZERO;
				else
					next_state = `CASE3_2B00;					
			`CASE3_2B01:
				if(count == 'd15)
					next_state = `SPECIAL_ALL_ZERO;
				else
					next_state = `CASE3_2B01;
			`CASE3_2B10:
				if(count == 'd15)
					next_state = `SPECIAL_ALL_ZERO;
				else
					next_state = `CASE3_2B10;
					
			`CASE3_2B11:
					next_state = `CASE3_2B11_S;
					
			`CASE3_2B11_S:
				if(count == 'd15)
					next_state = `SPECIAL_ALL_ZERO;
				else
					next_state = `CASE3_2B11_S;	
					
			`CASE4_2B11_S:
					next_state = `SPECIAL_80_ZERO;
			
			`FINISH_GENERAL:
					next_state = `IDLE;
			
					
			`SPECIAL_ALL_ZERO:
					if(padding_en_in)
						next_state	=	`IDLE;
					else
						next_state	=	`SPECIAL_ALL_ZERO;
						
			`SPECIAL_80_ZERO:
					if(padding_en_in)
						next_state	=	`IDLE;
					else
						next_state	=	`SPECIAL_80_ZERO;
			default:
					next_state	=	`IDLE;
		endcase
	end

always@(posedge clk_in)	
	if(count == 'd15)
		padding_1_block_finished_out	<=	1'b1;
	else if(
				(current_state == `SPECIAL_ALL_ZERO && padding_en_in) ||
				(current_state == `SPECIAL_80_ZERO && padding_en_in) 
			)
		padding_1_block_finished_out	<=	1'b1;
	else
		padding_1_block_finished_out	<=	1'b0;	

	
	
always@(posedge clk_in)
	if(!reset_n_in)
		begin
			count_enable					<=	1'b0;
			next_input_data					<=	'd0;
			padding_all_finished_out		<=	1'b0;
			special_zero					<=	1'b0;
			special_80						<=	1'b0;
		end
	else
		begin			
			if(current_state == `SPECIAL_ALL_ZERO)	
				special_zero	<=	1'b1;
			else
				special_zero	<=	1'b0;
				
			if(current_state == `SPECIAL_80_ZERO)	
				special_80	<=	1'b1;
			else
				special_80	<=	1'b0;			
				
			if(current_state == `DIRECT_PASS  && msg_valid_in == 1'b1)
				count_enable	<=	1'b1;
			else if(count == 'd15
					)
				count_enable	<=	1'b0;
			else
				count_enable	<=	count_enable;

				
			case(current_state)
				`DIRECT_PASS:
								if(msg_valid_in && is_last_word_in && last_word_byte_in ==  2'b00)
									next_input_data	<=	{msg_in[31:24],8'h80, 16'h0};
								else if(msg_valid_in && is_last_word_in && last_word_byte_in ==  2'b01)
									next_input_data	<=	{msg_in[31:16],8'h80, 8'h0};
								else if(msg_valid_in && is_last_word_in && last_word_byte_in ==  2'b10)
									next_input_data	<=	{msg_in[31:8],8'h80};
								else
									next_input_data	<=	msg_in;
				`CASE2_2B11_S:	next_input_data	<=	32'h8000_0000;
				`CASE3_2B11_S:  next_input_data	<=	32'h8000_0000;
				default:		next_input_data	<=	msg_valid_in == 1'b1 ? msg_in : 'd0;
			endcase	
						
			if(
				(current_state == `CASE2_2B00 && next_state == `FINISH_GENERAL) ||
				(current_state == `CASE2_2B01 && next_state == `FINISH_GENERAL) ||
				(current_state == `CASE2_2B10 && next_state == `FINISH_GENERAL) ||
				(current_state == `CASE2_2B11_S && next_state == `FINISH_GENERAL) ||
				(current_state == `SPECIAL_ALL_ZERO && next_state == `IDLE) ||
				(current_state == `SPECIAL_80_ZERO && next_state == `IDLE)
			)
				padding_all_finished_out	<=	1'b1;
			else if(SM3_en_in == 1'b0)
				padding_all_finished_out	<=	1'b0;
			else
				padding_all_finished_out	<=	padding_all_finished_out;			
						
		end
		

		
endmodule