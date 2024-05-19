// This program was cloned from: https://github.com/zhangly/azpr_cpu
// License: MIT License

/*
 -- ============================================================================
 -- FILE NAME	: ex_reg.v
 -- DESCRIPTION : EXステージパイプラインレジスタ
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
module ex_reg (
	/********** クロック & リセット **********/
	input  wire				   clk,			   // クロック
	input  wire				   reset,		   // 非同期リセット
	/********** ALUの出力 **********/
	input  wire [`WordDataBus] alu_out,		   // 演算結果
	input  wire				   alu_of,		   // オーバフロー
	/********** パイプライン制御信号 **********/
	input  wire				   stall,		   // ストール
	input  wire				   flush,		   // フラッシュ
	input  wire				   int_detect,	   // 割り込み検出
	/********** ID/EXパイプラインレジスタ **********/
	input  wire [`WordAddrBus] id_pc,		   // プログラムカウンタ
	input  wire				   id_en,		   // パイプラインデータの有効
	input  wire				   id_br_flag,	   // 分岐フラグ
	input  wire [`MemOpBus]	   id_mem_op,	   // メモリオペレーション
	input  wire [`WordDataBus] id_mem_wr_data, // メモリ書き込みデータ
	input  wire [`CtrlOpBus]   id_ctrl_op,	   // 制御レジスタオペレーション
	input  wire [`RegAddrBus]  id_dst_addr,	   // 汎用レジスタ書き込みアドレス
	input  wire				   id_gpr_we_,	   // 汎用レジスタ書き込み有効
	input  wire [`IsaExpBus]   id_exp_code,	   // 例外コード
	/********** EX/MEMパイプラインレジスタ **********/
	output reg	[`WordAddrBus] ex_pc,		   // プログラムカウンタ
	output reg				   ex_en,		   // パイプラインデータの有効
	output reg				   ex_br_flag,	   // 分岐フラグ
	output reg	[`MemOpBus]	   ex_mem_op,	   // メモリオペレーション
	output reg	[`WordDataBus] ex_mem_wr_data, // メモリ書き込みデータ
	output reg	[`CtrlOpBus]   ex_ctrl_op,	   // 制御レジスタオペレーション
	output reg	[`RegAddrBus]  ex_dst_addr,	   // 汎用レジスタ書き込みアドレス
	output reg				   ex_gpr_we_,	   // 汎用レジスタ書き込み有効
	output reg	[`IsaExpBus]   ex_exp_code,	   // 例外コード
	output reg	[`WordDataBus] ex_out		   // 処理結果
);

	/********** パイプラインレジスタ **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		/* 非同期リセット */
		if (reset == `RESET_ENABLE) begin 
			ex_pc		   <= #1 `WORD_ADDR_W'h0;
			ex_en		   <= #1 `DISABLE;
			ex_br_flag	   <= #1 `DISABLE;
			ex_mem_op	   <= #1 `MEM_OP_NOP;
			ex_mem_wr_data <= #1 `WORD_DATA_W'h0;
			ex_ctrl_op	   <= #1 `CTRL_OP_NOP;
			ex_dst_addr	   <= #1 `REG_ADDR_W'd0;
			ex_gpr_we_	   <= #1 `DISABLE_;
			ex_exp_code	   <= #1 `ISA_EXP_NO_EXP;
			ex_out		   <= #1 `WORD_DATA_W'h0;
		end else begin
			/* パイプラインレジスタの更新 */
			if (stall == `DISABLE) begin 
				if (flush == `ENABLE) begin				  // フラッシュ
					ex_pc		   <= #1 `WORD_ADDR_W'h0;
					ex_en		   <= #1 `DISABLE;
					ex_br_flag	   <= #1 `DISABLE;
					ex_mem_op	   <= #1 `MEM_OP_NOP;
					ex_mem_wr_data <= #1 `WORD_DATA_W'h0;
					ex_ctrl_op	   <= #1 `CTRL_OP_NOP;
					ex_dst_addr	   <= #1 `REG_ADDR_W'd0;
					ex_gpr_we_	   <= #1 `DISABLE_;
					ex_exp_code	   <= #1 `ISA_EXP_NO_EXP;
					ex_out		   <= #1 `WORD_DATA_W'h0;
				end else if (int_detect == `ENABLE) begin // 割り込みの検出
					ex_pc		   <= #1 id_pc;
					ex_en		   <= #1 id_en;
					ex_br_flag	   <= #1 id_br_flag;
					ex_mem_op	   <= #1 `MEM_OP_NOP;
					ex_mem_wr_data <= #1 `WORD_DATA_W'h0;
					ex_ctrl_op	   <= #1 `CTRL_OP_NOP;
					ex_dst_addr	   <= #1 `REG_ADDR_W'd0;
					ex_gpr_we_	   <= #1 `DISABLE_;
					ex_exp_code	   <= #1 `ISA_EXP_EXT_INT;
					ex_out		   <= #1 `WORD_DATA_W'h0;
				end else if (alu_of == `ENABLE) begin	  // 算術オーバフロー
					ex_pc		   <= #1 id_pc;
					ex_en		   <= #1 id_en;
					ex_br_flag	   <= #1 id_br_flag;
					ex_mem_op	   <= #1 `MEM_OP_NOP;
					ex_mem_wr_data <= #1 `WORD_DATA_W'h0;
					ex_ctrl_op	   <= #1 `CTRL_OP_NOP;
					ex_dst_addr	   <= #1 `REG_ADDR_W'd0;
					ex_gpr_we_	   <= #1 `DISABLE_;
					ex_exp_code	   <= #1 `ISA_EXP_OVERFLOW;
					ex_out		   <= #1 `WORD_DATA_W'h0;
				end else begin							  // 次のデータ
					ex_pc		   <= #1 id_pc;
					ex_en		   <= #1 id_en;
					ex_br_flag	   <= #1 id_br_flag;
					ex_mem_op	   <= #1 id_mem_op;
					ex_mem_wr_data <= #1 id_mem_wr_data;
					ex_ctrl_op	   <= #1 id_ctrl_op;
					ex_dst_addr	   <= #1 id_dst_addr;
					ex_gpr_we_	   <= #1 id_gpr_we_;
					ex_exp_code	   <= #1 id_exp_code;
					ex_out		   <= #1 alu_out;
				end
			end
		end
	end

endmodule
