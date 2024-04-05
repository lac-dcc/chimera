/*
 -- ============================================================================
 -- FILE NAME	: mem_stage.v
 -- DESCRIPTION : MEMステージ
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
`include "isa.h"
`include "cpu.h"

/********** モジュール **********/
module mem_stage (
	/********** クロック & リセット **********/
	input  wire				   clk,			   // クロック
	input  wire				   reset,		   // 非同期リセット
	/********** パイプライン制御信号 **********/
	input  wire				   stall,		   // ストール
	input  wire				   flush,		   // フラッシュ
	output wire				   busy,		   // ビジー信号
	/********** フォワーディング **********/
	output wire [`WordDataBus] fwd_data,	   // フォワーディングデータ
	/********** SPMインタフェース **********/
	input  wire [`WordDataBus] spm_rd_data,	   // 読み出しデータ
	output wire [`WordAddrBus] spm_addr,	   // アドレス
	output wire				   spm_as_,		   // アドレスストローブ
	output wire				   spm_rw,		   // 読み／書き
	output wire [`WordDataBus] spm_wr_data,	   // 書き込みデータ
	/********** バスインタフェース **********/
	input  wire [`WordDataBus] bus_rd_data,	   // 読み出しデータ
	input  wire				   bus_rdy_,	   // レディ
	input  wire				   bus_grnt_,	   // バスグラント
	output wire				   bus_req_,	   // バスリクエスト
	output wire [`WordAddrBus] bus_addr,	   // アドレス
	output wire				   bus_as_,		   // アドレスストローブ
	output wire				   bus_rw,		   // 読み／書き
	output wire [`WordDataBus] bus_wr_data,	   // 書き込みデータ
	/********** EX/MEMパイプラインレジスタ **********/
	input  wire [`WordAddrBus] ex_pc,		   // プログラムカウンタ
	input  wire				   ex_en,		   // パイプラインデータの有効
	input  wire				   ex_br_flag,	   // 分岐フラグ
	input  wire [`MemOpBus]	   ex_mem_op,	   // メモリオペレーション
	input  wire [`WordDataBus] ex_mem_wr_data, // メモリ書き込みデータ
	input  wire [`CtrlOpBus]   ex_ctrl_op,	   // 制御レジスタオペレーション
	input  wire [`RegAddrBus]  ex_dst_addr,	   // 汎用レジスタ書き込みアドレス
	input  wire				   ex_gpr_we_,	   // 汎用レジスタ書き込み有効
	input  wire [`IsaExpBus]   ex_exp_code,	   // 例外コード
	input  wire [`WordDataBus] ex_out,		   // 処理結果
	/********** MEM/WBパイプラインレジスタ **********/
	output wire [`WordAddrBus] mem_pc,		   // プログランカウンタ
	output wire				   mem_en,		   // パイプラインデータの有効
	output wire				   mem_br_flag,	   // 分岐フラグ
	output wire [`CtrlOpBus]   mem_ctrl_op,	   // 制御レジスタオペレーション
	output wire [`RegAddrBus]  mem_dst_addr,   // 汎用レジスタ書き込みアドレス
	output wire				   mem_gpr_we_,	   // 汎用レジスタ書き込み有効
	output wire [`IsaExpBus]   mem_exp_code,   // 例外コード
	output wire [`WordDataBus] mem_out		   // 処理結果
);

	/********** 内部信号 **********/
	wire [`WordDataBus]		   rd_data;		   // 読み出しデータ
	wire [`WordAddrBus]		   addr;		   // アドレス
	wire					   as_;			   // アドレス有効
	wire					   rw;			   // 読み／書き
	wire [`WordDataBus]		   wr_data;		   // 書き込みデータ
	wire [`WordDataBus]		   out;			   // メモリアクセス結果
	wire					   miss_align;	   // ミスアライン

	/********** 結果のフォワーディング **********/
	assign fwd_data	 = out;

	/********** メモリアクセス制御ユニット **********/
	mem_ctrl mem_ctrl (
		/********** EX/MEMパイプラインレジスタ **********/
		.ex_en			(ex_en),			   // パイプラインデータの有効
		.ex_mem_op		(ex_mem_op),		   // メモリオペレーション
		.ex_mem_wr_data (ex_mem_wr_data),	   // メモリ書き込みデータ
		.ex_out			(ex_out),			   // 処理結果
		/********** メモリアクセスインタフェース **********/
		.rd_data		(rd_data),			   // 読み出しデータ
		.addr			(addr),				   // アドレス
		.as_			(as_),				   // アドレス有効
		.rw				(rw),				   // 読み／書き
		.wr_data		(wr_data),			   // 書き込みデータ
		/********** メモリアクセス結果 **********/
		.out			(out),				   // メモリアクセス結果
		.miss_align		(miss_align)		   // ミスアライン
	);

	/********** バスインタフェース **********/
	bus_if bus_if (
		/********** クロック & リセット **********/
		.clk		 (clk),					   // クロック
		.reset		 (reset),				   // 非同期リセット
		/********** パイプライン制御信号 **********/
		.stall		 (stall),				   // ストール
		.flush		 (flush),				   // フラッシュ信号
		.busy		 (busy),				   // ビジー信号
		/********** CPUインタフェース **********/
		.addr		 (addr),				   // アドレス
		.as_		 (as_),					   // アドレス有効
		.rw			 (rw),					   // 読み／書き
		.wr_data	 (wr_data),				   // 書き込みデータ
		.rd_data	 (rd_data),				   // 読み出しデータ
		/********** スクラッチパッドメモリインタフェース **********/
		.spm_rd_data (spm_rd_data),			   // 読み出しデータ
		.spm_addr	 (spm_addr),			   // アドレス
		.spm_as_	 (spm_as_),				   // アドレスストローブ
		.spm_rw		 (spm_rw),				   // 読み／書き
		.spm_wr_data (spm_wr_data),			   // 書き込みデータ
		/********** バスインタフェース **********/
		.bus_rd_data (bus_rd_data),			   // 読み出しデータ
		.bus_rdy_	 (bus_rdy_),			   // レディ
		.bus_grnt_	 (bus_grnt_),			   // バスグラント
		.bus_req_	 (bus_req_),			   // バスリクエスト
		.bus_addr	 (bus_addr),			   // アドレス
		.bus_as_	 (bus_as_),				   // アドレスストローブ
		.bus_rw		 (bus_rw),				   // 読み／書き
		.bus_wr_data (bus_wr_data)			   // 書き込みデータ
	);

	/********** MEMステージパイプラインレジスタ **********/
	mem_reg mem_reg (
		/********** クロック & リセット **********/
		.clk		  (clk),				   // クロック
		.reset		  (reset),				   // 非同期リセット
		/********** メモリアクセス結果 **********/
		.out		  (out),				   // 結果
		.miss_align	  (miss_align),			   // ミスアライン
		/********** パイプライン制御信号 **********/
		.stall		  (stall),				   // ストール
		.flush		  (flush),				   // フラッシュ
		/********** EX/MEMパイプラインレジスタ **********/
		.ex_pc		  (ex_pc),				   // プログランカウンタ
		.ex_en		  (ex_en),				   // パイプラインデータの有効
		.ex_br_flag	  (ex_br_flag),			   // 分岐フラグ
		.ex_ctrl_op	  (ex_ctrl_op),			   // 制御レジスタオペレーション
		.ex_dst_addr  (ex_dst_addr),		   // 汎用レジスタ書き込みアドレス
		.ex_gpr_we_	  (ex_gpr_we_),			   // 汎用レジスタ書き込み有効
		.ex_exp_code  (ex_exp_code),		   // 例外コード
		/********** MEM/WBパイプラインレジスタ **********/
		.mem_pc		  (mem_pc),				   // プログランカウンタ
		.mem_en		  (mem_en),				   // パイプラインデータの有効
		.mem_br_flag  (mem_br_flag),		   // 分岐フラグ
		.mem_ctrl_op  (mem_ctrl_op),		   // 制御レジスタオペレーション
		.mem_dst_addr (mem_dst_addr),		   // 汎用レジスタ書き込みアドレス
		.mem_gpr_we_  (mem_gpr_we_),		   // 汎用レジスタ書き込み有効
		.mem_exp_code (mem_exp_code),		   // 例外コード
		.mem_out	  (mem_out)				   // 処理結果
	);

endmodule
