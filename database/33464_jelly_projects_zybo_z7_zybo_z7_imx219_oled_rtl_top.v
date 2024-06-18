// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License




`timescale 1ns / 1ps
`default_nettype none


module top
		#(
			parameter	X_NUM = 640, // 3280 / 2,
			parameter	Y_NUM = 132  // 2464 / 2
		)
		(
			input	wire			in_clk125,
			
			input	wire	[3:0]	push_sw,
			input	wire	[3:0]	dip_sw,
			output	wire	[3:0]	led,
			output	wire	[7:0]	pmod_a,
			output	wire	[4:1]	pmod_jb_p,
			output	wire	[4:1]	pmod_jb_n,
			
			input	wire			cam_clk_hs_p,
			input	wire			cam_clk_hs_n,
			input	wire			cam_clk_lp_p,
			input	wire			cam_clk_lp_n,
			input	wire	[1:0]	cam_data_hs_p,
			input	wire	[1:0]	cam_data_hs_n,
			input	wire	[1:0]	cam_data_lp_p,
			input	wire	[1:0]	cam_data_lp_n,
			input	wire			cam_clk,
			output	wire			cam_gpio,
			inout	wire			cam_scl,
			inout	wire			cam_sda,
			
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
			inout	wire			FIXED_IO_ps_srstb
		);
	
	
						wire			sys_reset;
	(* KEEP = "true" *)	wire			sys_clk100;
	(* KEEP = "true" *)	wire			sys_clk200;
	(* KEEP = "true" *)	wire			sys_clk250;
	
						wire			oled_reset;
	(* KEEP = "true" *)	wire			oled_clk;
	(* KEEP = "true" *)	wire			oled_clk_x7;
	
	
	wire			axi4l_peri_aresetn;
	wire			axi4l_peri_aclk;
	wire	[31:0]	axi4l_peri_awaddr;
	wire	[2:0]	axi4l_peri_awprot;
	wire			axi4l_peri_awvalid;
	wire			axi4l_peri_awready;
	wire	[3:0]	axi4l_peri_wstrb;
	wire	[31:0]	axi4l_peri_wdata;
	wire			axi4l_peri_wvalid;
	wire			axi4l_peri_wready;
	wire	[1:0]	axi4l_peri_bresp;
	wire			axi4l_peri_bvalid;
	wire			axi4l_peri_bready;
	wire	[31:0]	axi4l_peri_araddr;
	wire	[2:0]	axi4l_peri_arprot;
	wire			axi4l_peri_arvalid;
	wire			axi4l_peri_arready;
	wire	[31:0]	axi4l_peri_rdata;
	wire	[1:0]	axi4l_peri_rresp;
	wire			axi4l_peri_rvalid;
	wire			axi4l_peri_rready;
	
	
	wire			axi4_mem_aresetn;
	wire			axi4_mem_aclk;
	
	wire	[5:0]	axi4_mem0_awid;
	wire	[31:0]	axi4_mem0_awaddr;
	wire	[1:0]	axi4_mem0_awburst;
	wire	[3:0]	axi4_mem0_awcache;
	wire	[7:0]	axi4_mem0_awlen;
	wire	[0:0]	axi4_mem0_awlock;
	wire	[2:0]	axi4_mem0_awprot;
	wire	[3:0]	axi4_mem0_awqos;
	wire	[3:0]	axi4_mem0_awregion;
	wire	[2:0]	axi4_mem0_awsize;
	wire			axi4_mem0_awvalid;
	wire			axi4_mem0_awready;
	wire	[7:0]	axi4_mem0_wstrb;
	wire	[63:0]	axi4_mem0_wdata;
	wire			axi4_mem0_wlast;
	wire			axi4_mem0_wvalid;
	wire			axi4_mem0_wready;
	wire	[5:0]	axi4_mem0_bid;
	wire	[1:0]	axi4_mem0_bresp;
	wire			axi4_mem0_bvalid;
	wire			axi4_mem0_bready;
	wire	[5:0]	axi4_mem0_arid;
	wire	[31:0]	axi4_mem0_araddr;
	wire	[1:0]	axi4_mem0_arburst;
	wire	[3:0]	axi4_mem0_arcache;
	wire	[7:0]	axi4_mem0_arlen;
	wire	[0:0]	axi4_mem0_arlock;
	wire	[2:0]	axi4_mem0_arprot;
	wire	[3:0]	axi4_mem0_arqos;
	wire	[3:0]	axi4_mem0_arregion;
	wire	[2:0]	axi4_mem0_arsize;
	wire			axi4_mem0_arvalid;
	wire			axi4_mem0_arready;
	wire	[5:0]	axi4_mem0_rid;
	wire	[1:0]	axi4_mem0_rresp;
	wire	[63:0]	axi4_mem0_rdata;
	wire			axi4_mem0_rlast;
	wire			axi4_mem0_rvalid;
	wire			axi4_mem0_rready;
	
	wire			IIC_0_0_scl_i;
	wire			IIC_0_0_scl_o;
	wire			IIC_0_0_scl_t;
	wire			IIC_0_0_sda_i;
	wire			IIC_0_0_sda_o;
	wire			IIC_0_0_sda_t;
	
	design_1
		i_design_1
			(
				.sys_reset				(1'b0),
				.sys_clock				(in_clk125),
				
				.out_reset				(sys_reset),
				.out_clk100				(sys_clk100),
				.out_clk200				(sys_clk200),
				.out_clk250				(sys_clk250),
				
				.out_oled_reset			(oled_reset),
				.out_oled_clk			(oled_clk),
				.out_oled_clk_x7		(oled_clk_x7),
				
				.m_axi4l_peri_aresetn	(axi4l_peri_aresetn),
				.m_axi4l_peri_aclk		(axi4l_peri_aclk),
				.m_axi4l_peri_awaddr	(axi4l_peri_awaddr),
				.m_axi4l_peri_awprot	(axi4l_peri_awprot),
				.m_axi4l_peri_awvalid	(axi4l_peri_awvalid),
				.m_axi4l_peri_awready	(axi4l_peri_awready),
				.m_axi4l_peri_wstrb		(axi4l_peri_wstrb),
				.m_axi4l_peri_wdata		(axi4l_peri_wdata),
				.m_axi4l_peri_wvalid	(axi4l_peri_wvalid),
				.m_axi4l_peri_wready	(axi4l_peri_wready),
				.m_axi4l_peri_bresp		(axi4l_peri_bresp),
				.m_axi4l_peri_bvalid	(axi4l_peri_bvalid),
				.m_axi4l_peri_bready	(axi4l_peri_bready),
				.m_axi4l_peri_araddr	(axi4l_peri_araddr),
				.m_axi4l_peri_arprot	(axi4l_peri_arprot),
				.m_axi4l_peri_arvalid	(axi4l_peri_arvalid),
				.m_axi4l_peri_arready	(axi4l_peri_arready),
				.m_axi4l_peri_rdata		(axi4l_peri_rdata),
				.m_axi4l_peri_rresp		(axi4l_peri_rresp),
				.m_axi4l_peri_rvalid	(axi4l_peri_rvalid),
				.m_axi4l_peri_rready	(axi4l_peri_rready),
				
				
				.s_axi4_mem_aresetn		(axi4_mem_aresetn),
				.s_axi4_mem_aclk		(axi4_mem_aclk),
				
				.s_axi4_mem0_awid		(axi4_mem0_awid),
				.s_axi4_mem0_awaddr		(axi4_mem0_awaddr),
				.s_axi4_mem0_awburst	(axi4_mem0_awburst),
				.s_axi4_mem0_awcache	(axi4_mem0_awcache),
				.s_axi4_mem0_awlen		(axi4_mem0_awlen),
				.s_axi4_mem0_awlock		(axi4_mem0_awlock),
				.s_axi4_mem0_awprot		(axi4_mem0_awprot),
				.s_axi4_mem0_awqos		(axi4_mem0_awqos),
	//			.s_axi4_mem0_awregion	(axi4_mem0_awregion),
				.s_axi4_mem0_awsize		(axi4_mem0_awsize),
				.s_axi4_mem0_awvalid	(axi4_mem0_awvalid),
				.s_axi4_mem0_awready	(axi4_mem0_awready),
				.s_axi4_mem0_wstrb		(axi4_mem0_wstrb),
				.s_axi4_mem0_wdata		(axi4_mem0_wdata),
				.s_axi4_mem0_wlast		(axi4_mem0_wlast),
				.s_axi4_mem0_wvalid		(axi4_mem0_wvalid),
				.s_axi4_mem0_wready		(axi4_mem0_wready),
				.s_axi4_mem0_bid		(axi4_mem0_bid),
				.s_axi4_mem0_bresp		(axi4_mem0_bresp),
				.s_axi4_mem0_bvalid		(axi4_mem0_bvalid),
				.s_axi4_mem0_bready		(axi4_mem0_bready),
				.s_axi4_mem0_araddr		(axi4_mem0_araddr),
				.s_axi4_mem0_arburst	(axi4_mem0_arburst),
				.s_axi4_mem0_arcache	(axi4_mem0_arcache),
				.s_axi4_mem0_arid		(axi4_mem0_arid),
				.s_axi4_mem0_arlen		(axi4_mem0_arlen),
				.s_axi4_mem0_arlock		(axi4_mem0_arlock),
				.s_axi4_mem0_arprot		(axi4_mem0_arprot),
				.s_axi4_mem0_arqos		(axi4_mem0_arqos),
	//			.s_axi4_mem0_arregion	(axi4_mem0_arregion),
				.s_axi4_mem0_arsize		(axi4_mem0_arsize),
				.s_axi4_mem0_arvalid	(axi4_mem0_arvalid),
				.s_axi4_mem0_arready	(axi4_mem0_arready),
				.s_axi4_mem0_rid		(axi4_mem0_rid),
				.s_axi4_mem0_rresp		(axi4_mem0_rresp),
				.s_axi4_mem0_rdata		(axi4_mem0_rdata),
				.s_axi4_mem0_rlast		(axi4_mem0_rlast),
				.s_axi4_mem0_rvalid		(axi4_mem0_rvalid),
				.s_axi4_mem0_rready		(axi4_mem0_rready),
				
				.DDR_addr				(DDR_addr),
				.DDR_ba					(DDR_ba),
				.DDR_cas_n				(DDR_cas_n),
				.DDR_ck_n				(DDR_ck_n),
				.DDR_ck_p				(DDR_ck_p),
				.DDR_cke				(DDR_cke),
				.DDR_cs_n				(DDR_cs_n),
				.DDR_dm					(DDR_dm),
				.DDR_dq					(DDR_dq),
				.DDR_dqs_n				(DDR_dqs_n),
				.DDR_dqs_p				(DDR_dqs_p),
				.DDR_odt				(DDR_odt),
				.DDR_ras_n				(DDR_ras_n),
				.DDR_reset_n			(DDR_reset_n),
				.DDR_we_n				(DDR_we_n),
				.FIXED_IO_ddr_vrn		(FIXED_IO_ddr_vrn),
				.FIXED_IO_ddr_vrp		(FIXED_IO_ddr_vrp),
				.FIXED_IO_mio			(FIXED_IO_mio),
				.FIXED_IO_ps_clk		(FIXED_IO_ps_clk),
				.FIXED_IO_ps_porb		(FIXED_IO_ps_porb),
				.FIXED_IO_ps_srstb		(FIXED_IO_ps_srstb),
				
				.IIC_0_0_scl_i			(IIC_0_0_scl_i),
				.IIC_0_0_scl_o			(IIC_0_0_scl_o),
				.IIC_0_0_scl_t			(IIC_0_0_scl_t),
				.IIC_0_0_sda_i			(IIC_0_0_sda_i),
				.IIC_0_0_sda_o			(IIC_0_0_sda_o),
				.IIC_0_0_sda_t			(IIC_0_0_sda_t)
			);
	
	assign cam_gpio = dip_sw[0];
	
	IOBUF
		i_IOBUF_cam_scl
			(
				.IO		(cam_scl),
				.I		(IIC_0_0_scl_o),
				.O		(IIC_0_0_scl_i),
				.T		(IIC_0_0_scl_t)
			);

	IOBUF
		i_iobuf_cam_sda
			(
				.IO		(cam_sda),
				.I		(IIC_0_0_sda_o),
				.O		(IIC_0_0_sda_i),
				.T		(IIC_0_0_sda_t)
			);
	
		
	// AXI4L => WISHBONE
	wire					wb_rst_o;
	wire					wb_clk_o;
	wire	[29:0]			wb_host_adr_o;
	wire	[31:0]			wb_host_dat_o;
	wire	[31:0]			wb_host_dat_i;
	wire					wb_host_we_o;
	wire	[3:0]			wb_host_sel_o;
	wire					wb_host_stb_o;
	wire					wb_host_ack_i;
	
	jelly_axi4l_to_wishbone
			#(
				.AXI4L_ADDR_WIDTH	(32),
				.AXI4L_DATA_SIZE	(2)		// 0:8bit, 1:16bit, 2:32bit ...
			)
		i_axi4l_to_wishbone
			(
				.s_axi4l_aresetn	(axi4l_peri_aresetn),
				.s_axi4l_aclk		(axi4l_peri_aclk),
				.s_axi4l_awaddr		(axi4l_peri_awaddr),
				.s_axi4l_awprot		(axi4l_peri_awprot),
				.s_axi4l_awvalid	(axi4l_peri_awvalid),
				.s_axi4l_awready	(axi4l_peri_awready),
				.s_axi4l_wstrb		(axi4l_peri_wstrb),
				.s_axi4l_wdata		(axi4l_peri_wdata),
				.s_axi4l_wvalid		(axi4l_peri_wvalid),
				.s_axi4l_wready		(axi4l_peri_wready),
				.s_axi4l_bresp		(axi4l_peri_bresp),
				.s_axi4l_bvalid		(axi4l_peri_bvalid),
				.s_axi4l_bready		(axi4l_peri_bready),
				.s_axi4l_araddr		(axi4l_peri_araddr),
				.s_axi4l_arprot		(axi4l_peri_arprot),
				.s_axi4l_arvalid	(axi4l_peri_arvalid),
				.s_axi4l_arready	(axi4l_peri_arready),
				.s_axi4l_rdata		(axi4l_peri_rdata),
				.s_axi4l_rresp		(axi4l_peri_rresp),
				.s_axi4l_rvalid		(axi4l_peri_rvalid),
				.s_axi4l_rready		(axi4l_peri_rready),
				
				.m_wb_rst_o			(wb_rst_o),
				.m_wb_clk_o			(wb_clk_o),
				.m_wb_adr_o			(wb_host_adr_o),
				.m_wb_dat_o			(wb_host_dat_o),
				.m_wb_dat_i			(wb_host_dat_i),
				.m_wb_we_o			(wb_host_we_o),
				.m_wb_sel_o			(wb_host_sel_o),
				.m_wb_stb_o			(wb_host_stb_o),
				.m_wb_ack_i			(wb_host_ack_i)
			);
	
	// ----------------------------------------
	//  Global ID
	// ----------------------------------------
	
	wire	[31:0]			wb_gid_dat_o;
	wire					wb_gid_stb_i;
	wire					wb_gid_ack_o;
	
	assign wb_gid_dat_o = 32'h01234567;
	assign wb_gid_ack_o = wb_gid_stb_i;
	
	
	
	// ----------------------------------------
	//  MIPI D-PHY RX
	// ----------------------------------------
	
	(* KEEP = "true" *)
	wire				rxbyteclkhs;
	wire				system_rst_out;
	wire				init_done;
	
	wire				cl_rxclkactivehs;
	wire				cl_stopstate;
	wire				cl_enable         = 1;
	wire				cl_rxulpsclknot;
	wire				cl_ulpsactivenot;
	
	(* MARK_DEBUG = "true" *)	wire	[7:0]		dl0_rxdatahs;
	(* MARK_DEBUG = "true" *)	wire				dl0_rxvalidhs;
	(* MARK_DEBUG = "true" *)	wire				dl0_rxactivehs;
	(* MARK_DEBUG = "true" *)	wire				dl0_rxsynchs;
	
	wire				dl0_forcerxmode   = 0;
	wire				dl0_stopstate;
	wire				dl0_enable        = 1;
	wire				dl0_ulpsactivenot;
	
	wire				dl0_rxclkesc;
	wire				dl0_rxlpdtesc;
	wire				dl0_rxulpsesc;
	wire	[3:0]		dl0_rxtriggeresc;
	wire	[7:0]		dl0_rxdataesc;
	wire				dl0_rxvalidesc;
	
	wire				dl0_errsoths;
	wire				dl0_errsotsynchs;
	wire				dl0_erresc;
	wire				dl0_errsyncesc;
	wire				dl0_errcontrol;
	
	wire	[7:0]		dl1_rxdatahs;
	wire				dl1_rxvalidhs;
	wire				dl1_rxactivehs;
	wire				dl1_rxsynchs;
	
	wire				dl1_forcerxmode   = 0;
	wire				dl1_stopstate;
	wire				dl1_enable        = 1;
	wire				dl1_ulpsactivenot;
	
	wire				dl1_rxclkesc;
	wire				dl1_rxlpdtesc;
	wire				dl1_rxulpsesc;
	wire	[3:0]		dl1_rxtriggeresc;
	wire	[7:0]		dl1_rxdataesc;
	wire				dl1_rxvalidesc;
	
	wire				dl1_errsoths;
	wire				dl1_errsotsynchs;
	wire				dl1_erresc;
	wire				dl1_errsyncesc;
	wire				dl1_errcontrol;
	
	
	reg		[31:0]		dbg_dl0_count;
	reg		[31:0]		dbg_dl1_count;
	always @(posedge rxbyteclkhs) begin
		if (dl0_rxactivehs ) begin
			dbg_dl0_count <= dbg_dl0_count + 1;
		end
		if ( dl0_rxsynchs ) begin
			dbg_dl0_count <= 0;
		end
		
		if (dl1_rxactivehs ) begin
			dbg_dl1_count <= dbg_dl1_count + 1;
		end
		if ( dl1_rxsynchs ) begin
			dbg_dl1_count <= 0;
		end
	end
	
	
	/*
	(* MARK_DEBUG = "true" *)	reg		[7:0]		dbg_dl0_rxdatahs;
	(* MARK_DEBUG = "true" *)	reg		[7:0]		dbg_dl0_rxdataesc;
	(* MARK_DEBUG = "true" *)	reg		[7:0]		dbg_dl1_rxdatahs;
	(* MARK_DEBUG = "true" *)	reg		[7:0]		dbg_dl1_rxdataesc;
	
	always @(posedge clk100) begin
		dbg_dl0_rxdatahs  <= dl0_rxdatahs ;
		dbg_dl0_rxdataesc <= dl0_rxdataesc;
		dbg_dl1_rxdatahs  <= dl1_rxdatahs ;
		dbg_dl1_rxdataesc <= dl1_rxdataesc;
	end
	*/
	
	
	mipi_dphy_cam
		i_mipi_dphy_cam
			(
				.core_clk			(sys_clk200),
				.core_rst			(sys_reset),
				.rxbyteclkhs		(rxbyteclkhs),
				.system_rst_out		(system_rst_out),
				.init_done			(init_done),
				
				.cl_rxclkactivehs	(cl_rxclkactivehs),
				.cl_stopstate		(cl_stopstate),
				.cl_enable			(cl_enable),
				.cl_rxulpsclknot	(cl_rxulpsclknot),
				.cl_ulpsactivenot	(cl_ulpsactivenot),
				
				.dl0_rxdatahs		(dl0_rxdatahs),
				.dl0_rxvalidhs		(dl0_rxvalidhs),
				.dl0_rxactivehs		(dl0_rxactivehs),
				.dl0_rxsynchs		(dl0_rxsynchs),
				
				.dl0_forcerxmode	(dl0_forcerxmode),
				.dl0_stopstate		(dl0_stopstate),
				.dl0_enable			(dl0_enable),
				.dl0_ulpsactivenot	(dl0_ulpsactivenot),
				
				.dl0_rxclkesc		(dl0_rxclkesc),
				.dl0_rxlpdtesc		(dl0_rxlpdtesc),
				.dl0_rxulpsesc		(dl0_rxulpsesc),
				.dl0_rxtriggeresc	(dl0_rxtriggeresc),
				.dl0_rxdataesc		(dl0_rxdataesc),
				.dl0_rxvalidesc		(dl0_rxvalidesc),
				
				.dl0_errsoths		(dl0_errsoths),
				.dl0_errsotsynchs	(dl0_errsotsynchs),
				.dl0_erresc			(dl0_erresc),
				.dl0_errsyncesc		(dl0_errsyncesc),
				.dl0_errcontrol		(dl0_errcontrol),
				
				.dl1_rxdatahs		(dl1_rxdatahs),
				.dl1_rxvalidhs		(dl1_rxvalidhs),
				.dl1_rxactivehs		(dl1_rxactivehs),
				.dl1_rxsynchs		(dl1_rxsynchs),
				
				.dl1_forcerxmode	(dl1_forcerxmode),
				.dl1_stopstate		(dl1_stopstate),
				.dl1_enable			(dl1_enable),
				.dl1_ulpsactivenot	(dl1_ulpsactivenot),
				
				.dl1_rxclkesc		(dl1_rxclkesc),
				.dl1_rxlpdtesc		(dl1_rxlpdtesc),
				.dl1_rxulpsesc		(dl1_rxulpsesc),
				.dl1_rxtriggeresc	(dl1_rxtriggeresc),
				.dl1_rxdataesc		(dl1_rxdataesc),
				.dl1_rxvalidesc		(dl1_rxvalidesc),
				
				.dl1_errsoths		(dl1_errsoths),
				.dl1_errsotsynchs	(dl1_errsotsynchs),
				.dl1_erresc			(dl1_erresc),
				.dl1_errsyncesc		(dl1_errsyncesc),
				.dl1_errcontrol		(dl1_errcontrol),
				
				.clk_hs_rxp			(cam_clk_hs_p),
				.clk_hs_rxn			(cam_clk_hs_n),
				.clk_lp_rxp			(cam_clk_lp_p),
				.clk_lp_rxn			(cam_clk_lp_n),
				.data_hs_rxp		(cam_data_hs_p),
				.data_hs_rxn		(cam_data_hs_n),
				.data_lp_rxp		(cam_data_lp_p),
				.data_lp_rxn		(cam_data_lp_n)
		   );
	
	
