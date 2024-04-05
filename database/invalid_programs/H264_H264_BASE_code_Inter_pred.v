`include "timescale.v"
`include "define.v"

module Inter_pred(
input clk,reset_n,
input [2:0] residual_inter_state,
input [3:0] slice_data_state,
input [4:0] intra4x4_pred_num,
input [3:0] mb_type_general,
input [3:0] mv_below8x8,
input mv_is16x16,
input [7:0] mb_num_h,mb_num_v,
input [7:0] pic_width_in_mbs_minus1, 
input [7:0] pic_height_in_map_units_minus1,
input [43:0] mvx_CurrMb0,mvx_CurrMb1,mvx_CurrMb2,mvx_CurrMb3,
input [43:0] mvy_CurrMb0,mvy_CurrMb1,mvy_CurrMb2,mvy_CurrMb3,
input [31:0] final_frame_luma_RAM_dout,final_frame_chroma_RAM_dout,
input data_valid,
input enable,

output ref_frame_luma_RAM_rd,ref_frame_chroma_RAM_rd,
output [19:0] final_frame_luma_rd_addr,
output [18:0] final_frame_chroma_rd_addr,
output reg Inter_end,

output reg [7:0] inter_pred_output_00,inter_pred_output_01,inter_pred_output_02,inter_pred_output_03,
output reg [7:0] inter_pred_output_10,inter_pred_output_11,inter_pred_output_12,inter_pred_output_13,
output reg [7:0] inter_pred_output_20,inter_pred_output_21,inter_pred_output_22,inter_pred_output_23,
output reg [7:0] inter_pred_output_30,inter_pred_output_31,inter_pred_output_32,inter_pred_output_33
);
parameter inter_rst = 2'b00;
parameter inter_read = 2'b01;
parameter inter_calculate = 2'b10;
parameter inter_trigger = 2'b11;




reg [1:0] state;
reg trigger_blk4x4_inter_pred;
wire [5:0] blk4x4_inter_preload_counter;
wire read_end;
wire [1:0] Inter_chroma2x2_counter;	
wire IsInterLuma,IsInterChroma,Is_InterChromaCopy;
wire [11:0] xInt_org_unclip;
wire [3:0] pos_FracL;
wire [2:0] xFracC,yFracC;
wire mv_below8x8_curr;
wire [7:0] LPE0_out,LPE1_out,LPE2_out,LPE3_out;
wire [7:0] CPE0_out,CPE1_out,CPE2_out,CPE3_out;
wire [7:0] Inter_pix_copy0,Inter_pix_copy1,Inter_pix_copy2,Inter_pix_copy3;
wire [3:0] blk4x4_inter_calculate_counter;
wire x_overflow,x_less_than_zero;
wire calulate_end;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		Inter_end <= 0;
	else if(intra4x4_pred_num == 16|| intra4x4_pred_num == 17)
		Inter_end <= 1;
	else if(residual_inter_state == `inter_pred_cavlc && (calulate_end||enable == 0))
		Inter_end <= 1;
	else if(residual_inter_state == `inter_idct)
		Inter_end <= 0;
	else if(residual_inter_state == `rst_residual_inter && 
		((slice_data_state == `residual && mb_type_general[3] == 0)||slice_data_state == `skip_run_duration))
		Inter_end <= 0;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		state <= inter_rst;
	else if(residual_inter_state == `inter_pred_cavlc && Inter_end == 0)
		case(state)
			inter_rst:      state<=enable ? inter_trigger:inter_rst;
			inter_trigger:  state<=inter_read;
			inter_read:	state<=read_end?inter_calculate:inter_read;
			inter_calculate:state<=calulate_end?inter_rst:inter_calculate;
			default:;
		endcase



