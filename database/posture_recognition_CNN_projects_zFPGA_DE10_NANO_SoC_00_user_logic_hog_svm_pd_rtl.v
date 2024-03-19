module hog_svm_pd_rtl
#(
	parameter				CellSize1 = 10,
	parameter				CellSize2 = 10,
	parameter				BlockSize1 = 2,
	parameter				BlockSize2 = 2,
	parameter				WindowSize1 = 70,
	parameter				WindowSize2 = 150
)
(
	input	wire					sys_clk, sys_rst_n,
	// RGB565
	input	wire					RGB565_PCLK,
	input	wire					RGB565_HSYNC,		// 换行		// 需要由MT9D111打上一拍
	input	wire					RGB565_VSYNC,		// 场同步	// 需要由MT9D111打上一拍
	input	wire			[15:0]	RGB565_D,
	input	wire					RGB565_DE,			// 数据有效
	output	reg						svm_judge_res,		// svm判决
	output	reg				[31:0]	svm_judge_res_grade,		// svm判决
	output	reg				[2:0]	svm_judge_res_scale,	// 1--> 1:1 / 2--> 1:2 / 4--> 1:4
	output	reg		signed	[10:0]	svm_judge_HCnt,		// SVM判决的位置
	output	reg		signed	[10:0]	svm_judge_VCnt,		// SVM判决的位置,
	// 写入DDR接口
	// DDR
	output	wire					DDR_WRITE_CLK,
	output	reg		[31:0]			DDR_WRITE_ADDR,
	output	reg		[31:0]			DDR_WRITE_DATA,
	output	reg						DDR_WRITE_REQ,
	input	wire					DDR_WRITE_READY
);

	// 统计现在RGB565像素点的行列计数
	reg		[10:0]			RGB565_HCnt;
	reg		[10:0]			RGB565_VCnt;
	// 寄存器链
	reg		[95:0]	HSYNC;
	reg		[95:0]	VSYNC;
	reg		[95:0]	DE;
	always @(posedge RGB565_PCLK)
	begin
		HSYNC <= {HSYNC[94:0], RGB565_HSYNC};
		VSYNC <= {VSYNC[94:0], RGB565_VSYNC};
		DE <= {DE[94:0], RGB565_DE};
	end
	
	// 检测HSYNC/VSYNC的上升/下降沿
	wire	RGB565_HSYNC_up = (!HSYNC[0] && RGB565_HSYNC);
	wire	RGB565_HSYNC_down = (HSYNC[0] && !RGB565_HSYNC);
	wire	RGB565_VSYNC_up = (!VSYNC[0] && RGB565_VSYNC);
	wire	RGB565_VSYNC_down = (VSYNC[0] && !RGB565_VSYNC);
	
	always @(posedge RGB565_PCLK)
		if(!RGB565_VSYNC)
		begin
			RGB565_HCnt <= 0;
			RGB565_VCnt <= 0;
		end
		else 
		begin		
			if(RGB565_HSYNC_down)
			begin
				RGB565_VCnt <= RGB565_VCnt + 1;
				RGB565_HCnt <= 0;
			end
			else if(RGB565_DE)
				RGB565_HCnt <= RGB565_HCnt + 1;
		end
		
	// 然后生成2个shift，用来分别生成1:2/1:4两种分辨率的图像（插值处理后，效果更好一些）
	wire	[15:0]			RGB565_D_1_1_Prev;
	line_buf_800pts_1line16	line_buf_800pts_1line16_inst_p(
								.clken(RGB565_DE),
								.clock(RGB565_PCLK),
								.aclr(!sys_rst_n || !RGB565_VSYNC),
								.shiftin(RGB565_D),
								.shiftout(RGB565_D_1_1_Prev)
							);
	// 进shifter
	reg		[15:0]			RGB565_D_1_1_Shifter	[0:1];
	always @(posedge RGB565_PCLK)
	begin
		if(!RGB565_VSYNC)
		begin
			RGB565_D_1_1_Shifter[0] <= 0;
			RGB565_D_1_1_Shifter[1] <= 0;
		end
		else if(RGB565_DE)
		begin
			RGB565_D_1_1_Shifter[0] <= RGB565_D;
			RGB565_D_1_1_Shifter[1] <= RGB565_D_1_1_Prev;
		end
	end
	
	// 然后生成1:2插值缩放的图像
	wire	[15:0]			RGB565_D_1_2;
	wire					RGB565_D_1_2_DE = (RGB565_DE && RGB565_VCnt[0]==1'B0 && RGB565_HCnt[0]==1'B0);
	wire					RGB565_D_1_2_HSYNC = (RGB565_HSYNC && RGB565_VCnt[0]==1'B0);
	wire					RGB565_D_1_2_VSYNC = RGB565_VSYNC;
	assign					RGB565_D_1_2[15:11] = (RGB565_D[15:13] + RGB565_D_1_1_Shifter[0][15:13] + RGB565_D_1_1_Prev[15:13] + RGB565_D_1_1_Shifter[1][15:13]);
	assign					RGB565_D_1_2[10:5] = (RGB565_D[10:7] + RGB565_D_1_1_Shifter[0][10:7] + RGB565_D_1_1_Prev[10:7] + RGB565_D_1_1_Shifter[1][10:7]);
	assign					RGB565_D_1_2[4:0] = (RGB565_D[4:2] + RGB565_D_1_1_Shifter[0][4:2] + RGB565_D_1_1_Prev[4:2] + RGB565_D_1_1_Shifter[1][4:2]);
	
	// 再是1:4差值缩放
	wire	[15:0]			RGB565_D_1_2_Prev;
	line_buf_400pts_1line16	line_buf_400pts_1line16_inst_p(
								.clken(RGB565_D_1_2_DE),
								.clock(RGB565_PCLK),
								.aclr(!sys_rst_n || !RGB565_D_1_2_VSYNC),
								.shiftin(RGB565_D_1_2),
								.shiftout(RGB565_D_1_2_Prev)
							);
	// 进shifter
	reg		[15:0]			RGB565_D_1_2_Shifter	[0:1];
	always @(posedge RGB565_PCLK)
	begin
		if(!RGB565_D_1_2_VSYNC)
		begin
			RGB565_D_1_2_Shifter[0] <= 0;
			RGB565_D_1_2_Shifter[1] <= 0;
		end
		else if(RGB565_D_1_2_DE)
		begin
			RGB565_D_1_2_Shifter[0] <= RGB565_D_1_2;
			RGB565_D_1_2_Shifter[1] <= RGB565_D_1_2_Prev;
		end
	end
	
	// 然后生成1:2插值缩放的图像
	wire	[15:0]			RGB565_D_1_4;
	wire					RGB565_D_1_4_DE = (RGB565_DE && RGB565_VCnt[1:0]==2'B00 && RGB565_HCnt[1:0]==2'B00);
	wire					RGB565_D_1_4_HSYNC = (RGB565_HSYNC && RGB565_VCnt[1:0]==2'B00);
	wire					RGB565_D_1_4_VSYNC = RGB565_VSYNC;
	assign					RGB565_D_1_4[15:11] = (RGB565_D_1_2[15:13] + RGB565_D_1_2_Shifter[0][15:13] + RGB565_D_1_2_Prev[15:13] + RGB565_D_1_2_Shifter[1][15:13]);
	assign					RGB565_D_1_4[10:5] = (RGB565_D_1_2[10:7] + RGB565_D_1_2_Shifter[0][10:7] + RGB565_D_1_2_Prev[10:7] + RGB565_D_1_2_Shifter[1][10:7]);
	assign					RGB565_D_1_4[4:0] = (RGB565_D_1_2[4:2] + RGB565_D_1_2_Shifter[0][4:2] + RGB565_D_1_2_Prev[4:2] + RGB565_D_1_2_Shifter[1][4:2]);
	
		
	// 然后例化三个hog_svm行人检测器，分别针对600x800 / 300x400 / 150x200的分辨率
	wire	[10:0]			svm_judge_HCnt_800x600;
	wire	[10:0]			svm_judge_VCnt_800x600;
	wire					svm_judge_res_800x600;
	wire	signed	[31:0]	svm_judge_res_grade_800x600;
	wire	[10:0]			svm_judge_HCnt_400x300;
	wire	[10:0]			svm_judge_VCnt_400x300;
	wire					svm_judge_res_400x300;
	wire	signed	[31:0]	svm_judge_res_grade_400x300;
	wire	[10:0]			svm_judge_HCnt_200x150;
	wire	[10:0]			svm_judge_VCnt_200x150;
	wire					svm_judge_res_200x150;
	wire	signed	[31:0]	svm_judge_res_grade_200x150;
	/*
	hog_svm_pd_800x600		hog_svm_pd_800x600_inst(
								.sys_rst_n(sys_rst_n),
								.RGB565_PCLK(RGB565_PCLK),
								.RGB565_HSYNC(RGB565_HSYNC),
								.RGB565_VSYNC(RGB565_VSYNC),
								.RGB565_D(RGB565_D),
								.RGB565_DE(RGB565_DE),
								.svm_judge_res(svm_judge_res_800x600),
								.svm_judge_res_grade(svm_judge_res_grade_800x600),
								.svm_judge_HCnt(svm_judge_HCnt_800x600),
								.svm_judge_VCnt(svm_judge_VCnt_800x600)
							);
	*/
	/*
	*/
	hog_svm_pd_400x300		hog_svm_pd_400x300_inst(
								.sys_rst_n(sys_rst_n),
								.RGB565_PCLK(RGB565_PCLK),
								.RGB565_HSYNC(RGB565_D_1_2_HSYNC),
								.RGB565_VSYNC(RGB565_D_1_2_VSYNC),
								.RGB565_D(RGB565_D_1_2),
								.RGB565_DE(RGB565_D_1_2_DE),
								.svm_judge_res(svm_judge_res_400x300),
								.svm_judge_res_grade(svm_judge_res_grade_400x300),
								.svm_judge_HCnt(svm_judge_HCnt_400x300),
								.svm_judge_VCnt(svm_judge_VCnt_400x300)
							);
	/*
	*/
	hog_svm_pd_200x150		hog_svm_pd_200x150_inst(
								.sys_rst_n(sys_rst_n),
								.RGB565_PCLK(RGB565_PCLK),
								.RGB565_HSYNC(RGB565_D_1_4_HSYNC),
								.RGB565_VSYNC(RGB565_D_1_4_VSYNC),
								.RGB565_D(RGB565_D_1_4),
								.RGB565_DE(RGB565_D_1_4_DE),
								.svm_judge_res(svm_judge_res_200x150),
								.svm_judge_res_grade(svm_judge_res_grade_200x150),
								.svm_judge_HCnt(svm_judge_HCnt_200x150),
								.svm_judge_VCnt(svm_judge_VCnt_200x150)
							);
	/**/
	//
	// 三个HOG_SVM检测模块的输出连接到各自的FIFO里面
	wire	[63:0]			svm_judge_fifo_q_800x600 /* synthesis keep */;
	wire					svm_judge_fifo_rdempty_800x600 /* synthesis keep */;
	reg						svm_judge_fifo_rdreq_800x600 /* synthesis noprune */;
	wire	[63:0]			svm_judge_fifo_q_400x300 /* synthesis keep */;
	wire					svm_judge_fifo_rdempty_400x300 /* synthesis keep */;
	reg						svm_judge_fifo_rdreq_400x300 /* synthesis noprune */;
	wire	[63:0]			svm_judge_fifo_q_200x150 /* synthesis keep */;
	wire					svm_judge_fifo_rdempty_200x150 /* synthesis keep */;
	reg						svm_judge_fifo_rdreq_200x150 /* synthesis noprune */;
	
	wire					svm_judge_fifo_flush_en = (HSYNC[1:0]==2'B01 && RGB565_VCnt==8); // 第六行HSYNC上升沿的时候开启新的检测，主要是为了给SVM流出足够的处理时间
	
	//
	pd_module_res_fifo_32x256	pd_module_res_fifo_32x256_inst_800x600(
									.aclr(!sys_rst_n || svm_judge_fifo_flush_en),
									.clock(RGB565_PCLK),
									.data({32'D0, svm_judge_res_grade_800x600, svm_judge_HCnt_800x600, svm_judge_VCnt_800x600}),
									.rdreq(svm_judge_fifo_rdreq_800x600),
									.sclr(!sys_rst_n),
									.wrreq(svm_judge_res_800x600),
									.empty(svm_judge_fifo_rdempty_800x600),
									.full(),
									.q(svm_judge_fifo_q_800x600),
									.usedw()
								);
	pd_module_res_fifo_32x256	pd_module_res_fifo_32x256_inst_400x300(
									.aclr(!sys_rst_n || svm_judge_fifo_flush_en),
									.clock(RGB565_PCLK),
									.data({32'D0, svm_judge_res_grade_400x300, svm_judge_HCnt_400x300, svm_judge_VCnt_400x300}),
									.rdreq(svm_judge_fifo_rdreq_400x300),
									.sclr(!sys_rst_n),
									.wrreq(svm_judge_res_400x300),
									.empty(svm_judge_fifo_rdempty_400x300),
									.full(),
									.q(svm_judge_fifo_q_400x300),
									.usedw()
								);
	pd_module_res_fifo_32x256	pd_module_res_fifo_32x256_inst_200x150(
									.aclr(!sys_rst_n || svm_judge_fifo_flush_en),
									.clock(RGB565_PCLK),
									.data({32'D0, svm_judge_res_grade_200x150, svm_judge_HCnt_200x150, svm_judge_VCnt_200x150}),
									.rdreq(svm_judge_fifo_rdreq_200x150),
									.sclr(!sys_rst_n),
									.wrreq(svm_judge_res_200x150),
									.empty(svm_judge_fifo_rdempty_200x150),
									.full(),
									.q(svm_judge_fifo_q_200x150),
									.usedw()
								);
	
	// 需要有一个FSM有限状态机进行NMS（非极大值抑制），将子模块的检测数据进行合并
	// 优先输出200x150低分辨率的PD判定结果
	// 并将结果输出到DDR内进行保存
	assign			DDR_WRITE_CLK = RGB565_PCLK;
	reg		[3:0]	cstate;
	always @(posedge RGB565_PCLK)
		if(!sys_rst_n)	
		begin
			cstate <= 0;
			svm_judge_fifo_rdreq_200x150 <= 0;
			svm_judge_fifo_rdreq_400x300 <= 0;
			svm_judge_fifo_rdreq_800x600 <= 0;
			svm_judge_res <= 0;
			svm_judge_res_scale <= 0;
			// 撤销DDR写入信号
			DDR_WRITE_ADDR <= 32'H0900_0000;
			DDR_WRITE_REQ <= 0;
		end
		else 
		begin
			case(cstate)
				0: begin
					if(svm_judge_fifo_flush_en)
					begin
						svm_judge_fifo_rdreq_200x150 <= 0;
						svm_judge_fifo_rdreq_400x300 <= 0;
						svm_judge_fifo_rdreq_800x600 <= 0;
						svm_judge_res <= 0;
						svm_judge_res_scale <= 0;
						// DDR : 往DDR的下一个位置写入0x0000_0000表示一次行人检测已经结束
						DDR_WRITE_ADDR <= DDR_WRITE_ADDR + 1;
						DDR_WRITE_REQ <= 1;
						DDR_WRITE_DATA <= 0;
						cstate <= 4;
					end
					if(!svm_judge_fifo_rdempty_200x150)
					begin
						cstate <= 1;
						svm_judge_fifo_rdreq_200x150 <= 1;
						svm_judge_res_scale <= 4;
						svm_judge_res <= 1;
						svm_judge_res_grade <= svm_judge_fifo_q_200x150[63:22];
						svm_judge_HCnt <= svm_judge_fifo_q_200x150[21:11];
						svm_judge_VCnt <= svm_judge_fifo_q_200x150[10:0];
						$display("200x150 : <%d, %d> ==> %d", 	svm_judge_fifo_q_200x150[21:11],
																svm_judge_fifo_q_200x150[10:0],
																svm_judge_fifo_q_200x150[63:22]
						);
						// 启动DDR写入
						DDR_WRITE_DATA <= {2'B11, svm_judge_fifo_q_200x150[41:32], svm_judge_fifo_q_200x150[20:11], svm_judge_fifo_q_200x150[9:0]};	// 2'B11, grade/1024, HCnt, VCnt
						DDR_WRITE_REQ <= 1;
						DDR_WRITE_ADDR <= DDR_WRITE_ADDR + 1;
					end
					else if(!svm_judge_fifo_rdempty_400x300)
					begin
						cstate <= 2;
						svm_judge_fifo_rdreq_400x300 <= 1;
						svm_judge_res_scale <= 2;
						svm_judge_res <= 1;
						svm_judge_res_grade <= svm_judge_fifo_q_400x300[63:22];
						svm_judge_HCnt <= svm_judge_fifo_q_400x300[21:11];
						svm_judge_VCnt <= svm_judge_fifo_q_400x300[10:0];
						$display("400x300 : <%d, %d> ==> %d", 	svm_judge_fifo_q_400x300[21:11],
																svm_judge_fifo_q_400x300[10:0],
																svm_judge_fifo_q_400x300[63:22]
						);
						
						// 启动DDR写入
						DDR_WRITE_DATA <= {2'B10, svm_judge_fifo_q_400x300[41:32], svm_judge_fifo_q_400x300[20:11], svm_judge_fifo_q_400x300[9:0]};	// 2'B10, grade/1024, HCnt, VCnt
						DDR_WRITE_REQ <= 1;
						DDR_WRITE_ADDR <= DDR_WRITE_ADDR + 1;
					end
					else if(!svm_judge_fifo_rdempty_800x600)
					begin
						cstate <= 3;
						svm_judge_fifo_rdreq_800x600 <= 1;
						svm_judge_res_scale <= 1;
						svm_judge_res <= 1;
						svm_judge_res_grade <= svm_judge_fifo_q_800x600[63:22];
						svm_judge_HCnt <= svm_judge_fifo_q_800x600[21:11];
						svm_judge_VCnt <= svm_judge_fifo_q_800x600[10:0];
						$display("800x600 : <%d, %d> ==> %d", 	svm_judge_fifo_q_800x600[21:11],
																svm_judge_fifo_q_800x600[10:0],
																svm_judge_fifo_q_800x600[63:22]
						);
						
						// 启动DDR写入
						DDR_WRITE_DATA <= {2'B01, svm_judge_fifo_q_800x600[41:32], svm_judge_fifo_q_800x600[20:11], svm_judge_fifo_q_800x600[9:0]};	// 2'B01, grade/1024, HCnt, VCnt
						DDR_WRITE_REQ <= 1;
						DDR_WRITE_ADDR <= DDR_WRITE_ADDR + 1;
					end
					//
				end
				
				1: begin
					svm_judge_fifo_rdreq_200x150 <= 0;
					svm_judge_res <= 0;
					// 完成就要跳回0状态
					if(DDR_WRITE_READY)
					begin
						cstate <= 0;
						DDR_WRITE_REQ <= 0;
					end
				end
				
				2: begin
					svm_judge_fifo_rdreq_400x300 <= 0;
					svm_judge_res <= 0;
					// 完成就要跳回0状态
					if(DDR_WRITE_READY)
					begin
						cstate <= 0;
						DDR_WRITE_REQ <= 0;
					end
				end
				
				3: begin
					svm_judge_fifo_rdreq_800x600 <= 0;
					svm_judge_res <= 0;
					// 完成就要跳回0状态
					if(DDR_WRITE_READY)
					begin
						cstate <= 0;
						DDR_WRITE_REQ <= 0;
					end
				end
				
				4: begin
					// 完成就要跳回0状态
					if(DDR_WRITE_READY)
					begin
						cstate <= 0;
						DDR_WRITE_REQ <= 0;
						DDR_WRITE_ADDR <= 32'H0900_0000;	// 同时回到最开始的地址！
					end
				end
				
			
				default: begin
					cstate <= 0;
					svm_judge_fifo_rdreq_200x150 <= 0;
					svm_judge_fifo_rdreq_400x300 <= 0;
					svm_judge_fifo_rdreq_800x600 <= 0;
					svm_judge_res <= 0;
					//
					DDR_WRITE_REQ <= 0;
				end
			endcase
		end
		
endmodule