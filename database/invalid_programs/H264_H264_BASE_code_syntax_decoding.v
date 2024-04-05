`include "timescale.v"
`include "define.v"

module syntax_decoding(
input clk,
input reset_n,
input [15:0] BitStream_buffer_output,
input [10:0] exp_golomb_decoding_output,
input [1:0] parser_state,
input [3:0] nal_unit_state,
input [4:0] seq_parameter_set_state,
input [3:0] pic_parameter_set_state,
input [4:0] slice_header_state,
input [3:0] slice_data_state,
input [2:0] mb_pred_state,
input [2:0] sub_mb_pred_state,
input [2:0] ref_pic_list_reordering_state,dec_ref_pic_marking_state,
input [4:0] intra4x4_pred_num,//inter
input pin_disable_DF,
input [9:0] dependent_variable_decoding_output,
input [7:0] mb_num_h,mb_num_v,num_ref_frames_in_pic_order_cnt_cycle_i,
input [1:0] mbPartIdx,
input p_skip_end,residual_end,

output reg start_code_prefix_found,forbidden_zero_bit,
output reg weighted_pred_flag,
output reg entropy_coding_mode_flag,
output disable_DF,
output reg [1:0] nal_ref_idc,
output reg [4:0] nal_unit_type,
output reg [3:0] num_ref_idx_l0_active_minus1_curr,num_ref_idx_l1_active_minus1_curr,
output reg [2:0] slice_type,
output reg [1:0] weighted_bipred_idc,
output reg [1:0] pic_order_cnt_type,
output reg [9:0] pic_order_cnt_lsb,
output reg num_ref_idx_active_override_flag,deblocking_filter_control_present_flag,
output reg adaptive_ref_pic_marking_mode_flag,memory_management_control_operation_5,
output reg delta_pic_order_always_zero_flag,
output reg [7:0] num_ref_frames_in_pic_order_cnt_cycle,
output reg [10:0] offset_for_ref_frame,
output reg [2:0] memory_management_control_operation,
output reg [1:0] disable_deblocking_filter_idc,
output reg [3:0] log2_max_frame_num_minus4,log2_max_pic_order_cnt_lsb_minus4,
output reg [5:0] pic_init_qp_minus26,
output reg [4:0] chroma_qp_index_offset,
output reg constrained_intra_pred_flag,direct_spatial_mv_pred_flag,
output reg [3:0] frame_num,
output reg [5:0] mb_type,
output reg [3:0] mb_type_general,

output reg [2:0] NumMbPart,NumSubMbPart,
output reg [15:0] ref_idx_l0,ref_idx_l1,
output reg [1:0] MBTypeGen_mbAddrA,
output [1:0] MBTypeGen_mbAddrB,MBTypeGen_mbAddrC,
output [2:0] rem_intra4x4_pred_mode,
output prev_intra4x4_pred_mode_flag,
output reg [1:0] Intra16x16_predmode,
output reg [1:0] intra_chroma_pred_mode,
output [3:0] slice_alpha_c0_offset_div2,slice_beta_offset_div2,
output reg [7:0] pic_width_in_mbs_minus1,pic_height_in_map_units_minus1,
output reg ref_pic_list_reordering_flag_l0,ref_pic_list_reordering_flag_l1,
output reg [1:0] reordering_of_pic_nums_idc,
output [9:0] mb_skip_run,

output [10:0] mvd,	
output reg [1:0] sub_mb_type,SubMbPredMode,
output reg [3:0] mv_below8x8,
output reg MBTypeGen_mbAddrD,
output reg long_term_reference_flag,
output reg offset_for_ref_frame_wr_n,
output reg [7:0] offset_for_ref_frame_wr_addr,
output reg [10:0] offset_for_ref_frame_din,
output reg [10:0] delta_pic_order_cnt,offset_for_non_ref_pic,

output reg sub_ref_idx_l0_en,sub_ref_idx_l1_en,
output reg ref_idx_l0_en,ref_idx_l1_en,
output reg sub_mvd_l0_en,sub_mvd_l1_en,mvd_l0_en,mvd_l1_en,
output reg [2:0] B_MbPartPredMode_0,B_MbPartPredMode_1,
output reg [4:0] abs_diff_pic_num_minus1,
output reg [3:0] long_term_pic_num_reordering,
output reg [3:0] difference_of_pic_nums_minus1,long_term_pic_num,long_term_frame_idx

);

always @ (parser_state or BitStream_buffer_output)
		if (parser_state == `start_code_prefix)
			begin
				if (BitStream_buffer_output == 16'b0000000000000001)
					start_code_prefix_found = 1;
				else
					start_code_prefix_found = 0;
			end
		else
			start_code_prefix_found = 0; 
			
always @ (nal_unit_state or reset_n)
	if (reset_n == 0)begin
			forbidden_zero_bit = 0;
			nal_ref_idc        = 0;
			nal_unit_type  = 0;
		end
	else if (nal_unit_state == `forbidden_zero_bit_2_nal_unit_type)begin
			forbidden_zero_bit = BitStream_buffer_output[15];
			nal_ref_idc        = BitStream_buffer_output[14:13];
			nal_unit_type      = BitStream_buffer_output[12:8];
		end
//sps
reg [7:0] profile_idc;
reg constraint_set0_flag,constraint_set1_flag,constraint_set2_flag,constraint_set3_flag;
reg [3:0] reserved_zero_4bits;
reg [7:0] level_idc;
reg [4:0] seq_parameter_set_id_sps;
reg [3:0] num_ref_frames; 
reg gaps_in_frame_num_value_allowed_flag;
reg frame_mbs_only_flag;
reg direct_8x8_inference_flag;
reg frame_cropping_flag;
reg vui_parameter_present_flag;
reg [10:0] offset_for_top_to_bottom_field;



