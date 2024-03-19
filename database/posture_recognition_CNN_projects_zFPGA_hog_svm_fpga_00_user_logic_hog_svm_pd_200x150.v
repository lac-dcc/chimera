module hog_svm_pd_200x150
#(
	parameter				CellSize1 = 10,
	parameter				CellSize2 = 10,
	parameter				BlockSize1 = 2,
	parameter				BlockSize2 = 2,
	parameter				WindowSize1 = 80,
	parameter				WindowSize2 = 140
)
(
	input	wire			sys_clk, sys_rst_n,
	// RGB565
	input	wire				RGB565_PCLK,
	input	wire				RGB565_HSYNC,		// 换行		// 需要由MT9D111打上一拍
	input	wire				RGB565_VSYNC,		// 场同步	// 需要由MT9D111打上一拍
	input	wire	[15:0]		RGB565_D,
	input	wire				RGB565_DE,			// 数据有效
	output	reg					svm_judge_res,		// svm判决
	output	reg	signed	[31:0]	svm_judge_res_grade,		// svm判决
	output	reg		[10:0]		svm_judge_HCnt,		// SVM判决的位置
	output	reg		[10:0]		svm_judge_VCnt		// SVM判决的位置
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
	// 然后是要把数据代入到RGB/YUV变换模块
	wire			[15:0]	YUV422_D_curr;
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
							
	/////////////////////
	// 生成Ixyt / Ixytm1
	wire	[8:0]		Ixyt = YUV422_D_curr[7:0];
	// 然后需要计算Ix/Iy/It
	reg		[8:0]		Ix;
	reg		[8:0]		Iy;
	reg		[8:0]		It;
	reg					IxIyItEn;	// 表示上述几个数据有效
	reg		[8:0]		Ixm1yt;
	reg		[8:0]		Ixm2yt;
	wire	[8:0]		Ixym1t;
	wire	[8:0]		Ixym2t;
	always @(posedge RGB565_PCLK)
	begin
		if(!YUV422_HSYNC)
		begin
			Ixm1yt <= 0;
			Ixm2yt <= 0;
		end
		else if(YUV422_DE)
		begin
			Ixm1yt <= Ixyt;
			Ixm2yt <= Ixm1yt;
		end
		//
		Ix <= Ixyt - Ixm2yt;
		Iy <= Ixyt - Ixym2t;
		IxIyItEn <= YUV422_DE;
	end
	
	// 需要缓冲一行，用来计算Iy
	line_buf_200pts_2lines	line_buf_200pts_2lines_inst_p(
								.clken(YUV422_DE),
								.clock(RGB565_PCLK),
								.aclr(!sys_rst_n),
								.shiftin(Ixyt),
								.shiftout(),
								.taps0x(Ixym1t),
								.taps1x(Ixym2t)
							);
							
	//////////////////
	// 然后需要计算 Ix/Iy的模和方向
	wire	signed	[31:0]	magnitude_xy;
	wire	signed	[31:0]	orientation_xy;
	wire					mag_orient_xy_en = DE[16];
	int_cordic_core			int_cordic_core_mdl(
								.sys_clk(RGB565_PCLK),
								.sys_rst_n(sys_rst_n),
								.src_y({{32{Ix[8]}}, Ix, 8'H00}),
								.src_x({{32{Iy[8]}}, Iy, 8'H00}),
								.rho(magnitude_xy),
								.theta(orientation_xy)
							);
							
	//
	reg		signed	[8:0]	Ix_shift	[0:15];
	reg		signed	[8:0]	Iy_shift	[0:15];
	integer					n;
	always @(posedge RGB565_PCLK)
	begin
		for(n=1; n<16; n=n+1)
		begin
			Ix_shift[n] <= Ix_shift[n-1];
			Iy_shift[n] <= Iy_shift[n-1];
		end
		
		Ix_shift[0] <= Ix;
		Iy_shift[0] <= Iy;
	end
	
	// Ix_shift[9] / Iy_shift[9] ==> theta
	reg		signed	[17:0] 	_Ix_32;
	reg		signed	[17:0] 	_Iy_32;
	reg		signed	[17:0]	_Iy_tan00;
	reg		signed	[17:0]	_Iy_tan20;
	reg		signed	[17:0]	_Iy_tan40;
	reg		signed	[17:0]	_Iy_tan60;
	reg		signed	[17:0]	_Iy_tan80;
	parameter				posTan20Deg = 23;	// *64
	parameter				posTan40Deg = 54;	// *64
	parameter				posTan60Deg = 111;	// *64
	parameter				posTan80Deg = 363;	// *64
	always @(posedge RGB565_PCLK)
	begin
		_Ix_32 <= Ix_shift[8]*64;
		_Iy_32 <= Iy_shift[8]*64;
		_Iy_tan00 <= 0;
		_Iy_tan20 <= Iy_shift[8]*posTan20Deg;
		_Iy_tan40 <= Iy_shift[8]*posTan40Deg;
		_Iy_tan60 <= Iy_shift[8]*posTan60Deg;
		_Iy_tan80 <= Iy_shift[8]*posTan80Deg;
	end
	// for modelsim debug
	wire	signed	[8:0]	__Ix = Ix_shift[9];
	wire	signed	[8:0]	__Iy = Iy_shift[9];
	// 
	reg		signed	[31:0]	Mxy;
	reg				[8:0]	Bxy;	// [0]==>0~20 \deg	[1]==>20~40\deg
	reg				[8:0]	Bxy2;	// [0]==>0~20 \deg	[1]==>20~40\deg
	parameter				posDegUnit = 238609294;
	parameter				negDegUnit = -238609294;
	wire					MBxyEn = DE[17];
	always @(posedge RGB565_PCLK)
	begin
		Mxy <= magnitude_xy>>>8;
		Bxy2[0] <= (magnitude_xy>0) && ((orientation_xy<posDegUnit*1 && orientation_xy>=posDegUnit*0) || (orientation_xy<negDegUnit*8 && orientation_xy>=negDegUnit*9));
		Bxy2[1] <= (magnitude_xy>0) && ((orientation_xy<posDegUnit*2 && orientation_xy>=posDegUnit*1) || (orientation_xy<negDegUnit*7 && orientation_xy>=negDegUnit*8));
		Bxy2[2] <= (magnitude_xy>0) && ((orientation_xy<posDegUnit*3 && orientation_xy>=posDegUnit*2) || (orientation_xy<negDegUnit*6 && orientation_xy>=negDegUnit*7));
		Bxy2[3] <= (magnitude_xy>0) && ((orientation_xy<posDegUnit*4 && orientation_xy>=posDegUnit*3) || (orientation_xy<negDegUnit*5 && orientation_xy>=negDegUnit*6));
		Bxy2[4] <= (magnitude_xy>0) && ((orientation_xy<posDegUnit*5 && orientation_xy>=posDegUnit*4) || (orientation_xy<negDegUnit*4 && orientation_xy>=negDegUnit*5));
		Bxy2[5] <= (magnitude_xy>0) && ((orientation_xy<posDegUnit*6 && orientation_xy>=posDegUnit*5) || (orientation_xy<negDegUnit*3 && orientation_xy>=negDegUnit*4));
		Bxy2[6] <= (magnitude_xy>0) && ((orientation_xy<posDegUnit*7 && orientation_xy>=posDegUnit*6) || (orientation_xy<negDegUnit*2 && orientation_xy>=negDegUnit*3));
		Bxy2[7] <= (magnitude_xy>0) && ((orientation_xy<posDegUnit*8 && orientation_xy>=posDegUnit*7) || (orientation_xy<negDegUnit*1 && orientation_xy>=negDegUnit*2));
		Bxy2[8] <= (magnitude_xy>0) && ((orientation_xy<posDegUnit*9 && orientation_xy>=posDegUnit*8) || (orientation_xy<negDegUnit*0 && orientation_xy>=negDegUnit*1));
		// new orientation judge
		Bxy[0] <= (magnitude_xy>0) && ((_Ix_32>=0 && _Iy_32>=0 && _Ix_32>=_Iy_tan00 && _Ix_32<_Iy_tan20) || (_Ix_32<0 && _Iy_32<0 && _Ix_32<=_Iy_tan00 && _Ix_32>_Iy_tan20));//(orientation_xy<posDegUnit*1 && orientation_xy>=posDegUnit*0) || (orientation_xy<negDegUnit*8 && orientation_xy>=negDegUnit*9);
		Bxy[1] <= (magnitude_xy>0) && ((_Ix_32>=0 && _Iy_32>=0 && _Ix_32>=_Iy_tan20 && _Ix_32<_Iy_tan40) || (_Ix_32<0 && _Iy_32<0 && _Ix_32<=_Iy_tan20 && _Ix_32>_Iy_tan40));//(orientation_xy<posDegUnit*2 && orientation_xy>=posDegUnit*1) || (orientation_xy<negDegUnit*7 && orientation_xy>=negDegUnit*8);
		Bxy[2] <= (magnitude_xy>0) && ((_Ix_32>=0 && _Iy_32>=0 && _Ix_32>=_Iy_tan40 && _Ix_32<_Iy_tan60) || (_Ix_32<0 && _Iy_32<0 && _Ix_32<=_Iy_tan40 && _Ix_32>_Iy_tan60));//(orientation_xy<posDegUnit*3 && orientation_xy>=posDegUnit*2) || (orientation_xy<negDegUnit*6 && orientation_xy>=negDegUnit*7);
		Bxy[3] <= (magnitude_xy>0) && ((_Ix_32>=0 && _Iy_32>=0 && _Ix_32>=_Iy_tan60 && _Ix_32<_Iy_tan80) || (_Ix_32<0 && _Iy_32<0 && _Ix_32<=_Iy_tan60 && _Ix_32>_Iy_tan80));//(orientation_xy<posDegUnit*4 && orientation_xy>=posDegUnit*3) || (orientation_xy<negDegUnit*5 && orientation_xy>=negDegUnit*6);
		Bxy[4] <= (magnitude_xy>0) && ((_Ix_32>=0 && _Iy_32>=0 && _Ix_32>=_Iy_tan80) || (_Ix_32<0 && _Iy_32<0 && _Ix_32<=_Iy_tan80) || (_Ix_32>=0 && _Iy_32<0 && _Ix_32>=(0-_Iy_tan80)) || (_Ix_32<0 && _Iy_32>=0 && _Ix_32<=(0-_Iy_tan80)));//(orientation_xy<posDegUnit*5 && orientation_xy>=posDegUnit*4) || (orientation_xy<negDegUnit*4 && orientation_xy>=negDegUnit*5);
		Bxy[5] <= (magnitude_xy>0) && ((_Ix_32>=0 && _Iy_32<0 && _Ix_32>=(0-_Iy_tan60) && _Ix_32<(0-_Iy_tan80)) || (_Ix_32<0 && _Iy_32>=0 && _Ix_32<=(0-_Iy_tan60) && _Ix_32>(0-_Iy_tan80)));//(orientation_xy<posDegUnit*6 && orientation_xy>=posDegUnit*5) || (orientation_xy<negDegUnit*3 && orientation_xy>=negDegUnit*4);
		Bxy[6] <= (magnitude_xy>0) && ((_Ix_32>=0 && _Iy_32<0 && _Ix_32>=(0-_Iy_tan40) && _Ix_32<(0-_Iy_tan60)) || (_Ix_32<0 && _Iy_32>=0 && _Ix_32<=(0-_Iy_tan40) && _Ix_32>(0-_Iy_tan60)));//(orientation_xy<posDegUnit*7 && orientation_xy>=posDegUnit*6) || (orientation_xy<negDegUnit*2 && orientation_xy>=negDegUnit*3);
		Bxy[7] <= (magnitude_xy>0) && ((_Ix_32>=0 && _Iy_32<0 && _Ix_32>=(0-_Iy_tan20) && _Ix_32<(0-_Iy_tan40)) || (_Ix_32<0 && _Iy_32>=0 && _Ix_32<=(0-_Iy_tan20) && _Ix_32>(0-_Iy_tan40)));//(orientation_xy<posDegUnit*8 && orientation_xy>=posDegUnit*7) || (orientation_xy<negDegUnit*1 && orientation_xy>=negDegUnit*2);
		Bxy[8] <= (magnitude_xy>0) && ((_Ix_32>=0 && _Iy_32<0 && _Ix_32>=(0-_Iy_tan00) && _Ix_32<(0-_Iy_tan20)) || (_Ix_32<0 && _Iy_32>=0 && _Ix_32<=(0-_Iy_tan00) && _Ix_32>(0-_Iy_tan20)));//(orientation_xy<posDegUnit*9 && orientation_xy>=posDegUnit*8) || (orientation_xy<negDegUnit*0 && orientation_xy>=negDegUnit*1);
	end
	
	
	// for modelsim debug
	wire			[4:0]	Bxy_DEC = Bxy[8]*9 + Bxy[7]*8 + Bxy[6]*7 + Bxy[5]*6 + Bxy[4]*5 + Bxy[3]*4 + Bxy[2]*3 + Bxy[1]*2 + Bxy[0]*1;
	
	// 10x10进行统计
	reg			[5:0]	PixCnt;
	always @(posedge RGB565_PCLK)
		if(!HSYNC[17])
			PixCnt <= 0;
		else if(DE[17])
		begin
			if(PixCnt==9)
				PixCnt <= 0;
			else
				PixCnt <= PixCnt + 1;
		end
	// 
	integer				p;
	reg			[15:0]	Mxy_C10	[0:8];	// [0]==>0~20\deg
	always @(posedge RGB565_PCLK)
		if(!HSYNC[17])
		begin
			for(p=0; p<9; p=p+1)
				Mxy_C10[p] <= 0;
		end
		else if(DE[17])
		begin
			for(p=0; p<9; p=p+1)
				Mxy_C10[p] <= (PixCnt==0)? (Bxy[p]? Mxy : 0) : (Bxy[p]? (Mxy + Mxy_C10[p]) : Mxy_C10[p]);
		end
	// 用来modelsim进行debug用
	wire		[15:0]	Mxy_C10_0 = Mxy_C10[0];	// 0~20\deg
	wire		[15:0]	Mxy_C10_1 = Mxy_C10[1];	// 20~40\deg
	wire		[15:0]	Mxy_C10_2 = Mxy_C10[2];	// 40~60\deg
	wire		[15:0]	Mxy_C10_3 = Mxy_C10[3];	// 60~80\deg
	wire		[15:0]	Mxy_C10_4 = Mxy_C10[4];	// 80~100\deg
	wire		[15:0]	Mxy_C10_5 = Mxy_C10[5];	// 100~120\deg
	wire		[15:0]	Mxy_C10_6 = Mxy_C10[6];	// 120~140\deg
	wire		[15:0]	Mxy_C10_7 = Mxy_C10[7];	// 140~160\deg
	wire		[15:0]	Mxy_C10_8 = Mxy_C10[8];	// 160~180\deg
	
	wire				Mxy_C10_valid = (DE[18] && (PixCnt==0));
	
	// 然后要通过800/10 = 80的taps
	wire		[15:0]	Mxy_Cell_0	[0:8];
	wire		[15:0]	Mxy_Cell_1	[0:8];
	wire		[15:0]	Mxy_Cell_2	[0:8];
	wire		[15:0]	Mxy_Cell_3	[0:8];
	wire		[15:0]	Mxy_Cell_4	[0:8];
	wire		[15:0]	Mxy_Cell_5	[0:8];
	wire		[15:0]	Mxy_Cell_6	[0:8];
	wire		[15:0]	Mxy_Cell_7	[0:8];
	wire		[15:0]	Mxy_Cell_8	[0:8];
	line_buf_20pts_9lines	line_buf_20pts_9lines_inst_0(
								.clken(Mxy_C10_valid),
								.clock(RGB565_PCLK),
								.shiftin(Mxy_C10[0]),
								.taps0x(Mxy_Cell_0[0]),
								.taps1x(Mxy_Cell_0[1]),
								.taps2x(Mxy_Cell_0[2]),
								.taps3x(Mxy_Cell_0[3]),
								.taps4x(Mxy_Cell_0[4]),
								.taps5x(Mxy_Cell_0[5]),
								.taps6x(Mxy_Cell_0[6]),
								.taps7x(Mxy_Cell_0[7]),
								.taps8x(Mxy_Cell_0[8])	// 最早的
							);
	line_buf_20pts_9lines	line_buf_20pts_9lines_inst_1(
								.clken(Mxy_C10_valid),
								.clock(RGB565_PCLK),
								.shiftin(Mxy_C10[1]),
								.taps0x(Mxy_Cell_1[0]),
								.taps1x(Mxy_Cell_1[1]),
								.taps2x(Mxy_Cell_1[2]),
								.taps3x(Mxy_Cell_1[3]),
								.taps4x(Mxy_Cell_1[4]),
								.taps5x(Mxy_Cell_1[5]),
								.taps6x(Mxy_Cell_1[6]),
								.taps7x(Mxy_Cell_1[7]),
								.taps8x(Mxy_Cell_1[8])	// 最早的
							);
	line_buf_20pts_9lines	line_buf_20pts_9lines_inst_2(
								.clken(Mxy_C10_valid),
								.clock(RGB565_PCLK),
								.shiftin(Mxy_C10[2]),
								.taps0x(Mxy_Cell_2[0]),
								.taps1x(Mxy_Cell_2[1]),
								.taps2x(Mxy_Cell_2[2]),
								.taps3x(Mxy_Cell_2[3]),
								.taps4x(Mxy_Cell_2[4]),
								.taps5x(Mxy_Cell_2[5]),
								.taps6x(Mxy_Cell_2[6]),
								.taps7x(Mxy_Cell_2[7]),
								.taps8x(Mxy_Cell_2[8])	// 最早的
							);
	line_buf_20pts_9lines	line_buf_20pts_9lines_inst_3(
								.clken(Mxy_C10_valid),
								.clock(RGB565_PCLK),
								.shiftin(Mxy_C10[3]),
								.taps0x(Mxy_Cell_3[0]),
								.taps1x(Mxy_Cell_3[1]),
								.taps2x(Mxy_Cell_3[2]),
								.taps3x(Mxy_Cell_3[3]),
								.taps4x(Mxy_Cell_3[4]),
								.taps5x(Mxy_Cell_3[5]),
								.taps6x(Mxy_Cell_3[6]),
								.taps7x(Mxy_Cell_3[7]),
								.taps8x(Mxy_Cell_3[8])	// 最早的
							);
	line_buf_20pts_9lines	line_buf_20pts_9lines_inst_4(
								.clken(Mxy_C10_valid),
								.clock(RGB565_PCLK),
								.shiftin(Mxy_C10[4]),
								.taps0x(Mxy_Cell_4[0]),
								.taps1x(Mxy_Cell_4[1]),
								.taps2x(Mxy_Cell_4[2]),
								.taps3x(Mxy_Cell_4[3]),
								.taps4x(Mxy_Cell_4[4]),
								.taps5x(Mxy_Cell_4[5]),
								.taps6x(Mxy_Cell_4[6]),
								.taps7x(Mxy_Cell_4[7]),
								.taps8x(Mxy_Cell_4[8])	// 最早的
							);
	line_buf_20pts_9lines	line_buf_20pts_9lines_inst_5(
								.clken(Mxy_C10_valid),
								.clock(RGB565_PCLK),
								.shiftin(Mxy_C10[5]),
								.taps0x(Mxy_Cell_5[0]),
								.taps1x(Mxy_Cell_5[1]),
								.taps2x(Mxy_Cell_5[2]),
								.taps3x(Mxy_Cell_5[3]),
								.taps4x(Mxy_Cell_5[4]),
								.taps5x(Mxy_Cell_5[5]),
								.taps6x(Mxy_Cell_5[6]),
								.taps7x(Mxy_Cell_5[7]),
								.taps8x(Mxy_Cell_5[8])	// 最早的
							);
	line_buf_20pts_9lines	line_buf_20pts_9lines_inst_6(
								.clken(Mxy_C10_valid),
								.clock(RGB565_PCLK),
								.shiftin(Mxy_C10[6]),
								.taps0x(Mxy_Cell_6[0]),
								.taps1x(Mxy_Cell_6[1]),
								.taps2x(Mxy_Cell_6[2]),
								.taps3x(Mxy_Cell_6[3]),
								.taps4x(Mxy_Cell_6[4]),
								.taps5x(Mxy_Cell_6[5]),
								.taps6x(Mxy_Cell_6[6]),
								.taps7x(Mxy_Cell_6[7]),
								.taps8x(Mxy_Cell_6[8])	// 最早的
							);
	line_buf_20pts_9lines	line_buf_20pts_9lines_inst_7(
								.clken(Mxy_C10_valid),
								.clock(RGB565_PCLK),
								.shiftin(Mxy_C10[7]),
								.taps0x(Mxy_Cell_7[0]),
								.taps1x(Mxy_Cell_7[1]),
								.taps2x(Mxy_Cell_7[2]),
								.taps3x(Mxy_Cell_7[3]),
								.taps4x(Mxy_Cell_7[4]),
								.taps5x(Mxy_Cell_7[5]),
								.taps6x(Mxy_Cell_7[6]),
								.taps7x(Mxy_Cell_7[7]),
								.taps8x(Mxy_Cell_7[8])	// 最早的
							);
	line_buf_20pts_9lines	line_buf_20pts_9lines_inst_8(
								.clken(Mxy_C10_valid),
								.clock(RGB565_PCLK),
								.shiftin(Mxy_C10[8]),
								.taps0x(Mxy_Cell_8[0]),
								.taps1x(Mxy_Cell_8[1]),
								.taps2x(Mxy_Cell_8[2]),
								.taps3x(Mxy_Cell_8[3]),
								.taps4x(Mxy_Cell_8[4]),
								.taps5x(Mxy_Cell_8[5]),
								.taps6x(Mxy_Cell_8[6]),
								.taps7x(Mxy_Cell_8[7]),
								.taps8x(Mxy_Cell_8[8])	// 最早的
							);
	//  然后要统计现在到第几行了
	reg		[5:0]		LineCnt;
	always @(posedge RGB565_PCLK)
		if(!VSYNC[18])
			LineCnt <= 0;
		else if(HSYNC[19:18]==2'B10)	// HSYNC下降沿
		begin
			if(LineCnt>=9)
				LineCnt <= 0;
			else
				LineCnt <= LineCnt + 1;
		end
		
	// 最后求和
	integer				m;
	reg		[19:0]		Mxy_Stat_Cell	[0:8];	// 9D-orientation	// [0]==>0~20\deg
	reg					Mxy_Stat_Cell_En;
	always @(posedge RGB565_PCLK)
		if(LineCnt==9 && Mxy_C10_valid)
		begin
			Mxy_Stat_Cell[0] <= Mxy_Cell_0[0] + Mxy_Cell_0[1] + Mxy_Cell_0[2] + Mxy_Cell_0[3] + Mxy_Cell_0[4]
								+ Mxy_Cell_0[5] + Mxy_Cell_0[6] + Mxy_Cell_0[7] + Mxy_Cell_0[8] + Mxy_C10[0];
			Mxy_Stat_Cell[1] <= Mxy_Cell_1[0] + Mxy_Cell_1[1] + Mxy_Cell_1[2] + Mxy_Cell_1[3] + Mxy_Cell_1[4]
								+ Mxy_Cell_1[5] + Mxy_Cell_1[6] + Mxy_Cell_1[7] + Mxy_Cell_1[8] + Mxy_C10[1];
			Mxy_Stat_Cell[2] <= Mxy_Cell_2[0] + Mxy_Cell_2[1] + Mxy_Cell_2[2] + Mxy_Cell_2[3] + Mxy_Cell_2[4]
								+ Mxy_Cell_2[5] + Mxy_Cell_2[6] + Mxy_Cell_2[7] + Mxy_Cell_2[8] + Mxy_C10[2];
			Mxy_Stat_Cell[3] <= Mxy_Cell_3[0] + Mxy_Cell_3[1] + Mxy_Cell_3[2] + Mxy_Cell_3[3] + Mxy_Cell_3[4]
								+ Mxy_Cell_3[5] + Mxy_Cell_3[6] + Mxy_Cell_3[7] + Mxy_Cell_3[8] + Mxy_C10[3];
			Mxy_Stat_Cell[4] <= Mxy_Cell_4[0] + Mxy_Cell_4[1] + Mxy_Cell_4[2] + Mxy_Cell_4[3] + Mxy_Cell_4[4]
								+ Mxy_Cell_4[5] + Mxy_Cell_4[6] + Mxy_Cell_4[7] + Mxy_Cell_4[8] + Mxy_C10[4];
			Mxy_Stat_Cell[5] <= Mxy_Cell_5[0] + Mxy_Cell_5[1] + Mxy_Cell_5[2] + Mxy_Cell_5[3] + Mxy_Cell_5[4]
								+ Mxy_Cell_5[5] + Mxy_Cell_5[6] + Mxy_Cell_5[7] + Mxy_Cell_5[8] + Mxy_C10[5];
			Mxy_Stat_Cell[6] <= Mxy_Cell_6[0] + Mxy_Cell_6[1] + Mxy_Cell_6[2] + Mxy_Cell_6[3] + Mxy_Cell_6[4]
								+ Mxy_Cell_6[5] + Mxy_Cell_6[6] + Mxy_Cell_6[7] + Mxy_Cell_6[8] + Mxy_C10[6];
			Mxy_Stat_Cell[7] <= Mxy_Cell_7[0] + Mxy_Cell_7[1] + Mxy_Cell_7[2] + Mxy_Cell_7[3] + Mxy_Cell_7[4]
								+ Mxy_Cell_7[5] + Mxy_Cell_7[6] + Mxy_Cell_7[7] + Mxy_Cell_7[8] + Mxy_C10[7];
			Mxy_Stat_Cell[8] <= Mxy_Cell_8[0] + Mxy_Cell_8[1] + Mxy_Cell_8[2] + Mxy_Cell_8[3] + Mxy_Cell_8[4]
								+ Mxy_Cell_8[5] + Mxy_Cell_8[6] + Mxy_Cell_8[7] + Mxy_Cell_8[8] + Mxy_C10[8];
			Mxy_Stat_Cell_En <= 1;
		end
		else
			Mxy_Stat_Cell_En <= 0;
			
	// 最后要进行归一化
	reg		[8:0]		Mxy_Stat_Norm;	// 这里使用HSG论文的参考方案，对平均值进行比较
	reg					Mxy_Stat_Norm_En;	// 这里使用HSG论文的参考方案，对平均值进行比较
	wire	[19:0]		Mxy_Stat_Mean = (Mxy_Stat_Cell[0][19:3] + Mxy_Stat_Cell[1][19:3] + Mxy_Stat_Cell[2][19:3]
										+ Mxy_Stat_Cell[3][19:3] + Mxy_Stat_Cell[4][19:3] + Mxy_Stat_Cell[5][19:3]
										+ Mxy_Stat_Cell[6][19:3] + Mxy_Stat_Cell[7][19:3] + Mxy_Stat_Cell[8][19:3]
											);
	always @(posedge RGB565_PCLK)
	begin
		Mxy_Stat_Norm_En <= Mxy_Stat_Cell_En;		//  = DE[20] <wire>
		if(Mxy_Stat_Cell_En)
		begin
			Mxy_Stat_Norm[0] <= (Mxy_Stat_Cell[0]>Mxy_Stat_Mean);	// 0~20\deg
			Mxy_Stat_Norm[1] <= (Mxy_Stat_Cell[1]>Mxy_Stat_Mean);
			Mxy_Stat_Norm[2] <= (Mxy_Stat_Cell[2]>Mxy_Stat_Mean);
			Mxy_Stat_Norm[3] <= (Mxy_Stat_Cell[3]>Mxy_Stat_Mean);
			Mxy_Stat_Norm[4] <= (Mxy_Stat_Cell[4]>Mxy_Stat_Mean);
			Mxy_Stat_Norm[5] <= (Mxy_Stat_Cell[5]>Mxy_Stat_Mean);
			Mxy_Stat_Norm[6] <= (Mxy_Stat_Cell[6]>Mxy_Stat_Mean);
			Mxy_Stat_Norm[7] <= (Mxy_Stat_Cell[7]>Mxy_Stat_Mean);
			Mxy_Stat_Norm[8] <= (Mxy_Stat_Cell[8]>Mxy_Stat_Mean);	// 160~180\deg
		end
	end
	
	// 然后需要生成2x2的block
	wire	[8:0]			Mxy_Stat_Norm_Prev	[0:0];
	line_buf_20pts_1lines	line_buf_20pts_1lines_block_inst(
								.aclr(!VSYNC[20]),
								.clken(Mxy_Stat_Norm_En),
								.clock(RGB565_PCLK),
								.shiftin(Mxy_Stat_Norm),
								.taps(Mxy_Stat_Norm_Prev[0])
							);
	// 
	reg		[17:0]			Mxy_Stat_Norm_Block	[0:1];
	reg						Mxy_Stat_Norm_Block_En;
	always @(posedge RGB565_PCLK)
		if(!VSYNC[20])
		begin
			Mxy_Stat_Norm_Block[0] <= 0;
			Mxy_Stat_Norm_Block[1] <= 0;
			Mxy_Stat_Norm_Block_En <= 0;
		end
		else if(Mxy_Stat_Norm_En)
		begin
			Mxy_Stat_Norm_Block[0] <= {Mxy_Stat_Norm_Block[0][8:0], Mxy_Stat_Norm};
			Mxy_Stat_Norm_Block[1] <= {Mxy_Stat_Norm_Block[1][8:0], Mxy_Stat_Norm_Prev[0]};
			Mxy_Stat_Norm_Block_En <= 1;
		end
		else
			Mxy_Stat_Norm_Block_En <= 0;
		
	// for modelsim debug
	wire	[17:0]			Mxy_Stat_Norm_Block_0 = Mxy_Stat_Norm_Block[0];
	wire	[17:0]			Mxy_Stat_Norm_Block_1 = Mxy_Stat_Norm_Block[1];
	// 汇总
	wire	[35:0]			Mxy_Stat_Norm_Block_Feature = {Mxy_Stat_Norm_Block[1], Mxy_Stat_Norm_Block[0]};
	wire					Mxy_Stat_Norm_Block_Feature_En = Mxy_Stat_Norm_Block_En;	// 这样就生成一个cell的feature了
	//
	// 最后，需要统计[80x140 / 10x10 => 7x13]的window里面的hog feature
	wire	[35:0]			Mxy_Stat_Norm_Block_Feature_Prev	[0:11];
	line_buf_20pts_13lines	line_buf_20pts_13lines_window_inst(
								.aclr(!VSYNC[21]),
								.clken(Mxy_Stat_Norm_Block_Feature_En),
								.clock(RGB565_PCLK),
								.shiftin(Mxy_Stat_Norm_Block_Feature),
								.shiftout(),
								.taps0x(Mxy_Stat_Norm_Block_Feature_Prev[0]),
								.taps1x(Mxy_Stat_Norm_Block_Feature_Prev[1]),
								.taps2x(Mxy_Stat_Norm_Block_Feature_Prev[2]),
								.taps3x(Mxy_Stat_Norm_Block_Feature_Prev[3]),
								.taps4x(Mxy_Stat_Norm_Block_Feature_Prev[4]),
								.taps5x(Mxy_Stat_Norm_Block_Feature_Prev[5]),
								.taps6x(Mxy_Stat_Norm_Block_Feature_Prev[6]),
								.taps7x(Mxy_Stat_Norm_Block_Feature_Prev[7]),
								.taps8x(Mxy_Stat_Norm_Block_Feature_Prev[8]),
								.taps9x(Mxy_Stat_Norm_Block_Feature_Prev[9]),
								.taps10x(Mxy_Stat_Norm_Block_Feature_Prev[10]),
								.taps11x(Mxy_Stat_Norm_Block_Feature_Prev[11]),
								.taps12x()
							);
	
	// 构造80x140 ==> 7x13 的窗口
	reg		[251:0]		HSG_Feature_In_Window_Shifter	[0:12];
	reg					HSG_Feature_In_Window_Shifter_En;
	integer				hsg;
	always @(posedge RGB565_PCLK)
		if(!VSYNC[21])
		begin
			for(hsg=0; hsg<13; hsg=hsg+1)
				HSG_Feature_In_Window_Shifter[hsg] <= 0;
			HSG_Feature_In_Window_Shifter_En <= 0;
		end
		else if(Mxy_Stat_Norm_Block_Feature_En)
		begin
			HSG_Feature_In_Window_Shifter_En <= 1;
			HSG_Feature_In_Window_Shifter[0] <= {HSG_Feature_In_Window_Shifter[0][215:0], Mxy_Stat_Norm_Block_Feature};
			for(hsg=0; hsg<12; hsg=hsg+1)
				HSG_Feature_In_Window_Shifter[hsg+1] <= {HSG_Feature_In_Window_Shifter[hsg+1][215:0], Mxy_Stat_Norm_Block_Feature_Prev[hsg]};
		end
		else
			HSG_Feature_In_Window_Shifter_En <= 0;
	
	// 
	reg		[10:0]		HSG_Feature_HCnt;
	reg		[10:0]		HSG_Feature_VCnt;
	reg		[3275:0]	HSG_Feature_In_Window	/* synthesis noprune */;
	reg					HSG_Feature_In_Window_En	/* synthesis noprune */;
	// 要定位这个window现在在原始图像的哪个位置
	always @(posedge RGB565_PCLK)
		if(!VSYNC[21])
		begin	
			HSG_Feature_VCnt <= 1;
			HSG_Feature_HCnt <= 0;
		end
		else 
		begin
			if(HSYNC[22:21] == 2'B10)	// 下降沿
			begin
				HSG_Feature_VCnt <= HSG_Feature_VCnt + 1;
				HSG_Feature_HCnt <= 0;
			end
			else if(DE[21])
				HSG_Feature_HCnt <= HSG_Feature_HCnt + 1;
		end
	// 聚合整个window里面的HSG-feature
	always @(posedge RGB565_PCLK)
		if(!VSYNC[22])
		begin
			HSG_Feature_In_Window_En <= 0;
			HSG_Feature_In_Window <= 0;
		end
		else if(HSG_Feature_In_Window_Shifter_En)
		begin
			HSG_Feature_In_Window_En <= 1;
			HSG_Feature_In_Window <= {	HSG_Feature_In_Window_Shifter[12], 
										HSG_Feature_In_Window_Shifter[11],
										HSG_Feature_In_Window_Shifter[10], 
										HSG_Feature_In_Window_Shifter[9],
										HSG_Feature_In_Window_Shifter[8], 
										HSG_Feature_In_Window_Shifter[7],
										HSG_Feature_In_Window_Shifter[6], 
										HSG_Feature_In_Window_Shifter[5],
										HSG_Feature_In_Window_Shifter[4], 
										HSG_Feature_In_Window_Shifter[3],
										HSG_Feature_In_Window_Shifter[2], 
										HSG_Feature_In_Window_Shifter[1],
										HSG_Feature_In_Window_Shifter[0]
										};
		end
		else
			HSG_Feature_In_Window_En <= 0;
	

	// 统计 HSG_Feature_In_Window_En 出现的数量，用来debug
	reg		[31:0]			window_num;
	always @(posedge RGB565_PCLK)
		if(!VSYNC[23])
			window_num <= 0;
		else if(HSG_Feature_In_Window_En)
			window_num <= window_num + 1;
			
	// 最后，是SVM，因为是HSG，所以只要简单的进行累加即可
	reg		signed	[31:0]	svm_judge_sum;
	reg				[9:0]	svm_parameter_addr;
	wire			[575:0]	svm_parameter_data;
	// 例化一个SVM参数ROM表
	svm_model_rom_ip		svm_model_rom_ip_inst(
								.clock(RGB565_PCLK),
								.address(svm_parameter_addr),
								.q(svm_parameter_data)
							);
	
	// 因为SVM判决计算要比HSG特征生成慢，所以需要用SCFIFO来缓存
	wire 		[1648:0]	svm_vut_scfifo_q_half;	// 11-D ==> HCnt , 11-D ==> VCnt , 3276-D == > HSG feature
	reg 		[3297:0]	svm_vut_scfifo_q;	// 11-D ==> HCnt , 11-D ==> VCnt , 3276-D == > HSG feature
	// 为了尽可能地缩小面积，这里需要将svm_vut_scfifo_q拆成两半，前后两部分进行输入
	reg			[3297:0]	svm_vut_scfifo_data;// = {HSG_Feature_HCnt, HSG_Feature_VCnt, HSG_Feature_In_Window};
	reg			[3:0]		HSG_Feature_In_Window_En_shifter;
	always @(posedge RGB565_PCLK)
	begin
		HSG_Feature_In_Window_En_shifter <= {HSG_Feature_In_Window_En_shifter[2:0], HSG_Feature_In_Window_En};
		if(HSG_Feature_In_Window_En)
			svm_vut_scfifo_data <= {HSG_Feature_HCnt, HSG_Feature_VCnt, HSG_Feature_In_Window};
		else
			svm_vut_scfifo_data <= {svm_vut_scfifo_data[1648:0], 1649'D0};
	end
	// 下面是SCFIFO的接口，主要是根据SCFIFO是不是空的，来进行判别，要不要进行SVM分类识别？
	reg						svm_vut_scfifo_rdreq;
	wire					svm_vut_scfifo_rdempty;
	wire		[7:0]		svm_vut_scfifo_rdusedw;
	svm_vut_scfifo_1649x128	svm_vut_scfifo_inst(
								.aclr(!sys_rst_n),
								.sclr(!sys_rst_n),
								.clock(RGB565_PCLK),
								.data(svm_vut_scfifo_data[3297:1649]),
								.wrreq(HSG_Feature_In_Window_En_shifter[0]|HSG_Feature_In_Window_En_shifter[1]),
								.rdreq(svm_vut_scfifo_rdreq),
								.q(svm_vut_scfifo_q_half),
								.empty(svm_vut_scfifo_rdempty),
								.usedw(svm_vut_scfifo_rdusedw)
							);
	// 然后要统计window里面的SVM判别器（依据）
	// 这里要用状态机进行控制！一旦发现有检查的HSG特征向量，就要启动判决
	reg			[3:0]		cstate;	
	reg			[10:0]		delay;	// 延时单元
	always @(posedge RGB565_PCLK)
		if(!sys_rst_n)
		begin
			cstate <= 0;
			svm_vut_scfifo_rdreq <= 0;
		end
		else
		begin
			case(cstate)
			// idle状态，检查到HSG的FIFO非空就要执行
				0: begin
					if(!svm_vut_scfifo_rdempty)
					begin
						cstate <= 3;	// 连续读取两次SCFIFO阶段【跳转】
						svm_vut_scfifo_rdreq <= 1;	// 同时读取FIFO里面缓存的VUT（vector under test, 待检测向量）
						svm_parameter_addr <= 0;	// 读取第一个SVM参数
					end
				end
			// 连续读取两次SCFIFO
				3: begin
					cstate <= 4;	// 跳到读取下半段的阶段
					svm_vut_scfifo_rdreq <= 1;	// 同时读取FIFO里面缓存的VUT（vector under test, 待检测向量）
				end
			// 再来读取一次
				4: begin
					cstate <= 5;	// 跳到SVM计算阶段
					svm_vut_scfifo_rdreq <= 0;	// 关断FIFO的读取使能信号
					svm_vut_scfifo_q <= {svm_vut_scfifo_q[1648:0], svm_vut_scfifo_q_half};
					svm_parameter_addr <= 0;	// 读取第一个SVM参数
				end
			// 形成实际的数值
				5: begin
					cstate <= 1;	// 跳到SVM计算阶段
					svm_vut_scfifo_rdreq <= 0;	// 关断FIFO的读取使能信号
					svm_vut_scfifo_q <= {svm_vut_scfifo_q[1648:0], svm_vut_scfifo_q_half};
					svm_parameter_addr <= 0;	// 读取第一个SVM参数
				end
				
			// 启动SVM检测
				1: begin
					svm_vut_scfifo_q[3275:0] <= {svm_vut_scfifo_q[3239:0], 36'H0_0000_0000};	// 高位移出
					svm_vut_scfifo_rdreq <= 0;	// 关断FIFO的读取使能信号
					if(svm_parameter_addr>=91)	// (80/10-1)x(140/10-1) = 7x13 = 91
					begin
						cstate <= 2;
						delay <= 0;
					end
					else
						svm_parameter_addr <= svm_parameter_addr + 1;						
				end
			// 延时一会儿，要给SVM的偏置累加留有足够的时间
				2: begin
					if(delay>=3)
					begin
						cstate <= 0;
						delay <= 0;
					end
					else 
						delay <= delay + 1;
				end
					
			// default
				default: begin
					cstate <= 0;
					svm_vut_scfifo_rdreq <= 0;
				end
						
			endcase
		end
	// 将SCFIFO的rdreq打一拍
	reg			[127:0]		svm_vut_scfifo_rdreq_shifter;
	reg			[3297:0]	svm_vut_scfifo_q_reg;
	always @(posedge RGB565_PCLK)
		if(!sys_rst_n)
			svm_vut_scfifo_rdreq_shifter <= 0;
		else 
			svm_vut_scfifo_rdreq_shifter <= {svm_vut_scfifo_rdreq_shifter[126:0], (cstate==5)};
	//
	// 通过移位寄存来构造HSG的段选数据
	reg			[10:0]		svm_vut_scfifo_HCnt;
	reg			[10:0]		svm_vut_scfifo_VCnt;
	// 生成HSG的段选信号
	//wire		[35:0]		svm_vut_scfifo_HSG_seg = svm_vut_scfifo_HSG[3275:3240];
	reg			[35:0]		svm_vut_scfifo_HSG_seg;// = svm_vut_scfifo_HSG[3275:3240];
	reg			[35:0]		svm_vut_scfifo_HSG_seg_x;// = svm_vut_scfifo_HSG[3275:3240];
	always @(posedge RGB565_PCLK)
	begin
		if(svm_vut_scfifo_rdreq_shifter[0])
		begin
			svm_vut_scfifo_HCnt <= svm_vut_scfifo_q[3297:3287];
			svm_vut_scfifo_VCnt <= svm_vut_scfifo_q[3286:3276];
		end
		svm_vut_scfifo_HSG_seg_x <= svm_vut_scfifo_q[3275:3240];
		svm_vut_scfifo_HSG_seg <= svm_vut_scfifo_HSG_seg_x;
	end	
	
	reg	signed	[15:0]		svm_parameter	[0:35];
	/*
	for n=1:36
		fprintf(1, 'svm_parameter[%d] <= svm_vut_scfifo_HSG_seg[%d]? svm_parameter_data[%d:%d] : 16''H000;\n', n-1, n-1, 16*n-1, 16*n-16);
	end
	*/
	// 分段选通
	integer		q;
	always @(posedge RGB565_PCLK)
	begin
		svm_parameter[0] <= svm_vut_scfifo_HSG_seg[0]? svm_parameter_data[15:0] : 16'H000;
		svm_parameter[1] <= svm_vut_scfifo_HSG_seg[1]? svm_parameter_data[31:16] : 16'H000;
		svm_parameter[2] <= svm_vut_scfifo_HSG_seg[2]? svm_parameter_data[47:32] : 16'H000;
		svm_parameter[3] <= svm_vut_scfifo_HSG_seg[3]? svm_parameter_data[63:48] : 16'H000;
		svm_parameter[4] <= svm_vut_scfifo_HSG_seg[4]? svm_parameter_data[79:64] : 16'H000;
		svm_parameter[5] <= svm_vut_scfifo_HSG_seg[5]? svm_parameter_data[95:80] : 16'H000;
		svm_parameter[6] <= svm_vut_scfifo_HSG_seg[6]? svm_parameter_data[111:96] : 16'H000;
		svm_parameter[7] <= svm_vut_scfifo_HSG_seg[7]? svm_parameter_data[127:112] : 16'H000;
		svm_parameter[8] <= svm_vut_scfifo_HSG_seg[8]? svm_parameter_data[143:128] : 16'H000;
		svm_parameter[9] <= svm_vut_scfifo_HSG_seg[9]? svm_parameter_data[159:144] : 16'H000;
		svm_parameter[10] <= svm_vut_scfifo_HSG_seg[10]? svm_parameter_data[175:160] : 16'H000;
		svm_parameter[11] <= svm_vut_scfifo_HSG_seg[11]? svm_parameter_data[191:176] : 16'H000;
		svm_parameter[12] <= svm_vut_scfifo_HSG_seg[12]? svm_parameter_data[207:192] : 16'H000;
		svm_parameter[13] <= svm_vut_scfifo_HSG_seg[13]? svm_parameter_data[223:208] : 16'H000;
		svm_parameter[14] <= svm_vut_scfifo_HSG_seg[14]? svm_parameter_data[239:224] : 16'H000;
		svm_parameter[15] <= svm_vut_scfifo_HSG_seg[15]? svm_parameter_data[255:240] : 16'H000;
		svm_parameter[16] <= svm_vut_scfifo_HSG_seg[16]? svm_parameter_data[271:256] : 16'H000;
		svm_parameter[17] <= svm_vut_scfifo_HSG_seg[17]? svm_parameter_data[287:272] : 16'H000;
		svm_parameter[18] <= svm_vut_scfifo_HSG_seg[18]? svm_parameter_data[303:288] : 16'H000;
		svm_parameter[19] <= svm_vut_scfifo_HSG_seg[19]? svm_parameter_data[319:304] : 16'H000;
		svm_parameter[20] <= svm_vut_scfifo_HSG_seg[20]? svm_parameter_data[335:320] : 16'H000;
		svm_parameter[21] <= svm_vut_scfifo_HSG_seg[21]? svm_parameter_data[351:336] : 16'H000;
		svm_parameter[22] <= svm_vut_scfifo_HSG_seg[22]? svm_parameter_data[367:352] : 16'H000;
		svm_parameter[23] <= svm_vut_scfifo_HSG_seg[23]? svm_parameter_data[383:368] : 16'H000;
		svm_parameter[24] <= svm_vut_scfifo_HSG_seg[24]? svm_parameter_data[399:384] : 16'H000;
		svm_parameter[25] <= svm_vut_scfifo_HSG_seg[25]? svm_parameter_data[415:400] : 16'H000;
		svm_parameter[26] <= svm_vut_scfifo_HSG_seg[26]? svm_parameter_data[431:416] : 16'H000;
		svm_parameter[27] <= svm_vut_scfifo_HSG_seg[27]? svm_parameter_data[447:432] : 16'H000;
		svm_parameter[28] <= svm_vut_scfifo_HSG_seg[28]? svm_parameter_data[463:448] : 16'H000;
		svm_parameter[29] <= svm_vut_scfifo_HSG_seg[29]? svm_parameter_data[479:464] : 16'H000;
		svm_parameter[30] <= svm_vut_scfifo_HSG_seg[30]? svm_parameter_data[495:480] : 16'H000;
		svm_parameter[31] <= svm_vut_scfifo_HSG_seg[31]? svm_parameter_data[511:496] : 16'H000;
		svm_parameter[32] <= svm_vut_scfifo_HSG_seg[32]? svm_parameter_data[527:512] : 16'H000;
		svm_parameter[33] <= svm_vut_scfifo_HSG_seg[33]? svm_parameter_data[543:528] : 16'H000;
		svm_parameter[34] <= svm_vut_scfifo_HSG_seg[34]? svm_parameter_data[559:544] : 16'H000;
		svm_parameter[35] <= svm_vut_scfifo_HSG_seg[35]? svm_parameter_data[575:560] : 16'H000;
	end
	
	// 每9个数累加起来，优化时序
	reg		signed	[31:0]	svm_parameter_part_sum_0;
	reg		signed	[31:0]	svm_parameter_part_sum_1;
	reg		signed	[31:0]	svm_parameter_part_sum_2;
	reg		signed	[31:0]	svm_parameter_part_sum_3;
	always @(posedge RGB565_PCLK)
	begin
		svm_parameter_part_sum_0 <= svm_parameter[0] + svm_parameter[1] + svm_parameter[2] + svm_parameter[3] + svm_parameter[4] + svm_parameter[5] + svm_parameter[6] + svm_parameter[7] + svm_parameter[8];
		svm_parameter_part_sum_1 <= svm_parameter[9] + svm_parameter[10] + svm_parameter[11] + svm_parameter[12] + svm_parameter[13] + svm_parameter[14] + svm_parameter[15] + svm_parameter[16] + svm_parameter[17];
		svm_parameter_part_sum_2 <= svm_parameter[18] + svm_parameter[19] + svm_parameter[20] + svm_parameter[21] + svm_parameter[22] + svm_parameter[23] + svm_parameter[24] + svm_parameter[25] + svm_parameter[26];
		svm_parameter_part_sum_3 <= svm_parameter[27] + svm_parameter[28] + svm_parameter[29] + svm_parameter[30] + svm_parameter[31] + svm_parameter[32] + svm_parameter[33] + svm_parameter[34] + svm_parameter[35];
	end
	
	// 把所有的值加起来
	always @(posedge RGB565_PCLK)
		if(svm_vut_scfifo_rdreq_shifter[3])
			svm_judge_sum <= 0;
		// 首先是SVM中w'*x的MAC运算
		else if(!svm_vut_scfifo_rdreq_shifter[95])
			svm_judge_sum <= svm_judge_sum + svm_parameter_part_sum_0 + svm_parameter_part_sum_1
							+ svm_parameter_part_sum_2 + svm_parameter_part_sum_3;
		// 然后是SVM中的+b偏执运算
		else if(svm_vut_scfifo_rdreq_shifter[95])
			svm_judge_sum <= svm_judge_sum + svm_parameter_data;	
	
	//
	always @(posedge RGB565_PCLK)
		if(svm_vut_scfifo_rdreq_shifter[96])
		begin
			svm_judge_res <= (svm_judge_sum>4 && svm_vut_scfifo_HCnt>=(80-5) && svm_vut_scfifo_VCnt>=(140-5));
			svm_judge_HCnt <= (svm_vut_scfifo_HCnt - 80 + 5) <<< 2;
			svm_judge_VCnt <= (svm_vut_scfifo_VCnt - 140 + 5) <<< 2;
			svm_judge_res_grade <= svm_judge_sum;
		end
		else 
			svm_judge_res <= 0;
	//assign		svm_judge_res = (svm_judge_sum>0);
endmodule