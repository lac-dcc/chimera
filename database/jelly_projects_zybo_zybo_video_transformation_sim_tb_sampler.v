// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//
//                                      Copyright (C) 2015 by Ryuz
//                                      https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_sampler();
	
	initial begin
		$dumpfile("tb_sampler.vcd");
		$dumpvars(0, tb_sampler);
	
	#1000000
		$finish;
	end
	
	
	reg		clk = 1'b1;
	always #2.5 clk = ~clk;
	
	reg		clk2 = 1'b1;
	always #6.6 clk2 = ~clk2;
	
	reg		reset = 1'b1;
	initial #100 reset = 1'b0;
	
	parameter	AXI4_ID_WIDTH     = 6;
	parameter	AXI4_ADDR_WIDTH   = 32;
	parameter	AXI4_DATA_SIZE    = 2;	// 0:8bit; 1:16bit; 2:32bit; 3:64bit ...
	parameter	AXI4_DATA_WIDTH   = (8 << AXI4_DATA_SIZE);
	parameter	AXI4_LEN_WIDTH    = 8;
	parameter	AXI4_QOS_WIDTH    = 4;
	parameter	AXI4_ARID         = {AXI4_ID_WIDTH{1'b0}};
	parameter	AXI4_ARSIZE       = AXI4_DATA_SIZE;
	parameter	AXI4_ARBURST      = 2'b01;
	parameter	AXI4_ARLOCK       = 1'b0;
	parameter	AXI4_ARCACHE      = 4'b0001;
	parameter	AXI4_ARPROT       = 3'b000;
	parameter	AXI4_ARQOS        = 0;
	parameter	AXI4_ARREGION     = 4'b0000;
	
	
	wire	[AXI4_ID_WIDTH-1:0]		axi4_arid;
	wire	[AXI4_ADDR_WIDTH-1:0]	axi4_araddr;
	wire	[AXI4_LEN_WIDTH-1:0]	axi4_arlen;
	wire	[2:0]					axi4_arsize;
	wire	[1:0]					axi4_arburst;
	wire	[0:0]					axi4_arlock;
	wire	[3:0]					axi4_arcache;
	wire	[2:0]					axi4_arprot;
	wire	[AXI4_QOS_WIDTH-1:0]	axi4_arqos;
	wire	[3:0]					axi4_arregion;
	wire							axi4_arvalid;
	wire							axi4_arready;
	wire	[AXI4_ID_WIDTH-1:0]		axi4_rid;
	wire	[AXI4_DATA_WIDTH-1:0]	axi4_rdata;
	wire	[1:0]					axi4_rresp;
	wire							axi4_rlast;
	wire							axi4_rvalid;
	wire							axi4_rready;
	
	
	reg		reg_ready;
	always @(posedge clk) begin
		reg_ready <= {$random};
	end
	
	sampler
		i_sampler
			(
				.reset				(reset),
				.clk				(clk),
				.cke				(1),
				
				.m_axi4_arid		(axi4_arid),
				.m_axi4_araddr		(axi4_araddr),
				.m_axi4_arlen		(axi4_arlen),
				.m_axi4_arsize		(axi4_arsize),
				.m_axi4_arburst		(axi4_arburst),
				.m_axi4_arlock		(axi4_arlock),
				.m_axi4_arcache		(axi4_arcache),
				.m_axi4_arprot		(axi4_arprot),
				.m_axi4_arqos		(axi4_arqos),
				.m_axi4_arregion	(axi4_arregion),
				.m_axi4_arvalid		(axi4_arvalid),
				.m_axi4_arready		(axi4_arready),
				.m_axi4_rid			(axi4_rid),
				.m_axi4_rdata		(axi4_rdata),
				.m_axi4_rresp		(axi4_rresp),
				.m_axi4_rlast		(axi4_rlast),
				.m_axi4_rvalid		(axi4_rvalid),
				.m_axi4_rready		(axi4_rready),
				
				.m_axi4s_aresetn	(~reset),
				.m_axi4s_aclk		(clk2),
				.m_axi4s_tdata		(),
				.m_axi4s_tlast		(),
				.m_axi4s_tuser		(),
				.m_axi4s_tvalid		(),
				.m_axi4s_tready		(1'b1) // reg_ready)	//(1'b1)
			);
	
	
	jelly_axi4_slave_model
			#(
				.AXI_ID_WIDTH       (4),
				.AXI_ADDR_WIDTH     (32),
				.AXI_QOS_WIDTH      (4),
				.AXI_LEN_WIDTH      (8),
				.AXI_DATA_SIZE      (2),		// 0:8bit, 1:16bit, 2:32bit, 4:64bit...
				.MEM_WIDTH          (16),
				
				.WRITE_LOG_FILE     (""),
				.READ_LOG_FILE      (""),
				
				.AW_FIFO_PTR_WIDTH  (0),
				.W_FIFO_PTR_WIDTH   (0),
				.B_FIFO_PTR_WIDTH   (0),
				.AR_FIFO_PTR_WIDTH  (0),
				.R_FIFO_PTR_WIDTH   (4),
				
				.AW_BUSY_RATE       (0),
				.W_BUSY_RATE        (0),
				.B_BUSY_RATE        (0),
				.AR_BUSY_RATE       (10),
				.R_BUSY_RATE        (10),
				
				.AW_BUSY_RAND       (0),
				.W_BUSY_RAND        (1),
				.B_BUSY_RAND        (2),
				.AR_BUSY_RAND       (3),
				.R_BUSY_RAND        (4)
			)
		i_axi4_slave_model
			(
				.aresetn			(~reset),
				.aclk				(clk),
				
				.s_axi4_awid		(0),
				.s_axi4_awaddr		(0),
				.s_axi4_awlen		(0),
				.s_axi4_awsize		(0),
				.s_axi4_awburst		(0),
				.s_axi4_awlock		(0),
				.s_axi4_awcache		(0),
				.s_axi4_awprot		(0),
				.s_axi4_awqos		(0),
				.s_axi4_awvalid		(0),
				.s_axi4_awready		(),
				.s_axi4_wdata		(0),
				.s_axi4_wstrb		(0),
				.s_axi4_wlast		(0),
				.s_axi4_wvalid		(0),
				.s_axi4_wready		(),
				.s_axi4_bid			(),
				.s_axi4_bresp		(),
				.s_axi4_bvalid		(),
				.s_axi4_bready		(1),
				
				.s_axi4_arid		(axi4_arid),
				.s_axi4_araddr		(axi4_araddr),
				.s_axi4_arlen		(axi4_arlen),
				.s_axi4_arsize		(axi4_arsize),
				.s_axi4_arburst		(axi4_arburst),
				.s_axi4_arlock		(axi4_arlock),
				.s_axi4_arcache		(axi4_arcache),
				.s_axi4_arprot		(axi4_arprot),
				.s_axi4_arqos		(axi4_arqos),
				.s_axi4_arvalid		(axi4_arvalid),
				.s_axi4_arready		(axi4_arready),
				.s_axi4_rid			(axi4_rid),
				.s_axi4_rdata		(axi4_rdata),
				.s_axi4_rresp		(axi4_rresp),
				.s_axi4_rlast		(axi4_rlast),
				.s_axi4_rvalid		(axi4_rvalid),
				.s_axi4_rready		(axi4_rready)
			);
	
endmodule


`default_nettype wire


// end of file
