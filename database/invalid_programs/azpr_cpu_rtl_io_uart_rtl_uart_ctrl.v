/*
 -- ============================================================================
 -- FILE NAME	: uart_ctrl.v
 -- DESCRIPTION : UART制御モジュール
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
`include "uart.h"

/********** モジュール **********/
module uart_ctrl (
	/********** クロック & リセット **********/
	input  wire				   clk,		 // クロック
	input  wire				   reset,	 // 非同期リセット
	/********** バスインタフェース **********/
	input  wire				   cs_,		 // チップセレクト
	input  wire				   as_,		 // アドレスストローブ
	input  wire				   rw,		 // Read / Write
	input  wire [`UartAddrBus] addr,	 // アドレス
	input  wire [`WordDataBus] wr_data,	 // 書き込みデータ
	output reg	[`WordDataBus] rd_data,	 // 読み出しデータ
	output reg				   rdy_,	 // レディ
	/********** 割り込み **********/
	output reg				   irq_rx,	 // 受信完了割り込み（制御レジスタ 0）
	output reg				   irq_tx,	 // 送信完了割り込み（制御レジスタ 0）
	/********** 制御信号 **********/
	// 受信制御
	input  wire				   rx_busy,	 // 受信中フラグ（制御レジスタ 0）
	input  wire				   rx_end,	 // 受信完了信号
	input  wire [`ByteDataBus] rx_data,	 // 受信データ
	// 送信制御
	input  wire				   tx_busy,	 // 送信中フラグ（制御レジスタ 0）
	input  wire				   tx_end,	 // 送信完了信号
	output reg				   tx_start, // 送信開始信号
	output reg	[`ByteDataBus] tx_data	 // 送信データ
);

	/********** 制御レジツタ **********/
	// 制御レジスタ 1 : 送受信データ
	reg [`ByteDataBus]		   rx_buf;	 // 受信バッファ

	/********** UART制御論理 **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* 非同期リセット */
			rd_data	 <= #1 `WORD_DATA_W'h0;
			rdy_	 <= #1 `DISABLE_;
			irq_rx	 <= #1 `DISABLE;
			irq_tx	 <= #1 `DISABLE;
			rx_buf	 <= #1 `BYTE_DATA_W'h0;
			tx_start <= #1 `DISABLE;
			tx_data	 <= #1 `BYTE_DATA_W'h0;
	   end else begin
			/* レディの生成 */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_)) begin
				rdy_	 <= #1 `ENABLE_;
			end else begin
				rdy_	 <= #1 `DISABLE_;
			end
			/* 読み出しアクセス */
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) && (rw == `READ)) begin
				case (addr)
					`UART_ADDR_STATUS	 : begin // 制御レジスタ 0
						rd_data	 <= #1 {{`WORD_DATA_W-4{1'b0}}, 
										tx_busy, rx_busy, irq_tx, irq_rx};
					end
					`UART_ADDR_DATA		 : begin // 制御レジスタ 1
						rd_data	 <= #1 {{`BYTE_DATA_W*2{1'b0}}, rx_buf};
					end
				endcase
			end else begin
				rd_data	 <= #1 `WORD_DATA_W'h0;
			end
			/* 書き込みアクセス */
			// 制御レジスタ 0 : 送信完了割り込み
			if (tx_end == `ENABLE) begin
				irq_tx<= #1 `ENABLE;
			end else if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) && 
						 (rw == `WRITE) && (addr == `UART_ADDR_STATUS)) begin
				irq_tx<= #1 wr_data[`UartCtrlIrqTx];
			end
			// 制御レジスタ 0 : 受信完了割り込み
			if (rx_end == `ENABLE) begin
				irq_rx<= #1 `ENABLE;
			end else if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) && 
						 (rw == `WRITE) && (addr == `UART_ADDR_STATUS)) begin
				irq_rx<= #1 wr_data[`UartCtrlIrqRx];
			end
			// 制御レジスタ 1
			if ((cs_ == `ENABLE_) && (as_ == `ENABLE_) && 
				(rw == `WRITE) && (addr == `UART_ADDR_DATA)) begin // 送信開始
				tx_start <= #1 `ENABLE;
				tx_data	 <= #1 wr_data[`BYTE_MSB:`LSB];
			end else begin
				tx_start <= #1 `DISABLE;
				tx_data	 <= #1 `BYTE_DATA_W'h0;
			end
			/* 受信データの取り込み */
			if (rx_end == `ENABLE) begin
				rx_buf	 <= #1 rx_data;
			end
		end
	end

endmodule
