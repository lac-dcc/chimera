`include "timescale.v"
`include "define.v"

module h264_top(
input clk,reset_n,
input [15:0] BitStream_buffer_output,
input [31:0] BitStream_buffer_output_ex32,
input [15:0] removed_03,

output [6:0] pc,pc_reg,
output [4:0] pc_delta,
output [7:0] pic_width_in_mbs_minus1,pic_height_in_map_units_minus1,

output [31:0] img0,img1,img2,img3,
output img_wr_n,
output [6:0] mb_h,mb_v,
output [5:0] intra16_pred_num,
output slice_end,
output sps_complete

);


wire start_code_prefix_found;

wire [4:0] nal_unit_type;
wire [1:0] pic_order_cnt_type;
wire [2:0] slice_type;
wire [5:0] mb_type;
wire [3:0] mb_type_general;


wire [1:0] parser_state; 
wire [3:0] nal_unit_state; 
wire [4:0] seq_parameter_set_state;
wire [3:0] pic_parameter_set_state;
wire [3:0] slice_header_state;
wire [1:0] slice_data_state;
wire [1:0] residual_intra16_state;
wire [2:0] dec_ref_pic_marking_state;
wire [3:0] cavlc_decoder_state;
wire [2:0] intra_pred_state;


wire [7:0] exp_golomb_decoding_output;
wire [9:0] dependent_variable_decoding_output;
wire [3:0] heading_one_pos;

wire [1:0] nal_ref_idc,chroma_format_idc;
wire [7:0] profile_idc;
wire [1:0] weighted_bipred_idc;
wire [1:0] disable_deblocking_filter_idc;

wire [4:0] exp_golomb_len;
wire [3:0] dependent_variable_len;
wire [4:0] cavlc_consumed_bits_len;
wire [4:0] cabac_consumed_bits_len;

wire deblocking_filter_control_present_flag;
wire constrained_intra_pred_flag;
wire adaptive_ref_pic_marking_mode_flag;

wire cavlc_end;
wire intra16_read_end;

wire [2:0] memory_management_control_operation;
wire [5:0] pic_init_qp_minus26;
wire [4:0] chroma_qp_index_offset;
wire [3:0] log2_max_frame_num_minus4;

wire [7:0] mb_num_h,mb_num_v,mb_num_h_slice,mb_num_v_slice;
wire [1:0] chroma_i8x8,chroma_i4x4;
wire [3:0] frame_num;
wire [63:0] Intra4x4PredMode_CurrMb; 
wire end_of_NonZeroCoeff_CAVLC;
wire [4:0] TotalCoeff;
wire [1:0] TrailingOnes;
wire [3:0] zerosLeft,i_level,i_run,i_TotalCoeff;
wire [15:0] cavlc_coeffLevel_0,cavlc_coeffLevel_1,cavlc_coeffLevel_2,cavlc_coeffLevel_3;
wire [15:0] cavlc_coeffLevel_4,cavlc_coeffLevel_5,cavlc_coeffLevel_6,cavlc_coeffLevel_7;
wire [15:0] cavlc_coeffLevel_8,cavlc_coeffLevel_9,cavlc_coeffLevel_10,cavlc_coeffLevel_11;
wire [15:0] cavlc_coeffLevel_12,cavlc_coeffLevel_13,cavlc_coeffLevel_14,cavlc_coeffLevel_15;
wire [15:0] img_4x4_00,img_4x4_01,img_4x4_02,img_4x4_03;
wire [15:0] img_4x4_10,img_4x4_11,img_4x4_12,img_4x4_13;
wire [15:0] img_4x4_20,img_4x4_21,img_4x4_22,img_4x4_23;
wire [15:0] img_4x4_30,img_4x4_31,img_4x4_32,img_4x4_33;
wire [15:0] intra_pred_16_00,intra_pred_16_01,intra_pred_16_02,intra_pred_16_03;
wire [15:0] intra_pred_16_10,intra_pred_16_11,intra_pred_16_12,intra_pred_16_13;
wire [15:0] intra_pred_16_20,intra_pred_16_21,intra_pred_16_22,intra_pred_16_23;
wire [15:0] intra_pred_16_30,intra_pred_16_31,intra_pred_16_32,intra_pred_16_33;
wire [7:0] nrblock16_0,nrblock16_1,nrblock16_2,nrblock16_3;
//ram
wire intra4x4_rd_n,intra4x4_wr_n;
wire [11:0] intra4x4_wr_addr,intra4x4_rd_addr; 
wire [31:0] intra4x4_din,intra4x4_dout;
wire TC_rd_n_cavlc,TC_rd_n,TC_wr_n;
wire [4:0] TC_din,TC_A_dout,TC_B_dout;
wire [5:0]  TC_A_wr_addr,TC_A_rd_addr;
wire [12:0] TC_B_wr_addr,TC_B_rd_addr;
wire [5:0]  TC_A_rd_addr_cavlc;
wire [12:0] TC_B_rd_addr_cavlc;

