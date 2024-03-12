`include "timescale.v"
`include "define.v"

module exp_golomb_decoding (	
input reset_n,
input [3:0] heading_one_pos,
input [15:0] BitStream_buffer_output,
input [3:0] slice_header_state,
input [1:0] slice_data_state,
input [4:0] seq_parameter_set_state,
input [3:0] pic_parameter_set_state,
input [2:0] dec_ref_pic_marking_state,
output reg [7:0] exp_golomb_decoding_output,
output reg [4:0] exp_golomb_len
	);
	
parameter rst_exp_golomb_sel = 2'b00;
parameter ue = 2'b01;
parameter se = 2'b10;
parameter te = 2'b11; 
			
reg [7:0] codeNum;
reg [1:0] exp_golomb_sel;
	
always @ (exp_golomb_sel or heading_one_pos or BitStream_buffer_output)
	if (exp_golomb_sel != rst_exp_golomb_sel)
			case (heading_one_pos)
			0:codeNum = 0;											
			1:codeNum = {6'b0,BitStream_buffer_output[14:13]} - 8'd1;
			2:codeNum = {5'b0,BitStream_buffer_output[13:11]} - 8'd1;
			3:codeNum = {4'b0,BitStream_buffer_output[12:9]}  - 8'd1;
			4:codeNum = {3'b0,BitStream_buffer_output[11:7]}  - 8'd1;
			5:codeNum = {2'b0,BitStream_buffer_output[10:5]}  - 8'd1;
			6:codeNum = {1'b0,BitStream_buffer_output[9:3]}   - 8'd1;
			7:codeNum = {BitStream_buffer_output[8:1]}   - 8'd1;
			default:codeNum = 0;
			endcase
	else 
		codeNum = 0; 
	


always @ (exp_golomb_sel or heading_one_pos )
	case (exp_golomb_sel)
	ue,se:exp_golomb_len 	= {heading_one_pos,1'b0} + 5'b1;
	default:exp_golomb_len 	= 0;
	endcase
		
wire [7:0] codeNum_se_tmp; 
assign codeNum_se_tmp = codeNum >> 1;

always @ (exp_golomb_sel or codeNum or codeNum_se_tmp  or BitStream_buffer_output)
	case (exp_golomb_sel)
	ue:exp_golomb_decoding_output = codeNum;
	se:
		case (codeNum[0])
		1:exp_golomb_decoding_output = (codeNum + 8'd1) >> 1;
		0:exp_golomb_decoding_output = ~codeNum_se_tmp + 8'd1;
		endcase
	default:exp_golomb_decoding_output = 0;
	endcase
	
always @ (reset_n or seq_parameter_set_state or pic_parameter_set_state or slice_header_state
	          or slice_data_state   or dec_ref_pic_marking_state)
	if (reset_n == 0) 
		exp_golomb_sel = rst_exp_golomb_sel;	
	else if (dec_ref_pic_marking_state != `rst_dec_ref_pic_marking)
		case(dec_ref_pic_marking_state)
		`memory_management_control_operation_s:		exp_golomb_sel	= ue;
		`difference_of_pic_nums_minus1_s:		exp_golomb_sel	= ue;
		`long_term_pic_num_s:				exp_golomb_sel	= ue;
		`long_term_frame_idx_s:				exp_golomb_sel	= ue;
		`max_long_term_frame_idx_plus1_s:		exp_golomb_sel	= ue;
		default :					exp_golomb_sel	= rst_exp_golomb_sel;
		endcase
	else if (slice_header_state != `rst_slice_header)
		case (slice_header_state)
		`first_mb_in_slice_s				:exp_golomb_sel	= ue;						 
		`slice_type_s					:exp_golomb_sel	= ue;								 
		`pic_parameter_set_id_slice_header_s		:exp_golomb_sel = ue;		 
		`idr_pic_id_s					:exp_golomb_sel	= ue;	
		/*`delta_pic_order_cnt_s				:exp_golomb_sel	= se;
		`num_ref_idx_l0_active_minus1_slice_header_s	:exp_golomb_sel	= ue;
		`num_ref_idx_l1_active_minus1_slice_header_s	:exp_golomb_sel	= ue;	
		`cabac_init_idc_s				:exp_golomb_sel	= ue;			*/  
		`slice_qp_delta_s				:exp_golomb_sel	= se;							  
		`disable_deblocking_filter_idc_s		:exp_golomb_sel	= ue;			  
		`slice_alpha_c0_offset_div2_s		    	:exp_golomb_sel = se;				  
		`slice_beta_offset_div2_s			:exp_golomb_sel	= ue;
		default						:exp_golomb_sel	= rst_exp_golomb_sel;
		endcase
	else if (slice_data_state != `rst_slice_data)
		case (slice_data_state)		  
		`mb_type_s		     :exp_golomb_sel	= ue;				  
		default						         :exp_golomb_sel = rst_exp_golomb_sel;
		endcase
	else if (seq_parameter_set_state != `rst_seq_parameter_set)
		case (seq_parameter_set_state)
		`seq_parameter_set_id_sps_s			:exp_golomb_sel	= ue;  
		`chroma_format_idc,`bit_depth_luma_minus8,`bit_depth_chroma_minus8
														:exp_golomb_sel   = ue;
		`log2_max_frame_num_minus4_s        :exp_golomb_sel	= ue;      
		`pic_order_cnt_type_s               :exp_golomb_sel	= ue;
		`log2_max_pic_order_cnt_lsb_minus4_s:exp_golomb_sel	= ue;
		`offset_for_non_ref_pic		    		:exp_golomb_sel	= se;
		`offset_for_top_to_bottom_field	    :exp_golomb_sel	= se;
		`num_ref_frames_in_pic_order_cnt_cycle :exp_golomb_sel	= ue;
		`offset_for_ref_frame		    :exp_golomb_sel	= se;
      		`num_ref_frames_s		    :exp_golomb_sel	= ue;                          
		`pic_width_in_mbs_minus1_s          :exp_golomb_sel	= ue;      
		`pic_height_in_map_units_minus1_s   :exp_golomb_sel	= ue;
		default								              :exp_golomb_sel	= rst_exp_golomb_sel;
		endcase
	else if (pic_parameter_set_state != `rst_pic_parameter_set)
		case (pic_parameter_set_state)
		`pic_parameter_set_id_pps_s			   :exp_golomb_sel	= ue;					
		`seq_parameter_set_id_pps_s			   :exp_golomb_sel	= ue;
		`num_slice_groups_minus1_s			   :exp_golomb_sel	= ue;						
		`num_ref_idx_l0_active_minus1_pps_s:exp_golomb_sel	= ue;						
		`num_ref_idx_l1_active_minus1_pps_s:exp_golomb_sel	= ue;					 
		`pic_init_qp_minus26_s				     :exp_golomb_sel	= se;						
		`pic_init_qs_minus26_s				     :exp_golomb_sel	= se;						
		`chroma_qp_index_offset_s			     :exp_golomb_sel	= se;
		default								:exp_golomb_sel	= rst_exp_golomb_sel;
		endcase
	else
		exp_golomb_sel	= rst_exp_golomb_sel;
		
endmodule
