/*
 * File: compression_function.v
 * Project: rtl
 * File Created: Sunday, 5th August 2018 9:03:57 am
 * Author: Chen Rui (raymond.rui.chen@qq.com>)
 * -----
 * Last Modified: Sunday, 5th August 2018 9:12:25 am
 * Modified By: Chen Rui (raymond.rui.chen@qq.com>)
 * -----
 * Copyright (c) 2018 - Chen Rui
 * All rights reserved.
 */
module compression_function
	(
		clk_in,
		reset_n_in,
		start_in,
		index_j_in,
		is_1st_msg_block_in,
		word_expanded_p_in,
		word_expanded_in,		
		data_after_cf_out
	);
	
`define	IDLE	2'b00
`define	LOAD	2'b01
`define	WORKING	2'b10	
	
input					clk_in;
input					reset_n_in;
input					start_in;
input	[5  : 0]		index_j_in;
input	[31 : 0]		word_expanded_p_in;
input	[31 : 0]		word_expanded_in;
input					is_1st_msg_block_in;

output	reg[255: 0]		data_after_cf_out;
reg						msg_cf_finished;

reg		[31 : 0]	reg_a;
reg		[31 : 0]	reg_b;
reg		[31 : 0]	reg_c;
reg		[31 : 0]	reg_d;
reg		[31 : 0]	reg_e;
reg		[31 : 0]	reg_f;
reg		[31 : 0]	reg_g;
reg		[31 : 0]	reg_h;

wire	[31 : 0]	tmp_for_ss1_0;
wire	[31 : 0]	TJ;
wire	[5  : 0]	J_mod;
wire	[31 : 0]	tmp_for_ss1_1;
wire	[31 : 0]	tmp_for_ss1_2;
wire	[31 : 0]	ss1;
wire	[31 : 0]	ss2;
wire	[31 : 0]	tmp_for_tt1_0;
wire	[31 : 0]	tmp_for_tt1_1;
wire	[31 : 0]	tt1;
wire	[31 : 0]	tmp_for_tt2_0;
wire	[31 : 0]	tmp_for_tt2_1;
wire	[31 : 0]	tt2;
wire	[31 : 0]	tt2_after_p0;


wire	[255:0]		data;

reg		[1:0]		current_state,
					next_state;
reg					working_en;	
reg					load_en;		
wire	[31:0]		tmp_a,
					tmp_b,
					tmp_c,
					tmp_d,
					tmp_e,
					tmp_f,
					tmp_g,
					tmp_h;
reg					reg_is_1st_msg_block2;
reg					reg_is_1st_msg_block;


always@(posedge clk_in)					
	if(!reset_n_in)
		reg_is_1st_msg_block2	<= 1'b0;
	else
		reg_is_1st_msg_block2	<=	is_1st_msg_block_in;
		
		
always@(posedge clk_in)					
	if(!reset_n_in)
		reg_is_1st_msg_block	<= 1'b0;
	else
		reg_is_1st_msg_block	<=	reg_is_1st_msg_block2;
				

assign	tmp_for_ss1_0	=	{reg_a[31-12:0], reg_a[31:31-12+1]} + reg_e;
assign	TJ				=	index_j_in < 16 ? 32'h79cc4519  : 32'h7a879d8a;
assign	J_mod			=	index_j_in < 6'd32 ? index_j_in	:  index_j_in - 6'd32;
assign	tmp_for_ss1_2	=	tmp_for_ss1_0 + tmp_for_ss1_1;
assign	ss1				=	{tmp_for_ss1_2[31 - 7 : 0], tmp_for_ss1_2[31 : 31 - 7 + 1]};
assign	ss2				=	ss1 ^ {reg_a[31 - 12 : 0], reg_a[31 : 31 - 12 + 1]};
assign	tmp_for_tt1_0	=	index_j_in < 16 ? reg_a ^ reg_b ^ reg_c : (reg_a & reg_b | reg_a & reg_c | reg_b & reg_c);
assign	tmp_for_tt1_1	=	reg_d + ss2 + word_expanded_p_in;
assign	tt1				=	tmp_for_tt1_0 + tmp_for_tt1_1;
assign	tmp_for_tt2_0	=	index_j_in < 16 ? reg_e ^ reg_f ^ reg_g : (reg_e & reg_f | ~reg_e & reg_g);
assign	tmp_for_tt2_1	=	reg_h + ss1 + word_expanded_in;
assign	tt2				=	tmp_for_tt2_0 + tmp_for_tt2_1;
assign	tt2_after_p0	=	tt2 ^ {tt2[31-9:0], tt2[31:31-9+1]} ^ {tt2[31-17:0], tt2[31:31-17+1]};


assign	is_1st_data_block	=	load_en == 1'b1 && index_j_in == 'd0;
assign	data	=	is_1st_data_block 
					? data_after_cf_out 
					: {reg_a,reg_b,reg_c,reg_d,reg_e,reg_f,reg_g,reg_h};
					
assign	{tmp_a, tmp_b, tmp_c, tmp_d, tmp_e, tmp_f, tmp_g, tmp_h} = data;


always@(posedge clk_in)
	if(!reset_n_in)
		begin
			reg_a	<=	'd0;
			reg_b	<=	'd0;
			reg_c	<=	'd0;
			reg_d	<=	'd0;
			reg_e	<=	'd0;
			reg_f	<=	'd0;
			reg_g	<=	'd0;
			reg_h	<=	'd0;
		end
	else if(load_en && reg_is_1st_msg_block)
		begin
			reg_a	<=	32'h7380166f;
			reg_b	<=	32'h4914b2b9;
			reg_c	<=	32'h172442d7;
			reg_d	<=	32'hda8a0600;
			reg_e	<=	32'ha96f30bc;
			reg_f	<=	32'h163138aa;
			reg_g	<=	32'he38dee4d;
			reg_h	<=	32'hb0fb0e4e;		
		end
	else if(load_en &&!reg_is_1st_msg_block)
		begin
			reg_a	<=	tmp_a;
			reg_b	<=	tmp_b;
			reg_c	<=	tmp_c;
			reg_d	<=	tmp_d;
			reg_e	<=	tmp_e;
			reg_f	<=	tmp_f;
			reg_g	<=	tmp_g;
			reg_h	<=	tmp_h;
		end	
	else if(working_en)
		begin
			reg_d	<=	reg_c;
			reg_c	<=	{reg_b[31 - 9 : 0], reg_b[31 : 31 - 9 + 1]};
			reg_b 	<=	reg_a;
			reg_a	<=	tt1;
			reg_h	<=	reg_g;
			reg_g	<=	{reg_f[31 - 19 : 0], reg_f[31 : 31 - 19 + 1]};
			reg_f	<=	reg_e;
			reg_e	<=	tt2_after_p0;
		end
	else
		begin
			reg_a	<=	reg_a;
			reg_b	<=	reg_b;
			reg_c	<=	reg_c;
			reg_d	<=	reg_d;
			reg_e	<=	reg_e;
			reg_f	<=	reg_f;
			reg_g	<=	reg_g;
			reg_h	<=	reg_h;
		end			


always@(posedge clk_in)
	if(!reset_n_in)
		data_after_cf_out	<=	'd0;
	else if(is_1st_data_block && reg_is_1st_msg_block)
		data_after_cf_out	<=	{32'h7380166f, 32'h4914b2b9, 32'h172442d7, 32'hda8a0600, 32'ha96f30bc, 32'h163138aa, 32'he38dee4d, 32'hb0fb0e4e};
	else if(msg_cf_finished == 1'b1)
		data_after_cf_out	<=	{reg_a,reg_b,reg_c,reg_d,reg_e,reg_f,reg_g,reg_h} ^ data_after_cf_out;
	else
		data_after_cf_out	<=	data_after_cf_out;
		

barrel_shifter u_barrel_shifter
	(
		.data_in(TJ),
		.shift_number_in(J_mod[4:0]),
		.data_after_shift_out(tmp_for_ss1_1)
	);


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
						next_state = `LOAD;
					else
						next_state = `IDLE;
			`LOAD:
					next_state = `WORKING;
					
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
			msg_cf_finished	<=	1'b0;
		end
	else 
		begin
			
			if(current_state == `IDLE && next_state == `LOAD)
				load_en	<=	1'b1;
			else
				load_en	<=	1'b0;
			
			if(next_state == `WORKING)
				working_en <= 1'b1;
			else
				working_en	<=	1'b0;	
			
			if(current_state == `WORKING && next_state == `IDLE)
				msg_cf_finished	<=	'd1;
			else
				msg_cf_finished	<=	'd0;
		end


		
endmodule
	