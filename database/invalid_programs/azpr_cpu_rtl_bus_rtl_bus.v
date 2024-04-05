/*
 -- ============================================================================
 -- FILE NAME	: bus.v
 -- DESCRIPTION : 总线
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  2011/06/27  suito		 新規作成
 -- ============================================================================
*/

/********** 公用头文件 **********/
`include "nettype.h"
`include "stddef.h"
`include "global_config.h"

/********** 模块头文件 **********/
`include "bus.h"

/********** モジュール **********/
module bus (
	/********** クロック & リセット **********/
	input  wire				   clk,		   // クロック
	input  wire				   reset,	   // 非同期リセット
	/********** バスマスタ信号 **********/
	// バスマスタ共通信号
	output wire [`WordDataBus] m_rd_data,  // 読み出しデータ
	output wire				   m_rdy_,	   // レディ
	// バスマスタ0番
	input  wire				   m0_req_,	   // バスリクエスト
	input  wire [`WordAddrBus] m0_addr,	   // アドレス
	input  wire				   m0_as_,	   // アドレスストローブ
	input  wire				   m0_rw,	   // 読み／書き
	input  wire [`WordDataBus] m0_wr_data, // 書き込みデータ
	output wire				   m0_grnt_,   // バスグラント
	// バスマスタ1番
	input  wire				   m1_req_,	   // バスリクエスト
	input  wire [`WordAddrBus] m1_addr,	   // アドレス
	input  wire				   m1_as_,	   // アドレスストローブ
	input  wire				   m1_rw,	   // 読み／書き
	input  wire [`WordDataBus] m1_wr_data, // 書き込みデータ
	output wire				   m1_grnt_,   // バスグラント
	// バスマスタ2番
	input  wire				   m2_req_,	   // バスリクエスト
	input  wire [`WordAddrBus] m2_addr,	   // アドレス
	input  wire				   m2_as_,	   // アドレスストローブ
	input  wire				   m2_rw,	   // 読み／書き
	input  wire [`WordDataBus] m2_wr_data, // 書き込みデータ
	output wire				   m2_grnt_,   // バスグラント
	// バスマスタ3番
	input  wire				   m3_req_,	   // バスリクエスト
	input  wire [`WordAddrBus] m3_addr,	   // アドレス
	input  wire				   m3_as_,	   // アドレスストローブ
	input  wire				   m3_rw,	   // 読み／書き
	input  wire [`WordDataBus] m3_wr_data, // 書き込みデータ
	output wire				   m3_grnt_,   // バスグラント
	/********** バススレーブ信号 **********/
	// バススレーブ共通信号
	output wire [`WordAddrBus] s_addr,	   // アドレス
	output wire				   s_as_,	   // アドレスストローブ
	output wire				   s_rw,	   // 読み／書き
	output wire [`WordDataBus] s_wr_data,  // 書き込みデータ
	// バススレーブ0番
	input  wire [`WordDataBus] s0_rd_data, // 読み出しデータ
	input  wire				   s0_rdy_,	   // レディ
	output wire				   s0_cs_,	   // チップセレクト
	// バススレーブ1番
	input  wire [`WordDataBus] s1_rd_data, // 読み出しデータ
	input  wire				   s1_rdy_,	   // レディ
	output wire				   s1_cs_,	   // チップセレクト
	// バススレーブ2番
	input  wire [`WordDataBus] s2_rd_data, // 読み出しデータ
	input  wire				   s2_rdy_,	   // レディ
	output wire				   s2_cs_,	   // チップセレクト
	// バススレーブ3番
	input  wire [`WordDataBus] s3_rd_data, // 読み出しデータ
	input  wire				   s3_rdy_,	   // レディ
	output wire				   s3_cs_,	   // チップセレクト
	// バススレーブ4番
	input  wire [`WordDataBus] s4_rd_data, // 読み出しデータ
	input  wire				   s4_rdy_,	   // レディ
	output wire				   s4_cs_,	   // チップセレクト
	// バススレーブ5番
	input  wire [`WordDataBus] s5_rd_data, // 読み出しデータ
	input  wire				   s5_rdy_,	   // レディ
	output wire				   s5_cs_,	   // チップセレクト
	// バススレーブ6番
	input  wire [`WordDataBus] s6_rd_data, // 読み出しデータ
	input  wire				   s6_rdy_,	   // レディ
	output wire				   s6_cs_,	   // チップセレクト
	// バススレーブ7番
	input  wire [`WordDataBus] s7_rd_data, // 読み出しデータ
	input  wire				   s7_rdy_,	   // レディ
	output wire				   s7_cs_	   // チップセレクト
);

	/********** バスアービタ **********/
	bus_arbiter bus_arbiter (
		/********** クロック & リセット **********/
		.clk		(clk),		  // クロック
		.reset		(reset),	  // 非同期リセット
		/********** アービトレーション信号 **********/
		// バスマスタ0番
		.m0_req_	(m0_req_),	  // バスリクエスト
		.m0_grnt_	(m0_grnt_),	  // バスグラント
		// バスマスタ1番
		.m1_req_	(m1_req_),	  // バスリクエスト
		.m1_grnt_	(m1_grnt_),	  // バスグラント
		// バスマスタ2番
		.m2_req_	(m2_req_),	  // バスリクエスト
		.m2_grnt_	(m2_grnt_),	  // バスグラント
		// バスマスタ3番
		.m3_req_	(m3_req_),	  // バスリクエスト
		.m3_grnt_	(m3_grnt_)	  // バスグラント
	);

	/********** バスマスタマルチプレクサ **********/
	bus_master_mux bus_master_mux (
		/********** バスマスタ信号 **********/
		// バスマスタ0番
		.m0_addr	(m0_addr),	  // アドレス
		.m0_as_		(m0_as_),	  // アドレスストローブ
		.m0_rw		(m0_rw),	  // 読み／書き
		.m0_wr_data (m0_wr_data), // 書き込みデータ
		.m0_grnt_	(m0_grnt_),	  // バスグラント
		// バスマスタ1番
		.m1_addr	(m1_addr),	  // アドレス
		.m1_as_		(m1_as_),	  // アドレスストローブ
		.m1_rw		(m1_rw),	  // 読み／書き
		.m1_wr_data (m1_wr_data), // 書き込みデータ
		.m1_grnt_	(m1_grnt_),	  // バスグラント
		// バスマスタ2番
		.m2_addr	(m2_addr),	  // アドレス
		.m2_as_		(m2_as_),	  // アドレスストローブ
		.m2_rw		(m2_rw),	  // 読み／書き
		.m2_wr_data (m2_wr_data), // 書き込みデータ
		.m2_grnt_	(m2_grnt_),	  // バスグラント
		// バスマスタ3番
		.m3_addr	(m3_addr),	  // アドレス
		.m3_as_		(m3_as_),	  // アドレスストローブ
		.m3_rw		(m3_rw),	  // 読み／書き
		.m3_wr_data (m3_wr_data), // 書き込みデータ
		.m3_grnt_	(m3_grnt_),	  // バスグラント
		/********** バススレーブ共通信号 **********/
		.s_addr		(s_addr),	  // アドレス
		.s_as_		(s_as_),	  // アドレスストローブ
		.s_rw		(s_rw),		  // 読み／書き
		.s_wr_data	(s_wr_data)	  // 書き込みデータ
	);

	/********** アドレスデコーダ **********/
	bus_addr_dec bus_addr_dec (
		/********** アドレス **********/
		.s_addr		(s_addr),	  // アドレス
		/********** チップセレクト **********/
		.s0_cs_		(s0_cs_),	  // バススレーブ0番
		.s1_cs_		(s1_cs_),	  // バススレーブ1番
		.s2_cs_		(s2_cs_),	  // バススレーブ2番
		.s3_cs_		(s3_cs_),	  // バススレーブ3番
		.s4_cs_		(s4_cs_),	  // バススレーブ4番
		.s5_cs_		(s5_cs_),	  // バススレーブ5番
		.s6_cs_		(s6_cs_),	  // バススレーブ6番
		.s7_cs_		(s7_cs_)	  // バススレーブ7番
	);

	/********** バススレーブマルチプレクサ **********/
	bus_slave_mux bus_slave_mux (
		/********** チップセレクト **********/
		.s0_cs_		(s0_cs_),	  // バススレーブ0番
		.s1_cs_		(s1_cs_),	  // バススレーブ1番
		.s2_cs_		(s2_cs_),	  // バススレーブ2番
		.s3_cs_		(s3_cs_),	  // バススレーブ3番
		.s4_cs_		(s4_cs_),	  // バススレーブ4番
		.s5_cs_		(s5_cs_),	  // バススレーブ5番
		.s6_cs_		(s6_cs_),	  // バススレーブ6番
		.s7_cs_		(s7_cs_),	  // バススレーブ7番
		/********** バススレーブ信号 **********/
		// バススレーブ0番
		.s0_rd_data (s0_rd_data), // 読み出しデータ
		.s0_rdy_	(s0_rdy_),	  // レディ
		// バススレーブ1番
		.s1_rd_data (s1_rd_data), // 読み出しデータ
		.s1_rdy_	(s1_rdy_),	  // レディ
		// バススレーブ2番
		.s2_rd_data (s2_rd_data), // 読み出しデータ
		.s2_rdy_	(s2_rdy_),	  // レディ
		// バススレーブ3番
		.s3_rd_data (s3_rd_data), // 読み出しデータ
		.s3_rdy_	(s3_rdy_),	  // レディ
		// バススレーブ4番
		.s4_rd_data (s4_rd_data), // 読み出しデータ
		.s4_rdy_	(s4_rdy_),	  // レディ
		// バススレーブ5番
		.s5_rd_data (s5_rd_data), // 読み出しデータ
		.s5_rdy_	(s5_rdy_),	  // レディ
		// バススレーブ6番
		.s6_rd_data (s6_rd_data), // 読み出しデータ
		.s6_rdy_	(s6_rdy_),	  // レディ
		// バススレーブ7番
		.s7_rd_data (s7_rd_data), // 読み出しデータ
		.s7_rdy_	(s7_rdy_),	  // レディ
		/********** バスマスタ共通信号 **********/
		.m_rd_data	(m_rd_data),  // 読み出しデータ
		.m_rdy_		(m_rdy_)	  // レディ
	);

endmodule
