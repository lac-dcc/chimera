// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License



`timescale 1ns / 1ps
`default_nettype none



module sampler_unit
		#(
			parameter	AXI4_ID_WIDTH     = 6,
			parameter	AXI4_ADDR_WIDTH   = 32,
			parameter	AXI4_DATA_SIZE    = 2,	// 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
			parameter	AXI4_DATA_WIDTH   = (8 << AXI4_DATA_SIZE),
			parameter	AXI4_LEN_WIDTH    = 8,
			parameter	AXI4_QOS_WIDTH    = 4,
			parameter	AXI4_ARID         = {AXI4_ID_WIDTH{1'b0}},
			parameter	AXI4_ARSIZE       = AXI4_DATA_SIZE,
			parameter	AXI4_ARBURST      = 2'b01,
			parameter	AXI4_ARLOCK       = 1'b0,
			parameter	AXI4_ARCACHE      = 4'b0001,
			parameter	AXI4_ARPROT       = 3'b000,
			parameter	AXI4_ARQOS        = 0,
			parameter	AXI4_ARREGION     = 4'b0000,
			
			parameter	WB_ADR_WIDTH      = 8,
			parameter	WB_DAT_WIDTH      = 32,
			parameter	WB_SEL_WIDTH      = (WB_DAT_WIDTH / 8),
			
			parameter	INIT_PARAM_ADDR   = 32'h1800_0000,
			parameter	INIT_PARAM_STRIDE = 4096,
			
			parameter	INIT_MATRIX00     = 32'h3fc00000,
			parameter	INIT_MATRIX01     = 32'h00000000,
			parameter	INIT_MATRIX02     = 32'hc3283b18,
			parameter	INIT_MATRIX10     = 32'h3eaaaaaa,
			parameter	INIT_MATRIX11     = 32'h3f5db3d9,
			parameter	INIT_MATRIX12     = 32'hc2d55554,
			parameter	INIT_MATRIX20     = 32'h3ab60b5f,
			parameter	INIT_MATRIX21     = 32'h80000000,
			parameter	INIT_MATRIX22     = 32'h3ed7d979,
			
			parameter	EXP_WIDTH         = 8,
			parameter	FRAC_WIDTH        = 23,
			parameter	FLOAT_WIDTH       = 1 + EXP_WIDTH + FRAC_WIDTH,	// sign + exp + frac
			
			parameter	DST_X_WIDTH       = 10,
			parameter	DST_Y_WIDTH       = 10,
			parameter	DST_X_NUM         = 640,
			parameter	DST_Y_NUM         = 480,
			parameter	SRC_X_WIDTH       = 10,
			parameter	SRC_Y_WIDTH       = 10,
			parameter	SRC_X_NUM         = 640,
			parameter	SRC_Y_NUM         = 480
		)
		(
			input	wire							reset,
			input	wire							clk,
			input	wire							cke,
			
			output	wire	[AXI4_ID_WIDTH-1:0]		m_axi4_arid,
			output	wire	[AXI4_ADDR_WIDTH-1:0]	m_axi4_araddr,
			output	wire	[AXI4_LEN_WIDTH-1:0]	m_axi4_arlen,
			output	wire	[2:0]					m_axi4_arsize,
			output	wire	[1:0]					m_axi4_arburst,
			output	wire	[0:0]					m_axi4_arlock,
			output	wire	[3:0]					m_axi4_arcache,
			output	wire	[2:0]					m_axi4_arprot,
			output	wire	[AXI4_QOS_WIDTH-1:0]	m_axi4_arqos,
			output	wire	[3:0]					m_axi4_arregion,
			output	wire							m_axi4_arvalid,
			input	wire							m_axi4_arready,
			input	wire	[AXI4_ID_WIDTH-1:0]		m_axi4_rid,
			input	wire	[AXI4_DATA_WIDTH-1:0]	m_axi4_rdata,
			input	wire	[1:0]					m_axi4_rresp,
			input	wire							m_axi4_rlast,
			input	wire							m_axi4_rvalid,
			output	wire							m_axi4_rready,
			
			input	wire							m_axi4s_aresetn,
			input	wire							m_axi4s_aclk,
			output	wire	[AXI4_DATA_WIDTH-1:0]	m_axi4s_tdata,
			output	wire							m_axi4s_tlast,
			output	wire	[0:0]					m_axi4s_tuser,
			output	wire							m_axi4s_tvalid,
			input	wire							m_axi4s_tready,
			
			// WISHBONE (register access)
			input	wire							s_wb_rst_i,
			input	wire							s_wb_clk_i,
			input	wire	[WB_ADR_WIDTH-1:0]		s_wb_adr_i,
			output	wire	[WB_DAT_WIDTH-1:0]		s_wb_dat_o,
			input	wire	[WB_DAT_WIDTH-1:0]		s_wb_dat_i,
			input	wire							s_wb_we_i,
			input	wire	[WB_SEL_WIDTH-1:0]		s_wb_sel_i,
			input	wire							s_wb_stb_i,
			output	wire							s_wb_ack_o
		);
	
	localparam	REGOFFSET_INIT_MATRIX00 = 32'h0000_0020 >> 2;
	localparam	REGOFFSET_INIT_MATRIX01 = 32'h0000_0024 >> 2;
	localparam	REGOFFSET_INIT_MATRIX02 = 32'h0000_0028 >> 2;
	localparam	REGOFFSET_INIT_MATRIX10 = 32'h0000_0030 >> 2;
	localparam	REGOFFSET_INIT_MATRIX11 = 32'h0000_0034 >> 2;
	localparam	REGOFFSET_INIT_MATRIX12 = 32'h0000_0038 >> 2;
	localparam	REGOFFSET_INIT_MATRIX20 = 32'h0000_0040 >> 2;
	localparam	REGOFFSET_INIT_MATRIX21 = 32'h0000_0044 >> 2;
	localparam	REGOFFSET_INIT_MATRIX22 = 32'h0000_0048 >> 2;
	
	reg		[31:0]		reg_matrix00;
	reg		[31:0]		reg_matrix01;
	reg		[31:0]		reg_matrix02;
	reg		[31:0]		reg_matrix10;
	reg		[31:0]		reg_matrix11;
	reg		[31:0]		reg_matrix12;
	reg		[31:0]		reg_matrix20;
	reg		[31:0]		reg_matrix21;
	reg		[31:0]		reg_matrix22;
	
	always @(posedge s_wb_clk_i ) begin
		if ( s_wb_rst_i ) begin
			reg_matrix00 <= INIT_MATRIX00;
			reg_matrix01 <= INIT_MATRIX01;
			reg_matrix02 <= INIT_MATRIX02;
			reg_matrix10 <= INIT_MATRIX10;
			reg_matrix11 <= INIT_MATRIX11;
			reg_matrix12 <= INIT_MATRIX12;
			reg_matrix20 <= INIT_MATRIX20;
			reg_matrix21 <= INIT_MATRIX21;
			reg_matrix22 <= INIT_MATRIX22;
		end
		else if ( s_wb_stb_i && s_wb_we_i ) begin
			case ( s_wb_adr_i )
			REGOFFSET_INIT_MATRIX00: reg_matrix00 <= s_wb_dat_i;
			REGOFFSET_INIT_MATRIX01: reg_matrix01 <= s_wb_dat_i;
			REGOFFSET_INIT_MATRIX02: reg_matrix02 <= s_wb_dat_i;
			REGOFFSET_INIT_MATRIX10: reg_matrix10 <= s_wb_dat_i;
			REGOFFSET_INIT_MATRIX11: reg_matrix11 <= s_wb_dat_i;
			REGOFFSET_INIT_MATRIX12: reg_matrix12 <= s_wb_dat_i;
			REGOFFSET_INIT_MATRIX20: reg_matrix20 <= s_wb_dat_i;
			REGOFFSET_INIT_MATRIX21: reg_matrix21 <= s_wb_dat_i;
			REGOFFSET_INIT_MATRIX22: reg_matrix22 <= s_wb_dat_i;
			endcase
		end
	end
	
	assign s_wb_dat_o = (s_wb_adr_i == REGOFFSET_INIT_MATRIX00) ? reg_matrix00 :
	                    (s_wb_adr_i == REGOFFSET_INIT_MATRIX01) ? reg_matrix01 :
	                    (s_wb_adr_i == REGOFFSET_INIT_MATRIX02) ? reg_matrix02 :
	                    (s_wb_adr_i == REGOFFSET_INIT_MATRIX10) ? reg_matrix10 :
	                    (s_wb_adr_i == REGOFFSET_INIT_MATRIX11) ? reg_matrix11 :
	                    (s_wb_adr_i == REGOFFSET_INIT_MATRIX12) ? reg_matrix12 :
	                    (s_wb_adr_i == REGOFFSET_INIT_MATRIX20) ? reg_matrix20 :
	                    (s_wb_adr_i == REGOFFSET_INIT_MATRIX21) ? reg_matrix21 :
	                    (s_wb_adr_i == REGOFFSET_INIT_MATRIX22) ? reg_matrix22 :
	                    32'h0000_0000;
	
	assign s_wb_ack_o = s_wb_stb_i;
	
	
	
	
	wire				addr_frame_start;
	wire				addr_line_end;
	wire				addr_range_out;
	wire	[9:0]		addr_x;
	wire	[9:0]		addr_y;
	wire				addr_valid;
	wire				addr_ready;
	
	generate_projective_xy
		i_generate_projective_xy
			(
				.reset			(reset),
				.clk			(clk),
				.cke			(1'b1),
				
				.matrix00		(reg_matrix00),
				.matrix01		(reg_matrix01),
				.matrix02		(reg_matrix02),
				.matrix10		(reg_matrix10),
				.matrix11		(reg_matrix11),
				.matrix12		(reg_matrix12),
				.matrix20		(reg_matrix20),
				.matrix21		(reg_matrix21),
				.matrix22		(reg_matrix22),
				
				/*
				.matrix00		(32'h3fc00000),
				.matrix01		(32'h00000000),
				.matrix02		(32'hc3283b18),
				.matrix10		(32'h3eaaaaaa),
				.matrix11		(32'h3f5db3d9),
				.matrix12		(32'hc2d55554),
				.matrix20		(32'h3ab60b5f),
				.matrix21		(32'h80000000),
				.matrix22		(32'h3ed7d979),
				*/
				
				/*
				.matrix00		(32'h40000000),
				.matrix01		(32'h00000000),
				.matrix02		(32'hc3a41d8c),
				.matrix10		(32'h3eaaaaa9),
				.matrix11		(32'h3fa646e2),
				.matrix12		(32'hc35296f8),
				.matrix20		(32'h3ab60b5f),
				.matrix21		(32'h80000000),
				.matrix22		(32'h3ed7d979),
				*/
				
				
				.m_frame_start	(addr_frame_start),
				.m_line_end		(addr_line_end),
				.m_range_out	(addr_range_out),
				.m_x			(addr_x),
				.m_y			(addr_y),
				.m_valid		(addr_valid),
				.m_ready		(addr_ready)
			);
	
	wire	fifo_in_valid;
	wire	fifo_in_ready;
	
	
	wire	fifo_out_frame_start;
	wire	fifo_out_line_end;
	wire	fifo_out_range_out;
	wire	fifo_out_valid;
	wire	fifo_out_ready;
	
	jelly_fifo_fwtf
			#(
				.DATA_WIDTH			(3),
				.PTR_WIDTH			(10),
				.DOUT_REGS			(1),
				.RAM_TYPE			("block"),
				.MASTER_REGS		(1)
			)
		i_fifo_fwtf
			(
				.reset				(reset),
				.clk				(clk),
				
				.s_data				({addr_frame_start, addr_line_end, addr_range_out}),
				.s_valid			(fifo_in_valid),
				.s_ready			(fifo_in_ready),
				.s_free_count		(),
				
				.m_data				({fifo_out_frame_start, fifo_out_line_end, fifo_out_range_out}),
				.m_valid			(fifo_out_valid),
				.m_ready			(fifo_out_ready),
				.m_data_count		()
			);
	
	assign m_axi4_araddr   = INIT_PARAM_ADDR + (addr_y * INIT_PARAM_STRIDE) + (addr_x * 4);
	assign m_axi4_arvalid  = (addr_valid & !addr_range_out & fifo_in_ready);
	assign m_axi4_arid     = AXI4_ARID;
	assign m_axi4_arlen    = 0;
	assign m_axi4_arsize   = AXI4_ARSIZE;
	assign m_axi4_arburst  = AXI4_ARBURST;
	assign m_axi4_arlock   = AXI4_ARLOCK;
	assign m_axi4_arcache  = AXI4_ARCACHE;
	assign m_axi4_arprot   = AXI4_ARPROT;
	assign m_axi4_arqos    = AXI4_ARQOS;
	assign m_axi4_arregion = AXI4_ARREGION;
	
	assign fifo_in_valid   = (addr_valid && (addr_range_out || (m_axi4_arvalid && m_axi4_arready)));
	
	assign addr_ready      = (fifo_in_ready && (addr_range_out || m_axi4_arready));
	
	
	wire	[AXI4_DATA_WIDTH-1:0]	axi4s_tdata;
	wire							axi4s_tlast;
	wire	[0:0]					axi4s_tuser;
	wire							axi4s_tvalid;
	wire							axi4s_tready;
	
	assign axi4s_tdata  = fifo_out_range_out ? 32'd0 : m_axi4_rdata;
	assign axi4s_tlast  = fifo_out_line_end;
	assign axi4s_tuser  = fifo_out_frame_start;
	assign axi4s_tvalid = (fifo_out_valid && (fifo_out_range_out || m_axi4_rvalid));
	
	assign fifo_out_ready = (axi4s_tready && axi4s_tvalid);
	
	assign m_axi4_rready  = (axi4s_tready && axi4s_tvalid && !fifo_out_range_out);
	
	
	
	jelly_fifo_async_fwtf
			#(
				.DATA_WIDTH			(2+32),
				.PTR_WIDTH			(9),
				.DOUT_REGS			(1),
				.RAM_TYPE			("block"),
				.MASTER_REGS		(1)
			)
		i_fifo_async_fwtf_axi4s
			(
				.s_reset			(reset),
				.s_clk				(clk),
				.s_data				({axi4s_tuser, axi4s_tlast, axi4s_tdata}),
				.s_valid			(axi4s_tvalid),
				.s_ready			(axi4s_tready),
				.s_free_count		(),
				
				.m_reset			(~m_axi4s_aresetn),
				.m_clk				(m_axi4s_aclk),
				.m_data				({m_axi4s_tuser, m_axi4s_tlast, m_axi4s_tdata}),
				.m_valid			(m_axi4s_tvalid),
				.m_ready			(m_axi4s_tready),
				.m_data_count		()
			);

	
	
	
endmodule


`default_nettype wire


// end of file
