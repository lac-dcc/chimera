`include "timescale.v"
`include "define.v"

module BitStream_parser_FSM(
input clk,reset_n,
input start_code_prefix_found,
input num_ref_idx_active_override_flag,deblocking_filter_control_present_flag,
input [1:0] nal_ref_idc,
input [4:0] nal_unit_type,
input [2:0] pc_2to0,
input [3:0] pc_6to3,
input [15:0] BitStream_buffer_output,
input [31:0] BitStream_buffer_output_ex32,
input [15:0] removed_03,
input [2:0] slice_type,
input [1:0] weighted_bipred_idc,
input [3:0] mb_type_general,
input [1:0] disable_deblocking_filter_idc,pic_order_cnt_type,
input [2:0] NumMbPart,NumSubMbPart, 
input adaptive_ref_pic_marking_mode_flag,
input [2:0] memory_management_control_operation,
input prev_intra4x4_pred_mode_flag,weighted_pred_flag,
input delta_pic_order_always_zero_flag,entropy_coding_mode_flag,
input [3:0] CodedBlockPatternLuma,
input [1:0] CodedBlockPatternChroma,
input [4:0] TotalCoeff,
input [1:0] TrailingOnes,
input [3:0] zerosLeft,run,
input intra4x4_read_end,intra16_read_end,cavlc_nc_end,idct_end,end_of_one_residual_block,
input [7:0] pic_width_in_mbs_minus1,pic_height_in_map_units_minus1,
input [7:0] num_ref_frames_in_pic_order_cnt_cycle,
input ref_pic_list_reordering_flag_l0,ref_pic_list_reordering_flag_l1,
input end_of_MB_DF,end_of_lastMB_DF,Inter_end,b_col_end,
input [1:0] reordering_of_pic_nums_idc,
input [9:0] mb_skip_run,
input POC_end,refbuild_end,
input [2:0] B_MbPartPredMode_0,
input [3:0] num_ref_idx_l0_active_minus1_curr,num_ref_idx_l1_active_minus1_curr,
input luma_weight_l0_flag,chroma_weight_l0_flag,
input luma_weight_l1_flag,chroma_weight_l1_flag,

input cal_abs_diff_end,cal_long_term_end,

output reg [1:0] parser_state,
output reg [3:0] nal_unit_state,
output reg [4:0] seq_parameter_set_state,
output reg [3:0] pic_parameter_set_state,
output reg [4:0] slice_header_state,
output reg [2:0] ref_pic_list_reordering_state,dec_ref_pic_marking_state,
output reg [2:0] residual_intra4x4_state,residual_intra16_state,residual_inter_state,
output reg [3:0] cavlc_decoder_state,slice_data_state,
output reg [2:0] sub_mb_pred_state,mb_pred_state,
output reg [4:0] pred_weight_table_state,
output reg [3:0] luma4x4BlkIdx,
output slice_header_s6,heading_one_en,p_skip_end,residual_end,Is_skip_run_end,res_0,end_of_mb_sum,
output weighted_pred_en,
output reg compIdx,
output reg [1:0] mbPartIdx,subMbPartIdx,
output reg Is_skip_run_entry,end_of_MB_DEC,IsRunLoop,suffix_length_initialized,
output reg [7:0] num_ref_frames_in_pic_order_cnt_cycle_i,
output reg [15:0] mb_num,
output reg [7:0] mb_num_h,mb_num_v,mb_num_h_pred,mb_num_v_pred,
output reg [4:0] intra4x4_pred_num,intra16_pred_num,
output reg [3:0] coeffNum,i_level,i_run,i_TotalCoeff,
output reg reordering_of_pic_nums_idc_l1
);

reg [1:0] slice_layer_wo_partitioning_state;
reg [9:0] count_mb_skip_run;
reg [3:0] coeffNum_reg;
wire end_slice_data;
wire nal_unit_end,sps_end,pps_end,slice_header_end,slice_end,cavlc_end;

reg [31:0] nal_end_flag;
always@(pc_2to0 or BitStream_buffer_output or BitStream_buffer_output_ex32)
	case(pc_2to0)
	0:nal_end_flag = {BitStream_buffer_output[7:0],BitStream_buffer_output_ex32[31:8]};
	1:nal_end_flag = {BitStream_buffer_output[8:0],BitStream_buffer_output_ex32[31:9]};
	2:nal_end_flag = {BitStream_buffer_output[9:0],BitStream_buffer_output_ex32[31:10]};
	3:nal_end_flag = {BitStream_buffer_output[10:0],BitStream_buffer_output_ex32[31:11]};
	4:nal_end_flag = {BitStream_buffer_output[11:0],BitStream_buffer_output_ex32[31:12]};
	5:nal_end_flag = {BitStream_buffer_output[12:0],BitStream_buffer_output_ex32[31:13]};
	6:nal_end_flag = {BitStream_buffer_output[13:0],BitStream_buffer_output_ex32[31:14]};
	7:nal_end_flag = {BitStream_buffer_output[14:0],BitStream_buffer_output_ex32[31:15]};
	endcase

reg removed_03_flag;
always@(pc_6to3 or removed_03)
	case(pc_6to3)
	0:removed_03_flag = removed_03[11];
	1:removed_03_flag = removed_03[10];
	2:removed_03_flag = removed_03[9] ;
	3:removed_03_flag = removed_03[8] ;
	4:removed_03_flag = removed_03[7] ;
	5:removed_03_flag = removed_03[6] ;
	6:removed_03_flag = removed_03[5] ;
	7:removed_03_flag = removed_03[4] ;
	8:removed_03_flag = removed_03[3] ;
	9:removed_03_flag = removed_03[2] ;
	10:removed_03_flag = removed_03[1] ;
	11:removed_03_flag = removed_03[0] ;
	12:removed_03_flag = removed_03[15];
	13:removed_03_flag = removed_03[14];
	14:removed_03_flag = removed_03[13];
	15:removed_03_flag = removed_03[12];
	endcase




wire [15:0] mb_count;

