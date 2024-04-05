`include "vga_config.inc"

// 
module video_process
(
	input	wire			sys_clk, sys_rst_n,
	input	wire	[3:0]	SW,	// 拨码开关
	// MT9D111
	input	wire			MT9D111_CLK,
	input	wire	[15:0]	MT9D111_FrameData,
	input	wire			MT9D111_FrameDataEn,
	input	wire	[10:0]	MT9D111_FrameHCnt,
	input	wire	[10:0]	MT9D111_FrameVCnt,
	input	wire			MT9D111_FrameNewEn,
	output	wire	[5:0]	MT9D111_FRAME_PREV,
	output	wire	[5:0]	MT9D111_FRAME_CURR,
	// ADV7513
	input 	wire			ADV7513_CLK, ADV7513_CLK_pll,	// ADV扫描时钟和倍频时钟
	input	wire	[10:0]	ADV7513_FrameHCnt,
	input	wire	[10:0]	ADV7513_FrameVCnt,
	output	wire	[15:0]	ADV7513_FrameData,
	input	wire			ADV7513_FrameDataReq,
	input	wire			ADV7513_FrameNewEn,
	// LK光流法
	input	wire	[5:0]	OPTICAL_FRAME,	// 跟随MT9D111时钟
	input	wire	[0:0]	PD_BBOX_FRAME,	// HPS给出的信号，用来区分现在正在写入的内存块区间
	// DDR
	output	wire			DDR_WRITE_CLK,
	output	wire	[31:0]	DDR_WRITE_ADDR,
	output	wire	[31:0]	DDR_WRITE_DATA,
	output	wire			DDR_WRITE_REQ,
	input	wire			DDR_WRITE_READY,
	output	wire			DDR_READ_CLK,
	output	wire	[31:0]	DDR_READ_ADDR,
	output	wire			DDR_READ_REQ,
	input	wire			DDR_READ_READY,
	input	wire	[31:0]	DDR_READ_DATA,
	input	wire			DDR_READ_DATA_VALID
);

	// 用来分辨现在写入DDR的0/1/2/3四分之一区间
	reg		[5:0]		MT9D111_FrameFlag /* synthesis noprune */;
	always @(posedge MT9D111_CLK)
		if(!sys_rst_n)
			MT9D111_FrameFlag <= 0;
		else if(MT9D111_FrameNewEn)
			MT9D111_FrameFlag <= MT9D111_FrameFlag + 6'D1;
	
	assign				MT9D111_FRAME_CURR = MT9D111_FrameFlag;
	assign				MT9D111_FRAME_PREV = MT9D111_FrameFlag-6'D1;
	// 首先把摄像头的数据保存到DDR 
	// 上方 512MB~544 MB属于相机拍摄的缓存 -- 8MB/frame
	// | 512MB-520MB | 520MB-528MB | 528MB-536MB | 536MB-544MB |
	wire	[31:0]		MT9D111_FrameAddr /* synthesis keep */; 
	assign				MT9D111_FrameAddr = ((({32'D0, ({32'D0, MT9D111_FrameVCnt})*((`CAM_H_WIDTH))+(({32'D0, MT9D111_FrameHCnt}-1))})&32'H1F_FFFF) | {5'D0, MT9D111_FrameFlag&6'H03, 21'H00_0000}) + 32'H0800_0000;
	wire	[63:0]		cam_to_sdram_fifo_q;
	wire				cam_to_sdram_fifo_ready = DDR_WRITE_READY;
	wire				cam_to_sdram_fifo_rdempty;
	// 主要是为了构造Avalon时序
	alt_fifo_64b_2048w	MT9D111_SDRAM_INST(
							.aclr(!sys_rst_n),
							.data({MT9D111_FrameAddr, 16'H0000, MT9D111_FrameData}),	// 原始视频因为是RGB565,所以[31]一定是0，但是光流法一定要有区分！
							.wrclk(MT9D111_CLK),
							.wrreq(MT9D111_FrameDataEn),
							.wrusedw(),
							.wrfull(),
							.q(cam_to_sdram_fifo_q),
							.rdusedw(),
							.rdclk(MT9D111_CLK),
							.rdreq(!cam_to_sdram_fifo_rdempty && cam_to_sdram_fifo_ready),
							.rdempty(cam_to_sdram_fifo_rdempty)
						);
	//////////////////////////////////////////////////////
	// 跨时钟域的信号通过dpram解耦
	wire	[5:0]		MT9D111_FrameFlag_decoupled /* synthesis keep */;
	ddc_5b				ddc_5b_inst(
							.wrclock(MT9D111_CLK),
							.wraddress(0),
							.data(MT9D111_FrameFlag),
							.wren(1),
							.rdclock(ADV7513_CLK_pll),
							.rdaddress(0),
							.q(MT9D111_FrameFlag_decoupled)
						);
	// 光流法的也要解耦一下
	wire	[5:0]		OPTICAL_FRAME_decoupled /* synthesis keep */;
	ddc_5b				ddc_5b_inst_of(
							.wrclock(MT9D111_CLK),
							.wraddress(0),
							.data(OPTICAL_FRAME),
							.wren(1),
							.rdclock(ADV7513_CLK_pll),
							.rdaddress(0),
							.q(OPTICAL_FRAME_decoupled)
						);
	// 行人检测加框的结果也要解耦一下
	wire	[5:0]		PD_BBOX_FRAME_decoupled /* synthesis keep */;
	ddc_5b				ddc_5b_inst_pd_bbox(
							.wrclock(sys_clk),
							.wraddress(0),
							.data({7'D0, PD_BBOX_FRAME}),
							.wren(1),
							.rdclock(ADV7513_CLK_pll),
							.rdaddress(0),
							.q(PD_BBOX_FRAME_decoupled)
						);
	//
	wire	[10:0]		ADV7513_FrameVCnt_decoupled /* synthesis keep */;
	ddc_11b				ddc_11b_VCnt_inst(
							.wrclock(ADV7513_CLK),
							.wraddress(0),
							.data(ADV7513_FrameVCnt),
							.wren(1),
							.rdclock(ADV7513_CLK_pll),
							.rdaddress(0),
							.q(ADV7513_FrameVCnt_decoupled)
						);
	// 还是要用DCFIFO来构造这里的时序
	wire	[31:0]		ADV7513_FrameHCnt_fifo_q /* synthesis keep */;
	wire				ADV7513_FrameHCnt_fifo_rdempty;
	alt_fifo_32b_8w		alt_fifo_32b_8w_adv7513_hcnt_inst(
							.aclr(!sys_rst_n),
							.data({21'D0, ADV7513_FrameHCnt}),
							.wrclk(ADV7513_CLK),
							.wrreq(1),
							.wrusedw(),
							.wrfull(),
							.q(ADV7513_FrameHCnt_fifo_q),
							.rdusedw(),
							.rdclk(ADV7513_CLK_pll),
							.rdreq(!ADV7513_FrameHCnt_fifo_rdempty),
							.rdempty(ADV7513_FrameHCnt_fifo_rdempty)
						);
	wire	[10:0]		ADV7513_FrameHCnt_decoupled  /* synthesis keep */;
	assign				ADV7513_FrameHCnt_decoupled = ADV7513_FrameHCnt_fifo_q; 
	wire				ADV7513_FrameHCnt_decoupled_ch = !ADV7513_FrameHCnt_fifo_rdempty;
	/*
	ddc_11b				ddc_11b_HCnt_inst(
							.wrclock(ADV7513_CLK),
							.wraddress(0),
							.data(ADV7513_FrameHCnt),
							.wren(1),
							.rdclock(ADV7513_CLK_pll),
							.rdaddress(0),
							.q(ADV7513_FrameHCnt_decoupled)
						);
	reg		[10:0]		ADV7513_FrameHCnt_decoupled_j;
	wire				ADV7513_FrameHCnt_decoupled_ch = (ADV7513_FrameHCnt_decoupled!=ADV7513_FrameHCnt_decoupled_j);
	always @(posedge ADV7513_CLK_pll)
		ADV7513_FrameHCnt_decoupled_j <= ADV7513_FrameHCnt_decoupled;
	*/
	////
	// 下面是读取DDR里面的图像
	reg		[10:0]		MON_V_rd;			// 倍频读取SDRAM，图像的行，生成MON扫描图像
	reg		[10:0]		MON_H_rd;			// 倍频读取SDRAM，图像的列，生成MON扫描图像
	reg					MON_PIXEL_rdreq;	// 倍频读取SDRAM，使能信号
	wire				MON_PIXEL_rd_en = DDR_READ_READY;	// 倍频读取SDRAM，读取完成信号
	// 读取的偏移地址
	reg		[5:0]		ADV7513_FrameFlag_Video /* synthesis noprune */;
	reg		[5:0]		ADV7513_FrameFlag_Optical /* synthesis noprune */;
	reg		[5:0]		ADV7513_FrameFlag_PD_Bbox /* synthesis noprune */;
	reg		[31:0]		ADV7513_FrameAddr;	// 要读取的DDR地址
	//wire	[31:0]		ADV7513_FrameAddr = (({32'D0, ({32'D0, MON_V_rd})*((`CAM_H_WIDTH))+(({32'D0, MON_H_rd}-0))})&32'H1F_FFFF) | {5'D0, ADV7513_FrameFlag_Video, 21'H00_0000};
	// 生成DDR读取地址
	always @(*)
	begin
		// 原始视频（左上角区域）
		if(MON_H_rd>=0 && MON_H_rd<(`VGA_H_WIDTH>>>1) && MON_V_rd>=0 && MON_V_rd<(`VGA_V_WIDTH>>>1))	
			ADV7513_FrameAddr = ((({32'D0, ({32'D0, MON_V_rd-`VGA_V_BORD, 2'B00})*((`CAM_H_WIDTH))+(({32'D0, MON_H_rd-`VGA_H_BORD, 2'B00}-0))})&32'H1F_FFFF) | {5'D0, ADV7513_FrameFlag_Video&6'H03, 21'H00_0000}) + 32'H0800_0000;
		// 光流计算结果（左下角区域）
		else if(MON_H_rd>=0 && MON_H_rd<(`VGA_H_WIDTH>>>1) && MON_V_rd>=(`VGA_V_WIDTH>>>1) && MON_V_rd<(`VGA_V_WIDTH))	
			ADV7513_FrameAddr = ((({32'D0, ({32'D0, MON_V_rd-`VGA_V_BORD-(`VGA_V_WIDTH>>>1), 2'B00})*((`CAM_H_WIDTH))+(({32'D0, MON_H_rd-`VGA_H_BORD, 2'B00}-0))})&32'H1F_FFFF) | {5'D0, ADV7513_FrameFlag_Optical & 6'H03, 21'H00_0000}) + 32'H0780_0000;
		// 行人检测结果（加框）(右上角区域)
		else if(MON_H_rd>=(`VGA_H_WIDTH>>>1) && MON_H_rd<(`VGA_H_WIDTH) && MON_V_rd>=0 && MON_V_rd<(`VGA_V_WIDTH>>>1))	
			ADV7513_FrameAddr = ((({32'D0, ({32'D0, MON_V_rd-`VGA_V_BORD, 2'B00})*((`CAM_H_WIDTH))+(({32'D0, MON_H_rd-`VGA_H_BORD-(`VGA_H_WIDTH>>>1), 2'B00}-0))})&32'H1F_FFFF) | {5'D0, ADV7513_FrameFlag_PD_Bbox & 6'H01, 21'H00_0000}) + 32'H0980_0000;
		// 预留
		else if(MON_H_rd>=(`VGA_H_WIDTH>>>1) && MON_H_rd<(`VGA_H_WIDTH) && MON_V_rd>=(`VGA_V_WIDTH>>>1) && MON_V_rd<(`VGA_V_WIDTH))
			ADV7513_FrameAddr = ((({32'D0, ({32'D0, MON_V_rd-`VGA_V_BORD-(`VGA_V_WIDTH>>>1), 2'B00})*((`CAM_H_WIDTH))+(({32'D0, MON_H_rd-`VGA_H_BORD-(`VGA_H_WIDTH>>>1), 2'B00}-0))})&32'H1F_FFFF) | {5'D0, ADV7513_FrameFlag_Video&6'H03, 21'H00_0000}) + 32'H0800_0000;
		else 
			ADV7513_FrameAddr = 32'HFFFF_FFFF;
	end
	//////////////////////
	// 还是要用状态机来控制！
	reg		[3:0]		cstate /* synthesis noprune */;
	always @(posedge ADV7513_CLK_pll)
		if(!sys_rst_n)
		begin
			cstate <= 0;
			MON_V_rd <= 0;
			MON_H_rd <= 11'H7FF;
			MON_PIXEL_rdreq <= 0;
			ADV7513_FrameFlag_Video <= 0;
			ADV7513_FrameFlag_Optical <= 0;
			ADV7513_FrameFlag_PD_Bbox <= 0;
		end
		else
		begin
			case(cstate)
				// 选择要读取那个块的数据
				4'D0: begin
					if(ADV7513_FrameHCnt_decoupled_ch && ADV7513_FrameHCnt_decoupled==(`VGA_H_BIAS + 10) && ADV7513_FrameVCnt_decoupled==(`VGA_V_BIAS - 4))
					begin
						ADV7513_FrameFlag_Video <= MT9D111_FrameFlag_decoupled - 1;	// 读取上次写入的块
						ADV7513_FrameFlag_Optical <= OPTICAL_FRAME_decoupled - 1;	// 读取上次写入的块
						ADV7513_FrameFlag_PD_Bbox <= PD_BBOX_FRAME_decoupled - 1;	// 读取上次写入的块
						MON_PIXEL_rdreq <= 0;
						cstate <= 1;
					end
				end
				
				// 发现换行了，就要开始读取DDR，提前准备好数据！
				// (提前读取下一行扫描的数据)，对应于原始图像中【超前两行】
				4'D1: begin
					if(ADV7513_FrameHCnt_decoupled_ch && ADV7513_FrameHCnt_decoupled==(`VGA_H_BIAS + 10) && 
						(ADV7513_FrameVCnt_decoupled>=(`VGA_V_BIAS - 2) && ADV7513_FrameVCnt_decoupled<((`VGA_V_BIAS + `VGA_V_WIDTH - 2))))
					begin
						MON_V_rd <= ADV7513_FrameVCnt_decoupled + 2 - `VGA_V_BIAS;//(ADV7513_FrameVCnt_decoupled>=11'D623)? (ADV7513_FrameVCnt_decoupled-11'D623) : (ADV7513_FrameVCnt_decoupled + 11'D2);
						MON_H_rd <= 11'D0;
						MON_PIXEL_rdreq <= 1;
						cstate <= 2;	// J进入读取环节
					end	
					else if(ADV7513_FrameHCnt_decoupled_ch && ADV7513_FrameHCnt_decoupled==(`VGA_H_BIAS + 10) && 
						(ADV7513_FrameVCnt_decoupled==((`VGA_V_BIAS + `VGA_V_WIDTH - 2))))
					begin
						cstate <= 0;
						MON_PIXEL_rdreq <= 0;
					end
				end
				
				// 读取环节
				4'D2: begin
					if(MON_V_rd>=0 && MON_V_rd<`VGA_V_WIDTH && MON_PIXEL_rd_en)
					begin
						if(MON_H_rd>=(`VGA_H_WIDTH - 1))
						begin
							cstate <= 3;
							MON_PIXEL_rdreq <= 0;
						end
						else
							MON_H_rd <= MON_H_rd + 1;
					end
				end
				
				// 暂停环节
				4'D3: begin
					cstate <= 1;
					MON_PIXEL_rdreq <= 0;
				end
				
				// 
				default: begin
					cstate <= 0;
					MON_PIXEL_rdreq <= 0;
				end
			endcase
		end
	// 将获取的像素点数据缓存
	reg			[15:0]		line_buffer_data;
	wire					line_buffer_wrclk = DDR_READ_CLK;
	reg						line_buffer_wrreq;// = DDR_READ_DATA_VALID;
	//wire					line_buffer_clear /* synthesis keep */;
	//assign					line_buffer_clear = ((ADV7513_FrameVCnt>=0 && ADV7513_FrameVCnt<=(`VGA_V_BIAS - 10)));
	reg						line_buffer_clear /* synthesis noprune */;
	always @(posedge ADV7513_CLK)
		line_buffer_clear <= ((ADV7513_FrameVCnt>=0 && ADV7513_FrameVCnt<=(`VGA_V_BIAS - 4)));
	alt_fifo_16b_4096w		alt_fifo_16b_4096w_line_buf_inst(
								.aclr(!sys_rst_n || line_buffer_clear),
								.rdclk(ADV7513_CLK),
								.rdreq(ADV7513_FrameDataReq),
								.q(ADV7513_FrameData),
								.rdempty(),
								.rdfull(),
								.rdusedw(),
								.data(line_buffer_data),
								.wrclk(line_buffer_wrclk),
								.wrreq(line_buffer_wrreq),
								.wrempty(),
								.wrfull(),
								.wrusedw()
							);
	// 将获取的像素点数据进行数量统计
	reg		[31:0]		wrpix_cnt /* synthesis noprune */;
	always @(posedge DDR_READ_CLK)
		if(ADV7513_FrameHCnt_decoupled==(`VGA_H_BIAS + 10) && ADV7513_FrameHCnt_decoupled_ch)
			wrpix_cnt <= 0;
		else if(DDR_READ_DATA_VALID)
			wrpix_cnt <= wrpix_cnt + 1;
	// 还要对ADV7513申请的像素点数量进行统计
	reg		[31:0]		rdpix_cnt /* synthesis noprune */;
	always @(posedge ADV7513_CLK)
		if(!sys_rst_n || ADV7513_FrameHCnt==(`VGA_H_BIAS + `VGA_H_WIDTH + 50))
			rdpix_cnt <= 0;
		else if(ADV7513_FrameDataReq)
			rdpix_cnt <= rdpix_cnt + 1;
	// 然后，可以根据SW拨码开关的状态，配置写入到line_buffer的数据是video数据/彩条测试图样
	always @(posedge DDR_READ_CLK)
	begin
		line_buffer_wrreq <= DDR_READ_DATA_VALID;
		if(SW[3])
			line_buffer_data <= DDR_READ_DATA[31]? {16{DDR_READ_DATA[30]}} : DDR_READ_DATA[15:0];	// 光流法/原始视频
		else 
		begin
			if(wrpix_cnt>=0 && wrpix_cnt<((`VGA_H_WIDTH>>>2)*1))
				line_buffer_data <= {5'B11111, 6'B000000, 5'B00000};
			else if(wrpix_cnt>=((`VGA_H_WIDTH>>>2)*1) && wrpix_cnt<((`VGA_H_WIDTH>>>2)*2))
				line_buffer_data <= {5'B00000, 6'B111111, 5'B00000};
			else if(wrpix_cnt>=((`VGA_H_WIDTH>>>2)*2) && wrpix_cnt<((`VGA_H_WIDTH>>>2)*3))
				line_buffer_data <= {5'B00000, 6'B000000, 5'B11111};
			else if(wrpix_cnt>=((`VGA_H_WIDTH>>>2)*3) && wrpix_cnt<((`VGA_H_WIDTH>>>2)*4))
				line_buffer_data <= {5'B11111, 6'B000000, 5'B11111};
			else
				line_buffer_data <= {5'B00000, 6'B000000, 5'B00000};
		end
	end
	/////////////////////////////////////////////////////////
	// 生成DDR接口
	assign			DDR_WRITE_CLK = MT9D111_CLK;
	assign			DDR_WRITE_ADDR = cam_to_sdram_fifo_q[63:32];
	assign			DDR_WRITE_DATA = cam_to_sdram_fifo_q[31:0];
	assign			DDR_WRITE_REQ = !cam_to_sdram_fifo_rdempty;
	//
	assign			DDR_READ_CLK = ADV7513_CLK_pll;
	assign			DDR_READ_ADDR = ADV7513_FrameAddr;
	assign			DDR_READ_REQ = MON_PIXEL_rdreq;
/////////////////////////
endmodule
