// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//   math
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module video_dnn_count
		#(
			parameter	NUM_CALSS     = 10,
			parameter	COUNT_WIDTH   = 3,
			parameter	CHANNEL_WIDTH = (1 << COUNT_WIDTH) - 1,
			
			parameter	TUSER_WIDTH   = 1,
			
			parameter	M_SLAVE_REGS  = 1,
			parameter	M_MASTER_REGS = 1,
			
			// local
			parameter	TDATA_WIDTH   = NUM_CALSS * CHANNEL_WIDTH,
			parameter	TCOUNT_WIDTH  = NUM_CALSS * COUNT_WIDTH
		)
		(
			input	wire							aresetn,
			input	wire							aclk,
			input	wire							aclken,
			
			input	wire	[TUSER_WIDTH-1:0]		s_axi4s_tuser,
			input	wire							s_axi4s_tlast,
			input	wire	[TDATA_WIDTH-1:0]		s_axi4s_tdata,
			input	wire							s_axi4s_tvalid,
			output	wire							s_axi4s_tready,
			
			output	wire	[TUSER_WIDTH-1:0]		m_axi4s_tuser,
			output	wire							m_axi4s_tlast,
			output	wire	[TCOUNT_WIDTH-1:0]		m_axi4s_tcount,
			output	wire	[TDATA_WIDTH-1:0]		m_axi4s_tdata,
			output	wire							m_axi4s_tvalid,
			input	wire							m_axi4s_tready
		);
	
	
	wire						cke;
	
	// counting
	integer						i, j;
	integer						sum;
	
	reg							reg_tlast;
	reg		[TUSER_WIDTH-1:0]	reg_tuser;
	reg		[TDATA_WIDTH-1:0]	reg_tdata;
	reg		[TCOUNT_WIDTH-1:0]	reg_tcount;
	reg							reg_tvalid;
	
	always @(posedge aclk) begin
		if( ~aresetn ) begin
			reg_tlast  <= 1'bx;
			reg_tuser  <= {TUSER_WIDTH{1'bx}};
			reg_tcount <= {TCOUNT_WIDTH{1'bx}};
			reg_tvalid <= 1'b0;
		end
		else if ( cke ) begin
			reg_tlast <= s_axi4s_tlast;
			reg_tuser <= s_axi4s_tuser;
			reg_tdata <= s_axi4s_tdata;
			for ( i = 0; i < NUM_CALSS; i = i+1 ) begin
				sum = 0;
				for ( j = 0; j < CHANNEL_WIDTH; j = j+1 ) begin
					sum = sum + s_axi4s_tdata[j*NUM_CALSS + i];
				end
				reg_tcount[COUNT_WIDTH*i +: COUNT_WIDTH] <= sum;
			end
			reg_tvalid  <= s_axi4s_tvalid;
		end
	end
	
	
	// output
	jelly_pipeline_insert_ff
			#(
				.DATA_WIDTH			(TUSER_WIDTH+1+TCOUNT_WIDTH+TDATA_WIDTH),
				.SLAVE_REGS			(M_SLAVE_REGS),
				.MASTER_REGS		(M_MASTER_REGS)
			)
		i_pipeline_insert_ff
			(
				.reset				(~aresetn),
				.clk				(aclk),
				.cke				(aclken),
				
				.s_data				({reg_tuser, reg_tlast, reg_tcount, reg_tdata}),
				.s_valid			(reg_tvalid),
				.s_ready			(s_axi4s_tready),
				
				.m_data				({m_axi4s_tuser, m_axi4s_tlast, m_axi4s_tcount, m_axi4s_tdata}),
				.m_valid			(m_axi4s_tvalid),
				.m_ready			(m_axi4s_tready),
				
				.buffered			(),
				.s_ready_next		()
			);
	
	assign cke = s_axi4s_tready && aclken;
	
	
endmodule



`default_nettype wire



// end of file
