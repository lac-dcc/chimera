// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

`timescale 1 ps / 1 ps
`include "vga_config.inc"
module tb;
	
	reg			CLOCK100, CLOCK150, CLOCK65, RESETN;
	
	always #1	CLOCK100 <= ~CLOCK100;
	always #1	CLOCK150 <= ~CLOCK150;
	always #2	CLOCK65 <= ~CLOCK65;
	//////////////////////////////////////////////////////////////////////
	////////////////////////////
	wire	[27:0]		SRAM_ADDR;
	wire	[8:0]		SRAM_DA;
	wire	[8:0]		SRAM_DB;
	wire	[8:0]		SRAM_DC;
	wire	[8:0]		SRAM_DD;
	wire				SRAM_BWan,SRAM_BWbn,SRAM_BWcn,SRAM_BWdn;
	wire				SRAM_WEn,SRAM_OEn;
	wire				SRAM_CLK;
	wire				MT9D111_PCLK;
	wire				MT9D111_VSYNC;
	wire				MT9D111_HREF;
	wire	[7:0]		MT9D111_D;
	// mt9d111 simulator
	mt9d111_sim			mt9d111_sim_inst(
							.CLOCK65(CLOCK65),
							.RESETN(RESETN),
							.MT9D111_PCLK(MT9D111_PCLK),
							.MT9D111_VSYNC(MT9D111_VSYNC),
							.MT9D111_HREF(MT9D111_HREF),
							.MT9D111_D(MT9D111_D)
						);
	// top module
	top					top_inst(
							.CLOCK100(CLOCK100),
							.CLOCK150(CLOCK150),
							.CLOCK65(CLOCK65),
							.RESETN(RESETN),
							// mt9d111
							.MT9D111_PCLK(MT9D111_PCLK),
							.MT9D111_VSYNC(MT9D111_VSYNC),
							.MT9D111_HREF(MT9D111_HREF),
							.MT9D111_D(MT9D111_D),
							// ssram
							.SRAM_ADDR(SRAM_ADDR),
							.SRAM_DA(SRAM_DA),
							.SRAM_DB(SRAM_DB),
							.SRAM_DC(SRAM_DC),
							.SRAM_DD(SRAM_DD),
							.SRAM_BWan(SRAM_BWan),.SRAM_BWbn(SRAM_BWbn),.SRAM_BWcn(SRAM_BWcn),.SRAM_BWdn(SRAM_BWdn),
							.SRAM_WEn(SRAM_WEn),.SRAM_OEn(SRAM_OEn),.SRAM_CLK(SRAM_CLK)
						);
	// ssram
	ssram_sim			ssram_sim_inst(
							.SRAM_ADDR(SRAM_ADDR),
							.SRAM_DA(SRAM_DA),
							.SRAM_DB(SRAM_DB),
							.SRAM_DC(SRAM_DC),
							.SRAM_DD(SRAM_DD),
							.SRAM_BWan(SRAM_BWan),.SRAM_BWbn(SRAM_BWbn),.SRAM_BWcn(SRAM_BWcn),.SRAM_BWdn(SRAM_BWdn),
							.SRAM_WEn(SRAM_WEn),.SRAM_OEn(SRAM_OEn),.SRAM_CLK(SRAM_CLK)
						);
	
	///////////////////////////////////////////////////////////////////////
	// 将光流法的结果输出到文本文件中，方便观察记录
	integer		fp;
	always @(posedge CLOCK65)
		if(!top_inst.OpticalFlowLK_inst.VSYNC[79] && top_inst.OpticalFlowLK_inst.VSYNC[78])	// 上升沿表示新的一帧
			$fwrite(fp, "--- * * * ---\n");
		else if(top_inst.OpticalFlowLK_inst.optical_uv_en)
			$fwrite(fp, "%d, %d\n", top_inst.OpticalFlowLK_inst.optical_u[0], top_inst.OpticalFlowLK_inst.optical_v[0]);
	///////////////////////////////////////////////////////////////////////
	
	initial
	begin
	
		#0		CLOCK100 = 0; CLOCK150 = 0; CLOCK65 = 0; RESETN = 0; 
				$readmemh("../../matlab/video/source_rgb565.list", mt9d111_sim_inst.pixel_rgb565);
				fp = $fopen("optical_result.txt", "w");
		#1000	RESETN = 1;
		
	end
	///////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////
	// 看看shifter registere 的行为仿真
	reg		[1:0]	TCnt;
	reg		[31:0]	Data;
	always @(posedge CLOCK100)
	begin
		if(!RESETN)
		begin
			TCnt <= 0;
			Data <= 1;
		end
		else 
		begin
			if(TCnt[0]==1)
				Data <= Data + 1;
			TCnt <= TCnt + 1;
		end
	end
	
	// 需要缓冲一行
	wire	[31:0]	Data_Last_Line	[0:3];
	IxIyIt_800pts_4line		IxIyIt_800pts_4line_inst_p(
								.clken(TCnt[0]==1),
								.clock(CLOCK100),
								.aclr(!RESETN),
								.shiftin(Data),
								.taps0x(Data_Last_Line[0]),
								.taps1x(Data_Last_Line[1]),
								.taps2x(Data_Last_Line[2]),
								.taps3x(Data_Last_Line[3])
							);
							
endmodule