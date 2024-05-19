// This program was cloned from: https://github.com/zhangly/azpr_cpu
// License: MIT License

/*
 -- ============================================================================
 -- FILE NAME	: if_stage.v
 -- DESCRIPTION : IFステージ
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  2011/06/27  suito		 新規作成
 -- ============================================================================
*/

/********** 共通ヘッダファイル **********/
`include "nettype.h"
`include "global_config.h"
`include "stddef.h"

/********** 個別ヘッダファイル **********/
`include "cpu.h"

/********** モジュール **********/
module if_stage (
	/********** クロック & リセット **********/
	input  wire				   clk,			// クロック
	input  wire				   reset,		// 非同期リセット
	/********** SPMインタフェース **********/
	input  wire [`WordDataBus] spm_rd_data, // 読み出しデータ
	output wire [`WordAddrBus] spm_addr,	// アドレス
	output wire				   spm_as_,		// アドレスストローブ
	output wire				   spm_rw,		// 読み／書き
	output wire [`WordDataBus] spm_wr_data, // 書き込みデータ
	/********** バスインタフェース **********/
	input  wire [`WordDataBus] bus_rd_data, // 読み出しデータ
	input  wire				   bus_rdy_,	// レディ
	input  wire				   bus_grnt_,	// バスグラント
	output wire				   bus_req_,	// バスリクエスト
	output wire [`WordAddrBus] bus_addr,	// アドレス
	output wire				   bus_as_,		// アドレスストローブ
	output wire				   bus_rw,		// 読み／書き
	output wire [`WordDataBus] bus_wr_data, // 書き込みデータ
	/********** パイプライン制御信号 **********/
	input  wire				   stall,		// ストール
	input  wire				   flush,		// フラッシュ
	input  wire [`WordAddrBus] new_pc,		// 新しいプログラムカウンタ
	input  wire				   br_taken,	// 分岐の成立
	input  wire [`WordAddrBus] br_addr,		// 分岐先アドレス
	output wire				   busy,		// ビジー信号
	/********** IF/IDパイプラインレジスタ **********/
	output wire [`WordAddrBus] if_pc,		// プログラムカウンタ
	output wire [`WordDataBus] if_insn,		// 命令
	output wire				   if_en		// パイプラインデータの有効
);

	/********** 内部接続信号 **********/
	wire [`WordDataBus]		   insn;		// フェッチした命令

	/********** バスインタフェース **********/
	bus_if bus_if (
		/********** クロック & リセット **********/
		.clk		 (clk),					// クロック
		.reset		 (reset),				// 非同期リセット
		/********** パイプライン制御信号 **********/
		.stall		 (stall),				// ストール
		.flush		 (flush),				// フラッシュ信号
		.busy		 (busy),				// ビジー信号
		/********** CPUインタフェース **********/
		.addr		 (if_pc),				// アドレス
		.as_		 (`ENABLE_),			// アドレス有効
		.rw			 (`READ),				// 読み／書き
		.wr_data	 (`WORD_DATA_W'h0),		// 書き込みデータ
		.rd_data	 (insn),				// 読み出しデータ
		/********** スクラッチパッドメモリインタフェース **********/
		.spm_rd_data (spm_rd_data),			// 読み出しデータ
		.spm_addr	 (spm_addr),			// アドレス
		.spm_as_	 (spm_as_),				// アドレスストローブ
		.spm_rw		 (spm_rw),				// 読み／書き
		.spm_wr_data (spm_wr_data),			// 書き込みデータ
		/********** バスインタフェース **********/
		.bus_rd_data (bus_rd_data),			// 読み出しデータ
		.bus_rdy_	 (bus_rdy_),			// レディ
		.bus_grnt_	 (bus_grnt_),			// バスグラント
		.bus_req_	 (bus_req_),			// バスリクエスト
		.bus_addr	 (bus_addr),			// アドレス
		.bus_as_	 (bus_as_),				// アドレスストローブ
		.bus_rw		 (bus_rw),				// 読み／書き
		.bus_wr_data (bus_wr_data)			// 書き込みデータ
	);
   
	/********** IFステージパイプラインレジスタ **********/
	if_reg if_reg (
		/********** クロック & リセット **********/
		.clk		 (clk),					// クロック
		.reset		 (reset),				// 非同期リセット
		/********** フェッチデータ **********/
		.insn		 (insn),				// フェッチした命令
		/********** パイプライン制御信号 **********/
		.stall		 (stall),				// ストール
		.flush		 (flush),				// フラッシュ
		.new_pc		 (new_pc),				// 新しいプログラムカウンタ
		.br_taken	 (br_taken),			// 分岐の成立
		.br_addr	 (br_addr),				// 分岐先アドレス
		/********** IF/IDパイプラインレジスタ **********/
		.if_pc		 (if_pc),				// プログラムカウンタ
		.if_insn	 (if_insn),				// 命令
		.if_en		 (if_en)				// パイプラインデータの有効
	);

endmodule
