// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License



`timescale 1ns / 1ps
`default_nettype none

module top
		#(
			parameter	HDMI_TX    = 1,
			parameter	BUF_STRIDE = 4096,
			parameter	VIN_X_NUM  = 720,
			parameter	VIN_Y_NUM  = 480,
//			parameter	VOUT_X_NUM = 640,
//			parameter	VOUT_Y_NUM = 480
			parameter	VOUT_X_NUM = 1920,
			parameter	VOUT_Y_NUM = 1080
		)
		(
			input	wire			in_clk125,
			
			output	wire			hdmi_out_en,
			inout	wire			hdmi_hpd,
			
			inout	wire			hdmi_scl,
			inout	wire			hdmi_sda,
			
			output	wire			hdmi_clk_p,
			output	wire			hdmi_clk_n,
			output	wire	[2:0]	hdmi_data_p,
			output	wire	[2:0]	hdmi_data_n,
			
			/*
			input	wire			hdmi_clk_p,
			input	wire			hdmi_clk_n,
			input	wire	[2:0]	hdmi_data_p,
			input	wire	[2:0]	hdmi_data_n,
			*/
			
			output	wire			vga_hsync,
			output	wire			vga_vsync,
			output	wire	[4:0]	vga_r,
			output	wire	[5:0]	vga_g,
			output	wire	[4:0]	vga_b,
			
			input	wire	[3:0]	push_sw,
			input	wire	[3:0]	dip_sw,
			output	wire	[3:0]	led,
			output	wire	[7:0]	pmod_a,
			
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
	
	// 200MHz reference clock (from board)
	wire			ref200_reset;
	wire			ref200_clk;
	
	
	// core clk
//	wire			core_reset = ref200_reset;
//	wire			core_clk   = ref200_clk;
	wire			core_reset = vout_reset;
	wire			core_clk   = vout_clk_x5;
	
	
	// 125 MHz
	wire	clk125;
	BUFG
		i_ibufg_clk125
			(
				.I		(in_clk125),
				.O		(clk125)
			);
	
	// clk200
	wire	mmcm_clk200, clk200;
	wire	mmcm_clkfb, clkfb;
	wire	mmcm_locked;
	
	MMCME2_ADV
			#(
				.BANDWIDTH				("OPTIMIZED"),
				.CLKOUT4_CASCADE		("FALSE"),
				.COMPENSATION			("ZHOLD"),
				.STARTUP_WAIT			("FALSE"),
				.DIVCLK_DIVIDE			(1),
				.CLKFBOUT_MULT_F		(8.000),
				.CLKFBOUT_PHASE			(0.000),
				.CLKFBOUT_USE_FINE_PS	("FALSE"),
				.CLKOUT0_DIVIDE_F		(5.000),
				.CLKOUT0_PHASE			(0.000),
				.CLKOUT0_DUTY_CYCLE		(0.500),
				.CLKOUT0_USE_FINE_PS	("FALSE"),
				.CLKIN1_PERIOD			(8.000),
				.REF_JITTER1			(0.010)
			)
		i_mmcme2
			(
				.CLKFBOUT 				(mmcm_clkfb),
				.CLKFBOUTB				(),
				.CLKOUT0  				(mmcm_clk200),
				.CLKOUT0B 				(),
				.CLKOUT1  				(),
				.CLKOUT1B 				(),
				.CLKOUT2  				(),
				.CLKOUT2B 				(),
				.CLKOUT3  				(),
				.CLKOUT3B 				(),
				.CLKOUT4  				(),
				.CLKOUT5  				(),
				.CLKOUT6  				(),
				
				.CLKFBIN           		(clkfb),
				.CLKIN1              	(clk125),
				.CLKIN2              	(1'b0),
				
				.CLKINSEL            	(1'b1),
				
				.DADDR               	(7'h0),
				.DCLK                	(1'b0),
				.DEN                 	(1'b0),
				.DI                 	(16'h0),
				.DO                 	(),
				.DRDY                	(),
				.DWE                 	(1'b0),
				
				.PSCLK               	(1'b0),
				.PSEN                	(1'b0),
				.PSINCDEC            	(1'b0),
				.PSDONE              	(),
				
				.LOCKED              	(mmcm_locked),
				.CLKINSTOPPED        	(),
				.CLKFBSTOPPED        	(),
				.PWRDWN              	(1'b0),
				.RST                 	(~mem_aresetn)
			);
	
	BUFG	i_bufg_clkfb (.I(mmcm_clkfb),  .O(clkfb));
	BUFG	i_bugf_clk200(.I(mmcm_clk200), .O(clk200));
	
	assign ref200_clk = clk200;
	
	jelly_reset
		i_reset_refclk
			(
				.clk		(ref200_clk),
				.in_reset	(~mem_aresetn),
				.out_reset	(ref200_reset)
			);
	
	
	
	
	// ----------------------------------------
	//  Processor System
	// ----------------------------------------
	
	wire	[31:0]	axi4l_peri00_awaddr;
	wire	[2:0]	axi4l_peri00_awprot;
	wire			axi4l_peri00_awvalid;
	wire			axi4l_peri00_awready;
	wire	[3:0]	axi4l_peri00_wstrb;
	wire	[31:0]	axi4l_peri00_wdata;
	wire			axi4l_peri00_wvalid;
	wire			axi4l_peri00_wready;
	wire	[1:0]	axi4l_peri00_bresp;
	wire			axi4l_peri00_bvalid;
	wire			axi4l_peri00_bready;
	wire	[31:0]	axi4l_peri00_araddr;
	wire	[2:0]	axi4l_peri00_arprot;
	wire			axi4l_peri00_arvalid;
	wire			axi4l_peri00_arready;
	wire	[31:0]	axi4l_peri00_rdata;
	wire	[1:0]	axi4l_peri00_rresp;
	wire			axi4l_peri00_rvalid;
	wire			axi4l_peri00_rready;
	
	wire	[5:0]	axi4_mem00_awid;
	wire	[31:0]	axi4_mem00_awaddr;
	wire	[1:0]	axi4_mem00_awburst;
	wire	[3:0]	axi4_mem00_awcache;
	wire	[7:0]	axi4_mem00_awlen;
	wire	[0:0]	axi4_mem00_awlock;
	wire	[2:0]	axi4_mem00_awprot;
	wire	[3:0]	axi4_mem00_awqos;
	wire	[3:0]	axi4_mem00_awregion;
	wire	[2:0]	axi4_mem00_awsize;
	wire			axi4_mem00_awvalid;
	wire			axi4_mem00_awready;
	wire	[7:0]	axi4_mem00_wstrb;
	wire	[63:0]	axi4_mem00_wdata;
	wire			axi4_mem00_wlast;
	wire			axi4_mem00_wvalid;
	wire			axi4_mem00_wready;
	wire	[5:0]	axi4_mem00_bid;
	wire	[1:0]	axi4_mem00_bresp;
	wire			axi4_mem00_bvalid;
	wire			axi4_mem00_bready;
	wire	[5:0]	axi4_mem00_arid;
	wire	[31:0]	axi4_mem00_araddr;
	wire	[1:0]	axi4_mem00_arburst;
	wire	[3:0]	axi4_mem00_arcache;
	wire	[7:0]	axi4_mem00_arlen;
	wire	[0:0]	axi4_mem00_arlock;
	wire	[2:0]	axi4_mem00_arprot;
	wire	[3:0]	axi4_mem00_arqos;
	wire	[3:0]	axi4_mem00_arregion;
	wire	[2:0]	axi4_mem00_arsize;
	wire			axi4_mem00_arvalid;
	wire			axi4_mem00_arready;
	wire	[5:0]	axi4_mem00_rid;
	wire	[1:0]	axi4_mem00_rresp;
	wire	[63:0]	axi4_mem00_rdata;
	wire			axi4_mem00_rlast;
	wire			axi4_mem00_rvalid;
	wire			axi4_mem00_rready;
	
	ps_core
		i_ps_core
			(
				.peri_aresetn					(peri_aresetn),
				.peri_aclk						(peri_aclk),
				
				.mem_aresetn					(mem_aresetn),
				.mem_aclk						(mem_aclk),
				
				.video_reset					(vout_reset),
				.video_clk						(vout_clk),
				.ref200_clk						(vout_clk_x5),
				
				.m_axi4l_peri00_awaddr			(axi4l_peri00_awaddr),
				.m_axi4l_peri00_awprot			(axi4l_peri00_awprot),
				.m_axi4l_peri00_awvalid			(axi4l_peri00_awvalid),
				.m_axi4l_peri00_awready			(axi4l_peri00_awready),
				.m_axi4l_peri00_wstrb			(axi4l_peri00_wstrb),
				.m_axi4l_peri00_wdata			(axi4l_peri00_wdata),
				.m_axi4l_peri00_wvalid			(axi4l_peri00_wvalid),
				.m_axi4l_peri00_wready			(axi4l_peri00_wready),
				.m_axi4l_peri00_bresp			(axi4l_peri00_bresp),
				.m_axi4l_peri00_bvalid			(axi4l_peri00_bvalid),
				.m_axi4l_peri00_bready			(axi4l_peri00_bready),
				.m_axi4l_peri00_araddr			(axi4l_peri00_araddr),
				.m_axi4l_peri00_arprot			(axi4l_peri00_arprot),
				.m_axi4l_peri00_arvalid			(axi4l_peri00_arvalid),
				.m_axi4l_peri00_arready			(axi4l_peri00_arready),
				.m_axi4l_peri00_rdata			(axi4l_peri00_rdata),
				.m_axi4l_peri00_rresp			(axi4l_peri00_rresp),
				.m_axi4l_peri00_rvalid			(axi4l_peri00_rvalid),
				.m_axi4l_peri00_rready			(axi4l_peri00_rready),
				
				.s_axi4_mem00_awid				(axi4_mem00_awid),
				.s_axi4_mem00_awaddr			(axi4_mem00_awaddr),
				.s_axi4_mem00_awburst			(axi4_mem00_awburst),
				.s_axi4_mem00_awcache			(axi4_mem00_awcache),
				.s_axi4_mem00_awlen				(axi4_mem00_awlen),
				.s_axi4_mem00_awlock			(axi4_mem00_awlock),
				.s_axi4_mem00_awprot			(axi4_mem00_awprot),
				.s_axi4_mem00_awqos				(axi4_mem00_awqos),
				.s_axi4_mem00_awregion			(axi4_mem00_awregion),
				.s_axi4_mem00_awsize			(axi4_mem00_awsize),
				.s_axi4_mem00_awvalid			(axi4_mem00_awvalid),
				.s_axi4_mem00_awready			(axi4_mem00_awready),
				.s_axi4_mem00_wstrb				(axi4_mem00_wstrb),
				.s_axi4_mem00_wdata				(axi4_mem00_wdata),
				.s_axi4_mem00_wlast				(axi4_mem00_wlast),
				.s_axi4_mem00_wvalid			(axi4_mem00_wvalid),
				.s_axi4_mem00_wready			(axi4_mem00_wready),
				.s_axi4_mem00_bid				(axi4_mem00_bid),
				.s_axi4_mem00_bresp				(axi4_mem00_bresp),
				.s_axi4_mem00_bvalid			(axi4_mem00_bvalid),
				.s_axi4_mem00_bready			(axi4_mem00_bready),
				.s_axi4_mem00_araddr			(axi4_mem00_araddr),
				.s_axi4_mem00_arburst			(axi4_mem00_arburst),
				.s_axi4_mem00_arcache			(axi4_mem00_arcache),
				.s_axi4_mem00_arid				(axi4_mem00_arid),
				.s_axi4_mem00_arlen				(axi4_mem00_arlen),
				.s_axi4_mem00_arlock			(axi4_mem00_arlock),
				.s_axi4_mem00_arprot			(axi4_mem00_arprot),
				.s_axi4_mem00_arqos				(axi4_mem00_arqos),
				.s_axi4_mem00_arregion			(axi4_mem00_arregion),
				.s_axi4_mem00_arsize			(axi4_mem00_arsize),
				.s_axi4_mem00_arvalid			(axi4_mem00_arvalid),
				.s_axi4_mem00_arready			(axi4_mem00_arready),
				.s_axi4_mem00_rid				(axi4_mem00_rid),
				.s_axi4_mem00_rresp				(axi4_mem00_rresp),
				.s_axi4_mem00_rdata				(axi4_mem00_rdata),
				.s_axi4_mem00_rlast				(axi4_mem00_rlast),
				.s_axi4_mem00_rvalid			(axi4_mem00_rvalid),
				.s_axi4_mem00_rready			(axi4_mem00_rready),
				
				.DDR_addr						(DDR_addr),
				.DDR_ba							(DDR_ba),
				.DDR_cas_n						(DDR_cas_n),
				.DDR_ck_n						(DDR_ck_n),
				.DDR_ck_p						(DDR_ck_p),
				.DDR_cke						(DDR_cke),
				.DDR_cs_n						(DDR_cs_n),
				.DDR_dm							(DDR_dm),
				.DDR_dq							(DDR_dq),
				.DDR_dqs_n						(DDR_dqs_n),
				.DDR_dqs_p						(DDR_dqs_p),
				.DDR_odt						(DDR_odt),
				.DDR_ras_n						(DDR_ras_n),
				.DDR_reset_n					(DDR_reset_n),
				.DDR_we_n						(DDR_we_n),
				.FIXED_IO_ddr_vrn				(FIXED_IO_ddr_vrn),
				.FIXED_IO_ddr_vrp				(FIXED_IO_ddr_vrp),
				.FIXED_IO_mio					(FIXED_IO_mio),
				.FIXED_IO_ps_clk				(FIXED_IO_ps_clk),
				.FIXED_IO_ps_porb				(FIXED_IO_ps_porb),
				.FIXED_IO_ps_srstb				(FIXED_IO_ps_srstb)
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
				.s_axi4l_aresetn	(peri_aresetn),
				.s_axi4l_aclk		(peri_aclk),
				.s_axi4l_awaddr		(axi4l_peri00_awaddr),
				.s_axi4l_awprot		(axi4l_peri00_awprot),
				.s_axi4l_awvalid	(axi4l_peri00_awvalid),
				.s_axi4l_awready	(axi4l_peri00_awready),
				.s_axi4l_wstrb		(axi4l_peri00_wstrb),
				.s_axi4l_wdata		(axi4l_peri00_wdata),
				.s_axi4l_wvalid		(axi4l_peri00_wvalid),
				.s_axi4l_wready		(axi4l_peri00_wready),
				.s_axi4l_bresp		(axi4l_peri00_bresp),
				.s_axi4l_bvalid		(axi4l_peri00_bvalid),
				.s_axi4l_bready		(axi4l_peri00_bready),
				.s_axi4l_araddr		(axi4l_peri00_araddr),
				.s_axi4l_arprot		(axi4l_peri00_arprot),
				.s_axi4l_arvalid	(axi4l_peri00_arvalid),
				.s_axi4l_arready	(axi4l_peri00_arready),
				.s_axi4l_rdata		(axi4l_peri00_rdata),
				.s_axi4l_rresp		(axi4l_peri00_rresp),
				.s_axi4l_rvalid		(axi4l_peri00_rvalid),
				.s_axi4l_rready		(axi4l_peri00_rready),
				
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
	//  memory
	// ----------------------------------------
	
	// 使わない
	assign axi4_mem00_awid     = 0;
	assign axi4_mem00_awaddr   = 0;
	assign axi4_mem00_awburst  = 0;
	assign axi4_mem00_awcache  = 0;
	assign axi4_mem00_awlen    = 0;
	assign axi4_mem00_awlock   = 0;
	assign axi4_mem00_awprot   = 0;
	assign axi4_mem00_awqos    = 0;
	assign axi4_mem00_awregion = 0;
	assign axi4_mem00_awsize   = 0;
	assign axi4_mem00_awvalid  = 0;
	assign axi4_mem00_wstrb    = 0;
	assign axi4_mem00_wdata    = 0;
	assign axi4_mem00_wlast    = 0;
	assign axi4_mem00_wvalid   = 0;
	assign axi4_mem00_bready   = 0;
	
	assign axi4_mem00_arid     = 0;
	assign axi4_mem00_araddr   = 0;
	assign axi4_mem00_arburst  = 0;
	assign axi4_mem00_arcache  = 0;
	assign axi4_mem00_arlen    = 0;
	assign axi4_mem00_arlock   = 0;
	assign axi4_mem00_arprot   = 0;
	assign axi4_mem00_arqos    = 0;
	assign axi4_mem00_arregion = 0;
	assign axi4_mem00_arsize   = 0;
	assign axi4_mem00_arvalid  = 0;
	assign axi4_mem00_rready   = 0;
	
	
	// ----------------------------------------
	//  GPO (LED)
	// ----------------------------------------
	
	wire	[3:0]			gpio_led;
	
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
				
				.port_i				(gpio_led),
				.port_o				(gpio_led),
				.port_t				(),
				
				.s_wb_adr_i			(wb_host_adr_o[1:0]),
				.s_wb_dat_o			(wb_gpio_dat_o),
				.s_wb_dat_i			(wb_host_dat_o),
				.s_wb_we_i			(wb_host_we_o),
				.s_wb_sel_i			(wb_host_sel_o),
				.s_wb_stb_i			(wb_gpio_stb_i),
				.s_wb_ack_o			(wb_gpio_ack_o)
			);
	
	
	
	// ----------------------------------------
	//  GPU
	// ----------------------------------------
	
	wire	[0:0]			axi4s_gpu_tuser;
	wire					axi4s_gpu_tlast;
	wire	[23:0]			axi4s_gpu_tdata;
	wire					axi4s_gpu_tvalid;
	wire					axi4s_gpu_tready;
	
	wire	[31:0]			wb_gpu_dat_o;
	wire					wb_gpu_stb_i;
	wire					wb_gpu_ack_o;
	
	jelly_gpu_gouraud
			#(
				.WB_ADR_WIDTH					(16),
				.WB_DAT_WIDTH					(32),
				
				.COMPONENT_NUM					(3),
				.DATA_WIDTH						(8),
				
				.AXI4S_TUSER_WIDTH				(1),
				.AXI4S_TDATA_WIDTH				(24),
				
				.X_WIDTH						(12),
				.Y_WIDTH						(12),
				
				.PARAMS_ADDR_WIDTH				(12),
				.BANK_ADDR_WIDTH				(10),
				
				.BANK_NUM						(2),
				
				.EDGE_NUM						(12*2),
				.POLYGON_NUM					(6*2),
				.SHADER_PARAM_NUM				(4),
				
				.EDGE_PARAM_WIDTH				(32),
				.EDGE_RAM_TYPE					("distributed"),
				
				.SHADER_PARAM_WIDTH				(32),
				.SHADER_PARAM_Q					(24),
				.SHADER_RAM_TYPE				("distributed"),
				
				.REGION_RAM_TYPE				("distributed"),
				
				.CULLING_ONLY					(0),
				.Z_SORT_MIN						(0),
				
				.RASTERIZER_INIT_CTL_ENABLE		(1'b0),
				.RASTERIZER_INIT_CTL_UPDATE		(1'b0),
				.RASTERIZER_INIT_PARAM_WIDTH	(VOUT_X_NUM-1),
				.RASTERIZER_INIT_PARAM_HEIGHT	(VOUT_Y_NUM-1),
				.RASTERIZER_INIT_PARAM_CULLING	(2'b01),
				.RASTERIZER_INIT_PARAM_BANK		(0),
				.SHADER_INIT_PARAM_BGC			(24'h00_00_ff)
			)
		i_gpu_gouraud
			(
				.reset							(core_reset),
				.clk							(core_clk),
				
				.s_wb_rst_i						(wb_rst_o),
				.s_wb_clk_i						(wb_clk_o),
				.s_wb_adr_i						(wb_host_adr_o[15:0]),
				.s_wb_dat_o						(wb_gpu_dat_o),
				.s_wb_dat_i						(wb_host_dat_o),
				.s_wb_we_i						(wb_host_we_o),
				.s_wb_sel_i						(wb_host_sel_o),
				.s_wb_stb_i						(wb_gpu_stb_i),
				.s_wb_ack_o						(wb_gpu_ack_o),
				
				.m_axi4s_tuser					(axi4s_gpu_tuser),
				.m_axi4s_tlast					(axi4s_gpu_tlast),
				.m_axi4s_tdata					(axi4s_gpu_tdata),
				.m_axi4s_tvalid					(axi4s_gpu_tvalid),
				.m_axi4s_tready					(axi4s_gpu_tready)
			);
	
	
	wire	[0:0]			axi4s_vout_tuser;
	wire					axi4s_vout_tlast;
	wire	[23:0]			axi4s_vout_tdata;
	wire					axi4s_vout_tvalid;
	wire					axi4s_vout_tready;
	
	jelly_fifo_async_fwtf
			#(
				.DATA_WIDTH		(1+1+24),
				.PTR_WIDTH		(6),
				.DOUT_REGS		(0),
				.RAM_TYPE		("distributed"),
				.SLAVE_REGS		(0),
				.MASTER_REGS	(1)
			)
		i_fifo_async_fwtf_vout
			(
				.s_reset		(core_reset),
				.s_clk			(core_clk),
				.s_data			({
									axi4s_gpu_tuser,
									axi4s_gpu_tlast,
									axi4s_gpu_tdata
								}),
				.s_valid		(axi4s_gpu_tvalid),
				.s_ready		(axi4s_gpu_tready),
				.s_free_count	(),
				
				.m_reset		(vout_reset),
				.m_clk			(vout_clk),
				.m_data			({
									axi4s_vout_tuser,
									axi4s_vout_tlast,
									axi4s_vout_tdata
								}),
				.m_valid		(axi4s_vout_tvalid),
				.m_ready		(axi4s_vout_tready),
				.m_data_count	()
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
				/*
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
				*/
				.INIT_HTOTAL		(VOUT_X_NUM + (2200 - 1920)),
				.INIT_HDISP_START	(148),
				.INIT_HDISP_END		(148 + VOUT_X_NUM),
				.INIT_HSYNC_START	(0),
				.INIT_HSYNC_END		(44),
				.INIT_HSYNC_POL		(1),
				.INIT_VTOTAL		(VOUT_Y_NUM + (1125 - 1080)),
				.INIT_VDISP_START	(9),
				.INIT_VDISP_END		(9 + VOUT_Y_NUM),
				.INIT_VSYNC_START	(0),
				.INIT_VSYNC_END		(5),
				.INIT_VSYNC_POL		(1)
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
				.s_wb_adr_i			(wb_host_adr_o[7:0]),
				.s_wb_dat_o			(wb_vsgen_dat_o),
				.s_wb_dat_i			(wb_host_dat_o),
				.s_wb_we_i			(wb_host_we_o),
				.s_wb_sel_i			(wb_host_sel_o),
				.s_wb_stb_i			(wb_vsgen_stb_i),
				.s_wb_ack_o			(wb_vsgen_ack_o)
			);
	
	
	(* MARK_DEBUG="true" *)	wire			vout_vsync;
	(* MARK_DEBUG="true" *)	wire			vout_hsync;
	(* MARK_DEBUG="true" *)	wire			vout_de;
	(* MARK_DEBUG="true" *)	wire	[23:0]	vout_data;
	(* MARK_DEBUG="true" *)	wire	[3:0]	vout_ctl;
	
	jelly_vout_axi4s
			#(
				.WIDTH				(24)
			)
		i_vout_axi4s
			(
				.reset				(vout_reset),
				.clk				(vout_clk),
				
				.s_axi4s_tuser		(axi4s_vout_tuser),
				.s_axi4s_tlast		(axi4s_vout_tlast),
				.s_axi4s_tdata		(axi4s_vout_tdata),
				.s_axi4s_tvalid		(axi4s_vout_tvalid),
				.s_axi4s_tready		(axi4s_vout_tready),
				
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
	if ( HDMI_TX ) begin
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
	
	assign wb_gpu_stb_i   = wb_host_stb_o & (wb_host_adr_o[29:18] == 20'h401);
//	assign wb_vdmar_stb_i = wb_host_stb_o & (wb_host_adr_o[29:10] == 20'h4001_0);
	assign wb_vsgen_stb_i = wb_host_stb_o & (wb_host_adr_o[29:10] == 20'h4001_1);
//	assign wb_vdmaw_stb_i = wb_host_stb_o & (wb_host_adr_o[29:10] == 20'h4001_8);
	assign wb_gpio_stb_i  = wb_host_stb_o & (wb_host_adr_o[29:10] == 20'h4002_1);
	
	assign wb_host_dat_i  = wb_gpu_stb_i   ? wb_gpu_dat_o   :
//	                        wb_vdmar_stb_i ? wb_vdmar_dat_o :
	                        wb_vsgen_stb_i ? wb_vsgen_dat_o :
//	                        wb_vdmaw_stb_i ? wb_vdmaw_dat_o :
	                        wb_gpio_stb_i  ? wb_gpio_dat_o  :
	                        32'h0000_0000;
	
	assign wb_host_ack_i  = wb_gpu_stb_i   ? wb_gpu_ack_o   :
//	                        wb_vdmar_stb_i ? wb_vdmar_ack_o :
	                        wb_vsgen_stb_i ? wb_vsgen_ack_o :
//	                        wb_vdmaw_stb_i ? wb_vdmaw_ack_o :
	                        wb_gpio_stb_i  ? wb_gpio_ack_o  :
	                        wb_host_stb_o;
	
	
	
	// ----------------------------------------
	//  LED
	// ----------------------------------------
	
	reg		[31:0]		reg_counter_core_clk;
	always @(posedge core_clk)	reg_counter_core_clk <= reg_counter_core_clk + 1;
	
	reg		[31:0]		reg_counter_vout_clk;
	always @(posedge vout_clk)	reg_counter_vout_clk <= reg_counter_vout_clk + 1;
	
	
	assign led[0] = gpio_led[0];
	assign led[1] = gpio_led[1];
//	assign led[2] = gpio_led[2];
//	assign led[3] = gpio_led[3];
	assign led[2] = reg_counter_core_clk[26];
	assign led[3] = reg_counter_vout_clk[26];
	
	
	
	// ----------------------------------------
	//  Debug
	// ----------------------------------------
	
	assign pmod_a[7:0] = 0;
	
//	assign pmod_a[0]   = core_clk;
//	assign pmod_a[1]   = axi4s_vout_tvalid;
//	assign pmod_a[2]   = axi4s_vout_tready;
//	assign pmod_a[3]   = 0;
//	assign pmod_a[4]   = vout_clk;
//	assign pmod_a[5]   = axi4s_vout_tvalid;
//	assign pmod_a[6]   = axi4s_vout_tready;
//	assign pmod_a[7]   = 0;
	
	
endmodule


`default_nettype wire


// end of file
