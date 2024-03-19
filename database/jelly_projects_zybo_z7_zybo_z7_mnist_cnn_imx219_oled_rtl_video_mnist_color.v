// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//   math
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module video_mnist_color
		#(
			parameter	RAW_WIDTH            = 10,
			parameter	DATA_WIDTH           = 8,
			parameter	TUSER_WIDTH          = 1,
			parameter	TNUMBER_WIDTH        = 4,
			parameter	TCOUNT_WIDTH         = 8,
			parameter	TDETECT_WIDTH        = 8,
		
			parameter	WB_ADR_WIDTH         = 8,
			parameter	WB_DAT_WIDTH         = 32,
			parameter	WB_SEL_WIDTH         = (WB_DAT_WIDTH / 8),
			parameter	INIT_PARAM_MODE      = 2'b11,
			parameter	INIT_PARAM_SEL       = 0,
			parameter	INIT_PARAM_TH_COUNT  = 127,
			parameter	INIT_PARAM_TH_DETECT = 127
		)
		(
			input	wire							aresetn,
			input	wire							aclk,
			
			input	wire	[TUSER_WIDTH-1:0]		s_axi4s_tuser,
			input	wire							s_axi4s_tlast,
			input	wire	[TNUMBER_WIDTH-1:0]		s_axi4s_tnumber,
			input	wire	[TCOUNT_WIDTH-1:0]		s_axi4s_tcount,
			input	wire	[RAW_WIDTH-1:0]			s_axi4s_traw,
			input	wire	[DATA_WIDTH-1:0]		s_axi4s_tgray,
			input	wire	[3*DATA_WIDTH-1:0]		s_axi4s_trgb,
			input	wire	[0:0]					s_axi4s_tbinary,
			input	wire	[TDETECT_WIDTH-1:0]		s_axi4s_tdetect,
			input	wire							s_axi4s_tvalid,
			output	wire							s_axi4s_tready,
			
			output	wire	[TUSER_WIDTH-1:0]		m_axi4s_tuser,
			output	wire							m_axi4s_tlast,
			output	wire	[3*DATA_WIDTH-1:0]		m_axi4s_tdata,
			output	wire							m_axi4s_tvalid,
			input	wire							m_axi4s_tready,
			
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
	
	
	reg		[1:0]					reg_param_mode;
	reg		[TCOUNT_WIDTH-1:0]		reg_param_th_count;
	reg		[3:0]					reg_param_sel;
	reg		[TDETECT_WIDTH-1:0]		reg_param_th_detect;
	
	reg		[24:0]					reg_param_color0;
	reg		[24:0]					reg_param_color1;
	reg		[24:0]					reg_param_color2;
	reg		[24:0]					reg_param_color3;
	reg		[24:0]					reg_param_color4;
	reg		[24:0]					reg_param_color5;
	reg		[24:0]					reg_param_color6;
	reg		[24:0]					reg_param_color7;
	reg		[24:0]					reg_param_color8;
	reg		[24:0]					reg_param_color9;
	
	always @(posedge s_wb_clk_i) begin
		if ( s_wb_rst_i ) begin
			reg_param_mode      <= INIT_PARAM_MODE;
			reg_param_sel       <= INIT_PARAM_SEL;
			reg_param_th_count  <= INIT_PARAM_TH_COUNT;
			reg_param_th_detect <= INIT_PARAM_TH_DETECT;
			
			reg_param_color0    <= 25'h0_00_00_00;	// 黒
			reg_param_color1    <= 25'h0_00_00_80;	// 茶
			reg_param_color2    <= 25'h0_00_00_ff;	// 赤
			reg_param_color3    <= 25'h0_4c_b7_ff;	// 橙
			reg_param_color4    <= 25'h0_00_ff_ff;	// 黄
			reg_param_color5    <= 25'h0_00_80_00;	// 緑
			reg_param_color6    <= 25'h0_ff_00_00;	// 青
			reg_param_color7    <= 25'h0_80_00_80;	// 紫
			reg_param_color8    <= 25'h0_80_80_80;	// 灰
			reg_param_color9    <= 25'h0_ff_ff_ff;	// 白
		end
		else begin
			if ( s_wb_stb_i && s_wb_we_i ) begin
				case ( s_wb_adr_i )
				32'h00:	reg_param_mode      <= s_wb_dat_i;
				32'h01:	reg_param_sel       <= s_wb_dat_i;
				32'h02:	reg_param_th_count  <= s_wb_dat_i;
				32'h03:	reg_param_th_detect <= s_wb_dat_i;
				32'h10:	reg_param_color0    <= s_wb_dat_i;
				32'h11:	reg_param_color1    <= s_wb_dat_i;
				32'h12:	reg_param_color2    <= s_wb_dat_i;
				32'h13:	reg_param_color3    <= s_wb_dat_i;
				32'h14:	reg_param_color4    <= s_wb_dat_i;
				32'h15:	reg_param_color5    <= s_wb_dat_i;
				32'h16:	reg_param_color6    <= s_wb_dat_i;
				32'h17:	reg_param_color7    <= s_wb_dat_i;
				32'h18:	reg_param_color8    <= s_wb_dat_i;
				32'h19:	reg_param_color9    <= s_wb_dat_i;
				endcase
			end
		end
	end
	
	assign s_wb_dat_o = (s_wb_adr_i == 32'h00) ? reg_param_mode      :
	                    (s_wb_adr_i == 32'h01) ? reg_param_sel       :
	                    (s_wb_adr_i == 32'h02) ? reg_param_th_count  :
	                    (s_wb_adr_i == 32'h03) ? reg_param_th_detect :
	                    (s_wb_adr_i == 32'h10) ? reg_param_color0    :
	                    (s_wb_adr_i == 32'h11) ? reg_param_color1    :
	                    (s_wb_adr_i == 32'h12) ? reg_param_color2    :
	                    (s_wb_adr_i == 32'h13) ? reg_param_color3    :
	                    (s_wb_adr_i == 32'h14) ? reg_param_color4    :
	                    (s_wb_adr_i == 32'h15) ? reg_param_color5    :
	                    (s_wb_adr_i == 32'h16) ? reg_param_color6    :
	                    (s_wb_adr_i == 32'h17) ? reg_param_color7    :
	                    (s_wb_adr_i == 32'h18) ? reg_param_color8    :
	                    (s_wb_adr_i == 32'h19) ? reg_param_color9    :
	                    0;
	assign s_wb_ack_o = s_wb_stb_i;
	
	
	video_mnist_color_core
			#(
				.RAW_WIDTH				(RAW_WIDTH),
				.DATA_WIDTH				(DATA_WIDTH),
				.TUSER_WIDTH			(TUSER_WIDTH),
				.TNUMBER_WIDTH			(TNUMBER_WIDTH),
				.TCOUNT_WIDTH			(TCOUNT_WIDTH),
				.TDETECT_WIDTH			(TDETECT_WIDTH)
			)
		i_video_mnist_color_core
			(
				.aresetn				(aresetn),
				.aclk					(aclk),
				
				.param_mode				(reg_param_mode),
				.param_th_count			(reg_param_th_count),
				.param_sel				(reg_param_sel),
				.param_th_detect		(reg_param_th_detect),
				
				.param_color0			(reg_param_color0),
				.param_color1			(reg_param_color1),
				.param_color2			(reg_param_color2),
				.param_color3			(reg_param_color3),
				.param_color4			(reg_param_color4),
				.param_color5			(reg_param_color5),
				.param_color6			(reg_param_color6),
				.param_color7			(reg_param_color7),
				.param_color8			(reg_param_color8),
				.param_color9			(reg_param_color9),
				
				
				.s_axi4s_tuser			(s_axi4s_tuser),
				.s_axi4s_tlast			(s_axi4s_tlast),
				.s_axi4s_tnumber		(s_axi4s_tnumber),
				.s_axi4s_tcount			(s_axi4s_tcount),
				.s_axi4s_traw			(s_axi4s_traw),
				.s_axi4s_tgray			(s_axi4s_tgray),
				.s_axi4s_trgb			(s_axi4s_trgb),
				.s_axi4s_tbinary		(s_axi4s_tbinary),
				.s_axi4s_tdetect		(s_axi4s_tdetect),
				.s_axi4s_tvalid			(s_axi4s_tvalid),
				.s_axi4s_tready			(s_axi4s_tready),
				
				.m_axi4s_tuser			(m_axi4s_tuser),
				.m_axi4s_tlast			(m_axi4s_tlast),
				.m_axi4s_tdata			(m_axi4s_tdata),
				.m_axi4s_tvalid			(m_axi4s_tvalid),
				.m_axi4s_tready			(m_axi4s_tready)
			);
	
	
endmodule



`default_nettype wire



// end of file