always@(posedge clk or negedge reset_n)
	if (reset_n == 0)
		trigger_blk4x4_inter_pred <= 0;
	else if(residual_inter_state == `inter_pred_cavlc && state==inter_trigger)
		trigger_blk4x4_inter_pred <= 1;
	else
		trigger_blk4x4_inter_pred <= 0;

always@(posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		inter_pred_output_00 <= 0;inter_pred_output_01 <= 0;inter_pred_output_02 <= 0;inter_pred_output_03 <= 0;
		inter_pred_output_10 <= 0;inter_pred_output_11 <= 0;inter_pred_output_12 <= 0;inter_pred_output_13 <= 0;
		inter_pred_output_20 <= 0;inter_pred_output_21 <= 0;inter_pred_output_22 <= 0;inter_pred_output_23 <= 0;
		inter_pred_output_30 <= 0;inter_pred_output_31 <= 0;inter_pred_output_32 <= 0;inter_pred_output_33 <= 0;end
	else if (IsInterLuma && blk4x4_inter_calculate_counter != 0)
		case (pos_FracL)
		`pos_i,`pos_k:
			case(blk4x4_inter_calculate_counter)
			4'd7:begin
				inter_pred_output_00 <= LPE0_out;inter_pred_output_10 <= LPE1_out;
				inter_pred_output_20 <= LPE2_out;inter_pred_output_30 <= LPE3_out;end
			4'd5:begin
				inter_pred_output_01 <= LPE0_out;inter_pred_output_11 <= LPE1_out;
				inter_pred_output_21 <= LPE2_out;inter_pred_output_31 <= LPE3_out;end
			4'd3:begin
				inter_pred_output_02 <= LPE0_out;inter_pred_output_12 <= LPE1_out;
				inter_pred_output_22 <= LPE2_out;inter_pred_output_32 <= LPE3_out;end
			4'd1:begin
				inter_pred_output_03 <= LPE0_out;inter_pred_output_13 <= LPE1_out;
				inter_pred_output_23 <= LPE2_out;inter_pred_output_33 <= LPE3_out;end
			default:;
			endcase
		`pos_Int:
			case (blk4x4_inter_calculate_counter)
			4'd4:begin
				inter_pred_output_00 <= Inter_pix_copy0;inter_pred_output_10 <= Inter_pix_copy1;
				inter_pred_output_20 <= Inter_pix_copy2;inter_pred_output_30 <= Inter_pix_copy3;end
			4'd3:begin
				inter_pred_output_01 <= Inter_pix_copy0;inter_pred_output_11 <= Inter_pix_copy1;
				inter_pred_output_21 <= Inter_pix_copy2;inter_pred_output_31 <= Inter_pix_copy3;end
			4'd2:begin
				inter_pred_output_02 <= Inter_pix_copy0;inter_pred_output_12 <= Inter_pix_copy1;
				inter_pred_output_22 <= Inter_pix_copy2;inter_pred_output_32 <= Inter_pix_copy3;end
			4'd1:begin
				inter_pred_output_03 <= Inter_pix_copy0;inter_pred_output_13 <= Inter_pix_copy1;
				inter_pred_output_23 <= Inter_pix_copy2;inter_pred_output_33 <= Inter_pix_copy3;end
			default:;
			endcase
		default:
			case(blk4x4_inter_calculate_counter)
			4'd4:begin
				inter_pred_output_00 <= LPE0_out;inter_pred_output_10 <= LPE1_out;
				inter_pred_output_20 <= LPE2_out;inter_pred_output_30 <= LPE3_out;end
			4'd3:begin
				inter_pred_output_01 <= LPE0_out;inter_pred_output_11 <= LPE1_out;
				inter_pred_output_21 <= LPE2_out;inter_pred_output_31 <= LPE3_out;end
			4'd2:begin
				inter_pred_output_02 <= LPE0_out;inter_pred_output_12 <= LPE1_out;
				inter_pred_output_22 <= LPE2_out;inter_pred_output_32 <= LPE3_out;end
			4'd1:begin
				inter_pred_output_03 <= LPE0_out;inter_pred_output_13 <= LPE1_out;
				inter_pred_output_23 <= LPE2_out;inter_pred_output_33 <= LPE3_out;end
			default:;
			endcase	
		endcase
	else if (IsInterChroma && blk4x4_inter_calculate_counter != 0)
		case (mv_below8x8_curr)
		1:
			case (Inter_chroma2x2_counter)
			2'b11:begin
				inter_pred_output_00 <= (Is_InterChromaCopy)? Inter_pix_copy0:CPE0_out;
				inter_pred_output_01 <= (Is_InterChromaCopy)? Inter_pix_copy1:CPE1_out;
				inter_pred_output_10 <= (Is_InterChromaCopy)? Inter_pix_copy2:CPE2_out;
				inter_pred_output_11 <= (Is_InterChromaCopy)? Inter_pix_copy3:CPE3_out;end
			2'b10:begin
				inter_pred_output_02 <= (Is_InterChromaCopy)? Inter_pix_copy0:CPE0_out;
				inter_pred_output_03 <= (Is_InterChromaCopy)? Inter_pix_copy1:CPE1_out;
				inter_pred_output_12 <= (Is_InterChromaCopy)? Inter_pix_copy2:CPE2_out;
				inter_pred_output_13 <= (Is_InterChromaCopy)? Inter_pix_copy3:CPE3_out;end
			2'b01:begin
				inter_pred_output_20 <= (Is_InterChromaCopy)? Inter_pix_copy0:CPE0_out;
				inter_pred_output_21 <= (Is_InterChromaCopy)? Inter_pix_copy1:CPE1_out;
				inter_pred_output_30 <= (Is_InterChromaCopy)? Inter_pix_copy2:CPE2_out;
				inter_pred_output_31 <= (Is_InterChromaCopy)? Inter_pix_copy3:CPE3_out;end
			2'b00:begin
				inter_pred_output_22 <= (Is_InterChromaCopy)? Inter_pix_copy0:CPE0_out;
				inter_pred_output_23 <= (Is_InterChromaCopy)? Inter_pix_copy1:CPE1_out;
				inter_pred_output_32 <= (Is_InterChromaCopy)? Inter_pix_copy2:CPE2_out;
				inter_pred_output_33 <= (Is_InterChromaCopy)? Inter_pix_copy3:CPE3_out;end
			endcase
		0:
			case (blk4x4_inter_calculate_counter)
			4'd4:begin	
				inter_pred_output_00 <= (Is_InterChromaCopy)? Inter_pix_copy0:CPE0_out;
				inter_pred_output_01 <= (Is_InterChromaCopy)? Inter_pix_copy1:CPE1_out;
				inter_pred_output_10 <= (Is_InterChromaCopy)? Inter_pix_copy2:CPE2_out;
				inter_pred_output_11 <= (Is_InterChromaCopy)? Inter_pix_copy3:CPE3_out;end
			4'd3:begin
				inter_pred_output_02 <= (Is_InterChromaCopy)? Inter_pix_copy0:CPE0_out;
				inter_pred_output_03 <= (Is_InterChromaCopy)? Inter_pix_copy1:CPE1_out;
				inter_pred_output_12 <= (Is_InterChromaCopy)? Inter_pix_copy2:CPE2_out;
				inter_pred_output_13 <= (Is_InterChromaCopy)? Inter_pix_copy3:CPE3_out;end
			4'd2:begin
				inter_pred_output_20 <= (Is_InterChromaCopy)? Inter_pix_copy0:CPE0_out;
				inter_pred_output_21 <= (Is_InterChromaCopy)? Inter_pix_copy1:CPE1_out;
				inter_pred_output_30 <= (Is_InterChromaCopy)? Inter_pix_copy2:CPE2_out;
				inter_pred_output_31 <= (Is_InterChromaCopy)? Inter_pix_copy3:CPE3_out;end
			4'd1:begin
				inter_pred_output_22 <= (Is_InterChromaCopy)? Inter_pix_copy0:CPE0_out;
				inter_pred_output_23 <= (Is_InterChromaCopy)? Inter_pix_copy1:CPE1_out;
				inter_pred_output_32 <= (Is_InterChromaCopy)? Inter_pix_copy2:CPE2_out;
				inter_pred_output_33 <= (Is_InterChromaCopy)? Inter_pix_copy3:CPE3_out;end
			default:;
			endcase
		endcase




Inter_read Inter_read(
	.clk(clk),.reset_n(reset_n),
	.state(state),
	.intra4x4_pred_num(intra4x4_pred_num),
	.mb_type_general(mb_type_general),
	.mv_below8x8(mv_below8x8),.mv_is16x16(mv_is16x16),
	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),
	.trigger_blk4x4_inter_pred(trigger_blk4x4_inter_pred),
	.blk4x4_inter_calculate_counter(blk4x4_inter_calculate_counter),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.mvx_CurrMb0(mvx_CurrMb0),.mvx_CurrMb1(mvx_CurrMb1),
	.mvx_CurrMb2(mvx_CurrMb2),.mvx_CurrMb3(mvx_CurrMb3),
	.mvy_CurrMb0(mvy_CurrMb0),.mvy_CurrMb1(mvy_CurrMb1),
	.mvy_CurrMb2(mvy_CurrMb2),.mvy_CurrMb3(mvy_CurrMb3),
	.data_valid(data_valid),
	.IsInterLuma(IsInterLuma),.IsInterChroma(IsInterChroma),.Is_InterChromaCopy(Is_InterChromaCopy),
	.blk4x4_inter_preload_counter(blk4x4_inter_preload_counter),
	.xInt_org_unclip(xInt_org_unclip),
	.Inter_chroma2x2_counter(Inter_chroma2x2_counter),	
	.ref_frame_luma_RAM_rd(ref_frame_luma_RAM_rd),.ref_frame_chroma_RAM_rd(ref_frame_chroma_RAM_rd),
	.final_frame_luma_rd_addr(final_frame_luma_rd_addr),
	.final_frame_chroma_rd_addr(final_frame_chroma_rd_addr),
	.pos_FracL(pos_FracL),.xFracC(xFracC),.yFracC(yFracC),
	.x_overflow(x_overflow),.x_less_than_zero(x_less_than_zero),
	.mv_below8x8_curr(mv_below8x8_curr),
	.read_end(read_end)
);

