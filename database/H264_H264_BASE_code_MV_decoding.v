`include "timescale.v"
`include "define.v"

module MV_decoding(
input clk,reset_n,
input skip_mv_calc,Is_skipMB_mv_calc,
input direct_spatial_mv_pred_flag,
input [2:0] slice_type,
input [2:0] mb_pred_state,sub_mb_pred_state,
input [3:0] slice_data_state,
input [7:0] mb_num_h,mb_num_v,
input [3:0] mb_type_general,
input [1:0] sub_mb_type,
input [1:0] mbPartIdx,subMbPartIdx,
input [7:0] pic_width_in_mbs_minus1,pic_height_in_map_units_minus1,
input compIdx,p_skip_end,
input [10:0] mvd,
input [1:0] MBTypeGen_mbAddrA,MBTypeGen_mbAddrB,MBTypeGen_mbAddrC,
input MBTypeGen_mbAddrD,
input [2:0] B_MbPartPredMode_0,B_MbPartPredMode_1,
input [1:0] SubMbPredMode,
input mv_mbAddrB_rd_for_DF,

input [4:0] refIdxL0,refIdxL1,refIdxL0A,refIdxL0B,refIdxL1A,refIdxL1B,refIdxL0C,refIdxL1C,
input predFlagL0,predFlagL0_A,predFlagL0_B,predFlagL0_C,predFlagL0_D,
input predFlagL1,predFlagL1_A,predFlagL1_B,predFlagL1_C,predFlagL1_D,

input [43:0] mvxL0_mbAddrB_dout,mvxL0_mbAddrC_dout,mvxL0_mbAddrD_dout,
input [43:0] mvyL0_mbAddrB_dout,mvyL0_mbAddrC_dout,mvyL0_mbAddrD_dout,
input [43:0] mvxL1_mbAddrB_dout,mvxL1_mbAddrC_dout,mvxL1_mbAddrD_dout,
input [43:0] mvyL1_mbAddrB_dout,mvyL1_mbAddrC_dout,mvyL1_mbAddrD_dout,

input [5:0]  refidx_col,
input [10:0] mvx_col,mvy_col,
input [1:0] td,tb,
output reg mv_is16x16,
output reg [43:0] mvxL0_mbAddrB_din,
output reg [7:0] mvxL0_mbAddrB_wr_addr,mvxL0_mbAddrB_rd_addr,mvxL0_mbAddrC_rd_addr,mvxL0_mbAddrD_rd_addr,
output reg mvxL0_mbAddrB_wr_n,

output reg [43:0] mvyL0_mbAddrB_din,
output reg [7:0] mvyL0_mbAddrB_wr_addr,mvyL0_mbAddrB_rd_addr,mvyL0_mbAddrC_rd_addr,mvyL0_mbAddrD_rd_addr,
output reg mvyL0_mbAddrB_wr_n,

output reg [43:0] mvxL1_mbAddrB_din,
output reg [7:0] mvxL1_mbAddrB_wr_addr,mvxL1_mbAddrB_rd_addr,mvxL1_mbAddrC_rd_addr,mvxL1_mbAddrD_rd_addr,
output reg mvxL1_mbAddrB_wr_n,

output reg [43:0] mvyL1_mbAddrB_din,
output reg [7:0] mvyL1_mbAddrB_wr_addr,mvyL1_mbAddrB_rd_addr,mvyL1_mbAddrC_rd_addr,mvyL1_mbAddrD_rd_addr,
output reg mvyL1_mbAddrB_wr_n,

output reg [43:0] mvxL0_mbAddrA,mvyL0_mbAddrA,mvxL1_mbAddrA,mvyL1_mbAddrA,

output reg [43:0] mvxL0_CurrMb0,mvxL0_CurrMb1,mvxL0_CurrMb2,mvxL0_CurrMb3,
output reg [43:0] mvyL0_CurrMb0,mvyL0_CurrMb1,mvyL0_CurrMb2,mvyL0_CurrMb3,
output reg [43:0] mvxL1_CurrMb0,mvxL1_CurrMb1,mvxL1_CurrMb2,mvxL1_CurrMb3,
output reg [43:0] mvyL1_CurrMb0,mvyL1_CurrMb1,mvyL1_CurrMb2,mvyL1_CurrMb3
);


wire refIdxL0_equal_A,refIdxL0_equal_B,refIdxL0_equal_C;
assign refIdxL0_equal_A = refIdxL0 == refIdxL0A;
assign refIdxL0_equal_B = refIdxL0 == refIdxL0B;
assign refIdxL0_equal_C = refIdxL0 == refIdxL0C;

wire refIdxL1_equal_A,refIdxL1_equal_B,refIdxL1_equal_C;
assign refIdxL1_equal_A = refIdxL1 == refIdxL1A;
assign refIdxL1_equal_B = refIdxL1 == refIdxL1B;
assign refIdxL1_equal_C = refIdxL1 == refIdxL1C;

reg [10:0] mvpAx_L0,mvpBx_L0,mvpCx_L0,mvpx_L0_median;
reg [10:0] mvpAy_L0,mvpBy_L0,mvpCy_L0,mvpy_L0_median;

reg [10:0] mvpx_L0,mvpy_L0;


wire [11:0] sub_ABx_L0,sub_ACx_L0,sub_BCx_L0,sub_ABy_L0,sub_ACy_L0,sub_BCy_L0;
wire flag_ABx_L0,flag_ACx_L0,flag_BCx_L0,flag_ABy_L0,flag_ACy_L0,flag_BCy_L0;
 
assign sub_ABx_L0 = {mvpAx_L0[10],mvpAx_L0[10:0]} - {mvpBx_L0[10],mvpBx_L0[10:0]};
assign sub_ACx_L0 = {mvpAx_L0[10],mvpAx_L0[10:0]} - {mvpCx_L0[10],mvpCx_L0[10:0]};
assign sub_BCx_L0 = {mvpBx_L0[10],mvpBx_L0[10:0]} - {mvpCx_L0[10],mvpCx_L0[10:0]};
assign flag_ABx_L0 = sub_ABx_L0[11];
assign flag_ACx_L0 = sub_ACx_L0[11];
assign flag_BCx_L0 = sub_BCx_L0[11];


always @ (flag_ABx_L0 or flag_ACx_L0 or flag_BCx_L0 or mvpAx_L0 or mvpBx_L0 or mvpCx_L0)
	if (((flag_ABx_L0 == 1'b1) && (flag_ACx_L0 == 1'b0)) || ((flag_ABx_L0 == 1'b0) && (flag_ACx_L0 == 1'b1))) 
		mvpx_L0_median = mvpAx_L0;
	else if (((flag_ABx_L0 == 1'b0) && (flag_BCx_L0 == 1'b0)) || ((flag_ABx_L0 == 1'b1) && (flag_BCx_L0 == 1'b1))) 
		mvpx_L0_median = mvpBx_L0;
	else 
		mvpx_L0_median = mvpCx_L0;

 
assign sub_ABy_L0 = {mvpAy_L0[10],mvpAy_L0[10:0]} - {mvpBy_L0[10],mvpBy_L0[10:0]};
assign sub_ACy_L0 = {mvpAy_L0[10],mvpAy_L0[10:0]} - {mvpCy_L0[10],mvpCy_L0[10:0]};
assign sub_BCy_L0 = {mvpBy_L0[10],mvpBy_L0[10:0]} - {mvpCy_L0[10],mvpCy_L0[10:0]};
assign flag_ABy_L0 = sub_ABy_L0[11];
assign flag_ACy_L0 = sub_ACy_L0[11];
assign flag_BCy_L0 = sub_BCy_L0[11];

always @ (flag_ABy_L0 or flag_ACy_L0 or flag_BCy_L0 or mvpAy_L0 or mvpBy_L0 or mvpCy_L0)
	if (((flag_ABy_L0 == 1'b1) && (flag_ACy_L0 == 1'b0)) || ((flag_ABy_L0 == 1'b0) && (flag_ACy_L0 == 1'b1))) 
		mvpy_L0_median = mvpAy_L0;
	else if (((flag_ABy_L0 == 1'b0) && (flag_BCy_L0 == 1'b0)) || ((flag_ABy_L0 == 1'b1) && (flag_BCy_L0 == 1'b1))) 
		mvpy_L0_median = mvpBy_L0;
	else 
		mvpy_L0_median = mvpCy_L0;



always@(refIdxL0_equal_A or refIdxL0_equal_B or refIdxL0_equal_C or mvpAx_L0 or mvpBx_L0 or mvpCx_L0 or mvpx_L0_median)
	case({refIdxL0_equal_A,refIdxL0_equal_B,refIdxL0_equal_C})
		3'b100: mvpx_L0 = mvpAx_L0;
		3'b010: mvpx_L0 = mvpBx_L0;
		3'b001: mvpx_L0 = mvpCx_L0;
		default:mvpx_L0 = mvpx_L0_median;
	endcase
	
always@(refIdxL0_equal_A or refIdxL0_equal_B or refIdxL0_equal_C or mvpAy_L0 or mvpBy_L0 or mvpCy_L0 or mvpy_L0_median)
	case({refIdxL0_equal_A,refIdxL0_equal_B,refIdxL0_equal_C})
		3'b100: mvpy_L0 = mvpAy_L0;
		3'b010: mvpy_L0 = mvpBy_L0;
		3'b001: mvpy_L0 = mvpCy_L0;
		default:mvpy_L0 = mvpy_L0_median;
	endcase	



reg [10:0] mvx_L0,mvy_L0;

wire p_skip_0;
assign p_skip_0 = mb_num_h == 0 || mb_num_v == 0 || (refIdxL0A == 0 && mvpAx_L0 == 0 && mvpAy_L0 == 0) ||
		(refIdxL0B == 0 && mvpBx_L0 == 0 && mvpBy_L0 == 0);

wire colZeroFlag;
assign colZeroFlag = refidx_col == 0 && (mvx_col[9:0] < 10'd2) && (mvy_col[9:0] < 10'd2);



always @ (Is_skipMB_mv_calc or mb_num_h or mb_num_v or mb_pred_state or sub_mb_pred_state or compIdx or mbPartIdx or p_skip_0
		or mvpx_L0 or mvpy_L0 or mvd or mvpAx_L0 or mvpBx_L0 or mvpCx_L0 or mvpAy_L0 or mvpBy_L0 or mvpCy_L0
		or mb_type_general  or slice_type or refIdxL0_equal_C or refIdxL0_equal_B or refIdxL0_equal_A or predFlagL0
		or colZeroFlag or direct_spatial_mv_pred_flag or mvx_col or mvy_col or td)
	if (Is_skipMB_mv_calc && slice_type == `slice_type_p)begin
		mvx_L0 = p_skip_0?0:mvpx_L0;	mvy_L0 = p_skip_0?0:mvpy_L0;	end
	else if((Is_skipMB_mv_calc || (mb_pred_state == `mvd_l0_s && B_MbPartPredMode_0 == `B_Direct) ||
		(sub_mb_pred_state == `sub_mvd_l0_s && sub_mb_type == 0 && SubMbPredMode == `B_sub_Direct))&& slice_type == `slice_type_b)begin
		if(direct_spatial_mv_pred_flag)begin
			mvx_L0 = colZeroFlag ? 0 : (refIdxL0[4] == 0 ? mvpx_L0:0);
			mvy_L0 = colZeroFlag ? 0 : (refIdxL0[4] == 0 ? mvpy_L0:0);end
		else begin mvx_L0 = td == 0?mvx_col:{mvx_col[10],mvx_col[10:1]};
			   mvy_L0 = td == 0?mvy_col:{mvy_col[10],mvy_col[10:1]};end
		end
	else if (mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s)begin
		if(predFlagL0 == 0)begin
			mvx_L0 = 0;	mvy_L0 = 0;	end
		else if (mb_type_general == `MB_Inter16x8)		//16x8
			case (mbPartIdx)
			2'b00:	if (refIdxL0_equal_B)begin
					mvx_L0 = (compIdx == 0)? (mvpBx_L0 + mvd):0;
					mvy_L0 = (compIdx == 1)? (mvpBy_L0 + mvd):0;end
				else begin
					mvx_L0 = (compIdx == 0)? (mvpx_L0 + mvd):0;
					mvy_L0 = (compIdx == 1)? (mvpy_L0 + mvd):0;end
			default:if (refIdxL0_equal_A)begin
					mvx_L0 = (compIdx == 0)? (mvpAx_L0 + mvd):0;
					mvy_L0 = (compIdx == 1)? (mvpAy_L0 + mvd):0;end
				else begin
					mvx_L0 = (compIdx == 0)? (mvpx_L0 + mvd):0;
					mvy_L0 = (compIdx == 1)? (mvpy_L0 + mvd):0;end
				endcase
		else if (mb_type_general == `MB_Inter8x16)	//8x16
			case (mbPartIdx)
			2'b00:	if (refIdxL0_equal_A)begin
					mvx_L0 = (compIdx == 0)? (mvpAx_L0 + mvd):0;
					mvy_L0 = (compIdx == 1)? (mvpAy_L0 + mvd):0;end
				else begin
					mvx_L0 = (compIdx == 0)? (mvpx_L0 + mvd):0;
					mvy_L0 = (compIdx == 1)? (mvpy_L0 + mvd):0;end
			default:if (refIdxL0_equal_C) begin													
					mvx_L0 = (compIdx == 0)? (mvpCx_L0 + mvd):0;				 
					mvy_L0 = (compIdx == 1)? (mvpCy_L0 + mvd):0;end
				else begin
					mvx_L0 = (compIdx == 0)? (mvpx_L0 + mvd):0;
					mvy_L0 = (compIdx == 1)? (mvpy_L0 + mvd):0;end
			endcase
		else begin
				mvx_L0 = (compIdx == 0)? (mvpx_L0 + mvd):0;
				mvy_L0 = (compIdx == 1)? (mvpy_L0 + mvd):0;end
		end		
	else begin mvx_L0 = 0;	mvy_L0 = 0;end


