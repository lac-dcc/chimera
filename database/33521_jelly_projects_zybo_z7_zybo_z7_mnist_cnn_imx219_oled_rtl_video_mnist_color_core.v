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


module video_mnist_color_core
		#(
			parameter	RAW_WIDTH     = 10,
			parameter	DATA_WIDTH    = 8,
			parameter	TUSER_WIDTH   = 1,
			parameter	TNUMBER_WIDTH = 4,
			parameter	TCOUNT_WIDTH  = 8,
			parameter	TDETECT_WIDTH = 8
		)
		(
			input	wire							aresetn,
			input	wire							aclk,
			
			input	wire	[1:0]					param_mode,
			input	wire	[3:0]					param_sel,
			input	wire	[TCOUNT_WIDTH-1:0]		param_th_count,
			input	wire	[TDETECT_WIDTH-1:0]		param_th_detect,
			
			input	wire	[24:0]					param_color0,
			input	wire	[24:0]					param_color1,
			input	wire	[24:0]					param_color2,
			input	wire	[24:0]					param_color3,
			input	wire	[24:0]					param_color4,
			input	wire	[24:0]					param_color5,
			input	wire	[24:0]					param_color6,
			input	wire	[24:0]					param_color7,
			input	wire	[24:0]					param_color8,
			input	wire	[24:0]					param_color9,
			
			input	wire	[TUSER_WIDTH-1:0]		s_axi4s_tuser,
			input	wire							s_axi4s_tlast,
			input	wire	[TNUMBER_WIDTH-1:0]		s_axi4s_tnumber,
			input	wire	[TCOUNT_WIDTH-1:0]		s_axi4s_tcount,
			input	wire	[RAW_WIDTH-1:0]			s_axi4s_traw,
			input	wire	[1*DATA_WIDTH-1:0]		s_axi4s_tgray,
			input	wire	[3*DATA_WIDTH-1:0]		s_axi4s_trgb,
			input	wire	[0:0]					s_axi4s_tbinary,
			input	wire	[TDETECT_WIDTH-1:0]		s_axi4s_tdetect,
			input	wire							s_axi4s_tvalid,
			output	wire							s_axi4s_tready,
			
			output	wire	[TUSER_WIDTH-1:0]		m_axi4s_tuser,
			output	wire							m_axi4s_tlast,
			output	wire	[3*DATA_WIDTH-1:0]		m_axi4s_tdata,
			output	wire							m_axi4s_tvalid,
			input	wire							m_axi4s_tready
		);
	
	localparam TDATA_WIDTH = 3*DATA_WIDTH;
	
	
	
	reg								st0_en0;
	reg								st0_en1;
	reg		[TUSER_WIDTH-1:0]		st0_tuser;
	reg								st0_tlast;
	reg		[TNUMBER_WIDTH-1:0]		st0_tnumber;
	reg		[TCOUNT_WIDTH-1:0]		st0_tcount;
	reg		[RAW_WIDTH-1:0]			st0_traw;
	reg		[1*DATA_WIDTH-1:0]		st0_tgray;
	reg		[3*DATA_WIDTH-1:0]		st0_trgb;
	reg		[0:0]					st0_tbinary;
	reg		[TDETECT_WIDTH-1:0]		st0_tdetect;
	reg								st0_tvalid;
	
	reg		[TUSER_WIDTH-1:0]		st1_tuser;
	reg								st1_tlast;
	reg		[TDATA_WIDTH-1:0]		st1_tdata;
	reg								st1_en0;
	reg								st1_en1;
	reg								st1_cmask;
	reg		[23:0]					st1_color;
	reg								st1_tvalid;
	
	reg		[TUSER_WIDTH-1:0]		st2_tuser;
	reg								st2_tlast;
	reg		[TDATA_WIDTH-1:0]		st2_tdata;
	reg								st2_tvalid;
	
	always @(posedge aclk) begin
		if ( s_axi4s_tready ) begin
			// stage 0
			st0_en0         <= (s_axi4s_tcount >= param_th_count);
			st0_en1         <= (s_axi4s_tdetect >= param_th_detect);
			st0_tuser       <= s_axi4s_tuser;
			st0_tlast       <= s_axi4s_tlast;
			st0_tnumber     <= s_axi4s_tnumber;
			st0_tcount      <= s_axi4s_tcount;
			st0_traw        <= s_axi4s_traw;
			st0_tgray       <= s_axi4s_tgray;
			st0_trgb        <= s_axi4s_trgb;
			st0_tbinary     <= s_axi4s_tbinary;
			st0_tdetect     <= s_axi4s_tdetect;
			
			
			// stage1
			st1_en0         <= st0_en0;
			st1_en1         <= st0_en1;
			st1_tuser       <= st0_tuser;
			st1_tlast       <= st0_tlast;
			
			case ( param_sel )
			4'd0: 		st1_tdata <= st0_trgb;
			4'd1: 		st1_tdata <= {TDATA_WIDTH{st0_tdetect}};
			4'd2: 		st1_tdata <= {TDATA_WIDTH{st0_tbinary}};
			4'd3: 		st1_tdata <= {3{st0_tgray}};
			4'd4: 		st1_tdata <= {3{st0_traw[9:2]}};
			4'd5: 		st1_tdata <= st0_traw;
			4'd6: 		st1_tdata <= {TDATA_WIDTH{st0_en0}};
			4'd7: 		st1_tdata <= {TDATA_WIDTH{st0_en1}};
			4'd8: 		st1_tdata <= {TDATA_WIDTH{1'b0}};
			4'd9: 		st1_tdata <= {TDATA_WIDTH{1'b1}};
			4'd10: 		st1_tdata <= 24'h00_40_00;
			4'd11: 		st1_tdata <= 24'h00_00_40;
			4'd12: 		st1_tdata <= 24'h40_00_00;
			4'd13: 		st1_tdata <= 24'h40_40_40;
			default:	st1_tdata <= st0_trgb;
			endcase
			
			st1_cmask <= 1'b0;
			case ( st0_tnumber )
			4'd0:		{st1_cmask, st1_color} <= param_color0;
			4'd1:		{st1_cmask, st1_color} <= param_color1;
			4'd2:		{st1_cmask, st1_color} <= param_color2;
			4'd3:		{st1_cmask, st1_color} <= param_color3;
			4'd4:		{st1_cmask, st1_color} <= param_color4;
			4'd5:		{st1_cmask, st1_color} <= param_color5;
			4'd6:		{st1_cmask, st1_color} <= param_color6;
			4'd7:		{st1_cmask, st1_color} <= param_color7;
			4'd8:		{st1_cmask, st1_color} <= param_color8;
			4'd9:		{st1_cmask, st1_color} <= param_color9;
			default:	{st1_cmask, st1_color} <= 25'h1_xx_xx_xx;
			endcase
			
			// stage2
			st2_tuser   <= st1_tuser;
			st2_tlast   <= st1_tlast;
			st2_tdata   <= st1_tdata;
			if ( (param_mode[0] && st1_en0 && !st1_cmask) && (~param_mode[1] || st1_en1) ) begin
				st2_tdata <= {st1_color[7:0], st1_color[15:8], st1_color[23:16]};
			end
		end
	end
	
	always @(posedge aclk) begin
		if ( ~aresetn ) begin
			st0_tvalid  <= 1'b0;
			st1_tvalid  <= 1'b0;
			st2_tvalid  <= 1'b0;
		end
		else if ( s_axi4s_tready ) begin
			st0_tvalid   <= s_axi4s_tvalid;
			st1_tvalid  <= st0_tvalid;
			st2_tvalid  <= st1_tvalid;
		end
	end
	
	
	assign s_axi4s_tready = (m_axi4s_tready || !m_axi4s_tvalid);
	
	assign m_axi4s_tuser  = st2_tuser;
	assign m_axi4s_tlast  = st2_tlast;
	assign m_axi4s_tdata  = st2_tdata;
	assign m_axi4s_tvalid = st2_tvalid;
	
endmodule



`default_nettype wire



// end of file
