/*
 -- ============================================================================
 -- FILE NAME	: mem_ctrl.v
 -- DESCRIPTION : メモリアクセス制御ユニット
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

/********** モジュール **********/
module mem_ctrl (
	/********** EX/MEMパイプラインレジスタ **********/
	input  wire				   ex_en,		   // パイプラインデータの有効
	input  wire [`MemOpBus]	   ex_mem_op,	   // メモリオペレーション
	input  wire [`WordDataBus] ex_mem_wr_data, // メモリ書き込みデータ
	input  wire [`WordDataBus] ex_out,		   // 処理結果
	/********** メモリアクセスインタフェース **********/
	input  wire [`WordDataBus] rd_data,		   // 読み出しデータ
	output wire [`WordAddrBus] addr,		   // アドレス
	output reg				   as_,			   // アドレス有効
	output reg				   rw,			   // 読み／書き
	output wire [`WordDataBus] wr_data,		   // 書き込みデータ
	/********** メモリアクセス結果 **********/
	output reg [`WordDataBus]  out	 ,		   // メモリアクセス結果
	output reg				   miss_align	   // ミスアライン
);

	/********** 内部信号 **********/
	wire [`ByteOffsetBus]	 offset;		   // オフセット

	/********** 出力のアサイン **********/
	assign wr_data = ex_mem_wr_data;		   // 書き込みデータ
	assign addr	   = ex_out[`WordAddrLoc];	   // アドレス
	assign offset  = ex_out[`ByteOffsetLoc];   // オフセット

	/********** メモリアクセスの制御 **********/
	always @(*) begin
		/* デフォルト値 */
		miss_align = `DISABLE;
		out		   = `WORD_DATA_W'h0;
		as_		   = `DISABLE_;
		rw		   = `READ;
		/* メモリアクセス */
		if (ex_en == `ENABLE) begin
			case (ex_mem_op)
				`MEM_OP_LDW : begin // ワード読み出し
					/* バイトオフセットのチェック */
					if (offset == `BYTE_OFFSET_WORD) begin // アライン
						out			= rd_data;
						as_		   = `ENABLE_;
					end else begin						   // ミスアライン
						miss_align	= `ENABLE;
					end
				end
				`MEM_OP_STW : begin // ワード書き込み
					/* バイトオフセットのチェック */
					if (offset == `BYTE_OFFSET_WORD) begin // アライン
						rw			= `WRITE;
						as_		   = `ENABLE_;
					end else begin						   // ミスアライン
						miss_align	= `ENABLE;
					end
				end
				default		: begin // メモリアクセスなし
					out			= ex_out;
				end
			endcase
		end
	end

endmodule
