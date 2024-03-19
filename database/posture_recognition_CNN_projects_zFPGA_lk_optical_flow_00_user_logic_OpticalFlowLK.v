`include "vga_config.inc"
// LK光流法运算模块
module OpticalFlowLK
(
	// system signal
	input	wire			sys_clk, sys_rst_n,
	input	wire	[7:2]	KEY_safe,
	// RGB565
	input	wire			RGB565_PCLK,
	input	wire			RGB565_HSYNC,		// 换行		// 需要由MT9D111打上一拍
	input	wire			RGB565_VSYNC,		// 场同步	// 需要由MT9D111打上一拍
	input	wire	[15:0]	RGB565_D,
	input	wire			RGB565_DE,			// 数据有效
	input	wire	[5:0]	PREV_FRAME,			// 上一帧
	input	wire	[5:0]	CURR_FRAME,			// 当前帧
	output	wire	[5:0]	OPTICAL_FRAME,		// 正在生成的光流当前帧
	output	reg		[31:0]	OPTICAL_THRES,		// 光流法的动态阈值
	/*
	*/
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
	
	//////////////////////////////////////////////////////////////////////
	// 上一帧的相同位置的像素值
	wire			[15:0]	RGB565_D_prev;
	// 然后是要把数据代入到RGB/YUV变换模块
	wire			[15:0]	YUV422_D_curr;
	wire			[15:0]	YUV422_D_prev;
	wire					YUV422_DE;
	wire					YUV422_HSYNC;
	wire					YUV422_VSYNC;
	RGB565_YUV422			RGB565_YUV422_inst_curr(
								.sys_rst_n(sys_rst_n),
								.RGB565_PCLK(RGB565_PCLK),
								.RGB565_HSYNC(RGB565_HSYNC),
								.RGB565_VSYNC(RGB565_VSYNC),
								.RGB565_D(RGB565_D),
								.RGB565_DE(RGB565_DE),
								.YUV422_D(YUV422_D_curr),
								.YUV422_DE(YUV422_DE),
								.YUV422_HSYNC(YUV422_HSYNC),
								.YUV422_VSYNC(YUV422_VSYNC)
							);
	RGB565_YUV422			RGB565_YUV422_inst_prev(
								.sys_rst_n(sys_rst_n),
								.RGB565_PCLK(RGB565_PCLK),
								.RGB565_HSYNC(RGB565_HSYNC),
								.RGB565_VSYNC(RGB565_VSYNC),
								.RGB565_D(RGB565_D_prev),
								.RGB565_DE(RGB565_DE),
								.YUV422_D(YUV422_D_prev)
							);
	// 生成Ixyt / Ixytm1
	wire	[8:0]		Ixyt = YUV422_D_curr[7:0];
	wire	[8:0]		Ixytm1 = YUV422_D_prev[7:0];
	// 然后需要计算Ix/Iy/It
	reg		[8:0]		Ix;
	reg		[8:0]		Iy;
	reg		[8:0]		It;
	reg					IxIyItEn;	// 表示上述几个数据有效
	reg		[8:0]		Ixm1yt;
	wire	[8:0]		Ixym1t;
	always @(posedge RGB565_PCLK)
	begin
		if(!YUV422_HSYNC)
			Ixm1yt <= 0;
		else if(YUV422_DE)
			Ixm1yt <= Ixyt;
		//
		Ix <= Ixyt - Ixm1yt;
		Iy <= Ixyt - Ixym1t;
		It <= Ixyt - Ixytm1;
		IxIyItEn <= YUV422_DE;
	end
	
	// 需要缓冲一行，用来计算Iy
	line_buf_800pts_1line	line_buf_800pts_1line_inst_p(
								.clken(YUV422_DE),
								.clock(RGB565_PCLK),
								.aclr(!sys_rst_n),
								.shiftin(Ixyt),
								.shiftout(Ixym1t)
							);
	// 
	// 然后是构造\Omega域
	wire	[26:0]		IxIyItPrev	[1:4];
	reg		[161:0]		OmegaField	[0:4];
	always @(posedge RGB565_PCLK)
		if(!HSYNC[6])	// 注意这里一定要对齐！
		begin
			OmegaField[0] <= 0;
			OmegaField[1] <= 0;
			OmegaField[2] <= 0;
			OmegaField[3] <= 0;
			OmegaField[4] <= 0;
		end
		else if(IxIyItEn)
		begin
			OmegaField[0] <= {{Ix, Iy, It}, OmegaField[0][161:27]};
			OmegaField[1] <= {IxIyItPrev[1], OmegaField[1][161:27]};
			OmegaField[2] <= {IxIyItPrev[2], OmegaField[2][161:27]};
			OmegaField[3] <= {IxIyItPrev[3], OmegaField[3][161:27]};
			OmegaField[4] <= {IxIyItPrev[4], OmegaField[4][161:27]};
		end
	// 使用shift register来推移
	IxIyIt_800pts_4line		IxIyIt_800pts_4line_inst_p(
								.clken(IxIyItEn),
								.clock(RGB565_PCLK),
								.aclr(!RESETN || !RGB565_VSYNC),
								.shiftin({Ix, Iy, It}),
								.taps0x(IxIyItPrev[1]),
								.taps1x(IxIyItPrev[2]),
								.taps2x(IxIyItPrev[3]),
								.taps3x(IxIyItPrev[4])
							);
	////////////////////////////////
	// 然后是统计\Omega域内的IxIx/IyIy/IxIy/IxIt/IyIt
	wire	signed		[8:0]		Ix_prev		[0:4];
	wire	signed		[8:0]		Iy_prev		[0:4];
	wire	signed		[8:0]		It_prev		[0:4];
	wire	signed		[8:0]		Ix_curr		[0:4];
	wire	signed		[8:0]		Iy_curr		[0:4];
	wire	signed		[8:0]		It_curr		[0:4];
	assign							Ix_curr[0] = OmegaField[0][161:153];
	assign							Ix_curr[1] = OmegaField[1][161:153];
	assign							Ix_curr[2] = OmegaField[2][161:153];
	assign							Ix_curr[3] = OmegaField[3][161:153];
	assign							Ix_curr[4] = OmegaField[4][161:153];
	assign							Iy_curr[0] = OmegaField[0][152:144];
	assign							Iy_curr[1] = OmegaField[1][152:144];
	assign							Iy_curr[2] = OmegaField[2][152:144];
	assign							Iy_curr[3] = OmegaField[3][152:144];
	assign							Iy_curr[4] = OmegaField[4][152:144];
	assign							It_curr[0] = OmegaField[0][143:135];
	assign							It_curr[1] = OmegaField[1][143:135];
	assign							It_curr[2] = OmegaField[2][143:135];
	assign							It_curr[3] = OmegaField[3][143:135];
	assign							It_curr[4] = OmegaField[4][143:135];
	assign							Ix_prev[0] = OmegaField[0][26:18];
	assign							Ix_prev[1] = OmegaField[1][26:18];
	assign							Ix_prev[2] = OmegaField[2][26:18];
	assign							Ix_prev[3] = OmegaField[3][26:18];
	assign							Ix_prev[4] = OmegaField[4][26:18];
	assign							Iy_prev[0] = OmegaField[0][17:9];
	assign							Iy_prev[1] = OmegaField[1][17:9];
	assign							Iy_prev[2] = OmegaField[2][17:9];
	assign							Iy_prev[3] = OmegaField[3][17:9];
	assign							Iy_prev[4] = OmegaField[4][17:9];
	assign							It_prev[0] = OmegaField[0][8:0];
	assign							It_prev[1] = OmegaField[1][8:0];
	assign							It_prev[2] = OmegaField[2][8:0];
	assign							It_prev[3] = OmegaField[3][8:0];
	assign							It_prev[4] = OmegaField[4][8:0];
	// 计算
	reg		signed		[17:0]		IxIx_prev	[0:4];
	reg		signed		[17:0]		IxIy_prev	[0:4];
	reg		signed		[17:0]		IyIy_prev	[0:4];
	reg		signed		[17:0]		IxIt_prev	[0:4];
	reg		signed		[17:0]		IyIt_prev	[0:4];
	reg		signed		[17:0]		IxIx_curr	[0:4];
	reg		signed		[17:0]		IxIy_curr	[0:4];
	reg		signed		[17:0]		IyIy_curr	[0:4];
	reg		signed		[17:0]		IxIt_curr	[0:4];
	reg		signed		[17:0]		IyIt_curr	[0:4];
	reg		signed		[21:0]		IxIx_sum	/* synthesis noprune */;
	reg		signed		[21:0]		IxIx_delta_plus;
	reg		signed		[21:0]		IxIx_delta_minus;
	reg		signed		[21:0]		IxIy_sum	/* synthesis noprune */;
	reg		signed		[21:0]		IxIy_delta_plus;
	reg		signed		[21:0]		IxIy_delta_minus;
	reg		signed		[21:0]		IyIy_sum	/* synthesis noprune */;
	reg		signed		[21:0]		IyIy_delta_plus;
	reg		signed		[21:0]		IyIy_delta_minus;
	reg		signed		[21:0]		IxIt_sum	/* synthesis noprune */;
	reg		signed		[21:0]		IxIt_delta_plus;
	reg		signed		[21:0]		IxIt_delta_minus;
	reg		signed		[21:0]		IyIt_sum	/* synthesis noprune */;
	reg		signed		[21:0]		IyIt_delta_plus;
	reg		signed		[21:0]		IyIt_delta_minus;
	always @(posedge RGB565_PCLK)
	begin
		// current
		IxIx_curr[0] <= Ix_curr[0] * (* multstyle = "logic" *) Ix_curr[0];	// Ix * Ix
		IxIx_curr[1] <= Ix_curr[1] * (* multstyle = "logic" *) Ix_curr[1];	// Ix * Ix
		IxIx_curr[2] <= Ix_curr[2] * (* multstyle = "logic" *) Ix_curr[2];	// Ix * Ix
		IxIx_curr[3] <= Ix_curr[3] * (* multstyle = "logic" *) Ix_curr[3];	// Ix * Ix
		IxIx_curr[4] <= Ix_curr[4] * (* multstyle = "logic" *) Ix_curr[4];	// Ix * Ix
		
		IxIy_curr[0] <= Ix_curr[0] * (* multstyle = "logic" *) Iy_curr[0];	// Ix * Iy
		IxIy_curr[1] <= Ix_curr[1] * (* multstyle = "logic" *) Iy_curr[1];	// Ix * Iy
		IxIy_curr[2] <= Ix_curr[2] * (* multstyle = "logic" *) Iy_curr[2];	// Ix * Iy
		IxIy_curr[3] <= Ix_curr[3] * (* multstyle = "logic" *) Iy_curr[3];	// Ix * Iy
		IxIy_curr[4] <= Ix_curr[4] * (* multstyle = "logic" *) Iy_curr[4];	// Ix * Iy
		
		IyIy_curr[0] <= Iy_curr[0] * (* multstyle = "logic" *) Iy_curr[0];	// Iy * Iy
		IyIy_curr[1] <= Iy_curr[1] * (* multstyle = "logic" *) Iy_curr[1];	// Iy * Iy
		IyIy_curr[2] <= Iy_curr[2] * (* multstyle = "logic" *) Iy_curr[2];	// Iy * Iy
		IyIy_curr[3] <= Iy_curr[3] * (* multstyle = "logic" *) Iy_curr[3];	// Iy * Iy
		IyIy_curr[4] <= Iy_curr[4] * (* multstyle = "logic" *) Iy_curr[4];	// Iy * Iy
		
		IxIt_curr[0] <= Ix_curr[0] * (* multstyle = "logic" *) It_curr[0];	// Ix * It
		IxIt_curr[1] <= Ix_curr[1] * (* multstyle = "logic" *) It_curr[1];	// Ix * It
		IxIt_curr[2] <= Ix_curr[2] * (* multstyle = "logic" *) It_curr[2];	// Ix * It
		IxIt_curr[3] <= Ix_curr[3] * (* multstyle = "logic" *) It_curr[3];	// Ix * It
		IxIt_curr[4] <= Ix_curr[4] * (* multstyle = "logic" *) It_curr[4];	// Ix * It
		
		IyIt_curr[0] <= Iy_curr[0] * (* multstyle = "logic" *) It_curr[0];	// Iy * It
		IyIt_curr[1] <= Iy_curr[1] * (* multstyle = "logic" *) It_curr[1];	// Iy * It
		IyIt_curr[2] <= Iy_curr[2] * (* multstyle = "logic" *) It_curr[2];	// Iy * It
		IyIt_curr[3] <= Iy_curr[3] * (* multstyle = "logic" *) It_curr[3];	// Iy * It
		IyIt_curr[4] <= Iy_curr[4] * (* multstyle = "logic" *) It_curr[4];	// Iy * It
		
		// previous
		IxIx_prev[0] <= Ix_prev[0] * (* multstyle = "logic" *) Ix_prev[0];	// Ix * Ix
		IxIx_prev[1] <= Ix_prev[1] * (* multstyle = "logic" *) Ix_prev[1];	// Ix * Ix
		IxIx_prev[2] <= Ix_prev[2] * (* multstyle = "logic" *) Ix_prev[2];	// Ix * Ix
		IxIx_prev[3] <= Ix_prev[3] * (* multstyle = "logic" *) Ix_prev[3];	// Ix * Ix
		IxIx_prev[4] <= Ix_prev[4] * (* multstyle = "logic" *) Ix_prev[4];	// Ix * Ix
		
		IxIy_prev[0] <= Ix_prev[0] * (* multstyle = "logic" *) Iy_prev[0];	// Ix * Iy
		IxIy_prev[1] <= Ix_prev[1] * (* multstyle = "logic" *) Iy_prev[1];	// Ix * Iy
		IxIy_prev[2] <= Ix_prev[2] * (* multstyle = "logic" *) Iy_prev[2];	// Ix * Iy
		IxIy_prev[3] <= Ix_prev[3] * (* multstyle = "logic" *) Iy_prev[3];	// Ix * Iy
		IxIy_prev[4] <= Ix_prev[4] * (* multstyle = "logic" *) Iy_prev[4];	// Ix * Iy
		
		IyIy_prev[0] <= Iy_prev[0] * (* multstyle = "logic" *) Iy_prev[0];	// Iy * Iy
		IyIy_prev[1] <= Iy_prev[1] * (* multstyle = "logic" *) Iy_prev[1];	// Iy * Iy
		IyIy_prev[2] <= Iy_prev[2] * (* multstyle = "logic" *) Iy_prev[2];	// Iy * Iy
		IyIy_prev[3] <= Iy_prev[3] * (* multstyle = "logic" *) Iy_prev[3];	// Iy * Iy
		IyIy_prev[4] <= Iy_prev[4] * (* multstyle = "logic" *) Iy_prev[4];	// Iy * Iy
		
		IxIt_prev[0] <= Ix_prev[0] * (* multstyle = "logic" *) It_prev[0];	// Ix * It
		IxIt_prev[1] <= Ix_prev[1] * (* multstyle = "logic" *) It_prev[1];	// Ix * It
		IxIt_prev[2] <= Ix_prev[2] * (* multstyle = "logic" *) It_prev[2];	// Ix * It
		IxIt_prev[3] <= Ix_prev[3] * (* multstyle = "logic" *) It_prev[3];	// Ix * It
		IxIt_prev[4] <= Ix_prev[4] * (* multstyle = "logic" *) It_prev[4];	// Ix * It
		
		IyIt_prev[0] <= Iy_prev[0] * (* multstyle = "logic" *) It_prev[0];	// Iy * It
		IyIt_prev[1] <= Iy_prev[1] * (* multstyle = "logic" *) It_prev[1];	// Iy * It
		IyIt_prev[2] <= Iy_prev[2] * (* multstyle = "logic" *) It_prev[2];	// Iy * It
		IyIt_prev[3] <= Iy_prev[3] * (* multstyle = "logic" *) It_prev[3];	// Iy * It
		IyIt_prev[4] <= Iy_prev[4] * (* multstyle = "logic" *) It_prev[4];	// Iy * It
		
		/////////////////////////////////////////////////////////////////
		// 加法
		IxIx_delta_plus <= IxIx_curr[0] + IxIx_curr[1] + IxIx_curr[2] + IxIx_curr[3] + IxIx_curr[4];
		IxIx_delta_minus <= IxIx_prev[0] + IxIx_prev[1] + IxIx_prev[2] + IxIx_prev[3] + IxIx_prev[4];
		IxIy_delta_plus <= IxIy_curr[0] + IxIy_curr[1] + IxIy_curr[2] + IxIy_curr[3] + IxIy_curr[4];
		IxIy_delta_minus <= IxIy_prev[0] + IxIy_prev[1] + IxIy_prev[2] + IxIy_prev[3] + IxIy_prev[4];
		IyIy_delta_plus <= IyIy_curr[0] + IyIy_curr[1] + IyIy_curr[2] + IyIy_curr[3] + IyIy_curr[4];
		IyIy_delta_minus <= IyIy_prev[0] + IyIy_prev[1] + IyIy_prev[2] + IyIy_prev[3] + IyIy_prev[4];
		IxIt_delta_plus <= IxIt_curr[0] + IxIt_curr[1] + IxIt_curr[2] + IxIt_curr[3] + IxIt_curr[4];
		IxIt_delta_minus <= IxIt_prev[0] + IxIt_prev[1] + IxIt_prev[2] + IxIt_prev[3] + IxIt_prev[4];
		IyIt_delta_plus <= IyIt_curr[0] + IyIt_curr[1] + IyIt_curr[2] + IyIt_curr[3] + IyIt_curr[4];
		IyIt_delta_minus <= IyIt_prev[0] + IyIt_prev[1] + IyIt_prev[2] + IyIt_prev[3] + IyIt_prev[4];
		/////////////
		// 求和
		if(!HSYNC[9])
		begin
			IxIx_sum <= 0;
			IxIy_sum <= 0;
			IyIy_sum <= 0;
			IxIt_sum <= 0;
			IyIt_sum <= 0;
		end
		else if(DE[9])
		begin
			IxIx_sum <= IxIx_sum + IxIx_delta_plus - IxIx_delta_minus;
			IxIy_sum <= IxIy_sum + IxIy_delta_plus - IxIy_delta_minus;
			IyIy_sum <= IyIy_sum + IyIy_delta_plus - IyIy_delta_minus;
			IxIt_sum <= IxIt_sum + IxIt_delta_plus - IxIt_delta_minus;
			IyIt_sum <= IyIt_sum + IyIt_delta_plus - IyIt_delta_minus;
		end
	end
	
	/////////////////////////////////////////////////////////////
	// 然后就要进入流水线除法器了
	// 8-bit小数位
	// 首先构造分子分母
	reg		signed		[63:0]		numer_u, numer_v;
	reg		signed		[63:0]		denom;
	wire	signed		[31:0]		lambda = {19'D0, 5'D16, 8'D0};	// 正则化项
	reg		signed		[31:0]		a_plus_lambda;// = {{2{IxIx_sum[21]}}, IxIx_sum, 8'D0} + lambda;
	reg		signed		[31:0]		d_plus_lambda;// = {{2{IyIy_sum[21]}}, IyIy_sum, 8'D0} + lambda;
	reg		signed		[31:0]		b;
	reg		signed		[31:0]		c;
	reg		signed		[31:0]		e;
	reg		signed		[31:0]		f;
	reg		signed		[63:0]		aldl;
	reg		signed		[63:0]		bc;
	reg		signed		[63:0]		ce;
	reg		signed		[63:0]		bf;
	reg		signed		[63:0]		dle;
	reg		signed		[63:0]		alf;
	
	always @(posedge RGB565_PCLK)
	begin
		a_plus_lambda <= {{2{IxIx_sum[21]}}, IxIx_sum, 8'D0} + lambda;
		d_plus_lambda <= {{2{IyIy_sum[21]}}, IyIy_sum, 8'D0} + lambda;
		b <= {{2{IxIy_sum[21]}}, IxIy_sum, 8'D0};
		c <= {{2{IxIy_sum[21]}}, IxIy_sum, 8'D0};
		e <= {{2{IxIt_sum[21]}}, IxIt_sum, 8'D0};
		f <= {{2{IyIt_sum[21]}}, IyIt_sum, 8'D0};
		// 
		aldl <= a_plus_lambda * d_plus_lambda;
		bc <= b * c;
		ce <= c * e;
		bf <= b * f;
		dle <= d_plus_lambda * e;
		alf <= a_plus_lambda * f;
		//
		denom <= (aldl - bc);
		numer_u <= dle - bf;
		numer_v <= -ce + alf;
	end
	/////////////////
	wire				[63:0]		quotient_u	/* synthesis keep */;
	wire				[63:0]		quotient_v	/* synthesis keep */;
	// 记录
	reg		signed		[63:0]		optical_u	[0:9] 	/* synthesis noprune */;
	reg		signed		[63:0]		optical_v	[0:9]	/* synthesis noprune */;
	wire							optical_uv_en = DE[78];
	wire	signed		[63:0]		optical_u_0 = optical_u[0]	/* synthesis keep */;
	wire	signed		[63:0]		optical_v_0 = optical_v[0]	/* synthesis keep */;
	wire	signed		[63:0]		optical_u_9 = optical_u[9]	/* synthesis keep */;
	wire	signed		[63:0]		optical_v_9 = optical_v[9]	/* synthesis keep */;
	integer	p;
	always @(posedge RGB565_PCLK)
	begin
		optical_u[0] <= quotient_u;
		optical_v[0] <= quotient_v;
		for(p=1; p<10; p=p+1)
		begin
			optical_u[p] <= optical_u[p-1];
			optical_v[p] <= optical_v[p-1];
		end
	end
	////
	alt_lpm_divider		alt_lpm_divider_inst_u(
							.clock(RGB565_PCLK),
							.denom(denom[63:8]),
							.numer(numer_u),
							.quotient(quotient_u)
						);
	alt_lpm_divider		alt_lpm_divider_inst_v(
							.clock(RGB565_PCLK),
							.denom(denom[63:8]),
							.numer(numer_v),
							.quotient(quotient_v)
						);
	// 计算向量模
	wire	[31:0]		optical_phase /* synthesis keep */;
	wire	[31:0]		optical_rho /* synthesis keep */;
	wire				optical_rho_phase_en = DE[87] /* synthesis keep */;
	int_cordic_core		cordic_mdl(
							.sys_clk(RGB565_PCLK),
							.sys_rst_n(sys_rst_n),
							.src_x(quotient_u<<<16),	// 注意！这里的ux和vy都一定要左移16bit，因为int_cordic_core是32/16的配置！
							.src_y(quotient_v<<<16),
							.rho(optical_rho),
							.theta(optical_phase)
						);
	// 动态阈值 + 4阶均值滤波
	reg		[63:0]		sum_optical_rho;	// 需要统计光流场的大小（模）在一帧中的总和
	reg		[31:0]		shifter_optical_rho	[0:3];
	always @(posedge RGB565_PCLK)
		// 一旦VSYNC上升（新的一帧到来，就要进行迭代）
		if(VSYNC[3:2]==2'B01)
		begin
			shifter_optical_rho[3] <= shifter_optical_rho[2];
			shifter_optical_rho[2] <= shifter_optical_rho[1];
			shifter_optical_rho[1] <= shifter_optical_rho[0];
			shifter_optical_rho[0] <= (sum_optical_rho>>>16);	// 四阶均值滤波的移位寄存器
			OPTICAL_THRES <= (shifter_optical_rho[3]>>2) + (shifter_optical_rho[2]>>2) + 
								(shifter_optical_rho[1]>>2) + (shifter_optical_rho[0]>>2);	// 为了实现动态阈值
			sum_optical_rho <= 0;	// 清空总和计数
		end
		else if(optical_rho_phase_en)
			sum_optical_rho <= sum_optical_rho + (optical_rho>>>16);	// 一直在累加
			
	// 然后要把结果写入到DDR里面去
	reg		[1:0]		optical_frame;	// 要写入的区间
	reg					optical_frame_en;	// 切换写入区间有效标志
	assign				OPTICAL_FRAME = optical_frame;	// 向外传输
	always @(posedge RGB565_PCLK)
		if(!sys_rst_n)
		begin
			optical_frame <= 0;
			optical_frame_en <= 0;
		end
		else if(VSYNC[87]==0 && VSYNC[88]==1)	// 下降沿，开启新的一帧
		begin
			optical_frame <= optical_frame + 1;
			optical_frame_en <= 1;
		end
		else
			optical_frame_en <= 0;		// 撤销掉切换区间使能标志
	// 统计所在行列信息
	reg		[10:0]		optical_HCnt;
	reg		[10:0]		optical_VCnt;
	always @(posedge RGB565_PCLK)
		if(!sys_rst_n || !VSYNC[87])
		begin
			optical_VCnt <= 0;
			optical_HCnt <= 0;
		end
		else if(HSYNC[87]==0 && HSYNC[88]==1)	// 下降沿切换行
		begin
			optical_VCnt <= optical_VCnt + 1;
			optical_HCnt <= 0;
		end
		else if(DE[87])
			optical_HCnt <= optical_HCnt + 1;
	// 使用FIFO生成Avalon时序
	// 首先把光流计算的数据保存到DDR 
	// 上方 480MB~512 MB属于相机拍摄的缓存 -- 8MB/frame
	// | 480MB-488MB | 488MB-496MB | 496MB-504MB | 504MB-512MB |
	wire	[31:0]		optical_FrameAddr /* synthesis keep */; 
	assign				optical_FrameAddr = ((({32'D0, ({32'D0, optical_VCnt})*((`CAM_H_WIDTH))+(({32'D0, optical_HCnt}) - 0)})&32'H1F_FFFF) | {5'D0, optical_frame&6'H03, 21'H00_0000}) + 32'H0780_0000;
	wire	[63:0]		optical_to_sdram_fifo_q;
	wire				optical_to_sdram_fifo_ready = DDR_WRITE_READY;
	wire				optical_to_sdram_fifo_rdempty;
	wire	[31:0]		optical_uv = (optical_rho>>>16) /* synthesis keep */;
	wire	[31:0]		optical_threshold_judge = (optical_uv>OPTICAL_THRES)? 32'HFFFF_FFFF : 32'H0000_0000 /* synthesis keep */;
	// 主要是为了构造Avalon时序
	alt_fifo_64b_2048w	OPTICAL_SDRAM_INST(
							.aclr(!sys_rst_n),
							.data({optical_FrameAddr, {1'B0, optical_threshold_judge[0], optical_u[9][17:3], optical_v[9][17:3]}}),
							.wrclk(RGB565_PCLK),
							.wrreq(optical_rho_phase_en),
							.wrusedw(),
							.wrfull(),
							.q(optical_to_sdram_fifo_q),
							.rdusedw(),
							.rdclk(RGB565_PCLK),
							.rdreq(!optical_to_sdram_fifo_rdempty && optical_to_sdram_fifo_ready),
							.rdempty(optical_to_sdram_fifo_rdempty)
						);
	// 生成DDR写入接口
	assign			DDR_WRITE_CLK = RGB565_PCLK;
	assign			DDR_WRITE_ADDR = optical_to_sdram_fifo_q[63:32];
	assign			DDR_WRITE_DATA = optical_to_sdram_fifo_q[31:0];
	assign			DDR_WRITE_REQ = !optical_to_sdram_fifo_rdempty;
	/////////////////////////////////////////////////////////////////
	////////////////////////////////// 下面是读取上一帧的图像数据代码/////////////
	// 首先，需要从DDR里面读取出上一帧的数据
	// 下面是读取DDR里面的图像
	reg		[10:0]		MON_V_rd;			// 倍频读取SDRAM，图像的行，生成MON扫描图像
	reg		[10:0]		MON_H_rd;			// 倍频读取SDRAM，图像的列，生成MON扫描图像
	reg					MON_PIXEL_rdreq;	// 倍频读取SDRAM，使能信号
	wire				MON_PIXEL_rd_en = DDR_READ_READY;	// 倍频读取SDRAM，读取完成信号
	reg		[5:0]		MON_Frame;
	//////////////////////
	// 还是要用状态机来控制！
	reg		[3:0]		cstate /* synthesis noprune */;
	always @(posedge DDR_READ_CLK)
		if(!sys_rst_n)
		begin
			cstate <= 0;
			MON_V_rd <= 0;
			MON_H_rd <= 11'H7FF;
			MON_PIXEL_rdreq <= 0;
			MON_Frame <= 0;
		end
		else
		begin
			case(cstate)
				// 选择要读取那个块的数据
				4'D0: begin
					if(RGB565_VSYNC_down)
					begin
						MON_Frame <= CURR_FRAME;	// 读取上次写入的块
						MON_PIXEL_rdreq <= 0;
						MON_V_rd <= 0;
						MON_H_rd <= 11'H7FF;
						cstate <= 1;
					end
				end
				
				// 发现换行了，就要开始读取DDR，提前准备好数据！
				// (提前读取下一行扫描的数据)，对应于原始图像中【超前两行】
				// 注意！这里好像存在读取不出上一帧图像的情况！//只能输入的时钟下降一些
				4'D1: begin
					if(VSYNC[2:1]==2'B10)	// 如果仅仅是VSYNC上升的时候采取读取，来不及，因为MT9D111的HSYNC仅仅滞后于VSYNC 6个PCLK的时间
					begin
						MON_H_rd <= 0;
						MON_V_rd <= 0;
						MON_PIXEL_rdreq <= 1;	// 开始读
						cstate <= 2;
					end
					else if(RGB565_HSYNC_up && MON_V_rd<`CAM_V_WIDTH)
					begin
						MON_H_rd <= 0;
						MON_PIXEL_rdreq <= 1;	// 开始读
						cstate <= 2;
					end
					else if(RGB565_HSYNC_up && MON_V_rd>=`CAM_V_WIDTH)
					begin
						MON_V_rd <= 0;
						MON_PIXEL_rdreq <= 0;	// 停止读取
						MON_H_rd <= 11'H7FF;
						cstate <= 0;
					end
				end
				
				// 读取环节
				4'D2: begin
					if(MON_V_rd>=0 && MON_V_rd<`CAM_V_WIDTH && MON_PIXEL_rd_en)
					begin
						if(MON_H_rd>=(`CAM_H_WIDTH - 1))
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
					MON_V_rd <= MON_V_rd + 1; 	// 往下面走一行
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
	reg						line_buffer_clear /* synthesis noprune */;
	always @(posedge DDR_READ_CLK)
	begin
		line_buffer_wrreq <= DDR_READ_DATA_VALID;
		line_buffer_data <= DDR_READ_DATA;
	end
	// 生成FIFO的清除信号
	always @(posedge RGB565_PCLK)
		line_buffer_clear <= (VSYNC[2:1]==2'B10 || VSYNC[1:0]==2'B10);		// 注意！这里的line-buffer清理（复位）使能需要留意！
	alt_fifo_16b_4096w		alt_fifo_16b_4096w_line_buf_inst(
								.aclr(!sys_rst_n || line_buffer_clear),
								.rdclk(RGB565_PCLK),
								.rdreq(RGB565_DE),
								.q(RGB565_D_prev),
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
		if(line_buffer_clear)
			wrpix_cnt <= 0;
		else if(DDR_READ_DATA_VALID)
			wrpix_cnt <= wrpix_cnt + 1;
	// 生成DDR读取信号
	assign		DDR_READ_CLK = RGB565_PCLK;
	assign		DDR_READ_ADDR = ((({32'D0, ({32'D0, MON_V_rd})*((`CAM_H_WIDTH))+(({32'D0, MON_H_rd}-0))})&32'H1F_FFFF) | {5'D0, MON_Frame&6'H3F, 21'H00_0000}) + 32'H0800_0000;
	assign		DDR_READ_REQ = 	MON_PIXEL_rdreq;
	// 结束！
endmodule