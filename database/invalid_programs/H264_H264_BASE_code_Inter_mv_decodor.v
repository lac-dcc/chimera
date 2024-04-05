`include "timescale.v"
`include "define.v"

module Inter_mv_decodor(
input clk,reset_n,
input [1:0] nal_ref_idc,
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
input compIdx,
input Is_skip_run_entry,Is_skip_run_end,p_skip_end,
input [10:0] mvd,
input direct_spatial_mv_pred_flag,
input [1:0] td,tb,
input mv_mbAddrB_rd_for_DF,ref_idx_rd_for_DF,

output skip_mv_calc,mv_is16x16,
output Is_skipMB_mv_calc,

output [19:0] refIdxL0_curr,refIdxL1_curr,     
output [3:0] predFlagL0_curr,predFlagL1_curr,

output [9:0] refIdxL0_addrA,refIdxL1_addrA,refIdxL0_addrB_dout,refIdxL1_addrB_dout,
output [1:0] predFlagL0_addrA,predFlagL1_addrA,predFlagL0_addrB_dout,predFlagL1_addrB_dout,


output b_col_end,
output [43:0] mvxL0_mbAddrA,mvyL0_mbAddrA,mvxL1_mbAddrA,mvyL1_mbAddrA,

output [43:0] mvxL0_mbAddrB_dout,mvyL0_mbAddrB_dout,mvxL1_mbAddrB_dout,mvyL1_mbAddrB_dout,

output [43:0] mvxL0_CurrMb0,mvxL0_CurrMb1,mvxL0_CurrMb2,mvxL0_CurrMb3,
output [43:0] mvyL0_CurrMb0,mvyL0_CurrMb1,mvyL0_CurrMb2,mvyL0_CurrMb3,
output [43:0] mvxL1_CurrMb0,mvxL1_CurrMb1,mvxL1_CurrMb2,mvxL1_CurrMb3,
output [43:0] mvyL1_CurrMb0,mvyL1_CurrMb1,mvyL1_CurrMb2,mvyL1_CurrMb3
);



wire [9:0] refIdxL0_addrC_dout,refIdxL0_addrD_dout;
wire [9:0] refIdxL1_addrC_dout,refIdxL1_addrD_dout;
wire [1:0] predFlagL0_addrC_dout,predFlagL0_addrD_dout;
wire [1:0] predFlagL1_addrC_dout,predFlagL1_addrD_dout;

wire [4:0] refIdxL0,refIdxL1,refIdxL0A,refIdxL0B,refIdxL1A,refIdxL1B,refIdxL0C,refIdxL1C;


wire [9:0] refIdxL0_addrB_din,refIdxL1_addrB_din;
wire [7:0] refIdxL0_addrB_wr_addr,refIdxL0_addrB_rd_addr,refIdxL0_addrC_rd_addr,refIdxL0_addrD_rd_addr;
wire [7:0] refIdxL1_addrB_wr_addr,refIdxL1_addrB_rd_addr,refIdxL1_addrC_rd_addr,refIdxL1_addrD_rd_addr;
wire refIdxL0_addrB_wr_n,refIdxL1_addrB_wr_n;

wire [1:0] predFlagL0_addrB_din,predFlagL1_addrB_din;
wire [7:0] predFlagL0_addrB_wr_addr,predFlagL0_addrB_rd_addr,predFlagL0_addrC_rd_addr,predFlagL0_addrD_rd_addr;
wire [7:0] predFlagL1_addrB_wr_addr,predFlagL1_addrB_rd_addr,predFlagL1_addrC_rd_addr,predFlagL1_addrD_rd_addr;
wire predFlagL0_addrB_wr_n,predFlagL1_addrB_wr_n;


wire predFlagL0,predFlagL0_A,predFlagL0_B,predFlagL0_C,predFlagL0_D;
wire predFlagL1,predFlagL1_A,predFlagL1_B,predFlagL1_C,predFlagL1_D;