always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		mvxL0_CurrMb0 <= 0; mvxL0_CurrMb1 <= 0; mvxL0_CurrMb2 <= 0; mvxL0_CurrMb3 <= 0;end
	else if (Is_skipMB_mv_calc)
		mvxL0_CurrMb0[10:0] <= mvx_L0;
	else if((mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s) && compIdx == 0)
		case(mb_type_general)
		`MB_Inter16x16:
			mvxL0_CurrMb0[10:0] <= mvx_L0;
		`MB_Inter16x8:
			case(mbPartIdx)
			0:begin mvxL0_CurrMb0 <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};	mvxL0_CurrMb1 <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};	end
			1:begin mvxL0_CurrMb2 <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};	mvxL0_CurrMb3 <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};	end
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:begin mvxL0_CurrMb0 <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};	mvxL0_CurrMb2 <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};	end
			1:begin mvxL0_CurrMb1 <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};	mvxL0_CurrMb3 <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};	end
			default:;
			endcase
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			case (mbPartIdx)
			0:
				case (sub_mb_type)
				0:mvxL0_CurrMb0 <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvxL0_CurrMb0[10:0]  <= mvx_L0; mvxL0_CurrMb0[21:11] <= mvx_L0;	end
					1:begin	mvxL0_CurrMb0[32:22] <= mvx_L0;	mvxL0_CurrMb0[43:33] <= mvx_L0;	end
					default:;
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvxL0_CurrMb0[10:0]  <= mvx_L0;	mvxL0_CurrMb0[32:22] <= mvx_L0;	end
					1:begin	mvxL0_CurrMb0[21:11] <= mvx_L0;	mvxL0_CurrMb0[43:33] <= mvx_L0;	end
					default:;
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvxL0_CurrMb0[10:0]  <= mvx_L0;
					1:mvxL0_CurrMb0[21:11] <= mvx_L0;
					2:mvxL0_CurrMb0[32:22] <= mvx_L0;
					3:mvxL0_CurrMb0[43:33] <= mvx_L0; 
					endcase
				endcase
			1:
				case (sub_mb_type)
				0:mvxL0_CurrMb1 <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvxL0_CurrMb1[10:0]  <= mvx_L0;	mvxL0_CurrMb1[21:11] <= mvx_L0;	end
					1:begin	mvxL0_CurrMb1[32:22] <= mvx_L0;	mvxL0_CurrMb1[43:33] <= mvx_L0;	end
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvxL0_CurrMb1[10:0]  <= mvx_L0;	mvxL0_CurrMb1[32:22] <= mvx_L0;	end
					1:begin	mvxL0_CurrMb1[21:11] <= mvx_L0;	mvxL0_CurrMb1[43:33] <= mvx_L0;	end
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvxL0_CurrMb1[10:0]   <= mvx_L0;
					1:mvxL0_CurrMb1[21:11]  <= mvx_L0;
					2:mvxL0_CurrMb1[32:22] <= mvx_L0;
					3:mvxL0_CurrMb1[43:33] <= mvx_L0; 
					endcase
				endcase
			2:
				case (sub_mb_type)
				0:mvxL0_CurrMb2 <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvxL0_CurrMb2[10:0]  <= mvx_L0; mvxL0_CurrMb2[21:11] <= mvx_L0;	end
					1:begin	mvxL0_CurrMb2[32:22] <= mvx_L0;	mvxL0_CurrMb2[43:33] <= mvx_L0;	end
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvxL0_CurrMb2[10:0]  <= mvx_L0;	mvxL0_CurrMb2[32:22] <= mvx_L0;	end
					1:begin	mvxL0_CurrMb2[21:11] <= mvx_L0;	mvxL0_CurrMb2[43:33] <= mvx_L0;	end
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvxL0_CurrMb2[10:0]  <= mvx_L0;
					1:mvxL0_CurrMb2[21:11] <= mvx_L0;
					2:mvxL0_CurrMb2[32:22] <= mvx_L0;
					3:mvxL0_CurrMb2[43:33] <= mvx_L0; 
					endcase
				endcase
			3:
				case (sub_mb_type)
				0:mvxL0_CurrMb3 <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvxL0_CurrMb3[10:0]  <= mvx_L0;	mvxL0_CurrMb3[21:11] <= mvx_L0;	end
					1:begin	mvxL0_CurrMb3[32:22] <= mvx_L0;	mvxL0_CurrMb3[43:33] <= mvx_L0;	end
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvxL0_CurrMb3[10:0]  <= mvx_L0;	mvxL0_CurrMb3[32:22] <= mvx_L0;	end
					1:begin	mvxL0_CurrMb3[21:11] <= mvx_L0;	mvxL0_CurrMb3[43:33] <= mvx_L0;	end
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvxL0_CurrMb3[10:0]  <= mvx_L0;
					1:mvxL0_CurrMb3[21:11] <= mvx_L0;
					2:mvxL0_CurrMb3[32:22] <= mvx_L0;
					3:mvxL0_CurrMb3[43:33] <= mvx_L0; 
					endcase
				endcase
			endcase	
		default:;endcase

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		mvyL0_CurrMb0 <= 0; mvyL0_CurrMb1 <= 0; mvyL0_CurrMb2 <= 0; mvyL0_CurrMb3 <= 0;end
	else if (Is_skipMB_mv_calc)
		mvyL0_CurrMb0[10:0] <= mvy_L0;
	else if((mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s) && compIdx == 1)
		case(mb_type_general)
		`MB_Inter16x16:
			mvyL0_CurrMb0[10:0] <= mvy_L0;
		`MB_Inter16x8:
			case(mbPartIdx)
			0:begin mvyL0_CurrMb0 <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};	mvyL0_CurrMb1 <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};	end
			1:begin mvyL0_CurrMb2 <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};	mvyL0_CurrMb3 <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};	end
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:begin mvyL0_CurrMb0 <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};	mvyL0_CurrMb2 <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};	end
			1:begin mvyL0_CurrMb1 <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};	mvyL0_CurrMb3 <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};	end
			default:;
			endcase
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			case (mbPartIdx)
			0:
				case (sub_mb_type)
				0:mvyL0_CurrMb0 <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvyL0_CurrMb0[10:0]  <= mvy_L0; mvyL0_CurrMb0[21:11] <= mvy_L0;	end
					1:begin	mvyL0_CurrMb0[32:22] <= mvy_L0;	mvyL0_CurrMb0[43:33] <= mvy_L0;	end
					default:;
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvyL0_CurrMb0[10:0]  <= mvy_L0;	mvyL0_CurrMb0[32:22] <= mvy_L0;	end
					1:begin	mvyL0_CurrMb0[21:11] <= mvy_L0;	mvyL0_CurrMb0[43:33] <= mvy_L0;	end
					default:;
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvyL0_CurrMb0[10:0]  <= mvy_L0;
					1:mvyL0_CurrMb0[21:11] <= mvy_L0;
					2:mvyL0_CurrMb0[32:22] <= mvy_L0;
					3:mvyL0_CurrMb0[43:33] <= mvy_L0; 
					endcase
				endcase
			1:
				case (sub_mb_type)
				0:mvyL0_CurrMb1 <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvyL0_CurrMb1[10:0]  <= mvy_L0;	mvyL0_CurrMb1[21:11] <= mvy_L0;	end
					1:begin	mvyL0_CurrMb1[32:22] <= mvy_L0;	mvyL0_CurrMb1[43:33] <= mvy_L0;	end
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvyL0_CurrMb1[10:0]  <= mvy_L0;	mvyL0_CurrMb1[32:22] <= mvy_L0;	end
					1:begin	mvyL0_CurrMb1[21:11] <= mvy_L0;	mvyL0_CurrMb1[43:33] <= mvy_L0;	end
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvyL0_CurrMb1[10:0]   <= mvy_L0;
					1:mvyL0_CurrMb1[21:11]  <= mvy_L0;
					2:mvyL0_CurrMb1[32:22] <= mvy_L0;
					3:mvyL0_CurrMb1[43:33] <= mvy_L0; 
					endcase
				endcase
			2:
				case (sub_mb_type)
				0:mvyL0_CurrMb2 <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvyL0_CurrMb2[10:0]  <= mvy_L0; mvyL0_CurrMb2[21:11] <= mvy_L0;	end
					1:begin	mvyL0_CurrMb2[32:22] <= mvy_L0;	mvyL0_CurrMb2[43:33] <= mvy_L0;	end
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvyL0_CurrMb2[10:0]  <= mvy_L0;	mvyL0_CurrMb2[32:22] <= mvy_L0;	end
					1:begin	mvyL0_CurrMb2[21:11] <= mvy_L0;	mvyL0_CurrMb2[43:33] <= mvy_L0;	end
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvyL0_CurrMb2[10:0]  <= mvy_L0;
					1:mvyL0_CurrMb2[21:11] <= mvy_L0;
					2:mvyL0_CurrMb2[32:22] <= mvy_L0;
					3:mvyL0_CurrMb2[43:33] <= mvy_L0; 
					endcase
				endcase
			3:
				case (sub_mb_type)
				0:mvyL0_CurrMb3 <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvyL0_CurrMb3[10:0]  <= mvy_L0;	mvyL0_CurrMb3[21:11] <= mvy_L0;	end
					1:begin	mvyL0_CurrMb3[32:22] <= mvy_L0;	mvyL0_CurrMb3[43:33] <= mvy_L0;	end
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvyL0_CurrMb3[10:0]  <= mvy_L0;	mvyL0_CurrMb3[32:22] <= mvy_L0;	end
					1:begin	mvyL0_CurrMb3[21:11] <= mvy_L0;	mvyL0_CurrMb3[43:33] <= mvy_L0;	end
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvyL0_CurrMb3[10:0]  <= mvy_L0;
					1:mvyL0_CurrMb3[21:11] <= mvy_L0;
					2:mvyL0_CurrMb3[32:22] <= mvy_L0;
					3:mvyL0_CurrMb3[43:33] <= mvy_L0; 
					endcase
				endcase
			endcase	
		default:;endcase

//L1
reg [10:0] mvpAx_L1,mvpBx_L1,mvpCx_L1,mvpx_L1_median;
reg [10:0] mvpAy_L1,mvpBy_L1,mvpCy_L1,mvpy_L1_median;

reg [10:0] mvpx_L1,mvpy_L1;


wire [11:0] sub_ABx_L1,sub_ACx_L1,sub_BCx_L1,sub_ABy_L1,sub_ACy_L1,sub_BCy_L1;
wire flag_ABx_L1,flag_ACx_L1,flag_BCx_L1,flag_ABy_L1,flag_ACy_L1,flag_BCy_L1;
 
assign sub_ABx_L1 = {mvpAx_L1[10],mvpAx_L1[10:0]} - {mvpBx_L1[10],mvpBx_L1[10:0]};
assign sub_ACx_L1 = {mvpAx_L1[10],mvpAx_L1[10:0]} - {mvpCx_L1[10],mvpCx_L1[10:0]};
assign sub_BCx_L1 = {mvpBx_L1[10],mvpBx_L1[10:0]} - {mvpCx_L1[10],mvpCx_L1[10:0]};
assign flag_ABx_L1 = sub_ABx_L1[11];
assign flag_ACx_L1 = sub_ACx_L1[11];
assign flag_BCx_L1 = sub_BCx_L1[11];


always @ (flag_ABx_L1 or flag_ACx_L1 or flag_BCx_L1 or mvpAx_L1 or mvpBx_L1 or mvpCx_L1)
	if (((flag_ABx_L1 == 1'b1) && (flag_ACx_L1 == 1'b0)) || ((flag_ABx_L1 == 1'b0) && (flag_ACx_L1 == 1'b1))) 
		mvpx_L1_median = mvpAx_L1;
	else if (((flag_ABx_L1 == 1'b0) && (flag_BCx_L1 == 1'b0)) || ((flag_ABx_L1 == 1'b1) && (flag_BCx_L1 == 1'b1))) 
		mvpx_L1_median = mvpBx_L1;
	else 
		mvpx_L1_median = mvpCx_L1;

 
assign sub_ABy_L1 = {mvpAy_L1[10],mvpAy_L1[10:0]} - {mvpBy_L1[10],mvpBy_L1[10:0]};
assign sub_ACy_L1 = {mvpAy_L1[10],mvpAy_L1[10:0]} - {mvpCy_L1[10],mvpCy_L1[10:0]};
assign sub_BCy_L1 = {mvpBy_L1[10],mvpBy_L1[10:0]} - {mvpCy_L1[10],mvpCy_L1[10:0]};
assign flag_ABy_L1 = sub_ABy_L1[11];
assign flag_ACy_L1 = sub_ACy_L1[11];
assign flag_BCy_L1 = sub_BCy_L1[11];

always @ (flag_ABy_L1 or flag_ACy_L1 or flag_BCy_L1 or mvpAy_L1 or mvpBy_L1 or mvpCy_L1)
	if (((flag_ABy_L1 == 1'b1) && (flag_ACy_L1 == 1'b0)) || ((flag_ABy_L1 == 1'b0) && (flag_ACy_L1 == 1'b1))) 
		mvpy_L1_median = mvpAy_L1;
	else if (((flag_ABy_L1 == 1'b0) && (flag_BCy_L1 == 1'b0)) || ((flag_ABy_L1 == 1'b1) && (flag_BCy_L1 == 1'b1))) 
		mvpy_L1_median = mvpBy_L1;
	else 
		mvpy_L1_median = mvpCy_L1;



always@(refIdxL1_equal_A or refIdxL1_equal_B or refIdxL1_equal_C or mvpAx_L1 or mvpBx_L1 or mvpCx_L1 or mvpx_L1_median)
	case({refIdxL1_equal_A,refIdxL1_equal_B,refIdxL1_equal_C})
		3'b100: mvpx_L1 = mvpAx_L1;
		3'b010: mvpx_L1 = mvpBx_L1;
		3'b001: mvpx_L1 = mvpCx_L1;
		default:mvpx_L1 = mvpx_L1_median;
	endcase
	
always@(refIdxL1_equal_A or refIdxL1_equal_B or refIdxL1_equal_C or mvpAy_L1 or mvpBy_L1 or mvpCy_L1 or mvpy_L1_median)
	case({refIdxL1_equal_A,refIdxL1_equal_B,refIdxL1_equal_C})
		3'b100: mvpy_L1 = mvpAy_L1;
		3'b010: mvpy_L1 = mvpBy_L1;
		3'b001: mvpy_L1 = mvpCy_L1;
		default:mvpy_L1 = mvpy_L1_median;
	endcase	


//mcpcx bao kuo D de qing kuang
reg [10:0] mvx_L1,mvy_L1;

always @ (Is_skipMB_mv_calc or mb_num_h or mb_num_v or mb_pred_state or sub_mb_pred_state or compIdx or mb_type_general or mbPartIdx
	 or mvpx_L1 or mvpy_L1 or mvpAx_L1 or mvpBx_L1 or mvpCx_L1 or mvpAy_L1 or mvpBy_L1 or mvpCy_L1 or direct_spatial_mv_pred_flag
	 or mvd or refIdxL1_equal_B or refIdxL1_equal_A or refIdxL1_equal_C or slice_type or predFlagL1 or colZeroFlag or td)
	if (Is_skipMB_mv_calc && slice_type == `slice_type_p)begin
		mvx_L1 = mvpx_L1;	mvy_L1 = mvpy_L1;	end
	else if((Is_skipMB_mv_calc || (mb_pred_state == `mvd_l1_s && B_MbPartPredMode_0 == `B_Direct) ||
		(sub_mb_pred_state == `sub_mvd_l1_s && sub_mb_type == 0 && SubMbPredMode == `B_sub_Direct))&& slice_type == `slice_type_b)begin
		if(direct_spatial_mv_pred_flag)begin
			mvx_L1 = colZeroFlag ? 0 : (refIdxL1[4] == 0 ? mvpx_L1:0);
			mvy_L1 = colZeroFlag ? 0 : (refIdxL1[4] == 0 ? mvpy_L1:0);end
		else begin mvx_L1 = td == 0?0:{mvx_col[10],mvx_col[10:1]};
			   mvy_L1 = td == 0?0:{mvy_col[10],mvy_col[10:1]};end
		end
	else if (mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)begin
		if(predFlagL1 == 0)begin
			mvx_L1 = 0;	mvy_L1 = 0;	end
		else if (mb_type_general == `MB_Inter16x8)		//16x8
			case (mbPartIdx)
			2'b00:	if (refIdxL1_equal_B)begin
					mvx_L1 = (compIdx == 0)? (mvpBx_L1 + mvd):0;
					mvy_L1 = (compIdx == 1)? (mvpBy_L1 + mvd):0;end
				else begin
					mvx_L1 = (compIdx == 0)? (mvpx_L1 + mvd):0;
					mvy_L1 = (compIdx == 1)? (mvpy_L1 + mvd):0;end
			default:if (refIdxL1_equal_A)begin
					mvx_L1 = (compIdx == 0)? (mvpAx_L1 + mvd):0;
					mvy_L1 = (compIdx == 1)? (mvpAy_L1 + mvd):0;end
				else begin
					mvx_L1 = (compIdx == 0)? (mvpx_L1 + mvd):0;
					mvy_L1 = (compIdx == 1)? (mvpy_L1 + mvd):0;end
				endcase
		else if (mb_type_general == `MB_Inter8x16)	//8x16
			case (mbPartIdx)
			2'b00:	if (refIdxL1_equal_A)begin
					mvx_L1 = (compIdx == 0)? (mvpAx_L1 + mvd):0;
					mvy_L1 = (compIdx == 1)? (mvpAy_L1 + mvd):0;end
				else begin
					mvx_L1 = (compIdx == 0)? (mvpx_L1 + mvd):0;
					mvy_L1 = (compIdx == 1)? (mvpy_L1 + mvd):0;end
			default:if (refIdxL1_equal_C) begin													
					mvx_L1 = (compIdx == 0)? (mvpCx_L1 + mvd):0;				 
					mvy_L1 = (compIdx == 1)? (mvpCy_L1 + mvd):0;end
				else begin
					mvx_L1 = (compIdx == 0)? (mvpx_L1 + mvd):0;
					mvy_L1 = (compIdx == 1)? (mvpy_L1 + mvd):0;end
			endcase
		else begin
				mvx_L1 = (compIdx == 0)? (mvpx_L1 + mvd):0;
				mvy_L1 = (compIdx == 1)? (mvpy_L1 + mvd):0;end
		end		
	else begin mvx_L1 = 0;	mvy_L1 = 0;end