wire [2:0] state16;
wire [1:0] Intra16x16_predmode;
wire res_0;
wire [4:0] maxNumCoeff;
wire cavlc_end_r;

wire [31:0] img_addra_y0,img_addra_y1,img_addra_y2,img_addra_y3;
wire [31:0] img_addra_u0,img_addra_u1,img_addra_u2,img_addra_u3;
wire [31:0] img_addra_v0,img_addra_v1,img_addra_v2,img_addra_v3;



BitStream_parser_FSM BitStream_parser_FSM(
	.clk(clk),.reset_n(reset_n),
	.start_code_prefix_found(start_code_prefix_found),
	.nal_unit_type(nal_unit_type),.nal_ref_idc(nal_ref_idc),
	.chroma_format_idc(chroma_format_idc),
	.profile_idc(profile_idc),.slice_type(slice_type),
	.pc_2to0(pc[2:0]),.pc_6to3(pc[6:3]),.pc_reg(pc_reg),
	.removed_03(removed_03),
	.BitStream_buffer_output(BitStream_buffer_output),
	.BitStream_buffer_output_ex32(BitStream_buffer_output_ex32),
	.weighted_bipred_idc(weighted_bipred_idc),
	.deblocking_filter_control_present_flag(deblocking_filter_control_present_flag),
	.mb_type_general(mb_type_general),.mb_type(mb_type),
	.disable_deblocking_filter_idc(disable_deblocking_filter_idc),
	.adaptive_ref_pic_marking_mode_flag(adaptive_ref_pic_marking_mode_flag),
	.memory_management_control_operation(memory_management_control_operation),
	.TotalCoeff(TotalCoeff),.TrailingOnes(TrailingOnes),
	.chroma_i8x8(chroma_i8x8),.Intra16x16_predmode(Intra16x16_predmode),
	.zerosLeft(zerosLeft),
	.intra16_read_end(intra16_read_end),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),
	.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.parser_state(parser_state),.nal_unit_state(nal_unit_state),
	.seq_parameter_set_state(seq_parameter_set_state),.pic_parameter_set_state(pic_parameter_set_state),
	.slice_header_state(slice_header_state),
	.dec_ref_pic_marking_state(dec_ref_pic_marking_state),
	.slice_data_state(slice_data_state),
	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),
	.mb_num_h_slice(mb_num_h_slice),.mb_num_v_slice(mb_num_v_slice),
	.cavlc_decoder_state(cavlc_decoder_state),
	.residual_intra16_state(residual_intra16_state),
	.intra_pred_state(intra_pred_state),
	.intra16_pred_num(intra16_pred_num),
	.cavlc_end_r(cavlc_end_r),
	.i_level(i_level),.i_run(i_run),.i_TotalCoeff(i_TotalCoeff),
	.maxNumCoeff(maxNumCoeff),.res_0(res_0),
	.slice_end(slice_end),.cavlc_end(cavlc_end)
	); 