wire [43:0] mvxL0_mbAddrC_dout,mvxL0_mbAddrD_dout;
wire [43:0] mvyL0_mbAddrC_dout,mvyL0_mbAddrD_dout;
wire [43:0] mvxL1_mbAddrC_dout,mvxL1_mbAddrD_dout;
wire [43:0] mvyL1_mbAddrC_dout,mvyL1_mbAddrD_dout;

wire [43:0] mvxL0_mbAddrB_din;
wire [7:0] mvxL0_mbAddrB_wr_addr,mvxL0_mbAddrB_rd_addr,mvxL0_mbAddrC_rd_addr,mvxL0_mbAddrD_rd_addr;
wire mvxL0_mbAddrB_wr_n;

wire [43:0] mvyL0_mbAddrB_din;
wire [7:0] mvyL0_mbAddrB_wr_addr,mvyL0_mbAddrB_rd_addr,mvyL0_mbAddrC_rd_addr,mvyL0_mbAddrD_rd_addr;
wire mvyL0_mbAddrB_wr_n;

wire [43:0] mvxL1_mbAddrB_din;
wire [7:0] mvxL1_mbAddrB_wr_addr,mvxL1_mbAddrB_rd_addr,mvxL1_mbAddrC_rd_addr,mvxL1_mbAddrD_rd_addr;
wire mvxL1_mbAddrB_wr_n;

wire [43:0] mvyL1_mbAddrB_din;
wire [7:0] mvyL1_mbAddrB_wr_addr,mvyL1_mbAddrB_rd_addr,mvyL1_mbAddrC_rd_addr,mvyL1_mbAddrD_rd_addr;
wire mvyL1_mbAddrB_wr_n;

wire [5:0] refidx_col;
wire [10:0] mvx_col,mvy_col;

