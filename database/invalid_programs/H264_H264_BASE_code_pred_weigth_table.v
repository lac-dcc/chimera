`include "timescale.v"
`include "define.v"

module pred_weigth_table(
input clk,reset_n,
input [15:0] BitStream_buffer_output,
input [10:0] exp_golomb_decoding_output,
input [4:0] pred_weight_table_state,
input [4:0] intra4x4_pred_num,
input [3:0] ref_idx_l0_curr,ref_idx_l1_curr,

output reg luma_weight_l0_flag,chroma_weight_l0_flag,
output reg luma_weight_l1_flag,chroma_weight_l1_flag,

output [2:0] logWD,
output reg [7:0] pred_weight_table_w0,pred_weight_table_w1,
output reg [7:0] pred_weight_table_o0,pred_weight_table_o1

);

reg [2:0] luma_log2_weight_denom,chroma_log2_weight_denom;
reg [7:0] luma_weight_l0,luma_offset_l0,luma_weight_l1,luma_offset_l1;

reg [7:0] chroma_weight_l0_j0,chroma_weight_l0_j1,chroma_weight_l1_j0,chroma_weight_l1_j1;
reg [7:0] chroma_offset_l0_j0,chroma_offset_l0_j1,chroma_offset_l1_j0,chroma_offset_l1_j1;


reg [7:0] luma_weight_l0_r [15:0] ;
reg [7:0] luma_offset_l0_r [15:0] ;
reg [7:0] luma_weight_l1_r [15:0] ;
reg [7:0] luma_offset_l1_r [15:0] ;
reg [7:0] chroma_weight_l0_j0_r [15:0] ;
reg [7:0] chroma_weight_l0_j1_r [15:0] ;
reg [7:0] chroma_weight_l1_j0_r [15:0] ;
reg [7:0] chroma_weight_l1_j1_r [15:0] ;
reg [7:0] chroma_offset_l0_j0_r [15:0] ;
reg [7:0] chroma_offset_l0_j1_r [15:0] ;
reg [7:0] chroma_offset_l1_j0_r [15:0] ;
reg [7:0] chroma_offset_l1_j1_r [15:0] ;

assign logWD = intra4x4_pred_num[4] ? chroma_log2_weight_denom:luma_log2_weight_denom;



always@(luma_weight_l0_flag or luma_log2_weight_denom or chroma_log2_weight_denom or intra4x4_pred_num 
	  or ref_idx_l0_curr or chroma_weight_l0_flag)
	if(intra4x4_pred_num[4] == 0)
		pred_weight_table_w0 = luma_weight_l0_flag ? luma_weight_l0_r[ref_idx_l0_curr]:1 << luma_log2_weight_denom;
	else if(intra4x4_pred_num < 22)
		pred_weight_table_w0 = chroma_weight_l0_flag ? chroma_weight_l0_j0_r[ref_idx_l0_curr]:1 << chroma_log2_weight_denom;
	else    pred_weight_table_w0 = chroma_weight_l0_flag ? chroma_weight_l0_j1_r[ref_idx_l0_curr]:1 << chroma_log2_weight_denom;
		


always@(luma_weight_l0_flag or chroma_weight_l0_flag or intra4x4_pred_num or ref_idx_l0_curr)
	if(intra4x4_pred_num[4] == 0)
		pred_weight_table_o0 = luma_weight_l0_flag ? luma_offset_l0_r[ref_idx_l0_curr]:0;
	else if(intra4x4_pred_num < 22)
		pred_weight_table_o0 = chroma_weight_l0_flag ? chroma_offset_l0_j0_r[ref_idx_l0_curr]:0;
	else	pred_weight_table_o0 = chroma_weight_l0_flag ? chroma_offset_l0_j1_r[ref_idx_l0_curr]:0;



always@(luma_weight_l1_flag or luma_log2_weight_denom or chroma_log2_weight_denom or intra4x4_pred_num or 
	ref_idx_l1_curr or chroma_weight_l1_flag)
	if(intra4x4_pred_num[4] == 0)
		pred_weight_table_w1 = luma_weight_l1_flag ? luma_weight_l1_r[ref_idx_l1_curr]:1 << luma_log2_weight_denom;
	else if(intra4x4_pred_num < 22)
		pred_weight_table_w1 = chroma_weight_l1_flag ? chroma_weight_l1_j0_r[ref_idx_l1_curr]:1 << chroma_log2_weight_denom;
	else    pred_weight_table_w1 = chroma_weight_l1_flag ? chroma_weight_l1_j1_r[ref_idx_l1_curr]:1 << chroma_log2_weight_denom;


always@(luma_weight_l1_flag or chroma_weight_l1_flag or intra4x4_pred_num or ref_idx_l1_curr)
	if(intra4x4_pred_num[4] == 0)
		pred_weight_table_o1 = luma_weight_l1_flag ? luma_offset_l1_r[ref_idx_l1_curr]:0;
	else if(intra4x4_pred_num < 22)
		pred_weight_table_o1 = chroma_weight_l1_flag ? chroma_offset_l1_j0_r[ref_idx_l1_curr]:0;
	else	pred_weight_table_o1 = chroma_weight_l1_flag ? chroma_offset_l1_j1_r[ref_idx_l1_curr]:0;


