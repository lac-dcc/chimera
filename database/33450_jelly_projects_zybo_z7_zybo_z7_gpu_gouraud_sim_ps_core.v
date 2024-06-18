// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// PS dummy



`timescale 1ns/1ps


module ps_core
		(
			input	wire			reset,
			input	wire			sys_clock,
			
			output	wire			peri_aresetn,
			output	wire			peri_aclk,
			
			output	wire			mem_aresetn,
			output	wire			mem_aclk,
			
			output	wire			vout_reset,
			output	wire			vout_clk,
			output	wire			vout_clk_x5,
			
			output	wire			ref200_reset,
			output	wire			ref200_clk,
			
			inout	wire	[14:0]	DDR_addr,
			inout	wire	[2:0]	DDR_ba,
			inout	wire			DDR_cas_n,
			inout	wire			DDR_ck_n,
			inout	wire			DDR_ck_p,
			inout	wire			DDR_cke,
			inout	wire			DDR_cs_n,
			inout	wire	[3:0]	DDR_dm,
			inout	wire	[31:0]	DDR_dq,
			inout	wire	[3:0]	DDR_dqs_n,
			inout	wire	[3:0]	DDR_dqs_p,
			inout	wire			DDR_odt,
			inout	wire			DDR_ras_n,
			inout	wire			DDR_reset_n,
			inout	wire			DDR_we_n,
			
			inout	wire			FIXED_IO_ddr_vrn,
			inout	wire			FIXED_IO_ddr_vrp,
			inout	wire	[53:0]	FIXED_IO_mio,
			inout	wire			FIXED_IO_ps_clk,
			inout	wire			FIXED_IO_ps_porb,
			inout	wire			FIXED_IO_ps_srstb,
			
			output	wire	[31:0]	m_axi4l_peri00_awaddr,
			output	wire	[2:0]	m_axi4l_peri00_awprot,
			output	wire			m_axi4l_peri00_awvalid,
			input	wire			m_axi4l_peri00_awready,
			input	wire	[1:0]	m_axi4l_peri00_bresp,
			input	wire			m_axi4l_peri00_bvalid,
			output	wire			m_axi4l_peri00_bready,
			output	wire	[31:0]	m_axi4l_peri00_wdata,
			output	wire	[3:0]	m_axi4l_peri00_wstrb,
			output	wire			m_axi4l_peri00_wvalid,
			input	wire			m_axi4l_peri00_wready,
			output	wire	[31:0]	m_axi4l_peri00_araddr,
			output	wire	[2:0]	m_axi4l_peri00_arprot,
			output	wire			m_axi4l_peri00_arvalid,
			input	wire			m_axi4l_peri00_arready,
			input	wire	[31:0]	m_axi4l_peri00_rdata,
			input	wire	[1:0]	m_axi4l_peri00_rresp,
			input	wire			m_axi4l_peri00_rvalid,
			output	wire			m_axi4l_peri00_rready,
			
			input	wire	[5:0]	s_axi4_mem00_awid,
			input	wire	[31:0]	s_axi4_mem00_awaddr,
			input	wire	[1:0]	s_axi4_mem00_awburst,
			input	wire	[3:0]	s_axi4_mem00_awcache,
			input	wire	[7:0]	s_axi4_mem00_awlen,
			input	wire	[0:0]	s_axi4_mem00_awlock,
			input	wire	[2:0]	s_axi4_mem00_awprot,
			input	wire	[3:0]	s_axi4_mem00_awqos,
			input	wire	[3:0]	s_axi4_mem00_awregion,
			input	wire	[2:0]	s_axi4_mem00_awsize,
			input	wire			s_axi4_mem00_awvalid,
			output	wire			s_axi4_mem00_awready,
			input	wire	[63:0]	s_axi4_mem00_wdata,
			input	wire	[7:0]	s_axi4_mem00_wstrb,
			input	wire			s_axi4_mem00_wlast,
			input	wire			s_axi4_mem00_wvalid,
			output	wire			s_axi4_mem00_wready,
			output	wire	[5:0]	s_axi4_mem00_bid,
			output	wire	[1:0]	s_axi4_mem00_bresp,
			output	wire			s_axi4_mem00_bvalid,
			input	wire			s_axi4_mem00_bready,
			input	wire	[31:0]	s_axi4_mem00_araddr,
			input	wire	[1:0]	s_axi4_mem00_arburst,
			input	wire	[3:0]	s_axi4_mem00_arcache,
			input	wire	[5:0]	s_axi4_mem00_arid,
			input	wire	[7:0]	s_axi4_mem00_arlen,
			input	wire	[0:0]	s_axi4_mem00_arlock,
			input	wire	[2:0]	s_axi4_mem00_arprot,
			input	wire	[3:0]	s_axi4_mem00_arqos,
			input	wire	[3:0]	s_axi4_mem00_arregion,
			input	wire	[2:0]	s_axi4_mem00_arsize,
			input	wire			s_axi4_mem00_arvalid,
			output	wire			s_axi4_mem00_arready,
			output	wire	[63:0]	s_axi4_mem00_rdata,
			output	wire	[5:0]	s_axi4_mem00_rid,
			output	wire			s_axi4_mem00_rlast,
			output	wire	[1:0]	s_axi4_mem00_rresp,
			output	wire			s_axi4_mem00_rvalid,
			input	wire			s_axi4_mem00_rready
		);
	
	
	localparam	PERI_RATE   = (1000.0/100.0);
	localparam	MEM_RATE    = (1000.0/175.3);
	localparam	VIDEO_RATE  = (1000.0/150.5);
	localparam	REF200_RATE = (1000.0/200.7);
	
	
	reg		reg_peri_clk = 1'b1;
	always #(PERI_RATE/2.0) reg_peri_clk = ~reg_peri_clk;
	
	reg		reg_peri_reset = 1'b1;
	initial	#(PERI_RATE*30)	reg_peri_reset = 1'b0;
	
	
	reg		reg_mem_clk = 1'b1;
	always #(MEM_RATE/2.0) reg_mem_clk = ~reg_mem_clk;
	
	reg		reg_mem_reset = 1'b1;
	initial	#(MEM_RATE*30)	reg_mem_reset = 1'b0;
	
	
	reg		reg_video_clk = 1'b1;
	always #(VIDEO_RATE/2.0) reg_video_clk = ~reg_video_clk;
	
	reg		reg_video_clk_x5 = 1'b1;
	always #(VIDEO_RATE/2.0/5.0) reg_video_clk_x5 = ~reg_video_clk_x5;
	
	reg		reg_video_reset = 1'b1;
	initial	#(VIDEO_RATE*30)	reg_video_reset = 1'b0;
	
	
	reg		reg_ref200_clk = 1'b1;
	always #(REF200_RATE/2.0) reg_ref200_clk = ~reg_ref200_clk;
	
	reg		reg_ref200_reset = 1'b1;
	initial	#(REF200_RATE*30)	reg_ref200_reset = 1'b0;
	
	
	assign peri_aclk    = reg_peri_clk;
	assign peri_aresetn = ~reg_peri_reset;
	
	assign mem_aclk     = reg_mem_clk;
	assign mem_aresetn  = ~reg_mem_reset;
	
	assign vout_clk     = reg_video_clk;
	assign vout_clk_x5  = reg_video_clk_x5;
	assign vout_reset   = reg_video_reset;
	
	assign ref200_reset = reg_ref200_reset;
	assign ref200_clk   = reg_ref200_clk;
	
	
//	assign m_axi4l_peri00_awaddr  = 0;
//	assign m_axi4l_peri00_awprot  = 0;
	assign m_axi4l_peri00_awvalid = 1'b0;
	
//	assign m_axi4l_peri00_wstrb   = 0;
//	assign m_axi4l_peri00_wdata   = 0;
	assign m_axi4l_peri00_wvalid  = 1'b0;
	
//	assign m_axi4l_peri00_araddr  = 0;
//	assign m_axi4l_peri00_arprot  = 0;
	assign m_axi4l_peri00_arvalid = 1'b0;
	
	assign m_axi4l_peri00_bready  = 1'b1;
	assign m_axi4l_peri00_rready  = 1'b1;
	
	
	assign s_axi4_mem00_arready   = 1'b1;
	assign s_axi4_mem00_awready   = 1'b1;
	assign s_axi4_mem00_wready    = 1'b1;
	assign s_axi4_mem00_bvalid    = 1'b0;
	assign s_axi4_mem00_rvalid    = 1'b0;
	
	/*
	jelly_axi4_slave_model
			#(
				.AXI_ID_WIDTH		(6),
				.AXI_DATA_SIZE		(3),				// log2(n/8)  0:8bit, 1:16bit, 2:32bit, 3:64bit, ...
				.AXI_ADDR_WIDTH		(32),
				.AXI_QOS_WIDTH		(4),
				.AXI_LEN_WIDTH		(8),
				.MEM_SIZE			(640*480),
				
				.WRITE_LOG_FILE		("axi_write.txt"),
				.READ_LOG_FILE		("axi_read.txt"),
				
				.AW_FIFO_PTR_WIDTH	(2),
				.W_FIFO_PTR_WIDTH	(4),
				.B_FIFO_PTR_WIDTH	(2),
				.AR_FIFO_PTR_WIDTH	(2),
				.R_FIFO_PTR_WIDTH	(2),
				
				.AW_BUSY_RATE		(97),	//(80),
				.W_BUSY_RATE		(50),	//(20),
				.B_BUSY_RATE		(50),	//(50),
				.AR_BUSY_RATE		(50),
				.R_BUSY_RATE		(50)
			)
		i_axi4_slave_model
			(
				.aresetn			(mem_aresetn),
				.aclk				(mem_aclk),
				
				.s_axi4_awid		(s_axi4_mem00_awid),
				.s_axi4_awaddr		(s_axi4_mem00_awaddr & 32'h00ff_ffff),
				.s_axi4_awlen		(s_axi4_mem00_awlen),
				.s_axi4_awsize		(s_axi4_mem00_awsize),
				.s_axi4_awburst		(s_axi4_mem00_awburst),
				.s_axi4_awlock		(s_axi4_mem00_awlock),
				.s_axi4_awcache		(s_axi4_mem00_awcache),
				.s_axi4_awprot		(s_axi4_mem00_awprot),
				.s_axi4_awqos		(s_axi4_mem00_awqos),
				.s_axi4_awvalid		(s_axi4_mem00_awvalid),
				.s_axi4_awready		(s_axi4_mem00_awready),
				.s_axi4_wdata		(s_axi4_mem00_wdata),
				.s_axi4_wstrb		(s_axi4_mem00_wstrb),
				.s_axi4_wlast		(s_axi4_mem00_wlast),
				.s_axi4_wvalid		(s_axi4_mem00_wvalid),
				.s_axi4_wready		(s_axi4_mem00_wready),
				.s_axi4_bid			(s_axi4_mem00_bid),
				.s_axi4_bresp		(s_axi4_mem00_bresp),
				.s_axi4_bvalid		(s_axi4_mem00_bvalid),
				.s_axi4_bready		(s_axi4_mem00_bready),
				.s_axi4_arid		(s_axi4_mem00_arid),
				.s_axi4_araddr		(s_axi4_mem00_araddr & 32'h00ff_ffff),
				.s_axi4_arlen		(s_axi4_mem00_arlen),
				.s_axi4_arsize		(s_axi4_mem00_arsize),
				.s_axi4_arburst		(s_axi4_mem00_arburst),
				.s_axi4_arlock		(s_axi4_mem00_arlock),
				.s_axi4_arcache		(s_axi4_mem00_arcache),
				.s_axi4_arprot		(s_axi4_mem00_arprot),
				.s_axi4_arqos		(s_axi4_mem00_arqos),
				.s_axi4_arvalid		(s_axi4_mem00_arvalid),
				.s_axi4_arready		(s_axi4_mem00_arready),
				.s_axi4_rid			(s_axi4_mem00_rid),
				.s_axi4_rdata		(s_axi4_mem00_rdata),
				.s_axi4_rresp		(s_axi4_mem00_rresp),
				.s_axi4_rlast		(s_axi4_mem00_rlast),
				.s_axi4_rvalid		(s_axi4_mem00_rvalid),
				.s_axi4_rready		(s_axi4_mem00_rready)
			);
	*/
	
endmodule