refidx_decoding refidx_decoding(
	.clk(clk),.reset_n(reset_n),
	.slice_type(slice_type),.sub_mb_type(sub_mb_type),
	.slice_data_state(slice_data_state),
	.sub_mb_pred_state(sub_mb_pred_state),
	.mb_pred_state(mb_pred_state),
	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),
	.mb_type_general(mb_type_general),
	.mbPartIdx(mbPartIdx),.subMbPartIdx(subMbPartIdx),
	.MBTypeGen_mbAddrA(MBTypeGen_mbAddrA),.MBTypeGen_mbAddrB(MBTypeGen_mbAddrB),
	.MBTypeGen_mbAddrC(MBTypeGen_mbAddrC),.MBTypeGen_mbAddrD(MBTypeGen_mbAddrD),
	.B_MbPartPredMode_0(B_MbPartPredMode_0),.B_MbPartPredMode_1(B_MbPartPredMode_1),
	.ref_idx_l0(ref_idx_l0),.ref_idx_l1(ref_idx_l1),
	.SubMbPredMode(SubMbPredMode),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),
	.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.ref_idx_rd_for_DF(ref_idx_rd_for_DF),
	.Is_skip_run_entry(Is_skip_run_entry),.b_col_end(b_col_end),
	.Is_skip_run_end(Is_skip_run_end),.p_skip_end(p_skip_end),
	.direct_spatial_mv_pred_flag(direct_spatial_mv_pred_flag),

	.refIdxL0_addrB_dout(refIdxL0_addrB_dout),.refIdxL0_addrC_dout(refIdxL0_addrC_dout),.refIdxL0_addrD_dout(refIdxL0_addrD_dout),
	.refIdxL1_addrB_dout(refIdxL1_addrB_dout),.refIdxL1_addrC_dout(refIdxL1_addrC_dout),.refIdxL1_addrD_dout(refIdxL1_addrD_dout),
	.predFlagL0_addrB_dout(predFlagL0_addrB_dout),.predFlagL0_addrC_dout(predFlagL0_addrC_dout),.predFlagL0_addrD_dout(predFlagL0_addrD_dout),
	.predFlagL1_addrB_dout(predFlagL1_addrB_dout),.predFlagL1_addrC_dout(predFlagL1_addrC_dout),.predFlagL1_addrD_dout(predFlagL1_addrD_dout),


	.skip_mv_calc(skip_mv_calc),.Is_skipMB_mv_calc(Is_skipMB_mv_calc),
	.refIdxL0(refIdxL0),.refIdxL1(refIdxL1),
	.refIdxL0A(refIdxL0A),.refIdxL0B(refIdxL0B),.refIdxL1A(refIdxL1A),.refIdxL1B(refIdxL1B),
	.refIdxL0C(refIdxL0C),.refIdxL1C(refIdxL1C),
	
	.refIdxL0_curr(refIdxL0_curr),.refIdxL1_curr(refIdxL1_curr),
	.predFlagL0_curr(predFlagL0_curr),.predFlagL1_curr(predFlagL1_curr),
	
	.refIdxL0_addrA(refIdxL0_addrA),.refIdxL1_addrA(refIdxL1_addrA),
	.predFlagL0_addrA(predFlagL0_addrA),.predFlagL1_addrA(predFlagL1_addrA),

	.predFlagL0(predFlagL0),.predFlagL0_A(predFlagL0_A),.predFlagL0_B(predFlagL0_B),
	.predFlagL0_C(predFlagL0_C),.predFlagL0_D(predFlagL0_D),
	.predFlagL1(predFlagL1),.predFlagL1_A(predFlagL1_A),.predFlagL1_B(predFlagL1_B),
	.predFlagL1_C(predFlagL1_C),.predFlagL1_D(predFlagL1_D),

	.refIdxL0_addrB_din(refIdxL0_addrB_din),.refIdxL1_addrB_din(refIdxL1_addrB_din),
	.refIdxL0_addrB_wr_addr(refIdxL0_addrB_wr_addr),.refIdxL0_addrB_rd_addr(refIdxL0_addrB_rd_addr),
	.refIdxL0_addrC_rd_addr(refIdxL0_addrC_rd_addr),.refIdxL0_addrD_rd_addr(refIdxL0_addrD_rd_addr),
	.refIdxL1_addrB_wr_addr(refIdxL1_addrB_wr_addr),.refIdxL1_addrB_rd_addr(refIdxL1_addrB_rd_addr),
	.refIdxL1_addrC_rd_addr(refIdxL1_addrC_rd_addr),.refIdxL1_addrD_rd_addr(refIdxL1_addrD_rd_addr),
	.refIdxL0_addrB_wr_n(refIdxL0_addrB_wr_n),.refIdxL1_addrB_wr_n(refIdxL1_addrB_wr_n),

	.predFlagL0_addrB_din(predFlagL0_addrB_din),.predFlagL1_addrB_din(predFlagL1_addrB_din),
	.predFlagL0_addrB_wr_addr(predFlagL0_addrB_wr_addr),.predFlagL0_addrB_rd_addr(predFlagL0_addrB_rd_addr),
	.predFlagL0_addrC_rd_addr(predFlagL0_addrC_rd_addr),.predFlagL0_addrD_rd_addr(predFlagL0_addrD_rd_addr),
	.predFlagL1_addrB_wr_addr(predFlagL1_addrB_wr_addr),.predFlagL1_addrB_rd_addr(predFlagL1_addrB_rd_addr),
	.predFlagL1_addrC_rd_addr(predFlagL1_addrC_rd_addr),.predFlagL1_addrD_rd_addr(predFlagL1_addrD_rd_addr),
	.predFlagL0_addrB_wr_n(predFlagL0_addrB_wr_n),.predFlagL1_addrB_wr_n(predFlagL1_addrB_wr_n)
);

