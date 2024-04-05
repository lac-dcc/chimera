/*
 -- ============================================================================
 -- FILE NAME	: x_s3e_dpram.v
 -- DESCRIPTION : Xilinx Spartan-3E Dual Port RAM 疑似モデル
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
`include "spm.h"

/********** モジュール **********/
module x_s3e_dpram (
	/********** ポート A **********/
	input  wire				   clka,  // クロック
	input  wire [`SpmAddrBus]  addra, // アドレス
	input  wire [`WordDataBus] dina,  // 書き込みデータ
	input  wire				   wea,	  // 書き込み有効
	output reg	[`WordDataBus] douta, // 読み出しデータ
	/********** ポート B **********/
	input  wire				   clkb,  // クロック
	input  wire [`SpmAddrBus]  addrb, // アドレス
	input  wire [`WordDataBus] dinb,  // 書き込みデータ
	input  wire				   web,	  // 書き込み有効
	output reg	[`WordDataBus] doutb  // 読み出しデータ
);

	/********** メモリ **********/
	reg [`WordDataBus] mem [0:`SPM_DEPTH-1];

	/********** メモリアクセス（ポート A） **********/
	always @(posedge clka) begin
		// 読み出しアクセス
		if ((web == `ENABLE) && (addra == addrb)) begin
			douta	  <= #1 dinb;
		end else begin
			douta	  <= #1 mem[addra];
		end
		// 書き込みアクセス
		if (wea == `ENABLE) begin
			mem[addra]<= #1 dina;
		end
	end

	/********** メモリアクセス（ポート B） **********/
	always @(posedge clkb) begin
		// 読み出しアクセス
		if ((wea == `ENABLE) && (addrb == addra)) begin
			doutb	  <= #1 dina;
		end else begin
			doutb	  <= #1 mem[addrb];
		end
		// 書き込みアクセス
		if (web == `ENABLE) begin
			mem[addrb]<= #1 dinb;
		end
	end

endmodule