always @ (reset_n or seq_parameter_set_state or BitStream_buffer_output or exp_golomb_decoding_output)
	if (reset_n == 0)
		begin
			profile_idc                          = 0;
			constraint_set0_flag                 = 0;
			constraint_set1_flag                 = 0;		
			constraint_set2_flag                 = 0;
			constraint_set3_flag                 = 0;
			reserved_zero_4bits	             = 0;
			level_idc                            = 0;
			seq_parameter_set_id_sps             = 0;
			log2_max_frame_num_minus4            = 0;
			pic_order_cnt_type                   = 0;
			log2_max_pic_order_cnt_lsb_minus4    = 0;
			delta_pic_order_always_zero_flag     = 0;
			offset_for_non_ref_pic		     = 0;
			offset_for_top_to_bottom_field       = 0;
			num_ref_frames_in_pic_order_cnt_cycle= 0;
			offset_for_ref_frame                 = 0;
			num_ref_frames                       = 0; 
			gaps_in_frame_num_value_allowed_flag = 0;
			pic_width_in_mbs_minus1              = 0; 
			pic_height_in_map_units_minus1       = 0;
			frame_mbs_only_flag                  = 0;
			direct_8x8_inference_flag            = 0;
			frame_cropping_flag                  = 0;
			vui_parameter_present_flag           = 0;
		end
	else 
		case (seq_parameter_set_state)
			`fixed_header:
			begin
				profile_idc = BitStream_buffer_output[15:8];
				constraint_set0_flag = BitStream_buffer_output[7];
				constraint_set1_flag = BitStream_buffer_output[6];
				constraint_set2_flag = BitStream_buffer_output[5];
				constraint_set3_flag = BitStream_buffer_output[4];
				reserved_zero_4bits  = BitStream_buffer_output[3:0];
			end
		  	`level_idc_s                           :level_idc                            = BitStream_buffer_output[15:8];
			`seq_parameter_set_id_sps_s            :seq_parameter_set_id_sps             = exp_golomb_decoding_output[4:0];
			`log2_max_frame_num_minus4_s           :log2_max_frame_num_minus4            = exp_golomb_decoding_output[3:0];
			`pic_order_cnt_type_s                  :pic_order_cnt_type                   = exp_golomb_decoding_output[1:0];
			`log2_max_pic_order_cnt_lsb_minus4_s   :log2_max_pic_order_cnt_lsb_minus4    = exp_golomb_decoding_output[3:0];

			`delta_pic_order_always_zero_flag      :delta_pic_order_always_zero_flag     = BitStream_buffer_output[15];
			`offset_for_non_ref_pic		       :offset_for_non_ref_pic 		     = exp_golomb_decoding_output;
			`offset_for_top_to_bottom_field	       :offset_for_top_to_bottom_field       = exp_golomb_decoding_output;
			`num_ref_frames_in_pic_order_cnt_cycle :num_ref_frames_in_pic_order_cnt_cycle= exp_golomb_decoding_output[7:0];
			`offset_for_ref_frame	               :offset_for_ref_frame		     = exp_golomb_decoding_output;

			`num_ref_frames_s                      :num_ref_frames                       = exp_golomb_decoding_output[3:0];
			`gaps_in_frame_num_value_allowed_flag_s:gaps_in_frame_num_value_allowed_flag = BitStream_buffer_output[15];
			`pic_width_in_mbs_minus1_s             :pic_width_in_mbs_minus1              = exp_golomb_decoding_output[7:0];
			`pic_height_in_map_units_minus1_s      :pic_height_in_map_units_minus1       = exp_golomb_decoding_output[7:0];
			`frame_mbs_only_flag_2_frame_cropping_flag:begin
				frame_mbs_only_flag       = BitStream_buffer_output[15];
				direct_8x8_inference_flag = BitStream_buffer_output[14];
				frame_cropping_flag       = BitStream_buffer_output[13];
			end
			`vui_parameter_present_flag_s:vui_parameter_present_flag = BitStream_buffer_output[15];
			default:;
		endcase

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		offset_for_ref_frame_wr_n <= 1;
		offset_for_ref_frame_wr_addr <= 0; offset_for_ref_frame_din <= 0;end
	else if(seq_parameter_set_state == `offset_for_ref_frame)begin
		offset_for_ref_frame_wr_n <= 0;
		offset_for_ref_frame_wr_addr <= num_ref_frames_in_pic_order_cnt_cycle_i;
	 	offset_for_ref_frame_din <= offset_for_ref_frame;end
	else begin
		offset_for_ref_frame_wr_n <= 1;
		offset_for_ref_frame_wr_addr <= 0; offset_for_ref_frame_din <= 0;end
	








