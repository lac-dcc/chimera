`include "timescale.v"
`include "define.v"

module cavlc_decoder (
input clk,reset_n,
input [3:0] cavlc_decoder_state,
input [3:0] i_level,i_run,i_TotalCoeff,
input [3:0] heading_one_pos,
input [15:0] BitStream_buffer_output,
input [31:0] BitStream_buffer_output_ex32,
input [7:0] mb_num_h,mb_num_v,
input [4:0] TC_A_dout,TC_B_dout,
input [5:0] intra16_pred_num,
input [1:0] chroma_i8x8,chroma_i4x4,
input [1:0] slice_data_state,

input [1:0] residual_intra16_state,
input cavlc_end_r,res_0,

output end_of_NonZeroCoeff_CAVLC,
output [4:0] cavlc_consumed_bits_len,
output [4:0] TotalCoeff,
output [1:0] TrailingOnes,
output [3:0] zerosLeft,
output [15:0] coeffLevel_0, coeffLevel_1, coeffLevel_2,coeffLevel_3, coeffLevel_4, coeffLevel_5, coeffLevel_6,
output [15:0] coeffLevel_7, coeffLevel_8, coeffLevel_9,coeffLevel_10,coeffLevel_11,coeffLevel_12,coeffLevel_13,
output [15:0] coeffLevel_14,coeffLevel_15,
	
output  [5:0] TC_A_rd_addr,
output  [12:0] TC_B_rd_addr,
output TC_rd_n
);

	
wire [4:0] NumCoeffTrailingOnes_len;
wire [3:0] levelSuffixSize;
wire [15:0] level_0,level_1,level_2, level_3, level_4, level_5, level_6, level_7;
wire [15:0] level_8,level_9,level_10,level_11,level_12,level_13,level_14,level_15;
wire [3:0] total_zeros,total_zeros_len,run_of_zeros_len;
wire [4:0] nC;
wire nC_0to2,nC_2to4,nC_4to8,nC_n1;
wire [4:0] TotalCoeff_reg;
wire [1:0] TrailingOnes_reg;
	
nC_decoding nC_decoding(
	.clk(clk),.reset_n(reset_n),
	.cavlc_decoder_state(cavlc_decoder_state),
	.slice_data_state(slice_data_state),
	.TotalCoeff(TotalCoeff),
   .intra16_pred_num(intra16_pred_num),
	.chroma_i8x8(chroma_i8x8),.chroma_i4x4(chroma_i4x4),
	.residual_intra16_state(residual_intra16_state),
	.cavlc_end_r(cavlc_end_r),.res_0(res_0),
	.TC_A_dout(TC_A_dout),.TC_B_dout(TC_B_dout),
	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),
	.TC_A_rd_addr(TC_A_rd_addr),.TC_B_rd_addr(TC_B_rd_addr),
	.TC_rd_n(TC_rd_n),.nC(nC),
	.nC_0to2(nC_0to2),.nC_2to4(nC_2to4),
	.nC_4to8(nC_4to8),.nC_n1(nC_n1)
);

NumCoeffTrailingOnes_decoding NumCoeffTrailingOnes_decoding(
	.clk(clk),.reset_n(reset_n),
	.cavlc_decoder_state(cavlc_decoder_state),
	.heading_one_pos(heading_one_pos),
	.BitStream_buffer_output(BitStream_buffer_output),
	.nC(nC),
	.nC_0to2(nC_0to2),.nC_2to4(nC_2to4),
	.nC_4to8(nC_4to8),.nC_n1(nC_n1),
	.TrailingOnes(TrailingOnes),.TrailingOnes_reg(TrailingOnes_reg),
	.TotalCoeff(TotalCoeff),.TotalCoeff_reg(TotalCoeff_reg),
	.NumCoeffTrailingOnes_len(NumCoeffTrailingOnes_len)
);

