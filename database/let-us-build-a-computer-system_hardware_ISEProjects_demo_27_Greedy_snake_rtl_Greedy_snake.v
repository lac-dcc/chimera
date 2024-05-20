// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

//开发板各按键所实现的功能： Left左按键(AX309-KEY1)：贪吃蛇向左
//                        Right右按键(AX309-KEY2)：贪吃蛇向右
//                        Up上按键(AX309-KEY3)：贪吃蛇向上
//                        Down下键键(AX309-KEY4)：贪吃蛇向下


module Greedy_snake//贪吃蛇顶层模块
(
	input Clk,//50MHZ的全局时钟
	input Rst_n,//全局复位信号
	
	input Left,//左按键
	input Right,//右按键
	input Up,//上按键
	input Down,//下按键

//	output Hsync_sig,//列同步信号
//	output Vsync_sig,//场同步信号
	
	output VSYNC_Sig_out,
	output HSYNC_Sig_out,
	output [4:0] VGA_red_o,
	output [5:0] VGA_green_o,
	output [4:0] VGA_blue_o,
	output vga_clk,
	output vga_blank,
	output vga_sync,
	
	output [7:0] Smg_duan,//数码管段选
	output [3:0] Smg_we//数码管位选
	
);
/***************************************************************************/
	
	assign VGA_red_o = {5{VGA_red_out}};
	assign VGA_green_o = {6{VGA_green_out}};
	assign VGA_blue_o = {5{VGA_blue_out}};
	 
	wire VGA_red_out;
	wire VGA_green_out;
	wire VGA_blue_out; 
	
	assign vga_clk = ~Clk_25mhz;
	assign vga_blank = VSYNC_Sig_out & HSYNC_Sig_out;
	assign vga_sync = 1'b0;
	wire Clk_50mhz;
	wire Clk_25mhz;	
	
	Snake_pll	U1 //PLL倍频模块
	(
		.CLK_IN1(Clk),
		.CLK_OUT1(Clk_50mhz),
		.CLK_OUT2(Clk_25mhz),
		.RESET(1'b0),
		.LOCKED()		
		
	);
	

/***************************************************************************/
	
	wire Key_left;//左按键
	wire Key_right;//右按键
	wire Key_up;//上按键
	wire Key_down;//下按键
	
	wire [2:0] Game_status;//3种游戏状态，START：001；PLAY：010；END：100；
	
	wire Hit_wall_sig;//撞墙信号
	wire Hit_body_sig;//撞到自己身体的信号
	
	wire Flash_sig;//闪动信号
	wire Restart_sig;//重新开始信号
	
	wire play_VGA_red;
	wire play_VGA_green;
	wire play_VGA_blue;
	
	wire play_HSYNC_sig;
	wire play_VSYNC_sig;	
	
	Game_ctrl_module	 U2//游戏控制模块
	(
		.Clk_50mhz(Clk_50mhz),
		.Rst_n(Rst_n),
		
		.Key_left(Key_left),
		.Key_right(Key_right),
		.Key_up(Key_up),
		.Key_down(Key_down),
	/*	
		.Left(Left),
		.Right(Right),
		.Up(Up),
		.Down(Down),
		*/
		
		.Game_status(Game_status),
		
		.Hit_wall_sig(Hit_wall_sig),
		.Hit_body_sig(Hit_body_sig),
		
		.Flash_sig(Flash_sig)
	//	.Restart_sig(Restart_sig),
//		.Flash_over_sig(Flash_over_sig)
	);
		
/***************************************************************************/
//	wire Flash_over_sig;
	
	
	wire [5:0] Apple_x;//苹果的X坐标
	wire [4:0] Apple_y;//苹果的Y坐标

	wire [5:0] Head_x;//蛇头部的X坐标
	wire [5:0] Head_y;//蛇头部的Y坐标

	wire Body_add_sig;//身体节数增加信号

		Apple_generate_module	 U3//苹果产生模块
	(
		.Clk_50mhz(Clk_50mhz),
		.Rst_n(Rst_n),
		
		.Apple_x(Apple_x),
		.Apple_y(Apple_y),
		
		.Head_x(Head_x),
		.Head_y(Head_y),
		
		.Body_add_sig(Body_add_sig)
	);
	
/***************************************************************************/
	
	wire [1:0] Object;//对象
	
	wire [9:0] Pixel_x;//扫描的像素的X坐标
	wire [9:0] Pixel_y;//扫描的像素的Y坐标
	
	wire [6:0] Body_num;//身体节数的长度，最多是16，这里是可以改的

	Snake_ctrl_module		U4//蛇运动控制模块
	(
		.Clk_50mhz(Clk_50mhz),
		.Rst_n(Rst_n),
		
		.Key_left(Key_left),
		.Key_right(Key_right),
		.Key_up(Key_up),
		.Key_down(Key_down),
		
		.Object(Object),
		
		.Pixel_x(Pixel_x),
		.Pixel_y(Pixel_y),
		
		.Head_x(Head_x),
		.Head_y(Head_y),
		
		.Body_add_sig(Body_add_sig),
		.Game_status(Game_status),
//		.Body_num(Body_num),
		
		.Hit_body_sig(Hit_body_sig),
		.Hit_wall_sig(Hit_wall_sig),
		
		.Flash_sig(Flash_sig)
	);
	
/***************************************************************************/	
	
	Vga_ctrl_module	 U5//VGA控制模块
	(
		.Clk_25mhz(Clk_25mhz),
		.Rst_n(Rst_n),
		
		.Hsync_sig(play_HSYNC_sig),
		.Vsync_sig(play_VSYNC_sig),
		
		.Object(Object),
		
		.play_VGA_red(play_VGA_red),
		.play_VGA_green(play_VGA_green),
		.play_VGA_blue(play_VGA_blue),
		
		.Pixel_x(Pixel_x),
		.Pixel_y(Pixel_y),
		
		.Apple_x(Apple_x),
		.Apple_y(Apple_y)
	);

	
	
/***************************************************************************/

	Key_check_module	 U6//按键检测模块
	(
		.Clk_50mhz(Clk_50mhz),
		.Rst_n(Rst_n),
		
		.Left(Left),
		.Right(Right),
		.Up(Up),
		.Down(Down),
		
		.Key_left(Key_left),
		.Key_right(Key_right),
		.Key_up(Key_up),
		.Key_down(Key_down)		
	);
	
/***************************************************************************/
	
	Smg_display_module	 U7//数码管显示模块
	(
		.Clk_50mhz(Clk_50mhz),
		.Rst_n(Rst_n),	
		
		.Body_add_sig(Body_add_sig),
		.Game_status(Game_status),
		
		.Smg_duan(Smg_duan),
		.Smg_we(Smg_we)
	);
	
	

//	wire start;
//	wire end_sig;
//	wire CLK;
	start_and_end_top		U8
(
	.CLK_40M(Clk_25mhz),
	.RSTn(Rst_n),
	/*
	.start(start),
	.end_sig(end_sig),
	.play(play),
	*/
	.Game_status(Game_status),
//	.Flash_over_sig(Flash_over_sig),
	
	.play_VGA_red(play_VGA_red),
	.play_VGA_green(play_VGA_green),
	.play_VGA_blue(play_VGA_blue),
	.play_HSYNC_sig(play_HSYNC_sig),
	.play_VSYNC_sig(play_VSYNC_sig),
	
	
	.VSYNC_Sig_out(VSYNC_Sig_out),
	.HSYNC_Sig_out(HSYNC_Sig_out),
	.VGA_red_out(VGA_red_out),
	.VGA_green_out(VGA_green_out),
	.VGA_blue_out(VGA_blue_out)
);
	
	
	
	
	
	
endmodule
