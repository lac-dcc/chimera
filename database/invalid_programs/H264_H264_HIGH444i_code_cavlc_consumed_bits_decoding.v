`include "timescale.v"
`include "define.v"

module cavlc_consumed_bits_decoding (cavlc_decoder_state,NumCoeffTrailingOnes_len,TrailingOnes,i_run,
	TotalCoeff,BitStream_buffer_output,zerosLeft,i_level,
	heading_one_pos,levelSuffixSize,total_zeros_len,run_of_zeros_len,cavlc_consumed_bits_len); 
	input [3:0] cavlc_decoder_state;
	input [4:0] NumCoeffTrailingOnes_len;
	input [15:0] BitStream_buffer_output;
	input [1:0] TrailingOnes;
	input [3:0] heading_one_pos;
	input [3:0] levelSuffixSize;
	input [3:0] total_zeros_len;
	input [3:0] run_of_zeros_len;
	input [3:0] i_run,zerosLeft,i_level;
	input [4:0] TotalCoeff;
	output reg [4:0] cavlc_consumed_bits_len;

	 
wire [4:0]	LevelSuffix_len ,RunOfZeros_len,LevelPrefix_len;
assign LevelSuffix_len = ({1'b0,i_level} == TotalCoeff - 5'b1) ?
				5'd0:{1'd0,heading_one_pos} + 5'b1 + {1'b0,levelSuffixSize};	
assign RunOfZeros_len = ({1'b0,i_run} == (TotalCoeff - 5'b1) || {1'b0,i_run} == (TotalCoeff - 5'd2) || zerosLeft == 0) ? 
				5'd0: {1'b0,run_of_zeros_len};	
		
assign LevelPrefix_len = {1'd0,heading_one_pos} + 5'b1 + {1'b0,levelSuffixSize};

always @ (cavlc_decoder_state or NumCoeffTrailingOnes_len  or TrailingOnes  or 
	total_zeros_len or run_of_zeros_len or LevelPrefix_len or LevelSuffix_len or RunOfZeros_len)
	case (cavlc_decoder_state)
	`NumCoeffTrailingOnes_LUT:cavlc_consumed_bits_len = NumCoeffTrailingOnes_len;
	`TrailingOnesSignFlag    :cavlc_consumed_bits_len = {3'b000,TrailingOnes};			 
	`LevelPrefix             :cavlc_consumed_bits_len = LevelPrefix_len;
	`LevelSuffix             :cavlc_consumed_bits_len = LevelSuffix_len;		 
	`total_zeros_LUT         :cavlc_consumed_bits_len = {1'b0,total_zeros_len};		 
	`run_before_LUT		 :cavlc_consumed_bits_len = {1'b0,run_of_zeros_len};	
	`RunOfZeros		 :cavlc_consumed_bits_len =	RunOfZeros_len;
	default			 :cavlc_consumed_bits_len = 0;
	endcase
endmodule