level_decoding level_decoding(
	.clk(clk),.reset_n(reset_n),
	.cavlc_decoder_state(cavlc_decoder_state),
	.heading_one_pos(heading_one_pos),
	.i_level(i_level),.TotalCoeff(TotalCoeff_reg),
	.TrailingOnes(TrailingOnes_reg),
	.BitStream_buffer_output(BitStream_buffer_output),
	.BitStream_buffer_output_ex32(BitStream_buffer_output_ex32),
	.levelSuffixSize(levelSuffixSize),
	.level_0(level_0),.level_1(level_1),.level_2(level_2),.level_3(level_3),
	.level_4(level_4),.level_5(level_5),.level_6(level_6),.level_7(level_7),
	.level_8(level_8),.level_9(level_9),.level_10(level_10),.level_11(level_11),
	.level_12(level_12),.level_13(level_13),.level_14(level_14),.level_15(level_15)
);

total_zeros_decoding total_zeros_decoding(
	.clk(clk),.reset_n(reset_n),
	.cavlc_decoder_state(cavlc_decoder_state),
	.TotalCoeff_3to0(TotalCoeff[3:0]),
	.heading_one_pos(heading_one_pos),
	.BitStream_buffer_output(BitStream_buffer_output),
	.intra16_pred_num(intra16_pred_num),
	.total_zeros(total_zeros),
	.total_zeros_len(total_zeros_len)
);

run_decoding run_decoding(
	.clk(clk),.reset_n(reset_n),
	.cavlc_decoder_state(cavlc_decoder_state),
	.BitStream_buffer_output(BitStream_buffer_output),
	.total_zeros(total_zeros),
	.level_0(level_0),.level_1(level_1),.level_2(level_2),.level_3(level_3),
	.level_4(level_4),.level_5(level_5),.level_6(level_6),.level_7(level_7),
	.level_8(level_8),.level_9(level_9),.level_10(level_10),.level_11(level_11),
	.level_12(level_12),.level_13(level_13),.level_14(level_14),.level_15(level_15),
	.TotalCoeff(TotalCoeff),
	.i_run(i_run),.i_TotalCoeff(i_TotalCoeff),
		
	.run_of_zeros_len(run_of_zeros_len),
	.zerosLeft(zerosLeft),
	.coeffLevel_0(coeffLevel_0),.coeffLevel_1(coeffLevel_1),
	.coeffLevel_2(coeffLevel_2),.coeffLevel_3(coeffLevel_3),
	.coeffLevel_4(coeffLevel_4),.coeffLevel_5(coeffLevel_5), 
	.coeffLevel_6(coeffLevel_6),.coeffLevel_7(coeffLevel_7),
	.coeffLevel_8(coeffLevel_8),.coeffLevel_9(coeffLevel_9),
	.coeffLevel_10(coeffLevel_10),.coeffLevel_11(coeffLevel_11),
	.coeffLevel_12(coeffLevel_12),.coeffLevel_13(coeffLevel_13),
	.coeffLevel_14(coeffLevel_14),.coeffLevel_15(coeffLevel_15)
);
	
end_of_blk_decoding end_of_blk_decoding(
	.reset_n(reset_n),
	.cavlc_decoder_state(cavlc_decoder_state),
	.TotalCoeff(TotalCoeff),
	.i_TotalCoeff(i_TotalCoeff),
	.end_of_NonZeroCoeff_CAVLC(end_of_NonZeroCoeff_CAVLC)
);

cavlc_consumed_bits_decoding cavlc_consumed_bits_decoding(
	.cavlc_decoder_state(cavlc_decoder_state),
	.BitStream_buffer_output(BitStream_buffer_output),
	.NumCoeffTrailingOnes_len(NumCoeffTrailingOnes_len),
	.TrailingOnes(TrailingOnes),
	.i_run(i_run),.zerosLeft(zerosLeft),.i_level(i_level),
	.TotalCoeff(TotalCoeff),
	.heading_one_pos(heading_one_pos),
	.levelSuffixSize(levelSuffixSize),
	.total_zeros_len(total_zeros_len),
	.run_of_zeros_len(run_of_zeros_len),
	.cavlc_consumed_bits_len(cavlc_consumed_bits_len)
	);
endmodule
