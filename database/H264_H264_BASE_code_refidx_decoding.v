`include "timescale.v"
`include "define.v"

module refidx_decoding(
input clk,reset_n,
input [2:0] slice_type,
input [3:0] slice_data_state,
input [2:0] mb_pred_state,
input [2:0] sub_mb_pred_state,
input [7:0] mb_num_h,mb_num_v,
input [3:0] mb_type_general,
input [1:0] sub_mb_type,
input [1:0] mbPartIdx,subMbPartIdx,
input [1:0] MBTypeGen_mbAddrA,MBTypeGen_mbAddrB,MBTypeGen_mbAddrC,
input MBTypeGen_mbAddrD,
input [2:0] B_MbPartPredMode_0,B_MbPartPredMode_1,
input [15:0] ref_idx_l0,ref_idx_l1,
input [1:0] SubMbPredMode,
input [7:0] pic_width_in_mbs_minus1,pic_height_in_map_units_minus1,
input [9:0] refIdxL0_addrB_dout,refIdxL0_addrC_dout,refIdxL0_addrD_dout,
input [9:0] refIdxL1_addrB_dout,refIdxL1_addrC_dout,refIdxL1_addrD_dout,
input [1:0] predFlagL0_addrB_dout,predFlagL0_addrC_dout,predFlagL0_addrD_dout,
input [1:0] predFlagL1_addrB_dout,predFlagL1_addrC_dout,predFlagL1_addrD_dout,
input ref_idx_rd_for_DF,Is_skip_run_entry,Is_skip_run_end,p_skip_end,
input direct_spatial_mv_pred_flag,b_col_end,
		

output reg skip_mv_calc,
output Is_skipMB_mv_calc,
output reg [4:0] refIdxL0,refIdxL1,
output [4:0] refIdxL0A,refIdxL0B,refIdxL1A,refIdxL1B,
output reg [4:0] refIdxL0C,refIdxL1C,

output reg predFlagL0,predFlagL0_A,predFlagL0_B,predFlagL0_C,predFlagL0_D,
output reg predFlagL1,predFlagL1_A,predFlagL1_B,predFlagL1_C,predFlagL1_D,


output reg [19:0] refIdxL0_curr,refIdxL1_curr,      //[4:0] 0 [9:5] 1
output reg [3:0] predFlagL0_curr,predFlagL1_curr,

output reg [9:0] refIdxL0_addrA,refIdxL1_addrA,
output reg [1:0] predFlagL0_addrA,predFlagL1_addrA,


output reg [9:0] refIdxL0_addrB_din,
output reg [7:0] refIdxL0_addrB_wr_addr,refIdxL0_addrB_rd_addr,refIdxL0_addrC_rd_addr,refIdxL0_addrD_rd_addr,
output reg refIdxL0_addrB_wr_n,

output reg [9:0] refIdxL1_addrB_din,
output reg [7:0] refIdxL1_addrB_wr_addr,refIdxL1_addrB_rd_addr,refIdxL1_addrC_rd_addr,refIdxL1_addrD_rd_addr,
output reg refIdxL1_addrB_wr_n,


output reg [1:0] predFlagL0_addrB_din,
output reg [7:0] predFlagL0_addrB_wr_addr,predFlagL0_addrB_rd_addr,predFlagL0_addrC_rd_addr,predFlagL0_addrD_rd_addr,
output reg predFlagL0_addrB_wr_n,

output reg [1:0] predFlagL1_addrB_din,
output reg [7:0] predFlagL1_addrB_wr_addr,predFlagL1_addrB_rd_addr,predFlagL1_addrC_rd_addr,predFlagL1_addrD_rd_addr,
output reg predFlagL1_addrB_wr_n


);



always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		skip_mv_calc <= 1'b0;
	else if ((slice_data_state == `skip_run_updat  && !Is_skip_run_end && slice_type == `slice_type_p)||
		(slice_data_state == `b_skip_col && b_col_end))
		skip_mv_calc <= 1'b1;
	else
		skip_mv_calc <= 1'b0; 
	
	
assign Is_skipMB_mv_calc = Is_skip_run_entry | skip_mv_calc;
////L0
reg [4:0] refIdxL0_A,refIdxL0_B,refIdxL0_C,refIdxL0_D;




assign refIdxL0A = ((Is_skipMB_mv_calc || 
		((mb_pred_state == `mvd_l0_s || mb_pred_state == `mvd_l1_s) && 
			(mb_type_general == `MB_Inter16x16 || mb_type_general == `MB_Inter16x8 || (mb_type_general == `MB_Inter8x16 && mbPartIdx == 0)))||
		((sub_mb_pred_state == `sub_mvd_l0_s ||sub_mb_pred_state == `sub_mvd_l1_s )&& (mbPartIdx == 0 || mbPartIdx == 2) && 
			(sub_mb_type == 0 || sub_mb_type == 1 || 
			(sub_mb_type == 2 && subMbPartIdx == 0) || 
			(sub_mb_type == 3 && (subMbPartIdx == 0 || subMbPartIdx == 2)))) )&& 
		(mb_num_h == 0 || MBTypeGen_mbAddrA[1] == 1)) || predFlagL0_A == 0 ?
		5'b11111:refIdxL0_A;