always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		mvxL1_CurrMb0 <= 0; mvxL1_CurrMb1 <= 0; mvxL1_CurrMb2 <= 0; mvxL1_CurrMb3 <= 0;end
	else if (Is_skipMB_mv_calc)
		mvxL1_CurrMb0[10:0] <= mvx_L1;
	else if((mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s) && compIdx == 0)
		case(mb_type_general)
		`MB_Inter16x16:
			mvxL1_CurrMb0[10:0] <= mvx_L1;
		`MB_Inter16x8:
			case(mbPartIdx)
			0:begin mvxL1_CurrMb0 <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};	mvxL1_CurrMb1 <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};	end
			1:begin mvxL1_CurrMb2 <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};	mvxL1_CurrMb3 <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};	end
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:begin mvxL1_CurrMb0 <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};	mvxL1_CurrMb2 <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};	end
			1:begin mvxL1_CurrMb1 <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};	mvxL1_CurrMb3 <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};	end
			default:;
			endcase
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			case (mbPartIdx)
			0:
				case (sub_mb_type)
				0:mvxL1_CurrMb0 <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvxL1_CurrMb0[10:0]  <= mvx_L1; mvxL1_CurrMb0[21:11] <= mvx_L1;	end
					1:begin	mvxL1_CurrMb0[32:22] <= mvx_L1;	mvxL1_CurrMb0[43:33] <= mvx_L1;	end
					default:;
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvxL1_CurrMb0[10:0]  <= mvx_L1;	mvxL1_CurrMb0[32:22] <= mvx_L1;	end
					1:begin	mvxL1_CurrMb0[21:11] <= mvx_L1;	mvxL1_CurrMb0[43:33] <= mvx_L1;	end
					default:;
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvxL1_CurrMb0[10:0]  <= mvx_L1;
					1:mvxL1_CurrMb0[21:11] <= mvx_L1;
					2:mvxL1_CurrMb0[32:22] <= mvx_L1;
					3:mvxL1_CurrMb0[43:33] <= mvx_L1; 
					endcase
				endcase
			1:
				case (sub_mb_type)
				0:mvxL1_CurrMb1 <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvxL1_CurrMb1[10:0]  <= mvx_L1;	mvxL1_CurrMb1[21:11] <= mvx_L1;	end
					1:begin	mvxL1_CurrMb1[32:22] <= mvx_L1;	mvxL1_CurrMb1[43:33] <= mvx_L1;	end
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvxL1_CurrMb1[10:0]  <= mvx_L1;	mvxL1_CurrMb1[32:22] <= mvx_L1;	end
					1:begin	mvxL1_CurrMb1[21:11] <= mvx_L1;	mvxL1_CurrMb1[43:33] <= mvx_L1;	end
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvxL1_CurrMb1[10:0]   <= mvx_L1;
					1:mvxL1_CurrMb1[21:11]  <= mvx_L1;
					2:mvxL1_CurrMb1[32:22] <= mvx_L1;
					3:mvxL1_CurrMb1[43:33] <= mvx_L1; 
					endcase
				endcase
			2:
				case (sub_mb_type)
				0:mvxL1_CurrMb2 <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvxL1_CurrMb2[10:0]  <= mvx_L1; mvxL1_CurrMb2[21:11] <= mvx_L1;	end
					1:begin	mvxL1_CurrMb2[32:22] <= mvx_L1;	mvxL1_CurrMb2[43:33] <= mvx_L1;	end
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvxL1_CurrMb2[10:0]  <= mvx_L1;	mvxL1_CurrMb2[32:22] <= mvx_L1;	end
					1:begin	mvxL1_CurrMb2[21:11] <= mvx_L1;	mvxL1_CurrMb2[43:33] <= mvx_L1;	end
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvxL1_CurrMb2[10:0]  <= mvx_L1;
					1:mvxL1_CurrMb2[21:11] <= mvx_L1;
					2:mvxL1_CurrMb2[32:22] <= mvx_L1;
					3:mvxL1_CurrMb2[43:33] <= mvx_L1; 
					endcase
				endcase
			3:
				case (sub_mb_type)
				0:mvxL1_CurrMb3 <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvxL1_CurrMb3[10:0]  <= mvx_L1;	mvxL1_CurrMb3[21:11] <= mvx_L1;	end
					1:begin	mvxL1_CurrMb3[32:22] <= mvx_L1;	mvxL1_CurrMb3[43:33] <= mvx_L1;	end
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvxL1_CurrMb3[10:0]  <= mvx_L1;	mvxL1_CurrMb3[32:22] <= mvx_L1;	end
					1:begin	mvxL1_CurrMb3[21:11] <= mvx_L1;	mvxL1_CurrMb3[43:33] <= mvx_L1;	end
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvxL1_CurrMb3[10:0]  <= mvx_L1;
					1:mvxL1_CurrMb3[21:11] <= mvx_L1;
					2:mvxL1_CurrMb3[32:22] <= mvx_L1;
					3:mvxL1_CurrMb3[43:33] <= mvx_L1; 
					endcase
				endcase
			endcase	
		default:;endcase

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		mvyL1_CurrMb0 <= 0; mvyL1_CurrMb1 <= 0; mvyL1_CurrMb2 <= 0; mvyL1_CurrMb3 <= 0;end
	else if (Is_skipMB_mv_calc)
 		mvyL1_CurrMb0[10:0] <= mvy_L1;
	else if((mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s) && compIdx == 1)
		case(mb_type_general)
		`MB_Inter16x16:
			mvyL1_CurrMb0[10:0] <= mvy_L1;
		`MB_Inter16x8:
			case(mbPartIdx)
			0:begin mvyL1_CurrMb0 <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};	mvyL1_CurrMb1 <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};	end
			1:begin mvyL1_CurrMb2 <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};	mvyL1_CurrMb3 <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};	end
			default:;
			endcase
		`MB_Inter8x16:
			case(mbPartIdx)
			0:begin mvyL1_CurrMb0 <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};	mvyL1_CurrMb2 <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};	end
			1:begin mvyL1_CurrMb1 <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};	mvyL1_CurrMb3 <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};	end
			default:;
			endcase
		`MB_B_8x8:
			case (mbPartIdx)
			0:
				case (sub_mb_type)
				0:mvyL1_CurrMb0 <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvyL1_CurrMb0[10:0]  <= mvy_L1; mvyL1_CurrMb0[21:11] <= mvy_L1;	end
					1:begin	mvyL1_CurrMb0[32:22] <= mvy_L1;	mvyL1_CurrMb0[43:33] <= mvy_L1;	end
					default:;
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvyL1_CurrMb0[10:0]  <= mvy_L1;	mvyL1_CurrMb0[32:22] <= mvy_L1;	end
					1:begin	mvyL1_CurrMb0[21:11] <= mvy_L1;	mvyL1_CurrMb0[43:33] <= mvy_L1;	end
					default:;
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvyL1_CurrMb0[10:0]  <= mvy_L1;
					1:mvyL1_CurrMb0[21:11] <= mvy_L1;
					2:mvyL1_CurrMb0[32:22] <= mvy_L1;
					3:mvyL1_CurrMb0[43:33] <= mvy_L1; 
					endcase
				endcase
			1:
				case (sub_mb_type)
				0:mvyL1_CurrMb1 <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvyL1_CurrMb1[10:0]  <= mvy_L1;	mvyL1_CurrMb1[21:11] <= mvy_L1;	end
					1:begin	mvyL1_CurrMb1[32:22] <= mvy_L1;	mvyL1_CurrMb1[43:33] <= mvy_L1;	end
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvyL1_CurrMb1[10:0]  <= mvy_L1;	mvyL1_CurrMb1[32:22] <= mvy_L1;	end
					1:begin	mvyL1_CurrMb1[21:11] <= mvy_L1;	mvyL1_CurrMb1[43:33] <= mvy_L1;	end
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvyL1_CurrMb1[10:0]   <= mvy_L1;
					1:mvyL1_CurrMb1[21:11]  <= mvy_L1;
					2:mvyL1_CurrMb1[32:22] <= mvy_L1;
					3:mvyL1_CurrMb1[43:33] <= mvy_L1; 
					endcase
				endcase
			2:
				case (sub_mb_type)
				0:mvyL1_CurrMb2 <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvyL1_CurrMb2[10:0]  <= mvy_L1; mvyL1_CurrMb2[21:11] <= mvy_L1;	end
					1:begin	mvyL1_CurrMb2[32:22] <= mvy_L1;	mvyL1_CurrMb2[43:33] <= mvy_L1;	end
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvyL1_CurrMb2[10:0]  <= mvy_L1;	mvyL1_CurrMb2[32:22] <= mvy_L1;	end
					1:begin	mvyL1_CurrMb2[21:11] <= mvy_L1;	mvyL1_CurrMb2[43:33] <= mvy_L1;	end
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvyL1_CurrMb2[10:0]  <= mvy_L1;
					1:mvyL1_CurrMb2[21:11] <= mvy_L1;
					2:mvyL1_CurrMb2[32:22] <= mvy_L1;
					3:mvyL1_CurrMb2[43:33] <= mvy_L1; 
					endcase
				endcase
			3:
				case (sub_mb_type)
				0:mvyL1_CurrMb3 <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};
				1:	//8x4
					case (subMbPartIdx)
					0:begin	mvyL1_CurrMb3[10:0]  <= mvy_L1;	mvyL1_CurrMb3[21:11] <= mvy_L1;	end
					1:begin	mvyL1_CurrMb3[32:22] <= mvy_L1;	mvyL1_CurrMb3[43:33] <= mvy_L1;	end
					endcase
				2:	//4x8
					case (subMbPartIdx)
					0:begin	mvyL1_CurrMb3[10:0]  <= mvy_L1;	mvyL1_CurrMb3[32:22] <= mvy_L1;	end
					1:begin	mvyL1_CurrMb3[21:11] <= mvy_L1;	mvyL1_CurrMb3[43:33] <= mvy_L1;	end
					endcase
				3:	//4x4
					case (subMbPartIdx)
					0:mvyL1_CurrMb3[10:0]  <= mvy_L1;
					1:mvyL1_CurrMb3[21:11] <= mvy_L1;
					2:mvyL1_CurrMb3[32:22] <= mvy_L1;
					3:mvyL1_CurrMb3[43:33] <= mvy_L1; 
					endcase
				endcase
			endcase	
		default:;endcase
//----------------------------
//addrA write
//----------------------------

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		mvxL0_mbAddrA <= 0; mvyL0_mbAddrA <= 0;end
	else if(slice_data_state == `skip_run_updat)begin
		mvxL0_mbAddrA <= {mvxL0_CurrMb0[10:0],mvxL0_CurrMb0[10:0],mvxL0_CurrMb0[10:0],mvxL0_CurrMb0[10:0]};
		mvyL0_mbAddrA <= {mvyL0_CurrMb0[10:0],mvyL0_CurrMb0[10:0],mvyL0_CurrMb0[10:0],mvyL0_CurrMb0[10:0]};end
	else if(mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s)
		case(mb_type_general)
		`MB_Inter16x16:
			if(compIdx == 0) mvxL0_mbAddrA <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};
			else		 mvyL0_mbAddrA <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};
		`MB_Inter16x8:
			if(mbPartIdx == 1)begin
				if(compIdx == 0) mvxL0_mbAddrA <= {mvx_L0,mvx_L0,mvxL0_CurrMb0[10:0],mvxL0_CurrMb0[10:0]};
				else		 mvyL0_mbAddrA <= {mvy_L0,mvy_L0,mvyL0_CurrMb0[10:0],mvyL0_CurrMb0[10:0]};end		
		`MB_Inter8x16:
			if(mbPartIdx == 1)begin
				if(compIdx == 0) mvxL0_mbAddrA <= {mvx_L0,mvx_L0,mvx_L0,mvx_L0};
				else 		 mvyL0_mbAddrA <= {mvy_L0,mvy_L0,mvy_L0,mvy_L0};end		            
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			if(compIdx == 0)
				case (mbPartIdx)
				1:	case (sub_mb_type)
					0:begin	mvxL0_mbAddrA[21:11] <= mvx_L0;	mvxL0_mbAddrA[10:0] <= mvx_L0;	end
					1:if (subMbPartIdx == 0) mvxL0_mbAddrA[10:0]  <= mvx_L0; 
				  	  else			 mvxL0_mbAddrA[21:11] <= mvx_L0;
					2:if (subMbPartIdx == 1) begin	mvxL0_mbAddrA[21:11] <= mvx_L0; mvxL0_mbAddrA[10:0] <= mvx_L0;end
					3:if (subMbPartIdx == 1)	mvxL0_mbAddrA[10:0]  <= mvx_L0;
				  	  else if (subMbPartIdx == 3) mvxL0_mbAddrA[21:11] <= mvx_L0;
					endcase
				3:	case (sub_mb_type)
					0:begin	mvxL0_mbAddrA[32:22] <= mvx_L0;	mvxL0_mbAddrA[43:33] <= mvx_L0;	end
					1:if (subMbPartIdx == 0) mvxL0_mbAddrA[32:22]  <= mvx_L0; 
				  	  else			 mvxL0_mbAddrA[43:33]  <= mvx_L0;
					2:if (subMbPartIdx == 1) begin	mvxL0_mbAddrA[32:22] <= mvx_L0; mvxL0_mbAddrA[43:33] <= mvx_L0;end
					3:if (subMbPartIdx == 1)	mvxL0_mbAddrA[32:22] <= mvx_L0;
					  else if (subMbPartIdx == 3) mvxL0_mbAddrA[43:33] <= mvx_L0;
					endcase
				default:;endcase
			else	case (mbPartIdx)
				1:	case (sub_mb_type)
					0:begin	mvyL0_mbAddrA[21:11] <= mvy_L0;	mvyL0_mbAddrA[10:0] <= mvy_L0;	end
					1:if (subMbPartIdx == 0) mvyL0_mbAddrA[10:0]  <= mvy_L0; 
					  else			 mvyL0_mbAddrA[21:11] <= mvy_L0;
					2:if (subMbPartIdx == 1) begin	mvyL0_mbAddrA[21:11] <= mvy_L0; mvyL0_mbAddrA[10:0] <= mvy_L0;end
					3:if (subMbPartIdx == 1)	mvyL0_mbAddrA[10:0]  <= mvy_L0;
					  else if (subMbPartIdx == 3) mvyL0_mbAddrA[21:11] <= mvy_L0;
					endcase
				3:	case (sub_mb_type)
					0:begin	mvyL0_mbAddrA[32:22] <= mvy_L0;	mvyL0_mbAddrA[43:33] <= mvy_L0;	end
					1:if (subMbPartIdx == 0) mvyL0_mbAddrA[32:22]  <= mvy_L0; 
					  else			 mvyL0_mbAddrA[43:33]  <= mvy_L0;
					2:if (subMbPartIdx == 1) begin	mvyL0_mbAddrA[32:22] <= mvy_L0; mvyL0_mbAddrA[43:33] <= mvy_L0;end
					3:if (subMbPartIdx == 1)	mvyL0_mbAddrA[32:22] <= mvy_L0;
					  else if (subMbPartIdx == 3) mvyL0_mbAddrA[43:33] <= mvy_L0;
					endcase
				default:;endcase
		default:;endcase

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		mvxL1_mbAddrA <= 0; mvyL1_mbAddrA <= 0;end
	else if(slice_data_state == `skip_run_updat)begin
		mvxL1_mbAddrA <= {mvxL1_CurrMb0[10:0],mvxL1_CurrMb0[10:0],mvxL1_CurrMb0[10:0],mvxL1_CurrMb0[10:0]};
		mvyL1_mbAddrA <= {mvyL1_CurrMb0[10:0],mvyL1_CurrMb0[10:0],mvyL1_CurrMb0[10:0],mvyL1_CurrMb0[10:0]};end
	else if(mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)
		case(mb_type_general)
		`MB_Inter16x16:
			if(compIdx == 0) mvxL1_mbAddrA <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};
			else		 mvyL1_mbAddrA <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};
		`MB_Inter16x8:
			if(mbPartIdx == 1)begin
				if(compIdx == 0) mvxL1_mbAddrA <= {mvx_L1,mvx_L1,mvxL1_CurrMb0[10:0],mvxL1_CurrMb0[10:0]};
				else		 mvyL1_mbAddrA <= {mvy_L1,mvy_L1,mvyL1_CurrMb0[10:0],mvyL1_CurrMb0[10:0]};end	
		`MB_Inter8x16:
			if(mbPartIdx == 1)begin
				if(compIdx == 0) mvxL1_mbAddrA <= {mvx_L1,mvx_L1,mvx_L1,mvx_L1};
				else		 mvyL1_mbAddrA <= {mvy_L1,mvy_L1,mvy_L1,mvy_L1};end
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			if(compIdx == 0)
				case (mbPartIdx)
				1:	case (sub_mb_type)
					0:begin	mvxL1_mbAddrA[21:11] <= mvx_L1;	mvxL1_mbAddrA[10:0] <= mvx_L1;	end
					1:if (subMbPartIdx == 0) mvxL1_mbAddrA[10:0]  <= mvx_L1; 
					  else			 mvxL1_mbAddrA[21:11] <= mvx_L1;
					2:if (subMbPartIdx == 1) begin	mvxL1_mbAddrA[21:11] <= mvx_L1; mvxL1_mbAddrA[10:0] <= mvx_L1;end
					3:if (subMbPartIdx == 1)	mvxL1_mbAddrA[10:0]  <= mvx_L1;
					  else if (subMbPartIdx == 3) mvxL1_mbAddrA[21:11] <= mvx_L1;
					endcase
				3:	case (sub_mb_type)
					0:begin	mvxL1_mbAddrA[32:22] <= mvx_L1;	mvxL1_mbAddrA[43:33] <= mvx_L1;	end
					1:if (subMbPartIdx == 0) mvxL1_mbAddrA[32:22]  <= mvx_L1; 
					  else			 mvxL1_mbAddrA[43:33]  <= mvx_L1;
					2:if (subMbPartIdx == 1) begin	mvxL1_mbAddrA[32:22] <= mvx_L1; mvxL1_mbAddrA[43:33] <= mvx_L1;end
					3:if (subMbPartIdx == 1)	mvxL1_mbAddrA[32:22] <= mvx_L1;
					  else if (subMbPartIdx == 3) mvxL1_mbAddrA[43:33] <= mvx_L1;
					endcase
				default:; endcase
			else	case (mbPartIdx)
				1:	case (sub_mb_type)
					0:begin	mvyL1_mbAddrA[21:11] <= mvy_L1;	mvyL1_mbAddrA[10:0] <= mvy_L1;	end
					1:if (subMbPartIdx == 0) mvyL1_mbAddrA[10:0]  <= mvy_L1; 
					  else			 mvyL1_mbAddrA[21:11] <= mvy_L1;
					2:if (subMbPartIdx == 1) begin	mvyL1_mbAddrA[21:11] <= mvy_L1; mvyL1_mbAddrA[10:0] <= mvy_L1;end
					3:if (subMbPartIdx == 1)	mvyL1_mbAddrA[10:0]  <= mvy_L1;
					  else if (subMbPartIdx == 3) mvyL1_mbAddrA[21:11] <= mvy_L1;
					endcase
				3:	case (sub_mb_type)
					0:begin	mvyL1_mbAddrA[32:22] <= mvy_L1;	mvyL1_mbAddrA[43:33] <= mvy_L1;	end
					1:if (subMbPartIdx == 0) mvyL1_mbAddrA[32:22]  <= mvy_L1; 
					  else			 mvyL1_mbAddrA[43:33]  <= mvy_L1;
					2:if (subMbPartIdx == 1) begin	mvyL1_mbAddrA[32:22] <= mvy_L1; mvyL1_mbAddrA[43:33] <= mvy_L1;end
					3:if (subMbPartIdx == 1)	mvyL1_mbAddrA[32:22] <= mvy_L1;
					  else if (subMbPartIdx == 3) mvyL1_mbAddrA[43:33] <= mvy_L1;
					endcase
				default:; endcase			
		default:; endcase