//pps		
reg [7:0] pic_parameter_set_id_pps;
reg [4:0] seq_parameter_set_id_pps;
reg pic_order_present_flag;
reg [2:0] num_slice_groups_minus1;
reg [3:0] num_ref_idx_l0_active_minus1,num_ref_idx_l1_active_minus1;
reg [5:0] pic_init_qs_minus26;
reg redundant_pic_cnt_present_flag;
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		pic_parameter_set_id_pps <= 0; seq_parameter_set_id_pps <= 0;
		entropy_coding_mode_flag <= 0; pic_order_present_flag <= 0;
		num_slice_groups_minus1 <= 0;
		num_ref_idx_l0_active_minus1 <= 0; num_ref_idx_l1_active_minus1 <= 0;
		weighted_pred_flag <= 0; weighted_bipred_idc <= 0;
		pic_init_qp_minus26 <= 0; pic_init_qs_minus26 <= 0;
		chroma_qp_index_offset <= 0;
		deblocking_filter_control_present_flag <= 0;
		constrained_intra_pred_flag <= 0; redundant_pic_cnt_present_flag <= 0;
		end
	else 
		case (pic_parameter_set_state)
			`pic_parameter_set_id_pps_s:pic_parameter_set_id_pps <= exp_golomb_decoding_output[7:0];
			`seq_parameter_set_id_pps_s:seq_parameter_set_id_pps <= exp_golomb_decoding_output[4:0];
			`entropy_coding_mode_flag_2_pic_order_present_flag:begin
				entropy_coding_mode_flag <= BitStream_buffer_output[15];
				pic_order_present_flag   <= BitStream_buffer_output[14];end
			`num_slice_groups_minus1_s         :num_slice_groups_minus1 <= exp_golomb_decoding_output[2:0];
			`num_ref_idx_l0_active_minus1_pps_s:num_ref_idx_l0_active_minus1 <= exp_golomb_decoding_output[3:0];
			`num_ref_idx_l1_active_minus1_pps_s:num_ref_idx_l1_active_minus1 <= exp_golomb_decoding_output[3:0];
			`weighted_pred_flag_2_weighted_bipred_idc:begin
				weighted_pred_flag  <= BitStream_buffer_output[15];
				weighted_bipred_idc <= BitStream_buffer_output[14:13];end
			`pic_init_qp_minus26_s   :pic_init_qp_minus26 <= exp_golomb_decoding_output[5:0];
			`pic_init_qs_minus26_s   :pic_init_qs_minus26 <= exp_golomb_decoding_output[5:0];
			`chroma_qp_index_offset_s:chroma_qp_index_offset <= exp_golomb_decoding_output[4:0];
			`deblocking_filter_control_2_redundant_pic_cnt_present_flag:begin
				deblocking_filter_control_present_flag <= BitStream_buffer_output[15];
				constrained_intra_pred_flag            <= BitStream_buffer_output[14];
				redundant_pic_cnt_present_flag         <= BitStream_buffer_output[13];end
			default:;
		endcase		

//--------------------------
//slice_header
//--------------------------
reg first_mb_in_slice;
reg [7:0] pic_parameter_set_id_slice_header;
reg idr_pic_id;
reg [3:0] slice_alpha_c0_offset_div2_dec;
reg [3:0] slice_beta_offset_div2_dec;
reg [5:0] slice_qp_delta;
reg [3:0] num_ref_idx_l0_active_minus1_slice_header;
reg [3:0] num_ref_idx_l1_active_minus1_slice_header;
reg [1:0] cabac_init_idc;
always @ (slice_header_state or exp_golomb_decoding_output or dependent_variable_decoding_output or BitStream_buffer_output)
	if (reset_n == 0)begin
		first_mb_in_slice                 = 0;
		slice_type                        = 0;
		pic_parameter_set_id_slice_header = 0;
		frame_num                         = 0;
		idr_pic_id                        = 0;
		direct_spatial_mv_pred_flag     = 0;
		pic_order_cnt_lsb                 = 0;
		delta_pic_order_cnt               = 0;
		num_ref_idx_active_override_flag  = 0;
		num_ref_idx_l0_active_minus1_slice_header = 0;
		num_ref_idx_l1_active_minus1_slice_header = 0;
		cabac_init_idc                    = 0;
		disable_deblocking_filter_idc     = 0;				
		slice_alpha_c0_offset_div2_dec    = 0;
		slice_beta_offset_div2_dec        = 0;end
	else
		case (slice_header_state)
			`first_mb_in_slice_s                :first_mb_in_slice                 = exp_golomb_decoding_output[0];
			`slice_type_s                       :slice_type                        = exp_golomb_decoding_output[2:0];
			`pic_parameter_set_id_slice_header_s:pic_parameter_set_id_slice_header = exp_golomb_decoding_output[7:0];
			`frame_num_s                        :frame_num                         = dependent_variable_decoding_output[3:0];
			`idr_pic_id_s                       :idr_pic_id                        = exp_golomb_decoding_output[0];
			`pic_order_cnt_lsb_s                :pic_order_cnt_lsb                 = dependent_variable_decoding_output[9:0];
			`delta_pic_order_cnt_s              :delta_pic_order_cnt               = exp_golomb_decoding_output;
			`direct_spatial_mv_pred_flag_s      :direct_spatial_mv_pred_flag       = BitStream_buffer_output[15];
			`num_ref_idx_active_override_flag_s :num_ref_idx_active_override_flag  = BitStream_buffer_output[15];
			`num_ref_idx_l0_active_minus1_slice_header_s
							    :num_ref_idx_l0_active_minus1_slice_header = exp_golomb_decoding_output[3:0];
			`num_ref_idx_l1_active_minus1_slice_header_s
							    :num_ref_idx_l1_active_minus1_slice_header = exp_golomb_decoding_output[3:0];
			`cabac_init_idc_s		    :cabac_init_idc                    = exp_golomb_decoding_output[1:0];
			`slice_qp_delta_s                   :slice_qp_delta                    = exp_golomb_decoding_output[5:0];
			`disable_deblocking_filter_idc_s    :disable_deblocking_filter_idc     = exp_golomb_decoding_output[1:0];
			`slice_alpha_c0_offset_div2_s       :slice_alpha_c0_offset_div2_dec    = exp_golomb_decoding_output[3:0];
			`slice_beta_offset_div2_s           :slice_beta_offset_div2_dec 	= exp_golomb_decoding_output[3:0];
			//slice_group_change_cycle_s:
			default:;
		endcase
	
	
assign slice_alpha_c0_offset_div2 = {4{deblocking_filter_control_present_flag}} & slice_alpha_c0_offset_div2_dec;
assign slice_beta_offset_div2 	  = {4{deblocking_filter_control_present_flag}} & slice_beta_offset_div2_dec;
	
reg sw_disable_DF;
always @ (posedge clk)
	if (reset_n == 0)
		sw_disable_DF <= 0;
	else if ( disable_deblocking_filter_idc == 1)
		sw_disable_DF <= 1;
	else
		sw_disable_DF <= 0;
			
assign disable_DF = sw_disable_DF | pin_disable_DF;

always @ (posedge clk)
	if (reset_n == 0)
		num_ref_idx_l0_active_minus1_curr <= 0;
	else if(num_ref_idx_active_override_flag)
		num_ref_idx_l0_active_minus1_curr <= num_ref_idx_l0_active_minus1_slice_header;
	else    num_ref_idx_l0_active_minus1_curr <= num_ref_idx_l0_active_minus1;

always @ (posedge clk)
	if (reset_n == 0)
		num_ref_idx_l1_active_minus1_curr <= 0;
	else if(num_ref_idx_active_override_flag)
		num_ref_idx_l1_active_minus1_curr <= num_ref_idx_l1_active_minus1_slice_header;
	else    num_ref_idx_l1_active_minus1_curr <= num_ref_idx_l1_active_minus1;




always @ (ref_pic_list_reordering_state or reset_n or exp_golomb_decoding_output or BitStream_buffer_output)
	if (reset_n == 0)begin
		ref_pic_list_reordering_flag_l0 = 0;
	end
	else case(ref_pic_list_reordering_state)
		`ref_pic_list_reordering_flag_l0_s:ref_pic_list_reordering_flag_l0 = BitStream_buffer_output[15];
		`reordering_of_pic_nums_idc_s:     reordering_of_pic_nums_idc = exp_golomb_decoding_output[1:0]; 
		`abs_diff_pic_num_minus1:          abs_diff_pic_num_minus1 = exp_golomb_decoding_output[4:0];
		`long_term_pic_num:                long_term_pic_num_reordering = exp_golomb_decoding_output[3:0];
		`ref_pic_list_reordering_flag_l1_s:ref_pic_list_reordering_flag_l1 = BitStream_buffer_output[15];
		default:;
	endcase

