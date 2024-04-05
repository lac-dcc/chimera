`include "timescale.v"
`include "define.v"

module Picidx_decoding(
input clk,reset_n,
input [1:0] nal_ref_idc,
input [4:0] nal_unit_type,
input [2:0] slice_type,
input long_term_reference_flag,adaptive_ref_pic_marking_mode_flag,
input [3:0] log2_max_frame_num_minus4,
input [4:0] slice_header_state,
input [3:0] slice_data_state,
input [2:0] ref_pic_list_reordering_state,dec_ref_pic_marking_state,
input [3:0] mb_type_general,
input [3:0] frame_num,
input [15:0] POC,
input [3:0] num_ref_idx_l0_active_minus1_curr,num_ref_idx_l1_active_minus1_curr,
input [4:0] intra4x4_pred_num,
input [19:0] refIdxL0_curr,refIdxL1_curr,    
input [3:0] predFlagL0_curr,predFlagL1_curr,
input luma_ram_w,chroma_ram_w,
input ref_L0_luma_RAM_rd,ref_L1_luma_RAM_rd,
input ref_L0_chroma_RAM_rd,ref_L1_chroma_RAM_rd,
input [19:0] frame_L0_luma_rd_addr,frame_L1_luma_rd_addr,luma_ram_addr,
input [18:0] frame_L0_chroma_rd_addr,frame_L1_chroma_rd_addr,chroma_ram_addr,
input ao_valid_luma_L0,ao_valid_luma_L1,ao_valid_chroma_L0,ao_valid_chroma_L1,
input [4:0] abs_diff_pic_num_minus1,
input [3:0] long_term_pic_num_reordering,
input [3:0] difference_of_pic_nums_minus1,long_term_pic_num,long_term_frame_idx,
input [2:0] memory_management_control_operation,
input direct_spatial_mv_pred_flag,reordering_of_pic_nums_idc_l1,
input [1:0] reordering_of_pic_nums_idc,
input end_of_lastMB_DF,

output refbuild_end,
output data_valid_L0,data_valid_L1,
output reg enable_L0,enable_L1,
output reg [3:0] ref_idx_l0_curr,ref_idx_l1_curr,
output [21:0] ref_luma_wr_addr,ref_luma_rd_addr_l0,ref_luma_rd_addr_l1,
output [20:0] ref_chroma_wr_addr,ref_chroma_rd_addr_l0,ref_chroma_rd_addr_l1,

output [1:0] td,tb,
output cal_abs_diff_end,cal_long_term_end
);



parameter rst_refbuild_state     = 3'b000;
parameter refbuild_state_p_short = 3'b010;
parameter refbuild_state_p_long  = 3'b011;
parameter refbuild_state_b_short = 3'b001;
parameter refbuild_state_b_long  = 3'b101;
parameter refbuild_state_end     = 3'b110;


reg [2:0] refbuild_state;

	
reg [1:0] pic_ref_flag [15:0];
reg [3:0] long_term_idx [15:0];
reg [3:0] frame_long,long_term_frame_idx_reg;
reg long_term_flag;


