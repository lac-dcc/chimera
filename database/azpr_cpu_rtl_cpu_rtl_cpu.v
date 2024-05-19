// This program was cloned from: https://github.com/zhangly/azpr_cpu
// License: MIT License

/*
 -- ============================================================================
 -- FILE NAME	: cpu.v
 -- DESCRIPTION : CPUトップモジュール
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
`include "bus.h"
`include "spm.h"

/********** モジュール **********/
module cpu (
	/********** クロック & リセット **********/
	input  wire					  clk,			   // クロック
	input  wire					  clk_,			   // 反転クロック
	input  wire					  reset,		   // 非同期リセット
	/********** バスインタフェース **********/
	// IF Stage
	input  wire [`WordDataBus]	  if_bus_rd_data,  // 読み出しデータ
	input  wire					  if_bus_rdy_,	   // レディ
	input  wire					  if_bus_grnt_,	   // バスグラント
	output wire					  if_bus_req_,	   // バスリクエスト
	output wire [`WordAddrBus]	  if_bus_addr,	   // アドレス
	output wire					  if_bus_as_,	   // アドレスストローブ
	output wire					  if_bus_rw,	   // 読み／書き
	output wire [`WordDataBus]	  if_bus_wr_data,  // 書き込みデータ
	// MEM Stage
	input  wire [`WordDataBus]	  mem_bus_rd_data, // 読み出しデータ
	input  wire					  mem_bus_rdy_,	   // レディ
	input  wire					  mem_bus_grnt_,   // バスグラント
	output wire					  mem_bus_req_,	   // バスリクエスト
	output wire [`WordAddrBus]	  mem_bus_addr,	   // アドレス
	output wire					  mem_bus_as_,	   // アドレスストローブ
	output wire					  mem_bus_rw,	   // 読み／書き
	output wire [`WordDataBus]	  mem_bus_wr_data, // 書き込みデータ
	/********** 割り込み **********/
	input  wire [`CPU_IRQ_CH-1:0] cpu_irq		   // 割り込み要求
);

	/********** パイプラインレジスタ **********/
	// IF/ID
	wire [`WordAddrBus]			 if_pc;			 // プログラムカウンタ
	wire [`WordDataBus]			 if_insn;		 // 命令
	wire						 if_en;			 // パイプラインデータの有効
	// ID/EXパイプラインレジスタ
	wire [`WordAddrBus]			 id_pc;			 // プログラムカウンタ
	wire						 id_en;			 // パイプラインデータの有効
	wire [`AluOpBus]			 id_alu_op;		 // ALUオペレーション
	wire [`WordDataBus]			 id_alu_in_0;	 // ALU入力 0
	wire [`WordDataBus]			 id_alu_in_1;	 // ALU入力 1
	wire						 id_br_flag;	 // 分岐フラグ
	wire [`MemOpBus]			 id_mem_op;		 // メモリオペレーション
	wire [`WordDataBus]			 id_mem_wr_data; // メモリ書き込みデータ
	wire [`CtrlOpBus]			 id_ctrl_op;	 // 制御オペレーション
	wire [`RegAddrBus]			 id_dst_addr;	 // GPR書き込みアドレス
	wire						 id_gpr_we_;	 // GPR書き込み有効
	wire [`IsaExpBus]			 id_exp_code;	 // 例外コード
	// EX/MEMパイプラインレジスタ
	wire [`WordAddrBus]			 ex_pc;			 // プログラムカウンタ
	wire						 ex_en;			 // パイプラインデータの有効
	wire						 ex_br_flag;	 // 分岐フラグ
	wire [`MemOpBus]			 ex_mem_op;		 // メモリオペレーション
	wire [`WordDataBus]			 ex_mem_wr_data; // メモリ書き込みデータ
	wire [`CtrlOpBus]			 ex_ctrl_op;	 // 制御レジスタオペレーション
	wire [`RegAddrBus]			 ex_dst_addr;	 // 汎用レジスタ書き込みアドレス
	wire						 ex_gpr_we_;	 // 汎用レジスタ書き込み有効
	wire [`IsaExpBus]			 ex_exp_code;	 // 例外コード
	wire [`WordDataBus]			 ex_out;		 // 処理結果
	// MEM/WBパイプラインレジスタ
	wire [`WordAddrBus]			 mem_pc;		 // プログランカウンタ
	wire						 mem_en;		 // パイプラインデータの有効
	wire						 mem_br_flag;	 // 分岐フラグ
	wire [`CtrlOpBus]			 mem_ctrl_op;	 // 制御レジスタオペレーション
	wire [`RegAddrBus]			 mem_dst_addr;	 // 汎用レジスタ書き込みアドレス
	wire						 mem_gpr_we_;	 // 汎用レジスタ書き込み有効
	wire [`IsaExpBus]			 mem_exp_code;	 // 例外コード
	wire [`WordDataBus]			 mem_out;		 // 処理結果
	/********** パイプライン制御信号 **********/
	// ストール信号
	wire						 if_stall;		 // IFステージ
	wire						 id_stall;		 // IDステー
	wire						 ex_stall;		 // EXステージ
	wire						 mem_stall;		 // MEMステージ
	// フラッシュ信号
	wire						 if_flush;		 // IFステージ
	wire						 id_flush;		 // IDステージ
	wire						 ex_flush;		 // EXステージ
	wire						 mem_flush;		 // MEMステージ
	// ビジー信号
	wire						 if_busy;		 // IFステージ
	wire						 mem_busy;		 // MEMステージ
	// その他の制御信号
	wire [`WordAddrBus]			 new_pc;		 // 新しいPC
	wire [`WordAddrBus]			 br_addr;		 // 分岐アドレス
	wire						 br_taken;		 // 分岐の成立
	wire						 ld_hazard;		 // ロードハザード
	/********** 汎用レジスタ信号 **********/
	wire [`WordDataBus]			 gpr_rd_data_0;	 // 読み出しデータ 0
	wire [`WordDataBus]			 gpr_rd_data_1;	 // 読み出しデータ 1
	wire [`RegAddrBus]			 gpr_rd_addr_0;	 // 読み出しアドレス 0
	wire [`RegAddrBus]			 gpr_rd_addr_1;	 // 読み出しアドレス 1
	/********** 制御レジスタ信号 **********/
	wire [`CpuExeModeBus]		 exe_mode;		 // 実行モード
	wire [`WordDataBus]			 creg_rd_data;	 // 読み出しデータ
	wire [`RegAddrBus]			 creg_rd_addr;	 // 読み出しアドレス
	/********** Interrupt Request **********/
	wire						 int_detect;	  // 割り込み検出
	/********** スクラッチパッドメモリ信号 **********/
	// IFステージ
	wire [`WordDataBus]			 if_spm_rd_data;  // 読み出しデータ
	wire [`WordAddrBus]			 if_spm_addr;	  // アドレス
	wire						 if_spm_as_;	  // アドレスストローブ
	wire						 if_spm_rw;		  // 読み／書き
	wire [`WordDataBus]			 if_spm_wr_data;  // 書き込みデータ
	// MEMステージ
	wire [`WordDataBus]			 mem_spm_rd_data; // 読み出しデータ
	wire [`WordAddrBus]			 mem_spm_addr;	  // アドレス
	wire						 mem_spm_as_;	  // アドレスストローブ
	wire						 mem_spm_rw;	  // 読み／書き
	wire [`WordDataBus]			 mem_spm_wr_data; // 書き込みデータ
	/********** フォワーディング信号 **********/
	wire [`WordDataBus]			 ex_fwd_data;	  // EXステージ
	wire [`WordDataBus]			 mem_fwd_data;	  // MEMステージ

	/********** IFステージ **********/
	if_stage if_stage (
		/********** クロック & リセット **********/
		.clk			(clk),				// クロック
		.reset			(reset),			// 非同期リセット
		/********** SPMインタフェース **********/
		.spm_rd_data	(if_spm_rd_data),	// 読み出しデータ
		.spm_addr		(if_spm_addr),		// アドレス
		.spm_as_		(if_spm_as_),		// アドレスストローブ
		.spm_rw			(if_spm_rw),		// 読み／書き
		.spm_wr_data	(if_spm_wr_data),	// 書き込みデータ
		/********** バスインタフェース **********/
		.bus_rd_data	(if_bus_rd_data),	// 読み出しデータ
		.bus_rdy_		(if_bus_rdy_),		// レディ
		.bus_grnt_		(if_bus_grnt_),		// バスグラント
		.bus_req_		(if_bus_req_),		// バスリクエスト
		.bus_addr		(if_bus_addr),		// アドレス
		.bus_as_		(if_bus_as_),		// アドレスストローブ
		.bus_rw			(if_bus_rw),		// 読み／書き
		.bus_wr_data	(if_bus_wr_data),	// 書き込みデータ
		/********** パイプライン制御信号 **********/
		.stall			(if_stall),			// ストール
		.flush			(if_flush),			// フラッシュ
		.new_pc			(new_pc),			// 新しいPC
		.br_taken		(br_taken),			// 分岐の成立
		.br_addr		(br_addr),			// 分岐先アドレス
		.busy			(if_busy),			// ビジー信号
		/********** IF/IDパイプラインレジスタ **********/
		.if_pc			(if_pc),			// プログラムカウンタ
		.if_insn		(if_insn),			// 命令
		.if_en			(if_en)				// パイプラインデータの有効
	);

	/********** IDステージ **********/
	id_stage id_stage (
		/********** クロック & リセット **********/
		.clk			(clk),				// クロック
		.reset			(reset),			// 非同期リセット
		/********** GPRインタフェース **********/
		.gpr_rd_data_0	(gpr_rd_data_0),	// 読み出しデータ 0
		.gpr_rd_data_1	(gpr_rd_data_1),	// 読み出しデータ 1
		.gpr_rd_addr_0	(gpr_rd_addr_0),	// 読み出しアドレス 0
		.gpr_rd_addr_1	(gpr_rd_addr_1),	// 読み出しアドレス 1
		/********** フォワーディング **********/
		// EXステージからのフォワーディング
		.ex_en			(ex_en),			// パイプラインデータの有効
		.ex_fwd_data	(ex_fwd_data),		// フォワーディングデータ
		.ex_dst_addr	(ex_dst_addr),		// 書き込みアドレス
		.ex_gpr_we_		(ex_gpr_we_),		// 書き込み有効
		// MEMステージからのフォワーディング
		.mem_fwd_data	(mem_fwd_data),		// フォワーディングデータ
		/********** 制御レジスタインタフェース **********/
		.exe_mode		(exe_mode),			// 実行モード
		.creg_rd_data	(creg_rd_data),		// 読み出しデータ
		.creg_rd_addr	(creg_rd_addr),		// 読み出しアドレス
		/********** パイプライン制御信号 **********/
	   .stall		   (id_stall),		   // ストール
		.flush			(id_flush),			// フラッシュ
		.br_addr		(br_addr),			// 分岐アドレス
		.br_taken		(br_taken),			// 分岐の成立
		.ld_hazard		(ld_hazard),		// ロードハザード
		/********** IF/IDパイプラインレジスタ **********/
		.if_pc			(if_pc),			// プログラムカウンタ
		.if_insn		(if_insn),			// 命令
		.if_en			(if_en),			// パイプラインデータの有効
		/********** ID/EXパイプラインレジスタ **********/
		.id_pc			(id_pc),			// プログラムカウンタ
		.id_en			(id_en),			// パイプラインデータの有効
		.id_alu_op		(id_alu_op),		// ALUオペレーション
		.id_alu_in_0	(id_alu_in_0),		// ALU入力 0
		.id_alu_in_1	(id_alu_in_1),		// ALU入力 1
		.id_br_flag		(id_br_flag),		// 分岐フラグ
		.id_mem_op		(id_mem_op),		// メモリオペレーション
		.id_mem_wr_data (id_mem_wr_data),	// メモリ書き込みデータ
		.id_ctrl_op		(id_ctrl_op),		// 制御オペレーション
		.id_dst_addr	(id_dst_addr),		// GPR書き込みアドレス
		.id_gpr_we_		(id_gpr_we_),		// GPR書き込み有効
		.id_exp_code	(id_exp_code)		// 例外コード
	);

	/********** EXステージ **********/
	ex_stage ex_stage (
		/********** クロック & リセット **********/
		.clk			(clk),				// クロック
		.reset			(reset),			// 非同期リセット
		/********** パイプライン制御信号 **********/
		.stall			(ex_stall),			// ストール
		.flush			(ex_flush),			// フラッシュ
		.int_detect		(int_detect),		// 割り込み検出
		/********** フォワーディング **********/
		.fwd_data		(ex_fwd_data),		// フォワーディングデータ
		/********** ID/EXパイプラインレジスタ **********/
		.id_pc			(id_pc),			// プログラムカウンタ
		.id_en			(id_en),			// パイプラインデータの有効
		.id_alu_op		(id_alu_op),		// ALUオペレーション
		.id_alu_in_0	(id_alu_in_0),		// ALU入力 0
		.id_alu_in_1	(id_alu_in_1),		// ALU入力 1
		.id_br_flag		(id_br_flag),		// 分岐フラグ
		.id_mem_op		(id_mem_op),		// メモリオペレーション
		.id_mem_wr_data (id_mem_wr_data),	// メモリ書き込みデータ
		.id_ctrl_op		(id_ctrl_op),		// 制御レジスタオペレーション
		.id_dst_addr	(id_dst_addr),		// 汎用レジスタ書き込みアドレス
		.id_gpr_we_		(id_gpr_we_),		// 汎用レジスタ書き込み有効
		.id_exp_code	(id_exp_code),		// 例外コード
		/********** EX/MEMパイプラインレジスタ **********/
		.ex_pc			(ex_pc),			// プログラムカウンタ
		.ex_en			(ex_en),			// パイプラインデータの有効
		.ex_br_flag		(ex_br_flag),		// 分岐フラグ
		.ex_mem_op		(ex_mem_op),		// メモリオペレーション
		.ex_mem_wr_data (ex_mem_wr_data),	// メモリ書き込みデータ
		.ex_ctrl_op		(ex_ctrl_op),		// 制御レジスタオペレーション
		.ex_dst_addr	(ex_dst_addr),		// 汎用レジスタ書き込みアドレス
		.ex_gpr_we_		(ex_gpr_we_),		// 汎用レジスタ書き込み有効
		.ex_exp_code	(ex_exp_code),		// 例外コード
		.ex_out			(ex_out)			// 処理結果
	);

	/********** MEMステージ **********/
	mem_stage mem_stage (
		/********** クロック & リセット **********/
		.clk			(clk),				// クロック
		.reset			(reset),			// 非同期リセット
		/********** パイプライン制御信号 **********/
		.stall			(mem_stall),		// ストール
		.flush			(mem_flush),		// フラッシュ
		.busy			(mem_busy),			// ビジー信号
		/********** フォワーディング **********/
		.fwd_data		(mem_fwd_data),		// フォワーディングデータ
		/********** SPMインタフェース **********/
		.spm_rd_data	(mem_spm_rd_data),	// 読み出しデータ
		.spm_addr		(mem_spm_addr),		// アドレス
		.spm_as_		(mem_spm_as_),		// アドレスストローブ
		.spm_rw			(mem_spm_rw),		// 読み／書き
		.spm_wr_data	(mem_spm_wr_data),	// 書き込みデータ
		/********** バスインタフェース **********/
		.bus_rd_data	(mem_bus_rd_data),	// 読み出しデータ
		.bus_rdy_		(mem_bus_rdy_),		// レディ
		.bus_grnt_		(mem_bus_grnt_),	// バスグラント
		.bus_req_		(mem_bus_req_),		// バスリクエスト
		.bus_addr		(mem_bus_addr),		// アドレス
		.bus_as_		(mem_bus_as_),		// アドレスストローブ
		.bus_rw			(mem_bus_rw),		// 読み／書き
		.bus_wr_data	(mem_bus_wr_data),	// 書き込みデータ
		/********** EX/MEMパイプラインレジスタ **********/
		.ex_pc			(ex_pc),			// プログラムカウンタ
		.ex_en			(ex_en),			// パイプラインデータの有効
		.ex_br_flag		(ex_br_flag),		// 分岐フラグ
		.ex_mem_op		(ex_mem_op),		// メモリオペレーション
		.ex_mem_wr_data (ex_mem_wr_data),	// メモリ書き込みデータ
		.ex_ctrl_op		(ex_ctrl_op),		// 制御レジスタオペレーション
		.ex_dst_addr	(ex_dst_addr),		// 汎用レジスタ書き込みアドレス
		.ex_gpr_we_		(ex_gpr_we_),		// 汎用レジスタ書き込み有効
		.ex_exp_code	(ex_exp_code),		// 例外コード
		.ex_out			(ex_out),			// 処理結果
		/********** MEM/WBパイプラインレジスタ **********/
		.mem_pc			(mem_pc),			// プログランカウンタ
		.mem_en			(mem_en),			// パイプラインデータの有効
		.mem_br_flag	(mem_br_flag),		// 分岐フラグ
		.mem_ctrl_op	(mem_ctrl_op),		// 制御レジスタオペレーション
		.mem_dst_addr	(mem_dst_addr),		// 汎用レジスタ書き込みアドレス
		.mem_gpr_we_	(mem_gpr_we_),		// 汎用レジスタ書き込み有効
		.mem_exp_code	(mem_exp_code),		// 例外コード
		.mem_out		(mem_out)			// 処理結果
	);

	/********** 制御ユニット **********/
	ctrl ctrl (
		/********** クロック & リセット **********/
		.clk			(clk),				// クロック
		.reset			(reset),			// 非同期リセット
		/********** 制御レジスタインタフェース **********/
		.creg_rd_addr	(creg_rd_addr),		// 読み出しアドレス
		.creg_rd_data	(creg_rd_data),		// 読み出しデータ
		.exe_mode		(exe_mode),			// 実行モード
		/********** 割り込み **********/
		.irq			(cpu_irq),			// 割り込み要求
		.int_detect		(int_detect),		// 割り込み検出
		/********** ID/EXパイプラインレジスタ **********/
		.id_pc			(id_pc),			// プログラムカウンタ
		/********** MEM/WBパイプラインレジスタ **********/
		.mem_pc			(mem_pc),			// プログランカウンタ
		.mem_en			(mem_en),			// パイプラインデータの有効
		.mem_br_flag	(mem_br_flag),		// 分岐フラグ
		.mem_ctrl_op	(mem_ctrl_op),		// 制御レジスタオペレーション
		.mem_dst_addr	(mem_dst_addr),		// 汎用レジスタ書き込みアドレス
		.mem_exp_code	(mem_exp_code),		// 例外コード
		.mem_out		(mem_out),			// 処理結果
		/********** パイプライン制御信号 **********/
		// パイプラインの状態
		.if_busy		(if_busy),			// IFステージビジー
		.ld_hazard		(ld_hazard),		// Loadハザード
		.mem_busy		(mem_busy),			// MEMステージビジー
		// ストール信号
		.if_stall		(if_stall),			// IFステージストール
		.id_stall		(id_stall),			// IDステージストール
		.ex_stall		(ex_stall),			// EXステージストール
		.mem_stall		(mem_stall),		// MEMステージストール
		// フラッシュ信号
		.if_flush		(if_flush),			// IFステージフラッシュ
		.id_flush		(id_flush),			// IDステージフラッシュ
		.ex_flush		(ex_flush),			// EXステージフラッシュ
		.mem_flush		(mem_flush),		// MEMステージフラッシュ
		// 新しいプログラムカウンタ
		.new_pc			(new_pc)			// 新しいプログラムカウンタ
	);

	/********** 汎用レジスタ **********/
	gpr gpr (
		/********** クロック & リセット **********/
		.clk	   (clk),					// クロック
		.reset	   (reset),					// 非同期リセット
		/********** 読み出しポート 0 **********/
		.rd_addr_0 (gpr_rd_addr_0),			// 読み出しアドレス
		.rd_data_0 (gpr_rd_data_0),			// 読み出しデータ
		/********** 読み出しポート 1 **********/
		.rd_addr_1 (gpr_rd_addr_1),			// 読み出しアドレス
		.rd_data_1 (gpr_rd_data_1),			// 読み出しデータ
		/********** 書き込みポート **********/
		.we_	   (mem_gpr_we_),			// 書き込み有効
		.wr_addr   (mem_dst_addr),			// 書き込みアドレス
		.wr_data   (mem_out)				// 書き込みデータ
	);

	/********** スクラッチパッドメモリ **********/
	spm spm (
		/********** クロック **********/
		.clk			 (clk_),					  // クロック
		/********** ポートA : IFステージ **********/
		.if_spm_addr	 (if_spm_addr[`SpmAddrLoc]),  // アドレス
		.if_spm_as_		 (if_spm_as_),				  // アドレスストローブ
		.if_spm_rw		 (if_spm_rw),				  // 読み／書き
		.if_spm_wr_data	 (if_spm_wr_data),			  // 書き込みデータ
		.if_spm_rd_data	 (if_spm_rd_data),			  // 読み出しデータ
		/********** ポートB : MEMステージ **********/
		.mem_spm_addr	 (mem_spm_addr[`SpmAddrLoc]), // アドレス
		.mem_spm_as_	 (mem_spm_as_),				  // アドレスストローブ
		.mem_spm_rw		 (mem_spm_rw),				  // 読み／書き
		.mem_spm_wr_data (mem_spm_wr_data),			  // 書き込みデータ
		.mem_spm_rd_data (mem_spm_rd_data)			  // 読み出しデータ
	);

endmodule