//dec_ref_pic_marking_state
reg no_output_of_prior_pics_flag;
reg [4:0] max_long_term_frame_idx_plus1;

always@(dec_ref_pic_marking_state or reset_n or exp_golomb_decoding_output or BitStream_buffer_output)
	if (reset_n == 0)begin
		no_output_of_prior_pics_flag = 0; long_term_reference_flag = 0;
		adaptive_ref_pic_marking_mode_flag = 0; memory_management_control_operation = 0;
		difference_of_pic_nums_minus1 = 0; long_term_pic_num = 0;
		long_term_frame_idx = 0; max_long_term_frame_idx_plus1 = 0;end
	else case(dec_ref_pic_marking_state)
		`no_output_of_prior_pics_flag_2_long_term_reference_flag:begin
			no_output_of_prior_pics_flag = BitStream_buffer_output[15];
			long_term_reference_flag = BitStream_buffer_output[14];end
		`adaptive_ref_pic_marking_mode_flag_s:
			adaptive_ref_pic_marking_mode_flag = BitStream_buffer_output[15];
		`memory_management_control_operation_s:
			memory_management_control_operation = exp_golomb_decoding_output[2:0];
		`difference_of_pic_nums_minus1_s:
			difference_of_pic_nums_minus1 = exp_golomb_decoding_output[3:0];
		`long_term_pic_num_s:
			long_term_pic_num = exp_golomb_decoding_output[3:0];
		`long_term_frame_idx_s:	
			long_term_frame_idx = exp_golomb_decoding_output[3:0];
		`max_long_term_frame_idx_plus1_s:
			max_long_term_frame_idx_plus1 = exp_golomb_decoding_output[4:0];
		default:;
		endcase


always @ (posedge clk)
	if (reset_n == 0)
		memory_management_control_operation_5 <= 0;
	else if(slice_header_state == `dec_ref_pic_marking)
		memory_management_control_operation_5 <= 0;
	else if(dec_ref_pic_marking_state == `memory_management_control_operation_s && exp_golomb_decoding_output[2:0] == 3'd5)
		memory_management_control_operation_5 <= 1;


//--------------------------
//slice_data
//--------------------------
reg [9:0] mb_skip_run_reg;	
reg [3:0] mb_type_general_reg;

		
assign mb_skip_run = (slice_data_state == `mb_skip_run_s)? exp_golomb_decoding_output[9:0]:mb_skip_run_reg;

