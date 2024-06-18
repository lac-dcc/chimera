// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License



`timescale 1ns / 1ps
`default_nettype none

module top
		#(
			parameter	HDMI_RX    = 1,
			parameter	BUF_STRIDE = 4096,
			parameter	VIN_X_NUM  = 720,
			parameter	VIN_Y_NUM  = 480,
			parameter	VOUT_X_NUM = 640,
			parameter	VOUT_Y_NUM = 480
		)
		(
			input	wire			in_clk125,
			
			output	wire			hdmi_out_en,
			inout	wire			hdmi_hpd,
			
			inout	wire			hdmi_scl,
			inout	wire			hdmi_sda,
			
			/*
			output	wire			hdmi_clk_p,
			output	wire			hdmi_clk_n,
			output	wire	[2:0]	hdmi_data_p,
			output	wire	[2:0]	hdmi_data_n,
			*/
			
			input	wire			hdmi_clk_p,
			input	wire			hdmi_clk_n,
			input	wire	[2:0]	hdmi_data_p,
			input	wire	[2:0]	hdmi_data_n,
			
			output	wire			vga_hsync,
			output	wire			vga_vsync,
			output	wire	[4:0]	vga_r,
			output	wire	[5:0]	vga_g,
			output	wire	[4:0]	vga_b,
			
			input	wire	[3:0]	push_sw,
			input	wire	[3:0]	dip_sw,
			output	wire	[3:0]	led,
			output	wire	[7:0]	pmod_a,
			
			inout	wire	[53:0]	MIO,
			inout	wire			DDR_CAS_n,
			inout	wire			DDR_CKE,
			inout	wire			DDR_Clk_n,
			inout	wire			DDR_Clk,
			inout	wire			DDR_CS_n,
			inout	wire			DDR_DRSTB,
			inout	wire			DDR_ODT,
			inout	wire			DDR_RAS_n,
			inout	wire			DDR_WEB,
			inout	wire	[2:0]	DDR_BankAddr,
			inout	wire	[14:0]	DDR_Addr,
			inout	wire			DDR_VRN,
			inout	wire			DDR_VRP,
			inout	wire	[3:0]	DDR_DM,
			inout	wire	[31:0]	DDR_DQ,
			inout	wire	[3:0]	DDR_DQS_n,
			inout	wire	[3:0]	DDR_DQS,
			inout	wire			PS_SRSTB,
			inout	wire			PS_CLK,
			inout	wire			PS_PORB
			
			
			
			/*
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
			*/
		);
	
	
	
	// -------------------------------------
	//  PS
	// -------------------------------------
	
	wire				zynq_fclk_clk0;
	wire				zynq_fclk_clk1;
	wire				zynq_fclk_clk2;
	wire				zynq_fclk_clk3;
	wire				zynq_fclk_reset0_n;
	wire				zynq_fclk_reset1_n;
	wire				zynq_fclk_reset2_n;
	wire				zynq_fclk_reset3_n;
	
	
	wire				axi3_gp0_arvalid;
	wire				axi3_gp0_awvalid;
	wire				axi3_gp0_bready;
	wire				axi3_gp0_rready;
	wire				axi3_gp0_wlast;
	wire				axi3_gp0_wvalid;
	wire	[11:0]		axi3_gp0_arid;
	wire	[11:0]		axi3_gp0_awid;
	wire	[11:0]		axi3_gp0_wid;
	wire	[1:0]		axi3_gp0_arburst;
	wire	[1:0]		axi3_gp0_arlock;
	wire	[2:0]		axi3_gp0_arsize;
	wire	[1:0]		axi3_gp0_awburst;
	wire	[1:0]		axi3_gp0_awlock;
	wire	[2:0]		axi3_gp0_awsize;
	wire	[2:0]		axi3_gp0_arprot;
	wire	[2:0]		axi3_gp0_awprot;
	wire	[31:0]		axi3_gp0_araddr;
	wire	[31:0]		axi3_gp0_awaddr;
	wire	[31:0]		axi3_gp0_wdata;
	wire	[3:0]		axi3_gp0_arcache;
	wire	[3:0]		axi3_gp0_arlen;
	wire	[3:0]		axi3_gp0_arqos;
	wire	[3:0]		axi3_gp0_awcache;
	wire	[3:0]		axi3_gp0_awlen;
	wire	[3:0]		axi3_gp0_awqos;
	wire	[3:0]		axi3_gp0_wstrb;
	wire				axi3_gp0_aclk;
	wire				axi3_gp0_arready;
	wire				axi3_gp0_awready;
	wire				axi3_gp0_bvalid;
	wire				axi3_gp0_rlast;
	wire				axi3_gp0_rvalid;
	wire				axi3_gp0_wready;
	wire	[11:0]		axi3_gp0_bid;
	wire	[11:0]		axi3_gp0_rid;
	wire	[1:0]		axi3_gp0_bresp;
	wire	[1:0]		axi3_gp0_rresp;
	wire	[31:0]		axi3_gp0_rdata;
	
	wire				axi3_hp0_arready;
	wire				axi3_hp0_awready;
	wire				axi3_hp0_bvalid;
	wire				axi3_hp0_rlast;
	wire				axi3_hp0_rvalid;
	wire				axi3_hp0_wready;
	wire	[1:0]		axi3_hp0_bresp;
	wire	[1:0]		axi3_hp0_rresp;
	wire	[5:0]		axi3_hp0_bid;
	wire	[5:0]		axi3_hp0_rid;
	wire	[63:0]		axi3_hp0_rdata;
	wire	[7:0]		axi3_hp0_rcount;
	wire	[7:0]		axi3_hp0_wcount;
	wire	[2:0]		axi3_hp0_racount;
	wire	[5:0]		axi3_hp0_wacount;
	wire				axi3_hp0_aclk;
	wire				axi3_hp0_arvalid;
	wire				axi3_hp0_awvalid;
	wire				axi3_hp0_bready;
	wire				axi3_hp0_rdissuecap1_en = 1'b0;
	wire				axi3_hp0_rready;
	wire				axi3_hp0_wlast;
	wire				axi3_hp0_wrissuecap1_en = 1'b0;
	wire				axi3_hp0_wvalid;
	wire	[1:0]		axi3_hp0_arburst;
	wire	[1:0]		axi3_hp0_arlock;
	wire	[2:0]		axi3_hp0_arsize;
	wire	[1:0]		axi3_hp0_awburst;
	wire	[1:0]		axi3_hp0_awlock;
	wire	[2:0]		axi3_hp0_awsize;
	wire	[2:0]		axi3_hp0_arprot;
	wire	[2:0]		axi3_hp0_awprot;
	wire	[31:0]		axi3_hp0_araddr;
	wire	[31:0]		axi3_hp0_awaddr;
	wire	[3:0]		axi3_hp0_arcache;
	wire	[3:0]		axi3_hp0_arlen;
	wire	[3:0]		axi3_hp0_arqos;
	wire	[3:0]		axi3_hp0_awcache;
	wire	[3:0]		axi3_hp0_awlen;
	wire	[3:0]		axi3_hp0_awqos;
	wire	[5:0]		axi3_hp0_arid;
	wire	[5:0]		axi3_hp0_awid;
	wire	[5:0]		axi3_hp0_wid;
	wire	[63:0]		axi3_hp0_wdata;
	wire	[7:0]		axi3_hp0_wstrb;
	
	processing_system7_0
		i_processing_system7_0
			(
				.I2C0_SDA_I					(1'b1),
				.I2C0_SDA_O					(),
				.I2C0_SDA_T					(),
				.I2C0_SCL_I					(1'b1),
				.I2C0_SCL_O					(),
				.I2C0_SCL_T					(),
				.SDIO0_WP					(1'b0),
				.USB0_PORT_INDCTL			(),
				.USB0_VBUS_PWRSELECT		(),
				.USB0_VBUS_PWRFAULT			(1'b0),
				
				.M_AXI_GP0_ARVALID			(axi3_gp0_arvalid),
				.M_AXI_GP0_AWVALID			(axi3_gp0_awvalid),
				.M_AXI_GP0_BREADY			(axi3_gp0_bready),
				.M_AXI_GP0_RREADY			(axi3_gp0_rready),
				.M_AXI_GP0_WLAST			(axi3_gp0_wlast),
				.M_AXI_GP0_WVALID			(axi3_gp0_wvalid),
				.M_AXI_GP0_ARID				(axi3_gp0_arid),
				.M_AXI_GP0_AWID				(axi3_gp0_awid),
				.M_AXI_GP0_WID				(axi3_gp0_wid),
				.M_AXI_GP0_ARBURST			(axi3_gp0_arburst),
				.M_AXI_GP0_ARLOCK			(axi3_gp0_arlock),
				.M_AXI_GP0_ARSIZE			(axi3_gp0_arsize),
				.M_AXI_GP0_AWBURST			(axi3_gp0_awburst),
				.M_AXI_GP0_AWLOCK			(axi3_gp0_awlock),
				.M_AXI_GP0_AWSIZE			(axi3_gp0_awsize),
				.M_AXI_GP0_ARPROT			(axi3_gp0_arprot),
				.M_AXI_GP0_AWPROT			(axi3_gp0_awprot),
				.M_AXI_GP0_ARADDR			(axi3_gp0_araddr),
				.M_AXI_GP0_AWADDR			(axi3_gp0_awaddr),
				.M_AXI_GP0_WDATA			(axi3_gp0_wdata),
				.M_AXI_GP0_ARCACHE			(axi3_gp0_arcache),
				.M_AXI_GP0_ARLEN			(axi3_gp0_arlen),
				.M_AXI_GP0_ARQOS			(axi3_gp0_arqos),
				.M_AXI_GP0_AWCACHE			(axi3_gp0_awcache),
				.M_AXI_GP0_AWLEN			(axi3_gp0_awlen),
				.M_AXI_GP0_AWQOS			(axi3_gp0_awqos),
				.M_AXI_GP0_WSTRB			(axi3_gp0_wstrb),
				.M_AXI_GP0_ACLK				(axi3_gp0_aclk),
				.M_AXI_GP0_ARREADY			(axi3_gp0_arready),
				.M_AXI_GP0_AWREADY			(axi3_gp0_awready),
				.M_AXI_GP0_BVALID			(axi3_gp0_bvalid),
				.M_AXI_GP0_RLAST			(axi3_gp0_rlast),
				.M_AXI_GP0_RVALID			(axi3_gp0_rvalid),
				.M_AXI_GP0_WREADY			(axi3_gp0_wready),
				.M_AXI_GP0_BID				(axi3_gp0_bid),
				.M_AXI_GP0_RID				(axi3_gp0_rid),
				.M_AXI_GP0_BRESP			(axi3_gp0_bresp	),
				.M_AXI_GP0_RRESP			(axi3_gp0_rresp	),
				.M_AXI_GP0_RDATA			(axi3_gp0_rdata	),
				
				.S_AXI_HP0_ARREADY			(axi3_hp0_arready),
				.S_AXI_HP0_AWREADY			(axi3_hp0_awready),
				.S_AXI_HP0_BVALID			(axi3_hp0_bvalid),
				.S_AXI_HP0_RLAST			(axi3_hp0_rlast),
				.S_AXI_HP0_RVALID			(axi3_hp0_rvalid),
				.S_AXI_HP0_WREADY			(axi3_hp0_wready),
				.S_AXI_HP0_BRESP			(axi3_hp0_bresp),
				.S_AXI_HP0_RRESP			(axi3_hp0_rresp),
				.S_AXI_HP0_BID				(axi3_hp0_bid),
				.S_AXI_HP0_RID				(axi3_hp0_rid),
				.S_AXI_HP0_RDATA			(axi3_hp0_rdata),
				.S_AXI_HP0_RCOUNT			(axi3_hp0_rcount),
				.S_AXI_HP0_WCOUNT			(axi3_hp0_wcount),
				.S_AXI_HP0_RACOUNT			(axi3_hp0_racount),
				.S_AXI_HP0_WACOUNT			(axi3_hp0_wacount),
				.S_AXI_HP0_ACLK				(axi3_hp0_aclk),
				.S_AXI_HP0_ARVALID			(axi3_hp0_arvalid),
				.S_AXI_HP0_AWVALID			(axi3_hp0_awvalid),
				.S_AXI_HP0_BREADY			(axi3_hp0_bready),
				.S_AXI_HP0_RDISSUECAP1_EN	(axi3_hp0_rdissuecap1_en),
				.S_AXI_HP0_RREADY			(axi3_hp0_rready),
				.S_AXI_HP0_WLAST			(axi3_hp0_wlast),
				.S_AXI_HP0_WRISSUECAP1_EN	(axi3_hp0_wrissuecap1_en),
				.S_AXI_HP0_WVALID			(axi3_hp0_wvalid),
				.S_AXI_HP0_ARBURST			(axi3_hp0_arburst),
				.S_AXI_HP0_ARLOCK			(axi3_hp0_arlock),
				.S_AXI_HP0_ARSIZE			(axi3_hp0_arsize),
				.S_AXI_HP0_AWBURST			(axi3_hp0_awburst),
				.S_AXI_HP0_AWLOCK			(axi3_hp0_awlock),
				.S_AXI_HP0_AWSIZE			(axi3_hp0_awsize),
				.S_AXI_HP0_ARPROT			(axi3_hp0_arprot),
				.S_AXI_HP0_AWPROT			(axi3_hp0_awprot),
				.S_AXI_HP0_ARADDR			(axi3_hp0_araddr),
				.S_AXI_HP0_AWADDR			(axi3_hp0_awaddr),
				.S_AXI_HP0_ARCACHE			(axi3_hp0_arcache),
				.S_AXI_HP0_ARLEN			(axi3_hp0_arlen),
				.S_AXI_HP0_ARQOS			(axi3_hp0_arqos),
				.S_AXI_HP0_AWCACHE			(axi3_hp0_awcache),
				.S_AXI_HP0_AWLEN			(axi3_hp0_awlen),
				.S_AXI_HP0_AWQOS			(axi3_hp0_awqos),
				.S_AXI_HP0_ARID				(axi3_hp0_arid),
				.S_AXI_HP0_AWID				(axi3_hp0_awid),
				.S_AXI_HP0_WID				(axi3_hp0_wid),
				.S_AXI_HP0_WDATA			(axi3_hp0_wdata),
				.S_AXI_HP0_WSTRB			(axi3_hp0_wstrb),
				
				.FCLK_CLK0					(zynq_fclk_clk0),
				.FCLK_CLK1					(zynq_fclk_clk1),
				.FCLK_CLK2					(zynq_fclk_clk2),
				.FCLK_CLK3					(zynq_fclk_clk3),
				.FCLK_RESET0_N				(zynq_fclk_reset0_n),
				.FCLK_RESET1_N				(zynq_fclk_reset1_n),
				.FCLK_RESET2_N				(zynq_fclk_reset2_n),
				.FCLK_RESET3_N				(zynq_fclk_reset3_n),
				
				.MIO						(MIO),
				.DDR_CAS_n					(DDR_CAS_n),
				.DDR_CKE					(DDR_CKE),
				.DDR_Clk_n					(DDR_Clk_n),
				.DDR_Clk					(DDR_Clk),
				.DDR_CS_n					(DDR_CS_n),
				.DDR_DRSTB					(DDR_DRSTB),
				.DDR_ODT					(DDR_ODT),
				.DDR_RAS_n					(DDR_RAS_n),
				.DDR_WEB					(DDR_WEB),
				.DDR_BankAddr				(DDR_BankAddr),
				.DDR_Addr					(DDR_Addr),
				.DDR_VRN					(DDR_VRN),
				.DDR_VRP					(DDR_VRP),
				.DDR_DM						(DDR_DM),
				.DDR_DQ						(DDR_DQ),
				.DDR_DQS_n					(DDR_DQS_n),
				.DDR_DQS					(DDR_DQS),
				.PS_SRSTB					(PS_SRSTB),
				.PS_CLK						(PS_CLK),
				.PS_PORB					(PS_PORB)
			);
	
	
	
	// -------------------------------------
	//  Clock & Reset
	// -------------------------------------
	
	
	// peripheral clock (from PS)
	wire			peri_aresetn;
	wire			peri_aclk;
	
	// memory clock (from PS)
	wire			mem_aresetn;
	wire			mem_aclk;
	
	// video output clock (from PS)
	wire			vout_reset;
	wire			vout_clk;
	wire			vout_clk_x5;
	
	// video input clock (from HDMI-RX)
	wire			vin_reset;
	wire			vin_clk;
	
	
	// peripheral clock (from PS)
	assign peri_aresetn = ~vout_reset;
	assign peri_aclk    = vout_clk;
	
	// memory clock (from PS)
	assign mem_aclk     = zynq_fclk_clk1;
	jelly_reset
			#(
				.IN_LOW_ACTIVE		(1),
				.OUT_LOW_ACTIVE		(1)
			)
		i_reset_mem
			(
				.clk				(mem_aclk),
				.in_reset			(zynq_fclk_reset1_n),
				.out_reset			(mem_aresetn)
			);
	
	// video output clock (from PS)
	assign vout_clk     = zynq_fclk_clk2;
	assign vout_clk_x5  = zynq_fclk_clk3;
	jelly_reset
			#(
				.IN_LOW_ACTIVE		(1),
				.OUT_LOW_ACTIVE		(0)
			)
		i_reset_vout
			(
				.clk				(vout_clk),
				.in_reset			(zynq_fclk_reset3_n),
				.out_reset			(vout_reset)
			);
	
	// 200MHz reference clock (from PS)
	wire			ref200_clk   = zynq_fclk_clk0;
	wire			ref200_reset;
	jelly_reset
			#(
				.IN_LOW_ACTIVE		(1),
				.OUT_LOW_ACTIVE		(0)
			)
		i_reset_ref200
			(
				.clk				(ref200_clk),
				.in_reset			(zynq_fclk_reset0_n),
				.out_reset			(ref200_reset)
			);
	
	
	// 125 MHz (from board)
//	wire	clk125;
//	BUFG
//		i_ibufg_clk125
//			(
//				.I					(in_clk125),
//				.O					(clk125)
//			);
	
	
	
	assign axi3_gp0_aclk    = peri_aclk;
//	assign axi3_gp0_aresetn = peri_aresetn;
	
	assign axi3_hp0_aclk    = mem_aclk;
//	assign axi3_hp0_aresetn = mem_aresetn;
	
	
	
	// ----------------------------------------
	//  Peripheral bus
	// ----------------------------------------
	
	
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
	
	axi_protocol_converter_axi3_to_axi4l
		i_axi_protocol_converter_axi3_to_axi4l
			 (
				.aclk				(peri_aclk),
				.aresetn			(peri_aresetn),
				
				.s_axi_awid			(axi3_gp0_awid),
				.s_axi_awaddr		(axi3_gp0_awaddr),
				.s_axi_awlen		(axi3_gp0_awlen),
				.s_axi_awsize		(axi3_gp0_awsize),
				.s_axi_awburst		(axi3_gp0_awburst),
				.s_axi_awlock		(axi3_gp0_awlock),
				.s_axi_awcache		(axi3_gp0_awcache),
				.s_axi_awprot		(axi3_gp0_awprot),
				.s_axi_awqos		(axi3_gp0_awqos),
				.s_axi_awvalid		(axi3_gp0_awvalid),
				.s_axi_awready		(axi3_gp0_awready),
				.s_axi_wid			(axi3_gp0_wid),
				.s_axi_wdata		(axi3_gp0_wdata),
				.s_axi_wstrb		(axi3_gp0_wstrb),
				.s_axi_wlast		(axi3_gp0_wlast),
				.s_axi_wvalid		(axi3_gp0_wvalid),
				.s_axi_wready		(axi3_gp0_wready),
				.s_axi_bid			(axi3_gp0_bid),
				.s_axi_bresp		(axi3_gp0_bresp),
				.s_axi_bvalid		(axi3_gp0_bvalid),
				.s_axi_bready		(axi3_gp0_bready),
				.s_axi_arid			(axi3_gp0_arid),
				.s_axi_araddr		(axi3_gp0_araddr),
				.s_axi_arlen		(axi3_gp0_arlen),
				.s_axi_arsize		(axi3_gp0_arsize),
				.s_axi_arburst		(axi3_gp0_arburst),
				.s_axi_arlock		(axi3_gp0_arlock),
				.s_axi_arcache		(axi3_gp0_arcache),
				.s_axi_arprot		(axi3_gp0_arprot),
				.s_axi_arqos		(axi3_gp0_arqos),
				.s_axi_arvalid		(axi3_gp0_arvalid),
				.s_axi_arready		(axi3_gp0_arready),
				.s_axi_rid			(axi3_gp0_rid),
				.s_axi_rdata		(axi3_gp0_rdata),
				.s_axi_rresp		(axi3_gp0_rresp),
				.s_axi_rlast		(axi3_gp0_rlast),
				.s_axi_rvalid		(axi3_gp0_rvalid),
				.s_axi_rready		(axi3_gp0_rready),
				
				.m_axi_awaddr		(axi4l_peri_awaddr),
				.m_axi_awprot		(axi4l_peri_awprot),
				.m_axi_awvalid		(axi4l_peri_awvalid),
				.m_axi_awready		(axi4l_peri_awready),
				.m_axi_wdata		(axi4l_peri_wdata),
				.m_axi_wstrb		(axi4l_peri_wstrb),
				.m_axi_wvalid		(axi4l_peri_wvalid),
				.m_axi_wready		(axi4l_peri_wready),
				.m_axi_bresp		(axi4l_peri_bresp),
				.m_axi_bvalid		(axi4l_peri_bvalid),
				.m_axi_bready		(axi4l_peri_bready),
				.m_axi_araddr		(axi4l_peri_araddr),
				.m_axi_arprot		(axi4l_peri_arprot),
				.m_axi_arvalid		(axi4l_peri_arvalid),
				.m_axi_arready		(axi4l_peri_arready),
				.m_axi_rdata		(axi4l_peri_rdata),
				.m_axi_rresp		(axi4l_peri_rresp),
				.m_axi_rvalid		(axi4l_peri_rvalid),
				.m_axi_rready		(axi4l_peri_rready)
			);
	
	// AXI4L => WISHBONE
	wire					wb_rst_o;
	wire					wb_clk_o;
	wire	[31:2]			wb_host_adr_o;
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
				.s_axi4l_aresetn	(peri_aresetn),
				.s_axi4l_aclk		(peri_aclk),
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
	//  GPO (LED)
	// ----------------------------------------
	
	wire	[31:0]			wb_gpio_dat_o;
	wire					wb_gpio_stb_i;
	wire					wb_gpio_ack_o;
	
	jelly_gpio
			#(
				.WB_ADR_WIDTH		(2),
				.WB_DAT_WIDTH		(32),
				.PORT_WIDTH			(4),
				.INIT_DIRECTION		(4'b1111),
				.INIT_OUTPUT		(4'b0101),
				.DIRECTION_MASK		(4'b1111)
			)
		i_gpio
			(
				.reset				(wb_rst_o),
				.clk				(wb_clk_o),
				
				.port_i				(led),
				.port_o				(led),
				.port_t				(),
				
				.s_wb_adr_i			(wb_host_adr_o[2 +: 2]),
				.s_wb_dat_o			(wb_gpio_dat_o),
				.s_wb_dat_i			(wb_host_dat_o),
				.s_wb_we_i			(wb_host_we_o),
				.s_wb_sel_i			(wb_host_sel_o),
				.s_wb_stb_i			(wb_gpio_stb_i),
				.s_wb_ack_o			(wb_gpio_ack_o)
			);
	
	
	
	// ----------------------------------------
	//  DMA write
	// ----------------------------------------
	
	wire	[0:0]			axi4s_memw_tuser;
	wire					axi4s_memw_tlast;
	wire	[31:0]			axi4s_memw_tdata;
	wire					axi4s_memw_tvalid;
	wire					axi4s_memw_tready;
	
	
	wire	[31:0]			wb_vdmaw_dat_o;
	wire					wb_vdmaw_stb_i;
	wire					wb_vdmaw_ack_o;
	
	jelly_vdma_axi4s_to_axi4
			#(
				.ASYNC				(1),
				.FIFO_PTR_WIDTH		(10),
				
				.PIXEL_SIZE			(2),	// 32bit
				.AXI4_ID_WIDTH		(6),
				.AXI4_ADDR_WIDTH	(32),
				.AXI4_DATA_SIZE		(3),	// 64bit
				.AXI4_LEN_WIDTH		(4),	// AXI3,
				.AXI4_QOS_WIDTH		(4),
				.AXI4S_DATA_SIZE	(2),	// 32bit
				.AXI4S_USER_WIDTH	(1),
				.INDEX_WIDTH		(8),
				.STRIDE_WIDTH		(14),
				.H_WIDTH			(12),
				.V_WIDTH			(12),
				.WB_ADR_WIDTH		(8),
				.WB_DAT_WIDTH		(32),
				.INIT_CTL_CONTROL	(2'b11),
				.INIT_PARAM_ADDR	(32'h1800_0000),
				.INIT_PARAM_STRIDE	(BUF_STRIDE),
				.INIT_PARAM_WIDTH	(VIN_X_NUM),
				.INIT_PARAM_HEIGHT	(VIN_Y_NUM),
				.INIT_PARAM_SIZE	(VIN_X_NUM*VIN_Y_NUM),
				.INIT_PARAM_AWLEN	(7)
			)
		i_vdma_axi4s_to_axi4
			(
				.m_axi4_aresetn		(mem_aresetn),
				.m_axi4_aclk		(mem_aclk),
				.m_axi4_awid		(axi3_hp0_awid),
				.m_axi4_awaddr		(axi3_hp0_awaddr),
				.m_axi4_awburst		(axi3_hp0_awburst),
				.m_axi4_awcache		(axi3_hp0_awcache),
				.m_axi4_awlen		(axi3_hp0_awlen),
				.m_axi4_awlock		(axi3_hp0_awlock),
				.m_axi4_awprot		(axi3_hp0_awprot),
				.m_axi4_awqos		(axi3_hp0_awqos),
				.m_axi4_awregion	(),
				.m_axi4_awsize		(axi3_hp0_awsize),
				.m_axi4_awvalid		(axi3_hp0_awvalid),
				.m_axi4_awready		(axi3_hp0_awready),
				.m_axi4_wstrb		(axi3_hp0_wstrb),
				.m_axi4_wdata		(axi3_hp0_wdata),
				.m_axi4_wlast		(axi3_hp0_wlast),
				.m_axi4_wvalid		(axi3_hp0_wvalid),
				.m_axi4_wready		(axi3_hp0_wready),
				.m_axi4_bid			(axi3_hp0_bid),
				.m_axi4_bresp		(axi3_hp0_bresp),
				.m_axi4_bvalid		(axi3_hp0_bvalid),
				.m_axi4_bready		(axi3_hp0_bready),
				
				.s_axi4s_aresetn	(~vin_reset),
				.s_axi4s_aclk		(vin_clk),
				.s_axi4s_tuser		(axi4s_memw_tuser),
				.s_axi4s_tlast		(axi4s_memw_tlast),
				.s_axi4s_tdata		(axi4s_memw_tdata),
				.s_axi4s_tvalid		(axi4s_memw_tvalid),
				.s_axi4s_tready		(axi4s_memw_tready),
				
				.s_wb_rst_i			(wb_rst_o),
				.s_wb_clk_i			(wb_clk_o),
				.s_wb_adr_i			(wb_host_adr_o[2 +: 8]),
				.s_wb_dat_o			(wb_vdmaw_dat_o),
				.s_wb_dat_i			(wb_host_dat_o),
				.s_wb_we_i			(wb_host_we_o),
				.s_wb_sel_i			(wb_host_sel_o),
				.s_wb_stb_i			(wb_vdmaw_stb_i),
				.s_wb_ack_o			(wb_vdmaw_ack_o)
			);
	
	assign axi3_hp0_wid = 0;
	
	
	
	// ----------------------------------------
	//  DMA read
	// ----------------------------------------
	
	wire	[0:0]			axi4s_memr_tuser;
	wire					axi4s_memr_tlast;
	wire	[31:0]			axi4s_memr_tdata;
	wire					axi4s_memr_tvalid;
	wire					axi4s_memr_tready;

	wire	[31:0]			wb_vdmar_dat_o;
	wire					wb_vdmar_stb_i;
	wire					wb_vdmar_ack_o;
	
	jelly_vdma_axi4_to_axi4s
			#(
				.ASYNC				(1),
				.FIFO_PTR_WIDTH		(10),
				.PIXEL_SIZE			(2),	// 32bit
				.AXI4_ID_WIDTH		(6),
				.AXI4_ADDR_WIDTH	(32),
				.AXI4_DATA_SIZE		(3),	// 64bit
				.AXI4_LEN_WIDTH		(4),	// AXI3
				.AXI4_QOS_WIDTH		(4),
				.AXI4S_USER_WIDTH	(1),
				.AXI4S_DATA_SIZE	(2),	// 32bit
				.INDEX_WIDTH		(8),
				.STRIDE_WIDTH		(14),
				.H_WIDTH			(12),
				.V_WIDTH			(12),
				.WB_ADR_WIDTH		(8),
				.WB_DAT_WIDTH		(32),
				.INIT_CTL_CONTROL	(2'b11),
				.INIT_PARAM_ADDR	(32'h1800_0000),
				.INIT_PARAM_STRIDE	(BUF_STRIDE),
				.INIT_PARAM_WIDTH	(VOUT_X_NUM),
				.INIT_PARAM_HEIGHT	(VOUT_Y_NUM),
				.INIT_PARAM_SIZE	(VOUT_X_NUM*VOUT_Y_NUM),
				.INIT_PARAM_ARLEN	(8'h0f)
			)
		i_vdma_axi4_to_axi4s
			(
				.m_axi4_aresetn		(mem_aresetn),
				.m_axi4_aclk		(mem_aclk),
				.m_axi4_arid		(axi3_hp0_arid),
				.m_axi4_araddr		(axi3_hp0_araddr),
				.m_axi4_arburst		(axi3_hp0_arburst),
				.m_axi4_arcache		(axi3_hp0_arcache),
				.m_axi4_arlen		(axi3_hp0_arlen),
				.m_axi4_arlock		(axi3_hp0_arlock),
				.m_axi4_arprot		(axi3_hp0_arprot),
				.m_axi4_arqos		(axi3_hp0_arqos),
				.m_axi4_arregion	(),
				.m_axi4_arsize		(axi3_hp0_arsize),
				.m_axi4_arvalid		(axi3_hp0_arvalid),
				.m_axi4_arready		(axi3_hp0_arready),
				.m_axi4_rid			(axi3_hp0_rid),
				.m_axi4_rresp		(axi3_hp0_rresp),
				.m_axi4_rdata		(axi3_hp0_rdata),
				.m_axi4_rlast		(axi3_hp0_rlast),
				.m_axi4_rvalid		(axi3_hp0_rvalid),
				.m_axi4_rready		(axi3_hp0_rready),
				
				.m_axi4s_aresetn	(~vout_reset),
				.m_axi4s_aclk		(vout_clk),
				.m_axi4s_tuser		(axi4s_memr_tuser),
				.m_axi4s_tlast		(axi4s_memr_tlast),
				.m_axi4s_tdata		(axi4s_memr_tdata),
				.m_axi4s_tvalid		(axi4s_memr_tvalid),
				.m_axi4s_tready		(axi4s_memr_tready),
				
				.s_wb_rst_i			(wb_rst_o),
				.s_wb_clk_i			(wb_clk_o),
				.s_wb_adr_i			(wb_host_adr_o[2 +: 8]),
				.s_wb_dat_o			(wb_vdmar_dat_o),
				.s_wb_dat_i			(wb_host_dat_o),
				.s_wb_we_i			(wb_host_we_o),
				.s_wb_sel_i			(wb_host_sel_o),
				.s_wb_stb_i			(wb_vdmar_stb_i),
				.s_wb_ack_o			(wb_vdmar_ack_o)
		);
	
	
	wire					vout_vsgen_vsync;
	wire					vout_vsgen_hsync;
	wire					vout_vsgen_de;
	
	wire	[31:0]			wb_vsgen_dat_o;
	wire					wb_vsgen_stb_i;
	wire					wb_vsgen_ack_o;
	
	jelly_vsync_generator
			#(
				.WB_ADR_WIDTH		(8),
				.WB_DAT_WIDTH		(32),
				.INIT_CTL_CONTROL	(1'b1),
				.INIT_HTOTAL		(96 + 16 + VOUT_X_NUM + 48),
				.INIT_HDISP_START	(96 + 16),
				.INIT_HDISP_END		(96 + 16 + VOUT_X_NUM),
				.INIT_HSYNC_START	(0),
				.INIT_HSYNC_END		(96),
				.INIT_HSYNC_POL		(0),
				.INIT_VTOTAL		(2 + 10 + VOUT_Y_NUM + 33),
				.INIT_VDISP_START	(2 + 10),
				.INIT_VDISP_END		(2 + 10 + VOUT_Y_NUM),
				.INIT_VSYNC_START	(0),
				.INIT_VSYNC_END		(2),
				.INIT_VSYNC_POL		(0)
			)
		i_vsync_generator
			(
				.reset				(vout_reset),
				.clk				(vout_clk),
				
				.out_vsync			(vout_vsgen_vsync),
				.out_hsync			(vout_vsgen_hsync),
				.out_de				(vout_vsgen_de),
				
				.s_wb_rst_i			(wb_rst_o),
				.s_wb_clk_i			(wb_clk_o),
				.s_wb_adr_i			(wb_host_adr_o[2 +: 8]),
				.s_wb_dat_o			(wb_vsgen_dat_o),
				.s_wb_dat_i			(wb_host_dat_o),
				.s_wb_we_i			(wb_host_we_o),
				.s_wb_sel_i			(wb_host_sel_o),
				.s_wb_stb_i			(wb_vsgen_stb_i),
				.s_wb_ack_o			(wb_vsgen_ack_o)
			);
	
	
	wire			vout_vsync;
	wire			vout_hsync;
	wire			vout_de;
	wire	[23:0]	vout_data;
	wire	[3:0]	vout_ctl;
	
	jelly_vout_axi4s
			#(
				.WIDTH				(24)
			)
		i_vout_axi4s
			(
				.reset				(vout_reset),
				.clk				(vout_clk),
				
				.s_axi4s_tuser		(axi4s_memr_tuser),
				.s_axi4s_tlast		(axi4s_memr_tlast),
				.s_axi4s_tdata		(axi4s_memr_tdata[23:0]),
				.s_axi4s_tvalid		(axi4s_memr_tvalid),
				.s_axi4s_tready		(axi4s_memr_tready),
				
				.in_vsync			(vout_vsgen_vsync),
				.in_hsync			(vout_vsgen_hsync),
				.in_de				(vout_vsgen_de),
				.in_ctl				(4'd0),
				
				.out_vsync			(vout_vsync),
				.out_hsync			(vout_hsync),
				.out_de				(vout_de),
				.out_data			(vout_data),
				.out_ctl			(vout_ctl)
			);
	
	
	
	// ----------------------------------------
	//  HDMI-RX
	// ----------------------------------------
	
	localparam	IDELAYCTRL_GROUP_HDMIRX = "IODELAY_HDMIRX" ;
	
	wire	[0:0]			axi4s_vin_tuser;
	wire					axi4s_vin_tlast;
	wire	[31:0]			axi4s_vin_tdata;
	wire					axi4s_vin_tvalid;
	wire					axi4s_vin_tready;
	
	generate
	if ( HDMI_RX ) begin
	
		wire	hdmirx_idelayctrl_rdy;
		
		(* IODELAY_GROUP=IDELAYCTRL_GROUP_HDMIRX *)
		IDELAYCTRL
			i_idelayctrl_hdmirx
				(
					.RST		(ref200_reset),
					.REFCLK		(ref200_clk),
					.RDY		(hdmirx_idelayctrl_rdy)
				);
		
		wire	hdmirx_reset;
		jelly_reset
			i_reset_hdmirx
				(
					.clk		(ref200_clk),
					.in_reset	(~hdmirx_idelayctrl_rdy || ref200_reset),
					.out_reset	(hdmirx_reset)
				);
		
		
		assign hdmi_out_en = 1'b0;
		assign hdmi_hpd    = 1'b1;
		
		
		wire			vin_vsync;
		wire			vin_hsync;
		wire			vin_de;
		wire	[23:0]	vin_data;
		wire	[3:0]	vin_ctl;
		wire			vin_valid;
		
		jelly_hdmi_rx
				#(
					.IDELAYCTRL_GROUP	(IDELAYCTRL_GROUP_HDMIRX)
				)
			i_hdmi_rx
				(
					.in_reset			(hdmirx_reset),
					.in_clk_p			(hdmi_clk_p),
					.in_clk_n			(hdmi_clk_n),
					.in_data_p			(hdmi_data_p),
					.in_data_n			(hdmi_data_n),
					
					.out_clk			(vin_clk),
					.out_reset			(vin_reset),
					.out_vsync			(vin_vsync),
					.out_hsync			(vin_hsync),
					.out_de				(vin_de),
					.out_data			(vin_data),
					.out_ctl			(vin_ctl),
					.out_valid			(vin_valid)
				);
		
		jelly_vin_axi4s
				#(
					.WIDTH				(24)
				)
			i_vin_axi4s
				(
					.reset				(vin_reset),
					.clk				(vin_clk),
					
					.in_vsync			(vin_vsync),
					.in_hsync			(vin_hsync),
					.in_de				(vin_de),
					.in_data			(vin_data),
					.in_ctl				(vin_ctl),
					
					.m_axi4s_tuser		(axi4s_vin_tuser),
					.m_axi4s_tlast		(axi4s_vin_tlast),
					.m_axi4s_tdata		(axi4s_vin_tdata),
					.m_axi4s_tvalid		(axi4s_vin_tvalid)
				);
		
		
		// EDID
		wire	hdmi_scl_t;
		wire	hdmi_scl_i;
		
		wire	hdmi_sda_t;
		wire	hdmi_sda_i;
		
		IOBUF	i_bufio_hdmi_scl (.IO(hdmi_scl), .I(1'b0), .O(hdmi_scl_i), .T(hdmi_scl_t));
		IOBUF	i_bufio_hdmi_sda (.IO(hdmi_sda), .I(1'b0), .O(hdmi_sda_i), .T(hdmi_sda_t));
		
		
		wire			bus_en;
		wire			bus_start;
		wire			bus_rw;
		wire	[7:0]	bus_wdata;
		wire	[7:0]	bus_rdata;
		
		jelly_i2c_slave
				#(
					.DIVIDER_WIDTH	(3),
					.DIVIDER_COUNT	(7)
				)
			i_i2c_slave
				(
					.reset			(~peri_aresetn),
					.clk			(peri_aclk),
					
					.addr			(7'h50),
					
					.i2c_scl_i		(hdmi_scl_i),
					.i2c_scl_t		(hdmi_scl_t),
					.i2c_sda_i		(hdmi_sda_i),
					.i2c_sda_t		(hdmi_sda_t),
					
					.bus_en			(bus_en),
					.bus_start		(bus_start),
					.bus_rw			(bus_rw),
					.bus_wdata		(bus_wdata),
					.bus_rdata		(bus_rdata)
				);
		
		reg		[6:0]	reg_edid_addr;
		always @(posedge peri_aclk) begin
			if ( !peri_aresetn ) begin
				reg_edid_addr <= 0;
			end
			else begin
				if ( bus_en && !bus_start ) begin
					if ( bus_rw == 1'b0 ) begin
						reg_edid_addr <= bus_wdata;
					end
					else begin
						reg_edid_addr <= reg_edid_addr + 1;
					end
				end
				
			end
		end
		
		jelly_edid_rom
			i_edid_rom
				(
					.clk		(peri_aclk),
					.en			(1'b1),
					.addr		(reg_edid_addr),
					.dout		(bus_rdata)
				);
	end
	else begin
		// pattern generator(dummy input)
		assign	vin_reset = vout_reset;
		assign	vin_clk   = vout_clk;
		
		jelly_pattern_generator_axi4s
				#(
					.AXI4S_DATA_WIDTH	(32),
					.X_NUM				(VIN_X_NUM),
					.Y_NUM				(VIN_Y_NUM)
				)
			i_pattern_generator_axi4s
				(
					.aresetn			(~vin_reset),
					.aclk				(vin_clk),
					
					.m_axi4s_tuser		(axi4s_memw_tuser),
					.m_axi4s_tlast		(axi4s_memw_tlast),
					.m_axi4s_tdata		(axi4s_memw_tdata),
					.m_axi4s_tvalid		(axi4s_memw_tvalid),
					.m_axi4s_tready		(axi4s_memw_tready)
				);
	end
	endgenerate
	
	
	// ----------------------------------------
	//  image proc
	// ----------------------------------------
	
	generate
	if ( 0 ) begin
		// bypass
		assign axi4s_memw_tdata  = axi4s_vin_tdata;
		assign axi4s_memw_tlast  = axi4s_vin_tlast;
		assign axi4s_memw_tuser  = axi4s_vin_tuser;
		assign axi4s_memw_tvalid = axi4s_vin_tvalid;
		assign axi4s_vin_tready  = axi4s_memw_tready;
	end
	else begin
		wire								img_cke;
		
		wire								src_img_line_first;
		wire								src_img_line_last;
		wire								src_img_pixel_first;
		wire								src_img_pixel_last;
		wire	[8-1:0]			src_img_data;
		
		wire								sink_img_line_first;
		wire								sink_img_line_last;
		wire								sink_img_pixel_first;
		wire								sink_img_pixel_last;
		wire	[8-1:0]			sink_img_data;
		
		assign axi4s_memw_tdata[15:8]  = axi4s_memw_tdata[7:0];
		assign axi4s_memw_tdata[23:16] = axi4s_memw_tdata[7:0];
		
		jelly_axi4s_img
				#(
					.DATA_WIDTH				(8),
					.IMG_Y_NUM				(480),
					.IMG_Y_WIDTH			(9),
					.BLANK_Y_WIDTH			(8),
					.IMG_CKE_BUFG			(0),
					.USE_DE					(0)
				)
			jelly_axi4s_img
				(
					.reset					(vin_reset),
					.clk					(vin_clk),
					
					.param_blank_num		(8'hff),
					
					.s_axi4s_tdata			(axi4s_vin_tdata),
					.s_axi4s_tlast			(axi4s_vin_tlast),
					.s_axi4s_tuser			(axi4s_vin_tuser),
					.s_axi4s_tvalid			(axi4s_vin_tvalid),
					.s_axi4s_tready			(axi4s_vin_tready),
					
					.m_axi4s_tdata			(axi4s_memw_tdata[7:0]),
					.m_axi4s_tlast			(axi4s_memw_tlast),
					.m_axi4s_tuser			(axi4s_memw_tuser),
					.m_axi4s_tvalid			(axi4s_memw_tvalid),
					.m_axi4s_tready			(axi4s_memw_tready),
					
					
					.img_cke				(img_cke),
					                         
					.src_img_line_first		(src_img_line_first),
					.src_img_line_last		(src_img_line_last),
					.src_img_pixel_first	(src_img_pixel_first),
					.src_img_pixel_last		(src_img_pixel_last),
					.src_img_data			(src_img_data),
					                         
					.sink_img_line_first	(sink_img_line_first),
					.sink_img_line_last		(sink_img_line_last),
					.sink_img_pixel_first	(sink_img_pixel_first),
					.sink_img_pixel_last	(sink_img_pixel_last),
					.sink_img_data			(sink_img_data)
				);
		
		wire								img_blk_line_first;
		wire								img_blk_line_last;
		wire								img_blk_pixel_first;
		wire								img_blk_pixel_last;
		wire	[3*3*8-1:0]					img_blk_data;
		
		jelly_img_blk_buffer
				#(
					.DATA_WIDTH				(8),
					.LINE_NUM				(3),
					.PIXEL_NUM				(3),
					.MAX_Y_NUM				(1024),
					.RAM_TYPE				("block")
				)
			i_img_blk_buffer
				(
					.reset					(vin_reset),
					.clk					(vin_clk),
					.cke					(img_cke),
					
					.s_img_line_first		(src_img_line_first),
					.s_img_line_last		(src_img_line_last),
					.s_img_pixel_first		(src_img_pixel_first),
					.s_img_pixel_last		(src_img_pixel_last),
					.s_img_data				(src_img_data),
					
					.m_img_line_first		(img_blk_line_first),
					.m_img_line_last		(img_blk_line_last),
					.m_img_pixel_first		(img_blk_pixel_first),
					.m_img_pixel_last		(img_blk_pixel_last),
					.m_img_data				(img_blk_data)
				);
		
		wire							img_sobel_line_first;
		wire							img_sobel_line_last;
		wire							img_sobel_pixel_first;
		wire							img_sobel_pixel_last;
		wire	[8-1:0]		img_sobel_data;
		
		jelly_img_sobel_filter
				#(
					.DATA_WIDTH				(8)
				)
			i_img_sobel_filter
				(
					.reset					(vin_reset),
					.clk					(vin_clk),
					.cke					(img_cke),
					
					.s_img_line_first		(img_blk_line_first),
					.s_img_line_last		(img_blk_line_last),
					.s_img_pixel_first		(img_blk_pixel_first),
					.s_img_pixel_last		(img_blk_pixel_last),
					.s_img_data				(img_blk_data),
					
					.m_img_line_first		(img_sobel_line_first),
					.m_img_line_last		(img_sobel_line_last),
					.m_img_pixel_first		(img_sobel_pixel_first),
					.m_img_pixel_last		(img_sobel_pixel_last),
					.m_img_data				(img_sobel_data)
				);
		
		assign sink_img_line_first  = img_sobel_line_first;
		assign sink_img_line_last   = img_sobel_line_last;
		assign sink_img_pixel_first = img_sobel_pixel_first;
		assign sink_img_pixel_last  = img_sobel_pixel_last;
		assign sink_img_data        = img_sobel_data;
	end
	endgenerate
	
	
	
	// ----------------------------------------
	//  VGA-TX
	// ----------------------------------------
	
	(* IOB = "true" *)	reg				reg_vga_hsync;
	(* IOB = "true" *)	reg				reg_vga_vsync;
	(* IOB = "true" *)	reg		[4:0]	reg_vga_r;
	(* IOB = "true" *)	reg		[5:0]	reg_vga_g;
	(* IOB = "true" *)	reg		[4:0]	reg_vga_b;
	
	always @(posedge vout_clk) begin
		reg_vga_hsync <= vout_hsync;
		reg_vga_vsync <= vout_vsync;
		reg_vga_r     <= vout_data[23:19];
		reg_vga_g     <= vout_data[15:10];
		reg_vga_b     <= vout_data[7:3];
	end
	
	assign vga_hsync = reg_vga_hsync;
	assign vga_vsync = reg_vga_vsync;
	assign vga_r     = reg_vga_r;
	assign vga_g     = reg_vga_g;
	assign vga_b     = reg_vga_b;
	
	
	
	// ----------------------------------------
	//  HDMI-TX
	// ----------------------------------------
	
	generate
	if ( !HDMI_RX ) begin
		assign hdmi_out_en = 1'b1;
		assign hdmi_hpd    = 1'bz;
		
		jelly_dvi_tx
			i_dvi_tx
				(
					.reset		(vout_reset),
					.clk		(vout_clk),
					.clk_x5		(vout_clk_x5),
					
					.in_vsync	(vout_vsync),
					.in_hsync	(vout_hsync),
					.in_de		(vout_de),
					.in_data	(vout_data),
					.in_ctl		(4'd0),
					
					.out_clk_p	(hdmi_clk_p),
					.out_clk_n	(hdmi_clk_n),
					.out_data_p	(hdmi_data_p),
					.out_data_n	(hdmi_data_n)
				);
	end
	endgenerate
	
	
	
	// ----------------------------------------
	//  WISHBONE address decoder
	// ----------------------------------------
	
	assign wb_vdmar_stb_i = wb_host_stb_o & (wb_host_adr_o[31:12] == 20'h4001_0);
	assign wb_vsgen_stb_i = wb_host_stb_o & (wb_host_adr_o[31:12] == 20'h4001_1);
	assign wb_vdmaw_stb_i = wb_host_stb_o & (wb_host_adr_o[31:12] == 20'h4001_8);
	assign wb_gpio_stb_i  = wb_host_stb_o & (wb_host_adr_o[31:12] == 20'h4002_1);
	
	assign wb_host_dat_i  = wb_vdmar_stb_i ? wb_vdmar_dat_o :
	                        wb_vsgen_stb_i ? wb_vsgen_dat_o :
	                        wb_vdmaw_stb_i ? wb_vdmaw_dat_o :
	                        wb_gpio_stb_i  ? wb_gpio_dat_o :
	                        32'h0000_0000;
	
	assign wb_host_ack_i  = wb_vdmar_stb_i ? wb_vdmar_ack_o :
	                        wb_vsgen_stb_i ? wb_vsgen_ack_o :
	                        wb_vdmaw_stb_i ? wb_vdmaw_ack_o :
	                        wb_gpio_stb_i  ? wb_gpio_ack_o :
	                        wb_host_stb_o;
	
	
	
	
	// ----------------------------------------
	//  Debug
	// ----------------------------------------
	
	/*
	reg		[23:0]		reg_counter0;
	reg		[23:0]		reg_counter1;
	always @(posedge FCLK_CLK0) reg_counter0 <= reg_counter0+1;
	always @(posedge in_clk125) reg_counter1 <= reg_counter1+1;
	
	assign led[0]      = reg_counter0[23];
	assign led[1]      = reg_counter1[23];
	assign led[2]      = FCLK_RESET0_N;
	assign led[3]      = 0;
	*/
	
	assign pmod_a[7:0] = 0;
	
	/*
	assign pmod_a[0]   = 1'b0; //vin_clk;
	assign pmod_a[1]   = vin_vsync;
	assign pmod_a[2]   = vin_hsync;
	assign pmod_a[3]   = vin_de;
	assign pmod_a[4]   = vin_reset;
	assign pmod_a[5]   = vin_valid;
	assign pmod_a[7:6] = 0;
	*/
	
endmodule


`default_nettype wire


// end of file