intra4x4_rw intra4x4_rw(
	.clk(clk),.reset_n(reset_n),
	.img_4x4_00(img_4x4_00[7:0]),.img_4x4_01(img_4x4_01[7:0]),.img_4x4_02(img_4x4_02[7:0]),.img_4x4_03(img_4x4_03[7:0]),
	.img_4x4_10(img_4x4_10[7:0]),.img_4x4_11(img_4x4_11[7:0]),.img_4x4_12(img_4x4_12[7:0]),.img_4x4_13(img_4x4_13[7:0]),
	.img_4x4_20(img_4x4_20[7:0]),.img_4x4_21(img_4x4_21[7:0]),.img_4x4_22(img_4x4_22[7:0]),.img_4x4_23(img_4x4_23[7:0]),
	.img_4x4_30(img_4x4_30[7:0]),.img_4x4_31(img_4x4_31[7:0]),.img_4x4_32(img_4x4_32[7:0]),.img_4x4_33(img_4x4_33[7:0]),
	.res_0(res_0),.Intra16x16_predmode(Intra16x16_predmode),
	.intra16_pred_num(intra16_pred_num),.residual_intra16_state(residual_intra16_state),
	.intra_pred_state(intra_pred_state),
	.intra4x4_dout(intra4x4_dout),.mb_num_h(mb_num_h_slice),.mb_num_v(mb_num_v_slice),
	.TotalCoeff(TotalCoeff),.cavlc_end(cavlc_end),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.intra4x4_rd_n(intra4x4_rd_n),.intra4x4_wr_n(intra4x4_wr_n),
	.intra4x4_rd_addr(intra4x4_rd_addr),.intra4x4_wr_addr(intra4x4_wr_addr),
	.intra4x4_din(intra4x4_din),.intra16_read_end(intra16_read_end),
	.nrblock16_0(nrblock16_0),.nrblock16_1(nrblock16_1),.nrblock16_2(nrblock16_2),.nrblock16_3(nrblock16_3),
	.state16(state16),.TC_wr_n(TC_wr_n),.TC_din(TC_din),
	.TC_A_wr_addr(TC_A_wr_addr),.TC_B_wr_addr(TC_B_wr_addr),
	.chroma_i8x8(chroma_i8x8),.chroma_i4x4(chroma_i4x4),
	.img_wr_n(img_wr_n),
	.img_addra_y0(img_addra_y0),.img_addra_y1(img_addra_y1),.img_addra_y2(img_addra_y2),.img_addra_y3(img_addra_y3),
	.img_addra_u0(img_addra_u0),.img_addra_u1(img_addra_u1),.img_addra_u2(img_addra_u2),.img_addra_u3(img_addra_u3),
	.img_addra_v0(img_addra_v0),.img_addra_v1(img_addra_v1),.img_addra_v2(img_addra_v2),.img_addra_v3(img_addra_v3)
	);    
 

cavlc_decoder cavlc_decoder(	
  	.clk(clk),.reset_n(reset_n),
	.cavlc_decoder_state(cavlc_decoder_state),
	.slice_data_state(slice_data_state),
	.i_level(i_level),.i_run(i_run),.i_TotalCoeff(i_TotalCoeff),
	.heading_one_pos(heading_one_pos),
	.BitStream_buffer_output(BitStream_buffer_output),
	.BitStream_buffer_output_ex32(BitStream_buffer_output_ex32),
	.mb_num_h(mb_num_h_slice),.mb_num_v(mb_num_v_slice),
	.chroma_i8x8(chroma_i8x8),.chroma_i4x4(chroma_i4x4),
	.residual_intra16_state(residual_intra16_state),
	.cavlc_end_r(cavlc_end_r),.res_0(res_0),
	.TC_A_dout(TC_A_dout),.TC_B_dout(TC_B_dout),
	.intra16_pred_num(intra16_pred_num),
	.end_of_NonZeroCoeff_CAVLC(end_of_NonZeroCoeff_CAVLC),
	.cavlc_consumed_bits_len(cavlc_consumed_bits_len),
	.TotalCoeff(TotalCoeff),.TrailingOnes(TrailingOnes),.zerosLeft(zerosLeft),
 	.coeffLevel_0(cavlc_coeffLevel_0),.coeffLevel_1(cavlc_coeffLevel_1),
 	.coeffLevel_2(cavlc_coeffLevel_2),.coeffLevel_3(cavlc_coeffLevel_3), 
	.coeffLevel_4(cavlc_coeffLevel_4),.coeffLevel_5(cavlc_coeffLevel_5),
	.coeffLevel_6(cavlc_coeffLevel_6),.coeffLevel_7(cavlc_coeffLevel_7),
	.coeffLevel_8(cavlc_coeffLevel_8),.coeffLevel_9(cavlc_coeffLevel_9),
	.coeffLevel_10(cavlc_coeffLevel_10),.coeffLevel_11(cavlc_coeffLevel_11),
	.coeffLevel_12(cavlc_coeffLevel_12),.coeffLevel_13(cavlc_coeffLevel_13),
	.coeffLevel_14(cavlc_coeffLevel_14),.coeffLevel_15(cavlc_coeffLevel_15),
	.TC_A_rd_addr(TC_A_rd_addr_cavlc),.TC_B_rd_addr(TC_B_rd_addr_cavlc),
	.TC_rd_n(TC_rd_n_cavlc)
	);



