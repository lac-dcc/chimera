`include "timescale.v"
`include "define.v"

module QP_decoding ( 
	input clk,reset_n,
	input [4:0] slice_header_state,
	input [3:0] slice_data_state,
	input [5:0] pic_init_qp_minus26,
	input [5:0] exp_golomb_decoding_output_5to0,
	input [4:0] chroma_qp_index_offset,
	output reg [5:0] QPy,
	output reg [5:0] QPc
	);
	
	always @ (posedge clk)
		if (reset_n == 0)
			QPy <= 0;
		else if (slice_header_state == `slice_qp_delta_s)
			QPy <= 26 + pic_init_qp_minus26 + exp_golomb_decoding_output_5to0;
		else if (slice_data_state == `mb_qp_delta_s)
			QPy <= QPy + exp_golomb_decoding_output_5to0;
			
	wire [6:0] QPi;
	assign QPi = {1'b0,QPy} + {chroma_qp_index_offset[4],chroma_qp_index_offset[4],chroma_qp_index_offset};
	always @ (posedge clk)
		if (reset_n == 0)
			QPc <= 0;
		else
			begin
				if (QPi[6] == 1)
					QPc <= 0;
				else if (QPi < 30)
					QPc <= QPi[5:0];
				else
					case (QPi)
						30      :QPc <= 29;
						31      :QPc <= 30;
						32      :QPc <= 31;
						33,34   :QPc <= 32;
						35      :QPc <= 33;
						36,37   :QPc <= 34;
						38,39   :QPc <= 35;
						40,41   :QPc <= 36;
						42,43,44:QPc <= 37;
						45,46,47:QPc <= 38;
						default :QPc <= 39;
					endcase
			end
endmodule
						
