// This program was cloned from: https://github.com/zhangly/azpr_cpu
// License: MIT License

/*
 -- ============================================================================
 -- FILE NAME	: x_s3e_sprom.v
 -- DESCRIPTION : Xilinx Spartan-3E Single Port ROM 疑似モデル
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  2011/06/27  suito		 新規作成
 -- ============================================================================
*/

/********** 共通ヘッダファイル **********/
`include "nettype.h"
`include "stddef.h"
`include "global_config.h"

/********** 個別ヘッダファイル **********/
`include "rom.h"

/********** モジュール **********/
module x_s3e_sprom (
	input wire				  clka,	 // クロック
	input wire [`RomAddrBus]  addra, // アドレス
	output reg [`WordDataBus] douta	 // 読み出しデータ
);

	/********** メモリ **********/
	reg [`WordDataBus] mem [0:`ROM_DEPTH-1];

	/********** 読み出しアクセス **********/
	always @(posedge clka) begin
		douta <= #1 mem[addra];
	end

endmodule
