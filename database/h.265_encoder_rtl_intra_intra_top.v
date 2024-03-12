//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2013, VIPcore Group, Fudan University
//
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//
//  VIPcore       : http://soc.fudan.edu.cn/vip
//  IP Owner      : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn
//
//-------------------------------------------------------------------
//
//  Filename      : intra_top.v
//  Author        : Yibo FAN
//  Created       : 2013-12-28
//  Description   : intra_top
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-07-17 by HLL
//  Description   : lcu size changed into 64x64 (prediction to 64x64 block remains to be added)
//  Modified      : 2014-08-23 by HLL
//  Description   : optional mode for minimal tu size added
//  Modified      : 2014-08-23 by HLL
//  Description   : simulation environment for new intra settled
//  Modified      : 2014-08-25 by HLL
//  Description   : prediction to u added (prediction to v remains to be added) (size of buffers remains to be optimized)
//  Modified      : 2014-08-26 by HLL
//  Description   : prediction to v added (size of buffers remains to be optimized)
//  Modified      : 2014-09-10 by HLL
//  Description   : sel_o modified
//  Modified      : 2014-09-22 by HLL
//  Description   : separated reconstruction and cover signals supported
//                  (cover signals could come later than reconstruction signals instead of simultaneously)
//  Modified      : 2014-09-15 by HLL
//  Description   : partition supported
//  Modified      : 2014-10-16 by HLL
//  Description   : mode exported
//  Modified      : 2014-10-17 by HLL
//  Description   : mode_uv supported
//  Modified      : 2014-10-19 by HLL
//  Description   : mode_uv fetched from cur_mb
//
//  $Id$
//
//-------------------------------------------------------------------

`include "./enc_defines.v"


module intra_top(
  clk             ,
  rst_n           ,
  // ctrl if
  pre_min_size_i  ,
  uv_partition_i  ,
  mb_x_total_i    ,
  mb_x_i          ,
  mb_y_i          ,
  start_i         ,
  done_o          ,
  // pre mode if
  md_rden_o       ,
  md_raddr_o      ,
  md_rdata_i      ,
  // tq pred if
  pre_en_o        ,
  pre_sel_o       ,
  pre_size_o      ,
  pre_4x4_x_o     ,
  pre_4x4_y_o     ,
  pre_data_o      ,
  pre_mode_o      ,
  // tq rec if
  rec_val_i       ,
  rec_idx_i       ,
  rec_data_i      ,
  // pt if
  cover_valid_i   ,
  cover_value_i
  );

// ********************************************
//
//    Parameter DECLARATION
//
// ********************************************


// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************
  input                               clk            ; // clock
  input                               rst_n          ; // reset signal
  // ctrl if
  input    [`PIC_X_WIDTH-1    : 0]    mb_x_total_i   ; // Total LCU number-1 in X
  input    [`PIC_X_WIDTH-1    : 0]    mb_x_i         ; // Intra Prediction for MB X
  input    [`PIC_Y_WIDTH-1    : 0]    mb_y_i         ; // Intra Prediction for MB Y
  input                               start_i        ; // start intra
  input                               pre_min_size_i ; // minimal tu size
  input    [20                : 0]    uv_partition_i ; // partition of uv
  output                              done_o         ; // intra done
  // pre mode if
  output                              md_rden_o      ; // intra mode read enable
  output   [9                 : 0]    md_raddr_o     ; // mode memory address
  input    [5                 : 0]    md_rdata_i     ; // intra mode for 8x8 to 64x64. totally 1+4+4x4+4x4x4=85 modes
  // tq pred if
  output                              pre_en_o       ; // predicted data valid
  output   [1                 : 0]    pre_sel_o      ; // 0x: luma, 10: cb; 11:cr
  output   [1                 : 0]    pre_size_o     ; // tu size (00:4x4 01:8x8 10:16x16 11:32
  output   [3                 : 0]    pre_4x4_x_o    ; // 4x4 block index x in LCU
  output   [3                 : 0]    pre_4x4_y_o    ; // 4x4 block index y in LCU
  output   [`PIXEL_WIDTH*16-1 : 0]    pre_data_o     ; // predicted pixels
  output   [5                 : 0]    pre_mode_o     ; // prediction mode
  // tq rec if
  input                               rec_val_i      ; // rec valid
  input    [4                 : 0]    rec_idx_i      ; // rec parallel row index
  input    [`PIXEL_WIDTH*32-1 : 0]    rec_data_i     ; // reconstructed pixels
  // pt if
  input                               cover_valid_i  ;
  input                               cover_value_i  ;


// ********************************************
//
//    Register DECLARATION
//
// ********************************************


