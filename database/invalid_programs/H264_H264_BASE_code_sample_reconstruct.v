`include "timescale.v"
`include "define.v"

module sample_reconstruct(
input clk,reset_n,
input [3:0] mb_type_general,
input [15:0] intra_pred_4x4_00,intra_pred_4x4_01,intra_pred_4x4_02,intra_pred_4x4_03,
input [15:0] intra_pred_4x4_10,intra_pred_4x4_11,intra_pred_4x4_12,intra_pred_4x4_13,
input [15:0] intra_pred_4x4_20,intra_pred_4x4_21,intra_pred_4x4_22,intra_pred_4x4_23,
input [15:0] intra_pred_4x4_30,intra_pred_4x4_31,intra_pred_4x4_32,intra_pred_4x4_33,
input [15:0] intra_pred_16_00,intra_pred_16_01,intra_pred_16_02,intra_pred_16_03,
input [15:0] intra_pred_16_10,intra_pred_16_11,intra_pred_16_12,intra_pred_16_13,
input [15:0] intra_pred_16_20,intra_pred_16_21,intra_pred_16_22,intra_pred_16_23,
input [15:0] intra_pred_16_30,intra_pred_16_31,intra_pred_16_32,intra_pred_16_33,
input [15:0] inter_pred_output_00,inter_pred_output_01,inter_pred_output_02,inter_pred_output_03,
input [15:0] inter_pred_output_10,inter_pred_output_11,inter_pred_output_12,inter_pred_output_13,
input [15:0] inter_pred_output_20,inter_pred_output_21,inter_pred_output_22,inter_pred_output_23,
input [15:0] inter_pred_output_30,inter_pred_output_31,inter_pred_output_32,inter_pred_output_33,

input [4:0] intra4x4_pred_num,intra16_pred_num,
input [15:0] twod_output_00,twod_output_01,twod_output_02,twod_output_03,
input [15:0] twod_output_10,twod_output_11,twod_output_12,twod_output_13,
input [15:0] twod_output_20,twod_output_21,twod_output_22,twod_output_23,
input [15:0] twod_output_30,twod_output_31,twod_output_32,twod_output_33,
input [2:0] residual_intra4x4_state,residual_intra16_state,residual_inter_state,


output reg [15:0] img_4x4_00,img_4x4_01,img_4x4_02,img_4x4_03,img_4x4_10,img_4x4_11,img_4x4_12,img_4x4_13,
output reg [15:0] img_4x4_20,img_4x4_21,img_4x4_22,img_4x4_23,img_4x4_30,img_4x4_31,img_4x4_32,img_4x4_33

);

