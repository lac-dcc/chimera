/*
 -- ============================================================================
 -- FILE NAME	: uart_tx.v
 -- DESCRIPTION : UART送信モジュール
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
module uart_tx (
	/********** クロック & リセット **********/
	input  wire				   clk,		 // クロック
	input  wire				   reset,	 // 非同期リセット
	/********** 制御信号 **********/
	input  wire				   tx_start, // 送信開始信号
	input  wire [`ByteDataBus] tx_data,	 // 送信データ
	output wire				   tx_busy,	 // 送信中フラグ
	output reg				   tx_end,	 // 送信完了信号
	/********** UART送信信号 **********/
	output reg				   tx		 // UART送信信号
);

	/********** 内部信号 **********/
	reg [`UartStateBus]		   state;	 // ステート
	reg [`UartDivCntBus]	   div_cnt;	 // 分周カウンタ
	reg [`UartBitCntBus]	   bit_cnt;	 // ビットカウンタ
	reg [`ByteDataBus]		   sh_reg;	 // 送信用シフトレジスタ

	/********** 送信中フラグの生成 **********/
	assign tx_busy = (state == `UART_STATE_TX) ? `ENABLE : `DISABLE;

	/********** 送信論理 **********/
	always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* 非同期リセット */
			state	<= #1 `UART_STATE_IDLE;
			div_cnt <= #1 `UART_DIV_RATE;
			bit_cnt <= #1 `UART_BIT_CNT_START;
			sh_reg	<= #1 `BYTE_DATA_W'h0;
			tx_end	<= #1 `DISABLE;
			tx		<= #1 `UART_STOP_BIT;
		end else begin
			/* 送信ステート */
			case (state)
				`UART_STATE_IDLE : begin // アイドル状態
					if (tx_start == `ENABLE) begin // 送信開始
						state	<= #1 `UART_STATE_TX;
						sh_reg	<= #1 tx_data;
						tx		<= #1 `UART_START_BIT;
					end
					tx_end	<= #1 `DISABLE;
				end
				`UART_STATE_TX	 : begin // 送信中
					/* クロック分周によるボーレート調整 */
					if (div_cnt == {`UART_DIV_CNT_W{1'b0}}) begin // 満了
						/* 次データの送信 */
						case (bit_cnt)
							`UART_BIT_CNT_MSB  : begin // ストップビットの送信
								bit_cnt <= #1 `UART_BIT_CNT_STOP;
								tx		<= #1 `UART_STOP_BIT;
							end
							`UART_BIT_CNT_STOP : begin // 送信完了
								state	<= #1 `UART_STATE_IDLE;
								bit_cnt <= #1 `UART_BIT_CNT_START;
								tx_end	<= #1 `ENABLE;
							end
							default			   : begin // データの送信
								bit_cnt <= #1 bit_cnt + 1'b1;
								sh_reg	<= #1 sh_reg >> 1'b1;
								tx		<= #1 sh_reg[`LSB];
							end
						endcase
						div_cnt <= #1 `UART_DIV_RATE;
					end else begin // カウントダウン
						div_cnt <= #1 div_cnt - 1'b1 ;
					end
				end
			endcase
		end
	end

endmodule