MV_decoding MV_decoding(
	.clk(clk),.reset_n(reset_n),
	.skip_mv_calc(skip_mv_calc),.Is_skipMB_mv_calc(Is_skipMB_mv_calc),
	.slice_type(slice_type),.sub_mb_type(sub_mb_type),
	.slice_data_state(slice_data_state),
	.sub_mb_pred_state(sub_mb_pred_state),
	.mb_pred_state(mb_pred_state),
	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),
	.mb_type_general(mb_type_general),
	.mbPartIdx(mbPartIdx),.subMbPartIdx(subMbPartIdx),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),
	.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.mv_mbAddrB_rd_for_DF(mv_mbAddrB_rd_for_DF),
	.direct_spatial_mv_pred_flag(direct_spatial_mv_pred_flag),
	.compIdx(compIdx),.p_skip_end(p_skip_end),.mvd(mvd),
	.MBTypeGen_mbAddrA(MBTypeGen_mbAddrA),.MBTypeGen_mbAddrB(MBTypeGen_mbAddrB),
	.MBTypeGen_mbAddrC(MBTypeGen_mbAddrC),.MBTypeGen_mbAddrD(MBTypeGen_mbAddrD),
	.B_MbPartPredMode_0(B_MbPartPredMode_0),.B_MbPartPredMode_1(B_MbPartPredMode_1),
	.SubMbPredMode(SubMbPredMode),
	.refIdxL0(refIdxL0),.refIdxL1(refIdxL1),
	.refIdxL0A(refIdxL0A),.refIdxL0B(refIdxL0B),.refIdxL1A(refIdxL1A),.refIdxL1B(refIdxL1B),
	.refIdxL0C(refIdxL0C),.refIdxL1C(refIdxL1C),
	.predFlagL0(predFlagL0),.predFlagL0_A(predFlagL0_A),.predFlagL0_B(predFlagL0_B),
	.predFlagL0_C(predFlagL0_C),.predFlagL0_D(predFlagL0_D),
	.predFlagL1(predFlagL1),.predFlagL1_A(predFlagL1_A),.predFlagL1_B(predFlagL1_B),
	.predFlagL1_C(predFlagL1_C),.predFlagL1_D(predFlagL1_D),
	.refidx_col(refidx_col),.mvx_col(mvx_col),.mvy_col(mvy_col),
	.td(td),.tb(tb),
	.mvxL0_mbAddrB_dout(mvxL0_mbAddrB_dout),.mvxL0_mbAddrC_dout(mvxL0_mbAddrC_dout),.mvxL0_mbAddrD_dout(mvxL0_mbAddrD_dout),
	.mvyL0_mbAddrB_dout(mvyL0_mbAddrB_dout),.mvyL0_mbAddrC_dout(mvyL0_mbAddrC_dout),.mvyL0_mbAddrD_dout(mvyL0_mbAddrD_dout),
	.mvxL1_mbAddrB_dout(mvxL1_mbAddrB_dout),.mvxL1_mbAddrC_dout(mvxL1_mbAddrC_dout),.mvxL1_mbAddrD_dout(mvxL1_mbAddrD_dout),
	.mvyL1_mbAddrB_dout(mvyL1_mbAddrB_dout),.mvyL1_mbAddrC_dout(mvyL1_mbAddrC_dout),.mvyL1_mbAddrD_dout(mvyL1_mbAddrD_dout),

	.mvxL0_mbAddrB_din(mvxL0_mbAddrB_din),.mvxL0_mbAddrB_wr_n(mvxL0_mbAddrB_wr_n),
	.mvxL0_mbAddrB_wr_addr(mvxL0_mbAddrB_wr_addr),.mvxL0_mbAddrB_rd_addr(mvxL0_mbAddrB_rd_addr),
	.mvxL0_mbAddrC_rd_addr(mvxL0_mbAddrC_rd_addr),.mvxL0_mbAddrD_rd_addr(mvxL0_mbAddrD_rd_addr),

	.mvyL0_mbAddrB_din(mvyL0_mbAddrB_din),.mvyL0_mbAddrB_wr_n(mvyL0_mbAddrB_wr_n),
	.mvyL0_mbAddrB_wr_addr(mvyL0_mbAddrB_wr_addr),.mvyL0_mbAddrB_rd_addr(mvyL0_mbAddrB_rd_addr),
	.mvyL0_mbAddrC_rd_addr(mvyL0_mbAddrC_rd_addr),.mvyL0_mbAddrD_rd_addr(mvyL0_mbAddrD_rd_addr),

	.mvxL1_mbAddrB_din(mvxL1_mbAddrB_din),.mvxL1_mbAddrB_wr_n(mvxL1_mbAddrB_wr_n),
	.mvxL1_mbAddrB_wr_addr(mvxL1_mbAddrB_wr_addr),.mvxL1_mbAddrB_rd_addr(mvxL1_mbAddrB_rd_addr),
	.mvxL1_mbAddrC_rd_addr(mvxL1_mbAddrC_rd_addr),.mvxL1_mbAddrD_rd_addr(mvxL1_mbAddrD_rd_addr),

	.mvyL1_mbAddrB_din(mvyL1_mbAddrB_din),.mvyL1_mbAddrB_wr_n(mvyL1_mbAddrB_wr_n),
	.mvyL1_mbAddrB_wr_addr(mvyL1_mbAddrB_wr_addr),.mvyL1_mbAddrB_rd_addr(mvyL1_mbAddrB_rd_addr),
	.mvyL1_mbAddrC_rd_addr(mvyL1_mbAddrC_rd_addr),.mvyL1_mbAddrD_rd_addr(mvyL1_mbAddrD_rd_addr),

	.mv_is16x16(mv_is16x16),
	.mvxL0_mbAddrA(mvxL0_mbAddrA),.mvyL0_mbAddrA(mvyL0_mbAddrA),
	.mvxL1_mbAddrA(mvxL1_mbAddrA),.mvyL1_mbAddrA(mvyL1_mbAddrA),

	.mvxL0_CurrMb0(mvxL0_CurrMb0),.mvxL0_CurrMb1(mvxL0_CurrMb1),.mvxL0_CurrMb2(mvxL0_CurrMb2),.mvxL0_CurrMb3(mvxL0_CurrMb3),
	.mvyL0_CurrMb0(mvyL0_CurrMb0),.mvyL0_CurrMb1(mvyL0_CurrMb1),.mvyL0_CurrMb2(mvyL0_CurrMb2),.mvyL0_CurrMb3(mvyL0_CurrMb3),
	.mvxL1_CurrMb0(mvxL1_CurrMb0),.mvxL1_CurrMb1(mvxL1_CurrMb1),.mvxL1_CurrMb2(mvxL1_CurrMb2),.mvxL1_CurrMb3(mvxL1_CurrMb3),
	.mvyL1_CurrMb0(mvyL1_CurrMb0),.mvyL1_CurrMb1(mvyL1_CurrMb1),.mvyL1_CurrMb2(mvyL1_CurrMb2),.mvyL1_CurrMb3(mvyL1_CurrMb3)
);


