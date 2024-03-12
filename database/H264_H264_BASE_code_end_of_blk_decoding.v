`include "timescale.v"
`include "define.v"

module end_of_blk_decoding (reset_n,cavlc_decoder_state,
	TotalCoeff,i_TotalCoeff,end_of_one_residual_block,end_of_NonZeroCoeff_CAVLC
   	);
	input reset_n;
	input [3:0] cavlc_decoder_state;
	input [4:0] TotalCoeff;
	input [3:0] i_TotalCoeff;
	output end_of_one_residual_block;
	output end_of_NonZeroCoeff_CAVLC;
	
	reg end_of_one_residual_block;
	reg end_of_NonZeroCoeff_CAVLC;
	reg lumaDC_IsAllZero;
	reg ChromaDC_Cb_IsAllZero;
	reg ChromaDC_Cr_IsAllZero;
		
	always @ (reset_n or cavlc_decoder_state or TotalCoeff or i_TotalCoeff)
		if (reset_n == 0)
			end_of_one_residual_block = 0;
		else if (cavlc_decoder_state == `NumCoeffTrailingOnes_LUT && TotalCoeff == 0)
			end_of_one_residual_block = 1;
		else if (cavlc_decoder_state == `LevelRunCombination && i_TotalCoeff == 0)
			end_of_one_residual_block = 1;
		else
			end_of_one_residual_block = 0;
			
	always @ (reset_n or cavlc_decoder_state or i_TotalCoeff)
		if (reset_n == 0)
			end_of_NonZeroCoeff_CAVLC = 0;
		else if (cavlc_decoder_state == `LevelRunCombination && i_TotalCoeff == 0)
			end_of_NonZeroCoeff_CAVLC = 1;
		else
			end_of_NonZeroCoeff_CAVLC = 0;		
			      		
endmodule