//----------------------------
//addrB write
//----------------------------

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		mvxL0_mbAddrB_wr_n     <= 1; 
		mvxL0_mbAddrB_wr_addr  <= 0; mvxL0_mbAddrB_din     <= 0;	
		mvyL0_mbAddrB_wr_n     <= 1; 
		mvyL0_mbAddrB_wr_addr  <= 0; mvyL0_mbAddrB_din     <= 0;	end
	else if (slice_data_state == `skip_run_duration && p_skip_end)begin	
		mvxL0_mbAddrB_wr_n <= 0;
		mvxL0_mbAddrB_wr_addr	<= {mb_num_v[0],mb_num_h[6:0]};
		mvxL0_mbAddrB_din  <= {4{mvxL0_CurrMb0[10:0]}};
		mvyL0_mbAddrB_wr_n <= 0;
		mvyL0_mbAddrB_wr_addr	<= {mb_num_v[0],mb_num_h[6:0]};
		mvyL0_mbAddrB_din  <= {4{mvyL0_CurrMb0[10:0]}};end
	else if (mb_pred_state == `mvd_l0_s  || sub_mb_pred_state == `sub_mvd_l0_s)
		if(compIdx == 0)
			case(mb_type_general)
			`MB_Inter16x16:begin
				mvxL0_mbAddrB_wr_n  	<= 0;	
				mvxL0_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};
				mvxL0_mbAddrB_din     <= {4{mvx_L0}};end
			`MB_Inter16x8:if(mbPartIdx == 1)begin
				mvxL0_mbAddrB_wr_n     <= 0; 
				mvxL0_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
				mvxL0_mbAddrB_din     <= {4{mvx_L0}};end
				else begin
				mvxL0_mbAddrB_wr_n     <= 1; 
				mvxL0_mbAddrB_wr_addr  <= 0; mvxL0_mbAddrB_din     <= 0;end
			`MB_Inter8x16:if(mbPartIdx == 1)begin
				mvxL0_mbAddrB_wr_n     <= 0;
				mvxL0_mbAddrB_wr_addr <= {mb_num_v[0],mb_num_h[6:0]};
				mvxL0_mbAddrB_din <=  {mvxL0_CurrMb2[32:22],mvxL0_CurrMb2[43:33],mvx_L0,mvx_L0};end
				else begin
				mvxL0_mbAddrB_wr_n     <= 1; 
				mvxL0_mbAddrB_wr_addr  <= 0; mvxL0_mbAddrB_din     <= 0;end
			`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:if(mbPartIdx == 3)
				case (sub_mb_type)
				0:begin
					mvxL0_mbAddrB_wr_n     <= 0; 
					mvxL0_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvxL0_mbAddrB_din     <= {mvxL0_CurrMb2[32:22],mvxL0_CurrMb2[43:33],mvx_L0,mvx_L0};end
				1:if (subMbPartIdx == 1)begin
					mvxL0_mbAddrB_wr_n     <= 0; 
					mvxL0_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvxL0_mbAddrB_din     <= {mvxL0_CurrMb2[32:22],mvxL0_CurrMb2[43:33],mvx_L0,mvx_L0};end
				  else begin
					mvxL0_mbAddrB_wr_n     <= 1; 
					mvxL0_mbAddrB_wr_addr  <= 0; mvxL0_mbAddrB_din     <= 0;end
				2:if (subMbPartIdx == 1)begin
					mvxL0_mbAddrB_wr_n     <= 0; 
					mvxL0_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvxL0_mbAddrB_din <= {mvxL0_CurrMb2[32:22],mvxL0_CurrMb2[43:33],mvxL0_CurrMb3[32:22],mvx_L0};end
				  else begin
					mvxL0_mbAddrB_wr_n     <= 1; 
					mvxL0_mbAddrB_wr_addr  <= 0; mvxL0_mbAddrB_din     <= 0;end
				3:if (subMbPartIdx == 3)begin
					mvxL0_mbAddrB_wr_n     <= 0; 
					mvxL0_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvxL0_mbAddrB_din  <= {mvxL0_CurrMb2[32:22],mvxL0_CurrMb2[43:33],mvxL0_CurrMb3[32:22],mvx_L0};	end
				  else begin
					mvxL0_mbAddrB_wr_n     <= 1; 
					mvxL0_mbAddrB_wr_addr  <= 0; mvxL0_mbAddrB_din     <= 0;end
				endcase
			default:begin
				mvxL0_mbAddrB_wr_n     <= 1; 
				mvxL0_mbAddrB_wr_addr  <= 0; mvxL0_mbAddrB_din     <= 0;end
			endcase
		else
			case(mb_type_general)
			`MB_Inter16x16:begin
				mvyL0_mbAddrB_wr_n  	<= 0;	
				mvyL0_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};
				mvyL0_mbAddrB_din     <= {4{mvy_L0}};end
			`MB_Inter16x8:if(mbPartIdx == 1)begin
				mvyL0_mbAddrB_wr_n     <= 0; 
				mvyL0_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
				mvyL0_mbAddrB_din     <= {4{mvy_L0}};end
				else begin
				mvyL0_mbAddrB_wr_n     <= 1; 
				mvyL0_mbAddrB_wr_addr  <= 0; mvyL0_mbAddrB_din     <= 0;end
			`MB_Inter8x16:if(mbPartIdx == 1)begin
				mvyL0_mbAddrB_wr_n     <= 0;
				mvyL0_mbAddrB_wr_addr <= {mb_num_v[0],mb_num_h[6:0]};
				mvyL0_mbAddrB_din <=  {mvyL0_CurrMb2[32:22],mvyL0_CurrMb2[43:33],mvy_L0,mvy_L0};end
				else begin
				mvyL0_mbAddrB_wr_n     <= 1; 
				mvyL0_mbAddrB_wr_addr  <= 0; mvyL0_mbAddrB_din     <= 0;end
			`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:if(mbPartIdx == 3)
				case (sub_mb_type)
				0:begin
					mvyL0_mbAddrB_wr_n     <= 0; 
					mvyL0_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvyL0_mbAddrB_din     <= {mvyL0_CurrMb2[32:22],mvyL0_CurrMb2[43:33],mvy_L0,mvy_L0};end
				1:if (subMbPartIdx == 1)begin
					mvyL0_mbAddrB_wr_n     <= 0; 
					mvyL0_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvyL0_mbAddrB_din     <= {mvyL0_CurrMb2[32:22],mvyL0_CurrMb2[43:33],mvy_L0,mvy_L0};end
				  else begin
					mvyL0_mbAddrB_wr_n     <= 1; 
					mvyL0_mbAddrB_wr_addr  <= 0; mvyL0_mbAddrB_din     <= 0;end
				2:if (subMbPartIdx == 1)begin
					mvyL0_mbAddrB_wr_n     <= 0; 
					mvyL0_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvyL0_mbAddrB_din <= {mvyL0_CurrMb2[32:22],mvyL0_CurrMb2[43:33],mvyL0_CurrMb3[32:22],mvy_L0};end
				  else begin
					mvyL0_mbAddrB_wr_n     <= 1; 
					mvyL0_mbAddrB_wr_addr  <= 0; mvyL0_mbAddrB_din     <= 0;end
				3:if (subMbPartIdx == 3)begin
					mvyL0_mbAddrB_wr_n     <= 0; 
					mvyL0_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvyL0_mbAddrB_din  <= {mvyL0_CurrMb2[32:22],mvyL0_CurrMb2[43:33],mvyL0_CurrMb3[32:22],mvy_L0};	end
				  else begin
					mvyL0_mbAddrB_wr_n     <= 1; 
					mvyL0_mbAddrB_wr_addr  <= 0; mvyL0_mbAddrB_din     <= 0;end
				endcase
			default:begin
				mvyL0_mbAddrB_wr_n     <= 1; 
				mvyL0_mbAddrB_wr_addr  <= 0; mvyL0_mbAddrB_din     <= 0;end
			endcase
	else begin
		mvyL0_mbAddrB_wr_n     <= 1; 
		mvyL0_mbAddrB_wr_addr  <= 0; mvyL0_mbAddrB_din     <= 0;end


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		mvxL1_mbAddrB_wr_n     <= 1; 
		mvxL1_mbAddrB_wr_addr  <= 0; mvxL1_mbAddrB_din     <= 0;	
		mvyL1_mbAddrB_wr_n     <= 1; 
		mvyL1_mbAddrB_wr_addr  <= 0; mvyL1_mbAddrB_din     <= 0;	end
	else if (slice_data_state == `skip_run_duration && p_skip_end)begin	
		mvxL1_mbAddrB_wr_n <= 0;
		mvxL1_mbAddrB_wr_addr	<= {mb_num_v[0],mb_num_h[6:0]};
		mvxL1_mbAddrB_din  <= {4{mvxL1_CurrMb0[10:0]}};
		mvyL1_mbAddrB_wr_n <= 0;
		mvyL1_mbAddrB_wr_addr	<= {mb_num_v[0],mb_num_h[6:0]};
		mvyL1_mbAddrB_din  <= {4{mvyL1_CurrMb0[10:0]}};end
	else if (mb_pred_state == `mvd_l1_s  || sub_mb_pred_state == `sub_mvd_l1_s)
		if(compIdx == 0)
			case(mb_type_general)
			`MB_Inter16x16:begin
				mvxL1_mbAddrB_wr_n  	<= 0;	
				mvxL1_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};
				mvxL1_mbAddrB_din     <= {4{mvx_L1}};end
			`MB_Inter16x8:if(mbPartIdx == 1)begin
				mvxL1_mbAddrB_wr_n     <= 0; 
				mvxL1_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
				mvxL1_mbAddrB_din     <= {4{mvx_L1}};end
				else begin
				mvxL1_mbAddrB_wr_n     <= 1; 
				mvxL1_mbAddrB_wr_addr  <= 0; mvxL1_mbAddrB_din     <= 0;end
			`MB_Inter8x16:if(mbPartIdx == 1)begin
				mvxL1_mbAddrB_wr_n     <= 0;
				mvxL1_mbAddrB_wr_addr <= {mb_num_v[0],mb_num_h[6:0]};
				mvxL1_mbAddrB_din <=  {mvxL1_CurrMb2[32:22],mvxL1_CurrMb2[43:33],mvx_L1,mvx_L1};end
				else begin
				mvxL1_mbAddrB_wr_n     <= 1; 
				mvxL1_mbAddrB_wr_addr  <= 0; mvxL1_mbAddrB_din     <= 0;end
			`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:if(mbPartIdx == 3)
				case (sub_mb_type)
				0:begin
					mvxL1_mbAddrB_wr_n     <= 0; 
					mvxL1_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvxL1_mbAddrB_din     <= {mvxL1_CurrMb2[32:22],mvxL1_CurrMb2[43:33],mvx_L1,mvx_L1};end
				1:if (subMbPartIdx == 1)begin
					mvxL1_mbAddrB_wr_n     <= 0; 
					mvxL1_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvxL1_mbAddrB_din     <= {mvxL1_CurrMb2[32:22],mvxL1_CurrMb2[43:33],mvx_L1,mvx_L1};end
				  else begin
					mvxL1_mbAddrB_wr_n     <= 1; 
					mvxL1_mbAddrB_wr_addr  <= 0; mvxL1_mbAddrB_din     <= 0;end
				2:if (subMbPartIdx == 1)begin
					mvxL1_mbAddrB_wr_n     <= 0; 
					mvxL1_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvxL1_mbAddrB_din <= {mvxL1_CurrMb2[32:22],mvxL1_CurrMb2[43:33],mvxL1_CurrMb3[32:22],mvx_L1};end
				  else begin
					mvxL1_mbAddrB_wr_n     <= 1; 
					mvxL1_mbAddrB_wr_addr  <= 0; mvxL1_mbAddrB_din     <= 0;end
				3:if (subMbPartIdx == 3)begin
					mvxL1_mbAddrB_wr_n     <= 0; 
					mvxL1_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvxL1_mbAddrB_din  <= {mvxL1_CurrMb2[32:22],mvxL1_CurrMb2[43:33],mvxL1_CurrMb3[32:22],mvx_L1};	end
				  else begin
					mvxL1_mbAddrB_wr_n     <= 1; 
					mvxL1_mbAddrB_wr_addr  <= 0; mvxL1_mbAddrB_din     <= 0;end
				endcase

			default:begin
				mvxL1_mbAddrB_wr_n     <= 1; 
				mvxL1_mbAddrB_wr_addr  <= 0; mvxL1_mbAddrB_din     <= 0;end
			endcase
		else
			case(mb_type_general)
			`MB_Inter16x16:begin
				mvyL1_mbAddrB_wr_n  	<= 0;	
				mvyL1_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};
				mvyL1_mbAddrB_din     <= {4{mvy_L1}};end
			`MB_Inter16x8:if(mbPartIdx == 1)begin
				mvyL1_mbAddrB_wr_n     <= 0; 
				mvyL1_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
				mvyL1_mbAddrB_din     <= {4{mvy_L1}};end
				else begin
				mvyL1_mbAddrB_wr_n     <= 1; 
				mvyL1_mbAddrB_wr_addr  <= 0; mvyL1_mbAddrB_din     <= 0;end
			`MB_Inter8x16:if(mbPartIdx == 1)begin
				mvyL1_mbAddrB_wr_n     <= 0;
				mvyL1_mbAddrB_wr_addr <= {mb_num_v[0],mb_num_h[6:0]};
				mvyL1_mbAddrB_din <=  {mvyL1_CurrMb2[32:22],mvyL1_CurrMb2[43:33],mvy_L1,mvy_L1};end
				else begin
				mvyL1_mbAddrB_wr_n     <= 1; 
				mvyL1_mbAddrB_wr_addr  <= 0; mvyL1_mbAddrB_din     <= 0;end
			`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:if(mbPartIdx == 3)
				case (sub_mb_type)
				0:begin
					mvyL1_mbAddrB_wr_n     <= 0; 
					mvyL1_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvyL1_mbAddrB_din     <= {mvyL1_CurrMb2[32:22],mvyL1_CurrMb2[43:33],mvy_L1,mvy_L1};end
				1:if (subMbPartIdx == 1)begin
					mvyL1_mbAddrB_wr_n     <= 0; 
					mvyL1_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvyL1_mbAddrB_din     <= {mvyL1_CurrMb2[32:22],mvyL1_CurrMb2[43:33],mvy_L1,mvy_L1};end
				  else begin
					mvyL1_mbAddrB_wr_n     <= 1; 
					mvyL1_mbAddrB_wr_addr  <= 0; mvyL1_mbAddrB_din     <= 0;end
				2:if (subMbPartIdx == 1)begin
					mvyL1_mbAddrB_wr_n     <= 0; 
					mvyL1_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvyL1_mbAddrB_din <= {mvyL1_CurrMb2[32:22],mvyL1_CurrMb2[43:33],mvyL1_CurrMb3[32:22],mvy_L1};end
				  else begin
					mvyL1_mbAddrB_wr_n     <= 1; 
					mvyL1_mbAddrB_wr_addr  <= 0; mvyL1_mbAddrB_din     <= 0;end
				3:if (subMbPartIdx == 3)begin
					mvyL1_mbAddrB_wr_n     <= 0; 
					mvyL1_mbAddrB_wr_addr  <= {mb_num_v[0],mb_num_h[6:0]};	
					mvyL1_mbAddrB_din  <= {mvyL1_CurrMb2[32:22],mvyL1_CurrMb2[43:33],mvyL1_CurrMb3[32:22],mvy_L1};	end
				  else begin
					mvyL1_mbAddrB_wr_n     <= 1; 
					mvyL1_mbAddrB_wr_addr  <= 0; mvyL1_mbAddrB_din     <= 0;end
				endcase
			default:begin
				mvyL1_mbAddrB_wr_n     <= 1; 
				mvyL1_mbAddrB_wr_addr  <= 0; mvyL1_mbAddrB_din     <= 0;end
			endcase
	else begin
		mvyL1_mbAddrB_wr_n     <= 1; 
		mvyL1_mbAddrB_wr_addr  <= 0; mvyL1_mbAddrB_din     <= 0;end


