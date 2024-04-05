`include "timescale.v"
`include "define.v"

module cavlc_decoder (clk,reset_n,
	cavlc_decoder_state,
	i_level,i_run,i_TotalCoeff,coeffNum,
	heading_one_pos,BitStream_buffer_output,
	suffix_length_initialized,IsRunLoop,mb_num_h,mb_num_v,
	TC_dout,currMB_availA,currMB_availB,intra4x4_pred_num,intra16_pred_num,
	residual_intra4x4_state,residual_intra16_state,residual_inter_state,
	
	end_of_one_residual_block,end_of_NonZeroCoeff_CAVLC,
	cavlc_consumed_bits_len,TotalCoeff,TrailingOnes,zerosLeft,run,
	coeffLevel_0,coeffLevel_1,coeffLevel_2, coeffLevel_3, coeffLevel_4, coeffLevel_5, coeffLevel_6, coeffLevel_7,
	coeffLevel_8,coeffLevel_9,coeffLevel_10,coeffLevel_11,coeffLevel_12,coeffLevel_13,coeffLevel_14,coeffLevel_15,
	TC_rd_addr,cavlc_nc_end);
	input clk,reset_n;
	input [3:0] cavlc_decoder_state;
	input [3:0] i_level;
	input [3:0] i_run;
	input [3:0] i_TotalCoeff;
	input [3:0] coeffNum;
	input [3:0] heading_one_pos;
	input [15:0] BitStream_buffer_output; 
	input suffix_length_initialized;
	input IsRunLoop;
	input [7:0] mb_num_h;
	input [7:0] mb_num_v;
	
	input [4:0] TC_dout;
	input currMB_availA,currMB_availB;
	input [4:0] intra4x4_pred_num,intra16_pred_num;
	input [2:0] residual_intra4x4_state,residual_intra16_state,residual_inter_state;
	output end_of_one_residual_block;
	output end_of_NonZeroCoeff_CAVLC;
	output [4:0] cavlc_consumed_bits_len;
	output [4:0] TotalCoeff;
	output [1:0] TrailingOnes;
	output [3:0] zerosLeft;
	output [3:0] run;
	output [15:0] coeffLevel_0, coeffLevel_1, coeffLevel_2,coeffLevel_3, coeffLevel_4, coeffLevel_5, coeffLevel_6;
	output [15:0] coeffLevel_7, coeffLevel_8, coeffLevel_9,coeffLevel_10,coeffLevel_11,coeffLevel_12,coeffLevel_13;
	output [15:0] coeffLevel_14,coeffLevel_15;
	
	output [12:0] TC_rd_addr;
	output cavlc_nc_end;

	
	wire [4:0] NumCoeffTrailingOnes_len;
	wire [3:0] levelSuffixSize;
	wire [15:0] level_0,level_1,level_2, level_3, level_4, level_5, level_6, level_7;
	wire [15:0] level_8,level_9,level_10,level_11,level_12,level_13,level_14,level_15;
	wire [3:0] total_zeros;
	wire [3:0] total_zeros_len;
	wire [3:0] run_of_zeros_len;
	wire [4:0] nC;
	
	nC_decoding nC_decoding(
		.clk(clk),
		.reset_n(reset_n),
    	  	.currMB_availA(currMB_availA),.currMB_availB(currMB_availB),
	  	.cavlc_decoder_state(cavlc_decoder_state),
	  	.TotalCoeff(TotalCoeff),
          	.intra4x4_pred_num(intra4x4_pred_num),.intra16_pred_num(intra16_pred_num),
	  	.residual_intra4x4_state(residual_intra4x4_state),
	  	.residual_intra16_state(residual_intra16_state),.residual_inter_state(residual_inter_state),
	  	.TC_dout(TC_dout),
	  	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),
          	.TC_rd_addr(TC_rd_addr),
         	.cavlc_nc_end(cavlc_nc_end),
	  	.nC(nC)
	);

	NumCoeffTrailingOnes_decoding NumCoeffTrailingOnes_decoding(
		.clk(clk),
		.reset_n(reset_n),
		.cavlc_decoder_state(cavlc_decoder_state),
		.heading_one_pos(heading_one_pos),
		.BitStream_buffer_output(BitStream_buffer_output),
		.nC(nC),
		.TrailingOnes(TrailingOnes),
		.TotalCoeff(TotalCoeff),
		.NumCoeffTrailingOnes_len(NumCoeffTrailingOnes_len)
		);
	level_decoding level_decoding(
		.clk(clk),
		.reset_n(reset_n),
		.cavlc_decoder_state(cavlc_decoder_state),
		.heading_one_pos(heading_one_pos),
		.suffix_length_initialized(suffix_length_initialized),
		.i_level(i_level),
		.TotalCoeff(TotalCoeff),
		.TrailingOnes(TrailingOnes),
		.BitStream_buffer_output(BitStream_buffer_output),
		.levelSuffixSize(levelSuffixSize),
		.level_0(level_0),
		.level_1(level_1),
		.level_2(level_2),
		.level_3(level_3),
		.level_4(level_4),
		.level_5(level_5),
		.level_6(level_6),
		.level_7(level_7),
		.level_8(level_8),
		.level_9(level_9),
		.level_10(level_10),
		.level_11(level_11),
		.level_12(level_12),
		.level_13(level_13),
		.level_14(level_14),
		.level_15(level_15)
		);
	total_zeros_decoding total_zeros_decoding(
		.clk(clk),
		.reset_n(reset_n),
		.cavlc_decoder_state(cavlc_decoder_state),
		.TotalCoeff_3to0(TotalCoeff[3:0]),
		.heading_one_pos(heading_one_pos),
		.BitStream_buffer_output(BitStream_buffer_output),
		.intra4x4_pred_num(intra4x4_pred_num),.intra16_pred_num(intra16_pred_num),
		.total_zeros(total_zeros),
		.total_zeros_len(total_zeros_len)
		);
	run_decoding run_decoding(
		.clk(clk),
		.reset_n(reset_n),
		.cavlc_decoder_state(cavlc_decoder_state),
		.BitStream_buffer_output(BitStream_buffer_output),
		.total_zeros(total_zeros),
		.level_0(level_0),
		.level_1(level_1),
		.level_2(level_2),
		.level_3(level_3),
		.level_4(level_4),
		.level_5(level_5),
		.level_6(level_6),
		.level_7(level_7),
		.level_8(level_8),
		.level_9(level_9),
		.level_10(level_10),
		.level_11(level_11),
		.level_12(level_12),
		.level_13(level_13),
		.level_14(level_14),
		.level_15(level_15),
		.TotalCoeff(TotalCoeff),
		.i_run(i_run),
		.i_TotalCoeff(i_TotalCoeff),
		.coeffNum(coeffNum),
		.IsRunLoop(IsRunLoop),
		
		.run_of_zeros_len(run_of_zeros_len),
		.zerosLeft(zerosLeft),
		.run(run),
		.coeffLevel_0(coeffLevel_0),
		.coeffLevel_1(coeffLevel_1),
		.coeffLevel_2(coeffLevel_2), 
		.coeffLevel_3(coeffLevel_3),
		.coeffLevel_4(coeffLevel_4), 
		.coeffLevel_5(coeffLevel_5), 
		.coeffLevel_6(coeffLevel_6),
		.coeffLevel_7(coeffLevel_7),
		.coeffLevel_8(coeffLevel_8),
		.coeffLevel_9(coeffLevel_9),
		.coeffLevel_10(coeffLevel_10),
		.coeffLevel_11(coeffLevel_11),
		.coeffLevel_12(coeffLevel_12),
		.coeffLevel_13(coeffLevel_13),
		.coeffLevel_14(coeffLevel_14),
		.coeffLevel_15(coeffLevel_15)
		);
	end_of_blk_decoding end_of_blk_decoding(
		.reset_n(reset_n),
		.cavlc_decoder_state(cavlc_decoder_state),
		.TotalCoeff(TotalCoeff),
		.i_TotalCoeff(i_TotalCoeff),
		.end_of_one_residual_block(end_of_one_residual_block),
		.end_of_NonZeroCoeff_CAVLC(end_of_NonZeroCoeff_CAVLC)
		);
	cavlc_consumed_bits_decoding cavlc_consumed_bits_decoding(
		.cavlc_decoder_state(cavlc_decoder_state),
		.NumCoeffTrailingOnes_len(NumCoeffTrailingOnes_len),
		.TrailingOnes(TrailingOnes),
		.heading_one_pos(heading_one_pos),
		.levelSuffixSize(levelSuffixSize),
		.total_zeros_len(total_zeros_len),
		.run_of_zeros_len(run_of_zeros_len),
		.cavlc_consumed_bits_len(cavlc_consumed_bits_len)
		);
endmodule