always @ (slice_data_state or slice_type or exp_golomb_decoding_output or mb_type_general_reg or mb_skip_run)
	if (slice_data_state == `skip_run_duration || (slice_data_state == `mb_skip_run_s&&mb_skip_run != 0))
			mb_type_general = slice_type == `slice_type_p ? `MB_P_skip:`MB_B_skip;
	else if (slice_data_state == `mb_type_s)begin
		if (slice_type == 2 || slice_type == 7)	//I slice
			case (exp_golomb_decoding_output)
				0:                      mb_type_general = `MB_Intra4x4;
				1,2,3,4,13,14,15,16:    mb_type_general = `MB_Intra16x16_CBPChroma0;
				5,6,7,8,17,18,19,20:    mb_type_general = `MB_Intra16x16_CBPChroma1;
				9,10,11,12,21,22,23,24: mb_type_general = `MB_Intra16x16_CBPChroma2;
			   	default:                mb_type_general = `MB_Inter16x16;
			endcase
		else if (slice_type == `slice_type_p)                                   //P slice
			case (exp_golomb_decoding_output)
				0:                      mb_type_general = `MB_Inter16x16;
				1:                      mb_type_general = `MB_Inter16x8;
				2:                      mb_type_general = `MB_Inter8x16;
				3:                      mb_type_general = `MB_P_8x8;
				4:                      mb_type_general = `MB_P_8x8ref0;
				5:                      mb_type_general = `MB_Intra4x4;
				6,7,8,9,18,19,20,21:    mb_type_general = `MB_Intra16x16_CBPChroma0;
				10,11,12,13,22,23,24,25:mb_type_general = `MB_Intra16x16_CBPChroma1;
				14,15,16,17,26,27,28,29:mb_type_general = `MB_Intra16x16_CBPChroma2;
				default:                mb_type_general = `MB_Inter16x8;
			endcase
		else if (slice_type == `slice_type_b)
			case (exp_golomb_decoding_output)
				0,1,2,3:		mb_type_general = `MB_Inter16x16;
				4,6,8,10,12,14,16,18,20:mb_type_general = `MB_Inter16x8;
				5,7,9,11,13,15,17,19,21:mb_type_general = `MB_Inter8x16;
				22		       :mb_type_general = `MB_B_8x8;
				23		       :mb_type_general = `MB_Intra4x4;
				24,25,26,27,36,37,38,39:mb_type_general = `MB_Intra16x16_CBPChroma0;
				28,29,30,31,40,41,42,43:mb_type_general = `MB_Intra16x16_CBPChroma1;
				32,33,34,35,44,45,46,47:mb_type_general = `MB_Intra16x16_CBPChroma2;
				default:;
			endcase
	end
	else
		mb_type_general = mb_type_general_reg;
			
//Intra16x16_predmode
always @ (posedge clk)
	if (reset_n == 0)
		Intra16x16_predmode <= 2'b0;
	else if (slice_data_state == `mb_type_s)begin
		if (slice_type == 2 || slice_type == 7)	begin//I slice
			if (exp_golomb_decoding_output != 0)
				case (exp_golomb_decoding_output[1:0])
				2'b00:Intra16x16_predmode <= 2'b11;
				2'b01:Intra16x16_predmode <= 2'b00;
				2'b10:Intra16x16_predmode <= 2'b01;
				2'b11:Intra16x16_predmode <= 2'b10;
				endcase
		end
		else if(slice_type == `slice_type_p)
			if (exp_golomb_decoding_output[4:0] > 5) //P slice
				case (exp_golomb_decoding_output[1:0])
				2'b00:Intra16x16_predmode <= 2'b10;
				2'b01:Intra16x16_predmode <= 2'b11;
				2'b10:Intra16x16_predmode <= 2'b00;
				2'b11:Intra16x16_predmode <= 2'b01;
				endcase
			else 						//B_slice
				if(exp_golomb_decoding_output > 23)
					Intra16x16_predmode <= exp_golomb_decoding_output[1:0];
								
		end





always @ (posedge clk)
	if (reset_n == 0)begin
		B_MbPartPredMode_0 <= `B_na; B_MbPartPredMode_1 <= `B_na;end
	else if (slice_type == `slice_type_b)
		if(slice_data_state == `skip_run_duration || (slice_data_state == `mb_skip_run_s&&mb_skip_run != 0))begin
			B_MbPartPredMode_0 <= `B_Direct; B_MbPartPredMode_1 <= `B_na;end
		else if(slice_data_state == `mb_type_s)
			case(exp_golomb_decoding_output)
			0:	begin B_MbPartPredMode_0 <= `B_Direct; B_MbPartPredMode_1 <= `B_na;end
			1:	begin B_MbPartPredMode_0 <= `B_Pred_L0; B_MbPartPredMode_1 <= `B_na;end
			2:	begin B_MbPartPredMode_0 <= `B_Pred_L1; B_MbPartPredMode_1 <= `B_na;end
			3:	begin B_MbPartPredMode_0 <= `B_BiPred; B_MbPartPredMode_1 <= `B_na;end
			4,5:	begin B_MbPartPredMode_0 <= `B_Pred_L0; B_MbPartPredMode_1 <= `B_Pred_L0;end
			6,7:	begin B_MbPartPredMode_0 <= `B_Pred_L1; B_MbPartPredMode_1 <= `B_Pred_L1;end
			8,9:	begin B_MbPartPredMode_0 <= `B_Pred_L0; B_MbPartPredMode_1 <= `B_Pred_L1;end
			10,11:	begin B_MbPartPredMode_0 <= `B_Pred_L1; B_MbPartPredMode_1 <= `B_Pred_L0;end
			12,13:  begin B_MbPartPredMode_0 <= `B_Pred_L0; B_MbPartPredMode_1 <= `B_BiPred;end
			14,15:  begin B_MbPartPredMode_0 <= `B_Pred_L1; B_MbPartPredMode_1 <= `B_BiPred;end
			16,17:	begin B_MbPartPredMode_0 <= `B_BiPred; B_MbPartPredMode_1 <= `B_Pred_L0;end
			18,19:  begin B_MbPartPredMode_0 <= `B_BiPred; B_MbPartPredMode_1 <= `B_Pred_L1;end
			20,21:	begin B_MbPartPredMode_0 <= `B_BiPred; B_MbPartPredMode_1 <= `B_BiPred;end
			default:begin B_MbPartPredMode_0 <= `B_na; B_MbPartPredMode_1 <= `B_na;end
			endcase

always @ (posedge clk)
	if (reset_n == 0)begin
			mb_skip_run_reg <= 0;
			mb_type <= 0; mb_type_general_reg <= `MB_type_rst;end
	else case (slice_data_state)
		`mb_skip_run_s:mb_skip_run_reg <= mb_skip_run;
		`skip_run_duration:begin
			mb_type <= 6'd63;
			mb_type_general_reg <= mb_type_general;end
		`mb_type_s:begin
			mb_type <= exp_golomb_decoding_output[5:0];
			mb_type_general_reg <= mb_type_general;end
		default:;
		endcase

//Update MBTypeGen information
reg [1:0] MBTypeGen_mbAddrB_reg [0:127];

assign MBTypeGen_mbAddrB  = MBTypeGen_mbAddrB_reg[mb_num_h[6:0]];
assign MBTypeGen_mbAddrC  = MBTypeGen_mbAddrB_reg[mb_num_h[6:0]+1]; 
reg MBTypeGen_mbAddrD_tmp;

always @ (posedge clk)
	if (reset_n == 0)begin
	   	MBTypeGen_mbAddrA <= 0;
		MBTypeGen_mbAddrD_tmp <= 0;
		end
	else if (slice_data_state == `skip_run_duration && p_skip_end)//for P_skip
		begin
			if (mb_num_h != pic_width_in_mbs_minus1)
				MBTypeGen_mbAddrA <= `MB_addrA_addrB_P_skip;
			if (mb_num_h == pic_width_in_mbs_minus1-1)
				MBTypeGen_mbAddrD_tmp <= 1'b0;
			if (mb_num_v != pic_height_in_map_units_minus1)
				MBTypeGen_mbAddrB_reg[mb_num_h[6:0]]   <= `MB_addrA_addrB_P_skip;
		end
	else if (slice_data_state == `mb_num_update)begin
			if (mb_num_h != pic_width_in_mbs_minus1)
				begin
					if (mb_type_general[3] == 1'b0)
						MBTypeGen_mbAddrA <= `MB_addrA_addrB_Inter;
					else if (mb_type_general[3:2] == 2'b10)
						MBTypeGen_mbAddrA <= `MB_addrA_addrB_Intra16x16;
					else if (mb_type_general == `MB_Intra4x4)
						MBTypeGen_mbAddrA <= `MB_addrA_addrB_Intra4x4;
				end
			if (mb_num_h == pic_width_in_mbs_minus1-1)
				MBTypeGen_mbAddrD_tmp <= mb_type_general[3];
			if (mb_num_v != pic_height_in_map_units_minus1)
				begin
					if (mb_type_general[3] == 1'b0)
						MBTypeGen_mbAddrB_reg[mb_num_h[6:0]]   <= `MB_addrA_addrB_Inter;
					else if (mb_type_general[3:2] == 2'b10)
						MBTypeGen_mbAddrB_reg[mb_num_h[6:0]]   <= `MB_addrA_addrB_Intra16x16;		
					else if (mb_type_general == `MB_Intra4x4)
						MBTypeGen_mbAddrB_reg[mb_num_h[6:0]]   <= `MB_addrA_addrB_Intra4x4;
				end
		end


always @ (posedge clk)
	if (reset_n == 1'b0)
		MBTypeGen_mbAddrD <= 0;
	else if (mb_num_h == 0)
		MBTypeGen_mbAddrD <= MBTypeGen_mbAddrD_tmp;
	
//----------------------------------------------------------------------
//mb_pred & sub_mb_pred	
//	--> Also refer to Intra4x4_PredMode_decoding.v & Inter_mv_decoding.v
//----------------------------------------------------------------------

reg prev_intra4x4_pred_mode_flag_reg;
reg [2:0] rem_intra4x4_pred_mode_reg;


reg [10:0] mvd_reg;
reg [7:0] sub_mb_type_reg;

assign prev_intra4x4_pred_mode_flag = (mb_pred_state == `prev_intra4x4_pred_mode_flag_s)? BitStream_buffer_output[15]:prev_intra4x4_pred_mode_flag_reg;
assign rem_intra4x4_pred_mode = (mb_pred_state == `rem_intra4x4_pred_mode_s)? BitStream_buffer_output[15:13]:rem_intra4x4_pred_mode_reg;	
assign mvd = (mb_pred_state == `mvd_l0_s && mvd_l0_en)||(sub_mb_pred_state == `sub_mvd_l0_s && sub_mvd_l0_en )||
	     (mb_pred_state == `mvd_l1_s && mvd_l1_en)||(sub_mb_pred_state == `sub_mvd_l1_s && sub_mvd_l1_en)? 
		exp_golomb_decoding_output[10:0]:mvd_reg;	


reg [1:0] sub_mb_type_B;
always@(reset_n or exp_golomb_decoding_output or sub_mb_pred_state or slice_type)
	if (reset_n == 0)
		sub_mb_type_B = 0;
	else if(sub_mb_pred_state == `sub_mb_type_s && slice_type == `slice_type_b)
		case(exp_golomb_decoding_output)
			0,1,2,3:	sub_mb_type_B = 0;
			4,6,8:		sub_mb_type_B = 1;
			5,7,9:		sub_mb_type_B = 2;
			10,11,12:	sub_mb_type_B = 3;
			default:;
		endcase

reg [1:0] SubMbPredMode_B;
reg [7:0] SubMbPredMode_reg;
always @ (reset_n or exp_golomb_decoding_output or sub_mb_pred_state or slice_type)
	if (reset_n == 0)
		SubMbPredMode_B = 0;
	else if(sub_mb_pred_state == `sub_mb_type_s && slice_type == `slice_type_b)
		case(exp_golomb_decoding_output)
		0:		SubMbPredMode_B = `B_sub_Direct;
		1,4,5,10:	SubMbPredMode_B = `B_sub_Pred_L0;
		2,6,7,11:	SubMbPredMode_B = `B_sub_Pred_L1;
		3,8,9,12:	SubMbPredMode_B = `B_sub_BiPred;
		default:;
		endcase



always @ (posedge clk)
	if (reset_n == 0)begin
			prev_intra4x4_pred_mode_flag_reg <= 0;
			rem_intra4x4_pred_mode_reg       <= 0;
			intra_chroma_pred_mode           <= 0;
			mvd_reg                          <= 0;
			sub_mb_type_reg                  <= 0;
			SubMbPredMode_reg		 <= 0;
			ref_idx_l0                       <= 0;
		end
	else if(mb_pred_state != `rst_mb_pred)
		case (mb_pred_state)
		`prev_intra4x4_pred_mode_flag_s:prev_intra4x4_pred_mode_flag_reg <= prev_intra4x4_pred_mode_flag;
		`rem_intra4x4_pred_mode_s      :rem_intra4x4_pred_mode_reg       <= rem_intra4x4_pred_mode;
		`intra_chroma_pred_mode_s      :intra_chroma_pred_mode           <= exp_golomb_decoding_output[1:0];
		`ref_idx_l0_s: 
			case(mb_type_general)
			0:ref_idx_l0 <= ref_idx_l0_en?
				{exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0]}:0;
			1:case(mbPartIdx)
				0:ref_idx_l0[7:0] <= ref_idx_l0_en?{exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0]}:0;
				1:ref_idx_l0[15:8]<= ref_idx_l0_en?{exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0]}:0;
				default:;
				endcase
			2:      case(mbPartIdx)
				0:{ref_idx_l0[11:8],ref_idx_l0[3:0]} <= ref_idx_l0_en?{exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0]}:0;
				1:{ref_idx_l0[15:12],ref_idx_l0[7:4]}<= ref_idx_l0_en?{exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0]}:0;
				default:;
				endcase
			default:;
			endcase
		`ref_idx_l1_s:
			case(mb_type_general)
			0:ref_idx_l1 <= ref_idx_l1_en?
				{exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0]}:0;
			1:case(mbPartIdx)
				0:ref_idx_l1[7:0] <= ref_idx_l1_en?{exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0]}:0;
				1:ref_idx_l1[15:8]<= ref_idx_l1_en?{exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0]}:0;
				default:;
				endcase
			2:      case(mbPartIdx)
				0:{ref_idx_l1[11:8],ref_idx_l1[3:0]} <= ref_idx_l1_en?{exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0]}:0;
				1:{ref_idx_l1[15:12],ref_idx_l1[7:4]}<= ref_idx_l1_en?{exp_golomb_decoding_output[3:0],exp_golomb_decoding_output[3:0]}:0;
				default:;
				endcase
			default:;
			endcase
		`mvd_l0_s,`mvd_l1_s:	mvd_reg <= mvd;
		default:;
		endcase
	else if(sub_mb_pred_state != `rst_sub_mb_pred)
			case (sub_mb_pred_state)
			`sub_mb_type_s:
				if(slice_type == `slice_type_p)
					case (mbPartIdx)
					0:sub_mb_type_reg[1:0] <= exp_golomb_decoding_output[1:0];
					1:sub_mb_type_reg[3:2] <= exp_golomb_decoding_output[1:0];
					2:sub_mb_type_reg[5:4] <= exp_golomb_decoding_output[1:0];
					3:sub_mb_type_reg[7:6] <= exp_golomb_decoding_output[1:0];
					endcase
				else if(slice_type == `slice_type_b)
					case (mbPartIdx)
					0:begin sub_mb_type_reg[1:0] <= sub_mb_type_B; SubMbPredMode_reg[1:0] <= SubMbPredMode_B;end
					1:begin sub_mb_type_reg[3:2] <= sub_mb_type_B; SubMbPredMode_reg[3:2] <= SubMbPredMode_B;end
					2:begin sub_mb_type_reg[5:4] <= sub_mb_type_B; SubMbPredMode_reg[5:4] <= SubMbPredMode_B;end
					3:begin sub_mb_type_reg[7:6] <= sub_mb_type_B; SubMbPredMode_reg[7:6] <= SubMbPredMode_B;end
					endcase
			`sub_ref_idx_l0_s: 
					case(mbPartIdx)
					0:ref_idx_l0[3:0] <= sub_ref_idx_l0_en?exp_golomb_decoding_output[3:0]:0;
					1:ref_idx_l0[7:4] <= sub_ref_idx_l0_en?exp_golomb_decoding_output[3:0]:0;
					2:ref_idx_l0[11:8] <= sub_ref_idx_l0_en?exp_golomb_decoding_output[3:0]:0;
					3:ref_idx_l0[15:12] <= sub_ref_idx_l0_en?exp_golomb_decoding_output[3:0]:0;
					endcase
			`sub_ref_idx_l1_s:
					case(mbPartIdx)
					0:ref_idx_l1[3:0] <= sub_ref_idx_l1_en?exp_golomb_decoding_output[3:0]:0;
					1:ref_idx_l1[7:4] <= sub_ref_idx_l1_en?exp_golomb_decoding_output[3:0]:0;
					2:ref_idx_l1[11:8] <= sub_ref_idx_l1_en?exp_golomb_decoding_output[3:0]:0;
					3:ref_idx_l1[15:12] <= sub_ref_idx_l1_en?exp_golomb_decoding_output[3:0]:0;
					endcase
			`sub_mvd_l0_s,`sub_mvd_l1_s: mvd_reg <= mvd;
			default:;
			endcase
		





always @ (sub_mb_pred_state or sub_mb_type_reg or mbPartIdx)
		if (sub_mb_pred_state == `sub_mvd_l0_s ||  sub_mb_pred_state == `sub_mvd_l1_s ||
		    sub_mb_pred_state == `sub_ref_idx_l0_s || sub_mb_pred_state == `sub_ref_idx_l1_s)
			case (mbPartIdx)
				0:sub_mb_type = sub_mb_type_reg[1:0]; 
				1:sub_mb_type = sub_mb_type_reg[3:2];
				2:sub_mb_type = sub_mb_type_reg[5:4];
				3:sub_mb_type = sub_mb_type_reg[7:6];
			endcase
		else
			sub_mb_type = 0;	


always @ (sub_mb_pred_state or SubMbPredMode_reg or mbPartIdx)
		if (sub_mb_pred_state == `sub_mvd_l0_s ||  sub_mb_pred_state == `sub_mvd_l1_s ||
		    sub_mb_pred_state == `sub_ref_idx_l0_s || sub_mb_pred_state == `sub_ref_idx_l1_s)
			case (mbPartIdx)
				0:SubMbPredMode = SubMbPredMode_reg[1:0]; 
				1:SubMbPredMode = SubMbPredMode_reg[3:2];
				2:SubMbPredMode = SubMbPredMode_reg[5:4];
				3:SubMbPredMode = SubMbPredMode_reg[7:6];
			endcase
		else
			SubMbPredMode = 0;	
				 
always @ (mb_pred_state or mb_type_general  or sub_mb_pred_state)
	if (mb_pred_state == `mvd_l0_s||mb_pred_state == `mvd_l1_s||
		mb_pred_state == `ref_idx_l0_s||mb_pred_state == `ref_idx_l1_s)
		case (mb_type_general)
			0:NumMbPart = 3'd1;
			default:NumMbPart = 3'd2;
		endcase
	else if (sub_mb_pred_state == `sub_mvd_l0_s ||sub_mb_pred_state == `sub_mvd_l1_s ||
		sub_mb_pred_state == `sub_ref_idx_l0_s||sub_mb_pred_state == `sub_ref_idx_l1_s )
			NumMbPart = 3'd4;
	else 
		NumMbPart = 3'd0;	

always @ (sub_mb_pred_state or mbPartIdx or sub_mb_type_reg)
	if (sub_mb_pred_state == `sub_mvd_l0_s||sub_mb_pred_state == `sub_mvd_l1_s)
		case (mbPartIdx)
		0:
			case (sub_mb_type_reg[1:0])
			2'b00      :NumSubMbPart = 3'd1;
			2'b01,2'b10:NumSubMbPart = 3'd2;
			2'b11      :NumSubMbPart = 3'd4;
			endcase
		1:
			case (sub_mb_type_reg[3:2])
			2'b00      :NumSubMbPart = 3'd1;
			2'b01,2'b10:NumSubMbPart = 3'd2;
			2'b11      :NumSubMbPart = 3'd4;
			endcase
		2:
			case (sub_mb_type_reg[5:4])
			2'b00      :NumSubMbPart = 3'd1;
			2'b01,2'b10:NumSubMbPart = 3'd2;
			2'b11      :NumSubMbPart = 3'd4;
			endcase
		3:
			case (sub_mb_type_reg[7:6])
			2'b00      :NumSubMbPart = 3'd1;
			2'b01,2'b10:NumSubMbPart = 3'd2;
			2'b11      :NumSubMbPart = 3'd4;
			endcase
			endcase
		else
			NumSubMbPart = 0;
						
always @ (posedge clk)
	if (reset_n == 1'b0)
		mv_below8x8 <= 4'b0;
	else if (sub_mb_pred_state == `sub_mb_type_s && slice_type == `slice_type_p)
		case (mbPartIdx)
			0:mv_below8x8[0] <= (exp_golomb_decoding_output[1:0] == 2'b00)? 1'b0:1'b1; 
			1:mv_below8x8[1] <= (exp_golomb_decoding_output[1:0] == 2'b00)? 1'b0:1'b1; 
			2:mv_below8x8[2] <= (exp_golomb_decoding_output[1:0] == 2'b00)? 1'b0:1'b1; 
			3:mv_below8x8[3] <= (exp_golomb_decoding_output[1:0] == 2'b00)? 1'b0:1'b1; 
		endcase
	else if (sub_mb_pred_state == `sub_mb_type_s && slice_type == `slice_type_b)
		case (mbPartIdx)
			0:mv_below8x8[0] <= (sub_mb_type_B == 0)? 1'b0:1'b1; 
			1:mv_below8x8[1] <= (sub_mb_type_B == 0)? 1'b0:1'b1; 
			2:mv_below8x8[2] <= (sub_mb_type_B == 0)? 1'b0:1'b1; 
			3:mv_below8x8[3] <= (sub_mb_type_B == 0)? 1'b0:1'b1; 
		endcase
	else if (slice_data_state == `mb_pred || slice_data_state == `skip_run_duration)
			mv_below8x8 <= 4'b0;	

		
		
		


always@(num_ref_idx_l0_active_minus1_curr or mb_type_general or sub_mb_pred_state or slice_type or sub_mb_type or SubMbPredMode)
	if(sub_mb_pred_state == `sub_ref_idx_l0_s)
		if(num_ref_idx_l0_active_minus1_curr == 0 || mb_type_general == `MB_P_8x8ref0 || 
			(slice_type == `slice_type_b && ((sub_mb_type == 0 && SubMbPredMode == `B_sub_Direct)||
			(SubMbPredMode == `B_sub_Pred_L1))))
			sub_ref_idx_l0_en = 0;
		else	sub_ref_idx_l0_en = 1;

