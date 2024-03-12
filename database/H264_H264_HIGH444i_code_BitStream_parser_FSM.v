`include "timescale.v"
`include "define.v"

module BitStream_parser_FSM(
input clk,reset_n,
input start_code_prefix_found,
input deblocking_filter_control_present_flag,
input [1:0] nal_ref_idc,chroma_format_idc,
input [7:0] profile_idc, 
input [4:0] nal_unit_type,
input [2:0] pc_2to0,
input [3:0] pc_6to3,
input [6:0] pc_reg,
input [15:0] BitStream_buffer_output,
input [31:0] BitStream_buffer_output_ex32,
input [15:0] removed_03,
input [2:0] slice_type,
input [1:0] weighted_bipred_idc,
input [5:0] mb_type,
input [3:0] mb_type_general,
input [1:0] disable_deblocking_filter_idc,
input adaptive_ref_pic_marking_mode_flag,
input [2:0] memory_management_control_operation,
input [4:0] TotalCoeff,
input [1:0] TrailingOnes,
input [3:0] zerosLeft,
input intra16_read_end,
input [7:0] pic_width_in_mbs_minus1,pic_height_in_map_units_minus1,
input [1:0] chroma_i8x8,
input [1:0] Intra16x16_predmode,

output reg [1:0] parser_state,
output reg [3:0] nal_unit_state,
output reg [4:0] seq_parameter_set_state,
output reg [3:0] pic_parameter_set_state,
output reg [3:0] slice_header_state,
output reg [2:0] dec_ref_pic_marking_state,
output reg [1:0] residual_intra16_state,
output reg [3:0] cavlc_decoder_state,
output reg [2:0] intra_pred_state,
output reg [1:0] slice_data_state,

output reg [4:0] maxNumCoeff,
output res_0,
output reg cavlc_end_r,
output reg [7:0] mb_num_h,mb_num_v,mb_num_h_slice,mb_num_v_slice,
output reg [5:0] intra16_pred_num,
output reg [3:0] i_level,i_run,i_TotalCoeff,
output slice_end,cavlc_end
);

reg [7:0] mb_num_h_pred,mb_num_v_pred;
reg [1:0] slice_layer_wo_partitioning_state;
wire end_slice_data;
wire nal_unit_end,sps_end,pps_end,slice_header_end;
wire [31:0] nal_end_flag;
wire removed_03_flag;
wire residual_end;