/*wire [19:0] col_refidx_dout,col_refidx_din;
wire [43:0] col_mvx_dout,col_mvy_dout,col_mvx_din,col_mvy_din;
wire ao_valid_refidx,ao_valid_mvx,ao_valid_mvy;
wire col_wr_n,col_rd_n;
wire [13:0] col_wr_addr,col_rd_addr;

co_located co_located(
	.clk(clk),.reset_n(reset_n),
	.nal_ref_idc(nal_ref_idc),
	.slice_type(slice_type),.sub_mb_type(sub_mb_type),
	.slice_data_state(slice_data_state),
	.sub_mb_pred_state(sub_mb_pred_state),
	.mb_pred_state(mb_pred_state),
	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),
	.mb_type_general(mb_type_general),
	.mbPartIdx(mbPartIdx),
	.p_skip_end(p_skip_end),.Is_skipMB_mv_calc(Is_skipMB_mv_calc),
	.SubMbPredMode(SubMbPredMode),
	.B_MbPartPredMode_0(B_MbPartPredMode_0),
	.refIdxL0_curr(refIdxL0_curr),
	.mvxL0_CurrMb0(mvxL0_CurrMb0),.mvxL0_CurrMb1(mvxL0_CurrMb1),.mvxL0_CurrMb2(mvxL0_CurrMb2),.mvxL0_CurrMb3(mvxL0_CurrMb3),
	.mvyL0_CurrMb0(mvyL0_CurrMb0),.mvyL0_CurrMb1(mvyL0_CurrMb1),.mvyL0_CurrMb2(mvyL0_CurrMb2),.mvyL0_CurrMb3(mvyL0_CurrMb3),

	.col_refidx_dout(col_refidx_dout),.col_refidx_din(col_refidx_din),

	.col_mvx_dout(col_mvx_dout),.col_mvy_dout(col_mvy_dout),
	.col_mvx_din(col_mvx_din),.col_mvy_din(col_mvy_din),

	.ao_valid_refidx(ao_valid_refidx),.ao_valid_mvx(ao_valid_mvx),.ao_valid_mvy(ao_valid_mvy),

	.col_wr_n(col_wr_n),.col_rd_n(col_rd_n),
	.col_wr_addr(col_wr_addr),.col_rd_addr(col_rd_addr),

	.b_col_end(b_col_end),

	.refidx_col(refidx_col),.mvx_col(mvx_col),.mvy_col(mvy_col)
);

*/