// ********************************************
//
//    Wire DECLARATION
//
// ********************************************
wire [`PIXEL_WIDTH-1:0] ref_tl_w;

wire [`PIXEL_WIDTH-1:0] ref_t00_w,ref_t01_w,ref_t02_w,ref_t03_w,ref_t04_w,ref_t05_w,ref_t06_w,ref_t07_w;
wire [`PIXEL_WIDTH-1:0] ref_t08_w,ref_t09_w,ref_t10_w,ref_t11_w,ref_t12_w,ref_t13_w,ref_t14_w,ref_t15_w;
wire [`PIXEL_WIDTH-1:0] ref_t16_w,ref_t17_w,ref_t18_w,ref_t19_w,ref_t20_w,ref_t21_w,ref_t22_w,ref_t23_w;
wire [`PIXEL_WIDTH-1:0] ref_t24_w,ref_t25_w,ref_t26_w,ref_t27_w,ref_t28_w,ref_t29_w,ref_t30_w,ref_t31_w;

wire [`PIXEL_WIDTH-1:0] ref_r00_w,ref_r01_w,ref_r02_w,ref_r03_w,ref_r04_w,ref_r05_w,ref_r06_w,ref_r07_w;
wire [`PIXEL_WIDTH-1:0] ref_r08_w,ref_r09_w,ref_r10_w,ref_r11_w,ref_r12_w,ref_r13_w,ref_r14_w,ref_r15_w;
wire [`PIXEL_WIDTH-1:0] ref_r16_w,ref_r17_w,ref_r18_w,ref_r19_w,ref_r20_w,ref_r21_w,ref_r22_w,ref_r23_w;
wire [`PIXEL_WIDTH-1:0] ref_r24_w,ref_r25_w,ref_r26_w,ref_r27_w,ref_r28_w,ref_r29_w,ref_r30_w,ref_r31_w;

wire [`PIXEL_WIDTH-1:0] ref_l00_w,ref_l01_w,ref_l02_w,ref_l03_w,ref_l04_w,ref_l05_w,ref_l06_w,ref_l07_w;
wire [`PIXEL_WIDTH-1:0] ref_l08_w,ref_l09_w,ref_l10_w,ref_l11_w,ref_l12_w,ref_l13_w,ref_l14_w,ref_l15_w;
wire [`PIXEL_WIDTH-1:0] ref_l16_w,ref_l17_w,ref_l18_w,ref_l19_w,ref_l20_w,ref_l21_w,ref_l22_w,ref_l23_w;
wire [`PIXEL_WIDTH-1:0] ref_l24_w,ref_l25_w,ref_l26_w,ref_l27_w,ref_l28_w,ref_l29_w,ref_l30_w,ref_l31_w;

wire [`PIXEL_WIDTH-1:0] ref_d00_w,ref_d01_w,ref_d02_w,ref_d03_w,ref_d04_w,ref_d05_w,ref_d06_w,ref_d07_w;
wire [`PIXEL_WIDTH-1:0] ref_d08_w,ref_d09_w,ref_d10_w,ref_d11_w,ref_d12_w,ref_d13_w,ref_d14_w,ref_d15_w;
wire [`PIXEL_WIDTH-1:0] ref_d16_w,ref_d17_w,ref_d18_w,ref_d19_w,ref_d20_w,ref_d21_w,ref_d22_w,ref_d23_w;
wire [`PIXEL_WIDTH-1:0] ref_d24_w,ref_d25_w,ref_d26_w,ref_d27_w,ref_d28_w,ref_d29_w,ref_d30_w,ref_d31_w;

wire pre_start_w;
wire [1:0] pre_size_w;
wire [3:0] pre_i4x4_x_w, pre_i4x4_y_w;

wire ref_start_w,ref_done_w,ref_ready_w;
wire [5:0] ref_mode_w;
wire [1:0] ref_size_w;
wire [7:0] ref_position_w;
wire [1:0] ref_sel_w;

//--------row/column sram IF-----------
wire  wena_w;
wire [31:0] w_data_row_w,w_data_col_w;
wire [ 5:0] w_addr_row_w,w_addr_col_w;
//-------------------------------------
//------------frame sram IF------------
wire wena_frame_w;
wire [31:0] w_data_frame_w;
wire [ 8:0] w_addr_frame_w;
//-------------------------------------
//--------row/column sram IF-----------
wire  cena_row_w,cena_col_w;
wire [31:0] r_data_row_w;

  wire [31  : 0]  r_data_row_w_u   ;
  wire [31  : 0]  r_data_row_w_v   ;

  wire [31  : 0]  r_data_col_0_w   ;
  wire [31  : 0]  r_data_col_1_w   ;
  wire [31  : 0]  r_data_col_2_w   ;
  wire [31  : 0]  r_data_col_0_w_u ;
  wire [31  : 0]  r_data_col_1_w_u ;
  wire [31  : 0]  r_data_col_2_w_u ;
  wire [31  : 0]  r_data_col_0_w_v ;
  wire [31  : 0]  r_data_col_1_w_v ;
  wire [31  : 0]  r_data_col_2_w_v ;


wire [ 5:0] r_addr_row_w,r_addr_col_w;
//-------------------------------------
//------------frame sram IF------------
wire cena_frame_w;
wire [31:0] r_data_frame_w;
  wire [31  : 0] r_data_frame_w_u ;
  wire [31  : 0] r_data_frame_w_v ;
wire [ 8:0] r_addr_frame_w;
//-------------------------------------

// ********************************************
//
//    Logic DECLARATION
//
// ********************************************

  // intra_ctrl
  intra_ctrl u_intra_ctrl(
    .clk                ( clk            ),
    .rst_n              ( rst_n          ),
    // sys if
    .start_i            ( start_i        ),
    .done_o             ( done_o         ),
    // pre ctrl if
    .pre_min_size_i     ( pre_min_size_i ),
    .uv_partition_i     ( uv_partition_i ),
    // mode ram if
    .md_cena_o          ( md_rden_o      ),
    .md_addr_o          ( md_raddr_o     ),
    .md_data_i          ( md_rdata_i     ),
    // intra ref if
    .ref_start_o        ( ref_start_w    ),
    .ref_done_i         ( ref_done_w     ),
    .ref_ready_i        ( ref_ready_w    ),
    .ref_size_o         ( ref_size_w     ),
    .ref_mode_o         ( ref_mode_w     ),
    .ref_sel_o          ( ref_sel_w      ),
    .ref_position_o     ( ref_position_w ),
    // intra pred if
    .pre_start_o        ( pre_start_w    ),
    .pre_mode_o         ( pre_mode_o     ),
    .pre_sel_o          ( pre_sel_o      ),
    .pre_size_o         ( pre_size_w     ),
    .pre_i4x4_x_o       ( pre_i4x4_x_w   ),
    .pre_i4x4_y_o       ( pre_i4x4_y_w   )
    );

// intra_pred (4x4 block by block)
intra_pred u_intra_pred(
	.clk			(clk),
	.rst_n		(rst_n),

	.start_i	(pre_start_w),
  .pre_sel_i (pre_sel_o),
	.mode_i		(pre_mode_o),
	
	.size_i		(pre_size_w),

	.i4x4_x_i	(pre_i4x4_x_w),
	.i4x4_y_i	(pre_i4x4_y_w),

	.ref_tl_i (ref_tl_w ),

	.ref_t00_i(ref_t00_w),.ref_t01_i(ref_t01_w),.ref_t02_i(ref_t02_w),.ref_t03_i(ref_t03_w),.ref_t04_i(ref_t04_w),.ref_t05_i(ref_t05_w),.ref_t06_i(ref_t06_w),.ref_t07_i(ref_t07_w),
	.ref_t08_i(ref_t08_w),.ref_t09_i(ref_t09_w),.ref_t10_i(ref_t10_w),.ref_t11_i(ref_t11_w),.ref_t12_i(ref_t12_w),.ref_t13_i(ref_t13_w),.ref_t14_i(ref_t14_w),.ref_t15_i(ref_t15_w),
	.ref_t16_i(ref_t16_w),.ref_t17_i(ref_t17_w),.ref_t18_i(ref_t18_w),.ref_t19_i(ref_t19_w),.ref_t20_i(ref_t20_w),.ref_t21_i(ref_t21_w),.ref_t22_i(ref_t22_w),.ref_t23_i(ref_t23_w),
	.ref_t24_i(ref_t24_w),.ref_t25_i(ref_t25_w),.ref_t26_i(ref_t26_w),.ref_t27_i(ref_t27_w),.ref_t28_i(ref_t28_w),.ref_t29_i(ref_t29_w),.ref_t30_i(ref_t30_w),.ref_t31_i(ref_t31_w),

	.ref_r00_i(ref_r00_w),.ref_r01_i(ref_r01_w),.ref_r02_i(ref_r02_w),.ref_r03_i(ref_r03_w),.ref_r04_i(ref_r04_w),.ref_r05_i(ref_r05_w),.ref_r06_i(ref_r06_w),.ref_r07_i(ref_r07_w),
	.ref_r08_i(ref_r08_w),.ref_r09_i(ref_r09_w),.ref_r10_i(ref_r10_w),.ref_r11_i(ref_r11_w),.ref_r12_i(ref_r12_w),.ref_r13_i(ref_r13_w),.ref_r14_i(ref_r14_w),.ref_r15_i(ref_r15_w),
	.ref_r16_i(ref_r16_w),.ref_r17_i(ref_r17_w),.ref_r18_i(ref_r18_w),.ref_r19_i(ref_r19_w),.ref_r20_i(ref_r20_w),.ref_r21_i(ref_r21_w),.ref_r22_i(ref_r22_w),.ref_r23_i(ref_r23_w),
	.ref_r24_i(ref_r24_w),.ref_r25_i(ref_r25_w),.ref_r26_i(ref_r26_w),.ref_r27_i(ref_r27_w),.ref_r28_i(ref_r28_w),.ref_r29_i(ref_r29_w),.ref_r30_i(ref_r30_w),.ref_r31_i(ref_r31_w),

	.ref_l00_i(ref_l00_w),.ref_l01_i(ref_l01_w),.ref_l02_i(ref_l02_w),.ref_l03_i(ref_l03_w),.ref_l04_i(ref_l04_w),.ref_l05_i(ref_l05_w),.ref_l06_i(ref_l06_w),.ref_l07_i(ref_l07_w),
	.ref_l08_i(ref_l08_w),.ref_l09_i(ref_l09_w),.ref_l10_i(ref_l10_w),.ref_l11_i(ref_l11_w),.ref_l12_i(ref_l12_w),.ref_l13_i(ref_l13_w),.ref_l14_i(ref_l14_w),.ref_l15_i(ref_l15_w),
	.ref_l16_i(ref_l16_w),.ref_l17_i(ref_l17_w),.ref_l18_i(ref_l18_w),.ref_l19_i(ref_l19_w),.ref_l20_i(ref_l20_w),.ref_l21_i(ref_l21_w),.ref_l22_i(ref_l22_w),.ref_l23_i(ref_l23_w),
	.ref_l24_i(ref_l24_w),.ref_l25_i(ref_l25_w),.ref_l26_i(ref_l26_w),.ref_l27_i(ref_l27_w),.ref_l28_i(ref_l28_w),.ref_l29_i(ref_l29_w),.ref_l30_i(ref_l30_w),.ref_l31_i(ref_l31_w),

	.ref_d00_i(ref_d00_w),.ref_d01_i(ref_d01_w),.ref_d02_i(ref_d02_w),.ref_d03_i(ref_d03_w),.ref_d04_i(ref_d04_w),.ref_d05_i(ref_d05_w),.ref_d06_i(ref_d06_w),.ref_d07_i(ref_d07_w),
	.ref_d08_i(ref_d08_w),.ref_d09_i(ref_d09_w),.ref_d10_i(ref_d10_w),.ref_d11_i(ref_d11_w),.ref_d12_i(ref_d12_w),.ref_d13_i(ref_d13_w),.ref_d14_i(ref_d14_w),.ref_d15_i(ref_d15_w),
	.ref_d16_i(ref_d16_w),.ref_d17_i(ref_d17_w),.ref_d18_i(ref_d18_w),.ref_d19_i(ref_d19_w),.ref_d20_i(ref_d20_w),.ref_d21_i(ref_d21_w),.ref_d22_i(ref_d22_w),.ref_d23_i(ref_d23_w),
	.ref_d24_i(ref_d24_w),.ref_d25_i(ref_d25_w),.ref_d26_i(ref_d26_w),.ref_d27_i(ref_d27_w),.ref_d28_i(ref_d28_w),.ref_d29_i(ref_d29_w),.ref_d30_i(ref_d30_w),.ref_d31_i(ref_d31_w),

	.pred_00_o(pre_data_o[`PIXEL_WIDTH*16-1:`PIXEL_WIDTH*15]),.pred_01_o(pre_data_o[`PIXEL_WIDTH*15-1:`PIXEL_WIDTH*14]),
	.pred_02_o(pre_data_o[`PIXEL_WIDTH*14-1:`PIXEL_WIDTH*13]),.pred_03_o(pre_data_o[`PIXEL_WIDTH*13-1:`PIXEL_WIDTH*12]),
	.pred_10_o(pre_data_o[`PIXEL_WIDTH*12-1:`PIXEL_WIDTH*11]),.pred_11_o(pre_data_o[`PIXEL_WIDTH*11-1:`PIXEL_WIDTH*10]),
	.pred_12_o(pre_data_o[`PIXEL_WIDTH*10-1:`PIXEL_WIDTH* 9]),.pred_13_o(pre_data_o[`PIXEL_WIDTH* 9-1:`PIXEL_WIDTH* 8]),
	.pred_20_o(pre_data_o[`PIXEL_WIDTH* 8-1:`PIXEL_WIDTH* 7]),.pred_21_o(pre_data_o[`PIXEL_WIDTH* 7-1:`PIXEL_WIDTH* 6]),
	.pred_22_o(pre_data_o[`PIXEL_WIDTH* 6-1:`PIXEL_WIDTH* 5]),.pred_23_o(pre_data_o[`PIXEL_WIDTH* 5-1:`PIXEL_WIDTH* 4]),
	.pred_30_o(pre_data_o[`PIXEL_WIDTH* 4-1:`PIXEL_WIDTH* 3]),.pred_31_o(pre_data_o[`PIXEL_WIDTH* 3-1:`PIXEL_WIDTH* 2]),
	.pred_32_o(pre_data_o[`PIXEL_WIDTH* 2-1:`PIXEL_WIDTH* 1]),.pred_33_o(pre_data_o[`PIXEL_WIDTH* 1-1:`PIXEL_WIDTH* 0]),

	 .done_o			(pre_en_o),
	 //pre_sel_o 		,
	 .size_o			(pre_size_o	),
	 .i4x4_x_o		(pre_4x4_x_o),
	 .i4x4_y_o		(pre_4x4_y_o)
);

  // intra_ref
  intra_ref u_intra_ref(
    .clk                ( clk              ),
    .rst_n              ( rst_n            ),
    // intra ctrl if
    .start_i            ( ref_start_w      ),
    .done_o             ( ref_done_w       ),
    .size_i             ( ref_size_w       ),
    .mode_i             ( ref_mode_w       ),
    .pre_min_size_i     ( pre_min_size_i   ),
    .ref_sel_i          ( ref_sel_w        ),
    .position_i         ( ref_position_w[5:0]           ),
    .pre_ready_o        ( ref_ready_w      ),
    .LCU_x_i            ( {mb_x_i,ref_position_w[6]}    ),
    .LCU_y_i            ( {mb_y_i,ref_position_w[7]}    ),
    .LCU_x_total        ( {mb_x_total_i,1'b1}           ),
    // tq if
    .rec_val_i          ( rec_val_i        ),
    .rec_idx_i          ( rec_idx_i        ),
    .rec_data_i         ( rec_data_i       ),
    // pt if
    .cover_valid_i      ( cover_valid_i    ),
    .cover_value_i      ( cover_value_i    ),
    // row/col sram if
    .wena_o             ( wena_w           ),
    .w_addr_row_o       ( w_addr_row_w     ),    .w_addr_col_o       ( w_addr_col_w     ),
    .w_data_row_o       ( w_data_row_w     ),    .w_data_col_o       ( w_data_col_w     ),
    // frame sram if
    .wena_frame_o       ( wena_frame_w     ),
    .w_data_frame_o     ( w_data_frame_w   ),
    .w_addr_frame_o     ( w_addr_frame_w   ),
    // row/col sram if
    .cena_row_o         ( cena_row_w       ),    .cena_col_o         ( cena_col_w       ),
    .r_addr_row_o       ( r_addr_row_w     ),    .r_addr_col_o       ( r_addr_col_w     ),
    .r_data_row_i_y     ( r_data_row_w     ),    .r_data_col_0_i_y   ( r_data_col_0_w   ),
                                                 .r_data_col_1_i_y   ( r_data_col_1_w   ),
                                                 .r_data_col_2_i_y   ( r_data_col_2_w   ),
    .r_data_row_i_u     ( r_data_row_w_u   ),    .r_data_col_0_i_u   ( r_data_col_0_w_u ),
                                                 .r_data_col_1_i_u   ( r_data_col_1_w_u ),
                                                 .r_data_col_2_i_u   ( r_data_col_2_w_u ),
    .r_data_row_i_v     ( r_data_row_w_v   ),    .r_data_col_0_i_v   ( r_data_col_0_w_v ),
                                                 .r_data_col_1_i_v   ( r_data_col_1_w_v ),
                                                 .r_data_col_2_i_v   ( r_data_col_2_w_v ),

    // frame sram if
    .cena_frame_o       ( cena_frame_w     ),
    .r_data_frame_i_y   ( r_data_frame_w   ),
    .r_data_frame_i_u   ( r_data_frame_w_u ),
    .r_data_frame_i_v   ( r_data_frame_w_v ),
    .r_addr_frame_o     ( r_addr_frame_w   ),
    // intra pred if tl
    .ref_tl_o           ( ref_tl_w         ),
    // intra pred if t
    .ref_t00_o(ref_t00_w),.ref_t01_o(ref_t01_w),.ref_t02_o(ref_t02_w),.ref_t03_o(ref_t03_w),.ref_t04_o(ref_t04_w),.ref_t05_o(ref_t05_w),.ref_t06_o(ref_t06_w),.ref_t07_o(ref_t07_w),
    .ref_t08_o(ref_t08_w),.ref_t09_o(ref_t09_w),.ref_t10_o(ref_t10_w),.ref_t11_o(ref_t11_w),.ref_t12_o(ref_t12_w),.ref_t13_o(ref_t13_w),.ref_t14_o(ref_t14_w),.ref_t15_o(ref_t15_w),
    .ref_t16_o(ref_t16_w),.ref_t17_o(ref_t17_w),.ref_t18_o(ref_t18_w),.ref_t19_o(ref_t19_w),.ref_t20_o(ref_t20_w),.ref_t21_o(ref_t21_w),.ref_t22_o(ref_t22_w),.ref_t23_o(ref_t23_w),
    .ref_t24_o(ref_t24_w),.ref_t25_o(ref_t25_w),.ref_t26_o(ref_t26_w),.ref_t27_o(ref_t27_w),.ref_t28_o(ref_t28_w),.ref_t29_o(ref_t29_w),.ref_t30_o(ref_t30_w),.ref_t31_o(ref_t31_w),
    // intra pred if r
    .ref_r00_o(ref_r00_w),.ref_r01_o(ref_r01_w),.ref_r02_o(ref_r02_w),.ref_r03_o(ref_r03_w),.ref_r04_o(ref_r04_w),.ref_r05_o(ref_r05_w),.ref_r06_o(ref_r06_w),.ref_r07_o(ref_r07_w),
    .ref_r08_o(ref_r08_w),.ref_r09_o(ref_r09_w),.ref_r10_o(ref_r10_w),.ref_r11_o(ref_r11_w),.ref_r12_o(ref_r12_w),.ref_r13_o(ref_r13_w),.ref_r14_o(ref_r14_w),.ref_r15_o(ref_r15_w),
    .ref_r16_o(ref_r16_w),.ref_r17_o(ref_r17_w),.ref_r18_o(ref_r18_w),.ref_r19_o(ref_r19_w),.ref_r20_o(ref_r20_w),.ref_r21_o(ref_r21_w),.ref_r22_o(ref_r22_w),.ref_r23_o(ref_r23_w),
    .ref_r24_o(ref_r24_w),.ref_r25_o(ref_r25_w),.ref_r26_o(ref_r26_w),.ref_r27_o(ref_r27_w),.ref_r28_o(ref_r28_w),.ref_r29_o(ref_r29_w),.ref_r30_o(ref_r30_w),.ref_r31_o(ref_r31_w),
    // intra pred if l
    .ref_l00_o(ref_l00_w),.ref_l01_o(ref_l01_w),.ref_l02_o(ref_l02_w),.ref_l03_o(ref_l03_w),.ref_l04_o(ref_l04_w),.ref_l05_o(ref_l05_w),.ref_l06_o(ref_l06_w),.ref_l07_o(ref_l07_w),
    .ref_l08_o(ref_l08_w),.ref_l09_o(ref_l09_w),.ref_l10_o(ref_l10_w),.ref_l11_o(ref_l11_w),.ref_l12_o(ref_l12_w),.ref_l13_o(ref_l13_w),.ref_l14_o(ref_l14_w),.ref_l15_o(ref_l15_w),
    .ref_l16_o(ref_l16_w),.ref_l17_o(ref_l17_w),.ref_l18_o(ref_l18_w),.ref_l19_o(ref_l19_w),.ref_l20_o(ref_l20_w),.ref_l21_o(ref_l21_w),.ref_l22_o(ref_l22_w),.ref_l23_o(ref_l23_w),
    .ref_l24_o(ref_l24_w),.ref_l25_o(ref_l25_w),.ref_l26_o(ref_l26_w),.ref_l27_o(ref_l27_w),.ref_l28_o(ref_l28_w),.ref_l29_o(ref_l29_w),.ref_l30_o(ref_l30_w),.ref_l31_o(ref_l31_w),
    // intra pred if d
    .ref_d00_o(ref_d00_w),.ref_d01_o(ref_d01_w),.ref_d02_o(ref_d02_w),.ref_d03_o(ref_d03_w),.ref_d04_o(ref_d04_w),.ref_d05_o(ref_d05_w),.ref_d06_o(ref_d06_w),.ref_d07_o(ref_d07_w),
    .ref_d08_o(ref_d08_w),.ref_d09_o(ref_d09_w),.ref_d10_o(ref_d10_w),.ref_d11_o(ref_d11_w),.ref_d12_o(ref_d12_w),.ref_d13_o(ref_d13_w),.ref_d14_o(ref_d14_w),.ref_d15_o(ref_d15_w),
    .ref_d16_o(ref_d16_w),.ref_d17_o(ref_d17_w),.ref_d18_o(ref_d18_w),.ref_d19_o(ref_d19_w),.ref_d20_o(ref_d20_w),.ref_d21_o(ref_d21_w),.ref_d22_o(ref_d22_w),.ref_d23_o(ref_d23_w),
    .ref_d24_o(ref_d24_w),.ref_d25_o(ref_d25_w),.ref_d26_o(ref_d26_w),.ref_d27_o(ref_d27_w),.ref_d28_o(ref_d28_w),.ref_d29_o(ref_d29_w),.ref_d30_o(ref_d30_w),.ref_d31_o(ref_d31_w)
    );

//*********************************************************************
//******************* frame/row/colunm RAM*****************************
//*********************************************************************

// y

ram_frame_row_32x480  u_fram_ram(
				.clka    (clk),
				.cena_i  ( ~( (wena_frame_w)&&(ref_sel_w==2'b00) ) ),
		    .oena_i  (1'b1),
		    .wena_i  ( ~( (wena_frame_w)&&(ref_sel_w==2'b00) ) ),
		    .addra_i (w_addr_frame_w),
		    .dataa_o (),
		    .dataa_i (w_data_frame_w),

				.clkb    (clk),
				.cenb_i  (~cena_frame_w),
				.oenb_i  (1'b0),
				.wenb_i  (1'b1),
				.addrb_i (r_addr_frame_w),
				.datab_o (r_data_frame_w),
				.datab_i ()
);

ram_lcu_row_32x64 u_row_ram(
				.clka    (clk),
				.cena_i  ( ~( (wena_w)&&(ref_sel_w==2'b00) ) ),
		    .oena_i  (1'b1),
		    .wena_i  ( ~( (wena_w)&&(ref_sel_w==2'b00) ) ),
		    .addra_i (w_addr_row_w),
		    .dataa_o (),
		    .dataa_i (w_data_row_w),

				.clkb    (clk),
				.cenb_i  (~cena_row_w),
				.oenb_i  (1'b0),
				.wenb_i  (1'b1),
				.addrb_i (r_addr_row_w),
				.datab_o (r_data_row_w),
				.datab_i ()
);
                                                                                        // actual depth
ram_lcu_column_32x64 u_column_ram_0(                                                    //      56
				.clka    (clk),
				.cena_i  ( ~( (wena_w)&&(ref_sel_w==2'b00) ) ),
		    .oena_i  (1'b1),
		    .wena_i  ( ~( (wena_w)&&(ref_sel_w==2'b00) ) ),
		    .addra_i (w_addr_col_w),
		    .dataa_o (),
		    .dataa_i (w_data_col_w),

				.clkb    (clk),
				.cenb_i  (~cena_col_w),
				.oenb_i  (1'b0),
				.wenb_i  (1'b1),
				.addrb_i (r_addr_col_w),
				.datab_o (r_data_col_0_w),
				.datab_i ()
);

  ram_lcu_column_32x64 u_column_ram_1(                                                    //      8
    .clka     ( clk                 ),
    .oena_i   ( 1'b1                ),
    .cena_i   ( ~( (wena_w)&&(ref_sel_w==2'b00)&&(!ref_position_w[7]) )    ),
    .wena_i   ( ~( (wena_w)&&(ref_sel_w==2'b00)&&(!ref_position_w[7]) )    ),
    .addra_i  ( w_addr_col_w        ),
    .dataa_o  (                     ),
    .dataa_i  ( w_data_col_w        ),

    .clkb     ( clk                 ),
    .cenb_i   ( ~cena_col_w         ),
    .oenb_i   ( 1'b0                ),
    .wenb_i   ( 1'b1                ),
    .addrb_i  ( r_addr_col_w        ),
    .datab_o  ( r_data_col_1_w      ),
    .datab_i  (                     )
    );

  wire [5:0] r_addr_col_2_w ;
  assign r_addr_col_2_w = ref_position_w[7] ? r_addr_col_w : (r_addr_col_w+'d56) ;

  ram_lcu_column_32x64 u_column_ram_2(                                                    //      8
    .clka     ( clk                 ),
    .oena_i   ( 1'b1                ),
    .cena_i   ( ~( (wena_w)&&(ref_sel_w==2'b00)&&(ref_position_w[7]) )    ),
    .wena_i   ( ~( (wena_w)&&(ref_sel_w==2'b00)&&(ref_position_w[7]) )    ),
    .addra_i  ( w_addr_col_w        ),
    .dataa_o  (                     ),
    .dataa_i  ( w_data_col_w        ),

    .clkb     ( clk                 ),
    .cenb_i   ( ~cena_col_w         ),
    .oenb_i   ( 1'b0                ),
    .wenb_i   ( 1'b1                ),
    .addrb_i  ( r_addr_col_2_w      ),
    .datab_o  ( r_data_col_2_w      ),
    .datab_i  (                     )
    );

// u

ram_frame_row_32x480  u_fram_ram_u(
				.clka    (clk),
				.cena_i  ( ~( (wena_frame_w)&&(ref_sel_w==2'b10) ) ),
		    .oena_i  (1'b1),
		    .wena_i  ( ~( (wena_frame_w)&&(ref_sel_w==2'b10) ) ),
		    .addra_i (w_addr_frame_w),
		    .dataa_o (),
		    .dataa_i (w_data_frame_w),

				.clkb    (clk),
				.cenb_i  (~cena_frame_w),
				.oenb_i  (1'b0),
				.wenb_i  (1'b1),
				.addrb_i (r_addr_frame_w),
				.datab_o (r_data_frame_w_u),
				.datab_i ()
);

ram_lcu_row_32x64 u_row_ram_u(
				.clka    (clk),
				.cena_i  ( ~( (wena_w)&&(ref_sel_w==2'b10) ) ),
		    .oena_i  (1'b1),
		    .wena_i  ( ~( (wena_w)&&(ref_sel_w==2'b10) ) ),
		    .addra_i (w_addr_row_w),
		    .dataa_o (),
		    .dataa_i (w_data_row_w),

				.clkb    (clk),
				.cenb_i  (~cena_row_w),
				.oenb_i  (1'b0),
				.wenb_i  (1'b1),
				.addrb_i (r_addr_row_w),
				.datab_o (r_data_row_w_u),
				.datab_i ()
);
                                                                                          // actual depth
ram_lcu_column_32x64 u_column_ram_0_u(                                                    //      12
				.clka    (clk),
				.cena_i  ( ~( (wena_w)&&(ref_sel_w==2'b10) ) ),
		    .oena_i  (1'b1),
		    .wena_i  ( ~( (wena_w)&&(ref_sel_w==2'b10) ) ),
		    .addra_i (w_addr_col_w),
		    .dataa_o (),
		    .dataa_i (w_data_col_w),

				.clkb    (clk),
				.cenb_i  (~cena_col_w),
				.oenb_i  (1'b0),
				.wenb_i  (1'b1),
				.addrb_i (r_addr_col_w),
				.datab_o (r_data_col_0_w_u),
				.datab_i ()
);

  ram_lcu_column_32x64 u_column_ram_1_u(                                                  //      4
    .clka     ( clk                 ),
    .oena_i   ( 1'b1                ),
    .cena_i   ( ~( (wena_w)&&(ref_sel_w==2'b10)&&(!ref_position_w[7]) )    ),
    .wena_i   ( ~( (wena_w)&&(ref_sel_w==2'b10)&&(!ref_position_w[7]) )    ),
    .addra_i  ( w_addr_col_w        ),
    .dataa_o  (                     ),
    .dataa_i  ( w_data_col_w        ),

    .clkb     ( clk                 ),
    .cenb_i   ( ~cena_col_w         ),
    .oenb_i   ( 1'b0                ),
    .wenb_i   ( 1'b1                ),
    .addrb_i  ( r_addr_col_w        ),
    .datab_o  ( r_data_col_1_w_u    ),
    .datab_i  (                     )
    );

  wire [5:0] r_addr_col_2_w_u ;
  assign r_addr_col_2_w_u = ref_position_w[7] ? r_addr_col_w : (r_addr_col_w+'d12) ;

  ram_lcu_column_32x64 u_column_ram_2_u(                                                  //      4
    .clka     ( clk                 ),
    .oena_i   ( 1'b1                ),
    .cena_i   ( ~( (wena_w)&&(ref_sel_w==2'b10)&&(ref_position_w[7]) )    ),
    .wena_i   ( ~( (wena_w)&&(ref_sel_w==2'b10)&&(ref_position_w[7]) )    ),
    .addra_i  ( w_addr_col_w        ),
    .dataa_o  (                     ),
    .dataa_i  ( w_data_col_w        ),

    .clkb     ( clk                 ),
    .cenb_i   ( ~cena_col_w         ),
    .oenb_i   ( 1'b0                ),
    .wenb_i   ( 1'b1                ),
    .addrb_i  ( r_addr_col_2_w_u    ),
    .datab_o  ( r_data_col_2_w_u    ),
    .datab_i  (                     )
    );

// v

ram_frame_row_32x480  u_fram_ram_v(
				.clka    (clk),
				.cena_i  ( ~( (wena_frame_w)&&(ref_sel_w==2'b11) ) ),
		    .oena_i  (1'b1),
		    .wena_i  ( ~( (wena_frame_w)&&(ref_sel_w==2'b11) ) ),
		    .addra_i (w_addr_frame_w),
		    .dataa_o (),
		    .dataa_i (w_data_frame_w),

				.clkb    (clk),
				.cenb_i  (~cena_frame_w),
				.oenb_i  (1'b0),
				.wenb_i  (1'b1),
				.addrb_i (r_addr_frame_w),
				.datab_o (r_data_frame_w_v),
				.datab_i ()
);

ram_lcu_row_32x64 u_row_ram_v(
				.clka    (clk),
				.cena_i  ( ~( (wena_w)&&(ref_sel_w==2'b11) ) ),
		    .oena_i  (1'b1),
		    .wena_i  ( ~( (wena_w)&&(ref_sel_w==2'b11) ) ),
		    .addra_i (w_addr_row_w),
		    .dataa_o (),
		    .dataa_i (w_data_row_w),

				.clkb    (clk),
				.cenb_i  (~cena_row_w),
				.oenb_i  (1'b0),
				.wenb_i  (1'b1),
				.addrb_i (r_addr_row_w),
				.datab_o (r_data_row_w_v),
				.datab_i ()
);
                                                                                          // actual depth
ram_lcu_column_32x64 u_column_ram_0_v(                                                    //      12
				.clka    (clk),
				.cena_i  ( ~( (wena_w)&&(ref_sel_w==2'b11) ) ),
		    .oena_i  (1'b1),
		    .wena_i  ( ~( (wena_w)&&(ref_sel_w==2'b11) ) ),
		    .addra_i (w_addr_col_w),
		    .dataa_o (),
		    .dataa_i (w_data_col_w),

				.clkb    (clk),
				.cenb_i  (~cena_col_w),
				.oenb_i  (1'b0),
				.wenb_i  (1'b1),
				.addrb_i (r_addr_col_w),
				.datab_o (r_data_col_0_w_v),
				.datab_i ()
);

  ram_lcu_column_32x64 u_column_ram_1_v(                                                  //      4
    .clka     ( clk                 ),
    .oena_i   ( 1'b1                ),
    .cena_i   ( ~( (wena_w)&&(ref_sel_w==2'b11)&&(!ref_position_w[7]) )    ),
    .wena_i   ( ~( (wena_w)&&(ref_sel_w==2'b11)&&(!ref_position_w[7]) )    ),
    .addra_i  ( w_addr_col_w        ),
    .dataa_o  (                     ),
    .dataa_i  ( w_data_col_w        ),

    .clkb     ( clk                 ),
    .cenb_i   ( ~cena_col_w         ),
    .oenb_i   ( 1'b0                ),
    .wenb_i   ( 1'b1                ),
    .addrb_i  ( r_addr_col_w        ),
    .datab_o  ( r_data_col_1_w_v    ),
    .datab_i  (                     )
    );

  wire [5:0] r_addr_col_2_w_v ;
  assign r_addr_col_2_w_v = ref_position_w[7] ? r_addr_col_w : (r_addr_col_w+'d12) ;

  ram_lcu_column_32x64 u_column_ram_2_v(                                                  //      4
    .clka     ( clk                 ),
    .oena_i   ( 1'b1                ),
    .cena_i   ( ~( (wena_w)&&(ref_sel_w==2'b11)&&(ref_position_w[7]) )    ),
    .wena_i   ( ~( (wena_w)&&(ref_sel_w==2'b11)&&(ref_position_w[7]) )    ),
    .addra_i  ( w_addr_col_w        ),
    .dataa_o  (                     ),
    .dataa_i  ( w_data_col_w        ),

    .clkb     ( clk                 ),
    .cenb_i   ( ~cena_col_w         ),
    .oenb_i   ( 1'b0                ),
    .wenb_i   ( 1'b1                ),
    .addrb_i  ( r_addr_col_2_w_v    ),
    .datab_o  ( r_data_col_2_w_v    ),
    .datab_i  (                     )
    );

// intra_ctrl
/*
intra_ctrl u_intra_ctrl(
	clk
	rst_n

	// SYS IF
	mb_x_total_i
	mb_x_i
	mb_y_i
	start_i
	done_o

	// Intra Pred IF
	pre_start_o
	pre_done_i
	pre_mode_o
	pre_size_o
	pre_i4x4_x_o
	pre_i4x4_y_o

	// Intra Ref IF
	ref_start_o
	ref_done_i
	ref_size_o
	ref_i4x4_x_o
	ref_i4x4_y_o
);
*/





/*
intra_pred u_intra_pred(
	clk
	rst_n

	// Intra Ctrl IF
	start_i
	done_o
	mode_i
	size_i
	i4x4_x_i
	i4x4_y_i

	// Intra Pred IF
	ref_tl_i

	ref_t00_i,ref_t01_i,ref_t02_i,ref_t03_i,ref_t04_i,ref_t05_i,ref_t06_i,ref_t07_i,
	ref_t08_i,ref_t09_i,ref_t10_i,ref_t11_i,ref_t12_i,ref_t13_i,ref_t14_i,ref_t15_i,
	ref_t16_i,ref_t17_i,ref_t18_i,ref_t19_i,ref_t20_i,ref_t21_i,ref_t22_i,ref_t23_i,
	ref_t24_i,ref_t25_i,ref_t26_i,ref_t27_i,ref_t28_i,ref_t29_i,ref_t30_i,ref_t31_i,

	ref_r00_i,ref_r01_i,ref_r02_i,ref_r03_i,ref_r04_i,ref_r05_i,ref_r06_i,ref_r07_i,
	ref_r08_i,ref_r09_i,ref_r10_i,ref_r11_i,ref_r12_i,ref_r13_i,ref_r14_i,ref_r15_i,
	ref_r16_i,ref_r17_i,ref_r18_i,ref_r19_i,ref_r20_i,ref_r21_i,ref_r22_i,ref_r23_i,
	ref_r24_i,ref_r25_i,ref_r26_i,ref_r27_i,ref_r28_i,ref_r29_i,ref_r30_i,ref_r31_i,

	ref_l00_i,ref_l01_i,ref_l02_i,ref_l03_i,ref_l04_i,ref_l05_i,ref_l06_i,ref_l07_i,
	ref_l08_i,ref_l09_i,ref_l10_i,ref_l11_i,ref_l12_i,ref_l13_i,ref_l14_i,ref_l15_i,
	ref_l16_i,ref_l17_i,ref_l18_i,ref_l19_i,ref_l20_i,ref_l21_i,ref_l22_i,ref_l23_i,
	ref_l24_i,ref_l25_i,ref_l26_i,ref_l27_i,ref_l28_i,ref_l29_i,ref_l30_i,ref_l31_i,

	ref_d00_i,ref_d01_i,ref_d02_i,ref_d03_i,ref_d04_i,ref_d05_i,ref_d06_i,ref_d07_i,
	ref_d08_i,ref_d09_i,ref_d10_i,ref_d11_i,ref_d12_i,ref_d13_i,ref_d14_i,ref_d15_i,
	ref_d16_i,ref_d17_i,ref_d18_i,ref_d19_i,ref_d20_i,ref_d21_i,ref_d22_i,ref_d23_i,
	ref_d24_i,ref_d25_i,ref_d26_i,ref_d27_i,ref_d28_i,ref_d29_i,ref_d30_i,ref_d31_i,

	// Intra Ref IF
	pre_00_o,pre_01_o,pre_02_o,pre_03_o,
	pre_10_o,pre_11_o,pre_12_o,pre_13_o,
	pre_20_o,pre_21_o,pre_22_o,pre_23_o,
	pre_30_o,pre_31_o,pre_32_o,pre_33_o
);
*/



/*
intra_ref u_intra_ref(
	clk
	rst_n

	// Intra Ctrl IF
	start_i

	done_o
	size_i
	i4x4_x_i
	i4x4_y_i

	// TQ IF
	rec_val_i
	rec_idx_i
	rec_data_i

	// Intra Pred IF
	ref_tl_o

	ref_t00_o,ref_t01_o,ref_t02_o,ref_t03_o,ref_t04_o,ref_t05_o,ref_t06_o,ref_t07_o,
	ref_t08_o,ref_t09_o,ref_t10_o,ref_t11_o,ref_t12_o,ref_t13_o,ref_t14_o,ref_t15_o,
	ref_t16_o,ref_t17_o,ref_t18_o,ref_t19_o,ref_t20_o,ref_t21_o,ref_t22_o,ref_t23_o,
	ref_t24_o,ref_t25_o,ref_t26_o,ref_t27_o,ref_t28_o,ref_t29_o,ref_t30_o,ref_t31_o,

	ref_r00_o,ref_r01_o,ref_r02_o,ref_r03_o,ref_r04_o,ref_r05_o,ref_r06_o,ref_r07_o,
	ref_r08_o,ref_r09_o,ref_r10_o,ref_r11_o,ref_r12_o,ref_r13_o,ref_r14_o,ref_r15_o,
	ref_r16_o,ref_r17_o,ref_r18_o,ref_r19_o,ref_r20_o,ref_r21_o,ref_r22_o,ref_r23_o,
	ref_r24_o,ref_r25_o,ref_r26_o,ref_r27_o,ref_r28_o,ref_r29_o,ref_r30_o,ref_r31_o,

	ref_l00_o,ref_l01_o,ref_l02_o,ref_l03_o,ref_l04_o,ref_l05_o,ref_l06_o,ref_l07_o,
	ref_l08_o,ref_l09_o,ref_l10_o,ref_l11_o,ref_l12_o,ref_l13_o,ref_l14_o,ref_l15_o,
	ref_l16_o,ref_l17_o,ref_l18_o,ref_l19_o,ref_l20_o,ref_l21_o,ref_l22_o,ref_l23_o,
	ref_l24_o,ref_l25_o,ref_l26_o,ref_l27_o,ref_l28_o,ref_l29_o,ref_l30_o,ref_l31_o,

	ref_d00_o,ref_d01_o,ref_d02_o,ref_d03_o,ref_d04_o,ref_d05_o,ref_d06_o,ref_d07_o,
	ref_d08_o,ref_d09_o,ref_d10_o,ref_d11_o,ref_d12_o,ref_d13_o,ref_d14_o,ref_d15_o,
	ref_d16_o,ref_d17_o,ref_d18_o,ref_d19_o,ref_d20_o,ref_d21_o,ref_d22_o,ref_d23_o,
	ref_d24_o,ref_d25_o,ref_d26_o,ref_d27_o,ref_d28_o,ref_d29_o,ref_d30_o,ref_d31_o,
);
*/


endmodule