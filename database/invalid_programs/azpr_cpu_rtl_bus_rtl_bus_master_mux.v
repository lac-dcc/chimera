/*
 -- ============================================================================
 -- FILE NAME	: bus_master_mux.v
 -- DESCRIPTION : 总线主控多路复用器实现
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  2011/06/27  suito		 新規作成
 -- ============================================================================
*/

/********** 通用头文件 **********/
`include "nettype.h"
`include "stddef.h"
`include "global_config.h"

/********** 模块头文件 **********/
`include "bus.h"

/********** 模块 **********/
module bus_master_mux (
	/********** 输入输出信号 **********/
	// 0号总线主控
	input  wire [`WordAddrBus] m0_addr,	   // 地址
	input  wire				   m0_as_,	   // 地址选通
	input  wire				   m0_rw,	   // 读/写
	input  wire [`WordDataBus] m0_wr_data, // 写入的数据
	input  wire				   m0_grnt_,   // 赋予总线
	// 1号总线主控
	input  wire [`WordAddrBus] m1_addr,	   // 地址
	input  wire				   m1_as_,	   // 地址选通
	input  wire				   m1_rw,	   // 读/写
	input  wire [`WordDataBus] m1_wr_data, // 写入的数据
	input  wire				   m1_grnt_,   // 赋予总线
	// 3号总线主控
	input  wire [`WordAddrBus] m2_addr,	   // 地址
	input  wire				   m2_as_,	   // 地址选通
	input  wire				   m2_rw,	   // 读/写
	input  wire [`WordDataBus] m2_wr_data, // 写入的数据
	input  wire				   m2_grnt_,   // 赋予总线
	// 3号总线主控
	input  wire [`WordAddrBus] m3_addr,	   // 地址
	input  wire				   m3_as_,	   // 地址选通
	input  wire				   m3_rw,	   // 读/写
	input  wire [`WordDataBus] m3_wr_data, // 写入的数据
	input  wire				   m3_grnt_,   // 赋予总线
	/********** 共享信号总线从属 **********/
	output reg	[`WordAddrBus] s_addr,	   // 地址
	output reg				   s_as_,	   // 地址选通
	output reg				   s_rw,	   // 读/写
	output reg	[`WordDataBus] s_wr_data   // 写入的数据
);

	/********** 总线主控多路复用器 **********/
	always @(*) begin
		/* 选择持有总线使用权的主控 */
		if (m0_grnt_ == `ENABLE_) begin			 // 0号总线总控
			s_addr	  = m0_addr;
			s_as_	  = m0_as_;
			s_rw	  = m0_rw;
			s_wr_data = m0_wr_data;
		end else if (m1_grnt_ == `ENABLE_) begin // 1号总线总控
			s_addr	  = m1_addr;
			s_as_	  = m1_as_;
			s_rw	  = m1_rw;
			s_wr_data = m1_wr_data;
		end else if (m2_grnt_ == `ENABLE_) begin // 2号总线总控
			s_addr	  = m2_addr;
			s_as_	  = m2_as_;
			s_rw	  = m2_rw;
			s_wr_data = m2_wr_data;
		end else if (m3_grnt_ == `ENABLE_) begin // 3号总线总控
			s_addr	  = m3_addr;
			s_as_	  = m3_as_;
			s_rw	  = m3_rw;
			s_wr_data = m3_wr_data;
		end else begin							 // 默认值
			s_addr	  = `WORD_ADDR_W'h0;
			s_as_	  = `DISABLE_;
			s_rw	  = `READ;
			s_wr_data = `WORD_DATA_W'h0;
		end
	end

endmodule