//wait ram

/*spram_wait # (20,14)
	refidx_col_ram(
	.clk(clk),.rst(~reset_n),
	.ai_ce(1'b1),.ai_we(~col_wr_n),
	.ai_oe(~col_rd_n),
	.ai_addr_w(col_wr_addr),.ai_addr_r(col_rd_addr),
	.ao_data(col_refidx_dout),.ai_data(col_refidx_din),
   	.ao_valid(ao_valid_refidx)
   );


spram_wait # (44,14)
	mvx_col_ram(
	.clk(clk),.rst(~reset_n),
	.ai_ce(1'b1),.ai_we(~col_wr_n),
	.ai_oe(~col_rd_n),
	.ai_addr_w(col_wr_addr),.ai_addr_r(col_rd_addr),
	.ao_data(col_mvx_dout),.ai_data(col_mvx_din),
   	.ao_valid(ao_valid_mvx)
   );

spram_wait # (44,14)
	mvy_col_ram(
	.clk(clk),.rst(~reset_n),
	.ai_ce(1'b1),.ai_we(~col_wr_n),
	.ai_oe(~col_rd_n),
	.ai_addr_w(col_wr_addr),.ai_addr_r(col_rd_addr),
	.ao_data(col_mvy_dout),.ai_data(col_mvy_din),
   	.ao_valid(ao_valid_mvy)
   );

*/







//RAM


ram # (44,8) 
	mvxL0_mbAddrB(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(mvxL0_mbAddrB_wr_n),.wr_n(mvxL0_mbAddrB_wr_n),
	.rd_addr(mvxL0_mbAddrB_rd_addr),.wr_addr(mvxL0_mbAddrB_wr_addr),
	.data_in(mvxL0_mbAddrB_din),.data_out(mvxL0_mbAddrB_dout)
	);


ram # (44,8) 
	mvyL0_mbAddrB(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(mvyL0_mbAddrB_wr_n),.wr_n(mvyL0_mbAddrB_wr_n),
	.rd_addr(mvyL0_mbAddrB_rd_addr),.wr_addr(mvyL0_mbAddrB_wr_addr),
	.data_in(mvyL0_mbAddrB_din),.data_out(mvyL0_mbAddrB_dout)
	);

/*ram # (44,8) 
	mvxL1_mbAddrB(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(mvxL1_mbAddrB_wr_n),.wr_n(mvxL1_mbAddrB_wr_n),
	.rd_addr(mvxL1_mbAddrB_rd_addr),.wr_addr(mvxL1_mbAddrB_wr_addr),
	.data_in(mvxL1_mbAddrB_din),.data_out(mvxL1_mbAddrB_dout)
	);


ram # (44,8) 
	mvyL1_mbAddrB(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(mvyL1_mbAddrB_wr_n),.wr_n(mvyL1_mbAddrB_wr_n),
	.rd_addr(mvyL1_mbAddrB_rd_addr),.wr_addr(mvyL1_mbAddrB_wr_addr),
	.data_in(mvyL1_mbAddrB_din),.data_out(mvyL1_mbAddrB_dout)
	);*/





