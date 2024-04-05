/*
 -- ============================================================================
 -- FILE NAME	: rom.v
 -- DESCRIPTION : Read Only Memory
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
module rom (
	/********** クロック & リセット **********/
	input  wire				   clk,		// クロック
	input  wire				   reset,	// 非同期リセット
	/********** バスインタフェース **********/
	input  wire				   cs_,		// チップセレクト
	input  wire				   as_,		// アドレスストローブ
	input  wire [`RomAddrBus]  addr,	// アドレス
	output wire [`WordDataBus] rd_data, // 読み出しデータ
	output reg				   rdy_		// レディ
);

	/********** Xilinx FPGA Block RAM : -> altera sprom **********/
	altera_sprom x_s3e_sprom (
		.clock  (clk),					// クロック
		.address (addr),					// アドレス
		.q (rd_data)				// 読み出しデータ
	);

	/********** レディの生成 **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* 非同期リセット */
			rdy_ <= #1 `DISABLE_;
		end else begin
			/* レディの生成 */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_)) begin
				rdy_ <= #1 `ENABLE_;
			end else begin
				rdy_ <= #1 `DISABLE_;
			end
		end
	end

endmodule