always@(num_ref_idx_l1_active_minus1_curr or sub_mb_pred_state or slice_type or sub_mb_type or SubMbPredMode)
	if(sub_mb_pred_state == `sub_ref_idx_l1_s)
		if(num_ref_idx_l1_active_minus1_curr == 0 || slice_type == `slice_type_p ||
			(slice_type == `slice_type_b && ((sub_mb_type == 0 && SubMbPredMode == `B_sub_Direct)||
			(SubMbPredMode == `B_sub_Pred_L0))))
			sub_ref_idx_l1_en = 0;
		else	sub_ref_idx_l1_en = 1;


always@(num_ref_idx_l0_active_minus1_curr or mb_pred_state or mbPartIdx or slice_type or B_MbPartPredMode_0 or B_MbPartPredMode_1)
	if(mb_pred_state == `ref_idx_l0_s)
		if(num_ref_idx_l0_active_minus1_curr == 0 || 
		(slice_type == `slice_type_b &&((mbPartIdx == 0 && B_MbPartPredMode_0 == `B_Pred_L1)||
			(mbPartIdx == 1 && B_MbPartPredMode_1 == `B_Pred_L1) || B_MbPartPredMode_0 == `B_Direct)))
			ref_idx_l0_en = 0;
		else    ref_idx_l0_en = 1;