//C
ram # (44,8) 
	mvxL0_mbAddrC(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(mvxL0_mbAddrB_wr_n),.wr_n(mvxL0_mbAddrB_wr_n),
	.rd_addr(mvxL0_mbAddrC_rd_addr),.wr_addr(mvxL0_mbAddrB_wr_addr),
	.data_in(mvxL0_mbAddrB_din),.data_out(mvxL0_mbAddrC_dout)
	);


ram # (44,8) 
	mvyL0_mbAddrC(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(mvyL0_mbAddrB_wr_n),.wr_n(mvyL0_mbAddrB_wr_n),
	.rd_addr(mvyL0_mbAddrC_rd_addr),.wr_addr(mvyL0_mbAddrB_wr_addr),
	.data_in(mvyL0_mbAddrB_din),.data_out(mvyL0_mbAddrC_dout)
	);

/*ram # (44,8) 
	mvxL1_mbAddrC(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(mvxL1_mbAddrB_wr_n),.wr_n(mvxL1_mbAddrB_wr_n),
	.rd_addr(mvxL1_mbAddrC_rd_addr),.wr_addr(mvxL1_mbAddrB_wr_addr),
	.data_in(mvxL1_mbAddrB_din),.data_out(mvxL1_mbAddrC_dout)
	);


ram # (44,8) 
	mvyL1_mbAddrC(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(mvyL1_mbAddrB_wr_n),.wr_n(mvyL1_mbAddrB_wr_n),
	.rd_addr(mvyL1_mbAddrC_rd_addr),.wr_addr(mvyL1_mbAddrB_wr_addr),
	.data_in(mvyL1_mbAddrB_din),.data_out(mvyL1_mbAddrC_dout)
	);*/
//D


ram # (44,8) 
	mvxL0_mbAddrD(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(mvxL0_mbAddrB_wr_n),.wr_n(mvxL0_mbAddrB_wr_n),
	.rd_addr(mvxL0_mbAddrD_rd_addr),.wr_addr(mvxL0_mbAddrB_wr_addr),
	.data_in(mvxL0_mbAddrB_din),.data_out(mvxL0_mbAddrD_dout)
	);


ram # (44,8) 
	mvyL0_mbAddrD(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(mvyL0_mbAddrB_wr_n),.wr_n(mvyL0_mbAddrB_wr_n),
	.rd_addr(mvyL0_mbAddrD_rd_addr),.wr_addr(mvyL0_mbAddrB_wr_addr),
	.data_in(mvyL0_mbAddrB_din),.data_out(mvyL0_mbAddrD_dout)
	);

/*ram # (44,8) 
	mvxL1_mbAddrD(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(mvxL1_mbAddrB_wr_n),.wr_n(mvxL1_mbAddrB_wr_n),
	.rd_addr(mvxL1_mbAddrD_rd_addr),.wr_addr(mvxL1_mbAddrB_wr_addr),
	.data_in(mvxL1_mbAddrB_din),.data_out(mvxL1_mbAddrD_dout)
	);


ram # (44,8) 
	mvyL1_mbAddrD(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(mvyL1_mbAddrB_wr_n),.wr_n(mvyL1_mbAddrB_wr_n),
	.rd_addr(mvyL1_mbAddrD_rd_addr),.wr_addr(mvyL1_mbAddrB_wr_addr),
	.data_in(mvyL1_mbAddrB_din),.data_out(mvyL1_mbAddrD_dout)
	);*/





//

ram # (10,8) 
	refidx_l0_mbAddrB(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(refIdxL0_addrB_wr_n),.wr_n(refIdxL0_addrB_wr_n),
	.rd_addr(refIdxL0_addrB_rd_addr),.wr_addr(refIdxL0_addrB_wr_addr),
	.data_in(refIdxL0_addrB_din),.data_out(refIdxL0_addrB_dout)
	);

ram # (10,8) 
	refidx_l0_mbAddrC(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(refIdxL0_addrB_wr_n),.wr_n(refIdxL0_addrB_wr_n),
	.rd_addr(refIdxL0_addrC_rd_addr),.wr_addr(refIdxL0_addrB_wr_addr),
	.data_in(refIdxL0_addrB_din),.data_out(refIdxL0_addrC_dout)
	);

