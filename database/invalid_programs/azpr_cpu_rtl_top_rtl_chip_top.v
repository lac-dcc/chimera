/*
 -- ============================================================================
 -- FILE NAME	: chip_top.v
 -- DESCRIPTION : 顶层模块
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  2011/06/27  suito		 创建
 -- 1.0.1	  2014/06/27  zhangly    
 -- ============================================================================
*/
  
/********** 通用头文件 **********/
`include "nettype.h"
`include "stddef.h"
`include "global_config.h"

/********** 项目头文件 **********/
`include "gpio.h"

/********** 模块 **********/
module chip_top (
	/********** 时钟与复位 **********/
	input wire				   clk_ref,		  // 基本时钟
	input wire				   reset_sw		  // 全局复位，缺省定义为负逻辑,见global_config.h
	/********** UART **********/
`ifdef IMPLEMENT_UART // UART实现
	, input wire			   uart_rx		  // UART接收信号
	, output wire			   uart_tx		  // UART发送信号
`endif
	/********** 通用I/ O端口 **********/
`ifdef IMPLEMENT_GPIO // GPIO实现
`ifdef GPIO_IN_CH	 //输入接口实现
	, input wire [`GPIO_IN_CH-1:0]	 gpio_in  // 输入接口
`endif
`ifdef GPIO_OUT_CH	 // 输出接口实现
	, output wire [`GPIO_OUT_CH-1:0] gpio_out // 输出接口
`endif
`ifdef GPIO_IO_CH	 // 输入输出接口实现
	, inout wire [`GPIO_IO_CH-1:0]	 gpio_io  // 输入输出接口
`endif
`endif
);

	/********** 时钟与复位 **********/
	wire					   clk;			  	// 时钟
	wire					   clk_;		  		// 反相时钟
	wire					   chip_reset;	  	// 复位
   
	/********** 时钟模块 **********/
	clk_gen clk_gen (
		/**********  时钟与复位 **********/
		.clk_ref	  (clk_ref),			  	// 基本时钟
		.reset_sw	  (reset_sw),			// 全局复位
		/********** 生成时钟 **********/
		.clk		  (clk),				  		// 时钟
		.clk_		  (clk_),				  	// 反向时钟
		/********** 复位 **********/
		.chip_reset	  (chip_reset)			// 复位
	);

	/********** 芯片 **********/
	chip chip (
		/********** 时钟与复位 **********/
		.clk	  (clk),					  // 时钟
		.clk_	  (clk_),					  // 反向时钟
		.reset	  (chip_reset)				  // 复位
		/********** UART **********/
`ifdef IMPLEMENT_UART
		, .uart_rx	(uart_rx)				  // UART接收信号
		, .uart_tx	(uart_tx)				  // UART发送信号
`endif
		/********** GPIO **********/
`ifdef IMPLEMENT_GPIO
`ifdef GPIO_IN_CH  // 输入接口实现
		, .gpio_in (gpio_in)				  // 输入接口
`endif
`ifdef GPIO_OUT_CH // 输出接口实现
		, .gpio_out (gpio_out)				  // 输出接口
`endif
`ifdef GPIO_IO_CH  // 输入输出接口实现
		, .gpio_io	(gpio_io)				  // 输入输出接口
`endif
`endif
	);

endmodule
