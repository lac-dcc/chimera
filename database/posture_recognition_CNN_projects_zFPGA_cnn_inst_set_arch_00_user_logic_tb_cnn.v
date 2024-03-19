`timescale 1 ps / 1 ps
`include "vga_config.inc"
module tb_cnn;
	
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
	
	/////////////////////////////////////
	reg		[127:0]		npu_inst	[0:1023];
	integer				npu_inst_addr;
	
	// 同时记录所有的DDR写入过程
	integer				fp;
	always @(posedge top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.clk)
		if(top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.cnn_inst_en)
			$fwrite(fp, "\n");
		else if(top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.ddr_write_data_valid)
			$fwrite(fp, "%d\n", top_inst.cnn_inst_executor_inst.cnn_inst_parser_inst.ddr_write_data_signed);
	
	initial
	begin
	
		#0			CLOCK100 = 0; CLOCK150 = 0; CLOCK65 = 0; RESETN = 0; top_inst.cnn_inst_en = 0; npu_inst_addr = 0;
		#100		$readmemh("../../matlab/video/source_rgb565.list", mt9d111_sim_inst.pixel_rgb565);
		/*
		// 关于CNN的代码
		#100		$readmemh("../../python/NvDeCNN_TF/sim_source/sp-204-label-1_da.list", ssram_sim_inst.ram_da);
					$readmemh("../../python/NvDeCNN_TF/sim_source/sp-204-label-1_db.list", ssram_sim_inst.ram_db);
					$readmemh("../../python/NvDeCNN_TF/sim_source/sp-204-label-1_dc.list", ssram_sim_inst.ram_dc);
					$readmemh("../../python/NvDeCNN_TF/sim_source/sp-204-label-1_dd.list", ssram_sim_inst.ram_dd);
					$readmemh("../../python/NvDeCNN_TF/fpga/inst.list", npu_inst);
					fp = $fopen("cnn-result-sp-204-label-1.txt", "w");
		#1000		RESETN = 1; 
        // 复位系统
        #4      top_inst.cnn_inst = 1;
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 发射指令
		#4		for(npu_inst_addr=0; npu_inst_addr<598; npu_inst_addr=npu_inst_addr+1)
				begin
					#4		top_inst.cnn_inst = npu_inst[npu_inst_addr];
							top_inst.cnn_inst_en = 1;
					#4		top_inst.cnn_inst_en = 0;
				end
        // 启动计算
        #4      top_inst.cnn_inst = 2;
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 等待指令执行完成
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_ready)
				#1	RESETN = 1;
		#1000	$fclose(fp);	
		
		// 关于CNN的代码
		#100		$readmemh("../../python/NvDeCNN_TF/sim_source/sp-205-label-2_da.list", ssram_sim_inst.ram_da);
					$readmemh("../../python/NvDeCNN_TF/sim_source/sp-205-label-2_db.list", ssram_sim_inst.ram_db);
					$readmemh("../../python/NvDeCNN_TF/sim_source/sp-205-label-2_dc.list", ssram_sim_inst.ram_dc);
					$readmemh("../../python/NvDeCNN_TF/sim_source/sp-205-label-2_dd.list", ssram_sim_inst.ram_dd);
					$readmemh("../../python/NvDeCNN_TF/fpga/inst.list", npu_inst);
					fp = $fopen("cnn-result-sp-205-label-2.txt", "w");
		#1000		RESETN = 1; 
        // 复位系统
        #4      top_inst.cnn_inst = 1;
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 发射指令
		#4		for(npu_inst_addr=0; npu_inst_addr<598; npu_inst_addr=npu_inst_addr+1)
				begin
					#4		top_inst.cnn_inst = npu_inst[npu_inst_addr];
							top_inst.cnn_inst_en = 1;
					#4		top_inst.cnn_inst_en = 0;
				end
        // 启动计算
        #4      top_inst.cnn_inst = 2;
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 等待指令执行完成
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_ready)
				#1	RESETN = 1;
		#1000	$fclose(fp);		
		
		*/
		// 关于CNN的代码
		#100		$readmemh("../../python/NvDeCNN_TF/sim_source/data_under_test_da.tb.list", ssram_sim_inst.ram_da);
					$readmemh("../../python/NvDeCNN_TF/sim_source/data_under_test_db.tb.list", ssram_sim_inst.ram_db);
					$readmemh("../../python/NvDeCNN_TF/sim_source/data_under_test_dc.tb.list", ssram_sim_inst.ram_dc);
					$readmemh("../../python/NvDeCNN_TF/sim_source/data_under_test_dd.tb.list", ssram_sim_inst.ram_dd);
					$readmemh("../../python/NvDeCNN_TF/fpga/inst.list", npu_inst);
					fp = $fopen("cnn-result-data_under_test.txt", "w");
		#1000		RESETN = 1; 
        // 复位系统
        #4      top_inst.cnn_inst = 1;
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 发射指令
		#4		for(npu_inst_addr=0; npu_inst_addr<598; npu_inst_addr=npu_inst_addr+1)
				begin
					#4		top_inst.cnn_inst = npu_inst[npu_inst_addr];
							top_inst.cnn_inst_en = 1;
					#4		top_inst.cnn_inst_en = 0;
				end
        // 启动计算
        #4      top_inst.cnn_inst = 2;
				top_inst.cnn_inst_en = 1;
		#4		top_inst.cnn_inst_en = 0;
		// 等待指令执行完成
		#4		while(top_inst.cnn_inst_executor_inst.cnn_inst_ready)
				#1	RESETN = 1;
		#4		while(!top_inst.cnn_inst_executor_inst.cnn_inst_ready)
				#1	RESETN = 1;
		#1000	$fclose(fp);		
		
		/// 结束
		#40000	$stop;
	end
							
endmodule