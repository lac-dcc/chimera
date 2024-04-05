/*
 -- ============================================================================
 -- FILE NAME	: alu.v
 -- DESCRIPTION : 算術論理演算ユニット
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
module alu (
	input  wire [`WordDataBus] in_0,  // 入力 0
	input  wire [`WordDataBus] in_1,  // 入力 1
	input  wire [`AluOpBus]	   op,	  // オペレーション
	output reg	[`WordDataBus] out,	  // 出力
	output reg				   of	  // オーバフロー
);

	/********** 符号付き入出力信号 **********/
	wire signed [`WordDataBus] s_in_0 = $signed(in_0); // 符号付き入力 0
	wire signed [`WordDataBus] s_in_1 = $signed(in_1); // 符号付き入力 1
	wire signed [`WordDataBus] s_out  = $signed(out);  // 符号付き出力

	/********** 算術論理演算 **********/
	always @(*) begin
		case (op)
			`ALU_OP_AND	 : begin // 論理積（AND）
				out	  = in_0 & in_1;
			end
			`ALU_OP_OR	 : begin // 論理和（OR）
				out	  = in_0 | in_1;
			end
			`ALU_OP_XOR	 : begin // 排他的論理和（XOR）
				out	  = in_0 ^ in_1;
			end
			`ALU_OP_ADDS : begin // 符号付き加算
				out	  = in_0 + in_1;
			end
			`ALU_OP_ADDU : begin // 符号なし加算
				out	  = in_0 + in_1;
			end
			`ALU_OP_SUBS : begin // 符号付き減算
				out	  = in_0 - in_1;
			end
			`ALU_OP_SUBU : begin // 符号なし減算
				out	  = in_0 - in_1;
			end
			`ALU_OP_SHRL : begin // 論理右シフト
				out	  = in_0 >> in_1[`ShAmountLoc];
			end
			`ALU_OP_SHLL : begin // 論理左シフト
				out	  = in_0 << in_1[`ShAmountLoc];
			end
			default		 : begin // デフォルト値 (No Operation)
				out	  = in_0;
			end
		endcase
	end

	/********** オーバフローチェック **********/
	always @(*) begin
		case (op)
			`ALU_OP_ADDS : begin // 加算オーバフローのチェック
				if (((s_in_0 > 0) && (s_in_1 > 0) && (s_out < 0)) ||
					((s_in_0 < 0) && (s_in_1 < 0) && (s_out > 0))) begin
					of = `ENABLE;
				end else begin
					of = `DISABLE;
				end
			end
			`ALU_OP_SUBS : begin // 減算オーバフローのチェック
				if (((s_in_0 < 0) && (s_in_1 > 0) && (s_out > 0)) ||
					((s_in_0 > 0) && (s_in_1 < 0) && (s_out < 0))) begin
					of = `ENABLE;
				end else begin
					of = `DISABLE;
				end
			end
			default		: begin // デフォルト値
				of = `DISABLE;
			end
		endcase
	end

endmodule