//	wire		dphy_clk   = rxbyteclkhs;
//	wire		dphy_reset = system_rst_out;
	
	
	wire		dphy_clk   = rxbyteclkhs;
	wire		dphy_reset;
	jelly_reset
			#(
				.IN_LOW_ACTIVE		(0),
				.OUT_LOW_ACTIVE		(0),
				.INPUT_REGS			(2),
				.COUNTER_WIDTH		(5),
				.INSERT_BUFG		(0)
			)
		i_reset
			(
				.clk				(dphy_clk),
				.in_reset			(sys_reset || system_rst_out),
				.out_reset			(dphy_reset)
			);
	
	
	
	
	// ----------------------------------------
	//  CSI-2
	// ----------------------------------------
	
	
	wire			axi4s_cam_aresetn = ~sys_reset;
	wire			axi4s_cam_aclk    = sys_clk200;
	
	(* MARK_DEBUG = "true" *)	wire	[0:0]	axi4s_csi2_tuser;
	(* MARK_DEBUG = "true" *)	wire			axi4s_csi2_tlast;
	(* MARK_DEBUG = "true" *)	wire	[9:0]	axi4s_csi2_tdata;
	(* MARK_DEBUG = "true" *)	wire			axi4s_csi2_tvalid;
	(* MARK_DEBUG = "true" *)	wire			axi4s_csi2_tready;
	
	jelly_csi2_rx
			#(
				.LANE_NUM			(2),
				.DATA_WIDTH			(10),
				.M_FIFO_ASYNC		(1)
			)
		i_csi2_rx
			(
				.aresetn			(~sys_reset),
				.aclk				(sys_clk250),
				
				.rxreseths			(system_rst_out),
				.rxbyteclkhs		(rxbyteclkhs),
				.rxdatahs			({dl1_rxdatahs,   dl0_rxdatahs  }),
				.rxvalidhs			({dl1_rxvalidhs,  dl0_rxvalidhs }),
				.rxactivehs			({dl1_rxactivehs, dl0_rxactivehs}),
				.rxsynchs			({dl1_rxsynchs,   dl0_rxsynchs  }),
				
				.m_axi4s_aresetn	(axi4s_cam_aresetn),
				.m_axi4s_aclk		(axi4s_cam_aclk),
				.m_axi4s_tuser		(axi4s_csi2_tuser),
				.m_axi4s_tlast		(axi4s_csi2_tlast),
				.m_axi4s_tdata		(axi4s_csi2_tdata),
				.m_axi4s_tvalid		(axi4s_csi2_tvalid),
				.m_axi4s_tready		(axi4s_csi2_tready)
			);
	
	jelly_axi4s_debug_monitor
			#(
				.TUSER_WIDTH		(1),
				.TDATA_WIDTH		(10),
				.TIMER_WIDTH		(32),
				.FRAME_WIDTH		(32),
				.PIXEL_WIDTH		(32),
				.X_WIDTH			(16),
				.Y_WIDTH			(16)
			)
		i_axi4s_debug_monitor
			(
				.aresetn			(axi4s_cam_aresetn),
				.aclk				(axi4s_cam_aclk),
				.aclken				(1'b1),
				
				.axi4s_tuser		(axi4s_csi2_tuser),
				.axi4s_tlast		(axi4s_csi2_tlast),
				.axi4s_tdata		(axi4s_csi2_tdata),
				.axi4s_tvalid		(axi4s_csi2_tvalid),
				.axi4s_tready		(axi4s_csi2_tready)
			);
	
	/*
	wire	[0:0]	axi4s_fifo_tuser;
	wire			axi4s_fifo_tlast;
	wire	[9:0]	axi4s_fifo_tdata;
	wire			axi4s_fifo_tvalid;
	wire			axi4s_fifo_tready;
	
	jelly_fifo_fwtf
			#(
				.DATA_WIDTH			(2+10),
				.PTR_WIDTH			(10),
				.DOUT_REGS			(0),
				.RAM_TYPE			("block"),
				.LOW_DEALY			(0),
				.SLAVE_REGS			(0),
				.MASTER_REGS		(1)
			)
		i_fifo_fifo_fwtf_csi2
			(
				.reset				(~axi4s_cam_aresetn),
				.clk				(axi4s_cam_aclk),
				
				.s_data				({axi4s_csi2_tuser, axi4s_csi2_tlast, axi4s_csi2_tdata}),
				.s_valid			(axi4s_csi2_tvalid),
				.s_ready			(axi4s_csi2_tready),
				.s_free_count		(),
				
				.m_data				({axi4s_fifo_tuser, axi4s_fifo_tlast, axi4s_fifo_tdata}),
				.m_valid			(axi4s_fifo_tvalid),
				.m_ready			(axi4s_fifo_tready),
				.m_data_count		()
			);
	*/
	
	
	
	// normalize
	wire	[0:0]		axi4s_norm_tuser;
	wire				axi4s_norm_tlast;
	wire	[9:0]		axi4s_norm_tdata;
	wire				axi4s_norm_tvalid;
	wire				axi4s_norm_tready;
	
	wire	[31:0]		wb_norm_dat_o;
	wire				wb_norm_stb_i;
	wire				wb_norm_ack_o;
	
	jelly_video_normalizer
			#(
				.WB_ADR_WIDTH		(8),
				.WB_DAT_WIDTH		(32),
				
				.TUSER_WIDTH		(1),
				.TDATA_WIDTH		(10),
				.X_WIDTH			(16),
				.Y_WIDTH			(16),
				.TIMER_WIDTH		(32),
				.S_SLAVE_REGS		(1),
				.S_MASTER_REGS		(1),
				.M_SLAVE_REGS		(1),
				.M_MASTER_REGS		(1),
				
				.INIT_CONTROL		(2'b00),
				.INIT_SKIP			(1),
				.INIT_PARAM_WIDTH	(X_NUM),
				.INIT_PARAM_HEIGHT	(Y_NUM),
				.INIT_PARAM_FILL	(10'd0),
				.INIT_PARAM_TIMEOUT	(32'h00010000)
			)
		i_video_normalizer
			(
				.aresetn			(axi4s_cam_aresetn),
				.aclk				(axi4s_cam_aclk),
				.aclken				(1'b1),
				
				.s_wb_rst_i			(wb_rst_o),
				.s_wb_clk_i			(wb_clk_o),
				.s_wb_adr_i			(wb_host_adr_o[7:0]),
				.s_wb_dat_o			(wb_norm_dat_o),
				.s_wb_dat_i			(wb_host_dat_o),
				.s_wb_we_i			(wb_host_we_o),
				.s_wb_sel_i			(wb_host_sel_o),
				.s_wb_stb_i			(wb_norm_stb_i),
				.s_wb_ack_o			(wb_norm_ack_o),
				
		//		.s_axi4s_tuser		(axi4s_fifo_tuser),
		//		.s_axi4s_tlast		(axi4s_fifo_tlast),
		//		.s_axi4s_tdata		(axi4s_fifo_tdata),
		//		.s_axi4s_tvalid		(axi4s_fifo_tvalid),
		//		.s_axi4s_tready		(axi4s_fifo_tready),
				
				.s_axi4s_tuser		(axi4s_csi2_tuser),
				.s_axi4s_tlast		(axi4s_csi2_tlast),
				.s_axi4s_tdata		(axi4s_csi2_tdata),
				.s_axi4s_tvalid		(axi4s_csi2_tvalid),
				.s_axi4s_tready		(axi4s_csi2_tready),
				
				.m_axi4s_tuser		(axi4s_norm_tuser),
				.m_axi4s_tlast		(axi4s_norm_tlast),
				.m_axi4s_tdata		(axi4s_norm_tdata),
				.m_axi4s_tvalid		(axi4s_norm_tvalid),
				.m_axi4s_tready		(axi4s_norm_tready)
			);
	
	
	// 現像
	wire	[0:0]		axi4s_rgb_tuser;
	wire				axi4s_rgb_tlast;
	wire	[39:0]		axi4s_rgb_tdata;
	wire				axi4s_rgb_tvalid;
	wire				axi4s_rgb_tready;
	
	wire	[31:0]		wb_rgb_dat_o;
	wire				wb_rgb_stb_i;
	wire				wb_rgb_ack_o;
	
	video_raw_to_rgb
			#(
				.WB_ADR_WIDTH		(10),
				.WB_DAT_WIDTH		(32),
				
				.DATA_WIDTH			(10),
				
				.IMG_Y_NUM			(Y_NUM),
				.IMG_Y_WIDTH		(12),
				
				.TUSER_WIDTH		(1)
			)
		i_video_raw_to_rgb
			(
				.aresetn			(axi4s_cam_aresetn),
				.aclk				(axi4s_cam_aclk),
				
				.s_wb_rst_i			(wb_rst_o),
				.s_wb_clk_i			(wb_clk_o),
				.s_wb_adr_i			(wb_host_adr_o[9:0]),
				.s_wb_dat_o			(wb_rgb_dat_o),
				.s_wb_dat_i			(wb_host_dat_o),
				.s_wb_we_i			(wb_host_we_o),
				.s_wb_sel_i			(wb_host_sel_o),
				.s_wb_stb_i			(wb_rgb_stb_i),
				.s_wb_ack_o			(wb_rgb_ack_o),
				
				.s_axi4s_tuser		(axi4s_norm_tuser),
				.s_axi4s_tlast		(axi4s_norm_tlast),
				.s_axi4s_tdata		(axi4s_norm_tdata),
				.s_axi4s_tvalid		(axi4s_norm_tvalid),
				.s_axi4s_tready		(axi4s_norm_tready),
				
				.m_axi4s_tuser		(axi4s_rgb_tuser),
				.m_axi4s_tlast		(axi4s_rgb_tlast),
				.m_axi4s_tdata		(axi4s_rgb_tdata),
				.m_axi4s_tvalid		(axi4s_rgb_tvalid),
				.m_axi4s_tready		(axi4s_rgb_tready)
			);
	
	
	
	// DMA write
	wire	[31:0]			wb_vdmaw_dat_o;
	wire					wb_vdmaw_stb_i;
	wire					wb_vdmaw_ack_o;
	
	jelly_vdma_axi4s_to_axi4
			#(
				.ASYNC				(1),
				.FIFO_PTR_WIDTH		(12),
				
				.PIXEL_SIZE			(2),	// 32bit
				.AXI4_ID_WIDTH		(6),
				.AXI4_ADDR_WIDTH	(32),
				.AXI4_DATA_SIZE		(3),	// 64bit
				.AXI4S_DATA_SIZE	(2),	// 32bit
				.AXI4S_USER_WIDTH	(1),
				.INDEX_WIDTH		(8),
				.STRIDE_WIDTH		(14),
				.H_WIDTH			(12),
				.V_WIDTH			(12),
				.SIZE_WIDTH			(32),
				
				.WB_ADR_WIDTH		(8),
				.WB_DAT_WIDTH		(32),
				.INIT_CTL_CONTROL	(2'b00),
				.INIT_PARAM_ADDR	(32'h3000_0000),
				.INIT_PARAM_STRIDE	(X_NUM*2),
				.INIT_PARAM_WIDTH	(X_NUM),
				.INIT_PARAM_HEIGHT	(Y_NUM),
				.INIT_PARAM_SIZE	(X_NUM*Y_NUM),
				.INIT_PARAM_AWLEN	(7)
			)
		i_vdma_axi4s_to_axi4
			(
				.m_axi4_aresetn		(axi4_mem_aresetn),
				.m_axi4_aclk		(axi4_mem_aclk),
				.m_axi4_awid		(axi4_mem0_awid),
				.m_axi4_awaddr		(axi4_mem0_awaddr),
				.m_axi4_awburst		(axi4_mem0_awburst),
				.m_axi4_awcache		(axi4_mem0_awcache),
				.m_axi4_awlen		(axi4_mem0_awlen),
				.m_axi4_awlock		(axi4_mem0_awlock),
				.m_axi4_awprot		(axi4_mem0_awprot),
				.m_axi4_awqos		(axi4_mem0_awqos),
				.m_axi4_awregion	(),
				.m_axi4_awsize		(axi4_mem0_awsize),
				.m_axi4_awvalid		(axi4_mem0_awvalid),
				.m_axi4_awready		(axi4_mem0_awready),
				.m_axi4_wstrb		(axi4_mem0_wstrb),
				.m_axi4_wdata		(axi4_mem0_wdata),
				.m_axi4_wlast		(axi4_mem0_wlast),
				.m_axi4_wvalid		(axi4_mem0_wvalid),
				.m_axi4_wready		(axi4_mem0_wready),
				.m_axi4_bid			(axi4_mem0_bid),
				.m_axi4_bresp		(axi4_mem0_bresp),
				.m_axi4_bvalid		(axi4_mem0_bvalid),
				.m_axi4_bready		(axi4_mem0_bready),
				
				.s_axi4s_aresetn	(axi4s_cam_aresetn),
				.s_axi4s_aclk		(axi4s_cam_aclk),
				.s_axi4s_tuser		(axi4s_rgb_tuser),
				.s_axi4s_tlast		(axi4s_rgb_tlast),
				.s_axi4s_tdata		({
										axi4s_rgb_tdata[39:32],
										axi4s_rgb_tdata[29:22],
										axi4s_rgb_tdata[19:12],
										axi4s_rgb_tdata[ 9: 2]
									}),
				.s_axi4s_tvalid		(axi4s_rgb_tvalid),
				.s_axi4s_tready		(), // (axi4s_rgb_tready),
				
				.s_wb_rst_i			(wb_rst_o),
				.s_wb_clk_i			(wb_clk_o),
				.s_wb_adr_i			(wb_host_adr_o[7:0]),
				.s_wb_dat_o			(wb_vdmaw_dat_o),
				.s_wb_dat_i			(wb_host_dat_o),
				.s_wb_we_i			(wb_host_we_o),
				.s_wb_sel_i			(wb_host_sel_o),
				.s_wb_stb_i			(wb_vdmaw_stb_i),
				.s_wb_ack_o			(wb_vdmaw_ack_o)
			);
	
	
	// read は未使用
	assign axi4_mem0_arid     = 0;
	assign axi4_mem0_araddr   = 0;
	assign axi4_mem0_arburst  = 0;
	assign axi4_mem0_arcache  = 0;
	assign axi4_mem0_arlen    = 0;
	assign axi4_mem0_arlock   = 0;
	assign axi4_mem0_arprot   = 0;
	assign axi4_mem0_arqos    = 0;
	assign axi4_mem0_arregion = 0;
	assign axi4_mem0_arsize   = 0;
	assign axi4_mem0_arvalid  = 0;
	assign axi4_mem0_rready   = 0;
	
	
	
	// ----------------------------------------
	//  OLED
	// ----------------------------------------
	
	wire	[0:0]			axi4s_resize_tuser;
	wire					axi4s_resize_tlast;
	wire	[23:0]			axi4s_resize_tdata;
	wire					axi4s_resize_tvalid;
	wire					axi4s_resize_tready;
	
	wire	[31:0]			wb_resize_dat_o;
	wire					wb_resize_stb_i;
	wire					wb_resize_ack_o;
	
	jelly_video_resize_half_wb
			#(
				.COMPONENT_NUM			(3),
				.DATA_WIDTH				(8),
				.MAX_X_NUM				(1024),
				.RAM_TYPE				("block"),
				.M_SLAVE_REGS			(1),
				.M_MASTER_REGS			(1),
				.AXI4S_TUSER_WIDTH		(1),
				.WB_ADR_WIDTH			(8),
				.WB_DAT_SIZE			(2),	// 0:8bit, 1:16bit, 2:32bit, ...
				
				.INIT_PARAM_V_ENABLE	(1),
				.INIT_PARAM_H_ENABLE	(1)
			)
		i_video_resize_half_wb
			(
				.aresetn				(axi4s_cam_aresetn),
				.aclk					(axi4s_cam_aclk),
				.aclken					(1'b1),
				
				.s_axi4s_tuser			(axi4s_rgb_tuser),
				.s_axi4s_tlast			(axi4s_rgb_tlast),
				.s_axi4s_tdata			({
											axi4s_rgb_tdata[29:22],
											axi4s_rgb_tdata[19:12],
											axi4s_rgb_tdata[ 9: 2]
										}),
				.s_axi4s_tvalid			(axi4s_rgb_tvalid),
				.s_axi4s_tready			(axi4s_rgb_tready),
				
				.m_axi4s_tuser			(axi4s_resize_tuser),
				.m_axi4s_tlast			(axi4s_resize_tlast),
				.m_axi4s_tdata			(axi4s_resize_tdata),
				.m_axi4s_tvalid			(axi4s_resize_tvalid),
				.m_axi4s_tready			(axi4s_resize_tready),

				.s_wb_rst_i				(wb_rst_o),
				.s_wb_clk_i				(wb_clk_o),
				.s_wb_adr_i				(wb_host_adr_o[7:0]),
				.s_wb_dat_o				(wb_resize_dat_o),
				.s_wb_dat_i				(wb_host_dat_o),
				.s_wb_we_i				(wb_host_we_o),
				.s_wb_sel_i				(wb_host_sel_o),
				.s_wb_stb_i				(wb_resize_stb_i),
				.s_wb_ack_o				(wb_resize_ack_o)
		);
	
	
	wire	[0:0]		axi4s_trim_tuser;
	wire				axi4s_trim_tlast;
	wire	[23:0]		axi4s_trim_tdata;
	wire				axi4s_trim_tvalid;
	wire				axi4s_trim_tready;
	
	
	jelly_video_trimming_core
			#(
				.TUSER_WIDTH		(1),
				.TDATA_WIDTH		(24),
				.X_WIDTH			(12),
				.Y_WIDTH			(12)
			)
		i_video_trimming_core
			(
				.aresetn			(axi4s_cam_aresetn),
				.aclk				(axi4s_cam_aclk),
				.aclken				(1'b1),
				
				.param_enable		(1'b1),
	//			.param_x_start		(((640-96)/2),
	//			.param_x_end		((640+96)/2-1),
	//			.param_y_start		(0),
	//			.param_y_end		(63),
				
				.param_x_start		(1),
				.param_x_end		(96),
				.param_y_start		(1),
				.param_y_end		(64),
				
				
				.s_axi4s_tuser		(axi4s_resize_tuser),
				.s_axi4s_tlast		(axi4s_resize_tlast),
				.s_axi4s_tdata		(axi4s_resize_tdata),
				.s_axi4s_tvalid		(axi4s_resize_tvalid),
				.s_axi4s_tready		(axi4s_resize_tready),
				                     
				.m_axi4s_tuser		(axi4s_trim_tuser),
				.m_axi4s_tlast		(axi4s_trim_tlast),
				.m_axi4s_tdata		(axi4s_trim_tdata),
				.m_axi4s_tvalid		(axi4s_trim_tvalid),
				.m_axi4s_tready		(axi4s_trim_tready)
			);
	
	
	wire	[0:0]	axi4s_oledfifo_tuser;
	wire			axi4s_oledfifo_tlast;
	wire	[23:0]	axi4s_oledfifo_tdata;
	wire			axi4s_oledfifo_tvalid;
	wire			axi4s_oledfifo_tready;
	
	jelly_fifo_async_fwtf
			#(
				.DATA_WIDTH			(2+24),
				.PTR_WIDTH			(13),
				.DOUT_REGS			(0),
				.RAM_TYPE			("block"),
				.SLAVE_REGS			(0),
				.MASTER_REGS		(1)
			)
		i_fifo_async_fwtf_oled
			(
				.s_reset			(~axi4s_cam_aresetn),
				.s_clk				(axi4s_cam_aclk),
				.s_data				({axi4s_trim_tuser, axi4s_trim_tlast, axi4s_trim_tdata}),
				.s_valid			(axi4s_trim_tvalid),
				.s_ready			(axi4s_trim_tready),
				.s_free_count		(),
				
				.m_reset			(oled_reset),
				.m_clk				(oled_clk),
				.m_data				({axi4s_oledfifo_tuser, axi4s_oledfifo_tlast, axi4s_oledfifo_tdata}),
				.m_valid			(axi4s_oledfifo_tvalid),
				.m_ready			(axi4s_oledfifo_tready),
				.m_data_count		()
			);
	
	
	wire	[0:0]			axi4s_oled_tuser;
	wire					axi4s_oled_tlast;
	wire	[7:0]			axi4s_oled_tdata;
	wire					axi4s_oled_tvalid;
	wire					axi4s_oled_tready;
	
	video_oled_cnv
		i_video_oled_cnv
			(
				.aresetn			(~oled_reset),
				.aclk				(oled_clk),
				.aclken				(1'b1),
				
				.s_axi4s_tuser		(axi4s_oledfifo_tuser),
				.s_axi4s_tlast		(axi4s_oledfifo_tlast),
				.s_axi4s_tdata		(axi4s_oledfifo_tdata),
				.s_axi4s_tvalid		(axi4s_oledfifo_tvalid),
				.s_axi4s_tready		(axi4s_oledfifo_tready),
				
				.m_axi4s_tuser		(axi4s_oled_tuser),
				.m_axi4s_tlast		(axi4s_oled_tlast),
				.m_axi4s_tdata		(axi4s_oled_tdata),
				.m_axi4s_tvalid		(axi4s_oled_tvalid),
				.m_axi4s_tready		(axi4s_oled_tready)
			);
	
	
	wire	[31:0]			wb_oled_dat_o;
	wire					wb_oled_stb_i;
	wire					wb_oled_ack_o;
	
	oled_control
			#(
				.WB_ADR_WIDTH		(4),
				.WB_DAT_WIDTH		(32)
			)
		i_oled_control
			(
				.reset				(oled_reset),
				.clk				(oled_clk),
				.clk_x7				(oled_clk_x7),
				
				.s_wb_rst_i			(wb_rst_o),
				.s_wb_clk_i			(wb_clk_o),
				.s_wb_adr_i			(wb_host_adr_o[3:0]),
				.s_wb_dat_o			(wb_oled_dat_o),
				.s_wb_dat_i			(wb_host_dat_o),
				.s_wb_we_i			(wb_host_we_o),
				.s_wb_sel_i			(wb_host_sel_o),
				.s_wb_stb_i			(wb_oled_stb_i),
				.s_wb_ack_o			(wb_oled_ack_o),
				
				.s_axi4s_tuser		(axi4s_oled_tuser),
				.s_axi4s_tlast		(axi4s_oled_tlast),
				.s_axi4s_tdata		(axi4s_oled_tdata),
				.s_axi4s_tvalid		(axi4s_oled_tvalid),
				.s_axi4s_tready		(axi4s_oled_tready),
				
				
				.gpo				({dip_sw[0], dip_sw[3:0]}),
				
				.pmod_p				(pmod_jb_p),
				.pmod_n				(pmod_jb_n)
			);
	
	
	
	
	
	// ----------------------------------------
	//  WISHBONE address decoder
	// ----------------------------------------
	
	assign wb_gid_stb_i    = wb_host_stb_o & (wb_host_adr_o[29:10] == 20'h4000_0);
	assign wb_vdmaw_stb_i  = wb_host_stb_o & (wb_host_adr_o[29:10] == 20'h4001_0);
	assign wb_norm_stb_i   = wb_host_stb_o & (wb_host_adr_o[29:10] == 20'h4001_1);
	assign wb_rgb_stb_i    = wb_host_stb_o & (wb_host_adr_o[29:10] == 20'h4001_2);
	assign wb_resize_stb_i = wb_host_stb_o & (wb_host_adr_o[29:10] == 20'h4001_4);
	assign wb_oled_stb_i   = wb_host_stb_o & (wb_host_adr_o[29:10] == 20'h4002_2);
	
	
	assign wb_host_dat_i  = wb_gid_stb_i    ? wb_gid_dat_o    :
	                        wb_vdmaw_stb_i  ? wb_vdmaw_dat_o  :
	                        wb_norm_stb_i   ? wb_norm_dat_o   :
	                        wb_rgb_stb_i    ? wb_rgb_dat_o    :
	                        wb_resize_stb_i ? wb_resize_dat_o :
	                        wb_oled_stb_i   ? wb_oled_dat_o   :
	                        32'h0000_0000;
	
	assign wb_host_ack_i  = wb_gid_stb_i    ? wb_gid_ack_o    :
	                        wb_vdmaw_stb_i  ? wb_vdmaw_ack_o  :
	                        wb_norm_stb_i   ? wb_norm_ack_o   :
	                        wb_rgb_stb_i    ? wb_rgb_ack_o    :
	                        wb_resize_stb_i ? wb_resize_ack_o :
	                        wb_oled_stb_i   ? wb_oled_ack_o   :
	                        wb_host_stb_o;
	
	
	
	// ----------------------------------------
	//  Debug
	// ----------------------------------------
	
	reg		[31:0]		reg_counter_rxbyteclkhs;
	always @(posedge rxbyteclkhs)	reg_counter_rxbyteclkhs <= reg_counter_rxbyteclkhs + 1;
	
	reg		[31:0]		reg_counter_clk200;
	always @(posedge sys_clk200)	reg_counter_clk200 <= reg_counter_clk200 + 1;
	
	reg		[31:0]		reg_counter_clk100;
	always @(posedge sys_clk100)	reg_counter_clk100 <= reg_counter_clk100 + 1;
	
	
	reg		frame_toggle = 0;
	always @(posedge axi4s_cam_aclk) begin
		if ( axi4s_csi2_tuser[0] && axi4s_csi2_tvalid && axi4s_csi2_tready ) begin
			frame_toggle <= ~frame_toggle;
		end
	end
	
	
	assign led[0] = reg_counter_rxbyteclkhs[24];
	assign led[1] = reg_counter_clk200[24];
	assign led[2] = reg_counter_clk100[24];
	assign led[3] = frame_toggle;
	
	assign pmod_a[0]   = frame_toggle;
	assign pmod_a[1]   = reg_counter_rxbyteclkhs[5];
	assign pmod_a[2]   = reg_counter_clk200[5];
	assign pmod_a[3]   = reg_counter_clk100[5];
	assign pmod_a[7:4] = 0;
	
	
	(* MARK_DEBUG = "true" *) reg	dbg_clk200;
	(* MARK_DEBUG = "true" *) reg	dbg_clk100;
	(* MARK_DEBUG = "true" *) reg	dbg_rxbyteclkhs;
	always @(posedge sys_clk100) begin
		dbg_clk200       <= reg_counter_clk200[5];
		dbg_clk100       <= reg_counter_clk100[5];
		dbg_rxbyteclkhs  <= reg_counter_rxbyteclkhs[5];
	end
	
	
endmodule


`default_nettype wire

