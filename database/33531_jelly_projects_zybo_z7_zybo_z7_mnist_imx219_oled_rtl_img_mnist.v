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


module img_mnist
		#(
			parameter	USER_WIDTH       = 0,
			parameter	DATA_WIDTH       = 8,
			parameter	MAX_X_NUM        = 1024,
			parameter	USE_VALID        = 0,
			parameter	RAM_TYPE         = "block",
			
			parameter	WB_ADR_WIDTH     = 8,
			parameter	WB_DAT_WIDTH     = 32,
			parameter	WB_SEL_WIDTH     = (WB_DAT_WIDTH / 8),
			parameter	INIT_PARAM_TH    = 127,
			parameter	INIT_PARAM_INV   = 1'b0,
			
			parameter	USER_BITS        = USER_WIDTH > 0 ? USER_WIDTH : 1
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
			input	wire	[3*DATA_WIDTH-1:0]		s_img_data,
			input	wire							s_img_valid,
			
			output	wire							m_img_line_first,
			output	wire							m_img_line_last,
			output	wire							m_img_pixel_first,
			output	wire							m_img_pixel_last,
			output	wire							m_img_de,
			output	wire	[USER_BITS-1:0]			m_img_user,
			output	wire	[3*DATA_WIDTH-1:0]		m_img_data,
			output	wire	[0:0]					m_img_binary,
			output	wire	[1:0]					m_img_count,
			output	wire	[3:0]					m_img_number,
			output	wire							m_img_valid,
			
			input	wire							s_wb_rst_i,
			input	wire							s_wb_clk_i,
			input	wire	[WB_ADR_WIDTH-1:0]		s_wb_adr_i,
			input	wire	[WB_DAT_WIDTH-1:0]		s_wb_dat_i,
			output	wire	[WB_DAT_WIDTH-1:0]		s_wb_dat_o,
			input	wire							s_wb_we_i,
			input	wire	[WB_SEL_WIDTH-1:0]		s_wb_sel_i,
			input	wire							s_wb_stb_i,
			output	wire							s_wb_ack_o
		);
	
	
	wire							gray_line_first;
	wire							gray_line_last;
	wire							gray_pixel_first;
	wire							gray_pixel_last;
	wire							gray_de;
	wire	[USER_BITS-1:0]			gray_user;
	wire	[3*DATA_WIDTH-1:0]		gray_rgb;
	wire	[DATA_WIDTH-1:0]		gray_gray;
	wire							gray_valid;
	
	jelly_img_rgb_to_gray
			#(
				.USER_WIDTH				(USER_WIDTH),
				.DATA_WIDTH				(DATA_WIDTH)
			)
		i_img_rgb_to_gray
			(
				.reset					(reset),
				.clk					(clk),
				.cke					(cke),
				
				.s_img_line_first		(s_img_line_first),
				.s_img_line_last		(s_img_line_last),
				.s_img_pixel_first		(s_img_pixel_first),
				.s_img_pixel_last		(s_img_pixel_last),
				.s_img_de				(s_img_de),
				.s_img_user				(s_img_user),
				.s_img_rgb				(s_img_data),
				.s_img_valid			(s_img_valid),
				
				.m_img_line_first		(gray_line_first),
				.m_img_line_last		(gray_line_last),
				.m_img_pixel_first		(gray_pixel_first),
				.m_img_pixel_last		(gray_pixel_last),
				.m_img_de				(gray_de),
				.m_img_user				(gray_user),
				.m_img_rgb				(gray_rgb),
				.m_img_gray				(gray_gray),
				.m_img_valid			(gray_valid)
			);
	
	
	wire							binarizer_line_first;
	wire							binarizer_line_last;
	wire							binarizer_pixel_first;
	wire							binarizer_pixel_last;
	wire							binarizer_de;
	wire	[USER_BITS-1:0]			binarizer_user;
	wire	[3*DATA_WIDTH-1:0]		binarizer_rgb;
	wire	[DATA_WIDTH-1:0]		binarizer_data;
	wire							binarizer_binary;
	wire							binarizer_valid;
	jelly_img_binarizer
			#(
				.USER_WIDTH				(USER_WIDTH + 3*DATA_WIDTH),
				.DATA_WIDTH				(DATA_WIDTH),
				.WB_ADR_WIDTH			(WB_ADR_WIDTH),
				.WB_DAT_WIDTH			(WB_DAT_WIDTH),
				.WB_SEL_WIDTH			(WB_SEL_WIDTH),
				.INIT_PARAM_TH			(INIT_PARAM_TH),
				.INIT_PARAM_INV			(INIT_PARAM_INV)
			)
		i_img_binarizer
			(
				.reset					(reset),
				.clk					(clk),
				.cke					(cke),
				
				.s_img_line_first		(gray_line_first),
				.s_img_line_last		(gray_line_last),
				.s_img_pixel_first		(gray_pixel_first),
				.s_img_pixel_last		(gray_pixel_last),
				.s_img_de				(gray_de),
				.s_img_user				({gray_user, gray_rgb}),
				.s_img_data				(gray_gray),
				.s_img_valid			(gray_valid),
				
				.m_img_line_first		(binarizer_line_first),
				.m_img_line_last		(binarizer_line_last),
				.m_img_pixel_first		(binarizer_pixel_first),
				.m_img_pixel_last		(binarizer_pixel_last),
				.m_img_de				(binarizer_de),
				.m_img_user				({binarizer_user, binarizer_rgb}),
				.m_img_data				(),
				.m_img_binary			(binarizer_binary),
				.m_img_valid			(binarizer_valid),
				
				.s_wb_rst_i				(s_wb_rst_i),
				.s_wb_clk_i				(s_wb_clk_i),
				.s_wb_adr_i				(s_wb_adr_i),
				.s_wb_dat_i				(s_wb_dat_i),
				.s_wb_dat_o				(s_wb_dat_o),
				.s_wb_we_i				(s_wb_we_i),
				.s_wb_sel_i				(s_wb_sel_i),
				.s_wb_stb_i				(s_wb_stb_i),
				.s_wb_ack_o				(s_wb_ack_o)
			);
	
	
	img_mnist_core
			#(
				.USER_WIDTH				(USER_WIDTH + 3*DATA_WIDTH),
				.MAX_X_NUM				(MAX_X_NUM),
				.RAM_TYPE				(RAM_TYPE)
			)
		i_img_mnist_core
			(
				.reset					(reset),
				.clk					(clk),
				.cke					(cke),
				
				.s_img_line_first		(binarizer_line_first),
				.s_img_line_last		(binarizer_line_last),
				.s_img_pixel_first		(binarizer_pixel_first),
				.s_img_pixel_last		(binarizer_pixel_last),
				.s_img_de				(binarizer_de),
				.s_img_user				({binarizer_user, binarizer_rgb}),
				.s_img_data				(binarizer_binary),
				.s_img_valid			(binarizer_valid),
				
				.m_img_line_first		(m_img_line_first),
				.m_img_line_last		(m_img_line_last),
				.m_img_pixel_first		(m_img_pixel_first),
				.m_img_pixel_last		(m_img_pixel_last),
				.m_img_de				(m_img_de),
				.m_img_user				({m_img_user, m_img_data}),
				.m_img_data				(m_img_binary),
				.m_img_number			(m_img_number),
				.m_img_count			(m_img_count),
				.m_img_valid			(m_img_valid)
			);
	
	
endmodule


`default_nettype wire


// end of file
