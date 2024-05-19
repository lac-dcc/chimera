// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

/*============================================================================
*
*  LOGIC CORE:          TFT驱动模块		
*  MODULE NAME:         VGA_CTRL()
*  COMPANY:             芯航线电子工作室
*                       http://xiaomeige.taobao.com
*	author:					小梅哥
*	author QQ Group：472607506
*  REVISION HISTORY:  
*
*    Revision 1.0  01/01/2016     Description: Initial Release.
*
*  FUNCTIONAL DESCRIPTION:
===========================================================================*/

module VGA_CTRL (
	Clk40M,		//系统输入时钟40MHZ
	Rst_n,		//复位输入，低电平复位
	data_in,	//待显示数据
	hcount,		//TFT行扫描计数器
	vcount,		//TFT场扫描计数器
	VGA_RGB,	//TFT数据输出
	VGA_HS,		//TFT行同步信号
	VGA_VS,		//TFT场同步信号
	VGA_BLANK,
	VGA_VCLK,
	VGA_DE
	//Error
);
	

`define RED      16'hf800
`define GREEN    16'h07e0
`define BLUE     16'h001f
`define WHITE    16'hffff
`define BLACK    16'h0000
`define YELLOW   16'hffe0
`define CYAN     16'hf81f
`define ROYAL    16'h07ff
`define PINK     16'hfe19

	
	//----------------模块输入端口----------------
	input  Clk40M;			//系统输入时钟40MHZ
	input  Rst_n;
	input  [15:0]data_in;	//待显示数据

	//----------------模块输出端口----------------
	output [11:0]hcount;
	output [11:0]vcount;
	output [15:0]VGA_RGB;	//TFT数据输出
	output VGA_HS;			//TFT行同步信号
	output VGA_VS;			//TFT场同步信号
	output VGA_BLANK;
	output VGA_DE;
	output VGA_VCLK;
	//output reg Error;

	//----------------内部寄存器定义----------------
	reg [15:0] data_buff;		//缓冲
	reg [11:0] hcount_r;		//TFT行扫描计数器
	reg [11:0] vcount_r;		//TFT场扫描计数器
	//----------------内部连线定义----------------
	wire hcount_ov;		//行扫描一行结束时为1
	wire vcount_ov;		//列扫描一行结束时为1
	wire VGA_DE;		//有效显示区标定

	//VGA行、场扫描时序参数表
	parameter	VGA_HS_end = 12'd128,
				hdat_begin = 12'd216,
				hdat_end = 12'd1016,
				hpixel_end = 12'd1056,
				VGA_VS_end = 12'd4,
				vdat_begin = 12'd27,
				vdat_end = 12'd627,
				vline_end = 12'd628;

	assign hcount = VGA_DE ? ( hcount_r - hdat_begin ) : 12'd0;
	assign vcount = VGA_DE ? ( vcount_r - vdat_begin ) : 12'd0;
	
	assign VGA_BLANK = ~VGA_DE;
	assign VGA_VCLK = Clk40M;
	

	//**********************VGA驱动部分**********************
	
	//缓冲
	always @( posedge Clk40M /*or negedge Rst_n*/ ) begin
		if ( ~Rst_n ) begin
			data_buff <= 16'b0;
		end else begin
			data_buff <= data_in;
		end
	end
	
	//行扫描
	always @( posedge Clk40M /*or negedge Rst_n*/ ) begin
		if ( ~Rst_n ) begin
			hcount_r <= 12'd0;
		end else begin
			if ( hcount_r < hpixel_end - 1 ) begin
				hcount_r <= hcount_r + 1'b1;
			end else begin
				hcount_r <= 12'd0;
			end
		end
	end

	assign hcount_ov = ( hcount_r == hpixel_end - 1 );

	//场扫描
	always @( posedge Clk40M or negedge Rst_n ) begin
		if ( ~Rst_n ) begin
			vcount_r <= 12'd0;
		end else begin
			if ( hcount_ov ) begin
				if ( vcount_r < vline_end - 1 ) begin
					vcount_r <= vcount_r + 1'b1;
				end else begin
					vcount_r <= 12'd0;
				end
			end else begin
				vcount_r <= vcount_r;
			end
		end
	end
		
	assign 	vcount_ov = ( vcount_r == vline_end - 1 );

	//数据、同步信号输出
	assign VGA_DE = ( ( hcount_r >= hdat_begin ) && ( hcount_r < hdat_end ) )
					&& ( ( vcount_r >= vdat_begin ) && ( vcount_r < vdat_end ) );
					
	assign VGA_HS = ( hcount_r >= VGA_HS_end ) ? 1'b1 : 1'b0;
	assign VGA_VS = ( vcount_r >= VGA_VS_end ) ? 1'b1 : 1'b0;
	assign VGA_RGB = VGA_DE ? data_buff : 16'b0;



endmodule 
