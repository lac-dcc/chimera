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
			parameter	MAX_X_NUM           = 1024,
			parameter	RAM_TYPE            = "block",
			
			parameter	NUM_CALSS           = 10,
			parameter	CHANNEL_WIDTH       = 7,
			parameter	NUMBER_WIDTH        = 4,
			parameter	COUNT_WIDTH         = 3,
			parameter	DETECT_WIDTH        = 1,
			parameter	INTEGRATION_WIDTH   = 8,
			
			parameter	IMG_X_NUM           = 640,
			parameter	IMG_Y_NUM           = 480,
			parameter	IMG_X_WIDTH         = 10,
			parameter	IMG_Y_WIDTH         = 10,
			
			parameter	TUSER_WIDTH         = 1,
			
			parameter	WB_ADR_WIDTH        = 8,
			parameter	WB_DAT_WIDTH        = 32,
			parameter	WB_SEL_WIDTH        = (WB_DAT_WIDTH / 8),
			parameter	WITH_DETECTOR       = 1,
			
			parameter	DEVICE              = "rtl",
			
			// local
			parameter	M_TDATA_WIDTH       = NUM_CALSS*CHANNEL_WIDTH,
			parameter	M_TNUMBER_WIDTH     = NUMBER_WIDTH,
			parameter	M_TCOUNT_WIDTH      = INTEGRATION_WIDTH,
			parameter	M_TDETECT_WIDTH     = INTEGRATION_WIDTH
		)
		(
			input	wire								aresetn,
			input	wire								aclk,
			
			input	wire	[TUSER_WIDTH-1:0]			s_axi4s_tuser,
			input	wire								s_axi4s_tlast,
			input	wire	[0:0]						s_axi4s_tdata,
			input	wire								s_axi4s_tvalid,
			output	wire								s_axi4s_tready,
			
			output	wire	[TUSER_WIDTH-1:0]			m_axi4s_tuser,
			output	wire								m_axi4s_tlast,
			output	wire	[M_TNUMBER_WIDTH-1:0]		m_axi4s_tnumber,
			output	wire	[M_TCOUNT_WIDTH-1:0]		m_axi4s_tcount,
			output	wire	[M_TDATA_WIDTH-1:0]			m_axi4s_tdata,
			output	wire	[M_TDETECT_WIDTH-1:0]		m_axi4s_tdetect,
			output	wire								m_axi4s_tvalid,
			input	wire								m_axi4s_tready,
			
			
			input	wire								s_wb_rst_i,
			input	wire								s_wb_clk_i,
			input	wire	[WB_ADR_WIDTH-1:0]			s_wb_adr_i,
			input	wire	[WB_DAT_WIDTH-1:0]			s_wb_dat_i,
			output	wire	[WB_DAT_WIDTH-1:0]			s_wb_dat_o,
			input	wire								s_wb_we_i,
			input	wire	[WB_SEL_WIDTH-1:0]			s_wb_sel_i,
			input	wire								s_wb_stb_i,
			output	wire								s_wb_ack_o
		);
	
	genvar							i;
	
	
	
	// DNN
	wire	[TUSER_WIDTH-1:0]		axi4s_dnn_tuser;
	wire							axi4s_dnn_tlast;
	wire	[M_TDATA_WIDTH-1:0]		axi4s_dnn_tdata;
	wire	[DETECT_WIDTH-1:0]		axi4s_dnn_tdetect;
	wire							axi4s_dnn_tvalid;
	wire							axi4s_dnn_tready;
	
	video_mnist_classifier_core
			#(
				.MAX_X_NUM			(MAX_X_NUM),
				.RAM_TYPE			(RAM_TYPE),
				
				.IMG_Y_NUM			(IMG_Y_NUM),
				.IMG_Y_WIDTH		(IMG_Y_WIDTH),
				
				.S_TDATA_WIDTH		(1),
				.M_TDATA_WIDTH		(M_TDATA_WIDTH),
				.TUSER_WIDTH		(TUSER_WIDTH),
				
				.DEVICE				(DEVICE)
			)
		i_video_mnist_classifier_core
			(
				.aresetn			(aresetn),
				.aclk				(aclk),
				
				.param_blank_num	(3),
				
				.s_axi4s_tuser		(s_axi4s_tuser),
				.s_axi4s_tlast		(s_axi4s_tlast),
				.s_axi4s_tdata		(s_axi4s_tdata),
				.s_axi4s_tvalid		(s_axi4s_tvalid),
				.s_axi4s_tready		(s_axi4s_tready),
				
				.m_axi4s_tuser		(axi4s_dnn_tuser),
				.m_axi4s_tlast		(axi4s_dnn_tlast),
				.m_axi4s_tdata		(axi4s_dnn_tdata),
				.m_axi4s_tvalid		(axi4s_dnn_tvalid),
				.m_axi4s_tready		(axi4s_dnn_tready)
			);
	
	generate
	if ( WITH_DETECTOR ) begin : blk_detector
		video_mnist_detector_core
				#(
					.MAX_X_NUM			(MAX_X_NUM),
					.RAM_TYPE			(RAM_TYPE),
					                     
					.IMG_Y_NUM			(IMG_Y_NUM),
					.IMG_Y_WIDTH		(IMG_Y_WIDTH),
					                     
					.S_TDATA_WIDTH		(1),
					.M_TDATA_WIDTH		(1),
					.TUSER_WIDTH		(TUSER_WIDTH),
					
					.DEVICE				(DEVICE)
				)
			i_video_mnist_detector_core
				(
					.aresetn			(aresetn),
					.aclk				(aclk),
					
					.param_blank_num	(3),
					
					.s_axi4s_tuser		(s_axi4s_tuser),
					.s_axi4s_tlast		(s_axi4s_tlast),
					.s_axi4s_tdata		(s_axi4s_tdata),
					.s_axi4s_tvalid		(s_axi4s_tvalid),
					.s_axi4s_tready		(),
					
					.m_axi4s_tuser		(),
					.m_axi4s_tlast		(),
					.m_axi4s_tdata		(axi4s_dnn_tdetect),
					.m_axi4s_tvalid		(),
					.m_axi4s_tready		(axi4s_dnn_tready)
				);
	end
	else begin : bypass_detector
		assign axi4s_dnn_tdetect = 1'b1;
	end
	endgenerate
	
	// count
	wire	[TUSER_WIDTH-1:0]			axi4s_count_tuser;
	wire								axi4s_count_tlast;
	wire	[NUM_CALSS*COUNT_WIDTH-1:0]	axi4s_count_tcount;
	wire	[M_TDATA_WIDTH-1:0]			axi4s_count_tdata;
	wire	[DETECT_WIDTH-1:0]			axi4s_count_tdetect;
	wire								axi4s_count_tvalid;
	wire								axi4s_count_tready;
	
	video_dnn_count
			#(
				.NUM_CALSS			(NUM_CALSS),
				.COUNT_WIDTH		(COUNT_WIDTH),
				.CHANNEL_WIDTH		(CHANNEL_WIDTH),
				.TUSER_WIDTH		(DETECT_WIDTH + TUSER_WIDTH),
				.M_SLAVE_REGS		(1),
				.M_MASTER_REGS		(1)
			)
		i_video_dnn_count
			(
				.aresetn			(aresetn),
				.aclk				(aclk),
				.aclken				(1'b1),
				
				.s_axi4s_tuser		({axi4s_dnn_tdetect, axi4s_dnn_tuser}),
				.s_axi4s_tlast		(axi4s_dnn_tlast),
				.s_axi4s_tdata		(axi4s_dnn_tdata),
				.s_axi4s_tvalid		(axi4s_dnn_tvalid),
				.s_axi4s_tready		(axi4s_dnn_tready),
				
				.m_axi4s_tuser		({axi4s_count_tdetect, axi4s_count_tuser}),
				.m_axi4s_tlast		(axi4s_count_tlast),
				.m_axi4s_tcount		(axi4s_count_tcount),
				.m_axi4s_tdata		(axi4s_count_tdata),
				.m_axi4s_tvalid		(axi4s_count_tvalid),
				.m_axi4s_tready		(axi4s_count_tready)
			);
	
	// 積分用にbit幅拡張
	wire	[NUM_CALSS*INTEGRATION_WIDTH-1:0]	axi4s_count_tcount_int;
	jelly_data_linear_expand
			#(
				.NUM				(NUM_CALSS),
				.IN_DATA_WIDTH		(COUNT_WIDTH),
				.OUT_DATA_WIDTH		(INTEGRATION_WIDTH)
			)
		i_data_linear_expand_tcount
			(
				.din				(axi4s_count_tcount),
				.dout				(axi4s_count_tcount_int)
			);
	
	wire	[INTEGRATION_WIDTH-1:0]				axi4s_count_tdetect_int;
	jelly_data_linear_expand
			#(
				.NUM				(1),
				.IN_DATA_WIDTH		(DETECT_WIDTH),
				.OUT_DATA_WIDTH		(INTEGRATION_WIDTH)
			)
		i_data_linear_expand_tdetect
			(
				.din				(axi4s_count_tdetect),
				.dout				(axi4s_count_tdetect_int)
			);
	
	
	// integrator
	wire	[TUSER_WIDTH-1:0]					axi4s_int_tuser;
	wire										axi4s_int_tlast;
	wire	[NUM_CALSS*INTEGRATION_WIDTH-1:0]	axi4s_int_tcount;
	wire	[M_TDATA_WIDTH-1:0]					axi4s_int_tdata;
	wire	[INTEGRATION_WIDTH-1:0]				axi4s_int_tdetect;
	wire										axi4s_int_tvalid;
	wire										axi4s_int_tready;
	
	wire	[31:0]			wb_int0_dat_o;
	wire					wb_int0_stb_i;
	wire					wb_int0_ack_o;
	
	jelly_video_integrator_bram
			#(
				.COMPONENT_NUM		(NUM_CALSS),
				.DATA_WIDTH			(INTEGRATION_WIDTH),
				.RATE_WIDTH			(INTEGRATION_WIDTH),
				.WB_ADR_WIDTH		(4),
				.WB_DAT_WIDTH		(WB_DAT_WIDTH),
				.WB_SEL_WIDTH		(WB_SEL_WIDTH),
				.TUSER_WIDTH		(M_TDATA_WIDTH+TUSER_WIDTH),
				.X_WIDTH			(8),
				.Y_WIDTH			(5),
				.MAX_X_NUM			(256),
				.MAX_Y_NUM			(64),
				.RAM_TYPE			("block"),
				.FILLMEM			(1),      
				.FILLMEM_DATA		(0),
				.ROUNDING			(1),
				.COMPACT			(0),
				.M_SLAVE_REGS		(0),
				.M_MASTER_REGS		(0),
				
				.INIT_PARAM_RATE	(0)
			)
		i_video_integrator_bram_classifier
			(
				.aresetn			(aresetn),
				.aclk				(aclk),
				.aclken				(1'b1),
				                     
				.s_wb_rst_i			(s_wb_rst_i),
				.s_wb_clk_i			(s_wb_clk_i),
				.s_wb_adr_i			(s_wb_adr_i[3:0]),
				.s_wb_dat_i			(s_wb_dat_i),
				.s_wb_dat_o			(wb_int0_dat_o),
				.s_wb_we_i			(s_wb_we_i),
				.s_wb_sel_i			(s_wb_sel_i),
				.s_wb_stb_i			(wb_int0_stb_i),
				.s_wb_ack_o			(wb_int0_ack_o),
				
				.s_axi4s_tuser		({axi4s_count_tdata, axi4s_count_tuser}),
				.s_axi4s_tlast		(axi4s_count_tlast),
				.s_axi4s_tdata		(axi4s_count_tcount_int),
				.s_axi4s_tvalid		(axi4s_count_tvalid),
				.s_axi4s_tready		(axi4s_count_tready),
				
				.m_axi4s_tuser		({axi4s_int_tdata, axi4s_int_tuser}),
				.m_axi4s_tlast		(axi4s_int_tlast),
				.m_axi4s_tdata		(axi4s_int_tcount),
				.m_axi4s_tvalid		(axi4s_int_tvalid),
				.m_axi4s_tready		(axi4s_int_tready)
			);
	
	
	wire	[31:0]			wb_int1_dat_o;
	wire					wb_int1_stb_i;
	wire					wb_int1_ack_o;
	
	jelly_video_integrator_bram
			#(
				.COMPONENT_NUM		(1),
				.DATA_WIDTH			(INTEGRATION_WIDTH),
				.RATE_WIDTH			(INTEGRATION_WIDTH),
				.WB_ADR_WIDTH		(4),
				.WB_DAT_WIDTH		(WB_DAT_WIDTH),
				.WB_SEL_WIDTH		(WB_SEL_WIDTH),
				.TUSER_WIDTH		(TUSER_WIDTH),
				.X_WIDTH			(8),
				.Y_WIDTH			(5),
				.MAX_X_NUM			(256),
				.MAX_Y_NUM			(64),
				.RAM_TYPE			("block"),
				.FILLMEM			(1),      
				.FILLMEM_DATA		(0),
				.ROUNDING			(1),
				.COMPACT			(0),
				.M_SLAVE_REGS		(0),
				.M_MASTER_REGS		(0),
				
				.INIT_PARAM_RATE	(0)
			)
		i_video_integrator_bram_detect
			(
				.aresetn			(aresetn),
				.aclk				(aclk),
				.aclken				(1'b1),
				                     
				.s_wb_rst_i			(s_wb_rst_i),
				.s_wb_clk_i			(s_wb_clk_i),
				.s_wb_adr_i			(s_wb_adr_i[3:0]),
				.s_wb_dat_i			(s_wb_dat_i),
				.s_wb_dat_o			(wb_int1_dat_o),
				.s_wb_we_i			(s_wb_we_i),
				.s_wb_sel_i			(s_wb_sel_i),
				.s_wb_stb_i			(wb_int1_stb_i),
				.s_wb_ack_o			(wb_int1_ack_o),
				
				.s_axi4s_tuser		(axi4s_count_tuser),
				.s_axi4s_tlast		(axi4s_count_tlast),
				.s_axi4s_tdata		(axi4s_count_tdetect_int),
				.s_axi4s_tvalid		(axi4s_count_tvalid & axi4s_count_tready),
				.s_axi4s_tready		(),
				
				.m_axi4s_tuser		(),
				.m_axi4s_tlast		(),
				.m_axi4s_tdata		(axi4s_int_tdetect),
				.m_axi4s_tvalid		(),
				.m_axi4s_tready		(axi4s_int_tready)
			);
	
	
	video_dnn_argmax
			#(
				.NUM_CALSS			(NUM_CALSS),
				.COUNT_WIDTH		(INTEGRATION_WIDTH),
				.CHANNEL_WIDTH		(CHANNEL_WIDTH),
				
				.TUSER_WIDTH		(M_TDETECT_WIDTH + TUSER_WIDTH),
				.TNUMBER_WIDTH		(M_TNUMBER_WIDTH),
				
				.M_SLAVE_REGS		(1),
				.M_MASTER_REGS		(1)
			)
		i_video_dnn_argmax
			(
				.aresetn			(aresetn),
				.aclk				(aclk),
				.aclken				(1'b1),
				
				.s_axi4s_tuser		({axi4s_int_tdetect, axi4s_int_tuser}),
				.s_axi4s_tlast		(axi4s_int_tlast),
				.s_axi4s_tcount		(axi4s_int_tcount),
				.s_axi4s_tdata		(axi4s_int_tdata),
				.s_axi4s_tvalid		(axi4s_int_tvalid),
				.s_axi4s_tready		(axi4s_int_tready),
				
				.m_axi4s_tuser		({m_axi4s_tdetect, m_axi4s_tuser}),
				.m_axi4s_tlast		(m_axi4s_tlast),
				.m_axi4s_tnumber	(m_axi4s_tnumber),
				.m_axi4s_tcount		(m_axi4s_tcount),
				.m_axi4s_tdata		(m_axi4s_tdata),
				.m_axi4s_tvalid		(m_axi4s_tvalid),
				.m_axi4s_tready		(m_axi4s_tready)
			);
	
	assign wb_int0_stb_i = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:4] == 0);
	assign wb_int1_stb_i = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:4] == 1);
	
	
	assign s_wb_dat_o    = wb_int0_stb_i   ? wb_int0_dat_o  :
	                       wb_int1_stb_i   ? wb_int1_dat_o  :
	                       32'h0000_0000;
	
	assign s_wb_ack_o    = wb_int0_stb_i   ? wb_int0_ack_o  :
	                       wb_int1_stb_i   ? wb_int1_ack_o  :
	                       s_wb_stb_i;
	
endmodule



`default_nettype wire



// end of file