sample_reconstruct sample_reconstruct(
	.clk(clk),.reset_n(reset_n),
	.intra_pred_16_00(intra_pred_16_00),.intra_pred_16_01(intra_pred_16_01),
	.intra_pred_16_02(intra_pred_16_02),.intra_pred_16_03(intra_pred_16_03),
	.intra_pred_16_10(intra_pred_16_10),.intra_pred_16_11(intra_pred_16_11),
	.intra_pred_16_12(intra_pred_16_12),.intra_pred_16_13(intra_pred_16_13),
	.intra_pred_16_20(intra_pred_16_20),.intra_pred_16_21(intra_pred_16_21),
	.intra_pred_16_22(intra_pred_16_22),.intra_pred_16_23(intra_pred_16_23),
	.intra_pred_16_30(intra_pred_16_30),.intra_pred_16_31(intra_pred_16_31),
	.intra_pred_16_32(intra_pred_16_32),.intra_pred_16_33(intra_pred_16_33),
	.intra16_pred_num(intra16_pred_num),
	.residual_intra16_state(residual_intra16_state),
	.Intra16x16_predmode(Intra16x16_predmode),
	.cavlc_coeffLevel_0(cavlc_coeffLevel_0),.cavlc_coeffLevel_1(cavlc_coeffLevel_1),
 	.cavlc_coeffLevel_2(cavlc_coeffLevel_2),.cavlc_coeffLevel_3(cavlc_coeffLevel_3), 
	.cavlc_coeffLevel_4(cavlc_coeffLevel_4),.cavlc_coeffLevel_5(cavlc_coeffLevel_5),
	.cavlc_coeffLevel_6(cavlc_coeffLevel_6),.cavlc_coeffLevel_7(cavlc_coeffLevel_7),
	.cavlc_coeffLevel_8(cavlc_coeffLevel_8),.cavlc_coeffLevel_9(cavlc_coeffLevel_9),
	.cavlc_coeffLevel_10(cavlc_coeffLevel_10),.cavlc_coeffLevel_11(cavlc_coeffLevel_11),
	.cavlc_coeffLevel_12(cavlc_coeffLevel_12),.cavlc_coeffLevel_13(cavlc_coeffLevel_13),
	.cavlc_coeffLevel_14(cavlc_coeffLevel_14),.cavlc_coeffLevel_15(cavlc_coeffLevel_15),
	
	.img_4x4_00(img_4x4_00),.img_4x4_01(img_4x4_01),.img_4x4_02(img_4x4_02),.img_4x4_03(img_4x4_03),
	.img_4x4_10(img_4x4_10),.img_4x4_11(img_4x4_11),.img_4x4_12(img_4x4_12),.img_4x4_13(img_4x4_13),
	.img_4x4_20(img_4x4_20),.img_4x4_21(img_4x4_21),.img_4x4_22(img_4x4_22),.img_4x4_23(img_4x4_23),
	.img_4x4_30(img_4x4_30),.img_4x4_31(img_4x4_31),.img_4x4_32(img_4x4_32),.img_4x4_33(img_4x4_33)
	);

