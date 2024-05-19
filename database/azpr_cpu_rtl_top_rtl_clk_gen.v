// This program was cloned from: https://github.com/zhangly/azpr_cpu
// License: MIT License

/*
 -- ============================================================================
 -- FILE NAME	: clk_gen.v
 -- DESCRIPTION : 时钟生成模块
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

/********** 模块 **********/
module clk_gen (
	/********** 时钟与复位 **********/
	input wire	clk_ref,   // 基本时钟
	input wire	reset_sw,  // 全局复位
	/********** 生成时钟 **********/
	output wire clk,	   // 时钟
	output wire clk_,	   // 反相时钟
	/********** 芯片复位 **********/
	output wire chip_reset // 芯片复位
);

	/********** 内部信号 **********/
	wire		locked;	   // 锁定信号
	wire		dcm_reset; // dcm 复位

	/********** 产生复位 **********/
	// DCM复位
	assign dcm_reset  = (reset_sw == `RESET_ENABLE) ? `ENABLE : `DISABLE;
	// 芯片复位
	assign chip_reset = ((reset_sw == `RESET_ENABLE) || (locked == `DISABLE)) ?
							`RESET_ENABLE : `RESET_DISABLE;

	/********** Xilinx DCM (Digitl Clock Manager) -> altera pll**********/
	/* x_s3e_dcm x_s3e_dcm (
		.CLKIN_IN		 (clk_ref),	  // 基本时钟
		.RST_IN			 (dcm_reset), // DCM复位
		.CLK0_OUT		 (clk),		  // 时钟
		.CLK180_OUT		 (clk_),	  // 反相时钟
		.LOCKED_OUT		 (locked)	  // 锁定
   );
	*/
	
	altera_dcm x_s3e_dcm (
		.inclk0		 (clk_ref),	  // 基本时钟
		.areset			 (dcm_reset), // DCM复位
		.c0		 (clk),		  // 时钟
		.c1		 (clk_),	  // 反相时钟
		.locked		 (locked)	  // 锁定
   );
	

endmodule
