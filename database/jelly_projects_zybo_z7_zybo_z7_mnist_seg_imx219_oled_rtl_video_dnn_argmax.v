// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//   math
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module video_dnn_argmax
		#(
			parameter	NUM_CALSS     = 10,
			parameter	COUNT_WIDTH   = 3,
			parameter	CHANNEL_WIDTH = (1 << COUNT_WIDTH) - 1,
			
			parameter	TUSER_WIDTH   = 1,
			parameter	TDATA_WIDTH   = NUM_CALSS * CHANNEL_WIDTH,
			parameter	TNUMBER_WIDTH = 4,
			
			parameter	M_SLAVE_REGS  = 1,
			parameter	M_MASTER_REGS = 1
		)
		(
			input	wire								aresetn,
			input	wire								aclk,
			input	wire								aclken,
			
			input	wire	[TUSER_WIDTH-1:0]			s_axi4s_tuser,
			input	wire								s_axi4s_tlast,
			input	wire	[NUM_CALSS*COUNT_WIDTH-1:0]	s_axi4s_tcount,
			input	wire	[TDATA_WIDTH-1:0]			s_axi4s_tdata,
			input	wire								s_axi4s_tvalid,
			output	wire								s_axi4s_tready,
			
			output	wire	[TUSER_WIDTH-1:0]			m_axi4s_tuser,
			output	wire								m_axi4s_tlast,
			output	wire	[TNUMBER_WIDTH-1:0]			m_axi4s_tnumber,
			output	wire	[COUNT_WIDTH-1:0]			m_axi4s_tcount,
			output	wire	[TDATA_WIDTH-1:0]			m_axi4s_tdata,
			output	wire								m_axi4s_tvalid,
			input	wire								m_axi4s_tready
		);
	
	
	wire							cke;
	
	wire	[TUSER_WIDTH-1:0]		argmax_tuser;
	wire							argmax_tlast;
	wire	[TNUMBER_WIDTH-1:0]		argmax_tnumber;
	wire	[COUNT_WIDTH-1:0]		argmax_tcount;
	wire	[TDATA_WIDTH-1:0]		argmax_tdata;
	wire							argmax_tvalid;
	
	
	// select max
	jelly_minmax
			#(
				.NUM				(NUM_CALSS),
				.COMMON_USER_WIDTH	(TUSER_WIDTH+1+TDATA_WIDTH),
				.USER_WIDTH			(0),
				.DATA_WIDTH			(COUNT_WIDTH),
				.DATA_SIGNED		(0),
				.CMP_MIN			(0),	// minかmaxか
				.CMP_EQ				(0)		// 同値のとき data0 と data1 どちらを優先するか
			)
		i_minmax
			(
				.reset				(~aresetn),
				.clk				(aclk),
				.cke				(cke),
				
				.s_common_user		({s_axi4s_tuser, s_axi4s_tlast, s_axi4s_tdata}),
				.s_user				(1'b0),
				.s_data				(s_axi4s_tcount),
				.s_en				({NUM_CALSS{1'b1}}),
				.s_valid			(s_axi4s_tvalid),
				
				.m_common_user		({argmax_tuser, argmax_tlast, argmax_tdata}),
				.m_user				(),
				.m_data				(argmax_tcount),
				.m_index			(argmax_tnumber),
				.m_en				(),
				.m_valid			(argmax_tvalid)
			);
	
	// output
	jelly_pipeline_insert_ff
			#(
				.DATA_WIDTH			(TUSER_WIDTH+1+TNUMBER_WIDTH+COUNT_WIDTH+TDATA_WIDTH),
				.SLAVE_REGS			(M_SLAVE_REGS),
				.MASTER_REGS		(M_MASTER_REGS)
			)
		i_pipeline_insert_ff
			(
				.reset				(~aresetn),
				.clk				(aclk),
				.cke				(aclken),
				
				.s_data				({argmax_tuser, argmax_tlast, argmax_tnumber, argmax_tcount, argmax_tdata}),
				.s_valid			(argmax_tvalid),
				.s_ready			(s_axi4s_tready),
				
				.m_data				({m_axi4s_tuser, m_axi4s_tlast, m_axi4s_tnumber, m_axi4s_tcount, m_axi4s_tdata}),
				.m_valid			(m_axi4s_tvalid),
				.m_ready			(m_axi4s_tready),
				
				.buffered			(),
				.s_ready_next		()
			);
	
	assign cke = s_axi4s_tready && aclken;
	
endmodule



`default_nettype wire



// end of file
