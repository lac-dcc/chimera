// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//   math
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module video_mnist
		#(
			parameter	DATA_WIDTH    = 8,
			parameter	MAX_X_NUM     = 1024,
			parameter	RAM_TYPE      = "block",
			
			parameter	IMG_Y_NUM     = 480,
			parameter	IMG_Y_WIDTH   = 12,
			
			parameter	TUSER_WIDTH   = 1,
			parameter	S_TDATA_WIDTH = 4*DATA_WIDTH,
			parameter	M_TDATA_WIDTH = 4*DATA_WIDTH,
			
			parameter	WB_ADR_WIDTH   = 8,
			parameter	WB_DAT_WIDTH   = 32,
			parameter	WB_SEL_WIDTH   = (WB_DAT_WIDTH / 8),
			parameter	INIT_PARAM_TH  = 127,
			parameter	INIT_PARAM_INV = 1'b0
		)
		(
			input	wire						aresetn,
			input	wire						aclk,
			
			input	wire	[TUSER_WIDTH-1:0]	s_axi4s_tuser,
			input	wire						s_axi4s_tlast,
			input	wire	[S_TDATA_WIDTH-1:0]	s_axi4s_tdata,
			input	wire						s_axi4s_tvalid,
			output	wire						s_axi4s_tready,
			
			output	wire	[TUSER_WIDTH-1:0]	m_axi4s_tuser,
			output	wire						m_axi4s_tlast,
			output	wire	[3:0]				m_axi4s_tnumber,
			output	wire	[1:0]				m_axi4s_tcount,
			output	wire	[0:0]				m_axi4s_tbinary,
			output	wire	[M_TDATA_WIDTH-1:0]	m_axi4s_tdata,
			output	wire						m_axi4s_tvalid,
			input	wire						m_axi4s_tready,
			
			input	wire						s_wb_rst_i,
			input	wire						s_wb_clk_i,
			input	wire	[WB_ADR_WIDTH-1:0]	s_wb_adr_i,
			input	wire	[WB_DAT_WIDTH-1:0]	s_wb_dat_i,
			output	wire	[WB_DAT_WIDTH-1:0]	s_wb_dat_o,
			input	wire						s_wb_we_i,
			input	wire	[WB_SEL_WIDTH-1:0]	s_wb_sel_i,
			input	wire						s_wb_stb_i,
			output	wire						s_wb_ack_o
		);
	
	localparam	USE_VALID  = 1;
	localparam	USER_WIDTH = TUSER_WIDTH > 1 ? TUSER_WIDTH - 1: 1;
	
	wire								reset = ~aresetn;
	wire								clk   = aclk;
	wire								cke;
	
	wire								src_img_line_first;
	wire								src_img_line_last;
	wire								src_img_pixel_first;
	wire								src_img_pixel_last;
	wire								src_img_de;
	wire	[USER_WIDTH-1:0]			src_img_user;
	wire	[S_TDATA_WIDTH-1:0]			src_img_data;
	wire								src_img_valid;
	
	wire								sink_img_line_first;
	wire								sink_img_line_last;
	wire								sink_img_pixel_first;
	wire								sink_img_pixel_last;
	wire								sink_img_de;
	wire	[USER_WIDTH-1:0]			sink_img_user;
	wire	[0:0]						sink_img_binary;
	wire	[3:0]						sink_img_number;
	wire	[1:0]						sink_img_count;
	wire	[DATA_WIDTH-1:0]			sink_img_raw;
	wire	[3*DATA_WIDTH-1:0]			sink_img_rgb;
	wire								sink_img_valid;
	
	
	
	// img
	jelly_axi4s_img
			#(
				.TUSER_WIDTH			(TUSER_WIDTH),
				.S_TDATA_WIDTH			(4*DATA_WIDTH),
				.M_TDATA_WIDTH			(2+4+1 + 4*DATA_WIDTH),
				.IMG_Y_NUM				(IMG_Y_NUM),
				.IMG_Y_WIDTH			(IMG_Y_WIDTH),
				.BLANK_Y_WIDTH			(8),
				.IMG_CKE_BUFG			(0)
			)
		jelly_axi4s_img
			(
				.reset					(reset),
				.clk					(clk),
				
				.param_blank_num		(8'h00),
				
				.s_axi4s_tdata			(s_axi4s_tdata),
				.s_axi4s_tlast			(s_axi4s_tlast),
				.s_axi4s_tuser			(s_axi4s_tuser),
				.s_axi4s_tvalid			(s_axi4s_tvalid),
				.s_axi4s_tready			(s_axi4s_tready),
				
				.m_axi4s_tdata			({m_axi4s_tnumber, m_axi4s_tcount, m_axi4s_tbinary, m_axi4s_tdata}),
				.m_axi4s_tlast			(m_axi4s_tlast),
				.m_axi4s_tuser			(m_axi4s_tuser),
				.m_axi4s_tvalid			(m_axi4s_tvalid),
				.m_axi4s_tready			(m_axi4s_tready),
				
				
				.img_cke				(cke),
				
				.src_img_line_first		(src_img_line_first),
				.src_img_line_last		(src_img_line_last),
				.src_img_pixel_first	(src_img_pixel_first),
				.src_img_pixel_last		(src_img_pixel_last),
				.src_img_de				(src_img_de),
				.src_img_user			(src_img_user),
				.src_img_data			(src_img_data),
				.src_img_valid			(src_img_valid),
				
				.sink_img_line_first	(sink_img_line_first),
				.sink_img_line_last		(sink_img_line_last),
				.sink_img_pixel_first	(sink_img_pixel_first),
				.sink_img_pixel_last	(sink_img_pixel_last),
				.sink_img_user			(sink_img_user),
				.sink_img_de			(sink_img_de),
				.sink_img_data			({sink_img_number, sink_img_count, sink_img_binary, sink_img_raw, sink_img_rgb}),
				.sink_img_valid			(sink_img_valid)
			);
	
	
	// MNIST
	img_mnist
			#(
				.USER_WIDTH			(USER_WIDTH + DATA_WIDTH),
				.DATA_WIDTH			(DATA_WIDTH),
				.MAX_X_NUM			(MAX_X_NUM),
				.RAM_TYPE			(RAM_TYPE),
				
				.WB_ADR_WIDTH		(WB_ADR_WIDTH),
				.WB_DAT_WIDTH		(WB_DAT_WIDTH),
				.WB_SEL_WIDTH		(WB_SEL_WIDTH),
				.INIT_PARAM_TH		(INIT_PARAM_TH),
				.INIT_PARAM_INV		(INIT_PARAM_INV)
			)
		i_img_mnist
			(
				.reset				(reset),
				.clk				(clk),
				.cke				(cke),
				
				.s_img_line_first	(src_img_line_first),
				.s_img_line_last	(src_img_line_last),
				.s_img_pixel_first	(src_img_pixel_first),
				.s_img_pixel_last	(src_img_pixel_last),
				.s_img_de			(src_img_de),
				.s_img_user			({src_img_user, src_img_data[3*DATA_WIDTH +: DATA_WIDTH]}),
				.s_img_data			(src_img_data[0 +: DATA_WIDTH*3]),
				.s_img_valid		(src_img_valid),
				
				.m_img_line_first	(sink_img_line_first),
				.m_img_line_last	(sink_img_line_last),
				.m_img_pixel_first	(sink_img_pixel_first),
				.m_img_pixel_last	(sink_img_pixel_last),
				.m_img_de			(sink_img_de),
				.m_img_user			({sink_img_user, sink_img_raw}),
				.m_img_data			(sink_img_rgb),
				.m_img_binary		(sink_img_binary),
				.m_img_count		(sink_img_count),
				.m_img_number		(sink_img_number),
				.m_img_valid		(sink_img_valid),
				
				.s_wb_rst_i			(s_wb_rst_i),
				.s_wb_clk_i			(s_wb_clk_i),
				.s_wb_adr_i			(s_wb_adr_i),
				.s_wb_dat_i			(s_wb_dat_i),
				.s_wb_dat_o			(s_wb_dat_o),
				.s_wb_we_i			(s_wb_we_i),
				.s_wb_sel_i			(s_wb_sel_i),
				.s_wb_stb_i			(s_wb_stb_i),
				.s_wb_ack_o			(s_wb_ack_o)
			);
	
	
endmodule



`default_nettype wire



// end of file
