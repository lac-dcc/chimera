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
			
	////////////////////////////////////////////////////////////////
	
	//////////////////////
	// 然后，测试指数运算
	reg		[31:0]	mask;
	always @(posedge CLOCK65)
		if(!RESETN)
			mask <= 0;
		else if(mask<=60)
			mask <= mask + 1;
	reg	signed [63:0]	x_in_;
	always @(posedge CLOCK65)
		if(mask<=60)
			x_in_ <= -1023*256;
		else if(x_in_<1024*256)
			x_in_ <= x_in_ + 1024;
		else
			x_in_ <= -1023*256;
			
	wire	[31:0]					rho_exp;
	int_cordic_exp_rtl				cordic_exp_mdl(.sys_clk(CLOCK65),.sys_rst_n(RESETN),.src_x(x_in_), .rho(rho_exp));
	// 测试tanh运算
	wire	[31:0]					rho_tanh;
	int_cordic_tanh_sigm_rtl		int_cordic_tanh_sigm_rtl(.sys_clk(CLOCK65),.sys_rst_n(RESETN),.src_x(x_in_), .rho(rho_tanh),.algorithm(2'B10));
	
	///////////////////////////////////////////////////////////////////////
	// 将CNN每条指令的运算结果写入到文本文件中，进行观察
	//
	integer		fp_cnn;
	always @(posedge top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.clk)
		if(top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.ddr_write_req && top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.ddr_write_ready)
			//$fwrite(fp_cnn, "%08H, %08H\n", top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.ddr_write_addr, top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.ddr_write_data);
			$fwrite(fp_cnn, "%d\n", top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.ddr_write_data_signed);
	// 看看卷积时候选取的数字对不对？
	integer		fp_cnn_conv;
	always @(posedge top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.clk)
	begin
		if(top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.ddr_read_data_valid_shifter[2])
		begin
			$fwrite(fp_cnn_conv, "%d, %d, %d\n", top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.cnn_conv_data[0], top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.cnn_conv_data[1], top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.cnn_conv_data[2]);
			$fwrite(fp_cnn_conv, "%d, %d, %d\n", top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.cnn_conv_data[3], top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.cnn_conv_data[4], top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.cnn_conv_data[5]);
			$fwrite(fp_cnn_conv, "%d, %d, %d\n", top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.cnn_conv_data[6], top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.cnn_conv_data[7], top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.cnn_conv_data[8]);
			$fwrite(fp_cnn_conv, "--------\n");
		end
	end
	/////////////////////////////////////
	wire	[7:0]	Dollar1_H = 64;
	wire	[7:0]	Dollar1_W = 128;
	wire	[31:0]	PoolMode = 1;
	wire	[31:0]	AddImm = 1000;
	wire	[7:0]	MAT_M = 5;
	wire	[7:0]	MAT_N = 3;
	wire	[7:0]	MAT_P = 7;
	
	initial
	begin
	
		#0			CLOCK100 = 0; CLOCK150 = 0; CLOCK65 = 0; RESETN = 0; top_inst.cnn_inst_en = 0;
					$readmemh("../../matlab/video/source_rgb565.list", mt9d111_sim_inst.pixel_rgb565);
					$readmemh("../07_python/source_ssram_da.list", ssram_sim_inst.ram_da);
					$readmemh("../07_python/source_ssram_db.list", ssram_sim_inst.ram_db);
					$readmemh("../07_python/source_ssram_dc.list", ssram_sim_inst.ram_dc);
					$readmemh("../07_python/source_ssram_dd.list", ssram_sim_inst.ram_dd);
					fp = $fopen("optical_result.txt", "w");
					fp_cnn_conv = $fopen("cnn_result--conv.txt", "w");
		#1000		RESETN = 1;
		//#10000000	RESETN = 1;
		/**/
        // 复位系统
        #4      top_inst.cnn_inst = 1;
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
        
		// 测试CNN指令解析器执行矩阵+标量的函数 -- adds        
		#4    	top_inst.cnn_inst = {4'HE, 32'H0100_0000, 32'H0600_0000, 32'H0800_0000, Dollar1_H, Dollar1_W, 6'H02, 6'H02};
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 测试CNN指令解析器执行RGB565转换成GRAY灰度图的函数 -- gray        
		#4    	top_inst.cnn_inst = {4'HC, 32'H0700_0000, 32'H0000_0000, 32'H0800_0000, Dollar1_H, Dollar1_W, 6'H02, 6'H02};
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 测试CNN指令执行的正确性 -- add
		#4    	top_inst.cnn_inst = {4'H0, 32'H0100_0000, 32'H0200_0000, 32'H0800_0000, Dollar1_H, Dollar1_W, 6'H00, 6'H00};
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 测试CNN指令解析器执行立即数 -- addi
		#4    	top_inst.cnn_inst = {4'H1, 32'H0100_0000, AddImm, 32'H0800_0000, Dollar1_H, Dollar1_W, 6'H00, 6'H00};
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 测试CNN指令解析器执行激活函数 -- tanh
		#4    	top_inst.cnn_inst = {4'HB, 32'H0600_0000, 32'H0000_0000, 32'H0800_0000, Dollar1_H, Dollar1_W, 6'H00, 6'H00};
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 测试CNN指令解析器执行激活函数 -- dot
		#4    	top_inst.cnn_inst = {4'H6, 32'H0100_0000, 32'H0200_0000, 32'H0800_0000, Dollar1_H, Dollar1_W, 6'H00, 6'H00};
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 测试CNN指令解析器执行卷积函数 -- conv
		#4    	top_inst.cnn_inst = {4'H7, 32'H0100_0000, 32'H0300_0000, 32'H0800_0000, Dollar1_H, Dollar1_W, 6'H03, 6'H03};
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 测试CNN指令解析器执行池化函数 -- pool
		#4    	top_inst.cnn_inst = {4'H8, 32'H0100_0000, PoolMode, 32'H0800_0000, Dollar1_H, Dollar1_W, 6'H02, 6'H02};
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 测试CNN指令解析器执行矩阵乘法函数 -- mult
		#4    	top_inst.cnn_inst = {4'H4, 32'H0400_0000, 32'H0500_0000, 32'H0800_0000, MAT_M, MAT_N, MAT_P, 4'H0};
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 测试CNN指令解析器执行矩阵转置函数 -- tran
		#4    	top_inst.cnn_inst = {4'HD, 32'H0100_0000, 32'H0000_0000, 32'H0800_0000, Dollar1_H, Dollar1_W, 6'H02, 6'H02};
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
        
        // 启动计算
        #4      top_inst.cnn_inst = 2;
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
        
		// 等待指令执行完成
		#4		fp_cnn = $fopen("cnn_result-adds.txt", "w");
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		$fclose(fp_cnn);
			
		// 等待指令执行完成
		#4		fp_cnn = $fopen("cnn_result-gray.txt", "w");
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		$fclose(fp_cnn);
			
		// 等待指令执行完成
		#4		fp_cnn = $fopen("cnn_result-add.txt", "w");
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		$fclose(fp_cnn);
				
		// 等待指令执行完成
		#4  	fp_cnn = $fopen("cnn_result-addi.txt", "w");
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		$fclose(fp_cnn);
				
		// 等待指令执行完成
		#4  	fp_cnn = $fopen("cnn_result-tanh.txt", "w");
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		$fclose(fp_cnn);
		
		// 等待指令执行完成
		#4  	fp_cnn = $fopen("cnn_result-dot.txt", "w");
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		$fclose(fp_cnn);
				
		/**/	
		// 等待指令执行完成
		#4  	fp_cnn = $fopen("cnn_result-conv.txt", "w");
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		$fclose(fp_cnn);
				
		
		/*	*/
		// 等待指令执行完成
		#4  	fp_cnn = $fopen("cnn_result-pool.txt", "w");
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		$fclose(fp_cnn);
			
		// 等待指令执行完成
		#4  	fp_cnn = $fopen("cnn_result-mult.txt", "w");
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		$fclose(fp_cnn);
				
		// 等待指令执行完成
		#4  	fp_cnn = $fopen("cnn_result-tran.txt", "w");
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_parser_ready)
				#1	RESETN = 1;
		#4		$fclose(fp_cnn);
		
		/**/		
				
		
		/// 结束
		#40000	$stop;
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