always@(posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		pic_ref_flag[0] <= `pic_flag_not_ref;
		long_term_flag <= 0;end
	else if(nal_ref_idc == 0)
		pic_ref_flag[frame_num] <= `pic_flag_not_ref;
	else if(nal_unit_type == 5'b00101 && dec_ref_pic_marking_state == `no_output_of_prior_pics_flag_2_long_term_reference_flag)begin
		pic_ref_flag[frame_num] <= long_term_reference_flag ? `pic_flag_long : `pic_flag_short;
		long_term_idx[0] <= frame_num;end
	else if(dec_ref_pic_marking_state == `adaptive_ref_pic_marking_mode_flag_s && adaptive_ref_pic_marking_mode_flag == 0)
		pic_ref_flag[frame_num] <= `pic_flag_short;
	else if(dec_ref_pic_marking_state == `difference_of_pic_nums_minus1_s)
		pic_ref_flag[(frame_num - difference_of_pic_nums_minus1 - 4'b1)] <= 
			memory_management_control_operation == 3 ? `pic_flag_long:`pic_flag_not_ref;
	else if(dec_ref_pic_marking_state == `long_term_pic_num_s)
		pic_ref_flag[long_term_idx[long_term_pic_num]] <= `pic_flag_not_ref;
	else if(dec_ref_pic_marking_state == `long_term_frame_idx_s && memory_management_control_operation == 3)
		long_term_idx[long_term_frame_idx] <= (frame_num - difference_of_pic_nums_minus1 - 4'b1);
	else if(dec_ref_pic_marking_state == `long_term_frame_idx_s && memory_management_control_operation == 6)begin
		long_term_flag <= 1; 	frame_long <= frame_num;
		long_term_frame_idx_reg <= long_term_frame_idx;end
	else if(end_of_lastMB_DF && long_term_flag)begin
		long_term_flag <= 0;
		long_term_idx[long_term_frame_idx_reg] <= frame_long;end
		
	
reg [4:0] FrameNum,FrameNumWrap,PicNum;

wire [15:0] max_frame_num;

assign max_frame_num = 15;// 5'b1<<((log2_max_frame_num_minus4+4'd4)) - 1;

reg [3:0] RefPicList0 [15:0];
reg [3:0] RefPicList1 [15:0];

reg [15:0] poc_frame_num [15:0];

always@(posedge clk or negedge reset_n)
	if(reset_n == 0)
		poc_frame_num[0] <= 0;
	else if(slice_header_state == `slice_header_refbuild && refbuild_state == rst_refbuild_state && nal_ref_idc != 0)
		poc_frame_num[frame_num] <= POC;


reg frame_num_full;
always@(posedge clk or negedge reset_n)
	if(reset_n == 0)
		frame_num_full <= 0;
	else if(frame_num == max_frame_num[3:0])
		frame_num_full <= 1;


wire [3:0] cycle_ref;
assign cycle_ref = frame_num_full == 1?max_frame_num[3:0]:frame_num;

wire frame_num_less;
assign frame_num_less = frame_num_full == 0 && (frame_num < (num_ref_idx_l0_active_minus1_curr+1));

reg [3:0] i_cycle_ref;
always@(posedge clk or negedge reset_n)
	if(reset_n == 0)
		i_cycle_ref <= 0;
	else if(refbuild_state == refbuild_state_p_short || refbuild_state == refbuild_state_p_long || 
		refbuild_state == refbuild_state_b_short || refbuild_state == refbuild_state_b_long)
		if(i_cycle_ref == cycle_ref - 1)
			i_cycle_ref <= 0;
		else	i_cycle_ref <= i_cycle_ref + 1;


always@(posedge clk or negedge reset_n)
	if(reset_n == 0)
		refbuild_state <= rst_refbuild_state;
	else if(slice_header_state == `slice_header_refbuild)
		case(refbuild_state)
		rst_refbuild_state:refbuild_state <= slice_type == `slice_type_b ? refbuild_state_b_short :
						     slice_type == `slice_type_p ? refbuild_state_p_short : rst_refbuild_state;
		refbuild_state_p_short:refbuild_state <= i_cycle_ref == (cycle_ref-1)?refbuild_state_p_long:refbuild_state_p_short;
		refbuild_state_p_long :refbuild_state <= i_cycle_ref == (cycle_ref-1)?refbuild_state_end:refbuild_state_p_long;

		refbuild_state_b_short:refbuild_state <= i_cycle_ref == (cycle_ref-1)?refbuild_state_b_long:refbuild_state_b_short;
		refbuild_state_b_long :refbuild_state <= i_cycle_ref == (cycle_ref-1)?refbuild_state_end:refbuild_state_b_long;
		refbuild_state_end:refbuild_state <= rst_refbuild_state;
		default:refbuild_state <= rst_refbuild_state;
		endcase

assign refbuild_end = refbuild_state == refbuild_state_end;


reg [1:0] cal_reordering_pic_num_state;
reg [3:0] abs_diff_pic_num_refIdxLX;
reg [3:0] i_move;

always@(posedge clk or negedge reset_n)
	if(reset_n == 0)
		cal_reordering_pic_num_state <= `rst_cal_reordering_pic_num;   //cal_abs_diff_pic_num_state
	else if(ref_pic_list_reordering_state == `cal_abs_diff_pic_num || ref_pic_list_reordering_state == `cal_long_term_pic_num)
		case(cal_reordering_pic_num_state)
		`rst_cal_reordering_pic_num:
			cal_reordering_pic_num_state <= `cal_reordering_pic_num_move;
		`cal_reordering_pic_num_move:
			cal_reordering_pic_num_state <= (i_move == abs_diff_pic_num_refIdxLX )?
				`cal_reordering_pic_num_ass:`cal_reordering_pic_num_move;
		`cal_reordering_pic_num_ass:
			cal_reordering_pic_num_state <= `cal_reordering_pic_num_end;
		`cal_reordering_pic_num_end:
			cal_reordering_pic_num_state <= `rst_cal_reordering_pic_num;
		default:;
		endcase

assign cal_abs_diff_end = cal_reordering_pic_num_state == `cal_reordering_pic_num_end && ref_pic_list_reordering_state == `cal_abs_diff_pic_num;
assign cal_long_term_end = cal_reordering_pic_num_state == `cal_reordering_pic_num_end && ref_pic_list_reordering_state == `cal_long_term_pic_num;







reg [3:0] picNumL0Pred;
reg [4:0] picNumL0NoWrap;

always@(posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		abs_diff_pic_num_refIdxLX <= 0;
		picNumL0Pred <= 0;end
	else if(ref_pic_list_reordering_state == `ref_pic_list_reordering_flag_l0_s || 
		ref_pic_list_reordering_state == `ref_pic_list_reordering_flag_l1_s )begin
		abs_diff_pic_num_refIdxLX <= 0;
		picNumL0Pred <= frame_num;end
	else if(cal_reordering_pic_num_state == `cal_reordering_pic_num_end && ref_pic_list_reordering_state == `cal_abs_diff_pic_num)begin
		abs_diff_pic_num_refIdxLX <= abs_diff_pic_num_refIdxLX + 1;
		picNumL0Pred <= picNumL0NoWrap[3:0];end
	else if(cal_reordering_pic_num_state == `cal_reordering_pic_num_end)
		abs_diff_pic_num_refIdxLX <= abs_diff_pic_num_refIdxLX + 1;

wire [4:0] picNumL0Pred_sub_absdiff,picNumL0Pred_add_absdiff;

assign picNumL0Pred_sub_absdiff = {1'b0,picNumL0Pred} - abs_diff_pic_num_minus1 - 1;
assign picNumL0Pred_add_absdiff = {1'b0,picNumL0Pred} + abs_diff_pic_num_minus1 + 1;

always@(reordering_of_pic_nums_idc or picNumL0Pred or picNumL0Pred_sub_absdiff or picNumL0Pred_add_absdiff )
	if(reordering_of_pic_nums_idc == 0)begin
		if(picNumL0Pred_sub_absdiff[4] == 1)
			picNumL0NoWrap = picNumL0Pred_sub_absdiff + 5'd16;
		else    picNumL0NoWrap = picNumL0Pred_sub_absdiff;end
	else if(reordering_of_pic_nums_idc == 1)begin
		if(picNumL0Pred_add_absdiff[4] == 1)
			picNumL0NoWrap = picNumL0Pred_add_absdiff - 5'd16;
		else	picNumL0NoWrap = picNumL0Pred_add_absdiff;end
			


always@(posedge clk or negedge reset_n)
	if(reset_n == 0)
		i_move <= 0;
	else if(ref_pic_list_reordering_state == `ref_pic_list_reordering_flag_l0_s)
		i_move <= num_ref_idx_l0_active_minus1_curr;
	else if(ref_pic_list_reordering_state == `ref_pic_list_reordering_flag_l1_s)
		i_move <= num_ref_idx_l1_active_minus1_curr;
	else if(cal_reordering_pic_num_state == `cal_reordering_pic_num_move && reordering_of_pic_nums_idc_l1 == 0)
		i_move <= (i_move == abs_diff_pic_num_refIdxLX ) ? 
			num_ref_idx_l0_active_minus1_curr : i_move - 1;
	else if(cal_reordering_pic_num_state == `cal_reordering_pic_num_move && reordering_of_pic_nums_idc_l1 == 1)
		i_move <= (i_move == abs_diff_pic_num_refIdxLX ) ? 
			num_ref_idx_l1_active_minus1_curr : i_move - 1;
		


reg [3:0] i_list0,i_list1;

always@(posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		RefPicList0 [0] <= 0;
		i_list0 <= 0;	i_list1 <= 0;end
	else if(refbuild_state == rst_refbuild_state && slice_header_state == `slice_header_refbuild)begin
		i_list0 <= 0;	i_list1 <= 0;end
	else if(refbuild_state == refbuild_state_p_short)begin
		if(pic_ref_flag[frame_num - i_cycle_ref - 4'b1] == `pic_flag_short)begin
			RefPicList0 [i_list0] <= frame_num - i_cycle_ref - 4'b1;
			i_list0 <= i_list0 + 1;end
		end
	else if(refbuild_state == refbuild_state_p_long)begin
		if(pic_ref_flag[frame_num - i_cycle_ref - 4'b1] == `pic_flag_long)begin
			RefPicList0 [i_list0] <= frame_num - i_cycle_ref - 4'b1;
			i_list0 <= i_list0 + 1;end
		end
	else if(refbuild_state == refbuild_state_b_short)begin
		if(pic_ref_flag[frame_num - i_cycle_ref - 4'b1] == `pic_flag_short)begin
			if(poc_frame_num[(frame_num - i_cycle_ref - 4'b1)] < POC)begin
				RefPicList0[i_list0] <= frame_num - i_cycle_ref - 4'b1;
				i_list0 <= i_list0 + 1;end
			else begin
				RefPicList1[i_list1] <= frame_num - i_cycle_ref - 4'b1;
				i_list1 <= i_list1 + 1;end
		end
		end
	else if(refbuild_state == refbuild_state_b_long)begin
		if(pic_ref_flag[frame_num - i_cycle_ref - 4'b1] == `pic_flag_long)begin
			if(poc_frame_num[(frame_num - i_cycle_ref - 4'b1)] < POC)begin
				RefPicList0[i_list0] <= frame_num - i_cycle_ref - 4'b1;
				i_list0 <= i_list0 + 1;end
			else begin
				RefPicList1[i_list1] <= frame_num - i_cycle_ref - 4'b1;
				i_list1 <= i_list1 + 1;end
		end
		end
	else if(cal_reordering_pic_num_state == `cal_reordering_pic_num_move && reordering_of_pic_nums_idc_l1 == 0)
		RefPicList0[i_move] <= RefPicList0[i_move-1];
	else if(cal_reordering_pic_num_state == `cal_reordering_pic_num_move && reordering_of_pic_nums_idc_l1 == 1)
		RefPicList1[i_move] <= RefPicList1[i_move-1];
	else if(cal_reordering_pic_num_state == `cal_reordering_pic_num_ass && ref_pic_list_reordering_state == `cal_abs_diff_pic_num
		&& reordering_of_pic_nums_idc_l1 == 0)
		RefPicList0[abs_diff_pic_num_refIdxLX] <= picNumL0NoWrap[3:0];
	else if(cal_reordering_pic_num_state == `cal_reordering_pic_num_ass && ref_pic_list_reordering_state == `cal_abs_diff_pic_num
		&& reordering_of_pic_nums_idc_l1 == 1)
		RefPicList1[abs_diff_pic_num_refIdxLX] <= picNumL0NoWrap[3:0];
	else if(cal_reordering_pic_num_state == `cal_reordering_pic_num_ass && ref_pic_list_reordering_state == `cal_long_term_pic_num
	 	&& reordering_of_pic_nums_idc_l1 == 0)
		RefPicList0[abs_diff_pic_num_refIdxLX] <= long_term_idx[long_term_pic_num_reordering];
	else if(cal_reordering_pic_num_state == `cal_reordering_pic_num_ass && ref_pic_list_reordering_state == `cal_long_term_pic_num
	 	&& reordering_of_pic_nums_idc_l1 == 1)
		RefPicList1[abs_diff_pic_num_refIdxLX] <= long_term_idx[long_term_pic_num_reordering];


assign data_valid_L0 = ao_valid_luma_L0 && ao_valid_chroma_L0;
assign data_valid_L1 = ao_valid_luma_L1 && ao_valid_chroma_L1;



always@(refIdxL0_curr or mb_type_general or intra4x4_pred_num or num_ref_idx_l0_active_minus1_curr)
	if(num_ref_idx_l0_active_minus1_curr == 0)
		ref_idx_l0_curr = 0;
	else
	case(mb_type_general)
	0:ref_idx_l0_curr = refIdxL0_curr[3:0];
	1,2,3,6,7:
		case(intra4x4_pred_num)
		0,1,2,3,18,22:    ref_idx_l0_curr = refIdxL0_curr[3:0];
		4,5,6,7,19,23:    ref_idx_l0_curr = refIdxL0_curr[8:5];
		8,9,10,11,20,24:  ref_idx_l0_curr = refIdxL0_curr[13:10];
		12,13,14,15,21,25:ref_idx_l0_curr = refIdxL0_curr[18:15];
		default:;
		endcase
	default:ref_idx_l0_curr = 0;
	endcase

/*always@(refIdxL1_curr or mb_type_general or intra4x4_pred_num or num_ref_idx_l1_active_minus1_curr)
	if(num_ref_idx_l1_active_minus1_curr == 0)
		ref_idx_l1_curr = 0;
	else
	case(mb_type_general)
	0:ref_idx_l1_curr = refIdxL1_curr[3:0];
	1,2,3,6,7:
		case(intra4x4_pred_num)
		0,1,2,3,18,22:    ref_idx_l1_curr = refIdxL1_curr[3:0];
		4,5,6,7,19,23:    ref_idx_l1_curr = refIdxL1_curr[8:5];
		8,9,10,11,20,24:  ref_idx_l1_curr = refIdxL1_curr[13:10];
		12,13,14,15,21,25:ref_idx_l1_curr = refIdxL1_curr[18:15];
		default:;
		endcase
	default:ref_idx_l1_curr = 0;
	endcase*/
wire [23:0] ref_luma_rd_addr_l0_;
wire [22:0] ref_chroma_rd_addr_l0_;

assign ref_luma_wr_addr = luma_ram_w?{frame_num[1:0],luma_ram_addr}:0;
assign ref_chroma_wr_addr = chroma_ram_w?{frame_num[1:0],chroma_ram_addr}:0;

assign ref_luma_rd_addr_l0_ = ref_L0_luma_RAM_rd?
			{RefPicList0[ref_idx_l0_curr],frame_L0_luma_rd_addr}:0;
assign ref_chroma_rd_addr_l0_ = ref_L0_chroma_RAM_rd?
			{RefPicList0[ref_idx_l0_curr],frame_L0_chroma_rd_addr}:0;

assign ref_luma_rd_addr_l0 = ref_luma_rd_addr_l0_[21:0];
assign ref_chroma_rd_addr_l0 = ref_chroma_rd_addr_l0_[20:0];
/*assign ref_luma_rd_addr_l1 = ref_L1_luma_RAM_rd?
			{RefPicList1[ref_idx_l1_curr],frame_L1_luma_rd_addr}:0;
assign ref_chroma_rd_addr_l1 = ref_L1_chroma_RAM_rd?
			{RefPicList1[ref_idx_l1_curr],frame_L1_chroma_rd_addr}:0;

*/


always@(intra4x4_pred_num or predFlagL0_curr or predFlagL1_curr or reset_n)
	if (reset_n == 1'b0)begin
		enable_L0 = 0; enable_L1 = 0;end
	else case(intra4x4_pred_num)
		0,1,2,3,18,22:begin
			enable_L0 = predFlagL0_curr[0]; enable_L1 = predFlagL1_curr[0]; end
		4,5,6,7,19,23:begin
			enable_L0 = predFlagL0_curr[1]; enable_L1 = predFlagL1_curr[1]; end
		8,9,10,11,20,24:begin
			enable_L0 = predFlagL0_curr[2]; enable_L1 = predFlagL1_curr[2]; end
		12,13,14,15,21,25:begin
			enable_L0 = predFlagL0_curr[3]; enable_L1 = predFlagL1_curr[3]; end
		default:;
		endcase


/*wire [15:0] td_tmp,tb_tmp;
assign td_tmp = direct_spatial_mv_pred_flag == 0 && 
			(slice_data_state == `skip_run_duration ||slice_data_state == `sub_mb_pred ||slice_data_state == `mb_pred )?
		poc_frame_num[RefPicList1[0]] -  poc_frame_num[RefPicList0[0]]:0 ;
assign tb_tmp = direct_spatial_mv_pred_flag == 0 && 
			(slice_data_state == `skip_run_duration ||slice_data_state == `sub_mb_pred ||slice_data_state == `mb_pred )?
		poc_frame_num[frame_num] - poc_frame_num[RefPicList0[0]]:0;


assign td = td_tmp[2:1];
assign tb = tb_tmp[2:1];*/
endmodule
