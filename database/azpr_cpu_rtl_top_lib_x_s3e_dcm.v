// This program was cloned from: https://github.com/zhangly/azpr_cpu
// License: MIT License

/*
 -- ============================================================================
 -- FILE NAME	: x_s3e_dcm.v
 -- DESCRIPTION : Xilinx Spartan-3E DCM 疑似モデル
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  2011/06/27  suito		 新規作成
 -- ============================================================================
*/

/********** 共通ヘッダファイル **********/
`include "nettype.h"

/********** モジュール **********/
module x_s3e_dcm (
	input  wire CLKIN_IN,		 // 既定クロック
	input  wire RST_IN,			 // リセット
	output wire CLK0_OUT,		 // クロック（φ0）
	output wire CLK180_OUT,		 // クロック（φ180）
	output wire LOCKED_OUT		 // ロック
);

	/********** クロック出力 **********/
	assign CLK0_OUT	  = CLKIN_IN;
	assign CLK180_OUT = ~CLKIN_IN;
	assign LOCKED_OUT = ~RST_IN;
   
endmodule
