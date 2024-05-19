// This program was cloned from: https://github.com/zhangly/azpr_cpu
// License: MIT License

/*
 -- ============================================================================
 -- FILE NAME	: bus_addr_dec.v
 -- DESCRIPTION : 总线地址解码器模块，基于总线总控输出的地址信号，判断要访问哪个从属设备，地址的高3位表示不同的从属
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  2011/06/27  suito		 新規作成
 -- ============================================================================
*/

/********** 公共头文件 **********/
`include "nettype.h"
`include "stddef.h"
`include "global_config.h"

/********** 模块头文件 **********/
`include "bus.h"

/********** 地址解码器模块 **********/
module bus_addr_dec (
	/********** 地址 **********/
	input  wire [`WordAddrBus] s_addr, // 总线总控提供的地址信号
	/********** 输出片选信号 **********/
	output reg				   s0_cs_, // 0号总线从属片选信号
	output reg				   s1_cs_, // 1号总线从属片选信号
	output reg				   s2_cs_, // 2号总线从属片选信号
	output reg				   s3_cs_, // 3号总线从属片选信号
	output reg				   s4_cs_, // 4号总线从属片选信号
	output reg				   s5_cs_, // 5号总线从属片选信号
	output reg				   s6_cs_, // 6号总线从属片选信号
	output reg				   s7_cs_  // 7号总线从属片选信号
);

	/********** 总线从属索引 **********/
	wire [`BusSlaveIndexBus] s_index = s_addr[`BusSlaveIndexLoc]; // 取地址中高3位表示的从属号

	/********** 总线从属多路复用器**********/
	always @(*) begin
		/* 初始化片选信号 */
		s0_cs_ = `DISABLE_;
		s1_cs_ = `DISABLE_;
		s2_cs_ = `DISABLE_;
		s3_cs_ = `DISABLE_;
		s4_cs_ = `DISABLE_;
		s5_cs_ = `DISABLE_;
		s6_cs_ = `DISABLE_;
		s7_cs_ = `DISABLE_;
		/* 选择地址对应的从属 */
		case (s_index)
			`BUS_SLAVE_0 : begin // 0号总线从属
				s0_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_1 : begin // 1号总线从属
				s1_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_2 : begin // 2号总线从属
				s2_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_3 : begin // 0号总线从属
				s3_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_4 : begin // 4号总线从属
				s4_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_5 : begin // 5号总线从属
				s5_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_6 : begin // 6号总线从属
				s6_cs_	= `ENABLE_;
			end
			`BUS_SLAVE_7 : begin // 7号总线从属
				s7_cs_	= `ENABLE_;
			end
		endcase
	end

endmodule
