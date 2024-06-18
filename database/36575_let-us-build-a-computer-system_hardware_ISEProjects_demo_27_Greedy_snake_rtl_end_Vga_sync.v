// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

module end_Vga_sync		//vga同步模块
(
	input CLK_40M,
	input RSTn,
	output end_Hsync_sig,		//列同步信号
	output end_Vsync_sig,		//行同步信号
	output end_Ready_sig,		//有效区域信号（这个例程是800*600）
	output [10:0] Row_add,	//11位的行地址（这里本来定义成10位就够用了，但是为了匹配列地址，方便差错跟处理，所以定义成11位）
	output [10:0] Column_add	//11位的列地址
);
	//**************************************************************
	reg [10:0] Count_hsync;		//列同步计数寄存器，1056个像素就清零（时钟已经经过倍频，现在是一个时钟周期计算一个像素）
	always @ (posedge CLK_40M or negedge RSTn)
	begin
		if(!RSTn)
			Count_hsync <= 11'd 0;
		else 
			 if(Count_hsync == 11'd 800)
				Count_hsync <= 11'd 0;
			 else	
				Count_hsync <= Count_hsync + 1'd 1;	
	end
	
	//**************************************************************
	reg [10:0] Count_vsync;		//行同步计数寄存器，628个像素就清零（时钟已经经过倍频，现在是一个时钟周期计算一个像素）
	always @ (posedge CLK_40M or negedge RSTn)
	begin
		if(!RSTn)
			Count_vsync <= 11'd 0;
		else 
			if(Count_vsync == 11'd 525)
				Count_vsync <= 11'd 0;
			else	if(Count_hsync == 11'd 800) 		//每当列像素达到1056（证明已经扫过一行了），行计数器加一~
						Count_vsync <= Count_vsync + 1'd 1;					
	end
	
	//**************************************************************
	reg r_Ready_sig;		//有效区域信号寄存器，800*600区域的标志位~
	always @ (posedge CLK_40M or negedge RSTn)
	begin
		if(!RSTn)
			r_Ready_sig <= 1'd 0;
		else	if((Count_hsync > (11'd 144 + 11'd200)) && (Count_hsync < (11'd 784 - 11'd184))		//这里是对区域进行判断：当216<列<1016,27<行<627时（即800*600），标志位为1，否则为0.
					 && (Count_vsync > (11'd 35 + 11'd93)) && (Count_vsync < (11'd 515 - 11'd133)))
					r_Ready_sig <= 1'd 1;
				else
					r_Ready_sig <= 1'd 0;		
	end
	
	assign end_Ready_sig = r_Ready_sig;		//连续赋值给end_Ready_sig
	
	//**************************************************************
	reg [10:0] rRow_add;		//行地址操作寄存器
	reg [10:0] rColumn_add;		//列地址操作寄存器
	always @ (posedge CLK_40M or negedge RSTn)
	begin
		if(!RSTn)
			begin
				rRow_add <= 11'd 0;
				rColumn_add <= 11'd 0;
			end
		else	
			begin
				rColumn_add <= (r_Ready_sig)?		Count_hsync - 11'd 144   :	 11'd 0;		//当r_Ready_sig为1，将Count_vsync - 217的值赋给rColumn_add，否则当r_Ready_sig为0，将0赋给rColumn_add
				rRow_add <= (r_Ready_sig)?	 Count_vsync - 11'd 27	 :	 11'd 0; 		//当r_Ready_sig为1，将Count_hsync -  28的值赋给rRow_add；当r_Ready_sig为0，将0赋给rRow_add。
			end
	end
	
	assign Row_add = rRow_add;
	assign Column_add = rColumn_add;
	
	//**************************************************************
	reg r_Hsync_sig;		//列信号
	reg r_Vsync_sig;		//行信号
	always @ ( posedge CLK_40M or negedge RSTn )
	begin
		if(!RSTn)
			begin
				r_Hsync_sig <= 1'd 0;
				r_Vsync_sig <= 1'd 0;
			end
		else
			begin
				r_Vsync_sig <= (Count_vsync <= 11'd 2)?		1'd 0	:	1'd 1;		//由时序图我们知道，当Count_vsync在o段（4个像素）时，电平为低，否则为高。
				r_Hsync_sig <= (Count_hsync <= 11'd 96)? 	1'd 0 	:	1'd 1; 		//由时序图我们知道，当Count_hsync第a段（128个像素）时，电平为低，否则为高。
			end
	end
	
	assign end_Hsync_sig = r_Hsync_sig;
	assign end_Vsync_sig = r_Vsync_sig;
	
endmodule 