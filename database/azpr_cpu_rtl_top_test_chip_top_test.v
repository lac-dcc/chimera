// This program was cloned from: https://github.com/zhangly/azpr_cpu
// License: MIT License

﻿/* 
 -- ============================================================================
 -- FILE NAME	: chip_top_test.v
 -- DESCRIPTION : 测试台
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  2012/04/02  suito		 新規作成
 -- ============================================================================
*/

/********** タイムスケール **********/
`timescale 1ns/1ps					 // タイムスケール

/********** 共通ヘッダファイル **********/
`include "nettype.h"
`include "stddef.h"
`include "global_config.h"

/********** 個別ヘッダファイル **********/
`include "bus.h"
`include "cpu.h"
`include "gpio.h"

/********** モジュール **********/
module chip_top_test;
	/********** 入出力信号 **********/
	// クロック & リセット
	reg						clk_ref;	   // 基底クロック
	reg						reset_sw;	   // グローバルリセット
	// UART
`ifdef IMPLEMENT_UART // UART実装
	wire					uart_rx;	   // UART受信信号
	wire					uart_tx;	   // UART送信信号
`endif
	// 汎用入出力ポート
`ifdef IMPLEMENT_GPIO // GPIO実装
`ifdef GPIO_IN_CH	 // 入力ポートの実装
	wire [`GPIO_IN_CH-1:0]	gpio_in = {`GPIO_IN_CH{1'b0}}; // 入力ポート
`endif
`ifdef GPIO_OUT_CH	 // 出力ポートの実装
	wire [`GPIO_OUT_CH-1:0] gpio_out;					   // 出力ポート
`endif
`ifdef GPIO_IO_CH	 // 入出力ポートの実装
	wire [`GPIO_IO_CH-1:0]	gpio_io = {`GPIO_IO_CH{1'bz}}; // 入出力ポート
`endif
`endif
						 
	/********** UARTモデル **********/
`ifdef IMPLEMENT_UART // UART実装
	wire					 rx_busy;		  // 受信中フラグ
	wire					 rx_end;		  // 受信完了信号
	wire [`ByteDataBus]		 rx_data;		  // 受信データ
`endif

	/********** シミュレーションサイクル **********/
	parameter				 STEP = 100.0000; // 10 M

	/********** クロック生成 **********/
	always #( STEP / 2 ) begin
		clk_ref <= ~clk_ref;
	end

	/********** chip_topのインスタンス化 **********/  
	chip_top chip_top (
		/********** クロック & リセット **********/
		.clk_ref	(clk_ref), // 基底クロック
		.reset_sw	(reset_sw) // グローバルリセット
		/********** UART **********/
`ifdef IMPLEMENT_UART // UART実装
		, .uart_rx	(uart_rx)  // UART受信信号
		, .uart_tx	(uart_tx)  // UART送信信号
`endif
	/********** 汎用入出力ポート **********/
`ifdef IMPLEMENT_GPIO // GPIO実装
`ifdef GPIO_IN_CH			   // 入力ポートの実装
		, .gpio_in	(gpio_in)  // 入力ポート
`endif
`ifdef GPIO_OUT_CH	 // 出力ポートの実装
		, .gpio_out (gpio_out) // 出力ポート
`endif
`ifdef GPIO_IO_CH	 // 入出力ポートの実装
		, .gpio_io	(gpio_io)  // 入出力ポート
`endif
`endif
);

	/********** GPIOのモニタリング **********/	
`ifdef IMPLEMENT_GPIO // GPIO実装
`ifdef GPIO_IN_CH	 // 入力ポートの実装
	always @(gpio_in) begin	 // gpio_inが変化したら値をプリント
		$display($time, " gpio_in changed  : %b", gpio_in);
	end
`endif
`ifdef GPIO_OUT_CH	 // 出力ポートの実装
	always @(gpio_out) begin // gpio_outが変化したら値をプリント
		$display($time, " gpio_out changed : %b", gpio_out);
	end
`endif
`ifdef GPIO_IO_CH	 // 入出力ポートの実装
	always @(gpio_io) begin // gpio_ioが変化したら値をプリント
		$display($time, " gpio_io changed  : %b", gpio_io);
	end
`endif
`endif

	/********** UARTモデルのインスタンス化 **********/	
`ifdef IMPLEMENT_UART // UART実装
	/********** 受信信号 **********/  
	assign uart_rx = `HIGH;		// アイドル
//	  assign uart_rx = uart_tx; // ループバック

	/********** UARTモデル **********/	
	uart_rx uart_model (
		/********** クロック & リセット **********/
		.clk	  (chip_top.clk),		 // クロック
		.reset	  (chip_top.chip_reset), // 非同期リセット
		/********** 制御信号 **********/
		.rx_busy  (rx_busy),			 // 受信中フラグ
		.rx_end	  (rx_end),				 // 受信完了信号
		.rx_data  (rx_data),			 // 受信データ
		/********** Receive Signal **********/
		.rx		  (uart_tx)				 // UART受信信号
	);

	/********** 送信信号のモニタリング **********/	
	always @(posedge chip_top.clk) begin
		if (rx_end == `ENABLE) begin // 受信したら文字を出力
			$write("%c", rx_data);
		end
	end
`endif

	/********** テストシーケンス **********/  
	initial begin
		# 0 begin
			clk_ref	 <= `HIGH;
			reset_sw <= `RESET_ENABLE;
		end
		# ( STEP / 2 )
		# ( STEP / 4 ) begin		  // メモリイメージの読み込み
			$readmemh(`ROM_PRG, chip_top.chip.rom.x_s3e_sprom.mem);
			$readmemh(`SPM_PRG, chip_top.chip.cpu.spm.x_s3e_dpram.mem);
		end
		# ( STEP * 20 ) begin		  // リセットの解除
			reset_sw <= `RESET_DISABLE;
		end
		# ( STEP * `SIM_CYCLE ) begin // シミュレーションの実行
			$finish;
		end
	end

	/********** 波形の出力 **********/	
	initial begin
		$dumpfile("chip_top.vcd");
		$dumpvars(0, chip_top);
	end
  
endmodule	