assign residual_end = residual_intra16_state == `intra16_updat && intra16_pred_num == 6'd49 ;
assign nal_unit_end = ((nal_unit_state == `rbsp_trailing_zero_bits) || 
                      ((nal_unit_state == `rbsp_trailing_one_bit)&&(pc_reg[2:0] == 3'b111)));
assign sps_end = seq_parameter_set_state == `vui_parameter_present_flag_s	;
assign pps_end = pic_parameter_set_state == `deblocking_filter_control_2_redundant_pic_cnt_present_flag;
assign slice_header_end = (slice_header_state == `slice_qp_delta_s && deblocking_filter_control_present_flag == 1'b0)||
			  (slice_header_state == `disable_deblocking_filter_idc_s && disable_deblocking_filter_idc == 2'b01)||
			  (slice_header_state == `slice_beta_offset_div2_s) ;

assign slice_end = slice_layer_wo_partitioning_state == `slice_data&&end_slice_data;

assign cavlc_end = (cavlc_decoder_state == `cavlc_0)||
		       (cavlc_decoder_state == `LevelRunCombination)||
    	              (cavlc_decoder_state == `NumCoeffTrailingOnes_LUT&&TotalCoeff == 0);

//---------------
//parser_state
//---------------
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		parser_state <= `rst_parser;
	else
		case (parser_state)
		`rst_parser		:parser_state <= `start_code_prefix;//`parser_wait;
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
		`rbsp_trailing_one_bit  :nal_unit_state <= (pc_reg[2:0] == 3'b111)? `rst_nal_unit:`rbsp_trailing_zero_bits;
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
		
		`seq_parameter_set_id_sps_s	 :seq_parameter_set_state <= (profile_idc == 8'd100 || profile_idc == 8'd110 || 
							profile_idc == 8'd122 || profile_idc == 8'd244)? `chroma_format_idc:`log2_max_frame_num_minus4_s;
		`chroma_format_idc								:seq_parameter_set_state <= chroma_format_idc == 3 ? `residual_colour_transform_flag : `bit_depth_luma_minus8;
		`residual_colour_transform_flag				:seq_parameter_set_state <= `bit_depth_luma_minus8;
		`bit_depth_luma_minus8							:seq_parameter_set_state <= `bit_depth_chroma_minus8;
		`bit_depth_chroma_minus8						:seq_parameter_set_state <= `qpprime_y_zero_transform_bypass_flag;
		`qpprime_y_zero_transform_bypass_flag		:seq_parameter_set_state <= `log2_max_frame_num_minus4_s;
		`log2_max_frame_num_minus4_s					:seq_parameter_set_state <= `pic_order_cnt_type_s;
		`pic_order_cnt_type_s							:seq_parameter_set_state <= `num_ref_frames_s;
		`num_ref_frames_s									:seq_parameter_set_state <= `gaps_in_frame_num_value_allowed_flag_s;
		`gaps_in_frame_num_value_allowed_flag_s	:seq_parameter_set_state <= `pic_width_in_mbs_minus1_s;
		`pic_width_in_mbs_minus1_s		:seq_parameter_set_state <= `pic_height_in_map_units_minus1_s;
		`pic_height_in_map_units_minus1_s	:seq_parameter_set_state <= `frame_mbs_only_flag_2_frame_cropping_flag;
		`frame_mbs_only_flag_2_frame_cropping_flag:seq_parameter_set_state <= `vui_parameter_present_flag_s;
		`vui_parameter_present_flag_s		:seq_parameter_set_state <= `rst_seq_parameter_set;
		default					:seq_parameter_set_state <= `rst_seq_parameter_set;
		endcase

	
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

wire slice_cabac_init_end;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		slice_layer_wo_partitioning_state <= `rst_slice_layer_wo_partitioning;
	else  if((nal_unit_state == `slice_layer_IDR_rbsp)||(nal_unit_state == `slice_layer_non_IDR_rbsp))
		case (slice_layer_wo_partitioning_state)
		`rst_slice_layer_wo_partitioning:slice_layer_wo_partitioning_state <= `slice_header;
		`slice_header			:slice_layer_wo_partitioning_state <= slice_header_end? `slice_data : `slice_header;
		`slice_data			:slice_layer_wo_partitioning_state <= end_slice_data?`rst_slice_layer_wo_partitioning:`slice_data;
		default				:slice_layer_wo_partitioning_state <= `rst_slice_layer_wo_partitioning;
		endcase



//---------------
//slice_header_state
//---------------			


wire dec_ref_pic_marking_end;
		
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		slice_header_state            <= `rst_slice_header;
	else if(slice_layer_wo_partitioning_state == `slice_header)
		case (slice_header_state)
		`rst_slice_header                   :slice_header_state <= `first_mb_in_slice_s;
		`first_mb_in_slice_s                :slice_header_state <= `slice_type_s;
		`slice_type_s                       :slice_header_state <= `pic_parameter_set_id_slice_header_s;
		`pic_parameter_set_id_slice_header_s:slice_header_state <= `frame_num_s;
		`frame_num_s:
			if (nal_unit_type == 5'b00101)	      slice_header_state <= `idr_pic_id_s;
			else                                  slice_header_state <= nal_ref_idc != 0 ? `dec_ref_pic_marking : `slice_qp_delta_s;
		`idr_pic_id_s:  slice_header_state <= nal_ref_idc != 0 ? `dec_ref_pic_marking : `slice_qp_delta_s;
		`dec_ref_pic_marking:
				slice_header_state <= dec_ref_pic_marking_end ? `slice_qp_delta_s :`dec_ref_pic_marking;
		`slice_qp_delta_s:
				slice_header_state <= (deblocking_filter_control_present_flag == 1'b1)? `disable_deblocking_filter_idc_s:`rst_slice_header;
		`disable_deblocking_filter_idc_s:
				slice_header_state <= (disable_deblocking_filter_idc != 2'b01)? `slice_alpha_c0_offset_div2_s:`rst_slice_header;//
		`slice_alpha_c0_offset_div2_s      :slice_header_state <= `slice_beta_offset_div2_s;
		`slice_beta_offset_div2_s	   :slice_header_state <= `rst_slice_header;
		default				   :slice_header_state <= `rst_slice_header;
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

assign end_slice_data = ((nal_end_flag == 32'h00000001 && removed_03_flag == 0 )||
		mb_num_v == pic_height_in_map_units_minus1)
			&& mb_num_h == pic_width_in_mbs_minus1 && slice_data_state==`mb_num_update ;


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		slice_data_state 	<= `rst_slice_data;
	else if(slice_layer_wo_partitioning_state == `slice_data)
    		case (slice_data_state)
		`rst_slice_data   :slice_data_state <= `mb_type_s;
		`mb_type_s		:slice_data_state <= `residual;
		`residual		:slice_data_state <= residual_end ? `mb_num_update :`residual;//`mb_num_update;
		`mb_num_update		:slice_data_state <= `rst_slice_data;//`rst_slice_data;
		default:;
		endcase	

