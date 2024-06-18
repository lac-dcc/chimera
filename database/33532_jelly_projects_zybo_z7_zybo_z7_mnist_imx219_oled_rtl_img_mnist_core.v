// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//   image processing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module img_mnist_core
		#(
			parameter	USER_WIDTH = 0,
			parameter	MAX_X_NUM  = 1024,
			parameter	USE_VALID  = 0,
			parameter	RAM_TYPE   = "block",
			
			parameter	USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1
		)
		(
			input	wire							reset,
			input	wire							clk,
			input	wire							cke,
			
			input	wire							s_img_line_first,
			input	wire							s_img_line_last,
			input	wire							s_img_pixel_first,
			input	wire							s_img_pixel_last,
			input	wire							s_img_de,
			input	wire	[USER_BITS-1:0]			s_img_user,
			input	wire	[0:0]					s_img_data,
			input	wire							s_img_valid,
			
			output	wire							m_img_line_first,
			output	wire							m_img_line_last,
			output	wire							m_img_pixel_first,
			output	wire							m_img_pixel_last,
			output	wire							m_img_de,
			output	wire	[USER_BITS-1:0]			m_img_user,
			output	wire	[0:0]					m_img_data,
			output	wire	[3:0]					m_img_number,
			output	wire	[1:0]					m_img_count,
			output	wire							m_img_valid
		);
	
	
	wire							img_blk_line_first;
	wire							img_blk_line_last;
	wire							img_blk_pixel_first;
	wire							img_blk_pixel_last;
	wire							img_blk_de;
	wire	[USER_BITS-1:0]			img_blk_user;
	wire	[28*28-1:0]				img_blk_data;
	wire							img_blk_valid;
	
	jelly_img_blk_buffer
			#(
				.USER_WIDTH			(USER_WIDTH),
				.DATA_WIDTH			(1),
				.LINE_NUM			(28),
				.PIXEL_NUM			(28),
				.PIXEL_CENTER		(13),
				.LINE_CENTER		(13),
				.MAX_X_NUM			(MAX_X_NUM),
				.RAM_TYPE			(RAM_TYPE),
				.BORDER_MODE		("CONSTANT")	// ("REFLECT_101")
			)
		i_img_blk_buffer
			(
				.reset				(reset),
				.clk				(clk),
				.cke				(cke),
				
				.s_img_line_first	(s_img_line_first),
				.s_img_line_last	(s_img_line_last),
				.s_img_pixel_first	(s_img_pixel_first),
				.s_img_pixel_last	(s_img_pixel_last),
				.s_img_de			(s_img_de),
				.s_img_user			(s_img_user),
				.s_img_data			(s_img_data),
				.s_img_valid		(s_img_valid),
				
				.m_img_line_first	(img_blk_line_first),
				.m_img_line_last	(img_blk_line_last),
				.m_img_pixel_first	(img_blk_pixel_first),
				.m_img_pixel_last	(img_blk_pixel_last),
				.m_img_de			(img_blk_de),
				.m_img_user			(img_blk_user),
				.m_img_data			(img_blk_data),
				.m_img_valid		(img_blk_valid)
			);
	
	
	img_mnist_unit
			#(
				.USER_WIDTH(USER_WIDTH+6)
			)
		i_img_mnist_unit
			(
				.reset				(reset),
				.clk				(clk),
				.cke				(cke),
				
				.in_user			({
										img_blk_user,
										img_blk_data[13*28 + 13],
										img_blk_line_first,
										img_blk_line_last,
										img_blk_pixel_first,
										img_blk_pixel_last,
										img_blk_de
									}),
				.in_data			(img_blk_data),
				.in_valid			(img_blk_valid),
				
				.out_user			({
										m_img_user,
										m_img_data,
										m_img_line_first,
										m_img_line_last,
										m_img_pixel_first,
										m_img_pixel_last,
										m_img_de
									}),
				.out_count			(m_img_count),
				.out_number			(m_img_number),
				.out_valid			(m_img_valid)
			);
	
	
endmodule


`default_nettype wire


// end of file