wire [15:0] img_00_reg,img_01_reg,img_02_reg,img_03_reg;
wire [15:0] img_10_reg,img_11_reg,img_12_reg,img_13_reg;
wire [15:0] img_20_reg,img_21_reg,img_22_reg,img_23_reg;
wire [15:0] img_30_reg,img_31_reg,img_32_reg,img_33_reg;
wire [15:0] intra_pred_00,intra_pred_01,intra_pred_02,intra_pred_03;
wire [15:0] intra_pred_10,intra_pred_11,intra_pred_12,intra_pred_13;
wire [15:0] intra_pred_20,intra_pred_21,intra_pred_22,intra_pred_23;
wire [15:0] intra_pred_30,intra_pred_31,intra_pred_32,intra_pred_33;
wire [15:0] pred_00,pred_01,pred_02,pred_03,pred_10,pred_11,pred_12,pred_13;
wire [15:0] pred_20,pred_21,pred_22,pred_23,pred_30,pred_31,pred_32,pred_33;
wire intra16chroma,is_intra;
assign intra16chroma = intra16_pred_num[4]==1&&intra16_pred_num!=5'b11111;
assign is_intra = mb_type_general[3] == 1;
assign intra_pred_00 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_00:intra_pred_16_00;
assign intra_pred_01 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_01:intra_pred_16_01;
assign intra_pred_02 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_02:intra_pred_16_02;
assign intra_pred_03 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_03:intra_pred_16_03;
assign intra_pred_10 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_10:intra_pred_16_10;
assign intra_pred_11 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_11:intra_pred_16_11;
assign intra_pred_12 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_12:intra_pred_16_12;
assign intra_pred_13 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_13:intra_pred_16_13;
assign intra_pred_20 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_20:intra_pred_16_20;
assign intra_pred_21 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_21:intra_pred_16_21;
assign intra_pred_22 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_22:intra_pred_16_22;
assign intra_pred_23 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_23:intra_pred_16_23;
assign intra_pred_30 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_30:intra_pred_16_30;
assign intra_pred_31 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_31:intra_pred_16_31;
assign intra_pred_32 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_32:intra_pred_16_32;
assign intra_pred_33 = (residual_intra4x4_state != `rst_residual_intra4x4||intra16chroma)?intra_pred_4x4_33:intra_pred_16_33;

assign pred_00 = is_intra?intra_pred_00:inter_pred_output_00;
assign pred_01 = is_intra?intra_pred_01:inter_pred_output_01;
assign pred_02 = is_intra?intra_pred_02:inter_pred_output_02;
assign pred_03 = is_intra?intra_pred_03:inter_pred_output_03;
assign pred_10 = is_intra?intra_pred_10:inter_pred_output_10;
assign pred_11 = is_intra?intra_pred_11:inter_pred_output_11;
assign pred_12 = is_intra?intra_pred_12:inter_pred_output_12;
assign pred_13 = is_intra?intra_pred_13:inter_pred_output_13;
assign pred_20 = is_intra?intra_pred_20:inter_pred_output_20;
assign pred_21 = is_intra?intra_pred_21:inter_pred_output_21;
assign pred_22 = is_intra?intra_pred_22:inter_pred_output_22;
assign pred_23 = is_intra?intra_pred_23:inter_pred_output_23;
assign pred_30 = is_intra?intra_pred_30:inter_pred_output_30;
assign pred_31 = is_intra?intra_pred_31:inter_pred_output_31;
assign pred_32 = is_intra?intra_pred_32:inter_pred_output_32;
assign pred_33 = is_intra?intra_pred_33:inter_pred_output_33;

function [15:0] reconstruct;
	input [15:0] idct;
	input [15:0] pred;
	reg [15:0] b;
	begin 
		
		b = idct+pred;
		reconstruct = (b[15])?0:(b<16'd255)?b:16'd255;
	end
endfunction

assign img_00_reg = reconstruct(twod_output_00,pred_00);
assign img_01_reg = reconstruct(twod_output_01,pred_01);
assign img_02_reg = reconstruct(twod_output_02,pred_02);
assign img_03_reg = reconstruct(twod_output_03,pred_03);
assign img_10_reg = reconstruct(twod_output_10,pred_10);
assign img_11_reg = reconstruct(twod_output_11,pred_11);
assign img_12_reg = reconstruct(twod_output_12,pred_12);
assign img_13_reg = reconstruct(twod_output_13,pred_13);
assign img_20_reg = reconstruct(twod_output_20,pred_20);
assign img_21_reg = reconstruct(twod_output_21,pred_21);
assign img_22_reg = reconstruct(twod_output_22,pred_22);
assign img_23_reg = reconstruct(twod_output_23,pred_23);
assign img_30_reg = reconstruct(twod_output_30,pred_30);
assign img_31_reg = reconstruct(twod_output_31,pred_31);
assign img_32_reg = reconstruct(twod_output_32,pred_32);
assign img_33_reg = reconstruct(twod_output_33,pred_33);

always@(posedge clk or negedge reset_n)
  	if (reset_n == 1'b0)begin
    		img_4x4_00 <= 0;img_4x4_01 <= 0;img_4x4_02 <= 0;img_4x4_03 <= 0;
    		img_4x4_10 <= 0;img_4x4_11 <= 0;img_4x4_12 <= 0;img_4x4_13 <= 0;
    		img_4x4_20 <= 0;img_4x4_21 <= 0;img_4x4_22 <= 0;img_4x4_23 <= 0;
    		img_4x4_30 <= 0;img_4x4_31 <= 0;img_4x4_32 <= 0;img_4x4_33 <= 0;end
	else if(residual_intra4x4_state == `intra4x4_sum||residual_intra16_state == `intra16_sum||residual_inter_state == `inter_sum)begin
    		img_4x4_00 <= img_00_reg;img_4x4_01 <= img_01_reg;img_4x4_02 <= img_02_reg;img_4x4_03 <= img_03_reg;
    		img_4x4_10 <= img_10_reg;img_4x4_11 <= img_11_reg;img_4x4_12 <= img_12_reg;img_4x4_13 <= img_13_reg;
    		img_4x4_20 <= img_20_reg;img_4x4_21 <= img_21_reg;img_4x4_22 <= img_22_reg;img_4x4_23 <= img_23_reg;
    		img_4x4_30 <= img_30_reg;img_4x4_31 <= img_31_reg;img_4x4_32 <= img_32_reg;img_4x4_33 <= img_33_reg;end

endmodule