syntax_decoding syntax_decoding(
	.clk(clk),.reset_n(reset_n),
	.BitStream_buffer_output(BitStream_buffer_output),
	.exp_golomb_decoding_output(exp_golomb_decoding_output),
	.parser_state(parser_state),.nal_unit_state(nal_unit_state),
	.seq_parameter_set_state(seq_parameter_set_state),.pic_parameter_set_state(pic_parameter_set_state),
	.dec_ref_pic_marking_state(dec_ref_pic_marking_state),
	.slice_data_state(slice_data_state),
	
	.dependent_variable_decoding_output(dependent_variable_decoding_output),
	.slice_header_state(slice_header_state),
	.start_code_prefix_found(start_code_prefix_found),
	.nal_ref_idc(nal_ref_idc),.chroma_format_idc(chroma_format_idc),
	.pic_order_cnt_type(pic_order_cnt_type),
	.nal_unit_type(nal_unit_type),.profile_idc(profile_idc),
	.slice_type(slice_type),
	.deblocking_filter_control_present_flag(deblocking_filter_control_present_flag),
	.disable_deblocking_filter_idc(disable_deblocking_filter_idc),
	.pic_init_qp_minus26(pic_init_qp_minus26),
	.chroma_qp_index_offset(chroma_qp_index_offset),
	.weighted_bipred_idc(weighted_bipred_idc),
	.log2_max_frame_num_minus4(log2_max_frame_num_minus4),
	.constrained_intra_pred_flag(constrained_intra_pred_flag),
	.adaptive_ref_pic_marking_mode_flag(adaptive_ref_pic_marking_mode_flag),
	.memory_management_control_operation(memory_management_control_operation),
	.mb_type_general(mb_type_general),
	.mb_type(mb_type),
	.Intra16x16_predmode(Intra16x16_predmode),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.frame_num(frame_num),.sps_complete(sps_complete)
	);




intra_pred_16 intra_pred_16(
	.clk(clk),.reset_n(reset_n),
	.Intra16x16_predmode(Intra16x16_predmode),
	.state16(state16),
	.nrblock16_0({8'b0,nrblock16_0}),.nrblock16_1({8'b0,nrblock16_1}),.nrblock16_2({8'b0,nrblock16_2}),.nrblock16_3({8'b0,nrblock16_3}),
	.intra16_pred_num(intra16_pred_num),
	.intra_pred_state(intra_pred_state),
	.mb_num_h(mb_num_h_slice),.mb_num_v(mb_num_v_slice),
	.img_addra_y0(img_addra_y0),.img_addra_y1(img_addra_y1),.img_addra_y2(img_addra_y2),.img_addra_y3(img_addra_y3),
	.img_addra_u0(img_addra_u0),.img_addra_u1(img_addra_u1),.img_addra_u2(img_addra_u2),.img_addra_u3(img_addra_u3),
	.img_addra_v0(img_addra_v0),.img_addra_v1(img_addra_v1),.img_addra_v2(img_addra_v2),.img_addra_v3(img_addra_v3),

	.intra_pred_16_00(intra_pred_16_00),.intra_pred_16_01(intra_pred_16_01),
	.intra_pred_16_02(intra_pred_16_02),.intra_pred_16_03(intra_pred_16_03),
	.intra_pred_16_10(intra_pred_16_10),.intra_pred_16_11(intra_pred_16_11),
	.intra_pred_16_12(intra_pred_16_12),.intra_pred_16_13(intra_pred_16_13),
	.intra_pred_16_20(intra_pred_16_20),.intra_pred_16_21(intra_pred_16_21),
	.intra_pred_16_22(intra_pred_16_22),.intra_pred_16_23(intra_pred_16_23),
	.intra_pred_16_30(intra_pred_16_30),.intra_pred_16_31(intra_pred_16_31),
	.intra_pred_16_32(intra_pred_16_32),.intra_pred_16_33(intra_pred_16_33)
);