assign refIdxL0B = ((Is_skipMB_mv_calc || 
		((mb_pred_state == `mvd_l0_s || mb_pred_state == `mvd_l1_s) && 
			(mb_type_general == `MB_Inter16x16 || (mb_type_general == `MB_Inter16x8 && mbPartIdx == 0) || mb_type_general == `MB_Inter8x16)) ||
		((sub_mb_pred_state == `sub_mvd_l0_s ||sub_mb_pred_state == `sub_mvd_l1_s ) && 
			(mbPartIdx == 0 || mbPartIdx == 1 || (SubMbPredMode == `B_sub_Direct && slice_type == `slice_type_b)) && 
			(sub_mb_type == 0 || sub_mb_type == 2 || 
			(sub_mb_type == 1 && subMbPartIdx == 0) || 
			(sub_mb_type == 3 && (subMbPartIdx == 0 || subMbPartIdx == 1))))))?
		(mb_num_v == 0 ? refIdxL0A : MBTypeGen_mbAddrB[1] == 1 ? 5'b11111:refIdxL0_B):
			predFlagL0_B == 0 ? 5'b11111 : refIdxL0_B ;
		
always @ (Is_skipMB_mv_calc or mb_pred_state or sub_mb_pred_state or mb_type_general or mb_num_v or mb_num_h
		or sub_mb_type or mbPartIdx or MBTypeGen_mbAddrC[1] or MBTypeGen_mbAddrD or refIdxL0B or refIdxL0_D
		or pic_width_in_mbs_minus1 or predFlagL0_D or predFlagL0_C or refIdxL0_C or MBTypeGen_mbAddrA)

	if (Is_skipMB_mv_calc || ((mb_pred_state == `mvd_l0_s || mb_pred_state == `mvd_l1_s) && mb_type_general == `MB_Inter16x16))
		if (mb_num_v == 0)	refIdxL0C = refIdxL0B;
		else if(mb_num_h == pic_width_in_mbs_minus1) 
			refIdxL0C = (MBTypeGen_mbAddrD == `MB_addrD_Intra || predFlagL0_D == 0)?5'b11111:refIdxL0_D;
		else    refIdxL0C = (MBTypeGen_mbAddrC[1] == 1'b1 || predFlagL0_C == 0)?5'b11111:refIdxL0_C;
	else if ((mb_pred_state == `mvd_l0_s || mb_pred_state == `mvd_l1_s) && mb_type_general == `MB_Inter16x8) 
		if (mbPartIdx == 0)
			if (mb_num_v == 0)	refIdxL0C = refIdxL0B;
			else if (mb_num_h == pic_width_in_mbs_minus1)	
				refIdxL0C = (MBTypeGen_mbAddrD == `MB_addrD_Intra || predFlagL0_D == 0)?5'b11111:refIdxL0_D;
			else	refIdxL0C =  (MBTypeGen_mbAddrC[1] == 1'b1 || predFlagL0_C == 0)?5'b11111:refIdxL0_C;
		else 
			if(mb_num_h == 0)	refIdxL0C =  5'b11111;
			else	refIdxL0C = MBTypeGen_mbAddrA[1] == 1 ? 5'b11111:refIdxL0_D;
	else if ((mb_pred_state == `mvd_l0_s || mb_pred_state == `mvd_l1_s) && mb_type_general == `MB_Inter8x16)
		if (mbPartIdx == 0)
			if (mb_num_v == 0)	refIdxL0C = refIdxL0B;
			else	refIdxL0C =  (MBTypeGen_mbAddrB[1] == 1'b1 || predFlagL0_C == 0)?5'b11111:refIdxL0_C;
		else  
			if(mb_num_v == 0)  	refIdxL0C = refIdxL0B;
			else if(mb_num_h == pic_width_in_mbs_minus1)
				refIdxL0C = (MBTypeGen_mbAddrB[1] == 1'b1 || predFlagL0_D == 0)?5'b11111:refIdxL0_D;
			else	refIdxL0C =  (MBTypeGen_mbAddrC[1] == 1'b1 || predFlagL0_C == 0)?5'b11111:refIdxL0_C;
	else if (sub_mb_pred_state == `sub_mvd_l0_s ||sub_mb_pred_state == `sub_mvd_l1_s )
		if(SubMbPredMode == `B_sub_Direct && slice_type == `slice_type_b)begin
			if (mb_num_v == 0)	refIdxL0C = refIdxL0B;
			else	refIdxL0C =  (MBTypeGen_mbAddrC[1] == 1'b1 || predFlagL0_C == 0)?5'b11111:refIdxL0_C;end
		else
		case (mbPartIdx)
		2'b00:if (mb_num_v == 0)	refIdxL0C = refIdxL0B;
			else	refIdxL0C =  (MBTypeGen_mbAddrB[1] == 1'b1 || predFlagL0_C == 0)?5'b11111:refIdxL0_C;
		2'b01:if(mb_num_v == 0)  	refIdxL0C = refIdxL0B;
			else if(mb_num_h == pic_width_in_mbs_minus1)
				refIdxL0C = (MBTypeGen_mbAddrB[1] == 1'b1 || predFlagL0_D == 0)?5'b11111:refIdxL0_D;
			else	refIdxL0C =  (MBTypeGen_mbAddrC[1] == 1'b1 || predFlagL0_C == 0)?5'b11111:refIdxL0_C;
		2'b10:refIdxL0C =  refIdxL0_C;
		2'b11:refIdxL0C =  refIdxL0_C;
		endcase
			
			


always@(Is_skipMB_mv_calc or mb_pred_state or slice_type or sub_mb_pred_state or predFlagL0_addrA or predFlagL0_curr
	or mb_type_general or mbPartIdx)
	if (Is_skipMB_mv_calc)
		predFlagL0_A = predFlagL0_addrA[0];
	else if(mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s || 
		mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)
		case(mb_type_general)
		`MB_Inter16x16:predFlagL0_A = predFlagL0_addrA[0];
		`MB_Inter16x8:
			case(mbPartIdx)
			0:    predFlagL0_A = predFlagL0_addrA[0];
			1:    predFlagL0_A = predFlagL0_addrA[1];
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:    predFlagL0_A = predFlagL0_addrA[0];
			1:    predFlagL0_A = predFlagL0_curr[0];
			default:;
			endcase
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			case(mbPartIdx)
			0:    predFlagL0_A = predFlagL0_addrA[0];
			1:    predFlagL0_A = predFlagL0_curr[0];
			2:    predFlagL0_A = predFlagL0_addrA[1];
			3:    predFlagL0_A = predFlagL0_curr[2];
			endcase
		default:;
		endcase


always@(Is_skipMB_mv_calc or mb_pred_state or slice_type or sub_mb_pred_state or refIdxL0_addrA or refIdxL0_curr 
	or mbPartIdx or mb_type_general)
	if (Is_skipMB_mv_calc)
		refIdxL0_A = refIdxL0_addrA[4:0];
	else if(mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s || 
		mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)
		case(mb_type_general)
		`MB_Inter16x16:refIdxL0_A = refIdxL0_addrA[4:0];
		`MB_Inter16x8:
			case(mbPartIdx)
			0:    refIdxL0_A = refIdxL0_addrA[4:0];
			1:    refIdxL0_A = refIdxL0_addrA[9:5];
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:    refIdxL0_A = refIdxL0_addrA[4:0];
			1:    refIdxL0_A = refIdxL0_curr[4:0];
			default:;
			endcase
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			case(mbPartIdx)
			0:    refIdxL0_A = refIdxL0_addrA[4:0];
			1:    refIdxL0_A = refIdxL0_curr[4:0];
			2:    refIdxL0_A = refIdxL0_addrA[9:5];
			3:    refIdxL0_A = refIdxL0_curr[14:10];
			endcase
		default:;
		endcase
		

always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)
		predFlagL0_addrA <= 0;
	else if(slice_data_state == `skip_run_duration&&p_skip_end)
		predFlagL0_addrA <= {predFlagL0_curr[3],predFlagL0_curr[1]};
	else if(slice_data_state == `coded_block_pattern_s||(slice_data_state == `mb_qp_delta_s && mb_type_general[3:2] == 2'b10))
		case(mb_type_general)
		`MB_Inter16x16,`MB_Inter16x8,`MB_Inter8x16,`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			predFlagL0_addrA <= {predFlagL0_curr[3],predFlagL0_curr[1]};
		default:predFlagL0_addrA <= 0;
		endcase

always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)
		refIdxL0_addrA <= 0;
	else if(slice_data_state == `skip_run_duration&&p_skip_end)
		refIdxL0_addrA <= {refIdxL0_curr[19:15],refIdxL0_curr[9:5]};
	else if(slice_data_state == `coded_block_pattern_s||(slice_data_state == `mb_qp_delta_s && mb_type_general[3:2] == 2'b10))
		case(mb_type_general)
		`MB_Inter16x16,`MB_Inter16x8,`MB_Inter8x16,`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			refIdxL0_addrA <= {refIdxL0_curr[19:15],refIdxL0_curr[9:5]};
		default:refIdxL0_addrA <= 0;
		endcase




always@(Is_skipMB_mv_calc or mb_pred_state or slice_type or sub_mb_pred_state or ref_idx_rd_for_DF 
	or mb_num_v or mb_num_h )
	if(ref_idx_rd_for_DF)begin
		refIdxL0_addrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};
		predFlagL0_addrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};end
	else if(mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s || 
		mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s || Is_skipMB_mv_calc)begin
		refIdxL0_addrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};
		predFlagL0_addrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};
		refIdxL0_addrC_rd_addr = {~mb_num_v[0],mb_num_h[6:0]+7'b1};
		predFlagL0_addrC_rd_addr = {~mb_num_v[0],mb_num_h[6:0]+7'b1};
		refIdxL0_addrD_rd_addr = {~mb_num_v[0],mb_num_h[6:0]-7'b1};
		predFlagL0_addrD_rd_addr = {~mb_num_v[0],mb_num_h[6:0]-7'b1};end
	else begin
		refIdxL0_addrB_rd_addr = 0;
		predFlagL0_addrB_rd_addr = 0;
		refIdxL0_addrC_rd_addr = 0;
		predFlagL0_addrC_rd_addr = 0;
		refIdxL0_addrD_rd_addr = 0;
		predFlagL0_addrD_rd_addr = 0;end

always@(Is_skipMB_mv_calc or mb_pred_state or slice_type or sub_mb_pred_state or mb_type_general or refIdxL0_addrD_dout or predFlagL0_addrD_dout 
	or refIdxL0_addrA or predFlagL0_addrA or mbPartIdx)
	if(((mb_pred_state == `mvd_l0_s || mb_pred_state == `mvd_l1_s)  && mb_type_general == `MB_Inter16x16) ||Is_skipMB_mv_calc)begin
		refIdxL0_D = refIdxL0_addrD_dout[9:5];
		predFlagL0_D = predFlagL0_addrD_dout[1];end
	else if((mb_pred_state == `mvd_l0_s || mb_pred_state == `mvd_l1_s) && mb_type_general == `MB_Inter16x8)
		case(mbPartIdx)
		0:begin    refIdxL0_D = refIdxL0_addrD_dout[9:5];
			   predFlagL0_D = predFlagL0_addrD_dout[1];end
		1:begin    refIdxL0_D = refIdxL0_addrA[4:0];
			   predFlagL0_D = predFlagL0_addrA[0];end
		default:;
		endcase
	else if((mb_pred_state == `mvd_l0_s || mb_pred_state == `mvd_l1_s) && mb_type_general == `MB_Inter8x16)
		case(mbPartIdx)
		0:begin    refIdxL0_D = refIdxL0_addrD_dout[9:5];
			   predFlagL0_D = predFlagL0_addrD_dout[1];end
		1:begin    refIdxL0_D = refIdxL0_addrB_dout[4:0];
			   predFlagL0_D = predFlagL0_addrB_dout[0];end
		default:;
		endcase
	else if(sub_mb_pred_state == `sub_mvd_l1_s || sub_mb_pred_state == `sub_mvd_l0_s )begin
		if(mbPartIdx == 1)begin    
			refIdxL0_D = refIdxL0_addrB_dout[4:0];
			predFlagL0_D = predFlagL0_addrB_dout[0];end		
		else begin
			refIdxL0_D = refIdxL0_addrD_dout[9:5];
			predFlagL0_D = predFlagL0_addrD_dout[1];end	
	end




always@(Is_skipMB_mv_calc or mb_pred_state or slice_type or sub_mb_pred_state or refIdxL0_addrB_dout or predFlagL0_addrB_dout or mb_type_general
	or mbPartIdx or refIdxL0_curr or predFlagL0_curr or refIdxL0_addrC_dout or predFlagL0_addrC_dout or SubMbPredMode)
	if (Is_skipMB_mv_calc)begin
		refIdxL0_B = refIdxL0_addrB_dout[4:0];
		predFlagL0_B = predFlagL0_addrB_dout[0];
		refIdxL0_C = refIdxL0_addrC_dout[4:0];
		predFlagL0_C = predFlagL0_addrC_dout[0];end
	else if(mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s|| 
		mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)
		case(mb_type_general)
		`MB_Inter16x16:begin
			refIdxL0_B = refIdxL0_addrB_dout[4:0];
			predFlagL0_B = predFlagL0_addrB_dout[0];
			refIdxL0_C = refIdxL0_addrC_dout[4:0];
			predFlagL0_C = predFlagL0_addrC_dout[0];end
		`MB_Inter16x8:
			case(mbPartIdx)
			0:begin
				refIdxL0_B = refIdxL0_addrB_dout[4:0];
				predFlagL0_B = predFlagL0_addrB_dout[0];
				refIdxL0_C = refIdxL0_addrC_dout[4:0];
				predFlagL0_C = predFlagL0_addrC_dout[0];end   
			1:begin
				refIdxL0_B = refIdxL0_curr[4:0];
				predFlagL0_B = predFlagL0_curr[0];
				refIdxL0_C = 0;
				predFlagL0_C = 0;end
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:begin refIdxL0_B = refIdxL0_addrB_dout[4:0];
				predFlagL0_B = predFlagL0_addrB_dout[0];
				refIdxL0_C = refIdxL0_addrB_dout[9:5];
				predFlagL0_C = predFlagL0_addrB_dout[1];end
			1:begin refIdxL0_B = refIdxL0_addrB_dout[9:5];
				predFlagL0_B = predFlagL0_addrB_dout[1];
				refIdxL0_C = refIdxL0_addrC_dout[4:0];
				predFlagL0_C = predFlagL0_addrC_dout[0];end
			default:;
			endcase
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			if (SubMbPredMode == `B_sub_Direct && slice_type == `slice_type_b)begin
				refIdxL0_B = refIdxL0_addrB_dout[4:0];
				predFlagL0_B = predFlagL0_addrB_dout[0];
				refIdxL0_C = refIdxL0_addrB_dout[9:5];
				predFlagL0_C = predFlagL0_addrB_dout[1];end
			else
			case(mbPartIdx)
			0:begin refIdxL0_B = refIdxL0_addrB_dout[4:0];
				predFlagL0_B = predFlagL0_addrB_dout[0];
				refIdxL0_C = refIdxL0_addrB_dout[9:5];
				predFlagL0_C = predFlagL0_addrB_dout[1];end
			1:begin refIdxL0_B = refIdxL0_addrB_dout[9:5];
				predFlagL0_B = predFlagL0_addrB_dout[1];
				refIdxL0_C = refIdxL0_addrC_dout[4:0];
				predFlagL0_C = predFlagL0_addrC_dout[0];end
			2:begin refIdxL0_B = refIdxL0_curr[4:0];
				predFlagL0_B = predFlagL0_curr[0];
				refIdxL0_C = refIdxL0_curr[9:5];
				predFlagL0_C = predFlagL0_curr[1];end
			3:begin refIdxL0_B = refIdxL0_curr[9:5];
				predFlagL0_B = predFlagL0_curr[1];
				refIdxL0_C = refIdxL0_curr[4:0];
				predFlagL0_C = predFlagL0_curr[0];end
			endcase
		default:;
		endcase


always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		predFlagL0_addrB_wr_n <= 1;
		predFlagL0_addrB_din <= 0;
		predFlagL0_addrB_wr_addr <= 0;end
	else if(slice_data_state == `skip_run_duration&&p_skip_end)begin
		predFlagL0_addrB_wr_n <= 0;
		predFlagL0_addrB_din <= {predFlagL0_curr[3],predFlagL0_curr[2]};
		predFlagL0_addrB_wr_addr <= {mb_num_v[0],mb_num_h[6:0]};end
	else if(slice_data_state == `coded_block_pattern_s||(slice_data_state == `mb_qp_delta_s && mb_type_general[3:2] == 2'b10))begin
		predFlagL0_addrB_wr_n <= 0;
		predFlagL0_addrB_din <= {predFlagL0_curr[3],predFlagL0_curr[2]};
		predFlagL0_addrB_wr_addr <= {mb_num_v[0],mb_num_h[6:0]};end
	else begin
		predFlagL0_addrB_wr_n <= 1;
		predFlagL0_addrB_din <= 0;
		predFlagL0_addrB_wr_addr <= 0;end

always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		refIdxL0_addrB_wr_n <= 1;
		refIdxL0_addrB_din <= 0;
		refIdxL0_addrB_wr_addr <= 0;end
	else if(slice_data_state == `skip_run_duration&&p_skip_end)begin
		refIdxL0_addrB_wr_n <= 0;
		refIdxL0_addrB_din <= refIdxL0_curr[19:10];
		refIdxL0_addrB_wr_addr <= {mb_num_v[0],mb_num_h[6:0]};end
	else if(slice_data_state == `coded_block_pattern_s||(slice_data_state == `mb_qp_delta_s && mb_type_general[3:2] == 2'b10))begin
		refIdxL0_addrB_wr_n <= 0;
		refIdxL0_addrB_din <= refIdxL0_curr[19:10];
		refIdxL0_addrB_wr_addr <= {mb_num_v[0],mb_num_h[6:0]};end
	else begin
		refIdxL0_addrB_wr_n <= 1;
		refIdxL0_addrB_din <= 0;
		refIdxL0_addrB_wr_addr <= 0;end


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		predFlagL0_curr <= 0;
	else if (Is_skipMB_mv_calc)
		predFlagL0_curr <= {predFlagL0,predFlagL0,predFlagL0,predFlagL0}; 
	else if(mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s)
		case(mb_type_general)
		`MB_Inter16x16:
			predFlagL0_curr <= {predFlagL0,predFlagL0,predFlagL0,predFlagL0};
		`MB_Inter16x8:
			case(mbPartIdx)
			0:predFlagL0_curr[1:0] <= {predFlagL0,predFlagL0};
			1:predFlagL0_curr[3:2] <= {predFlagL0,predFlagL0};
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:{predFlagL0_curr[2],predFlagL0_curr[0]} <= {predFlagL0,predFlagL0};
			1:{predFlagL0_curr[3],predFlagL0_curr[1]} <= {predFlagL0,predFlagL0};
			default:;
			endcase
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			case(mbPartIdx)
			0:predFlagL0_curr[0] <= predFlagL0;
			1:predFlagL0_curr[1] <= predFlagL0;
			2:predFlagL0_curr[2] <= predFlagL0;
			3:predFlagL0_curr[3] <= predFlagL0;
			default:;
			endcase
		default:;
		endcase
 	else if(mb_type_general[3] == 1)
		predFlagL0_curr <= 0;


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		refIdxL0_curr <= 0;
	else if(Is_skipMB_mv_calc)
		refIdxL0_curr <= {refIdxL0,refIdxL0,refIdxL0,refIdxL0}; 
	else if(mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s)
		case(mb_type_general)
		`MB_Inter16x16:
			refIdxL0_curr <= {refIdxL0,refIdxL0,refIdxL0,refIdxL0};
		`MB_Inter16x8:
			case(mbPartIdx)
			0:refIdxL0_curr[9:0] <= {refIdxL0,refIdxL0};
			1:refIdxL0_curr[19:10] <= {refIdxL0,refIdxL0};
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:{refIdxL0_curr[14:10],refIdxL0_curr[4:0]} <= {refIdxL0,refIdxL0};
			1:{refIdxL0_curr[19:15],refIdxL0_curr[9:5]} <= {refIdxL0,refIdxL0};
			default:;
			endcase
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			case(mbPartIdx)
			0:refIdxL0_curr[4:0] <= refIdxL0;
			1:refIdxL0_curr[9:5] <= refIdxL0;
			2:refIdxL0_curr[14:10] <= refIdxL0;
			3:refIdxL0_curr[19:15] <= refIdxL0;
			default:;
			endcase
		default:;
		endcase
	else if(mb_type_general[3] == 1)
		refIdxL0_curr <= 20'hfffff;
 
wire [4:0] MinPositiveL0_out,MinPositiveL1_out;
MinPositive MinPositive_L0(.A(refIdxL0A),.B(refIdxL0B),.C(refIdxL0C),.out(MinPositiveL0_out));
MinPositive MinPositive_L1(.A(refIdxL1A),.B(refIdxL1B),.C(refIdxL1C),.out(MinPositiveL1_out));

always@(Is_skipMB_mv_calc or mb_pred_state or slice_type or ref_idx_l0 or mbPartIdx or B_MbPartPredMode_0 or B_MbPartPredMode_1 or SubMbPredMode
	or sub_mb_type or mb_type_general or MinPositiveL0_out or MinPositiveL1_out )
	if (Is_skipMB_mv_calc && slice_type == `slice_type_p)begin
		refIdxL0 = 0; predFlagL0 = 1;end
	else if((Is_skipMB_mv_calc || (mb_pred_state == `mvd_l0_s && B_MbPartPredMode_0 == `B_Direct) ||
		(sub_mb_pred_state == `sub_mvd_l0_s && sub_mb_type == 0 && SubMbPredMode == `B_sub_Direct))&& slice_type == `slice_type_b)
		case(direct_spatial_mv_pred_flag)
		0:begin refIdxL0 = 0; predFlagL0 = 1;end
		1:begin refIdxL0 = MinPositiveL0_out[4] && MinPositiveL1_out[4]?0:MinPositiveL0_out; 
			predFlagL0 = MinPositiveL0_out[4] && ~MinPositiveL1_out[4]?0:1;end
		endcase
	else if((mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s) && slice_type == `slice_type_p)begin
		case(mb_type_general)
		`MB_Inter16x16:
			refIdxL0 = {1'b0,ref_idx_l0[3:0]}; 
		`MB_Inter16x8:
			case(mbPartIdx)
			0:    refIdxL0 = {1'b0,ref_idx_l0[3:0]};
			1:    refIdxL0 = {1'b0,ref_idx_l0[11:8]};
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:    refIdxL0 = {1'b0,ref_idx_l0[3:0]};
			1:    refIdxL0 = {1'b0,ref_idx_l0[7:4]};
			default:;
			endcase
		`MB_P_8x8,`MB_P_8x8ref0:
			case(mbPartIdx)
			0:    refIdxL0 = {1'b0,ref_idx_l0[3:0]};
			1:    refIdxL0 = {1'b0,ref_idx_l0[7:4]};
			2:    refIdxL0 = {1'b0,ref_idx_l0[11:8]};
			3:    refIdxL0 = {1'b0,ref_idx_l0[15:12]};
			default:;
			endcase
		default:refIdxL0 = 0;
		endcase
		predFlagL0 = 1;end
	else if((mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s) && slice_type == `slice_type_b)
		case(mb_type_general)
		`MB_Inter16x16:
			if(B_MbPartPredMode_0 == `B_Pred_L0 || B_MbPartPredMode_0 == `B_BiPred)begin
				refIdxL0 = {1'b0,ref_idx_l0[3:0]}; predFlagL0 = 1;end
			else begin
				refIdxL0 = 5'b11111; predFlagL0 = 0;end
		`MB_Inter16x8:
			case(mbPartIdx)
			0:if(B_MbPartPredMode_0 == `B_Pred_L0 || B_MbPartPredMode_0 == `B_BiPred)begin
				refIdxL0 = {1'b0,ref_idx_l0[3:0]}; predFlagL0 = 1;end
			  else begin
				refIdxL0 = 5'b11111; predFlagL0 = 0;end
			1:if(B_MbPartPredMode_1 == `B_Pred_L0 || B_MbPartPredMode_1 == `B_BiPred)begin
			        refIdxL0 = {1'b0,ref_idx_l0[11:8]}; predFlagL0 = 1;end
			  else begin
				refIdxL0 = 5'b11111; predFlagL0 = 0;end
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:if(B_MbPartPredMode_0 == `B_Pred_L0 || B_MbPartPredMode_0 == `B_BiPred)begin
				refIdxL0 = {1'b0,ref_idx_l0[3:0]}; predFlagL0 = 1;end
			  else begin
				refIdxL0 = 5'b11111; predFlagL0 = 0;end
			1:if(B_MbPartPredMode_1 == `B_Pred_L0 || B_MbPartPredMode_1 == `B_BiPred)begin
			        refIdxL0 = {1'b0,ref_idx_l0[7:4]}; predFlagL0 = 1;end
			  else begin
				refIdxL0 = 5'b11111; predFlagL0 = 0;end
			default:;
			endcase
		`MB_B_8x8:
			if(SubMbPredMode == `B_sub_Pred_L0 || SubMbPredMode == `B_sub_BiPred)begin    
				case(mbPartIdx)
				0:    refIdxL0 = {1'b0,ref_idx_l0[3:0]};
				1:    refIdxL0 = {1'b0,ref_idx_l0[7:4]};
				2:    refIdxL0 = {1'b0,ref_idx_l0[11:8]};
				3:    refIdxL0 = {1'b0,ref_idx_l0[15:12]};
				default:;
				endcase
				predFlagL0 = 1;end
			else begin
				refIdxL0 = 5'b11111; predFlagL0 = 0;end 
		default:begin refIdxL0 = 0; predFlagL0 = 0;end 
		endcase
	else begin
		refIdxL0 = 0; predFlagL0 = 0;end
		

//L1
reg [4:0] refIdxL1_A,refIdxL1_B,refIdxL1_C,refIdxL1_D;


assign refIdxL1A = ((Is_skipMB_mv_calc || 
		((mb_pred_state == `mvd_l1_s || mb_pred_state == `mvd_l0_s) && 
			(mb_type_general == `MB_Inter16x16 || mb_type_general == `MB_Inter16x8 || (mb_type_general == `MB_Inter8x16 && mbPartIdx == 0)))||
		((sub_mb_pred_state == `sub_mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s) && (mbPartIdx == 0 || mbPartIdx == 2) && 
			(sub_mb_type == 0 || sub_mb_type == 1 || 
			(sub_mb_type == 2 && subMbPartIdx == 0) || 
			(sub_mb_type == 3 && (subMbPartIdx == 0 || subMbPartIdx == 2)))) )&& 
		(mb_num_h == 0 || MBTypeGen_mbAddrA[1] == 1)) || predFlagL1_A == 0 ?
		5'b11111:refIdxL1_A;

assign refIdxL1B = ((Is_skipMB_mv_calc || 
		((mb_pred_state == `mvd_l1_s || mb_pred_state == `mvd_l0_s) && 
			(mb_type_general == `MB_Inter16x16 || (mb_type_general == `MB_Inter16x8 && mbPartIdx == 0) || mb_type_general == `MB_Inter8x16)) ||
		((sub_mb_pred_state == `sub_mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s) && 
			(mbPartIdx == 0 || mbPartIdx == 1 || (SubMbPredMode == `B_sub_Direct && slice_type == `slice_type_b)) && 
			(sub_mb_type == 0 || sub_mb_type == 2 || 
			(sub_mb_type == 1 && subMbPartIdx == 0) || 
			(sub_mb_type == 3 && (subMbPartIdx == 0 || subMbPartIdx == 1))))))?
		(mb_num_v == 0 ? refIdxL1A : MBTypeGen_mbAddrB[1] == 1 ? 5'b11111:refIdxL1_B):
			predFlagL1_B == 0 ? 5'b11111 : refIdxL1_B ;





always @ (Is_skipMB_mv_calc or mb_pred_state or sub_mb_pred_state or mb_type_general or mb_num_v or mb_num_h
		or sub_mb_type or mbPartIdx or MBTypeGen_mbAddrC[1] or MBTypeGen_mbAddrD or refIdxL1B or refIdxL1_D
		or pic_width_in_mbs_minus1 or predFlagL1_D or predFlagL1_C or refIdxL1_C or MBTypeGen_mbAddrA or SubMbPredMode)

	if (Is_skipMB_mv_calc || ((mb_pred_state == `mvd_l1_s || mb_pred_state == `mvd_l0_s)  && mb_type_general == `MB_Inter16x16))
		if (mb_num_v == 0)	refIdxL1C = refIdxL1B;
		else if(mb_num_h == pic_width_in_mbs_minus1) 
			refIdxL1C = (MBTypeGen_mbAddrD == `MB_addrD_Intra || predFlagL1_D == 0)?5'b11111:refIdxL1_D;
		else    refIdxL1C = (MBTypeGen_mbAddrC[1] == 1'b1 || predFlagL1_C == 0)?5'b11111:refIdxL1_C;
	else if ((mb_pred_state == `mvd_l1_s || mb_pred_state == `mvd_l0_s)  && mb_type_general == `MB_Inter16x8) 
		if (mbPartIdx == 0)
			if (mb_num_v == 0)	refIdxL1C = refIdxL1B;
			else if (mb_num_h == pic_width_in_mbs_minus1)	
				refIdxL1C = (MBTypeGen_mbAddrD == `MB_addrD_Intra || predFlagL1_D == 0)?5'b11111:refIdxL1_D;
			else	refIdxL1C =  (MBTypeGen_mbAddrC[1] == 1'b1 || predFlagL1_C == 0)?5'b11111:refIdxL1_C;
		else    
			if (mb_num_h == 0)	refIdxL1C =  5'b11111;
			else	refIdxL1C =  MBTypeGen_mbAddrA[1] == 1 ? 5'b11111:refIdxL1_D;
	else if ((mb_pred_state == `mvd_l1_s || mb_pred_state == `mvd_l0_s) && mb_type_general == `MB_Inter8x16)
		if (mbPartIdx == 0)
			if (mb_num_v == 0)	refIdxL1C = refIdxL1B;
			else	refIdxL1C =  (MBTypeGen_mbAddrB[1] == 1'b1 || predFlagL1_C == 0)?5'b11111:refIdxL1_C;
		else  
			if(mb_num_v == 0)  	refIdxL1C = refIdxL1B;
			else if(mb_num_h == pic_width_in_mbs_minus1)
				refIdxL1C = (MBTypeGen_mbAddrB[1] == 1'b1 || predFlagL1_D == 0)?5'b11111:refIdxL1_D;
			else	refIdxL1C =  (MBTypeGen_mbAddrC[1] == 1'b1 || predFlagL1_C == 0)?5'b11111:refIdxL1_C;
	else if (sub_mb_pred_state == `sub_mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)
		if(SubMbPredMode == `B_sub_Direct && slice_type == `slice_type_b)begin
			if (mb_num_v == 0)	refIdxL1C = refIdxL1B;
			else	refIdxL1C =  (MBTypeGen_mbAddrC[1] == 1'b1 || predFlagL1_C == 0)?5'b11111:refIdxL1_C;end
		else
		case (mbPartIdx)
		2'b00:if (mb_num_v == 0)	refIdxL1C = refIdxL1B;
			else	refIdxL1C =  (MBTypeGen_mbAddrB[1] == 1'b1 || predFlagL1_C == 0)?5'b11111:refIdxL1_C;
		2'b01:if(mb_num_v == 0)  	refIdxL0C = refIdxL1B;
			else if(mb_num_h == pic_width_in_mbs_minus1)
				refIdxL1C = (MBTypeGen_mbAddrB[1] == 1'b1 || predFlagL1_D == 0)?5'b11111:refIdxL1_D;
			else	refIdxL1C =  (MBTypeGen_mbAddrC[1] == 1'b1 || predFlagL1_C == 0)?5'b11111:refIdxL1_C;
		2'b10:refIdxL1C =  refIdxL1_C;
		2'b11:refIdxL1C =  refIdxL1_C;
		endcase


always@(Is_skipMB_mv_calc or mb_pred_state or slice_type or ref_idx_l1 or mbPartIdx or B_MbPartPredMode_0 or B_MbPartPredMode_1 or SubMbPredMode
	or sub_mb_type or mb_type_general or MinPositiveL1_out or MinPositiveL0_out or mb_num_v)
	if (slice_type == `slice_type_p)begin
		refIdxL1 = 5'b11111; predFlagL1 = 0;end
	else if(slice_type == `slice_type_b)
		if(Is_skipMB_mv_calc || (mb_pred_state == `mvd_l1_s && B_MbPartPredMode_0 == `B_Direct) ||
		(sub_mb_pred_state == `sub_mvd_l1_s && sub_mb_type == 0 && SubMbPredMode == `B_sub_Direct)) 
			case(direct_spatial_mv_pred_flag)
			0:begin refIdxL1 = 0; predFlagL1 = 1;end
			1:begin refIdxL1 = MinPositiveL0_out[4] && MinPositiveL1_out[4]?0:MinPositiveL1_out; 
				predFlagL1 = MinPositiveL1_out[4] && ~MinPositiveL0_out[4] ?0:1;end
			endcase
		else if(mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)
		case(mb_type_general)
		`MB_Inter16x16:
			if(B_MbPartPredMode_0 == `B_Pred_L1 || B_MbPartPredMode_0 == `B_BiPred)begin
				refIdxL1 = {1'b0,ref_idx_l1[3:0]}; predFlagL1 = 1;end
			else begin
				refIdxL1 = 5'b11111; predFlagL1 = 0;end
		`MB_Inter16x8:
			case(mbPartIdx)
			0:if(B_MbPartPredMode_0 == `B_Pred_L1 || B_MbPartPredMode_0 == `B_BiPred)begin
				refIdxL1 = {1'b0,ref_idx_l1[3:0]}; predFlagL1 = 1;end
			  else begin
				refIdxL1 = 5'b11111; predFlagL1 = 0;end
			1:if(B_MbPartPredMode_1 == `B_Pred_L1 || B_MbPartPredMode_1 == `B_BiPred)begin
			        refIdxL1 = {1'b0,ref_idx_l1[11:8]}; predFlagL1 = 1;end
			  else begin
				refIdxL1 = 5'b11111; predFlagL1 = 0;end
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:if(B_MbPartPredMode_0 == `B_Pred_L1 || B_MbPartPredMode_0 == `B_BiPred)begin
				refIdxL1 = {1'b0,ref_idx_l1[3:0]}; predFlagL1 = 1;end
			  else begin
				refIdxL1 = 5'b11111; predFlagL1 = 0;end
			1:if(B_MbPartPredMode_1 == `B_Pred_L1 || B_MbPartPredMode_1 == `B_BiPred)begin
			        refIdxL1 = {1'b0,ref_idx_l1[7:4]}; predFlagL1 = 1;end
			  else begin
				refIdxL1 = 5'b11111; predFlagL1 = 0;end
			default:;
			endcase
		`MB_B_8x8:
			if(SubMbPredMode == `B_sub_Pred_L1 || SubMbPredMode == `B_sub_BiPred)begin    
				case(mbPartIdx)
				0:    refIdxL1 = {1'b0,ref_idx_l1[3:0]};
				1:    refIdxL1 = {1'b0,ref_idx_l1[7:4]};
				2:    refIdxL1 = {1'b0,ref_idx_l1[11:8]};
				3:    refIdxL1 = {1'b0,ref_idx_l1[15:12]};
				default:;
				endcase
				predFlagL1 = 1;end
			else begin
				refIdxL1 = 5'b11111; predFlagL1 = 0;end 
		default:begin refIdxL1 = 5'b11111; predFlagL1 = 0;end 
		endcase


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		refIdxL1_curr <= 0;
	else if (slice_type == `slice_type_p)
		refIdxL1_curr <= 20'hfffff;
	else if(slice_type == `slice_type_b)begin
		if(Is_skipMB_mv_calc)
			refIdxL1_curr <= {refIdxL1,refIdxL1,refIdxL1,refIdxL1};
		else if(mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)
		case(mb_type_general)
		`MB_Inter16x16:
			refIdxL1_curr <= {refIdxL1,refIdxL1,refIdxL1,refIdxL1};
		`MB_Inter16x8:
			case(mbPartIdx)
			0:refIdxL1_curr[9:0] <= {refIdxL1,refIdxL1};
			1:refIdxL1_curr[19:10] <= {refIdxL1,refIdxL1};
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:{refIdxL1_curr[14:10],refIdxL1_curr[4:0]} <= {refIdxL1,refIdxL1};
			1:{refIdxL1_curr[19:15],refIdxL1_curr[9:5]} <= {refIdxL1,refIdxL1};
			default:;
			endcase
		`MB_B_8x8:
			case(mbPartIdx)
			0:refIdxL1_curr[4:0] <= refIdxL1;
			1:refIdxL1_curr[9:5] <= refIdxL1;
			2:refIdxL1_curr[14:10] <= refIdxL1;
			3:refIdxL1_curr[19:15] <= refIdxL1;
			default:;
			endcase
		default:;
		endcase
		else if(mb_type_general[3] == 1)
			refIdxL1_curr <= 0;
	end


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		predFlagL1_curr <= 0;
	else if (slice_type == `slice_type_p)
		predFlagL1_curr <= 4'b0000;
	else if (slice_type == `slice_type_b)begin
		if(Is_skipMB_mv_calc)
			predFlagL1_curr <= {predFlagL1,predFlagL1,predFlagL1,predFlagL1};
		else if(mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)
		case(mb_type_general)
		`MB_Inter16x16:
			predFlagL1_curr <= {predFlagL1,predFlagL1,predFlagL1,predFlagL1};
		`MB_Inter16x8:
			case(mbPartIdx)
			0:predFlagL1_curr[1:0] <= {predFlagL1,predFlagL1};
			1:predFlagL1_curr[3:2] <= {predFlagL1,predFlagL1};
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:{predFlagL1_curr[2],predFlagL1_curr[0]} <= {predFlagL1,predFlagL1};
			1:{predFlagL1_curr[3],predFlagL1_curr[1]} <= {predFlagL1,predFlagL1};
			default:;
			endcase
		`MB_B_8x8:
			case(mbPartIdx)
			0:predFlagL1_curr[0] <= predFlagL1;
			1:predFlagL1_curr[1] <= predFlagL1;
			2:predFlagL1_curr[2] <= predFlagL1;
			3:predFlagL1_curr[3] <= predFlagL1;
			default:;
			endcase
		default:;
		endcase
		else if(mb_type_general[3] == 1)
			predFlagL1_curr <= 4'b0000;
	end
 



always@(Is_skipMB_mv_calc or mb_pred_state or slice_type or sub_mb_pred_state or predFlagL1_addrA or predFlagL1_curr
	or mb_type_general or mbPartIdx )
	if (Is_skipMB_mv_calc)
		predFlagL1_A = predFlagL1_addrA[0];
	else if(mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s ||
		mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s )
		case(mb_type_general)
		`MB_Inter16x16:predFlagL1_A = predFlagL1_addrA[0];
		`MB_Inter16x8:
			case(mbPartIdx)
			0:    predFlagL1_A = predFlagL1_addrA[0];
			1:    predFlagL1_A = predFlagL1_addrA[1];
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:    predFlagL1_A = predFlagL1_addrA[0];
			1:    predFlagL1_A = predFlagL1_curr[0];
			default:;
			endcase
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			case(mbPartIdx)
			0:    predFlagL1_A = predFlagL1_addrA[0];
			1:    predFlagL1_A = predFlagL1_curr[0];
			2:    predFlagL1_A = predFlagL1_addrA[1];
			3:    predFlagL1_A = predFlagL1_curr[2];
			endcase
		default:;
		endcase


always@(Is_skipMB_mv_calc or mb_pred_state or slice_type or sub_mb_pred_state or refIdxL1_addrA or refIdxL1_curr 
	or mbPartIdx or mb_type_general)
	if (Is_skipMB_mv_calc)
		refIdxL1_A = refIdxL1_addrA[4:0];
	else if(mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s||
		mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s )
		case(mb_type_general)
		`MB_Inter16x16:refIdxL1_A = refIdxL1_addrA[4:0];
		`MB_Inter16x8:
			case(mbPartIdx)
			0:    refIdxL1_A = refIdxL1_addrA[4:0];
			1:    refIdxL1_A = refIdxL1_addrA[9:5];
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:    refIdxL1_A = refIdxL1_addrA[4:0];
			1:    refIdxL1_A = refIdxL1_curr[4:0];
			default:;
			endcase
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			case(mbPartIdx)
			0:    refIdxL1_A = refIdxL1_addrA[4:0];
			1:    refIdxL1_A = refIdxL1_curr[4:0];
			2:    refIdxL1_A = refIdxL1_addrA[9:5];
			3:    refIdxL1_A = refIdxL1_curr[14:10];
			endcase
		default:;
		endcase
		

always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)
		predFlagL1_addrA <= 0;
	else if(slice_type == `slice_type_p)
		predFlagL1_addrA <= 2'b00;
	else if(slice_type == `slice_type_b)begin
		if(slice_data_state == `skip_run_duration&&p_skip_end)
		 	predFlagL1_addrA <= {predFlagL1_curr[3],predFlagL1_curr[1]};
		else if(slice_data_state == `coded_block_pattern_s||(slice_data_state == `mb_qp_delta_s && mb_type_general[3:2] == 2'b10))
		case(mb_type_general)
		`MB_Inter16x16,`MB_Inter16x8,`MB_Inter8x16,`MB_B_8x8:
			predFlagL1_addrA <= {predFlagL1_curr[3],predFlagL1_curr[1]};
		default:predFlagL1_addrA <= 0;
		endcase
	end

always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)
		refIdxL1_addrA <= 0;
	else if(slice_type == `slice_type_p)
		refIdxL1_addrA <= 0;
	else if(slice_type == `slice_type_b)begin
		if(slice_data_state == `skip_run_duration&&p_skip_end)
			refIdxL1_addrA <= {refIdxL1_curr[19:15],refIdxL1_curr[9:5]};
		else if(slice_data_state == `coded_block_pattern_s||(slice_data_state == `mb_qp_delta_s && mb_type_general[3:2] == 2'b10))
		case(mb_type_general)
		`MB_Inter16x16,`MB_Inter16x8,`MB_Inter8x16,`MB_B_8x8:
			refIdxL1_addrA <= {refIdxL1_curr[19:15],refIdxL1_curr[9:5]};
		default:refIdxL1_addrA <= 0;
		endcase
	end



always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		predFlagL1_addrB_wr_n <= 1;
		predFlagL1_addrB_din <= 0;
		predFlagL1_addrB_wr_addr <= 0;end
	else if(slice_type == `slice_type_b)begin
		if(slice_data_state == `skip_run_duration&&p_skip_end)begin
			predFlagL1_addrB_wr_n <= 0;
			predFlagL1_addrB_din <= {predFlagL1_curr[3],predFlagL1_curr[2]};
			predFlagL1_addrB_wr_addr <= {mb_num_v[0],mb_num_h[6:0]};end
		else if(slice_data_state == `coded_block_pattern_s||(slice_data_state == `mb_qp_delta_s && mb_type_general[3:2] == 2'b10))begin
			predFlagL1_addrB_wr_n <= 0;
			predFlagL1_addrB_din <= {predFlagL1_curr[3],predFlagL1_curr[2]};
			predFlagL1_addrB_wr_addr <= {mb_num_v[0],mb_num_h[6:0]};end
	end
	else begin
		predFlagL1_addrB_wr_n <= 1;
		predFlagL1_addrB_din <= 0;
		predFlagL1_addrB_wr_addr <= 0;end

always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		refIdxL1_addrB_wr_n <= 1;
		refIdxL1_addrB_din <= 0;
		refIdxL1_addrB_wr_addr <= 0;end
	else if(slice_type == `slice_type_b)begin
		if(slice_data_state == `skip_run_duration&&p_skip_end)begin 
			refIdxL1_addrB_wr_n <= 0;
			refIdxL1_addrB_din <= refIdxL1_curr[19:10];
			refIdxL1_addrB_wr_addr <= {mb_num_v[0],mb_num_h[6:0]};end
		else if(slice_data_state == `coded_block_pattern_s||(slice_data_state == `mb_qp_delta_s && mb_type_general[3:2] == 2'b10))begin
			refIdxL1_addrB_wr_n <= 0;
			refIdxL1_addrB_din <= refIdxL1_curr[19:10];
			refIdxL1_addrB_wr_addr <= {mb_num_v[0],mb_num_h[6:0]};end
	end
	else begin
		refIdxL1_addrB_wr_n <= 1;
		refIdxL1_addrB_din <= 0;
		refIdxL1_addrB_wr_addr <= 0;end


always@(Is_skipMB_mv_calc or mb_pred_state or slice_type or sub_mb_pred_state or ref_idx_rd_for_DF 
	or mb_num_v or mb_num_h )
	if(ref_idx_rd_for_DF)begin
		refIdxL1_addrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};
		predFlagL1_addrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};end
	else if(mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s ||
		 mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s || Is_skipMB_mv_calc)begin
		refIdxL1_addrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};
		predFlagL1_addrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};
		refIdxL1_addrC_rd_addr = {~mb_num_v[0],mb_num_h[6:0]+7'b1};
		predFlagL1_addrC_rd_addr = {~mb_num_v[0],mb_num_h[6:0]+7'b1};
		refIdxL1_addrD_rd_addr = {~mb_num_v[0],mb_num_h[6:0]-7'b1};
		predFlagL1_addrD_rd_addr = {~mb_num_v[0],mb_num_h[6:0]-7'b1};end
	else begin
		refIdxL1_addrB_rd_addr = 0;
		predFlagL1_addrB_rd_addr = 0;
		refIdxL1_addrC_rd_addr = 0;
		predFlagL1_addrC_rd_addr = 0;
		refIdxL1_addrD_rd_addr = 0;
		predFlagL1_addrD_rd_addr = 0;end



always@(Is_skipMB_mv_calc or mb_pred_state or slice_type or sub_mb_pred_state or mb_type_general or refIdxL1_addrD_dout or predFlagL1_addrD_dout
	or refIdxL1_addrA or  predFlagL1_addrA or mbPartIdx)
	if(slice_type == `slice_type_p)begin
		refIdxL1_D = 0; predFlagL1_D = 1;end
	else if(slice_type == `slice_type_b)begin
		if(((mb_pred_state == `mvd_l1_s || mb_pred_state == `mvd_l0_s) && mb_type_general == `MB_Inter16x16) ||Is_skipMB_mv_calc)begin
			refIdxL1_D = refIdxL1_addrD_dout[9:5];
			predFlagL1_D = predFlagL1_addrD_dout[1];end
		else if((mb_pred_state == `mvd_l1_s || mb_pred_state == `mvd_l0_s) && mb_type_general == `MB_Inter16x8)
			case(mbPartIdx)
			0:begin    refIdxL1_D = refIdxL1_addrD_dout[9:5];
			  	   predFlagL1_D = predFlagL1_addrD_dout[1];end
			1:begin    refIdxL1_D = refIdxL1_addrA[4:0];
			   	   predFlagL1_D = predFlagL1_addrA[0];end
			default:;
			endcase
		else if((mb_pred_state == `mvd_l1_s || mb_pred_state == `mvd_l0_s) && mb_type_general == `MB_Inter8x16)
			case(mbPartIdx)
			0:begin    refIdxL1_D = refIdxL1_addrD_dout[9:5];
			  	   predFlagL1_D = predFlagL1_addrD_dout[1];end
			1:begin    refIdxL1_D = refIdxL1_addrB_dout[4:0];
			   	   predFlagL1_D = predFlagL1_addrB_dout[0];end
			default:;
			endcase
		else if(sub_mb_pred_state == `sub_mvd_l1_s || sub_mb_pred_state == `sub_mvd_l0_s )begin
			if(mbPartIdx == 1)begin
				 refIdxL1_D = refIdxL1_addrB_dout[4:0];
			   	 predFlagL1_D = predFlagL1_addrB_dout[0];end
			else begin
				refIdxL1_D = refIdxL1_addrD_dout[9:5];
				predFlagL1_D = predFlagL1_addrD_dout[1];end
			end
	end



always@(Is_skipMB_mv_calc or mb_pred_state or slice_type or sub_mb_pred_state or refIdxL1_addrB_dout or predFlagL1_addrB_dout or mb_type_general
	or mbPartIdx or refIdxL1_curr or predFlagL1_curr or refIdxL1_addrC_dout or predFlagL1_addrC_dout or SubMbPredMode)
	if(slice_type == `slice_type_p)begin
		refIdxL1_B = 0; predFlagL1_B = 0;
		refIdxL1_C = 0; predFlagL1_C = 0;end
	else if(slice_type == `slice_type_b)
		if (Is_skipMB_mv_calc)begin
			refIdxL1_B = refIdxL1_addrB_dout[4:0];
			predFlagL1_B = predFlagL1_addrB_dout[0];
			refIdxL1_C = refIdxL1_addrC_dout[4:0];
			predFlagL1_C = predFlagL1_addrC_dout[0];end
		else if(mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s||
			mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s )
			case(mb_type_general)
			`MB_Inter16x16:begin
				refIdxL1_B = refIdxL1_addrB_dout[4:0];
				predFlagL1_B = predFlagL1_addrB_dout[0];
				refIdxL1_C = refIdxL1_addrC_dout[4:0];
				predFlagL1_C = predFlagL1_addrC_dout[0];end
			`MB_Inter16x8:
				case(mbPartIdx)
				0:begin
					refIdxL1_B = refIdxL1_addrB_dout[4:0];
					predFlagL1_B = predFlagL1_addrB_dout[0];
					refIdxL1_C = refIdxL1_addrC_dout[4:0];
					predFlagL1_C = predFlagL1_addrC_dout[0];end   
				1:begin
					refIdxL1_B = refIdxL1_curr[4:0];
					predFlagL1_B = predFlagL1_curr[0];
					refIdxL1_C = 0;
					predFlagL1_C = 0;end
				default:;
				endcase
			`MB_Inter8x16:
				case(mbPartIdx)
				0:begin refIdxL1_B = refIdxL1_addrB_dout[4:0];
					predFlagL1_B = predFlagL1_addrB_dout[0];
					refIdxL1_C = refIdxL1_addrB_dout[9:5];
					predFlagL1_C = predFlagL1_addrB_dout[1];end
				1:begin refIdxL1_B = refIdxL1_addrB_dout[9:5];
					predFlagL1_B = predFlagL1_addrB_dout[1];
					refIdxL1_C = refIdxL1_addrC_dout[4:0];
					predFlagL1_C = predFlagL1_addrC_dout[0];end
				default:;
				endcase
			`MB_B_8x8:
				if (SubMbPredMode == `B_sub_Direct && slice_type == `slice_type_b)begin
					refIdxL1_B = refIdxL1_addrB_dout[4:0];
					predFlagL1_B = predFlagL1_addrB_dout[0];
					refIdxL1_C = refIdxL1_addrB_dout[9:5];
					predFlagL1_C = predFlagL1_addrB_dout[1];end
				else
				case(mbPartIdx)
				0:begin refIdxL1_B = refIdxL1_addrB_dout[4:0];
					predFlagL1_B = predFlagL1_addrB_dout[0];
					refIdxL1_C = refIdxL1_addrB_dout[9:5];
					predFlagL1_C = predFlagL1_addrB_dout[1];end
				1:begin refIdxL1_B = refIdxL1_addrB_dout[9:5];
					predFlagL1_B = predFlagL1_addrB_dout[1];
					refIdxL1_C = refIdxL1_addrC_dout[4:0];
					predFlagL1_C = predFlagL1_addrC_dout[0];end
				2:begin refIdxL1_B = refIdxL1_curr[4:0];
					predFlagL1_B = predFlagL1_curr[0];
					refIdxL1_C = refIdxL1_curr[9:5];
					predFlagL1_C = predFlagL1_curr[1];end
				3:begin refIdxL1_B = refIdxL1_curr[9:5];
					predFlagL1_B = predFlagL1_curr[1];
					refIdxL1_C = refIdxL1_curr[4:0];
					predFlagL1_C = predFlagL1_curr[0];end
				endcase
			default:;
			endcase



endmodule





module MinPositive(
input [4:0] A,B,C,
output reg[4:0] out
);

always@(A or B or C)
	case({A[4],B[4],C[4]})
	3'b000:out = (A <= B)&&(A <= C)?A:(B <= A)&&(B <= C)?B:C;
	3'b001:out = (A <= B)?A:B;
	3'b010:out = (A <= C)?A:C;
	3'b011:out = A;
	3'b100:out = (B <= C)?B:C;
	3'b101:out = B;
	3'b110:out = C;
	3'b111:out = 5'b11111;
	default:;
	endcase

endmodule