//---------------
//	residual
//---------------	
		
//intra16x16
reg intra16_pred_end_r;
wire cavlc_pred_end;
assign cavlc_pred_end = intra16_pred_end_r && cavlc_end_r;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		residual_intra16_state <= `rst_residual_intra16;
	else if(slice_data_state == `residual)
	 	case(residual_intra16_state)
		`rst_residual_intra16: 	residual_intra16_state <= `intra16_cavlc_pred;
		`intra16_cavlc_pred:		residual_intra16_state <= cavlc_pred_end?`intra16_updat:`intra16_cavlc_pred;
		`intra16_updat:residual_intra16_state <= intra16_pred_num == 6'd49 ? `rst_residual_intra16 : `intra16_cavlc_pred;
		default:;
		endcase





always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)
		intra_pred_state <= `rst_intra_pred;
	else if(residual_intra16_state == `intra16_cavlc_pred && intra16_pred_end_r == 0)
		case(intra_pred_state)
		`rst_intra_pred:	intra_pred_state <= 
				(intra16_pred_num == 6'd0 || intra16_pred_num == 6'd18 || intra16_pred_num == 6'd34) ?
				`intra_pred_read:
				(intra16_pred_num == 6'b111111 || intra16_pred_num == 6'd16 || intra16_pred_num == 6'd17) ?
				`intra_pred_end:`intra_pred_pred;
		`intra_pred_read:	intra_pred_state <= intra16_read_end ? `intra_pred_pred : `intra_pred_read;
		`intra_pred_pred:	intra_pred_state <= 
						Intra16x16_predmode == `Intra16x16_Plane ? `intra_pred_pred_pl:`intra_pred_end;
		`intra_pred_pred_pl:intra_pred_state <= `intra_pred_end;
		`intra_pred_end :	intra_pred_state <= `rst_intra_pred;
		default:;
		endcase

always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)
		intra16_pred_end_r <= 0;
	else if(intra_pred_state == `intra_pred_end)
		intra16_pred_end_r <= 1;
	else if(residual_intra16_state == `intra16_updat)
		intra16_pred_end_r <= 0;
		
always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)
		cavlc_end_r <= 0;
	else if(cavlc_end)
		cavlc_end_r <= 1;
	else if(residual_intra16_state == `intra16_updat)
		cavlc_end_r <= 0;
		


