// This program was cloned from: https://github.com/zhangly/azpr_cpu
// License: MIT License

/* 
 -- ============================================================================
 -- FILE NAME	: id_reg.v
 -- DESCRIPTION : IDステージパイプラインレジスタ
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
module id_reg (
	/********** クロック & リセット **********/
	input  wire				   clk,			   // クロック
	input  wire				   reset,		   // 非同期リセット
	/********** デコード結果 **********/
	input  wire [`AluOpBus]	   alu_op,		   // ALUオペレーション
	input  wire [`WordDataBus] alu_in_0,	   // ALU入力 0
	input  wire [`WordDataBus] alu_in_1,	   // ALU入力 1
	input  wire				   br_flag,		   // 分岐フラグ
	input  wire [`MemOpBus]	   mem_op,		   // メモリオペレーション
	input  wire [`WordDataBus] mem_wr_data,	   // メモリ書き込みデータ
	input  wire [`CtrlOpBus]   ctrl_op,		   // 制御オペレーション
	input  wire [`RegAddrBus]  dst_addr,	   // 汎用レジスタ書き込みアドレス
	input  wire				   gpr_we_,		   // 汎用レジスタ書き込み有効
	input  wire [`IsaExpBus]   exp_code,	   // 例外コード
	/********** パイプライン制御信号 **********/
	input  wire				   stall,		   // ストール
	input  wire				   flush,		   // フラッシュ
	/********** IF/IDパイプラインレジスタ **********/
	input  wire [`WordAddrBus] if_pc,		   // プログラムカウンタ
	input  wire				   if_en,		   // パイプラインデータの有効
	/********** ID/EXパイプラインレジスタ **********/
	output reg	[`WordAddrBus] id_pc,		   // プログラムカウンタ
	output reg				   id_en,		   // パイプラインデータの有効
	output reg	[`AluOpBus]	   id_alu_op,	   // ALUオペレーション
	output reg	[`WordDataBus] id_alu_in_0,	   // ALU入力 0
	output reg	[`WordDataBus] id_alu_in_1,	   // ALU入力 1
	output reg				   id_br_flag,	   // 分岐フラグ
	output reg	[`MemOpBus]	   id_mem_op,	   // メモリオペレーション
	output reg	[`WordDataBus] id_mem_wr_data, // メモリ書き込みデータ
	output reg	[`CtrlOpBus]   id_ctrl_op,	   // 制御オペレーション
	output reg	[`RegAddrBus]  id_dst_addr,	   // 汎用レジスタ書き込みアドレス
	output reg				   id_gpr_we_,	   // 汎用レジスタ書き込み有効
	output reg [`IsaExpBus]	   id_exp_code	   // 例外コード
);

	/********** パイプラインレジスタ **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin 
			/* 非同期リセット */
			id_pc		   <= #1 `WORD_ADDR_W'h0;
			id_en		   <= #1 `DISABLE;
			id_alu_op	   <= #1 `ALU_OP_NOP;
			id_alu_in_0	   <= #1 `WORD_DATA_W'h0;
			id_alu_in_1	   <= #1 `WORD_DATA_W'h0;
			id_br_flag	   <= #1 `DISABLE;
			id_mem_op	   <= #1 `MEM_OP_NOP;
			id_mem_wr_data <= #1 `WORD_DATA_W'h0;
			id_ctrl_op	   <= #1 `CTRL_OP_NOP;
			id_dst_addr	   <= #1 `REG_ADDR_W'd0;
			id_gpr_we_	   <= #1 `DISABLE_;
			id_exp_code	   <= #1 `ISA_EXP_NO_EXP;
		end else begin
			/* パイプラインレジスタの更新 */
			if (stall == `DISABLE) begin 
				if (flush == `ENABLE) begin // フラッシュ
				   id_pc		  <= #1 `WORD_ADDR_W'h0;
				   id_en		  <= #1 `DISABLE;
				   id_alu_op	  <= #1 `ALU_OP_NOP;
				   id_alu_in_0	  <= #1 `WORD_DATA_W'h0;
				   id_alu_in_1	  <= #1 `WORD_DATA_W'h0;
				   id_br_flag	  <= #1 `DISABLE;
				   id_mem_op	  <= #1 `MEM_OP_NOP;
				   id_mem_wr_data <= #1 `WORD_DATA_W'h0;
				   id_ctrl_op	  <= #1 `CTRL_OP_NOP;
				   id_dst_addr	  <= #1 `REG_ADDR_W'd0;
				   id_gpr_we_	  <= #1 `DISABLE_;
				   id_exp_code	  <= #1 `ISA_EXP_NO_EXP;
				end else begin				// 次のデータ
				   id_pc		  <= #1 if_pc;
				   id_en		  <= #1 if_en;
				   id_alu_op	  <= #1 alu_op;
				   id_alu_in_0	  <= #1 alu_in_0;
				   id_alu_in_1	  <= #1 alu_in_1;
				   id_br_flag	  <= #1 br_flag;
				   id_mem_op	  <= #1 mem_op;
				   id_mem_wr_data <= #1 mem_wr_data;
				   id_ctrl_op	  <= #1 ctrl_op;
				   id_dst_addr	  <= #1 dst_addr;
				   id_gpr_we_	  <= #1 gpr_we_;
				   id_exp_code	  <= #1 exp_code;
				end
			end
		end
	end

endmodule
