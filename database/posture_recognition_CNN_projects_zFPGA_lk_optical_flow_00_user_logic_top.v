// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

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
	// 记录现在要写入哪一块
	reg		[7:0]				FRAME_PREV;
	reg		[7:0]				FRAME_CURR;
	always @(posedge MT9D111_PCLK)
		if(!RESETN)
		begin
			FRAME_PREV <= -1;
			FRAME_CURR <= 0;
		end
		else if(FRAME_NEW_EN)
		begin
			FRAME_PREV <= FRAME_PREV + 1;
			FRAME_CURR <= FRAME_CURR + 1;
		end
	// 生成avalon时序
	wire			DDR_WRITE_CLK;
	wire	[31:0]	DDR_WRITE_ADDR;
	wire	[31:0]	DDR_WRITE_DATA;
	wire			DDR_WRITE_REQ;
	wire			DDR_WRITE_READY;
	// 首先把摄像头的数据保存到DDR 
	// 上方 512MB~544 MB属于相机拍摄的缓存 -- 8MB/frame
	// | 512MB-520MB | 520MB-528MB | 528MB-536MB | 536MB-544MB |
	wire	[31:0]		MT9D111_FrameAddr /* synthesis keep */; 
	assign				MT9D111_FrameAddr = ((({32'D0, ({32'D0, FRAME_Vcnt})*((`CAM_H_WIDTH))+(({32'D0, FRAME_Hcnt}-1))})&32'H1F_FFFF) | {5'D0, FRAME_CURR&6'H3F, 21'H00_0000}) + 32'H0800_0000;
	wire	[63:0]		cam_to_sdram_fifo_q;
	wire				cam_to_sdram_fifo_ready = DDR_WRITE_READY;
	wire				cam_to_sdram_fifo_rdempty;
	// 主要是为了构造Avalon时序
	alt_fifo_64b_2048w	MT9D111_SDRAM_INST(
							.aclr(!RESETN),
							.data({MT9D111_FrameAddr, 16'H0000, FRAME_DATA}),
							.wrclk(MT9D111_PCLK),
							.wrreq(FRAME_DATA_EN),
							.wrusedw(),
							.wrfull(),
							.q(cam_to_sdram_fifo_q),
							.rdusedw(),
							.rdclk(MT9D111_PCLK),
							.rdreq(!cam_to_sdram_fifo_rdempty && cam_to_sdram_fifo_ready),
							.rdempty(cam_to_sdram_fifo_rdempty)
						);
	// 生成DDR接口
	assign			DDR_WRITE_CLK = MT9D111_PCLK;
	assign			DDR_WRITE_ADDR = cam_to_sdram_fifo_q[63:32];
	assign			DDR_WRITE_DATA = cam_to_sdram_fifo_q[31:0];
	assign			DDR_WRITE_REQ = !cam_to_sdram_fifo_rdempty;
	// OpticalFlowLK
	wire						OPTICAL_DDR_WRITE_CLK;
	wire	[31:0]				OPTICAL_DDR_WRITE_ADDR;
	wire	[31:0]				OPTICAL_DDR_WRITE_DATA;
	wire						OPTICAL_DDR_WRITE_REQ;
	wire						OPTICAL_DDR_WRITE_READY;
	wire						OPTICAL_DDR_READ_CLK;
	wire	[31:0]				OPTICAL_DDR_READ_ADDR;
	wire						OPTICAL_DDR_READ_REQ;
	wire						OPTICAL_DDR_READ_READY;
	wire	[31:0]				OPTICAL_DDR_READ_DATA;
	wire						OPTICAL_DDR_READ_DATA_VALID;
	OpticalFlowLK				OpticalFlowLK_inst(
									.sys_rst_n(RESETN),
									.RGB565_PCLK(MT9D111_PCLK),
									.RGB565_HSYNC(FRAME_HSYNC),
									.RGB565_VSYNC(FRAME_VSYNC),
									.RGB565_D(FRAME_DATA),
									.RGB565_DE(FRAME_DATA_EN),
									.PREV_FRAME(FRAME_PREV),
									.CURR_FRAME(FRAME_CURR),
									// DDR
									.DDR_WRITE_CLK(OPTICAL_DDR_WRITE_CLK),
									.DDR_WRITE_ADDR(OPTICAL_DDR_WRITE_ADDR),
									.DDR_WRITE_DATA(OPTICAL_DDR_WRITE_DATA),
									.DDR_WRITE_REQ(OPTICAL_DDR_WRITE_REQ),
									.DDR_WRITE_READY(OPTICAL_DDR_WRITE_READY),
									.DDR_READ_CLK(OPTICAL_DDR_READ_CLK),
									.DDR_READ_ADDR(OPTICAL_DDR_READ_ADDR),
									.DDR_READ_REQ(OPTICAL_DDR_READ_REQ),
									.DDR_READ_READY(OPTICAL_DDR_READ_READY),
									.DDR_READ_DATA(OPTICAL_DDR_READ_DATA),
									.DDR_READ_DATA_VALID(OPTICAL_DDR_READ_DATA_VALID)
								);
	
	/////////////////////////////
	///////////////////
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
	wire		afi_phy_clk, afi_phy_rst_n;
	// 例化SSRAM控制器
	ssram_controller		ssram_controller_inst(
								.CLOCK_0deg(CLOCK150),
								.CLOCK_pideg(!CLOCK150),
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
							// 光流法的写入接口
							.wport_clock_2(OPTICAL_DDR_WRITE_CLK),
							.wport_addr_2(OPTICAL_DDR_WRITE_ADDR),	// 上方 512MB~544 MB属于相机拍摄的缓存 -- 8MB/frame
							.wport_data_2(OPTICAL_DDR_WRITE_DATA),
							.wport_req_2(OPTICAL_DDR_WRITE_REQ),
							.wport_ready_2(OPTICAL_DDR_WRITE_READY),		
							// 光流法的读取接口
							.rport_clock_1(OPTICAL_DDR_READ_CLK),
							.rport_addr_1(OPTICAL_DDR_READ_ADDR),
							.rport_data_1(OPTICAL_DDR_READ_DATA),
							.rport_data_valid_1(OPTICAL_DDR_READ_DATA_VALID),
							.rport_req_1(OPTICAL_DDR_READ_REQ),
							.rport_ready_1(OPTICAL_DDR_READ_READY),
							// MT9D111的写入接口
							.wport_clock_0(DDR_WRITE_CLK),
							.wport_addr_0(DDR_WRITE_ADDR),	// 上方 512MB~544 MB属于相机拍摄的缓存 -- 8MB/frame
							.wport_data_0(DDR_WRITE_DATA),
							.wport_req_0(DDR_WRITE_REQ),
							.wport_ready_0(DDR_WRITE_READY)
						);
endmodule