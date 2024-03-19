// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//   GPU用シェーダー演算ソース側制御
//
//                                 Copyright (C) 2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// 乗算＋アキミュレーター
module jelly_gpu_alu_mul_acm
		(
			input	wire					reset,
			input	wire					clk,
			
			input	wire	[31:0]			s_src0,
			input	wire	[31:0]			s_src1,
			input	wire					s_operation,
			input	wire					s_last,
			input	wire					s_valid,
			output	wire					s_ready,
			
			output	wire	[31:0]			m_dst,
			output	wire					m_valid,
			input	wire					m_ready
		);
	
	wire	[31:0]		mul_src0;
	wire	[31:0]		mul_src1;
	wire	[31:0]		mul_tdata;
	wire				mul_tlast;
	wire				mul_tvalid;
	wire				mul_tready;
	
	assign mul_src0[31:0] = s_src0[31:0];
	
	assign mul_src1[31]   = s_src1[31] ^ s_operation;
	assign mul_src1[30:0] = s_src1[30:0];
	
	jelly_gpu_float_mul
		i_gpu_float_mul
			(
				.aclk					(clk),
				.aresetn				(~reset),
				
				.s_axis_a_tdata			(mul_src0),
				.s_axis_a_tlast			(s_last),
				.s_axis_a_tvalid		(s_valid),
				.s_axis_a_tready		(s_ready),
				
				.s_axis_b_tdata			(mul_src1),
				.s_axis_b_tvalid		(s_valid),
				.s_axis_b_tready		(),
				
				.m_axis_result_tdata	(mul_tdata),
				.m_axis_result_tlast	(mul_tlast),
				.m_axis_result_tvalid	(mul_tvalid),
				.m_axis_result_tready	(mul_tready)
			);
	
	
	wire				acm_tlast;
	wire				acm_tvalid;
	wire				acm_tready;
	
	jelly_gpu_float_acm
		i_gpu_float_acm
			(
				.aclk					(clk),
				.aresetn				(~reset),
				
				.s_axis_a_tdata			(mul_tvalid ? mul_tdata : 32'd0),
				.s_axis_a_tlast			(mul_tvalid ? mul_tlast : 1'b1),
				.s_axis_a_tvalid		(mul_tvalid),
				.s_axis_a_tready		(mul_tready),
				
				.m_axis_result_tdata	(m_dst),
				.m_axis_result_tlast	(acm_tlast),
				.m_axis_result_tvalid	(acm_tvalid),
				.m_axis_result_tready	(acm_tready)
			);
	
	assign acm_tready = acm_tlast ? m_ready : 1'b1;
	
	assign m_valid    = (acm_tvalid & acm_tlast);
	
	
endmodule


`default_nettype wire


// end of file
