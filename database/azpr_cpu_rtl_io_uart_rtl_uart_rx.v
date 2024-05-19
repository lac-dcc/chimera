// This program was cloned from: https://github.com/zhangly/azpr_cpu
// License: MIT License

/*
 -- ============================================================================
 -- FILE NAME	: uart_rx.v
 -- DESCRIPTION : UART受信モジュール
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
module uart_rx (
	/********** クロック & リセット **********/
	input  wire				   clk,		// クロック
	input  wire				   reset,	// 非同期リセット
	/********** 制御信号 **********/
	output wire				   rx_busy, // 受信中フラグ
	output reg				   rx_end,	// 受信完了信号
	output reg	[`ByteDataBus] rx_data, // 受信データ
	/********** UART受信信号 **********/
	input  wire				   rx		// UART受信信号
);

	/********** 内部レジスタ **********/
	reg [`UartStateBus]		   state;	 // ステート
	reg [`UartDivCntBus]	   div_cnt;	 // 分周カウンタ
	reg [`UartBitCntBus]	   bit_cnt;	 // ビットカウンタ

	/********** 受信中フラグの生成 **********/
	assign rx_busy = (state != `UART_STATE_IDLE) ? `ENABLE : `DISABLE;

	/********** 受信論理 **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* 非同期リセット */
			rx_end	<= #1 `DISABLE;
			rx_data <= #1 `BYTE_DATA_W'h0;
			state	<= #1 `UART_STATE_IDLE;
			div_cnt <= #1 `UART_DIV_RATE / 2;
			bit_cnt <= #1 `UART_BIT_CNT_W'h0;
		end else begin
			/* 受信ステート */
			case (state)
				`UART_STATE_IDLE : begin // アイドル状態
					if (rx == `UART_START_BIT) begin // 受信開始
						state	<= #1 `UART_STATE_RX;
					end
					rx_end	<= #1 `DISABLE;
				end
				`UART_STATE_RX	 : begin // 受信中
					/* クロック分周によるボーレート調整 */
					if (div_cnt == {`UART_DIV_CNT_W{1'b0}}) begin // 満了
						/* 次データの受信 */
						case (bit_cnt)
							`UART_BIT_CNT_STOP	: begin // ストップビットの受信
								state	<= #1 `UART_STATE_IDLE;
								bit_cnt <= #1 `UART_BIT_CNT_START;
								div_cnt <= #1 `UART_DIV_RATE / 2;
								/* フレーミングエラーのチェック */
								if (rx == `UART_STOP_BIT) begin
									rx_end	<= #1 `ENABLE;
								end
							end
							default				: begin // データの受信
								rx_data <= #1 {rx, rx_data[`BYTE_MSB:`LSB+1]};
								bit_cnt <= #1 bit_cnt + 1'b1;
								div_cnt <= #1 `UART_DIV_RATE;
							end
						endcase
					end else begin // カウントダウン
						div_cnt <= #1 div_cnt - 1'b1;
					end
				end
			endcase
		end
	end

endmodule