always@(pred_weight_table_state or BitStream_buffer_output or exp_golomb_decoding_output or reset_n)
	if (reset_n == 0)begin
		luma_log2_weight_denom = 0; chroma_log2_weight_denom = 0;
		luma_weight_l0_flag = 0;    chroma_weight_l0_flag = 0;
		luma_weight_l1_flag = 0;    chroma_weight_l1_flag = 0;
		luma_weight_l0 = 0;	    luma_offset_l0 = 0;
		luma_weight_l1 = 0;	    luma_offset_l1 = 0;
		chroma_weight_l0_j0 = 0;    chroma_weight_l0_j1 = 0;
		chroma_weight_l1_j0 = 0;    chroma_weight_l1_j1 = 0;
		chroma_offset_l0_j0 = 0;    chroma_offset_l0_j1 = 0;
		chroma_offset_l1_j0 = 0;    chroma_offset_l1_j1 = 0;end
	else case(pred_weight_table_state)
		`luma_log2_weight_denom:	luma_log2_weight_denom = exp_golomb_decoding_output[2:0];
		`chroma_log2_weight_denom:	chroma_log2_weight_denom = exp_golomb_decoding_output[2:0];
		`luma_weight_l0_flag:		luma_weight_l0_flag = BitStream_buffer_output[15];
		`luma_weight_l0:		luma_weight_l0 = exp_golomb_decoding_output[7:0];
		`luma_offset_l0:		luma_offset_l0 = exp_golomb_decoding_output[7:0];
		`chroma_weight_l0_flag:		chroma_weight_l0_flag = BitStream_buffer_output[15];
		`chroma_weight_l0_j0:		chroma_weight_l0_j0 = exp_golomb_decoding_output[7:0];
		`chroma_offset_l0_j0:		chroma_offset_l0_j0 = exp_golomb_decoding_output[7:0];
		`chroma_weight_l0_j1:		chroma_weight_l0_j1 = exp_golomb_decoding_output[7:0];
		`chroma_offset_l0_j1:		chroma_offset_l0_j1 = exp_golomb_decoding_output[7:0];
		`luma_weight_l1_flag:		luma_weight_l1_flag = BitStream_buffer_output[15];
		`luma_weight_l1:		luma_weight_l1 = exp_golomb_decoding_output[7:0];
		`luma_offset_l1:		luma_offset_l1 = exp_golomb_decoding_output[7:0];
		`chroma_weight_l1_flag:		chroma_weight_l1_flag = BitStream_buffer_output[15];
		`chroma_weight_l1_j0:		chroma_weight_l1_j0 = exp_golomb_decoding_output[7:0];
		`chroma_offset_l1_j0:		chroma_offset_l1_j0 = exp_golomb_decoding_output[7:0];
		`chroma_weight_l1_j1:		chroma_weight_l1_j1 = exp_golomb_decoding_output[7:0];
		`chroma_offset_l1_j1:		chroma_offset_l1_j1 = exp_golomb_decoding_output[7:0];
		default:;
		endcase
	
		
reg [3:0] i_l0,i_l1;
always@(posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		i_l0 <= 0;	i_l1 <= 0;end
	else if(pred_weight_table_state == `chroma_log2_weight_denom)begin
		i_l0 <= 0;	i_l1 <= 0;end
	else if(pred_weight_table_state == `luma_weight_l0_flag)
		i_l0 <= i_l0 + 1 ;
	else if(pred_weight_table_state == `luma_weight_l1_flag)
		i_l1 <= i_l1 + 1 ;
	
always@(posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		luma_weight_l0_r [0] <= 0; luma_offset_l0_r [0] <= 0;
		luma_weight_l1_r [0] <= 0; luma_offset_l1_r [0] <= 0;
		chroma_weight_l0_j0_r [0] <= 0; chroma_offset_l0_j0_r [0] <= 0;
		chroma_weight_l0_j1_r [0] <= 0; chroma_offset_l0_j1_r [0] <= 0;
		chroma_weight_l1_j0_r [0] <= 0; chroma_offset_l1_j0_r [0] <= 0;
		chroma_weight_l1_j1_r [0] <= 0; chroma_offset_l1_j1_r [0] <= 0;end
	else case(pred_weight_table_state)
		`luma_weight_l0:	luma_weight_l0_r [i_l0 - 1] <= luma_weight_l0;
		`luma_offset_l0:	luma_offset_l0_r [i_l0 - 1] <= luma_offset_l0;
		`chroma_weight_l0_j0:	chroma_weight_l0_j0_r [i_l0 - 1] <= chroma_weight_l0_j0;
		`chroma_offset_l0_j0:	chroma_offset_l0_j0_r [i_l0 - 1] <= chroma_offset_l0_j0;
		`chroma_weight_l0_j1:	chroma_weight_l0_j1_r [i_l0 - 1] <= chroma_weight_l0_j1;
		`chroma_offset_l0_j1:	chroma_offset_l0_j1_r [i_l0 - 1] <= chroma_offset_l0_j1;
		`luma_weight_l1:	luma_weight_l1_r [i_l1 - 1] <= luma_weight_l1;
		`luma_offset_l1:	luma_offset_l1_r [i_l1 - 1] <= luma_offset_l1;
		`chroma_weight_l1_j0:	chroma_weight_l1_j0_r [i_l1 - 1] <= chroma_weight_l1_j0;
		`chroma_offset_l1_j0:	chroma_offset_l1_j0_r [i_l1 - 1] <= chroma_offset_l1_j0;
		`chroma_weight_l1_j1:	chroma_weight_l1_j1_r [i_l1 - 1] <= chroma_weight_l1_j1;
		`chroma_offset_l1_j1:	chroma_offset_l1_j1_r [i_l1 - 1] <= chroma_offset_l1_j1;
		default:;
		endcase


endmodule