Inter_calculate Inter_calculate(
	.clk(clk),.reset_n(reset_n),
	.blk4x4_inter_preload_counter(blk4x4_inter_preload_counter),
	.Inter_chroma2x2_counter(Inter_chroma2x2_counter),	
	.intra4x4_pred_num(intra4x4_pred_num),
	.final_frame_luma_RAM_dout(final_frame_luma_RAM_dout),
	.final_frame_chroma_RAM_dout(final_frame_chroma_RAM_dout),.data_valid(data_valid),
	.IsInterLuma(IsInterLuma),.IsInterChroma(IsInterChroma),
	.Is_InterChromaCopy(Is_InterChromaCopy),
	.xInt_org_unclip_1to0(xInt_org_unclip[1:0]),
	.pos_FracL(pos_FracL),.xFracC(xFracC),.yFracC(yFracC),
	.mv_below8x8_curr(mv_below8x8_curr),
	.trigger_blk4x4_inter_pred(trigger_blk4x4_inter_pred),
	.x_overflow(x_overflow),.x_less_than_zero(x_less_than_zero),
	
	.blk4x4_inter_calculate_counter(blk4x4_inter_calculate_counter),
	.LPE0_out(LPE0_out),.LPE1_out(LPE1_out),.LPE2_out(LPE2_out),.LPE3_out(LPE3_out),
	.CPE0_out(CPE0_out),.CPE1_out(CPE1_out),.CPE2_out(CPE2_out),.CPE3_out(CPE3_out),
	.Inter_pix_copy0(Inter_pix_copy0),.Inter_pix_copy1(Inter_pix_copy1),
	.Inter_pix_copy2(Inter_pix_copy2),.Inter_pix_copy3(Inter_pix_copy3),
	.calulate_end(calulate_end)

);

endmodule