ram # (10,8) 
	refidx_l0_mbAddrD(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(refIdxL0_addrB_wr_n),.wr_n(refIdxL0_addrB_wr_n),
	.rd_addr(refIdxL0_addrD_rd_addr),.wr_addr(refIdxL0_addrB_wr_addr),
	.data_in(refIdxL0_addrB_din),.data_out(refIdxL0_addrD_dout)
	);

//

ram # (2,8) 
	predFlagL0_mbAddrB(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(predFlagL0_addrB_wr_n),.wr_n(predFlagL0_addrB_wr_n),
	.rd_addr(predFlagL0_addrB_rd_addr),.wr_addr(predFlagL0_addrB_wr_addr),
	.data_in(predFlagL0_addrB_din),.data_out(predFlagL0_addrB_dout)
	);

ram # (2,8) 
	predFlagL0_mbAddrC(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(predFlagL0_addrB_wr_n),.wr_n(predFlagL0_addrB_wr_n),
	.rd_addr(predFlagL0_addrC_rd_addr),.wr_addr(predFlagL0_addrB_wr_addr),
	.data_in(predFlagL0_addrB_din),.data_out(predFlagL0_addrC_dout)
	);

ram # (2,8) 
	predFlagL0_mbAddrD(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(predFlagL0_addrB_wr_n),.wr_n(predFlagL0_addrB_wr_n),
	.rd_addr(predFlagL0_addrD_rd_addr),.wr_addr(predFlagL0_addrB_wr_addr),
	.data_in(predFlagL0_addrB_din),.data_out(predFlagL0_addrD_dout)
	);

//
/*ram # (10,8) 
	refidx_l1_mbAddrB(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(refIdxL1_addrB_wr_n),.wr_n(refIdxL1_addrB_wr_n),
	.rd_addr(refIdxL1_addrB_rd_addr),.wr_addr(refIdxL1_addrB_wr_addr),
	.data_in(refIdxL1_addrB_din),.data_out(refIdxL1_addrB_dout)
	);

ram # (10,8) 
	refidx_l1_mbAddrC(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(refIdxL1_addrB_wr_n),.wr_n(refIdxL1_addrB_wr_n),
	.rd_addr(refIdxL1_addrC_rd_addr),.wr_addr(refIdxL1_addrB_wr_addr),
	.data_in(refIdxL1_addrB_din),.data_out(refIdxL1_addrC_dout)
	);

ram # (10,8) 
	refidx_l1_mbAddrD(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(refIdxL1_addrB_wr_n),.wr_n(refIdxL1_addrB_wr_n),
	.rd_addr(refIdxL1_addrD_rd_addr),.wr_addr(refIdxL1_addrB_wr_addr),
	.data_in(refIdxL1_addrB_din),.data_out(refIdxL1_addrD_dout)
	);

//
ram # (2,8) 
	predFlagL1_mbAddrB(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(predFlagL1_addrB_wr_n),.wr_n(predFlagL1_addrB_wr_n),
	.rd_addr(predFlagL1_addrB_rd_addr),.wr_addr(predFlagL1_addrB_wr_addr),
	.data_in(predFlagL1_addrB_din),.data_out(predFlagL1_addrB_dout)
	);

ram # (2,8) 
	predFlagL1_mbAddrC(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(predFlagL1_addrB_wr_n),.wr_n(predFlagL1_addrB_wr_n),
	.rd_addr(predFlagL1_addrC_rd_addr),.wr_addr(predFlagL1_addrB_wr_addr),
	.data_in(predFlagL1_addrB_din),.data_out(predFlagL1_addrC_dout)
	);

ram # (2,8) 
	predFlagL1_mbAddrD(
	.clk(clk),.reset_n(reset_n), 
	.cs_n(predFlagL1_addrB_wr_n),.wr_n(predFlagL1_addrB_wr_n),
	.rd_addr(predFlagL1_addrD_rd_addr),.wr_addr(predFlagL1_addrB_wr_addr),
	.data_in(predFlagL1_addrB_din),.data_out(predFlagL1_addrD_dout)
	);


*/












endmodule