always@(num_ref_idx_l1_active_minus1_curr or mb_pred_state or mbPartIdx or slice_type or B_MbPartPredMode_0 or B_MbPartPredMode_1)
	if(mb_pred_state == `ref_idx_l1_s)
		if(num_ref_idx_l1_active_minus1_curr == 0 || slice_type == `slice_type_p ||
		(slice_type == `slice_type_b &&((mbPartIdx == 0 && B_MbPartPredMode_0 == `B_Pred_L0)||
			(mbPartIdx == 1 && B_MbPartPredMode_1 == `B_Pred_L0) || B_MbPartPredMode_0 == `B_Direct)))
			ref_idx_l1_en = 0;
		else    ref_idx_l1_en = 1;


always@(sub_mb_pred_state or slice_type or sub_mb_type or SubMbPredMode)
	if(sub_mb_pred_state == `sub_mvd_l0_s)
		if(slice_type == `slice_type_b && ((sub_mb_type == 0 && SubMbPredMode == `B_sub_Direct)||
			(SubMbPredMode == `B_sub_Pred_L1)))
			sub_mvd_l0_en = 0;
		else	sub_mvd_l0_en = 1;
			
always@(sub_mb_pred_state or slice_type or sub_mb_type or SubMbPredMode)
	if(sub_mb_pred_state == `sub_mvd_l1_s)
		if((slice_type == `slice_type_b && ((sub_mb_type == 0 && SubMbPredMode == `B_sub_Direct)||
			(SubMbPredMode == `B_sub_Pred_L0)))||slice_type == `slice_type_p)
			sub_mvd_l1_en = 0;
		else	sub_mvd_l1_en = 1;

always@(mb_pred_state or  mbPartIdx or slice_type or B_MbPartPredMode_0 or B_MbPartPredMode_1)
	if(mb_pred_state ==  `mvd_l0_s)
		if(slice_type == `slice_type_b &&((mbPartIdx == 0 && B_MbPartPredMode_0 == `B_Pred_L1)||
			(mbPartIdx == 1 && B_MbPartPredMode_1 == `B_Pred_L1) || B_MbPartPredMode_0 == `B_Direct))
			mvd_l0_en = 0;
		else    mvd_l0_en = 1;

always@(mb_pred_state or  mbPartIdx or slice_type or B_MbPartPredMode_0 or B_MbPartPredMode_1)
	if(mb_pred_state ==  `mvd_l1_s)
		if((slice_type == `slice_type_b &&((mbPartIdx == 0 && B_MbPartPredMode_0 == `B_Pred_L0)||
			(mbPartIdx == 1 && B_MbPartPredMode_1 == `B_Pred_L0) || B_MbPartPredMode_0 == `B_Direct))
			||slice_type == `slice_type_p)
			mvd_l1_en = 0;
		else    mvd_l1_en = 1;


endmodule
