/*
 * File: tb_SM3_top.v
 * Project: tb
 * File Created: Sunday, 5th August 2018 9:03:57 am
 * Author: Chen Rui (raymond.rui.chen@qq.com>)
 * -----
 * Last Modified: Sunday, 5th August 2018 9:13:44 am
 * Modified By: Chen Rui (raymond.rui.chen@qq.com>)
 * -----
 * Copyright (c) 2018 - Chen Rui
 * All rights reserved.
 */
module tb_SM3_top;

reg						clk_in,
						reset_n_in,
						SM3_en_in;
reg		[31: 0]			msg_in;	
reg						msg_valid_in;
reg						is_last_word_in;	
reg		[1:0]			last_word_byte_in;	



wire	[255 : 0]		sm3_result_out;		
wire					sm3_finished_out;	

always #3 clk_in = ~clk_in;


initial
	begin
		clk_in				=	0;
		reset_n_in			=	0;
		SM3_en_in			=	0;
		msg_in				=	0;	
		msg_valid_in		=	0;
        is_last_word_in		=	0;	
        last_word_byte_in	=	0;
		#11
		reset_n_in			=	1;
		#22
		SM3_en_in			=	1;
		#44
		repeat(15) begin
			@(posedge clk_in) 
				begin 
					msg_valid_in 		= 1; 
					msg_in		 		= 32'h61626364;	
				end	
			end
		@(posedge clk_in) 
			begin 
				msg_valid_in 		= 1; 
				msg_in		 		= 32'h61626364;	
				is_last_word_in		=	1;
				last_word_byte_in	=	2'b11;				
			end		
		@(posedge clk_in) 
			begin 
				msg_valid_in 		= 0; 
				msg_in		 		= 0;	
				is_last_word_in		=	0;
				last_word_byte_in	=	0;
			end	
		wait(sm3_finished_out)
		#500
		@(posedge clk_in)
			SM3_en_in	=	0;		
		$stop;
	end

		
always@(*)		
	if(sm3_finished_out)
		begin
			$display("\n");
			$display("\n");		
			$display("     +--------------------------------------------------------------------------------------------+" );
			$display("     |  HASH of input message is %64h|!", sm3_result_out);
			$display("     +--------------------------------------------------------------------------------------------+" );
			if(sm3_result_out == 256'hdebe9ff9_2275b8a1_38604889_c18e5a4d_6fdb70e5_387e5765_293dcba3_9c0c5732)
				begin
					$display("\n");
					$display("\n");
					$display("     +---------------------------------------------+ ");
					$display("     |  HASH is the same with the expected value ! | ");
					$display("     |  TEST SUCESSFUL !                           | ");
					$display("     +---------------------------------------------+ ");
					$display("\n");
					$display("\n");					
				end
			else				
					$display("unexpected results, ERROR!");
			
		end

		
SM3_top uut
	(
		.clk_in(clk_in),
		.reset_n_in(reset_n_in),
		.SM3_en_in(SM3_en_in),
		.msg_in(msg_in),
		.msg_valid_in(msg_valid_in),
		.is_last_word_in(is_last_word_in),
		.last_word_byte_in(last_word_byte_in),
		.sm3_result_out(sm3_result_out),
		.sm3_finished_out(sm3_finished_out)
	);

endmodule