pc_decoding pc_decoding(
	.clk(clk),.reset_n(reset_n),
	.parser_state(parser_state),.nal_unit_state(nal_unit_state),
	.seq_parameter_set_state(seq_parameter_set_state),.pic_parameter_set_state(pic_parameter_set_state),
	.exp_golomb_len(exp_golomb_len),
	.slice_header_state(slice_header_state),
 	.dec_ref_pic_marking_state(dec_ref_pic_marking_state),
	.slice_data_state(slice_data_state),
	.start_code_prefix_found(start_code_prefix_found),
	.cavlc_consumed_bits_len(cavlc_consumed_bits_len),
	.dependent_variable_len(dependent_variable_len),
	.pc(pc),.pc_delta(pc_delta),.pc_reg(pc_reg)
	);
	
exp_golomb_decoding exp_golomb_decoding(	
	.reset_n(reset_n),
	.heading_one_pos(heading_one_pos),
	.BitStream_buffer_output(BitStream_buffer_output),
	.seq_parameter_set_state(seq_parameter_set_state),.pic_parameter_set_state(pic_parameter_set_state),
	.slice_header_state(slice_header_state),.slice_data_state(slice_data_state),
	.dec_ref_pic_marking_state(dec_ref_pic_marking_state),
	.exp_golomb_decoding_output(exp_golomb_decoding_output),
	.exp_golomb_len(exp_golomb_len)
	);
	
heading_one_detector heading_one_detector (
	.BitStream_buffer_output(BitStream_buffer_output),
	.heading_one_pos(heading_one_pos)
	); 


dependent_variable_decoding dependent_variable_decoding(
	.slice_header_state(slice_header_state),
	.log2_max_frame_num_minus4(log2_max_frame_num_minus4),
	.BitStream_buffer_output(BitStream_buffer_output),
	.dependent_variable_len(dependent_variable_len),
	.dependent_variable_decoding_output(dependent_variable_decoding_output)
	);



assign img0 = {img_4x4_03[7:0],img_4x4_02[7:0],img_4x4_01[7:0],img_4x4_00[7:0]};
assign img1 = {img_4x4_13[7:0],img_4x4_12[7:0],img_4x4_11[7:0],img_4x4_10[7:0]};
assign img2 = {img_4x4_23[7:0],img_4x4_22[7:0],img_4x4_21[7:0],img_4x4_20[7:0]};
assign img3 = {img_4x4_33[7:0],img_4x4_32[7:0],img_4x4_31[7:0],img_4x4_30[7:0]};

assign mb_h = mb_num_h[6:0];
assign mb_v = mb_num_v[6:0];


assign TC_A_rd_addr = TC_A_rd_addr_cavlc;
assign TC_B_rd_addr = TC_B_rd_addr_cavlc;
assign TC_rd_n = TC_rd_n_cavlc;

ram_Synch # (5,6)
	 ram_TC_A(
	.clk(clk),.rst_n(reset_n),
	.rd_n(TC_rd_n),.wr_n(TC_wr_n), 
	.rd_addr(TC_A_rd_addr),.wr_addr(TC_A_wr_addr),
	.data_in(TC_din),.data_out(TC_A_dout)
	); 

ram_Synch # (5,13)
	 ram_TC_B(
	.clk(clk),.rst_n(reset_n),
	.rd_n(TC_rd_n),.wr_n(TC_wr_n), 
	.rd_addr(TC_B_rd_addr),.wr_addr(TC_B_wr_addr),
	.data_in(TC_din),.data_out(TC_B_dout)
	); 


ram_Synch # (32,12)
	 ram_intra4x4(
	.clk(clk),.rst_n(reset_n),
	.rd_n(intra4x4_rd_n),.wr_n(intra4x4_wr_n),
	.rd_addr(intra4x4_rd_addr),.wr_addr(intra4x4_wr_addr),
	.data_in(intra4x4_din),.data_out(intra4x4_dout)
	); 

endmodule

