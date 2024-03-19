`include "vga_config.inc"
module top
(
	input	wire	CLOCK100, CLOCK150, CLOCK65, RESETN,
	// SRAM
	output	[27:0]	SRAM_ADDR,
	inout   [8:0]   SRAM_DA,SRAM_DB,SRAM_DC,SRAM_DD,
	//		SRAM CONTROL SIGNAL
    output          SRAM_MODE,
    output          SRAM_CEn,SRAM_CE2,SRAM_CE2n,
    output          SRAM_BWan,SRAM_BWbn,SRAM_BWcn,SRAM_BWdn,
    output          SRAM_WEn,SRAM_OEn,
    //		SRAM CLK SIGNAL
    output          SRAM_CLK,SRAM_CLKEn,
    output          SRAM_ZZ,SRAM_ADV,
	// MT9D111
	input	wire			MT9D111_PCLK,
	input	wire			MT9D111_VSYNC,
	input	wire			MT9D111_HREF,
	input	wire	[7:0]	MT9D111_D	
	//
);
	// 生成系统时钟和系统复位
	wire			afi_phy_clk/* synthesis keep */;			// avalon信号同步时钟
	wire			afi_phy_rst_n/* synthesis keep */;			// 复位信号
	wire			local_init_done /* synthesis keep */;
	wire			sys_clk = afi_phy_clk;//CLOCK_SRAM /* synthesis keep */;
	wire			sys_rst_n = afi_phy_rst_n;//RESETN /* synthesis keep */;
	// mt9d111 controller (pixel stream)
	wire	[10:0]				FRAME_Hcnt;
	wire	[10:0]				FRAME_Vcnt;
	wire	[15:0]				FRAME_DATA;
	wire						FRAME_DATA_EN;
	wire						FRAME_NEW_EN;
	wire						FRAME_HSYNC;
	wire						FRAME_VSYNC;
	mt9d111_controller			mt9d111_controller_inst(
									.MT9D111_PCLK(MT9D111_PCLK),
									.MT9D111_VSYNC(MT9D111_VSYNC),
									.MT9D111_HREF(MT9D111_HREF),
									.MT9D111_D(MT9D111_D),
									.FRAME_Hcnt(FRAME_Hcnt),
									.FRAME_Vcnt(FRAME_Vcnt),
									.FRAME_DATA(FRAME_DATA),
									.FRAME_DATA_EN(FRAME_DATA_EN),
									.FRAME_NEW_EN(FRAME_NEW_EN),
									.FRAME_HSYNC(FRAME_HSYNC),
									.FRAME_VSYNC(FRAME_VSYNC)
								);
	//
	// HOG+SVM行人检测
	wire						HOG_SVM_DDR_WRITE_CLK;
	wire	[31:0]				HOG_SVM_DDR_WRITE_ADDR;
	wire	[31:0]				HOG_SVM_DDR_WRITE_DATA;
	wire						HOG_SVM_DDR_WRITE_REQ;
	wire						HOG_SVM_DDR_WRITE_READY = 1;
	/*
	*/
	hog_svm_pd_rtl				hog_svm_pd_rtl_inst(
									.sys_rst_n(RESETN),
									.RGB565_PCLK(MT9D111_PCLK),
									.RGB565_HSYNC(FRAME_HSYNC),
									.RGB565_VSYNC(FRAME_VSYNC),
									.RGB565_D(FRAME_DATA),
									.RGB565_DE(FRAME_DATA_EN),
									//
									.DDR_WRITE_CLK(HOG_SVM_DDR_WRITE_CLK),
									.DDR_WRITE_ADDR(HOG_SVM_DDR_WRITE_ADDR),
									.DDR_WRITE_DATA(HOG_SVM_DDR_WRITE_DATA),
									.DDR_WRITE_REQ(HOG_SVM_DDR_WRITE_REQ),
									.DDR_WRITE_READY(HOG_SVM_DDR_WRITE_READY)
								);
								
	//
	
	
		// SSRAM
	// 添加一个缓存空间	// 使用ddr的IP核
	//	// 首先是用于uart读写ddr数据的程序段
	wire        local_ready;                //              local.waitrequest_n
	wire        local_burstbegin;           //                   .beginbursttransfer
	wire [31:0] local_addr;                 //                   .address
	wire        local_rdata_valid;          //                   .readdatavalid
	wire [31:0] local_rdata;                //                   .readdata
	wire [31:0] local_wdata;                //                   .writedata
	wire [3:0]  local_be;                   //                   .byteenable
	wire        local_read_req;             //                   .read
	wire        local_write_req;            //                   .write
	wire [2:0]  local_size;                 //                   .burstcount
	wire		local_waitrequest;
	///////// 复位信号
	// 例化SSRAM控制器
    /*
	ssram_controller		ssram_controller_inst(
								.CLOCK_0deg(CLOCK100),
								.CLOCK_pideg(!CLOCK100),
								.reset_reset_n(RESETN),
								.ssram_avalon_clock_clk(afi_phy_clk),
								.ssram_avalon_reset_n(afi_phy_rst_n),
								.ssram_avalon_address(local_addr),
								.ssram_avalon_writedata(local_wdata),
								.ssram_avalon_write_n(!local_write_req),
								.ssram_avalon_read_n(!local_read_req),
								.ssram_avalon_readdata(local_rdata),
								.ssram_avalon_readdatavalid(local_rdata_valid),
								.ssram_avalon_waitrequest(local_waitrequest),
								//
								.ssram_pins_addr(SRAM_ADDR),
								.ssram_pins_da(SRAM_DA),
								.ssram_pins_db(SRAM_DB),
								.ssram_pins_dc(SRAM_DC),
								.ssram_pins_dd(SRAM_DD),
								.ssram_pins_adv(SRAM_ADV),
								.ssram_pins_ce_n(SRAM_CEn),
								.ssram_pins_ce2(SRAM_CE2),
								.ssram_pins_ce2_n(SRAM_CE2n),
								.ssram_pins_clk(SRAM_CLK),
								.ssram_pins_clken(SRAM_CLKEn),
								.ssram_pins_oe_n(SRAM_OEn),
								.ssram_pins_we_n(SRAM_WEn),
								.ssram_pins_bwa_n(SRAM_BWan),
								.ssram_pins_bwb_n(SRAM_BWbn),
								.ssram_pins_bwc_n(SRAM_BWcn),
								.ssram_pins_bwd_n(SRAM_BWdn),
								.ssram_pins_mode(SRAM_MODE),
								.ssram_pins_zz(SRAM_ZZ)
							);
		////////////////////////////////////////////////////////////////////////////////////////
	mux_ddr_access		mux_ddr_access_inst(
							.afi_phy_clk(afi_phy_clk),
							.afi_phy_rst_n(afi_phy_rst_n),
							//
							.local_address(local_addr),
							.local_write_req(local_write_req),
							.local_read_req(local_read_req),
							.local_burstbegin(local_burstbegin),
							.local_wdata(local_wdata),
							.local_be(local_be),
							.local_size(local_size),
							.local_ready(!local_waitrequest),
							.local_rdata(local_rdata),
							.local_rdata_valid(local_rdata_valid),
							//.local_refresh_ack,
							.local_init_done(RESETN),
							///////////////
							// 测试 写入
							.wport_clock_4(HOG_SVM_DDR_WRITE_CLK),
							.wport_addr_4(HOG_SVM_DDR_WRITE_ADDR),
							.wport_data_4(HOG_SVM_DDR_WRITE_DATA),
							.wport_req_4(HOG_SVM_DDR_WRITE_REQ),
							.wport_ready_4(HOG_SVM_DDR_WRITE_READY)
						);
                        
    */
endmodule