always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
	  maxNumCoeff <= 0;
	else if(slice_data_state == `residual && mb_type_general[3:2] == 2'b10)
	    case(intra16_pred_num)
	    16,17	:maxNumCoeff <= 16;
	    6'b111111   :maxNumCoeff <= 16;
	    default	:maxNumCoeff <= 15;
	   endcase


// -1 dc 0-15 ac 16 17 dc 18-33 ac 34-49 ac	  
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
	  intra16_pred_num <= 6'b111111;
	else if(residual_intra16_state == `intra16_updat)
	  intra16_pred_num <= (intra16_pred_num == 6'd49) ? 6'b111111 : 
			      (intra16_pred_num == 6'd16) ? 6'd18 :
			      (intra16_pred_num == 6'd33) ? 6'd17 :
			      (intra16_pred_num == 6'd17) ? 6'd34 : intra16_pred_num + 6'd1;


reg [3:0] CodedBlockPatternLuma;
	
always @ (mb_type or reset_n)
	if(reset_n == 0)
		CodedBlockPatternLuma = 0;
	else	CodedBlockPatternLuma = (mb_type < 6'd13)? 4'd0:4'd15;					
					
					
assign res_0 = (CodedBlockPatternLuma[3] == 0 && (intra16_pred_num[5:2] == 4'b0011 || (intra16_pred_num > 6'd17 && chroma_i8x8 == 2'd3 && intra16_pred_num != 6'b111111))) ||
		(CodedBlockPatternLuma[2] == 0 && (intra16_pred_num[5:2] == 4'b0010 || (intra16_pred_num > 6'd17 && chroma_i8x8 == 2'd2))) ||
		(CodedBlockPatternLuma[1] == 0 && (intra16_pred_num[5:2] == 4'b0001 || (intra16_pred_num > 6'd17 && chroma_i8x8 == 2'd1))) ||
		(CodedBlockPatternLuma[0] == 0 && (intra16_pred_num[5:2] == 4'b0000 || (intra16_pred_num > 6'd17 && chroma_i8x8 == 2'd0))) ;
	

//---------------
//	cavlc
//---------------	

 
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		cavlc_decoder_state <= `rst_cavlc_decoder;
	else if(residual_intra16_state == `intra16_cavlc_pred && cavlc_end_r == 0)
		case (cavlc_decoder_state)
		`rst_cavlc_decoder	:cavlc_decoder_state  <= res_0?`cavlc_0:`NumCoeffTrailingOnes_LUT;
		`NumCoeffTrailingOnes_LUT:
			cavlc_decoder_state <= (TotalCoeff == 0)?`rst_cavlc_decoder:((TrailingOnes == 0)? `LevelPrefix:`TrailingOnesSignFlag); 
		`TrailingOnesSignFlag:
			cavlc_decoder_state <= (TotalCoeff == {3'b0,TrailingOnes})?`total_zeros_LUT:`LevelPrefix;
		`LevelPrefix         :cavlc_decoder_state <= `LevelSuffix;
		`LevelSuffix         :cavlc_decoder_state <= ({1'b0,i_level} == TotalCoeff-1)? ((TotalCoeff == maxNumCoeff)?
			`LevelRunCombination:`total_zeros_LUT):`LevelSuffix;
		`total_zeros_LUT     :cavlc_decoder_state <= (TotalCoeff == 1)? `RunOfZeros:`run_before_LUT; 
		`run_before_LUT	     :cavlc_decoder_state <= `RunOfZeros;
		`RunOfZeros	    :cavlc_decoder_state <= ({1'b0,i_run} == (TotalCoeff - 1) || {1'b0,i_run} == (TotalCoeff - 2) || zerosLeft == 0)? 
					`run_cal:`RunOfZeros;
		`run_cal:				 cavlc_decoder_state <= `LevelRunCombination;
		`LevelRunCombination :cavlc_decoder_state <= `rst_cavlc_decoder;
		`cavlc_0:cavlc_decoder_state <= `rst_cavlc_decoder;
		default:;
		endcase
//i_level
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		i_level <= 0;
	else if (cavlc_decoder_state == `NumCoeffTrailingOnes_LUT)
		i_level <= 0;
	else if (cavlc_decoder_state == `TrailingOnesSignFlag)
		i_level <= i_level + {2'b0,TrailingOnes};
	else if (cavlc_decoder_state == `LevelSuffix && {1'b0,i_level} != (TotalCoeff-4'd1))
		i_level <= i_level + 4'd1;
			
//i_run
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		i_run <= 0;
	else if (cavlc_decoder_state == `total_zeros_LUT)
		i_run <= 0;
	else if (cavlc_decoder_state == `RunOfZeros && {1'b0,i_run} != (TotalCoeff - 1) && {1'b0,i_run} != (TotalCoeff - 2) && zerosLeft != 0)
		i_run <= i_run + 4'd1;
			
//i_TotalCoeff
wire [4:0] TotalCoeff_minus1;

assign TotalCoeff_minus1 = TotalCoeff - 5'd1;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		i_TotalCoeff <= 0;  
	else if (cavlc_decoder_state == `LevelSuffix && {1'b0,i_level} == (TotalCoeff-1) && TotalCoeff == maxNumCoeff)
		i_TotalCoeff <= TotalCoeff_minus1[3:0];
	else if (cavlc_decoder_state == `RunOfZeros && ({1'b0,i_run} == (TotalCoeff - 1) || {1'b0,i_run} == (TotalCoeff - 2) || zerosLeft == 0))
		i_TotalCoeff <= TotalCoeff_minus1[3:0];  
	
		
			
//mb_num_h
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		mb_num_h <= 0;
	else if (slice_data_state == `mb_num_update)
		mb_num_h <= mb_num_h_pred;
	
//mb_num_v
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		mb_num_v <= 0;
	else if (slice_data_state == `mb_num_update)
		mb_num_v <= mb_num_v_pred;


always @ (reset_n or pic_width_in_mbs_minus1 or mb_num_h or slice_data_state)
	if (reset_n == 1'b0)
		mb_num_h_pred = 0;
	else if (slice_data_state == `mb_num_update)
		mb_num_h_pred = (mb_num_h == pic_width_in_mbs_minus1) ? 8'd0:(mb_num_h + 8'd1);
	else 
		mb_num_h_pred = mb_num_h;
	
//mb_num_v
always @ (reset_n or pic_width_in_mbs_minus1 or pic_height_in_map_units_minus1 or mb_num_v or mb_num_h
		or slice_data_state)
	if (reset_n == 1'b0)
		mb_num_v_pred = 0;
	else if (slice_data_state == `mb_num_update && mb_num_h == pic_width_in_mbs_minus1)
		mb_num_v_pred = (mb_num_v == pic_height_in_map_units_minus1) ? 8'd0:(mb_num_v + 8'd1);
	else 
		mb_num_v_pred = mb_num_v;



always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		mb_num_h_slice <= 0;
	else if (slice_data_state == `mb_num_update)
		mb_num_h_slice <= (mb_num_h_slice == pic_width_in_mbs_minus1 || end_slice_data)  ? 8'd0:(mb_num_h_slice + 8'd1);
	
//mb_num_v
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		mb_num_v_slice <= 0;
	else if (slice_data_state == `mb_num_update && mb_num_h_slice == pic_width_in_mbs_minus1)
		mb_num_v_slice <= (mb_num_v_slice == pic_height_in_map_units_minus1) || end_slice_data ? 8'd0:(mb_num_v_slice + 8'd1);		


reg [3:0] pc_6to3_reg;
reg [2:0] pc_2to0_reg;
reg [47:0] bitbuf_reg;	

wire [3:0] pc_6to3_sub_by27_4,pc_6to3_sub_by11;	
wire [4:0] pc_6to3_sub_by27;
wire [5:0] pc_2to0_add39;
wire [47:0] bitbuf;

always@(posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		pc_6to3_reg <= 0;	pc_2to0_reg <= 0;
		bitbuf_reg <= 0;end
	else if(slice_data_state == `residual && residual_end)begin
		pc_6to3_reg <= pc_6to3;		pc_2to0_reg <= pc_2to0;
		bitbuf_reg <= bitbuf;end
	

assign bitbuf = {BitStream_buffer_output,BitStream_buffer_output_ex32};
assign pc_6to3_sub_by27 = 5'd27 - {1'b0,pc_6to3_reg};
assign pc_6to3_sub_by27_4 = pc_6to3_sub_by27[3:0];
assign pc_6to3_sub_by11 = 4'd11 - pc_6to3_reg;
assign pc_2to0_add39 = 6'd39 + {3'd0,pc_2to0_reg};

assign nal_end_flag = bitbuf_reg[pc_2to0_add39 -: 32];
assign removed_03_flag = pc_6to3 > 4'd11 ? removed_03[pc_6to3_sub_by27_4] : removed_03[pc_6to3_sub_by11];


			
endmodule