always @ (reset_n or slice_data_state or mb_pred_state or sub_mb_pred_state or mv_mbAddrB_rd_for_DF
	or Is_skipMB_mv_calc  or mb_type_general or sub_mb_type or mb_num_h or compIdx  or mb_num_v)
	if (reset_n == 0)begin
		mvxL0_mbAddrB_rd_addr = 0;	mvyL0_mbAddrB_rd_addr = 0;	
		mvxL0_mbAddrC_rd_addr = 0;	mvyL0_mbAddrC_rd_addr = 0;	
		mvxL0_mbAddrD_rd_addr = 0;	mvyL0_mbAddrD_rd_addr = 0;	end		
	else if (mv_mbAddrB_rd_for_DF)begin
		mvxL0_mbAddrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};
		mvyL0_mbAddrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};end
	else if (slice_data_state == `skip_run_duration && Is_skipMB_mv_calc)begin
		mvxL0_mbAddrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};		mvyL0_mbAddrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};	
		mvxL0_mbAddrC_rd_addr = {~mb_num_v[0],mb_num_h[6:0]+7'b1};	mvyL0_mbAddrC_rd_addr = {~mb_num_v[0],mb_num_h[6:0]+7'b1};	
		mvxL0_mbAddrD_rd_addr = {~mb_num_v[0],mb_num_h[6:0]-7'b1};	mvyL0_mbAddrD_rd_addr = {~mb_num_v[0],mb_num_h[6:0]-7'b1};	end
	else if (mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s)
		if(compIdx == 0)begin
			mvxL0_mbAddrB_rd_addr  = {~mb_num_v[0],mb_num_h[6:0]}; 
			mvxL0_mbAddrC_rd_addr  = {~mb_num_v[0],mb_num_h[6:0]+7'b1};
			mvxL0_mbAddrD_rd_addr  = {~mb_num_v[0],mb_num_h[6:0]-7'b1};end
		else begin
			mvyL0_mbAddrB_rd_addr  = {~mb_num_v[0],mb_num_h[6:0]}; 
			mvyL0_mbAddrC_rd_addr  = {~mb_num_v[0],mb_num_h[6:0]+7'b1};
			mvyL0_mbAddrD_rd_addr  = {~mb_num_v[0],mb_num_h[6:0]-7'b1};end

always @ (reset_n or slice_data_state or mb_pred_state or sub_mb_pred_state or mv_mbAddrB_rd_for_DF
	or Is_skipMB_mv_calc  or mb_type_general or sub_mb_type or mb_num_h or compIdx )
	if (reset_n == 0)begin
		mvxL1_mbAddrB_rd_addr = 0;	mvyL1_mbAddrB_rd_addr = 0;	
		mvxL1_mbAddrC_rd_addr = 0;	mvyL1_mbAddrC_rd_addr = 0;	
		mvxL1_mbAddrD_rd_addr = 0;	mvyL1_mbAddrD_rd_addr = 0;	end		
	else if (mv_mbAddrB_rd_for_DF)begin
		mvxL1_mbAddrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};
		mvyL1_mbAddrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};end
	else if (slice_data_state == `skip_run_duration && Is_skipMB_mv_calc)begin
		mvxL1_mbAddrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};		mvyL1_mbAddrB_rd_addr = {~mb_num_v[0],mb_num_h[6:0]};	
		mvxL1_mbAddrC_rd_addr = {~mb_num_v[0],mb_num_h[6:0]+7'b1};	mvyL1_mbAddrC_rd_addr = {~mb_num_v[0],mb_num_h[6:0]+7'b1};	
		mvxL1_mbAddrD_rd_addr = {~mb_num_v[0],mb_num_h[6:0]-7'b1};	mvyL1_mbAddrD_rd_addr = {~mb_num_v[0],mb_num_h[6:0]-7'b1};	end
	else if (mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)
		if(compIdx == 0)begin
			mvxL1_mbAddrB_rd_addr  = {~mb_num_v[0],mb_num_h[6:0]}; 
			mvxL1_mbAddrC_rd_addr  = {~mb_num_v[0],mb_num_h[6:0]+7'b1};
			mvxL1_mbAddrD_rd_addr  = {~mb_num_v[0],mb_num_h[6:0]-7'b1};end
		else begin
			mvyL1_mbAddrB_rd_addr  = {~mb_num_v[0],mb_num_h[6:0]}; 
			mvyL1_mbAddrC_rd_addr  = {~mb_num_v[0],mb_num_h[6:0]+7'b1};
			mvyL1_mbAddrD_rd_addr  = {~mb_num_v[0],mb_num_h[6:0]-7'b1};end



//--------------------------------------
//mvax
//--------------------------------------
wire mvpAL0_is_0;
assign mvpAL0_is_0 = (mb_num_h == 0)||(mb_num_h != 0 && MBTypeGen_mbAddrA[1] == 1)||(mb_num_h != 0 && predFlagL0_A == 0);


always @ (Is_skipMB_mv_calc or mb_pred_state or sub_mb_pred_state or mvpAL0_is_0 or mvxL0_mbAddrA  or mvyL0_mbAddrA
	or mb_type_general or sub_mb_type or mbPartIdx or subMbPartIdx or compIdx 
	or mvxL0_CurrMb0 or mvxL0_CurrMb1 or mvxL0_CurrMb2 or mvxL0_CurrMb3 or mvyL0_CurrMb0 or mvyL0_CurrMb1 or mvyL0_CurrMb2 or mvyL0_CurrMb3 )	
	if (Is_skipMB_mv_calc)begin
		mvpAx_L0 = mvpAL0_is_0 ? 0:mvxL0_mbAddrA[10:0];
		mvpAy_L0 = mvpAL0_is_0 ? 0:mvyL0_mbAddrA[10:0];end
	else if(mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s)begin
		if(compIdx == 0)
		case(mb_type_general)
		`MB_Inter16x16: mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[10:0];
		`MB_Inter16x8:
			if (mbPartIdx == 0)
				mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[10:0];
			else	mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[32:22];
		`MB_Inter8x16:
			if (mbPartIdx == 0)
				mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[10:0];
			else    mvpAx_L0 = mvxL0_CurrMb0[21:11];
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			case(mbPartIdx)
			0:
				case (sub_mb_type)
				0:mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[10:0];
				1:if(subMbPartIdx == 0)
					mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[10:0];
				  else  mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[21:11];
				2:if(subMbPartIdx == 0)
					mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[10:0];
				  else  mvpAx_L0 = mvxL0_CurrMb0[10:0];
				3:	case(subMbPartIdx)
					0:mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[10:0];
					1:mvpAx_L0 = mvxL0_CurrMb0[10:0];
					2:mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[21:11];
					3:mvpAx_L0 = mvxL0_CurrMb0[32:22];
					endcase
				endcase
			1:
				case (sub_mb_type)
				0:	mvpAx_L0 = mvxL0_CurrMb0[21:11];
				1:	if(subMbPartIdx == 0)   mvpAx_L0 = mvxL0_CurrMb0[21:11];
					else			mvpAx_L0 = mvxL0_CurrMb0[43:33];
				2:	if(subMbPartIdx == 0)	mvpAx_L0 = mvxL0_CurrMb0[21:11];
					else			mvpAx_L0 = mvxL0_CurrMb1[10:0];
				3:	case(subMbPartIdx)
					0:mvpAx_L0 = mvxL0_CurrMb0[21:11]; 
					1:mvpAx_L0 = mvxL0_CurrMb1[10:0];
					2:mvpAx_L0 = mvxL0_CurrMb0[43:33];
					3:mvpAx_L0 = mvxL0_CurrMb1[32:22];
					endcase
				endcase
			2:
				case (sub_mb_type)
				0:mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[32:22];
				1:
					if(subMbPartIdx == 0)	mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[32:22];
				  	else  			mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[43:33];
				2:
					if(subMbPartIdx == 0)	mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[32:22];
				  	else  			mvpAx_L0 = mvxL0_CurrMb2[10:0];
				3:	case(subMbPartIdx)
					0:mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[32:22];
					1:mvpAx_L0 = mvxL0_CurrMb2[10:0];
					2:mvpAx_L0 = mvpAL0_is_0?0:mvxL0_mbAddrA[43:33];
					3:mvpAx_L0 = mvxL0_CurrMb2[32:22];
					endcase
				endcase	
			3:
				case (sub_mb_type)
				0:	mvpAx_L0 = mvxL0_CurrMb2[21:11];
				1:	if(subMbPartIdx == 0)   mvpAx_L0 = mvxL0_CurrMb2[21:11];
					else			mvpAx_L0 = mvxL0_CurrMb2[43:33];
				2:	if(subMbPartIdx == 0)	mvpAx_L0 = mvxL0_CurrMb2[21:11];
					else			mvpAx_L0 = mvxL0_CurrMb3[10:0];
				3:	case(subMbPartIdx)
					0:mvpAx_L0 = mvxL0_CurrMb2[21:11]; 
					1:mvpAx_L0 = mvxL0_CurrMb3[10:0];
					2:mvpAx_L0 = mvxL0_CurrMb2[43:33];
					3:mvpAx_L0 = mvxL0_CurrMb3[32:22];
					endcase
				endcase
			endcase
		default:mvpAx_L0 = 0;
		endcase
		else
		case(mb_type_general)
		`MB_Inter16x16: mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[10:0];
		`MB_Inter16x8:
			if (mbPartIdx == 0)
				mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[10:0];
			else	mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[32:22];
		`MB_Inter8x16:
			if (mbPartIdx == 0)
				mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[10:0];
			else    mvpAy_L0 = mvyL0_CurrMb0[21:11];
		`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
			case(mbPartIdx)
			0:
				case (sub_mb_type)
				0:mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[10:0];
				1:if(subMbPartIdx == 0)
					mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[10:0];
				  else  mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[21:11];
				2:if(subMbPartIdx == 0)
					mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[10:0];
				  else  mvpAy_L0 = mvyL0_CurrMb0[10:0];
				3:	case(subMbPartIdx)
					0:mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[10:0];
					1:mvpAy_L0 = mvyL0_CurrMb0[10:0];
					2:mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[21:11];
					3:mvpAy_L0 = mvyL0_CurrMb0[32:22];
					endcase
				endcase
			1:
				case (sub_mb_type)
				0:	mvpAy_L0 = mvyL0_CurrMb0[21:11];
				1:	if(subMbPartIdx == 0)   mvpAy_L0 = mvyL0_CurrMb0[21:11];
					else			mvpAy_L0 = mvyL0_CurrMb0[43:33];
				2:	if(subMbPartIdx == 0)	mvpAy_L0 = mvyL0_CurrMb0[21:11];
					else			mvpAy_L0 = mvyL0_CurrMb1[10:0];
				3:	case(subMbPartIdx)
					0:mvpAy_L0 = mvyL0_CurrMb0[21:11]; 
					1:mvpAy_L0 = mvyL0_CurrMb1[10:0];
					2:mvpAy_L0 = mvyL0_CurrMb0[43:33];
					3:mvpAy_L0 = mvyL0_CurrMb1[32:22];
					endcase
				endcase
			2:
				case (sub_mb_type)
				0:mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[32:22];
				1:
					if(subMbPartIdx == 0)	mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[32:22];
				  	else  			mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[43:33];
				2:
					if(subMbPartIdx == 0)	mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[32:22];
				  	else  			mvpAy_L0 = mvyL0_CurrMb2[10:0];
				3:	case(subMbPartIdx)
					0:mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[32:22];
					1:mvpAy_L0 = mvyL0_CurrMb2[10:0];
					2:mvpAy_L0 = mvpAL0_is_0?0:mvyL0_mbAddrA[43:33];
					3:mvpAy_L0 = mvyL0_CurrMb2[32:22];
					endcase
				endcase	
			3:
				case (sub_mb_type)
				0:	mvpAy_L0 = mvyL0_CurrMb2[21:11];
				1:	if(subMbPartIdx == 0)   mvpAy_L0 = mvyL0_CurrMb2[21:11];
					else			mvpAy_L0 = mvyL0_CurrMb2[43:33];
				2:	if(subMbPartIdx == 0)	mvpAy_L0 = mvyL0_CurrMb2[21:11];
					else			mvpAy_L0 = mvyL0_CurrMb3[10:0];
				3:	case(subMbPartIdx)
					0:mvpAy_L0 = mvyL0_CurrMb2[21:11]; 
					1:mvpAy_L0 = mvyL0_CurrMb3[10:0];
					2:mvpAy_L0 = mvyL0_CurrMb2[43:33];
					3:mvpAy_L0 = mvyL0_CurrMb3[32:22];
					endcase
				endcase
			endcase
		default:mvpAy_L0 = 0;
		endcase
		end
	else 
		mvpAy_L0 = 0;

wire mvpAL1_is_0;
assign mvpAL1_is_0 = (mb_num_h == 0)||(mb_num_h != 0 && MBTypeGen_mbAddrA[1] == 1)||(mb_num_h != 0 && predFlagL1_A == 0);

always @ (Is_skipMB_mv_calc or mb_pred_state or sub_mb_pred_state or mvpAL1_is_0 or mvxL1_mbAddrA  or mvyL1_mbAddrA
	or mb_type_general or sub_mb_type or mbPartIdx or subMbPartIdx or compIdx 
	or mvxL1_CurrMb0 or mvxL1_CurrMb1 or mvxL1_CurrMb2 or mvxL1_CurrMb3 or mvyL1_CurrMb0 or mvyL1_CurrMb1 or mvyL1_CurrMb2 or mvyL1_CurrMb3 )	
	if (Is_skipMB_mv_calc)begin
		mvpAx_L1 = mvpAL1_is_0 ? 0:mvxL1_mbAddrA[10:0];
		mvpAy_L1 = mvpAL1_is_0 ? 0:mvyL1_mbAddrA[10:0];end
	else if(mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)begin
		if(compIdx == 0)
		case(mb_type_general)
		`MB_Inter16x16: mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[10:0];
		`MB_Inter16x8:
			if (mbPartIdx == 0)
				mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[10:0];
			else	mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[32:22];
		`MB_Inter8x16:
			if (mbPartIdx == 0)
				mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[10:0];
			else    mvpAx_L1 = mvxL1_CurrMb0[21:11];
		`MB_B_8x8:
			case(mbPartIdx)
			0:
				case (sub_mb_type)
				0:mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[10:0];
				1:if(subMbPartIdx == 0)
					mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[10:0];
				  else  mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[21:11];
				2:if(subMbPartIdx == 0)
					mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[10:0];
				  else  mvpAx_L1 = mvxL1_CurrMb0[10:0];
				3:	case(subMbPartIdx)
					0:mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[10:0];
					1:mvpAx_L1 = mvxL1_CurrMb0[10:0];
					2:mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[21:11];
					3:mvpAx_L1 = mvxL1_CurrMb0[32:22];
					endcase
				endcase
			1:
				case (sub_mb_type)
				0:	mvpAx_L1 = mvxL1_CurrMb0[21:11];
				1:	if(subMbPartIdx == 0)   mvpAx_L1 = mvxL1_CurrMb0[21:11];
					else			mvpAx_L1 = mvxL1_CurrMb0[43:33];
				2:	if(subMbPartIdx == 0)	mvpAx_L1 = mvxL1_CurrMb0[21:11];
					else			mvpAx_L1 = mvxL1_CurrMb1[10:0];
				3:	case(subMbPartIdx)
					0:mvpAx_L1 = mvxL1_CurrMb0[21:11]; 
					1:mvpAx_L1 = mvxL1_CurrMb1[10:0];
					2:mvpAx_L1 = mvxL1_CurrMb0[43:33];
					3:mvpAx_L1 = mvxL1_CurrMb1[32:22];
					endcase
				endcase
			2:
				case (sub_mb_type)
				0:mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[32:22];
				1:
					if(subMbPartIdx == 0)	mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[32:22];
				  	else  			mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[43:33];
				2:
					if(subMbPartIdx == 0)	mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[32:22];
				  	else  			mvpAx_L1 = mvxL1_CurrMb2[10:0];
				3:	case(subMbPartIdx)
					0:mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[32:22];
					1:mvpAx_L1 = mvxL1_CurrMb2[10:0];
					2:mvpAx_L1 = mvpAL1_is_0?0:mvxL1_mbAddrA[43:33];
					3:mvpAx_L1 = mvxL1_CurrMb2[32:22];
					endcase
				endcase	
			3:
				case (sub_mb_type)
				0:	mvpAx_L1 = mvxL1_CurrMb2[21:11];
				1:	if(subMbPartIdx == 0)   mvpAx_L1 = mvxL1_CurrMb2[21:11];
					else			mvpAx_L1 = mvxL1_CurrMb2[43:33];
				2:	if(subMbPartIdx == 0)	mvpAx_L1 = mvxL1_CurrMb2[21:11];
					else			mvpAx_L1 = mvxL1_CurrMb3[10:0];
				3:	case(subMbPartIdx)
					0:mvpAx_L1 = mvxL1_CurrMb2[21:11]; 
					1:mvpAx_L1 = mvxL1_CurrMb3[10:0];
					2:mvpAx_L1 = mvxL1_CurrMb2[43:33];
					3:mvpAx_L1 = mvxL1_CurrMb3[32:22];
					endcase
				endcase
			endcase
		default:mvpAx_L1 = 0;
		endcase
		else
		case(mb_type_general)
		`MB_Inter16x16: mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[10:0];
		`MB_Inter16x8:
			if (mbPartIdx == 0)
				mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[10:0];
			else	mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[32:22];
		`MB_Inter8x16:
			if (mbPartIdx == 0)
				mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[10:0];
			else    mvpAy_L1 = mvyL1_CurrMb0[21:11];
		`MB_B_8x8:
			case(mbPartIdx)
			0:
				case (sub_mb_type)
				0:mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[10:0];
				1:if(subMbPartIdx == 0)
					mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[10:0];
				  else  mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[21:11];
				2:if(subMbPartIdx == 0)
					mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[10:0];
				  else  mvpAy_L1 = mvyL1_CurrMb0[10:0];
				3:	case(subMbPartIdx)
					0:mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[10:0];
					1:mvpAy_L1 = mvyL1_CurrMb0[10:0];
					2:mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[21:11];
					3:mvpAy_L1 = mvyL1_CurrMb0[32:22];
					endcase
				endcase
			1:
				case (sub_mb_type)
				0:	mvpAy_L1 = mvyL1_CurrMb0[21:11];
				1:	if(subMbPartIdx == 0)   mvpAy_L1 = mvyL1_CurrMb0[21:11];
					else			mvpAy_L1 = mvyL1_CurrMb0[43:33];
				2:	if(subMbPartIdx == 0)	mvpAy_L1 = mvyL1_CurrMb0[21:11];
					else			mvpAy_L1 = mvyL1_CurrMb1[10:0];
				3:	case(subMbPartIdx)
					0:mvpAy_L1 = mvyL1_CurrMb0[21:11]; 
					1:mvpAy_L1 = mvyL1_CurrMb1[10:0];
					2:mvpAy_L1 = mvyL1_CurrMb0[43:33];
					3:mvpAy_L1 = mvyL1_CurrMb1[32:22];
					endcase
				endcase
			2:
				case (sub_mb_type)
				0:mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[32:22];
				1:
					if(subMbPartIdx == 0)	mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[32:22];
				  	else  			mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[43:33];
				2:
					if(subMbPartIdx == 0)	mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[32:22];
				  	else  			mvpAy_L1 = mvyL1_CurrMb2[10:0];
				3:	case(subMbPartIdx)
					0:mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[32:22];
					1:mvpAy_L1 = mvyL1_CurrMb2[10:0];
					2:mvpAy_L1 = mvpAL1_is_0?0:mvyL1_mbAddrA[43:33];
					3:mvpAy_L1 = mvyL1_CurrMb2[32:22];
					endcase
				endcase	
			3:
				case (sub_mb_type)
				0:	mvpAy_L1 = mvyL1_CurrMb2[21:11];
				1:	if(subMbPartIdx == 0)   mvpAy_L1 = mvyL1_CurrMb2[21:11];
					else			mvpAy_L1 = mvyL1_CurrMb2[43:33];
				2:	if(subMbPartIdx == 0)	mvpAy_L1 = mvyL1_CurrMb2[21:11];
					else			mvpAy_L1 = mvyL1_CurrMb3[10:0];
				3:	case(subMbPartIdx)
					0:mvpAy_L1 = mvyL1_CurrMb2[21:11]; 
					1:mvpAy_L1 = mvyL1_CurrMb3[10:0];
					2:mvpAy_L1 = mvyL1_CurrMb2[43:33];
					3:mvpAy_L1 = mvyL1_CurrMb3[32:22];
					endcase
				endcase
			endcase
		default:mvpAy_L1 = 0;
		endcase
		end
	else 
		mvpAy_L1 = 0;

//--------------------------------------
//mvbx
//--------------------------------------
wire mvpBL0_is_0,mvpBL0_is_A;
assign mvpBL0_is_0 = (mb_num_h == 0 && mb_num_v == 0)||(mb_num_v != 0 && MBTypeGen_mbAddrB[1] == 1)||(mb_num_v != 0 && predFlagL0_B == 0)||
		     (mb_num_v == 0 && mb_num_h != 0 && (MBTypeGen_mbAddrA[1] == 1 || predFlagL0_A == 0));
assign mvpBL0_is_A =  mb_num_v == 0 && mb_num_h != 0 && MBTypeGen_mbAddrA[1] == 0 && predFlagL0_A == 1;

always @ (Is_skipMB_mv_calc or mb_pred_state or sub_mb_pred_state or mvpBL0_is_0 or mvpBL0_is_A or mb_num_v 
	or mb_type_general or sub_mb_type or mbPartIdx or subMbPartIdx or compIdx or SubMbPredMode or slice_type
	or mvxL0_mbAddrA or mvxL0_mbAddrB_dout or mvyL0_mbAddrA or mvyL0_mbAddrB_dout
	or mvxL0_CurrMb0 or mvxL0_CurrMb1 or mvxL0_CurrMb2 or mvxL0_CurrMb3 or mvyL0_CurrMb0 or mvyL0_CurrMb1 or mvyL0_CurrMb2 or mvyL0_CurrMb3)	
	if (Is_skipMB_mv_calc)begin
		mvpBx_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[43:33];
		mvpBy_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[43:33];end
	else if(mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s)begin
		if(compIdx == 0)
			case(mb_type_general)
			`MB_Inter16x16:mvpBx_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[43:33];
			`MB_Inter16x8: 
				if(mbPartIdx == 0)	mvpBx_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[43:33];
				else			mvpBx_L0 = mvxL0_CurrMb0[32:22];
			`MB_Inter8x16:
				if(mbPartIdx == 0)	mvpBx_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[43:33];
				else			mvpBx_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvxL0_CurrMb0[10:0]:mvxL0_mbAddrB_dout[21:11];
			`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
				if (SubMbPredMode == `B_sub_Direct && slice_type == `slice_type_b)
					mvpBx_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[43:33];
				else
				case (mbPartIdx)
				0:	case(sub_mb_type)
					0:	mvpBx_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[43:33];
					1:if(subMbPartIdx == 0)	
						mvpBx_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[43:33];
					  else	mvpBx_L0 = mvxL0_CurrMb0[10:0];
					2:if(subMbPartIdx == 0)
						mvpBx_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[43:33];
					  else	mvpBx_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvxL0_CurrMb0[10:0]:mvxL0_mbAddrB_dout[32:22];	
					3:
						case(subMbPartIdx)	
						0:mvpBx_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[43:33];
						1:mvpBx_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvxL0_CurrMb0[10:0]:mvxL0_mbAddrB_dout[32:22];	
						2:mvpBx_L0 = mvxL0_CurrMb0[10:0];
						3:mvpBx_L0 = mvxL0_CurrMb0[21:11];
						endcase
					endcase
				1:	case(sub_mb_type)
					0:mvpBx_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvxL0_CurrMb0[21:11]:mvxL0_mbAddrB_dout[21:11];	
					1:if(subMbPartIdx == 0)	
						mvpBx_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvxL0_CurrMb0[21:11]:mvxL0_mbAddrB_dout[21:11];
					  else	mvpBx_L0 = mvxL0_CurrMb1[10:0];
					2:if(subMbPartIdx == 0)	
						mvpBx_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvxL0_CurrMb0[21:11]:mvxL0_mbAddrB_dout[21:11];
					  else	mvpBx_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvxL0_CurrMb1[10:0]:mvxL0_mbAddrB_dout[10:0];
					3:
						case(subMbPartIdx)
						0:mvpBx_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvxL0_CurrMb0[21:11]:mvxL0_mbAddrB_dout[21:11];
						1:mvpBx_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvxL0_CurrMb1[10:0]:mvxL0_mbAddrB_dout[10:0];
						2:mvpBx_L0 = mvxL0_CurrMb1[10:0];
						3:mvpBx_L0 = mvxL0_CurrMb1[21:11];
						endcase
					endcase
				2:	case (sub_mb_type)
					0:mvpBx_L0 = mvxL0_CurrMb0[32:22];
					1:if(subMbPartIdx == 0)	
						mvpBx_L0 = mvxL0_CurrMb0[32:22];
					  else	mvpBx_L0 = mvxL0_CurrMb2[10:0];
					2:if(subMbPartIdx == 0)	
						mvpBx_L0 = mvxL0_CurrMb0[32:22];
					  else	mvpBx_L0 = mvxL0_CurrMb0[43:33];
					3:
						case(subMbPartIdx)
						0:mvpBx_L0 = mvxL0_CurrMb0[32:22];
						1:mvpBx_L0 = mvxL0_CurrMb0[43:33];
						2:mvpBx_L0 = mvxL0_CurrMb2[10:0];
						3:mvpBx_L0 = mvxL0_CurrMb2[21:11];
						endcase
					endcase
				3:	case (sub_mb_type)
					0:mvpBx_L0 = mvxL0_CurrMb1[32:22];
					1:if(subMbPartIdx == 0)	
						mvpBx_L0 = mvxL0_CurrMb1[32:22];
					  else	mvpBx_L0 = mvxL0_CurrMb3[10:0];
					2:if(subMbPartIdx == 0)	
						mvpBx_L0 = mvxL0_CurrMb1[32:22];
					  else	mvpBx_L0 = mvxL0_CurrMb1[43:33];
					3:
						case(subMbPartIdx)
						0:mvpBx_L0 = mvxL0_CurrMb1[32:22];
						1:mvpBx_L0 = mvxL0_CurrMb1[43:33];
						2:mvpBx_L0 = mvxL0_CurrMb3[10:0];
						3:mvpBx_L0 = mvxL0_CurrMb3[21:11];
						endcase
					endcase
				endcase
			default:mvpBx_L0 = 0;
			endcase
		else
			case(mb_type_general)
			`MB_Inter16x16:mvpBy_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[43:33];
			`MB_Inter16x8: 
				if(mbPartIdx == 0)	mvpBy_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[43:33];
				else			mvpBy_L0 = mvyL0_CurrMb0[32:22];
			`MB_Inter8x16:
				if(mbPartIdx == 0)	mvpBy_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[43:33];
				else			mvpBy_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvyL0_CurrMb0[10:0]:mvyL0_mbAddrB_dout[21:11];
			`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
				if (SubMbPredMode == `B_sub_Direct && slice_type == `slice_type_b)
					mvpBy_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[43:33];
				else
				case (mbPartIdx)
				0:	case(sub_mb_type)
					0:	mvpBy_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[43:33];
					1:if(subMbPartIdx == 0)	
						mvpBy_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[43:33];
					  else	mvpBy_L0 = mvyL0_CurrMb0[10:0];
					2:if(subMbPartIdx == 0)
						mvpBy_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[43:33];
					  else	mvpBy_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvyL0_CurrMb0[10:0]:mvyL0_mbAddrB_dout[32:22];	
					3:
						case(subMbPartIdx)	
						0:mvpBy_L0 = mvpBL0_is_0?0:mvpBL0_is_A?mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[43:33];
						1:mvpBy_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvyL0_CurrMb0[10:0]:mvyL0_mbAddrB_dout[32:22];	
						2:mvpBy_L0 = mvyL0_CurrMb0[10:0];
						3:mvpBy_L0 = mvyL0_CurrMb0[21:11];
						endcase
					endcase
				1:	case(sub_mb_type)
					0:mvpBy_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvyL0_CurrMb0[21:11]:mvyL0_mbAddrB_dout[21:11];	
					1:if(subMbPartIdx == 0)	
						mvpBy_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvyL0_CurrMb0[21:11]:mvyL0_mbAddrB_dout[21:11];
					  else	mvpBy_L0 = mvyL0_CurrMb1[10:0];
					2:if(subMbPartIdx == 0)	
						mvpBy_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvyL0_CurrMb0[21:11]:mvyL0_mbAddrB_dout[21:11];
					  else	mvpBy_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvyL0_CurrMb1[10:0]:mvyL0_mbAddrB_dout[10:0];
					3:
						case(subMbPartIdx)
						0:mvpBy_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvyL0_CurrMb0[21:11]:mvyL0_mbAddrB_dout[21:11];
						1:mvpBy_L0 = mvpBL0_is_0?0:mb_num_v == 0?mvyL0_CurrMb1[10:0]:mvyL0_mbAddrB_dout[10:0];
						2:mvpBy_L0 = mvyL0_CurrMb1[10:0];
						3:mvpBy_L0 = mvyL0_CurrMb1[21:11];
						endcase
					endcase
				2:	case (sub_mb_type)
					0:mvpBy_L0 = mvyL0_CurrMb0[32:22];
					1:if(subMbPartIdx == 0)	
						mvpBy_L0 = mvyL0_CurrMb0[32:22];
					  else	mvpBy_L0 = mvyL0_CurrMb2[10:0];
					2:if(subMbPartIdx == 0)	
						mvpBy_L0 = mvyL0_CurrMb0[32:22];
					  else	mvpBy_L0 = mvyL0_CurrMb0[43:33];
					3:
						case(subMbPartIdx)
						0:mvpBy_L0 = mvyL0_CurrMb0[32:22];
						1:mvpBy_L0 = mvyL0_CurrMb0[43:33];
						2:mvpBy_L0 = mvyL0_CurrMb2[10:0];
						3:mvpBy_L0 = mvyL0_CurrMb2[21:11];
						endcase
					endcase
				3:	case (sub_mb_type)
					0:mvpBy_L0 = mvyL0_CurrMb1[32:22];
					1:if(subMbPartIdx == 0)	
						mvpBy_L0 = mvyL0_CurrMb1[32:22];
					  else	mvpBy_L0 = mvyL0_CurrMb3[10:0];
					2:if(subMbPartIdx == 0)	
						mvpBy_L0 = mvyL0_CurrMb1[32:22];
					  else	mvpBy_L0 = mvyL0_CurrMb1[43:33];
					3:
						case(subMbPartIdx)
						0:mvpBy_L0 = mvyL0_CurrMb1[32:22];
						1:mvpBy_L0 = mvyL0_CurrMb1[43:33];
						2:mvpBy_L0 = mvyL0_CurrMb3[10:0];
						3:mvpBy_L0 = mvyL0_CurrMb3[21:11];
						endcase
					endcase
				endcase
			default:mvpBy_L0 = 0;
			endcase
	end

wire mvpBL1_is_0,mvpBL1_is_A;
assign mvpBL1_is_0 = (mb_num_h == 0 && mb_num_v == 0)||(mb_num_v != 0 && MBTypeGen_mbAddrB[1] == 1)||(mb_num_v != 0 && predFlagL1_B == 0)||
		     (mb_num_v == 0 && mb_num_h != 0 && (MBTypeGen_mbAddrA[1] == 1 || predFlagL1_A == 0));
assign mvpBL1_is_A =  mb_num_v == 0 && mb_num_h != 0 && MBTypeGen_mbAddrA[1] == 0 && predFlagL1_A == 1;

always @ (Is_skipMB_mv_calc or mb_pred_state or sub_mb_pred_state or mvpBL1_is_0 or mvpBL1_is_A or mb_num_v 
	or mb_type_general or sub_mb_type or mbPartIdx or subMbPartIdx or compIdx or SubMbPredMode or slice_type
	or mvxL1_mbAddrA or mvxL1_mbAddrB_dout or mvyL1_mbAddrA or mvyL1_mbAddrB_dout
	or mvxL1_CurrMb0 or mvxL1_CurrMb1 or mvxL1_CurrMb2 or mvxL1_CurrMb3 or mvyL1_CurrMb0 or mvyL1_CurrMb1 or mvyL1_CurrMb2 or mvyL1_CurrMb3)	
	if (Is_skipMB_mv_calc)begin
		mvpBx_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[43:33];
		mvpBy_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[43:33];end
	else if(mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)begin
		if(compIdx == 0)
			case(mb_type_general)
			`MB_Inter16x16:mvpBx_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[43:33];
			`MB_Inter16x8: 
				if(mbPartIdx == 0)	mvpBx_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[43:33];
				else			mvpBx_L1 = mvxL1_CurrMb0[32:22];
			`MB_Inter8x16:
				if(mbPartIdx == 0)	mvpBx_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[43:33];
				else			mvpBx_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvxL1_CurrMb0[10:0]:mvxL1_mbAddrB_dout[21:11];
			`MB_B_8x8:
				if (SubMbPredMode == `B_sub_Direct)
					mvpBx_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[43:33];
				else
				case (mbPartIdx)
				0:	case(sub_mb_type)
					0:	mvpBx_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[43:33];
					1:if(subMbPartIdx == 0)	
						mvpBx_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[43:33];
					  else	mvpBx_L1 = mvxL1_CurrMb0[10:0];
					2:if(subMbPartIdx == 0)
						mvpBx_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[43:33];
					  else	mvpBx_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvxL1_CurrMb0[10:0]:mvxL1_mbAddrB_dout[32:22];	
					3:
						case(subMbPartIdx)	
						0:mvpBx_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[43:33];
						1:mvpBx_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvxL1_CurrMb0[10:0]:mvxL1_mbAddrB_dout[32:22];	
						2:mvpBx_L1 = mvxL1_CurrMb0[10:0];
						3:mvpBx_L1 = mvxL1_CurrMb0[21:11];
						endcase
					endcase
				1:	case(sub_mb_type)
					0:mvpBx_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvxL1_CurrMb0[21:11]:mvxL1_mbAddrB_dout[21:11];	
					1:if(subMbPartIdx == 0)	
						mvpBx_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvxL1_CurrMb0[21:11]:mvxL1_mbAddrB_dout[21:11];
					  else	mvpBx_L1 = mvxL1_CurrMb1[10:0];
					2:if(subMbPartIdx == 0)	
						mvpBx_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvxL1_CurrMb0[21:11]:mvxL1_mbAddrB_dout[21:11];
					  else	mvpBx_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvxL1_CurrMb1[10:0]:mvxL1_mbAddrB_dout[10:0];
					3:
						case(subMbPartIdx)
						0:mvpBx_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvxL1_CurrMb0[21:11]:mvxL1_mbAddrB_dout[21:11];
						1:mvpBx_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvxL1_CurrMb1[10:0]:mvxL1_mbAddrB_dout[10:0];
						2:mvpBx_L1 = mvxL1_CurrMb1[10:0];
						3:mvpBx_L1 = mvxL1_CurrMb1[21:11];
						endcase
					endcase
				2:	case (sub_mb_type)
					0:mvpBx_L1 = mvxL1_CurrMb0[32:22];
					1:if(subMbPartIdx == 0)	
						mvpBx_L1 = mvxL1_CurrMb0[32:22];
					  else	mvpBx_L1 = mvxL1_CurrMb2[10:0];
					2:if(subMbPartIdx == 0)	
						mvpBx_L1 = mvxL1_CurrMb0[32:22];
					  else	mvpBx_L1 = mvxL1_CurrMb0[43:33];
					3:
						case(subMbPartIdx)
						0:mvpBx_L1 = mvxL1_CurrMb0[32:22];
						1:mvpBx_L1 = mvxL1_CurrMb0[43:33];
						2:mvpBx_L1 = mvxL1_CurrMb2[10:0];
						3:mvpBx_L1 = mvxL1_CurrMb2[21:11];
						endcase
					endcase
				3:	case (sub_mb_type)
					0:mvpBx_L1 = mvxL1_CurrMb1[32:22];
					1:if(subMbPartIdx == 0)	
						mvpBx_L1 = mvxL1_CurrMb1[32:22];
					  else	mvpBx_L1 = mvxL1_CurrMb3[10:0];
					2:if(subMbPartIdx == 0)	
						mvpBx_L1 = mvxL1_CurrMb1[32:22];
					  else	mvpBx_L1 = mvxL1_CurrMb1[43:33];
					3:
						case(subMbPartIdx)
						0:mvpBx_L1 = mvxL1_CurrMb1[32:22];
						1:mvpBx_L1 = mvxL1_CurrMb1[43:33];
						2:mvpBx_L1 = mvxL1_CurrMb3[10:0];
						3:mvpBx_L1 = mvxL1_CurrMb3[21:11];
						endcase
					endcase
				endcase
			default:;
			endcase
		else
			case(mb_type_general)
			`MB_Inter16x16:mvpBy_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[43:33];
			`MB_Inter16x8: 
				if(mbPartIdx == 0)	mvpBy_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[43:33];
				else			mvpBy_L1 = mvyL1_CurrMb0[32:22];
			`MB_Inter8x16:
				if(mbPartIdx == 0)	mvpBy_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[43:33];
				else			mvpBy_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvyL1_CurrMb0[10:0]:mvyL1_mbAddrB_dout[21:11];
			`MB_B_8x8:
				if (SubMbPredMode == `B_sub_Direct)
					mvpBy_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[43:33];
				else
				case (mbPartIdx)
				0:	case(sub_mb_type)
					0:	mvpBy_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[43:33];
					1:if(subMbPartIdx == 0)	
						mvpBy_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[43:33];
					  else	mvpBy_L1 = mvyL1_CurrMb0[10:0];
					2:if(subMbPartIdx == 0)
						mvpBy_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[43:33];
					  else	mvpBy_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvyL1_CurrMb0[10:0]:mvyL1_mbAddrB_dout[32:22];	
					3:
						case(subMbPartIdx)	
						0:mvpBy_L1 = mvpBL1_is_0?0:mvpBL1_is_A?mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[43:33];
						1:mvpBy_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvyL1_CurrMb0[10:0]:mvyL1_mbAddrB_dout[32:22];	
						2:mvpBy_L1 = mvyL1_CurrMb0[10:0];
						3:mvpBy_L1 = mvyL1_CurrMb0[21:11];
						endcase
					endcase
				1:	case(sub_mb_type)
					0:mvpBy_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvyL1_CurrMb0[21:11]:mvyL1_mbAddrB_dout[21:11];	
					1:if(subMbPartIdx == 0)	
						mvpBy_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvyL1_CurrMb0[21:11]:mvyL1_mbAddrB_dout[21:11];
					  else	mvpBy_L1 = mvyL1_CurrMb1[10:0];
					2:if(subMbPartIdx == 0)	
						mvpBy_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvyL1_CurrMb0[21:11]:mvyL1_mbAddrB_dout[21:11];
					  else	mvpBy_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvyL1_CurrMb1[10:0]:mvyL1_mbAddrB_dout[10:0];
					3:
						case(subMbPartIdx)
						0:mvpBy_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvyL1_CurrMb0[21:11]:mvyL1_mbAddrB_dout[21:11];
						1:mvpBy_L1 = mvpBL1_is_0?0:mb_num_v == 0?mvyL1_CurrMb1[10:0]:mvyL1_mbAddrB_dout[10:0];
						2:mvpBy_L1 = mvyL1_CurrMb1[10:0];
						3:mvpBy_L1 = mvyL1_CurrMb1[21:11];
						endcase
					endcase
				2:	case (sub_mb_type)
					0:mvpBy_L1 = mvyL1_CurrMb0[32:22];
					1:if(subMbPartIdx == 0)	
						mvpBy_L1 = mvyL1_CurrMb0[32:22];
					  else	mvpBy_L1 = mvyL1_CurrMb2[10:0];
					2:if(subMbPartIdx == 0)	
						mvpBy_L1 = mvyL1_CurrMb0[32:22];
					  else	mvpBy_L1 = mvyL1_CurrMb0[43:33];
					3:
						case(subMbPartIdx)
						0:mvpBy_L1 = mvyL1_CurrMb0[32:22];
						1:mvpBy_L1 = mvyL1_CurrMb0[43:33];
						2:mvpBy_L1 = mvyL1_CurrMb2[10:0];
						3:mvpBy_L1 = mvyL1_CurrMb2[21:11];
						endcase
					endcase
				3:	case (sub_mb_type)
					0:mvpBy_L1 = mvyL1_CurrMb1[32:22];
					1:if(subMbPartIdx == 0)	
						mvpBy_L1 = mvyL1_CurrMb1[32:22];
					  else	mvpBy_L1 = mvyL1_CurrMb3[10:0];
					2:if(subMbPartIdx == 0)	
						mvpBy_L1 = mvyL1_CurrMb1[32:22];
					  else	mvpBy_L1 = mvyL1_CurrMb1[43:33];
					3:
						case(subMbPartIdx)
						0:mvpBy_L1 = mvyL1_CurrMb1[32:22];
						1:mvpBy_L1 = mvyL1_CurrMb1[43:33];
						2:mvpBy_L1 = mvyL1_CurrMb3[10:0];
						3:mvpBy_L1 = mvyL1_CurrMb3[21:11];
						endcase
					endcase
				endcase
			default:;
			endcase
	end





//--------------------------------------
//mvcx
//--------------------------------------
wire mvpCL0_is_0,mvpCL0_is_A,mvpCL0_is_D,B_unavali_L0;
assign mvpCL0_is_0 = (mb_num_h == 0 && mb_num_v == 0)||
		     (mb_num_v != 0 && mb_num_h != pic_width_in_mbs_minus1 && (MBTypeGen_mbAddrC[1] == 1||predFlagL0_C == 0))||
		     (mb_num_v != 0 && mb_num_h == pic_width_in_mbs_minus1 && (MBTypeGen_mbAddrD == 1||predFlagL0_D == 0))||
		     (mb_num_v == 0 && mb_num_h != 0 && (MBTypeGen_mbAddrA[1] == 1 || predFlagL0_A == 0));

assign mvpCL0_is_A =  mb_num_v == 0 && mb_num_h != 0 && MBTypeGen_mbAddrA[1] == 0 && predFlagL0_A == 1;
assign mvpCL0_is_D = mb_num_v != 0 && mb_num_h == pic_width_in_mbs_minus1 ;
assign B_unavali_L0 = (mb_num_h == 0 && mb_num_v == 0)||(mb_num_v != 0&&(MBTypeGen_mbAddrB[1] == 1||predFlagL0_C == 0))
			||(mb_num_v == 0 && mb_num_h != 0 && (MBTypeGen_mbAddrA[1] == 1 || predFlagL0_A == 0));

always @ (Is_skipMB_mv_calc or mb_pred_state or sub_mb_pred_state or mvpCL0_is_0 or mvpCL0_is_A or mvpCL0_is_D or B_unavali_L0
	or mb_type_general or sub_mb_type or mbPartIdx or subMbPartIdx or compIdx or mb_num_v or mb_num_h or MBTypeGen_mbAddrB or MBTypeGen_mbAddrC
	or MBTypeGen_mbAddrA or MBTypeGen_mbAddrD or predFlagL0_B or predFlagL0_C or predFlagL0_A or predFlagL0_D
	or mvxL0_mbAddrD_dout or mvxL0_mbAddrC_dout or mvxL0_mbAddrB_dout or mvxL0_mbAddrA or pic_width_in_mbs_minus1
	or mvyL0_mbAddrD_dout or mvyL0_mbAddrC_dout or mvyL0_mbAddrB_dout or mvyL0_mbAddrA or SubMbPredMode or slice_type
	or mvxL0_CurrMb0 or mvxL0_CurrMb1 or mvxL0_CurrMb2 or mvxL0_CurrMb3 or mvyL0_CurrMb0 or mvyL0_CurrMb1 or mvyL0_CurrMb2 or mvyL0_CurrMb3)	
	if (Is_skipMB_mv_calc)begin
		mvpCx_L0 = mvpCL0_is_0 ? 0: mvpCL0_is_A ? mvxL0_mbAddrA[10:0]:mvpCL0_is_D ? mvxL0_mbAddrD_dout[10:0]:mvxL0_mbAddrC_dout[43:33];
		mvpCy_L0 = mvpCL0_is_0 ? 0: mvpCL0_is_A ? mvyL0_mbAddrA[10:0]:mvpCL0_is_D ? mvyL0_mbAddrD_dout[10:0]:mvyL0_mbAddrC_dout[43:33];end
	else if(mb_pred_state == `mvd_l0_s || sub_mb_pred_state == `sub_mvd_l0_s)begin
		if(compIdx == 0)
			case(mb_type_general)
			`MB_Inter16x16:mvpCx_L0 = mvpCL0_is_0 ?0: mvpCL0_is_A ? mvxL0_mbAddrA[10:0]:mvpCL0_is_D ? mvxL0_mbAddrD_dout[10:0]:mvxL0_mbAddrC_dout[43:33];
			`MB_Inter16x8:
				if(mbPartIdx == 0)
					mvpCx_L0 = mvpCL0_is_0 ?0: mvpCL0_is_A ? mvxL0_mbAddrA[10:0]:mvpCL0_is_D ? mvxL0_mbAddrD_dout[10:0]:mvxL0_mbAddrC_dout[43:33];
				else	mvpCx_L0 = mb_num_v != 0 && mb_num_h != 0 && MBTypeGen_mbAddrA[1] == 0 && predFlagL0_D == 1?mvxL0_mbAddrA[21:11]:0 ;//mvxL0_CurrMb0[32:22];
			`MB_Inter8x16: 
				if(mbPartIdx == 0) 
					mvpCx_L0 = B_unavali_L0?0: mvpCL0_is_A ? mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[21:11];
				else 	mvpCx_L0 = mb_num_v == 0 ? mvxL0_CurrMb0[21:11]:
						   mb_num_h != pic_width_in_mbs_minus1?(predFlagL0_C?mvxL0_mbAddrC_dout[43:33]:0):
						   MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1 ? mvxL0_mbAddrB_dout[32:22]:0;
			`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
				if (SubMbPredMode == `B_sub_Direct && slice_type == `slice_type_b)
					mvpCx_L0 = mvpCL0_is_0 ? 0: mvpCL0_is_A ? mvxL0_mbAddrA[10:0]:mvpCL0_is_D ? mvxL0_mbAddrD_dout[10:0]:mvxL0_mbAddrC_dout[43:33];
				else
				case (mbPartIdx)
				0:	case (sub_mb_type)
					0:mvpCx_L0 = B_unavali_L0 ?0: mvpCL0_is_A ? mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[21:11];
					1:if (subMbPartIdx == 0)
						mvpCx_L0 = B_unavali_L0 ?0: mvpCL0_is_A ? mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[21:11];
					  else	mvpCx_L0 = mb_num_h == 0 || MBTypeGen_mbAddrA[1] == 1 || predFlagL0_A == 0 ? 0:mvxL0_mbAddrA[10:0];
					2:if (subMbPartIdx == 0)
						mvpCx_L0 = B_unavali_L0 ?0: mvpCL0_is_A ? mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[32:22];
					  else  mvpCx_L0 = mb_num_v == 0 ? mvxL0_CurrMb0[10:0]:mvxL0_mbAddrB_dout[21:11];
					3:	case(subMbPartIdx)
						0:mvpCx_L0 = B_unavali_L0 ?0: mvpCL0_is_A ? mvxL0_mbAddrA[10:0]:mvxL0_mbAddrB_dout[32:22];
						1:mvpCx_L0 = mb_num_v == 0 ? mvxL0_CurrMb0[10:0]:mvxL0_mbAddrB_dout[21:11];
						2:mvpCx_L0 = mvxL0_CurrMb0[21:11];
						3:mvpCx_L0 = mvxL0_CurrMb0[10:0];
						endcase
					endcase
				1:	case (sub_mb_type)
					0:mvpCx_L0 = mb_num_v == 0 ? mvxL0_CurrMb0[21:11]:mb_num_h != pic_width_in_mbs_minus1?(predFlagL0_C?mvxL0_mbAddrC_dout[43:33]:0):
						     MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1 ? mvxL0_mbAddrB_dout[32:22]:0;
					1:if(subMbPartIdx == 0)
						mvpCx_L0 = mb_num_v == 0 ? mvxL0_CurrMb0[21:11]:mb_num_h != pic_width_in_mbs_minus1?(predFlagL0_C?mvxL0_mbAddrC_dout[43:33]:0):
						     MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1 ? mvxL0_mbAddrB_dout[32:22]:0;
					  else	mvpCx_L0 = mvxL0_CurrMb0[21:11];
					2:if(subMbPartIdx == 0)
						mvpCx_L0 = mb_num_v == 0?mvxL0_CurrMb0[21:11]:MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1?mvxL0_mbAddrB_dout[10:0]:0;
					  else	mvpCx_L0 = mb_num_v == 0?mvxL0_CurrMb1[10:0]:mb_num_h != pic_width_in_mbs_minus1?
						 (predFlagL0_C?mvxL0_mbAddrC_dout[43:33]:0):MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1?mvxL0_mbAddrB_dout[21:11]:0;
					3:	case(subMbPartIdx)
						0:mvpCx_L0 = mb_num_v == 0?mvxL0_CurrMb0[21:11]:MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1?mvxL0_mbAddrB_dout[10:0]:0;
						1:mvpCx_L0 = mb_num_v == 0?mvxL0_CurrMb1[10:0]:mb_num_h != pic_width_in_mbs_minus1?
						(predFlagL0_C?mvxL0_mbAddrC_dout[43:33]:0):MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1?mvxL0_mbAddrB_dout[21:11]:0;
						2:mvpCx_L0 = mvxL0_CurrMb1[21:11];
						3:mvpCx_L0 = mvxL0_CurrMb1[10:0];
						endcase
					endcase
				2:	case (sub_mb_type)
					0:mvpCx_L0 = mvxL0_CurrMb1[32:22];
					1:if(subMbPartIdx == 0) mvpCx_L0 = mvxL0_CurrMb1[32:22];
					  else	mvpCx_L0 = mb_num_h == 0 || MBTypeGen_mbAddrA[1] == 1 || predFlagL0_A == 0 ? 0:mvxL0_mbAddrA[32:22];
					2:if(subMbPartIdx == 0) mvpCx_L0 = mvxL0_CurrMb0[43:33];
					  else	mvpCx_L0 = mvxL0_CurrMb1[32:22];
					3:	case(subMbPartIdx)
						0:mvpCx_L0 = mvxL0_CurrMb0[43:33];
						1:mvpCx_L0 = mvxL0_CurrMb1[32:22];
						2:mvpCx_L0 = mvxL0_CurrMb2[21:11];
						3:mvpCx_L0 = mvxL0_CurrMb2[10:0];
						endcase
					endcase
				3:	case (sub_mb_type)
					0:mvpCx_L0 = mvxL0_CurrMb0[43:33];
					1:if(subMbPartIdx == 0) mvpCx_L0 = mvxL0_CurrMb0[43:33];
					  else			mvpCx_L0 = mvxL0_CurrMb2[21:11];
					2:if(subMbPartIdx == 0) mvpCx_L0 = mvxL0_CurrMb1[43:33];
					  else			mvpCx_L0 = mvxL0_CurrMb1[32:22];
					3:	case(subMbPartIdx)
						0:mvpCx_L0 = mvxL0_CurrMb1[43:33];
						1:mvpCx_L0 = mvxL0_CurrMb1[32:22];
						2:mvpCx_L0 = mvxL0_CurrMb2[21:11];
						3:mvpCx_L0 = mvxL0_CurrMb3[10:0];
						endcase
					endcase
				endcase	
			default:;endcase						
		else	case(mb_type_general)
			`MB_Inter16x16:mvpCy_L0 = mvpCL0_is_0 ?0: mvpCL0_is_A ? mvyL0_mbAddrA[10:0]:mvpCL0_is_D ? mvyL0_mbAddrD_dout[10:0]:mvyL0_mbAddrC_dout[43:33];
			`MB_Inter16x8:
				if(mbPartIdx == 0)
					mvpCy_L0 = mvpCL0_is_0 ?0: mvpCL0_is_A ? mvyL0_mbAddrA[10:0]:mvpCL0_is_D ? mvyL0_mbAddrD_dout[10:0]:mvyL0_mbAddrC_dout[43:33];
				else	mvpCy_L0 = mb_num_v != 0 && mb_num_h != 0 && MBTypeGen_mbAddrA[1] == 0 && predFlagL0_D == 1?mvyL0_mbAddrA[21:11]:0 ;//mvyL0_CurrMb0[32:22];
			`MB_Inter8x16: 
				if(mbPartIdx == 0) 
					mvpCy_L0 = B_unavali_L0?0: mvpCL0_is_A ? mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[21:11];
				else 	mvpCy_L0 = mb_num_v == 0 ? mvyL0_CurrMb0[21:11]:
						   mb_num_h != pic_width_in_mbs_minus1?(predFlagL0_C?mvyL0_mbAddrC_dout[43:33]:0):
						   MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1 ? mvyL0_mbAddrB_dout[32:22]:0;
			`MB_P_8x8,`MB_B_8x8,`MB_P_8x8ref0:
				if (SubMbPredMode == `B_sub_Direct && slice_type == `slice_type_b)
					mvpCy_L0 = mvpCL0_is_0 ? 0: mvpCL0_is_A ? mvyL0_mbAddrA[10:0]:mvpCL0_is_D ? mvyL0_mbAddrD_dout[10:0]:mvyL0_mbAddrC_dout[43:33];
				else
				case (mbPartIdx)
				0:	case (sub_mb_type)
					0:mvpCy_L0 = B_unavali_L0 ?0: mvpCL0_is_A ? mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[21:11];
					1:if (subMbPartIdx == 0)
						mvpCy_L0 = B_unavali_L0 ?0: mvpCL0_is_A ? mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[21:11];
					  else	mvpCy_L0 = mb_num_h == 0 || MBTypeGen_mbAddrA[1] == 1 || predFlagL0_A == 0 ? 0:mvyL0_mbAddrA[10:0];
					2:if (subMbPartIdx == 0)
						mvpCy_L0 = B_unavali_L0 ?0: mvpCL0_is_A ? mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[32:22];
					  else  mvpCy_L0 = mb_num_v == 0 ? mvyL0_CurrMb0[10:0]:mvyL0_mbAddrB_dout[21:11];
					3:	case(subMbPartIdx)
						0:mvpCy_L0 = B_unavali_L0 ?0: mvpCL0_is_A ? mvyL0_mbAddrA[10:0]:mvyL0_mbAddrB_dout[32:22];
						1:mvpCy_L0 = mb_num_v == 0 ? mvyL0_CurrMb0[10:0]:mvyL0_mbAddrB_dout[21:11];
						2:mvpCy_L0 = mvyL0_CurrMb0[21:11];
						3:mvpCy_L0 = mvyL0_CurrMb0[10:0];
						endcase
					endcase
				1:	case (sub_mb_type)
					0:mvpCy_L0 = mb_num_v == 0 ? mvyL0_CurrMb0[21:11]:mb_num_h != pic_width_in_mbs_minus1?(predFlagL0_C?mvyL0_mbAddrC_dout[43:33]:0):
						     MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1 ? mvyL0_mbAddrB_dout[32:22]:0;
					1:if(subMbPartIdx == 0)
						mvpCy_L0 = mb_num_v == 0 ? mvyL0_CurrMb0[21:11]:mb_num_h != pic_width_in_mbs_minus1?(predFlagL0_C?mvyL0_mbAddrC_dout[43:33]:0):
						     MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1 ? mvyL0_mbAddrB_dout[32:22]:0;
					  else	mvpCy_L0 = mvyL0_CurrMb0[21:11];
					2:if(subMbPartIdx == 0)
						mvpCy_L0 = mb_num_v == 0?mvyL0_CurrMb0[21:11]:MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1?mvyL0_mbAddrB_dout[10:0]:0;
					  else	mvpCy_L0 = mb_num_v == 0?mvyL0_CurrMb1[10:0]:mb_num_h != pic_width_in_mbs_minus1?
						 (predFlagL0_C?mvyL0_mbAddrC_dout[43:33]:0):MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1?mvyL0_mbAddrB_dout[21:11]:0;
					3:	case(subMbPartIdx)
						0:mvpCy_L0 = mb_num_v == 0?mvyL0_CurrMb0[21:11]:MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1?mvyL0_mbAddrB_dout[10:0]:0;
						1:mvpCy_L0 = mb_num_v == 0?mvyL0_CurrMb1[10:0]:mb_num_h != pic_width_in_mbs_minus1?
						(predFlagL0_C?mvyL0_mbAddrC_dout[43:33]:0):MBTypeGen_mbAddrB[1] == 0 && predFlagL0_B == 1?mvyL0_mbAddrB_dout[21:11]:0;
						2:mvpCy_L0 = mvyL0_CurrMb1[21:11];
						3:mvpCy_L0 = mvyL0_CurrMb1[10:0];
						endcase
					endcase
				2:	case (sub_mb_type)
					0:mvpCy_L0 = mvyL0_CurrMb1[32:22];
					1:if(subMbPartIdx == 0) mvpCy_L0 = mvyL0_CurrMb1[32:22];
					  else	mvpCy_L0 = mb_num_h == 0 || MBTypeGen_mbAddrA[1] == 1 || predFlagL0_A == 0 ? 0:mvyL0_mbAddrA[32:22];
					2:if(subMbPartIdx == 0) mvpCy_L0 = mvyL0_CurrMb0[43:33];
					  else	mvpCy_L0 = mvyL0_CurrMb1[32:22];
					3:	case(subMbPartIdx)
						0:mvpCy_L0 = mvyL0_CurrMb0[43:33];
						1:mvpCy_L0 = mvyL0_CurrMb1[32:22];
						2:mvpCy_L0 = mvyL0_CurrMb2[21:11];
						3:mvpCy_L0 = mvyL0_CurrMb2[10:0];
						endcase
					endcase
				3:	case (sub_mb_type)
					0:mvpCy_L0 = mvyL0_CurrMb0[43:33];
					1:if(subMbPartIdx == 0) mvpCy_L0 = mvyL0_CurrMb0[43:33];
					  else			mvpCy_L0 = mvyL0_CurrMb2[21:11];
					2:if(subMbPartIdx == 0) mvpCy_L0 = mvyL0_CurrMb1[43:33];
					  else			mvpCy_L0 = mvyL0_CurrMb1[32:22];
					3:	case(subMbPartIdx)
						0:mvpCy_L0 = mvyL0_CurrMb1[43:33];
						1:mvpCy_L0 = mvyL0_CurrMb1[32:22];
						2:mvpCy_L0 = mvyL0_CurrMb2[21:11];
						3:mvpCy_L0 = mvyL0_CurrMb3[10:0];
						endcase
					endcase
				endcase
			default:;endcase									
	end

wire mvpCL1_is_0,mvpCL1_is_A,mvpCL1_is_D,B_unavali_L1;
assign mvpCL1_is_0 = (mb_num_h == 0 && mb_num_v == 0)||
		     (mb_num_v != 0 && mb_num_h != pic_width_in_mbs_minus1 && (MBTypeGen_mbAddrC[1] == 1||predFlagL1_C == 0))||
		     (mb_num_v != 0 && mb_num_h == pic_width_in_mbs_minus1 && (MBTypeGen_mbAddrD == 1||predFlagL1_D == 0))||
		     (mb_num_v == 0 && mb_num_h != 0 && (MBTypeGen_mbAddrA[1] == 1 || predFlagL1_A == 0));

assign mvpCL1_is_A =  mb_num_v == 0 && mb_num_h != 0 && MBTypeGen_mbAddrA[1] == 0 && predFlagL1_A == 1;
assign mvpCL1_is_D = mb_num_v != 0 && mb_num_h == pic_width_in_mbs_minus1 ;
assign B_unavali_L1 = (mb_num_h == 0 && mb_num_v == 0)||(mb_num_v != 0&&(MBTypeGen_mbAddrB[1] == 1||predFlagL1_C == 0))
			||(mb_num_v == 0 && mb_num_h != 0 && (MBTypeGen_mbAddrA[1] == 1 || predFlagL1_A == 0));

always @ (Is_skipMB_mv_calc or mb_pred_state or sub_mb_pred_state or mvpCL1_is_0 or mvpCL1_is_A or mvpCL1_is_D or B_unavali_L1
	or mb_type_general or sub_mb_type or mbPartIdx or subMbPartIdx or compIdx or mb_num_v or mb_num_h or MBTypeGen_mbAddrB or MBTypeGen_mbAddrC
	or MBTypeGen_mbAddrA or MBTypeGen_mbAddrD or predFlagL1_B or predFlagL1_C or predFlagL1_A or predFlagL1_D
	or mvxL1_mbAddrD_dout or mvxL1_mbAddrC_dout or mvxL1_mbAddrB_dout or mvxL1_mbAddrA or pic_width_in_mbs_minus1
	or mvyL1_mbAddrD_dout or mvyL1_mbAddrC_dout or mvyL1_mbAddrB_dout or mvyL1_mbAddrA or SubMbPredMode
	or mvxL1_CurrMb0 or mvxL1_CurrMb1 or mvxL1_CurrMb2 or mvxL1_CurrMb3 or mvyL1_CurrMb0 or mvyL1_CurrMb1 or mvyL1_CurrMb2 or mvyL1_CurrMb3)	
	if (Is_skipMB_mv_calc)begin
		mvpCx_L1 = mvpCL1_is_0 ? 0: mvpCL1_is_A ? mvxL1_mbAddrA[10:0]:mvpCL1_is_D ? mvxL1_mbAddrD_dout[10:0]:mvxL1_mbAddrC_dout[43:33];
		mvpCy_L1 = mvpCL1_is_0 ? 0: mvpCL1_is_A ? mvyL1_mbAddrA[10:0]:mvpCL1_is_D ? mvyL1_mbAddrD_dout[10:0]:mvyL1_mbAddrC_dout[43:33];end
	else if(mb_pred_state == `mvd_l1_s || sub_mb_pred_state == `sub_mvd_l1_s)begin
		if(compIdx == 0)
			case(mb_type_general)
			`MB_Inter16x16:mvpCx_L1 = mvpCL1_is_0 ?0: mvpCL1_is_A ? mvxL1_mbAddrA[10:0]:mvpCL1_is_D ? mvxL1_mbAddrD_dout[10:0]:mvxL1_mbAddrC_dout[43:33];
			`MB_Inter16x8:
				if(mbPartIdx == 0)
					mvpCx_L1 = mvpCL1_is_0 ?0: mvpCL1_is_A ? mvxL1_mbAddrA[10:0]:mvpCL1_is_D ? mvxL1_mbAddrD_dout[10:0]:mvxL1_mbAddrC_dout[43:33];
				else	mvpCx_L1 = mb_num_v != 0 && mb_num_h != 0 && MBTypeGen_mbAddrA[1] == 0 && predFlagL1_D == 1?mvxL1_mbAddrA[21:11]:0 ;//mvxL1L1_CurrMb0[32:22];
			`MB_Inter8x16: 
				if(mbPartIdx == 0) 
					mvpCx_L1 = B_unavali_L1?0: mvpCL1_is_A ? mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[21:11];
				else 	mvpCx_L1 = mb_num_v == 0 ? mvxL1_CurrMb0[21:11]:
						   mb_num_h != pic_width_in_mbs_minus1?(predFlagL1_C?mvxL1_mbAddrC_dout[43:33]:0):
						   MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1 ? mvxL1_mbAddrB_dout[32:22]:0;
			`MB_B_8x8:if (SubMbPredMode == `B_sub_Direct)
				mvpCx_L1 = mvpCL1_is_0 ? 0: mvpCL1_is_A ? mvxL1_mbAddrA[10:0]:mvpCL1_is_D ? mvxL1_mbAddrD_dout[10:0]:mvxL1_mbAddrC_dout[43:33];
				else
				case (mbPartIdx)
				0:	case (sub_mb_type)
					0:mvpCx_L1 = B_unavali_L1 ?0: mvpCL1_is_A ? mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[21:11];
					1:if (subMbPartIdx == 0)
						mvpCx_L1 = B_unavali_L1 ?0: mvpCL1_is_A ? mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[21:11];
					  else	mvpCx_L1 = mb_num_h == 0 || MBTypeGen_mbAddrA[1] == 1 || predFlagL1_A == 0 ? 0:mvxL1_mbAddrA[10:0];
					2:if (subMbPartIdx == 0)
						mvpCx_L1 = B_unavali_L1 ?0: mvpCL1_is_A ? mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[32:22];
					  else  mvpCx_L1 = mb_num_v == 0 ? mvxL1_CurrMb0[10:0]:mvxL1_mbAddrB_dout[21:11];
					3:	case(subMbPartIdx)
						0:mvpCx_L1 = B_unavali_L1 ?0: mvpCL1_is_A ? mvxL1_mbAddrA[10:0]:mvxL1_mbAddrB_dout[32:22];
						1:mvpCx_L1 = mb_num_v == 0 ? mvxL1_CurrMb0[10:0]:mvxL1_mbAddrB_dout[21:11];
						2:mvpCx_L1 = mvxL1_CurrMb0[21:11];
						3:mvpCx_L1 = mvxL1_CurrMb0[10:0];
						endcase
					endcase
				1:	case (sub_mb_type)
					0:mvpCx_L1 = mb_num_v == 0 ? mvxL1_CurrMb0[21:11]:mb_num_h != pic_width_in_mbs_minus1?(predFlagL1_C?mvxL1_mbAddrC_dout[43:33]:0):
						     MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1 ? mvxL1_mbAddrB_dout[32:22]:0;
					1:if(subMbPartIdx == 0)
						mvpCx_L1 = mb_num_v == 0 ? mvxL1_CurrMb0[21:11]:mb_num_h != pic_width_in_mbs_minus1?(predFlagL1_C?mvxL1_mbAddrC_dout[43:33]:0):
						     MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1 ? mvxL1_mbAddrB_dout[32:22]:0;
					  else	mvpCx_L1 = mvxL1_CurrMb0[21:11];
					2:if(subMbPartIdx == 0)
						mvpCx_L1 = mb_num_v == 0?mvxL1_CurrMb0[21:11]:MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1?mvxL1_mbAddrB_dout[10:0]:0;
					  else	mvpCx_L1 = mb_num_v == 0?mvxL1_CurrMb1[10:0]:mb_num_h != pic_width_in_mbs_minus1?
						 (predFlagL1_C?mvxL1_mbAddrC_dout[43:33]:0):MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1?mvxL1_mbAddrB_dout[21:11]:0;
					3:	case(subMbPartIdx)
						0:mvpCx_L1 = mb_num_v == 0?mvxL1_CurrMb0[21:11]:MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1?mvxL1_mbAddrB_dout[10:0]:0;
						1:mvpCx_L1 = mb_num_v == 0?mvxL1_CurrMb1[10:0]:mb_num_h != pic_width_in_mbs_minus1?
						(predFlagL1_C?mvxL1_mbAddrC_dout[43:33]:0):MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1?mvxL1_mbAddrB_dout[21:11]:0;
						2:mvpCx_L1 = mvxL1_CurrMb1[21:11];
						3:mvpCx_L1 = mvxL1_CurrMb1[10:0];
						endcase
					endcase
				2:	case (sub_mb_type)
					0:mvpCx_L1 = mvxL1_CurrMb1[32:22];
					1:if(subMbPartIdx == 0) mvpCx_L1 = mvxL1_CurrMb1[32:22];
					  else	mvpCx_L1 = mb_num_h == 0 || MBTypeGen_mbAddrA[1] == 1 || predFlagL1_A == 0 ? 0:mvxL1_mbAddrA[32:22];
					2:if(subMbPartIdx == 0) mvpCx_L1 = mvxL1_CurrMb0[43:33];
					  else	mvpCx_L1 = mvxL1_CurrMb1[32:22];
					3:	case(subMbPartIdx)
						0:mvpCx_L1 = mvxL1_CurrMb0[43:33];
						1:mvpCx_L1 = mvxL1_CurrMb1[32:22];
						2:mvpCx_L1 = mvxL1_CurrMb2[21:11];
						3:mvpCx_L1 = mvxL1_CurrMb2[10:0];
						endcase
					endcase
				3:	case (sub_mb_type)
					0:mvpCx_L1 = mvxL1_CurrMb0[43:33];
					1:if(subMbPartIdx == 0) mvpCx_L1 = mvxL1_CurrMb0[43:33];
					  else			mvpCx_L1 = mvxL1_CurrMb2[21:11];
					2:if(subMbPartIdx == 0) mvpCx_L1 = mvxL1_CurrMb1[43:33];
					  else			mvpCx_L1 = mvxL1_CurrMb1[32:22];
					3:	case(subMbPartIdx)
						0:mvpCx_L1 = mvxL1_CurrMb1[43:33];
						1:mvpCx_L1 = mvxL1_CurrMb1[32:22];
						2:mvpCx_L1 = mvxL1_CurrMb2[21:11];
						3:mvpCx_L1 = mvxL1_CurrMb3[10:0];
						endcase
					endcase
				endcase	
			default:;endcase						
		else	case(mb_type_general)
			`MB_Inter16x16:mvpCy_L1 = mvpCL1_is_0 ?0: mvpCL1_is_A ? mvyL1_mbAddrA[10:0]:mvpCL1_is_D ? mvyL1_mbAddrD_dout[10:0]:mvyL1_mbAddrC_dout[43:33];
			`MB_Inter16x8:
				if(mbPartIdx == 0)
					mvpCy_L1 = mvpCL1_is_0 ?0: mvpCL1_is_A ? mvyL1_mbAddrA[10:0]:mvpCL1_is_D ? mvyL1_mbAddrD_dout[10:0]:mvyL1_mbAddrC_dout[43:33];
				else	mvpCy_L1 = mb_num_v != 0 && mb_num_h != 0 && MBTypeGen_mbAddrA[1] == 0 && predFlagL1_D == 1?mvyL1_mbAddrA[21:11]:0 ;//mvyL1_CurrMb0[32:22];
			`MB_Inter8x16: 
				if(mbPartIdx == 0) 
					mvpCy_L1 = B_unavali_L1?0: mvpCL1_is_A ? mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[21:11];
				else 	mvpCy_L1 = mb_num_v == 0 ? mvyL1_CurrMb0[21:11]:
						   mb_num_h != pic_width_in_mbs_minus1?(predFlagL1_C?mvyL1_mbAddrC_dout[43:33]:0):
						   MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1 ? mvyL1_mbAddrB_dout[32:22]:0;
			`MB_B_8x8:if (SubMbPredMode == `B_sub_Direct)
				mvpCy_L1 = mvpCL1_is_0 ? 0: mvpCL1_is_A ? mvyL1_mbAddrA[10:0]:mvpCL1_is_D ? mvyL1_mbAddrD_dout[10:0]:mvyL1_mbAddrC_dout[43:33];
				else
				case (mbPartIdx)
				0:	case (sub_mb_type)
					0:mvpCy_L1 = B_unavali_L1 ?0: mvpCL1_is_A ? mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[21:11];
					1:if (subMbPartIdx == 0)
						mvpCy_L1 = B_unavali_L1 ?0: mvpCL1_is_A ? mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[21:11];
					  else	mvpCy_L1 = mb_num_h == 0 || MBTypeGen_mbAddrA[1] == 1 || predFlagL1_A == 0 ? 0:mvyL1_mbAddrA[10:0];
					2:if (subMbPartIdx == 0)
						mvpCy_L1 = B_unavali_L1 ?0: mvpCL1_is_A ? mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[32:22];
					  else  mvpCy_L1 = mb_num_v == 0 ? mvyL1_CurrMb0[10:0]:mvyL1_mbAddrB_dout[21:11];
					3:	case(subMbPartIdx)
						0:mvpCy_L1 = B_unavali_L1 ?0: mvpCL1_is_A ? mvyL1_mbAddrA[10:0]:mvyL1_mbAddrB_dout[32:22];
						1:mvpCy_L1 = mb_num_v == 0 ? mvyL1_CurrMb0[10:0]:mvyL1_mbAddrB_dout[21:11];
						2:mvpCy_L1 = mvyL1_CurrMb0[21:11];
						3:mvpCy_L1 = mvyL1_CurrMb0[10:0];
						endcase
					endcase
				1:	case (sub_mb_type)
					0:mvpCy_L1 = mb_num_v == 0 ? mvyL1_CurrMb0[21:11]:mb_num_h != pic_width_in_mbs_minus1?(predFlagL1_C?mvyL1_mbAddrC_dout[43:33]:0):
						     MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1 ? mvyL1_mbAddrB_dout[32:22]:0;
					1:if(subMbPartIdx == 0)
						mvpCy_L1 = mb_num_v == 0 ? mvyL1_CurrMb0[21:11]:mb_num_h != pic_width_in_mbs_minus1?(predFlagL1_C?mvyL1_mbAddrC_dout[43:33]:0):
						     MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1 ? mvyL1_mbAddrB_dout[32:22]:0;
					  else	mvpCy_L1 = mvyL1_CurrMb0[21:11];
					2:if(subMbPartIdx == 0)
						mvpCy_L1 = mb_num_v == 0?mvyL1_CurrMb0[21:11]:MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1?mvyL1_mbAddrB_dout[10:0]:0;
					  else	mvpCy_L1 = mb_num_v == 0?mvyL1_CurrMb1[10:0]:mb_num_h != pic_width_in_mbs_minus1?
						 (predFlagL1_C?mvyL1_mbAddrC_dout[43:33]:0):MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1?mvyL1_mbAddrB_dout[21:11]:0;
					3:	case(subMbPartIdx)
						0:mvpCy_L1 = mb_num_v == 0?mvyL1_CurrMb0[21:11]:MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1?mvyL1_mbAddrB_dout[10:0]:0;
						1:mvpCy_L1 = mb_num_v == 0?mvyL1_CurrMb1[10:0]:mb_num_h != pic_width_in_mbs_minus1?
						(predFlagL1_C?mvyL1_mbAddrC_dout[43:33]:0):MBTypeGen_mbAddrB[1] == 0 && predFlagL1_B == 1?mvyL1_mbAddrB_dout[21:11]:0;
						2:mvpCy_L1 = mvyL1_CurrMb1[21:11];
						3:mvpCy_L1 = mvyL1_CurrMb1[10:0];
						endcase
					endcase
				2:	case (sub_mb_type)
					0:mvpCy_L1 = mvyL1_CurrMb1[32:22];
					1:if(subMbPartIdx == 0) mvpCy_L1 = mvyL1_CurrMb1[32:22];
					  else	mvpCy_L1 = mb_num_h == 0 || MBTypeGen_mbAddrA[1] == 1 || predFlagL1_A == 0 ? 0:mvyL1_mbAddrA[32:22];
					2:if(subMbPartIdx == 0) mvpCy_L1 = mvyL1_CurrMb0[43:33];
					  else	mvpCy_L1 = mvyL1_CurrMb1[32:22];
					3:	case(subMbPartIdx)
						0:mvpCy_L1 = mvyL1_CurrMb0[43:33];
						1:mvpCy_L1 = mvyL1_CurrMb1[32:22];
						2:mvpCy_L1 = mvyL1_CurrMb2[21:11];
						3:mvpCy_L1 = mvyL1_CurrMb2[10:0];
						endcase
					endcase
				3:	case (sub_mb_type)
					0:mvpCy_L1 = mvyL1_CurrMb0[43:33];
					1:if(subMbPartIdx == 0) mvpCy_L1 = mvyL1_CurrMb0[43:33];
					  else			mvpCy_L1 = mvyL1_CurrMb2[21:11];
					2:if(subMbPartIdx == 0) mvpCy_L1 = mvyL1_CurrMb1[43:33];
					  else			mvpCy_L1 = mvyL1_CurrMb1[32:22];
					3:	case(subMbPartIdx)
						0:mvpCy_L1 = mvyL1_CurrMb1[43:33];
						1:mvpCy_L1 = mvyL1_CurrMb1[32:22];
						2:mvpCy_L1 = mvyL1_CurrMb2[21:11];
						3:mvpCy_L1 = mvyL1_CurrMb3[10:0];
						endcase
					endcase
				endcase
			default:;endcase	
	end




always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		mv_is16x16 <= 0;
	else if (mb_type_general == `MB_Inter16x16 || mb_type_general == `MB_P_skip || mb_type_general == `MB_B_skip)
		mv_is16x16 <= 1;
	else 
		mv_is16x16 <= 0;
	











			

endmodule