assign 	mb_count = ({8'b0,pic_width_in_mbs_minus1}+1)*({8'b0,pic_height_in_map_units_minus1}+16'd1)-16'd1;
assign residual_end = (residual_intra4x4_state == `intra4x4_updat||residual_inter_state == `inter_updat)&&(intra4x4_pred_num == 5'd25)||
		      (residual_intra16_state == `intra16_updat)&&(intra16_pred_num == 5'd25);

assign nal_unit_end = ((nal_unit_state == `rbsp_trailing_zero_bits) || 
                      ((nal_unit_state == `rbsp_trailing_one_bit)&&(pc_2to0 == 3'b000)));
assign sps_end = seq_parameter_set_state == `vui_parameter_present_flag_s	;
assign pps_end = pic_parameter_set_state == `deblocking_filter_control_2_redundant_pic_cnt_present_flag;

assign slice_header_end = (slice_header_state == `slice_qp_delta_s && deblocking_filter_control_present_flag == 1'b0)||
			  (slice_header_state == `disable_deblocking_filter_idc_s && disable_deblocking_filter_idc == 2'b01)||
			  (slice_header_state == `slice_beta_offset_div2_s) ;

assign slice_end = slice_layer_wo_partitioning_state == `slice_data&&end_slice_data;
assign cavlc_end = (cavlc_decoder_state == `cavlc_0)||
		       (cavlc_decoder_state == `LevelRunCombination&&i_TotalCoeff == 0)||
    	              (cavlc_decoder_state == `NumCoeffTrailingOnes_LUT&&TotalCoeff == 0);



assign end_of_mb_sum  = (residual_intra16_state == `intra16_sum&&intra16_pred_num == 5'd25)||
		    (residual_intra4x4_state == `intra4x4_sum&&intra4x4_pred_num == 5'd25)||
		     (residual_inter_state == `inter_sum&&intra4x4_pred_num == 5'd25);


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		end_of_MB_DEC <= 0;
	else if(residual_intra16_state == `intra16_updat&&intra16_pred_num == 5'd25||
		    residual_intra4x4_state == `intra4x4_updat&&intra4x4_pred_num == 5'd25||
			residual_inter_state == `inter_updat&&intra4x4_pred_num == 5'd25)
		end_of_MB_DEC <= 1;
	else
		end_of_MB_DEC <= 0;

reg PPS_SPS_complete;
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		PPS_SPS_complete <= 1'b0;
	else if (slice_layer_wo_partitioning_state == `slice_header)
		PPS_SPS_complete <= 1'b1;
	else if(nal_unit_state == `seq_parameter_set_rbsp)
		PPS_SPS_complete <= 1'b0;


reg next_slice;
always@(posedge clk or negedge reset_n)
	if(reset_n == 0)
		next_slice <= 0;
	else if(end_of_MB_DF || end_of_lastMB_DF)
		next_slice <= 1;
	else if(nal_unit_state == `rbsp_trailing_one_bit)
		next_slice <= 0;
//---------------
//parser_state
//---------------
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		parser_state <= `rst_parser;
	else
		case (parser_state)
			`rst_parser		:parser_state <= `parser_wait;
			`parser_wait		:parser_state <= (!PPS_SPS_complete)||(PPS_SPS_complete&&next_slice)?
				`start_code_prefix:`parser_wait;
			`start_code_prefix:parser_state <= start_code_prefix_found ? `nal_unit:`start_code_prefix;
			`nal_unit			    :parser_state <= nal_unit_end?`rst_parser:`nal_unit	;
			default:parser_state <= `rst_parser;
		endcase 
			 
//---------------
//nal_unit_state
//---------------
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		nal_unit_state <= `rst_nal_unit;
	else if(parser_state == `nal_unit)
		case (nal_unit_state)
			`rst_nal_unit:nal_unit_state <= `forbidden_zero_bit_2_nal_unit_type;
			`forbidden_zero_bit_2_nal_unit_type:
			case (nal_unit_type)
				5'b00001:nal_unit_state <= `slice_layer_non_IDR_rbsp;
				5'b00101:nal_unit_state <= `slice_layer_IDR_rbsp;
				5'b00111:nal_unit_state <= `seq_parameter_set_rbsp;
				5'b01000:nal_unit_state <= `pic_parameter_set_rbsp;
				5'b00110:nal_unit_state <= `sei_rbsp;
				default:nal_unit_state <= `rbsp_trailing_one_bit;
			endcase
			`slice_layer_non_IDR_rbsp,`slice_layer_IDR_rbsp:if(slice_end) nal_unit_state<=`rbsp_trailing_one_bit;
			`seq_parameter_set_rbsp :nal_unit_state <= sps_end?`rbsp_trailing_one_bit:`seq_parameter_set_rbsp;
			`pic_parameter_set_rbsp :nal_unit_state <= pps_end?`rbsp_trailing_one_bit:`pic_parameter_set_rbsp;
			`sei_rbsp		:nal_unit_state <=`rbsp_trailing_one_bit;
			`rbsp_trailing_one_bit  :nal_unit_state <= (pc_2to0 == 3'b000)? `rst_nal_unit:`rbsp_trailing_zero_bits;
			`rbsp_trailing_zero_bits:nal_unit_state <= `rst_nal_unit;
			default			:nal_unit_state <= `rst_nal_unit;
		endcase
		
//---------------
//seq_parameter_set_state
//---------------



always @ (posedge clk or negedge reset_n)
		if (reset_n == 0)
			seq_parameter_set_state <= `rst_seq_parameter_set;
		else if(nal_unit_state == `seq_parameter_set_rbsp)
			case (seq_parameter_set_state)
				`rst_seq_parameter_set	:seq_parameter_set_state <= `fixed_header;
				`fixed_header           :seq_parameter_set_state <= `level_idc_s;
				`level_idc_s		:seq_parameter_set_state <= `seq_parameter_set_id_sps_s;
				`seq_parameter_set_id_sps_s	 :seq_parameter_set_state <= `log2_max_frame_num_minus4_s;
				`log2_max_frame_num_minus4_s	:seq_parameter_set_state <= `pic_order_cnt_type_s;
				`pic_order_cnt_type_s		:seq_parameter_set_state <= pic_order_cnt_type==0?`log2_max_pic_order_cnt_lsb_minus4_s:
								(pic_order_cnt_type==1?`delta_pic_order_always_zero_flag:`num_ref_frames_s);
				`log2_max_pic_order_cnt_lsb_minus4_s	:seq_parameter_set_state <= `num_ref_frames_s;
				//poc_type == 1
				`delta_pic_order_always_zero_flag	:seq_parameter_set_state <= `offset_for_non_ref_pic;
				`offset_for_non_ref_pic			:seq_parameter_set_state <= `offset_for_top_to_bottom_field;
				`offset_for_top_to_bottom_field		:seq_parameter_set_state <= `num_ref_frames_in_pic_order_cnt_cycle;
 				`num_ref_frames_in_pic_order_cnt_cycle  :seq_parameter_set_state <= 
								num_ref_frames_in_pic_order_cnt_cycle == 0?
								`num_ref_frames_s:`offset_for_ref_frame;
				`offset_for_ref_frame			:seq_parameter_set_state <= 
								(num_ref_frames_in_pic_order_cnt_cycle_i == num_ref_frames_in_pic_order_cnt_cycle - 1)?
								`num_ref_frames_s:`offset_for_ref_frame;


				`num_ref_frames_s			:seq_parameter_set_state <= `gaps_in_frame_num_value_allowed_flag_s;
				`gaps_in_frame_num_value_allowed_flag_s:seq_parameter_set_state <= `pic_width_in_mbs_minus1_s;
				`pic_width_in_mbs_minus1_s		:seq_parameter_set_state <= `pic_height_in_map_units_minus1_s;
				`pic_height_in_map_units_minus1_s	:seq_parameter_set_state <= `frame_mbs_only_flag_2_frame_cropping_flag;
				`frame_mbs_only_flag_2_frame_cropping_flag:seq_parameter_set_state <= `vui_parameter_present_flag_s;
				`vui_parameter_present_flag_s		:seq_parameter_set_state <= `rst_seq_parameter_set;
				default					:seq_parameter_set_state <= `rst_seq_parameter_set;
			endcase

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		num_ref_frames_in_pic_order_cnt_cycle_i <= 0;
	else if(seq_parameter_set_state == `num_ref_frames_in_pic_order_cnt_cycle)
		num_ref_frames_in_pic_order_cnt_cycle_i <= 0;
	else if(seq_parameter_set_state == `offset_for_ref_frame)
		num_ref_frames_in_pic_order_cnt_cycle_i <= num_ref_frames_in_pic_order_cnt_cycle_i + 1;
	
//---------------
//pic_parameter_set_state
//---------------			
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		pic_parameter_set_state <= `rst_pic_parameter_set;
	else  if(nal_unit_state == `pic_parameter_set_rbsp)
		case (pic_parameter_set_state)
			`rst_pic_parameter_set				       :pic_parameter_set_state <= `pic_parameter_set_id_pps_s;
			`pic_parameter_set_id_pps_s			       :pic_parameter_set_state <= `seq_parameter_set_id_pps_s;
			`seq_parameter_set_id_pps_s			       :pic_parameter_set_state <= `entropy_coding_mode_flag_2_pic_order_present_flag;
			`entropy_coding_mode_flag_2_pic_order_present_flag     :pic_parameter_set_state <= `num_slice_groups_minus1_s;
			`num_slice_groups_minus1_s			       :pic_parameter_set_state <= `num_ref_idx_l0_active_minus1_pps_s;

	   		`num_ref_idx_l0_active_minus1_pps_s	               :pic_parameter_set_state <= `num_ref_idx_l1_active_minus1_pps_s;
			`num_ref_idx_l1_active_minus1_pps_s	               :pic_parameter_set_state <= `weighted_pred_flag_2_weighted_bipred_idc;
			`weighted_pred_flag_2_weighted_bipred_idc              :pic_parameter_set_state <= `pic_init_qp_minus26_s;
			`pic_init_qp_minus26_s				       :pic_parameter_set_state <= `pic_init_qs_minus26_s;
			`pic_init_qs_minus26_s				       :pic_parameter_set_state <= `chroma_qp_index_offset_s;
			`chroma_qp_index_offset_s			       :pic_parameter_set_state <= `deblocking_filter_control_2_redundant_pic_cnt_present_flag;
			`deblocking_filter_control_2_redundant_pic_cnt_present_flag:pic_parameter_set_state <= `rst_pic_parameter_set;
			default							:pic_parameter_set_state <= `rst_pic_parameter_set;
		endcase


//---------------
//sei_state
//---------------	


	
//---------------
//slice_layer_wo_partitioning_state
//---------------	

//wire slice_cabac_init_end;
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		slice_layer_wo_partitioning_state <= `rst_slice_layer_wo_partitioning;
	else  if((nal_unit_state == `slice_layer_IDR_rbsp)||(nal_unit_state == `slice_layer_non_IDR_rbsp))
		case (slice_layer_wo_partitioning_state)
		`rst_slice_layer_wo_partitioning:slice_layer_wo_partitioning_state <= `slice_header;
		`slice_header			:slice_layer_wo_partitioning_state <= slice_header_end?`slice_data:`slice_header;

		//`slice_cabac_init		:slice_layer_wo_partitioning_state <= slice_cabac_init_end?`slice_data:`slice_cabac_init;

		`slice_data			:slice_layer_wo_partitioning_state <= end_slice_data?`rst_slice_layer_wo_partitioning:`slice_data;
		default				:slice_layer_wo_partitioning_state <= `rst_slice_layer_wo_partitioning;
		endcase
			
//---------------
//slice_header_state
//---------------			


wire ref_pic_list_reordering_end;
wire dec_ref_pic_marking_end;

assign weighted_pred_en = (weighted_pred_flag && slice_type == `slice_type_p)||
			  (weighted_bipred_idc == 2'b1 && slice_type == `slice_type_b);
		
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		slice_header_state            <= `rst_slice_header;
		end
	else if(slice_layer_wo_partitioning_state == `slice_header)
		case (slice_header_state)
		`rst_slice_header                   :slice_header_state <= `first_mb_in_slice_s;
		`first_mb_in_slice_s                :slice_header_state <= `slice_type_s;
		`slice_type_s                       :slice_header_state <= `pic_parameter_set_id_slice_header_s;
		`pic_parameter_set_id_slice_header_s:slice_header_state <= `frame_num_s;
		`frame_num_s:
			if (nal_unit_type == 5'b00101)	      slice_header_state <= `idr_pic_id_s;
			else if(pic_order_cnt_type == 0)      slice_header_state <= `pic_order_cnt_lsb_s;
			else if(pic_order_cnt_type == 1)      slice_header_state <= `delta_pic_order_cnt_s;
			else if(slice_type == `slice_type_b)  slice_header_state <= `direct_spatial_mv_pred_flag_s;
			else if (slice_type == `slice_type_p) slice_header_state <= `num_ref_idx_active_override_flag_s;
			else                                  slice_header_state <= `slice_header_POC;
		`idr_pic_id_s:  
			if(pic_order_cnt_type == 2'b10)
				case(slice_type)
				`slice_type_b:slice_header_state <= `direct_spatial_mv_pred_flag_s;
				`slice_type_p:slice_header_state <= `num_ref_idx_active_override_flag_s;
				default:slice_header_state <= `slice_header_POC;
				endcase
			else if(pic_order_cnt_type == 2'b01)
				slice_header_state <= `delta_pic_order_cnt_s;
			else    slice_header_state <= `pic_order_cnt_lsb_s;
		`pic_order_cnt_lsb_s,`delta_pic_order_cnt_s:
			if(slice_type == `slice_type_b)      slice_header_state <= `direct_spatial_mv_pred_flag_s;
			else if(slice_type == `slice_type_p) slice_header_state <= `num_ref_idx_active_override_flag_s;//p
			else				     slice_header_state <= `slice_header_POC;
		`direct_spatial_mv_pred_flag_s: slice_header_state <= `num_ref_idx_active_override_flag_s;
		`num_ref_idx_active_override_flag_s:
			if (num_ref_idx_active_override_flag == 1'b1) slice_header_state <= `num_ref_idx_l0_active_minus1_slice_header_s;
			else                                          slice_header_state <= `slice_header_POC;
		`num_ref_idx_l0_active_minus1_slice_header_s :
			if(slice_type == `slice_type_b) slice_header_state <= `num_ref_idx_l1_active_minus1_slice_header_s;
			else 				slice_header_state <= `slice_header_POC;
		`num_ref_idx_l1_active_minus1_slice_header_s: slice_header_state <= `slice_header_POC;

		`slice_header_POC	:slice_header_state <= POC_end?`slice_header_refbuild:`slice_header_POC;
		`slice_header_refbuild	:if(slice_type == `slice_type_i) slice_header_state <= `ref_pic_list_reordering;
					 else slice_header_state <= refbuild_end?`ref_pic_list_reordering:`slice_header_refbuild;


		`ref_pic_list_reordering: slice_header_state <= ref_pic_list_reordering_end ? 
			(weighted_pred_en?`pred_weight_table:nal_ref_idc != 0?`dec_ref_pic_marking:`slice_qp_delta_s):
				`ref_pic_list_reordering;
		`pred_weight_table:	slice_header_state <= pred_weight_table_state == `pred_weight_table_end ? 
							(nal_ref_idc != 0 ? `dec_ref_pic_marking:`slice_qp_delta_s):`pred_weight_table;			
		`dec_ref_pic_marking:slice_header_state <= dec_ref_pic_marking_end ? 
			(entropy_coding_mode_flag && (slice_type == `slice_type_b || slice_type == `slice_type_p) ? 
				`cabac_init_idc_s:`slice_qp_delta_s):`dec_ref_pic_marking;
		`cabac_init_idc_s: slice_header_state <= `slice_qp_delta_s;
		`slice_qp_delta_s:
				slice_header_state <= (deblocking_filter_control_present_flag == 1'b1)? `disable_deblocking_filter_idc_s:`rst_slice_header;
		`disable_deblocking_filter_idc_s:
				slice_header_state <= (disable_deblocking_filter_idc != 2'b01)? `slice_alpha_c0_offset_div2_s:`rst_slice_header;//
		`slice_alpha_c0_offset_div2_s      :slice_header_state <= `slice_beta_offset_div2_s;
		`slice_beta_offset_div2_s	   :slice_header_state <= `rst_slice_header;
		default				   :slice_header_state <= `rst_slice_header;
		endcase
assign slice_header_s6 = (slice_header_state == `frame_num_s)? 1'b1:1'b0;

//--------------------------
//ref_pic_list_reordering
//--------------------------


assign ref_pic_list_reordering_end = (ref_pic_list_reordering_state == `rst_ref_pic_list_reordering && 
		slice_type == `slice_type_i)||
	(ref_pic_list_reordering_state == `ref_pic_list_reordering_flag_l0_s && ref_pic_list_reordering_flag_l0 == 0 && 
		slice_type != `slice_type_b)||
	(ref_pic_list_reordering_state == `reordering_of_pic_nums_idc_s && reordering_of_pic_nums_idc == 3 && 
		(~(slice_type == `slice_type_b && reordering_of_pic_nums_idc_l1 == 0)))||
	(ref_pic_list_reordering_state == `ref_pic_list_reordering_flag_l1_s && ref_pic_list_reordering_flag_l1 == 0);			

always@(posedge clk or negedge reset_n)
	if (reset_n == 0)
		ref_pic_list_reordering_state <= `rst_ref_pic_list_reordering;
	else if(slice_header_state == `ref_pic_list_reordering)
		case (ref_pic_list_reordering_state)
		`rst_ref_pic_list_reordering:
			if (slice_type != `slice_type_i)begin
				reordering_of_pic_nums_idc_l1 <= 0;
				ref_pic_list_reordering_state <= `ref_pic_list_reordering_flag_l0_s;end
			else 	ref_pic_list_reordering_state <= `rst_ref_pic_list_reordering;
		`ref_pic_list_reordering_flag_l0_s:
			if(ref_pic_list_reordering_flag_l0)
				ref_pic_list_reordering_state <= `reordering_of_pic_nums_idc_s;
			else if(slice_type == `slice_type_b)
				ref_pic_list_reordering_state <= `ref_pic_list_reordering_flag_l1_s;
			else 	ref_pic_list_reordering_state <= `rst_ref_pic_list_reordering;
		`reordering_of_pic_nums_idc_s:
			if(reordering_of_pic_nums_idc[1]==0)
				ref_pic_list_reordering_state <= `abs_diff_pic_num_minus1;
			else if(reordering_of_pic_nums_idc == 2)
				ref_pic_list_reordering_state <= `long_term_pic_num;
			else if(slice_type == `slice_type_b && reordering_of_pic_nums_idc_l1 == 0)
				ref_pic_list_reordering_state <= `ref_pic_list_reordering_flag_l1_s;
			else 	ref_pic_list_reordering_state <= `rst_ref_pic_list_reordering;
		`abs_diff_pic_num_minus1:ref_pic_list_reordering_state <= `cal_abs_diff_pic_num;
		`long_term_pic_num:      ref_pic_list_reordering_state <= `cal_long_term_pic_num;	
		`cal_abs_diff_pic_num:	ref_pic_list_reordering_state <= 
			cal_abs_diff_end ? `reordering_of_pic_nums_idc_s:`cal_abs_diff_pic_num;
		`cal_long_term_pic_num: ref_pic_list_reordering_state <= 
			cal_long_term_end ? `reordering_of_pic_nums_idc_s:`cal_long_term_pic_num;
		`ref_pic_list_reordering_flag_l1_s:
			if(ref_pic_list_reordering_flag_l1)begin
				reordering_of_pic_nums_idc_l1 <= 1;
				ref_pic_list_reordering_state <= `reordering_of_pic_nums_idc_s;end
			else 	ref_pic_list_reordering_state <= `rst_ref_pic_list_reordering;
		default:;
		endcase

//---------------------
//pred_weight_table		
//---------------------
reg [3:0] i_num_ref_idx_l0_active_minus1_weigth,i_num_ref_idx_l1_active_minus1_weigth;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		i_num_ref_idx_l0_active_minus1_weigth <= 0;
	else if(pred_weight_table_state == `chroma_log2_weight_denom)
		i_num_ref_idx_l0_active_minus1_weigth <= 0;
	else if(pred_weight_table_state == `luma_weight_l0_flag)
		i_num_ref_idx_l0_active_minus1_weigth <= i_num_ref_idx_l0_active_minus1_weigth + 1; 

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		i_num_ref_idx_l1_active_minus1_weigth <= 0;
	else if(pred_weight_table_state == `chroma_log2_weight_denom)
		i_num_ref_idx_l1_active_minus1_weigth <= 0;
	else if(pred_weight_table_state == `luma_weight_l1_flag)
		i_num_ref_idx_l1_active_minus1_weigth <= i_num_ref_idx_l1_active_minus1_weigth + 1; 

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		pred_weight_table_state <= `rst_pred_weight_table;
	else if(slice_header_state == `pred_weight_table)
		case(pred_weight_table_state)
		`rst_pred_weight_table:		pred_weight_table_state <= `luma_log2_weight_denom;
		`luma_log2_weight_denom:	pred_weight_table_state <= `chroma_log2_weight_denom;
		`chroma_log2_weight_denom:	pred_weight_table_state <= `luma_weight_l0_flag;
		`luma_weight_l0_flag:	if(luma_weight_l0_flag)
						pred_weight_table_state <= `luma_weight_l0;
					else	pred_weight_table_state <= `chroma_weight_l0_flag;
		`luma_weight_l0:		pred_weight_table_state <= `luma_offset_l0;
		`luma_offset_l0:		pred_weight_table_state <= `chroma_weight_l0_flag;
		`chroma_weight_l0_flag:	if(chroma_weight_l0_flag)
						pred_weight_table_state <= `chroma_weight_l0_j0;
					else if(i_num_ref_idx_l0_active_minus1_weigth <= num_ref_idx_l0_active_minus1_curr)  
						pred_weight_table_state <= `luma_weight_l0_flag;
					else if(slice_type == `slice_type_b)
						pred_weight_table_state <= `luma_weight_l1_flag;
					else    pred_weight_table_state <= `pred_weight_table_end;
		`chroma_weight_l0_j0:		pred_weight_table_state <= `chroma_offset_l0_j0;
		`chroma_offset_l0_j0:		pred_weight_table_state <= `chroma_weight_l0_j1;
		`chroma_weight_l0_j1:		pred_weight_table_state <= `chroma_offset_l0_j1;
		`chroma_offset_l0_j1:	if(i_num_ref_idx_l0_active_minus1_weigth <= num_ref_idx_l0_active_minus1_curr)  
						pred_weight_table_state <= `luma_weight_l0_flag;
					else if(slice_type == `slice_type_b)
						pred_weight_table_state <= `luma_weight_l1_flag;
					else    pred_weight_table_state <= `pred_weight_table_end;
		`luma_weight_l1_flag:	if(luma_weight_l1_flag)
						pred_weight_table_state <= `luma_weight_l1;
					else	pred_weight_table_state <= `chroma_weight_l1_flag;
		`luma_weight_l1:		pred_weight_table_state <= `luma_offset_l1;
		`luma_offset_l1:		pred_weight_table_state <= `chroma_weight_l1_flag;
		`chroma_weight_l1_flag:	if(chroma_weight_l1_flag)
						pred_weight_table_state <= `chroma_weight_l1_j0;
					else if(i_num_ref_idx_l1_active_minus1_weigth <= num_ref_idx_l1_active_minus1_curr)  
						pred_weight_table_state <= `luma_weight_l1_flag;
					else    pred_weight_table_state <= `pred_weight_table_end;
		`chroma_weight_l1_j0:		pred_weight_table_state <= `chroma_offset_l1_j0;
		`chroma_offset_l1_j0:		pred_weight_table_state <= `chroma_weight_l1_j1;
		`chroma_weight_l1_j1:		pred_weight_table_state <= `chroma_offset_l1_j1;
		`chroma_offset_l1_j1:	if(i_num_ref_idx_l0_active_minus1_weigth <= num_ref_idx_l0_active_minus1_curr)  
						pred_weight_table_state <= `luma_weight_l0_flag;
					else    pred_weight_table_state <= `pred_weight_table_end;
		`pred_weight_table_end:		pred_weight_table_state <= `rst_pred_weight_table;
		default:			pred_weight_table_state <= `pred_weight_table_end;
		endcase
						


//--------------------------
//dec_ref_pic_marking
//--------------------------

assign dec_ref_pic_marking_end = dec_ref_pic_marking_state == `no_output_of_prior_pics_flag_2_long_term_reference_flag || 
		(dec_ref_pic_marking_state == `adaptive_ref_pic_marking_mode_flag_s && adaptive_ref_pic_marking_mode_flag == 0) ||
		(dec_ref_pic_marking_state == `memory_management_control_operation_s && memory_management_control_operation == 0);


always@(posedge clk or negedge reset_n)
	if (reset_n == 0)
		dec_ref_pic_marking_state     <= `rst_dec_ref_pic_marking;
	else if(slice_header_state == `dec_ref_pic_marking)
		case(dec_ref_pic_marking_state)
		`rst_dec_ref_pic_marking:
			dec_ref_pic_marking_state <= (nal_unit_type == 5'b00101)? 
				`no_output_of_prior_pics_flag_2_long_term_reference_flag:`adaptive_ref_pic_marking_mode_flag_s;
		`no_output_of_prior_pics_flag_2_long_term_reference_flag:
			dec_ref_pic_marking_state <= `rst_dec_ref_pic_marking;
		`adaptive_ref_pic_marking_mode_flag_s:
			if(adaptive_ref_pic_marking_mode_flag)
				dec_ref_pic_marking_state <= `memory_management_control_operation_s;
			else    dec_ref_pic_marking_state <= `rst_dec_ref_pic_marking;
		`memory_management_control_operation_s:
			if(memory_management_control_operation == 1 ||memory_management_control_operation == 3)
				dec_ref_pic_marking_state <= `difference_of_pic_nums_minus1_s;
			else if(memory_management_control_operation == 2)
				dec_ref_pic_marking_state <= `long_term_pic_num_s;
			else if(memory_management_control_operation == 6)
				dec_ref_pic_marking_state <= `long_term_frame_idx_s;
			else if(memory_management_control_operation == 4)
				dec_ref_pic_marking_state <= `max_long_term_frame_idx_plus1_s;
			else if(memory_management_control_operation == 0)
				dec_ref_pic_marking_state <= `rst_dec_ref_pic_marking;			
			else	dec_ref_pic_marking_state <= `memory_management_control_operation_s;
		`difference_of_pic_nums_minus1_s:
			if(memory_management_control_operation == 3)
				dec_ref_pic_marking_state <= `long_term_frame_idx_s;
			else    dec_ref_pic_marking_state <= `memory_management_control_operation_s;
		`long_term_pic_num_s,`long_term_frame_idx_s,`max_long_term_frame_idx_plus1_s:
			dec_ref_pic_marking_state <= `memory_management_control_operation_s;
		default:
			dec_ref_pic_marking_state <= `rst_dec_ref_pic_marking;	
		endcase
//---------------
//slice_data		
//---------------	

		
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		Is_skip_run_entry <= 1'b0;
	else if ((slice_data_state == `mb_skip_run_s && mb_skip_run != 0 && slice_type == `slice_type_p)||
		(slice_data_state == `b_skip_col && b_col_end))
		Is_skip_run_entry <= 1'b1;
	else
		Is_skip_run_entry <= 1'b0;
			
assign Is_skip_run_end = (mb_num == mb_count || count_mb_skip_run == mb_skip_run - 1 )? 1'b1:1'b0;
assign p_skip_end = slice_data_state == `skip_run_duration &&residual_inter_state == `inter_updat&&intra4x4_pred_num == 5'd25;
assign end_slice_data = nal_end_flag == 32'h00000001 && (slice_data_state==`mb_num_update||
			(slice_data_state==`skip_run_duration && Is_skip_run_end && p_skip_end)) && removed_03_flag == 0
			&& mb_num_h == pic_width_in_mbs_minus1;
	

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
			slice_data_state 	<= `rst_slice_data;
			mb_pred_state 		  <= `rst_mb_pred;
			sub_mb_pred_state <= `rst_sub_mb_pred;end
	else if(slice_layer_wo_partitioning_state == `slice_data)
    		case (slice_data_state)
		`rst_slice_data   :slice_data_state <= entropy_coding_mode_flag ?
				(pc_2to0 != 0 ? `cabac_alignment_one_bit: slice_type != `slice_type_i ? `mb_skip_flag :`mb_type_s ):
				(slice_type != `slice_type_i ? `mb_skip_run_s:`mb_type_s); 
		`cabac_alignment_one_bit:slice_data_state <= pc_2to0 != 0 ? `cabac_alignment_one_bit: 
					  	slice_type != `slice_type_i ? `mb_skip_flag :`mb_type_s;
		`mb_skip_flag:	slice_data_state <= /*mb_skip_flag ? (slice_type == `slice_type_b ? `b_skip_col:`skip_run_duration):*/
						`mb_type_s;
		`mb_skip_run_s    :slice_data_state <= mb_skip_run == 0 ? `mb_type_s:
					(slice_type == `slice_type_b ? `b_skip_col:`skip_run_duration);

		`b_skip_col:	slice_data_state <= b_col_end ? `skip_run_duration:`b_skip_col;
		`skip_run_duration:slice_data_state <= end_slice_data? `rst_slice_data:
					p_skip_end ? `skip_run_updat: `skip_run_duration;
		`skip_run_updat:   slice_data_state <= (count_mb_skip_run < mb_skip_run && entropy_coding_mode_flag == 0)? 
					(slice_type == `slice_type_b ? `b_skip_col:`skip_run_duration):
					(entropy_coding_mode_flag ?`mb_skip_flag : `mb_type_s);
		
		`mb_type_s:	if(slice_type == `slice_type_b && (B_MbPartPredMode_0 == `B_Direct || mb_type_general == `MB_B_8x8))
					slice_data_state <= `b_direct_col;
				else if(mb_type_general == `MB_P_8x8 || mb_type_general == `MB_P_8x8ref0)
					slice_data_state <= `sub_mb_pred;
				else	slice_data_state <= `mb_pred;
		`b_direct_col:	slice_data_state <= b_col_end ? (mb_type_general == `MB_B_8x8 ? `sub_mb_pred:`mb_pred):`b_direct_col;							
		`sub_mb_pred:
			case (sub_mb_pred_state)
			`rst_sub_mb_pred:sub_mb_pred_state <= `sub_mb_type_s;
			`sub_mb_type_s	:sub_mb_pred_state <= (mbPartIdx == 2'b11)?`sub_ref_idx_l0_s:`sub_mb_type_s;
			`sub_ref_idx_l0_s:if (mbPartIdx == 2'b11)
					sub_mb_pred_state <= `sub_ref_idx_l1_s;
			`sub_ref_idx_l1_s:if (mbPartIdx == 2'b11)
					sub_mb_pred_state <= `sub_mvd_l0_s;
			`sub_mvd_l0_s:if (mbPartIdx == 2'b11 && {1'b0,subMbPartIdx} == (NumSubMbPart - 1) && compIdx == 1'b1)
					sub_mb_pred_state <= `sub_mvd_l1_s;				
			`sub_mvd_l1_s:
				if (mbPartIdx == 2'b11 && {1'b0,subMbPartIdx} == (NumSubMbPart - 1) && compIdx == 1'b1)	begin
					sub_mb_pred_state <= `rst_sub_mb_pred;
					slice_data_state  <= `coded_block_pattern_s;
				end
			default:;
			endcase
		`mb_pred:
			 case (mb_pred_state)
			`rst_mb_pred:
			 	if (mb_type_general[3] == 1'b1) //Intra
					mb_pred_state <= (mb_type_general == `MB_Intra4x4)? `prev_intra4x4_pred_mode_flag_s:`intra_chroma_pred_mode_s;
				else	mb_pred_state  <= `ref_idx_l0_s;
			`prev_intra4x4_pred_mode_flag_s:
				mb_pred_state <= (prev_intra4x4_pred_mode_flag == 1'b0)? `rem_intra4x4_pred_mode_s:
						(luma4x4BlkIdx == 4'b1111)? `intra_chroma_pred_mode_s:`prev_intra4x4_pred_mode_flag_s; 
			`rem_intra4x4_pred_mode_s:
				mb_pred_state <= (luma4x4BlkIdx == 4'b1111)? `intra_chroma_pred_mode_s:`prev_intra4x4_pred_mode_flag_s; 
			`intra_chroma_pred_mode_s:begin
				mb_pred_state    <= `rst_mb_pred;
				slice_data_state <= (mb_type_general[3:2] != 2'b10)? `coded_block_pattern_s:`mb_qp_delta_s;end
			`ref_idx_l0_s:
				if ({1'b0,mbPartIdx} == (NumMbPart - 1))
					mb_pred_state  <= `ref_idx_l1_s;
			`ref_idx_l1_s:
				if ({1'b0,mbPartIdx} == (NumMbPart - 1))
					mb_pred_state  <= `mvd_l0_s;
			`mvd_l0_s:if ({1'b0,mbPartIdx} == (NumMbPart - 1) && compIdx == 1'b1)
					mb_pred_state  <= `mvd_l1_s;
			`mvd_l1_s:
				if ({1'b0,mbPartIdx} == (NumMbPart - 1) && compIdx == 1'b1)begin
					mb_pred_state    <= `rst_mb_pred;
					slice_data_state <= `coded_block_pattern_s;end
			default:;
			endcase
		`coded_block_pattern_s:slice_data_state <= 
				(CodedBlockPatternLuma == 0 && CodedBlockPatternChroma == 0 && mb_type_general[3:2] != 2'b10)? 
					`residual:`mb_qp_delta_s;
		`mb_qp_delta_s: slice_data_state <= `residual;
		`residual:slice_data_state <= residual_end?`mb_num_update:`residual;//`mb_num_update;
		`mb_num_update:slice_data_state <= `rst_slice_data;//`rst_slice_data;
		default:;
		endcase	

//---------------
//	residual
//---------------	
reg [4:0] maxNumCoeff;

//intra4x4
always @ (posedge clk or negedge reset_n)
		if (reset_n == 1'b0)
			residual_intra4x4_state <= `rst_residual_intra4x4;
		else if(slice_data_state == `residual && mb_type_general == `MB_Intra4x4)
			case (residual_intra4x4_state)
				`rst_residual_intra4x4:  residual_intra4x4_state <= (intra4x4_pred_num == 5'd16||intra4x4_pred_num == 5'd17)?`intra4x4_cavlc:`intra4x4_read;
				`intra4x4_read: residual_intra4x4_state <= intra4x4_read_end?`intra4x4_pred:`intra4x4_read;
				`intra4x4_pred: residual_intra4x4_state <= 
						`intra4x4_cavlc;
				`intra4x4_cavlc:residual_intra4x4_state <= cavlc_end?`intra4x4_idct:`intra4x4_cavlc;
				`intra4x4_idct: residual_intra4x4_state <= idct_end?
				((intra4x4_pred_num == 5'd16||intra4x4_pred_num == 5'd17)?`intra4x4_updat:`intra4x4_sum):`intra4x4_idct;
				`intra4x4_sum:  residual_intra4x4_state <= `intra4x4_updat;
				`intra4x4_updat:residual_intra4x4_state <= `rst_residual_intra4x4;
				default:;
			endcase
//intra16x16
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		residual_intra16_state <= `rst_residual_intra16;
	else if(slice_data_state == `residual && mb_type_general[3:2] == 2'b10)
	 	case(residual_intra16_state)
			`rst_residual_intra16: residual_intra16_state <= (intra16_pred_num == 5'b11111||intra16_pred_num == 5'd16||intra16_pred_num == 5'd17)?
					`intra16_cavlc:(intra16_pred_num[4]==0&&intra16_pred_num!=0?
					`intra16_pred:`intra16_read);
			`intra16_read: residual_intra16_state <= intra16_read_end?`intra16_pred:`intra16_read;
			`intra16_pred: residual_intra16_state <= `intra16_cavlc;
			`intra16_cavlc:residual_intra16_state <= cavlc_end?`intra16_idct:`intra16_cavlc;
			`intra16_idct: residual_intra16_state <= idct_end?
			((intra16_pred_num == 5'd16||intra16_pred_num == 5'd17||intra16_pred_num == 5'b11111)?
					`intra16_updat:`intra16_sum):`intra16_idct;
			`intra16_sum:  residual_intra16_state <= `intra16_updat;
			`intra16_updat:residual_intra16_state <= `rst_residual_intra16;
			default:;
		endcase


//inter
reg calvc_end_r;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		residual_inter_state <= `rst_residual_inter;
	else if((slice_data_state == `residual && mb_type_general[3] == 0)||slice_data_state == `skip_run_duration)
		case(residual_inter_state)
			`rst_residual_inter:residual_inter_state <= `inter_pred_cavlc;
			`inter_pred_cavlc:residual_inter_state <= Inter_end&&calvc_end_r?`inter_idct:`inter_pred_cavlc;
			`inter_idct:residual_inter_state <= idct_end?
				((intra4x4_pred_num == 5'd16||intra4x4_pred_num == 5'd17)?`inter_updat:`inter_sum):`inter_idct;
			`inter_sum:residual_inter_state <= `inter_updat;
			`inter_updat:residual_inter_state <= `rst_residual_inter;
			default:;
		endcase


always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		calvc_end_r <= 0;
	else if(residual_inter_state == `inter_pred_cavlc && cavlc_end)
		calvc_end_r <= 1;
	else if(residual_inter_state == `inter_idct)
		calvc_end_r <= 0;
	else if(residual_inter_state == `rst_residual_inter && 
		((slice_data_state == `residual && mb_type_general[3] == 0)||slice_data_state == `skip_run_duration))
		calvc_end_r <= 0;



always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
	  maxNumCoeff <= 0;
	else if(residual_intra4x4_state == `intra4x4_read||residual_inter_state == `inter_pred_cavlc)
	  case(intra4x4_pred_num)
	    16,17:      maxNumCoeff <= 4;
	    18,19,20,21,
	    22,23,24,25:maxNumCoeff <= 15;
	    default: maxNumCoeff <= 16;
	   endcase
	else if(slice_data_state == `residual && mb_type_general[3:2] == 2'b10)
	    case(intra16_pred_num)
	    16,17:   maxNumCoeff <= 4;
	    31   :   maxNumCoeff <= 16;
	    default: maxNumCoeff <= 15;
	   endcase
	    
	    
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
	  intra4x4_pred_num <= 5'b0;
	else if(residual_intra4x4_state == `intra4x4_updat||residual_inter_state == `inter_updat)
	  intra4x4_pred_num <= (intra4x4_pred_num == 5'd25)?5'b0:intra4x4_pred_num+1;
	  
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
	  intra16_pred_num <= 5'b11111;
	else if(residual_intra16_state == `intra16_updat)
	  intra16_pred_num <= (intra16_pred_num == 5'd25)?5'b11111:intra16_pred_num+1;




  
//---------------
//	cavlc
//---------------	

assign res_0 = slice_data_state == `skip_run_duration||
	       (CodedBlockPatternLuma[3] == 0 && (intra4x4_pred_num[4:2] == 3'b011||intra16_pred_num[4:2] == 3'b011))||
	       (CodedBlockPatternLuma[2] == 0 && (intra4x4_pred_num[4:2] == 3'b010||intra16_pred_num[4:2] == 3'b010))||
	       (CodedBlockPatternLuma[1] == 0 && (intra4x4_pred_num[4:2] == 3'b001||intra16_pred_num[4:2] == 3'b001))||
	       (CodedBlockPatternLuma[0] == 0 && intra4x4_pred_num[4:2] == 3'b000&&(residual_intra4x4_state != `rst_residual_intra4x4||residual_inter_state != `rst_residual_inter))||
	       (CodedBlockPatternLuma[0] == 0 && intra16_pred_num[4:2] == 3'b000&&residual_intra16_state != `rst_residual_intra16)||
	       (CodedBlockPatternChroma == 0&&(intra4x4_pred_num[4]==1||(intra16_pred_num[4]==1&&intra16_pred_num!=5'b11111)))||
	       (CodedBlockPatternChroma == 1&&intra4x4_pred_num[4]==1&&intra4x4_pred_num != 5'd16&&intra4x4_pred_num != 5'd17)||
	       (CodedBlockPatternChroma == 1&&intra16_pred_num[4]==1&&intra16_pred_num != 5'd16&&intra16_pred_num != 5'd17&&intra16_pred_num!=5'b11111);
 
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		cavlc_decoder_state <= `rst_cavlc_decoder;
	else if(residual_intra4x4_state == `intra4x4_cavlc ||residual_intra16_state == `intra16_cavlc||
			(residual_inter_state == `inter_pred_cavlc && calvc_end_r == 0))
		case (cavlc_decoder_state)
		`rst_cavlc_decoder	:cavlc_decoder_state  <= res_0?`cavlc_0:`nC_decoding_s;
		`nC_decoding_s		   :cavlc_decoder_state <= cavlc_nc_end?`NumCoeffTrailingOnes_LUT:`nC_decoding_s;
		`NumCoeffTrailingOnes_LUT:cavlc_decoder_state <= (TotalCoeff == 0)?`rst_cavlc_decoder:((TrailingOnes == 0)? `LevelPrefix:`TrailingOnesSignFlag); 
		`TrailingOnesSignFlag:cavlc_decoder_state <= (TotalCoeff == {3'b0,TrailingOnes})?`total_zeros_LUT:`LevelPrefix;
		`LevelPrefix         :cavlc_decoder_state <= `LevelSuffix;
		`LevelSuffix         :cavlc_decoder_state <= ({1'b0,i_level} == TotalCoeff-1)? ((TotalCoeff == maxNumCoeff)?`LevelRunCombination:`total_zeros_LUT):`LevelPrefix;
		`total_zeros_LUT     :cavlc_decoder_state <= (TotalCoeff == 1)? `RunOfZeros:`run_before_LUT; 
		`run_before_LUT	     :cavlc_decoder_state <= `RunOfZeros;
		`RunOfZeros	    :cavlc_decoder_state <= ({1'b0,i_run} == (TotalCoeff - 1) || {1'b0,i_run} == (TotalCoeff - 2) || zerosLeft == 0)? `LevelRunCombination:`run_before_LUT;
		`LevelRunCombination :cavlc_decoder_state <= (i_TotalCoeff == 0)? `rst_cavlc_decoder:`LevelRunCombination;
		`cavlc_0:cavlc_decoder_state <= `rst_cavlc_decoder;
		default:;
		endcase

//suffix_length_initialized
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		suffix_length_initialized <= 1'b0;
	else if (cavlc_decoder_state == `rst_cavlc_decoder)
		suffix_length_initialized <= 1'b0;
	else if (cavlc_decoder_state == `LevelPrefix)
		suffix_length_initialized <= 1'b1;
			
//i_level
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		i_level <= 0;
	else if (cavlc_decoder_state == `NumCoeffTrailingOnes_LUT)
		i_level <= 0;
	else if (cavlc_decoder_state == `TrailingOnesSignFlag)
		i_level <= i_level + {2'b0,TrailingOnes};
	else if (cavlc_decoder_state == `LevelSuffix && {1'b0,i_level} != (TotalCoeff-1))
		i_level <= i_level + 1;
			
//i_run
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		i_run <= 0;
	else if (cavlc_decoder_state == `total_zeros_LUT)
		i_run <= 0;
	else if (cavlc_decoder_state == `RunOfZeros && {1'b0,i_run} != (TotalCoeff - 1) && {1'b0,i_run} != (TotalCoeff - 2) && zerosLeft != 0)
		i_run <= i_run + 1;
			
//i_TotalCoeff
wire [4:0] TotalCoeff_minus1;

assign TotalCoeff_minus1 = TotalCoeff - 1;
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		i_TotalCoeff <= 0;  
	//enter from LevelSuffix
	else if (cavlc_decoder_state == `LevelSuffix && {1'b0,i_level} == (TotalCoeff-1) && TotalCoeff == maxNumCoeff)
		i_TotalCoeff <= TotalCoeff_minus1[3:0];
	//enter from RunOfZeros
	else if (cavlc_decoder_state == `RunOfZeros && ({1'b0,i_run} == (TotalCoeff - 1) || {1'b0,i_run} == (TotalCoeff - 2) || zerosLeft == 0))
		i_TotalCoeff <= TotalCoeff_minus1[3:0];  
	//Inside LevelRunCombination loop
	else if (cavlc_decoder_state == `LevelRunCombination && i_TotalCoeff != 0)
		i_TotalCoeff <= i_TotalCoeff-1; 
	
//coeffNum
always @ (cavlc_decoder_state or run or coeffNum_reg)
	  if (cavlc_decoder_state == `rst_cavlc_decoder)
	      coeffNum = 4'b1111;
	  else if (cavlc_decoder_state == `LevelRunCombination)
	      coeffNum = coeffNum_reg + run + 1;
	  else 
	      coeffNum = coeffNum_reg;
	    		
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		coeffNum_reg <= 0;
	else 
		coeffNum_reg <= coeffNum;
		
//IsRunLoop
always @ (posedge clk or negedge reset_n)
		if (reset_n == 1'b0)
			IsRunLoop <= 0;
		else if (cavlc_decoder_state == `RunOfZeros)
			IsRunLoop <= ({1'b0,i_run} == TotalCoeff - 1 || {1'b0,i_run} == TotalCoeff - 2 || zerosLeft == 0)? 1'b0:1'b1;

//mb_num
always @ (posedge clk or negedge reset_n)
		if (reset_n == 1'b0)
			mb_num <= 0;
		else if ((slice_data_state == `skip_run_duration&&p_skip_end) || slice_data_state == `mb_num_update)
			mb_num <= (mb_num == mb_count)? 0:(mb_num + 1);			
			
//mb_num_h
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		mb_num_h <= 0;
	else if ((slice_data_state == `skip_run_duration&&p_skip_end) || slice_data_state == `mb_num_update)
		mb_num_h <= (mb_num_h == pic_width_in_mbs_minus1) ? 0:(mb_num_h + 1);
	
//mb_num_v
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		mb_num_v <= 0;
	else if (((slice_data_state == `skip_run_duration&&p_skip_end) || slice_data_state == `mb_num_update) && mb_num_h == pic_width_in_mbs_minus1)
		mb_num_v <= (mb_num_v == pic_height_in_map_units_minus1) ? 0:(mb_num_v + 1);


always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		mb_num_h_pred <= 0;
	else if ((slice_data_state == `skip_run_duration&&p_skip_end) || slice_data_state == `mb_num_update)
		mb_num_h_pred <= (mb_num_h_pred == pic_width_in_mbs_minus1 || end_slice_data)  ? 0:(mb_num_h_pred + 1);
	
//mb_num_v
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		mb_num_v_pred <= 0;
	else if (((slice_data_state == `skip_run_duration&&p_skip_end) || slice_data_state == `mb_num_update) && mb_num_h_pred == pic_width_in_mbs_minus1)
		mb_num_v_pred <= (mb_num_v_pred == pic_height_in_map_units_minus1)||end_slice_data ? 0:(mb_num_v_pred + 1);


//luma4x4BlkIdx
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		luma4x4BlkIdx <= 0;
	else
		case (mb_pred_state)
			`prev_intra4x4_pred_mode_flag_s:
			if (prev_intra4x4_pred_mode_flag == 1'b1)
				luma4x4BlkIdx <= (luma4x4BlkIdx == 4'b1111)? 0:(luma4x4BlkIdx + 1);
			`rem_intra4x4_pred_mode_s:luma4x4BlkIdx <= (luma4x4BlkIdx == 4'b1111)? 0:(luma4x4BlkIdx + 1);
			default:;
		endcase

always @ (posedge clk or negedge reset_n)
		if (reset_n == 1'b0)
			count_mb_skip_run <= 0;
		else if (slice_data_state == `skip_run_duration&&end_slice_data)
			count_mb_skip_run <= 0;
		else if (slice_data_state == `skip_run_duration&&p_skip_end)
			count_mb_skip_run <= (mb_num == mb_count)? 0:(count_mb_skip_run < (mb_skip_run ))? (count_mb_skip_run + 1):0;
		else if(slice_data_state == `skip_run_updat && !(count_mb_skip_run < mb_skip_run ))
			count_mb_skip_run <= 0;


always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		mbPartIdx <= 0;
	else if (mb_pred_state == `ref_idx_l0_s)
		mbPartIdx <= ({1'b0,mbPartIdx} < (NumMbPart-1))? (mbPartIdx + 1):0;
	else if (mb_pred_state == `ref_idx_l1_s)
		mbPartIdx <= ({1'b0,mbPartIdx} < (NumMbPart-1))? (mbPartIdx + 1):0;
	else if (mb_pred_state == `mvd_l0_s && compIdx == 1'b1)
		mbPartIdx <= ({1'b0,mbPartIdx} < (NumMbPart-1))? (mbPartIdx + 1):0;
	else if (mb_pred_state == `mvd_l1_s && compIdx == 1'b1)
		mbPartIdx <= ({1'b0,mbPartIdx} < (NumMbPart-1))? (mbPartIdx + 1):0;
	else if (sub_mb_pred_state == `sub_mb_type_s)
		mbPartIdx <= (mbPartIdx == 2'b11)? 0:(mbPartIdx + 1);
	else if (sub_mb_pred_state == `sub_ref_idx_l0_s)
		mbPartIdx <= (mbPartIdx == 2'b11)? 0:(mbPartIdx + 1);
	else if (sub_mb_pred_state == `sub_ref_idx_l1_s)
		mbPartIdx <= (mbPartIdx == 2'b11)? 0:(mbPartIdx + 1);
	else if (sub_mb_pred_state == `sub_mvd_l0_s && {1'b0,subMbPartIdx} == NumSubMbPart - 1 && compIdx == 1'b1)
		mbPartIdx <= (mbPartIdx == 2'b11)? 0:(mbPartIdx + 1);
	else if (sub_mb_pred_state == `sub_mvd_l1_s && {1'b0,subMbPartIdx} == NumSubMbPart - 1 && compIdx == 1'b1)
		mbPartIdx <= (mbPartIdx == 2'b11)? 0:(mbPartIdx + 1);

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		compIdx <= 0;
	else if (mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s ||
		 mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)
		compIdx <= ~ compIdx;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		subMbPartIdx <= 0;
	else if (sub_mb_pred_state == `sub_mvd_l0_s && compIdx == 1'b1)
		subMbPartIdx <= ({1'b0,subMbPartIdx} < NumSubMbPart-1)? (subMbPartIdx + 1):0;
	else if (sub_mb_pred_state == `sub_mvd_l1_s && compIdx == 1'b1)
		subMbPartIdx <= ({1'b0,subMbPartIdx} < NumSubMbPart-1)? (subMbPartIdx + 1):0;

assign heading_one_en = (
			seq_parameter_set_state == `seq_parameter_set_id_sps_s ||
			seq_parameter_set_state == `log2_max_frame_num_minus4_s ||
			seq_parameter_set_state == `pic_order_cnt_type_s ||
			seq_parameter_set_state == `log2_max_pic_order_cnt_lsb_minus4_s ||
			seq_parameter_set_state == `offset_for_non_ref_pic	||
			seq_parameter_set_state == `offset_for_top_to_bottom_field||
			seq_parameter_set_state == `num_ref_frames_in_pic_order_cnt_cycle||
			seq_parameter_set_state == `offset_for_ref_frame||
			seq_parameter_set_state == `num_ref_frames_s ||
			seq_parameter_set_state == `pic_width_in_mbs_minus1_s ||
			seq_parameter_set_state == `pic_height_in_map_units_minus1_s ||
			pic_parameter_set_state == `pic_parameter_set_id_pps_s ||
			pic_parameter_set_state == `seq_parameter_set_id_pps_s ||
			pic_parameter_set_state == `num_slice_groups_minus1_s || 
			pic_parameter_set_state == `num_ref_idx_l0_active_minus1_pps_s ||
			pic_parameter_set_state == `num_ref_idx_l1_active_minus1_pps_s ||
			pic_parameter_set_state == `pic_init_qp_minus26_s ||
			pic_parameter_set_state == `pic_init_qs_minus26_s ||
			pic_parameter_set_state == `chroma_qp_index_offset_s||
			slice_header_state == `first_mb_in_slice_s || 
			slice_header_state == `slice_type_s || 
			slice_header_state == `pic_parameter_set_id_slice_header_s ||
			slice_header_state == `idr_pic_id_s ||
			slice_header_state == `delta_pic_order_cnt_s|| 
			slice_header_state == `num_ref_idx_l0_active_minus1_slice_header_s ||
			slice_header_state == `num_ref_idx_l1_active_minus1_slice_header_s||
			slice_header_state == `cabac_init_idc_s ||
			slice_header_state == `slice_qp_delta_s || 
			slice_header_state == `disable_deblocking_filter_idc_s || 
			slice_header_state == `slice_alpha_c0_offset_div2_s ||

			pred_weight_table_state == `luma_log2_weight_denom ||
			pred_weight_table_state == `chroma_log2_weight_denom ||
			pred_weight_table_state == `luma_weight_l0 ||
			pred_weight_table_state == `luma_offset_l0 ||
			pred_weight_table_state == `chroma_weight_l0_j0 ||
			pred_weight_table_state == `chroma_offset_l0_j0 ||
			pred_weight_table_state == `chroma_weight_l0_j1 ||
			pred_weight_table_state == `chroma_offset_l0_j1 ||
			pred_weight_table_state == `luma_weight_l1 ||
			pred_weight_table_state == `luma_offset_l1 ||
			pred_weight_table_state == `chroma_weight_l1_j0 ||
			pred_weight_table_state == `chroma_offset_l1_j0 ||
			pred_weight_table_state == `chroma_weight_l1_j1 ||
			pred_weight_table_state == `chroma_offset_l1_j1 ||

			ref_pic_list_reordering_state == `reordering_of_pic_nums_idc_s||
			ref_pic_list_reordering_state == `abs_diff_pic_num_minus1||
			ref_pic_list_reordering_state == `long_term_pic_num||
			dec_ref_pic_marking_state == `memory_management_control_operation_s||
			dec_ref_pic_marking_state == `difference_of_pic_nums_minus1_s||
			dec_ref_pic_marking_state == `long_term_pic_num_s||
			dec_ref_pic_marking_state == `long_term_frame_idx_s||
			dec_ref_pic_marking_state == `max_long_term_frame_idx_plus1_s||
			slice_data_state == `mb_skip_run_s ||
			slice_data_state == `mb_type_s ||
			slice_data_state == `coded_block_pattern_s || 
			slice_data_state == `mb_qp_delta_s || 
			mb_pred_state == `intra_chroma_pred_mode_s || 
			mb_pred_state == `ref_idx_l0_s||
			mb_pred_state == `ref_idx_l1_s||
			mb_pred_state == `mvd_l0_s ||
			mb_pred_state == `mvd_l1_s ||
			sub_mb_pred_state == `sub_mb_type_s ||
			sub_mb_pred_state == `sub_mvd_l0_s ||
			sub_mb_pred_state == `sub_mvd_l1_s ||
			sub_mb_pred_state == `sub_ref_idx_l0_s||
			sub_mb_pred_state == `sub_ref_idx_l1_s||
			cavlc_decoder_state == `NumCoeffTrailingOnes_LUT ||
			cavlc_decoder_state == `LevelPrefix || 
			cavlc_decoder_state == `total_zeros_LUT)? 1'b0:1'b1;
			
endmodule
