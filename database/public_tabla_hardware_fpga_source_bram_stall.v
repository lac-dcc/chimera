// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
`ifdef FPGA
	`include "inst.vh"
`endif

module bram_stall 
#(
	parameter srcNum = 3
)
(
	input data_out_v,
	input weight_out_v,
	input gradient_out_v,
	input meta_out_v,
		
	input [(1 << srcNum) - 1 : 0] src0_decoder_out,
	input [(1 << srcNum) - 1 : 0] src1_decoder_out,
		
	input inst_valid,
	
	output src0_v_bram, src1_v_bram,
		
	output inst_stall_bram
	
);	

	wire src0_rq_bram, src1_rq_bram;
	
	wire [ 1 : 0] srcDataInV, srcWeightInV, srcGradientInV, srcMetaInV;
	
	assign srcDataInV = {2{data_out_v}} & { src1_decoder_out[`NAMESPACE_DATA], src0_decoder_out[`NAMESPACE_DATA]};
	assign srcWeightInV = {2{weight_out_v}} & { src1_decoder_out[`NAMESPACE_WEIGHT], src0_decoder_out[`NAMESPACE_WEIGHT]};
//	assign srcGradientInV = {2{gradient_out_v}} & {src1_decoder_out[`NAMESPACE_GRADIENT], src0_decoder_out[`NAMESPACE_GRADIENT]};
	assign srcMetaInV = {2{meta_out_v}} & {src1_decoder_out[`NAMESPACE_META], src0_decoder_out[`NAMESPACE_META]};
	
	assign src0_v_bram = (srcDataInV[0] || srcWeightInV[0]  || srcMetaInV[0]) && inst_valid;
	assign src1_v_bram = (srcDataInV[1] || srcWeightInV[1]  || srcMetaInV[1]) && inst_valid;
	
	assign src0_rq_bram = src0_decoder_out[`NAMESPACE_DATA] || src0_decoder_out[`NAMESPACE_WEIGHT]  || src0_decoder_out[`NAMESPACE_META];
	assign src1_rq_bram = src1_decoder_out[`NAMESPACE_DATA] || src1_decoder_out[`NAMESPACE_WEIGHT]  || src1_decoder_out[`NAMESPACE_META];

	assign inst_stall_bram =  ((src0_rq_bram && ~src0_v_bram) || (src1_rq_bram && ~src1_v_bram)) && inst_valid;
	
endmodule