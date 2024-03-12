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
//  Filename      : intra_ref.v
//  Author        : Liu Cong
//  Created       : 2014-3
//  Description   : do the reference pixel PADDING and FILTER
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-07-17 by HLL
//  Description   : lcu size changed into 64x64 (prediction to 64x64 block remains to be added)
//  Modified      : 2014-08-23 by HLL
//  Description   : optional mode for minimal tu size added
//  Modified      : 2014-08-25 by HLL
//  Description   : prediction to u added
//  Modified      : 2014-08-26 by HLL
//  Description   : prediction to v added
//  Modified      : 2014-09-10 by HLL
//  Description   : sel_o modified
//  Modified      : 2014-09-22 by HLL
//  Description   : separated reconstruction and cover signals supported
//                  (cover signals could come later than reconstruction signals instead of simultaneously)
//  Modified      : 2015-03-11 by HLL
//  Description   : bug removed (r_addr_col_o didn't jump from 15 to 0 in FREAD state when doing chroma prediction)
//  Modified      : 2015-07-13 by HLL
//  Description   : bug removed (r_done_r1==1 would cover rcnt_r=='d17 when size_i==2'b11)
//
//  $Id$
//
//-------------------------------------------------------------------

`include "./enc_defines.v"


module intra_ref(
  clk                ,
  rst_n              ,
  // intra ctrl if
  start_i            ,
  done_o             ,
  size_i             ,
  mode_i             ,
  pre_min_size_i     ,
  ref_sel_i          ,
  position_i         ,
  pre_ready_o        ,
  LCU_x_i            ,
  LCU_y_i            ,
  LCU_x_total        ,
  // tq if
  rec_val_i          ,
  rec_idx_i          ,
  rec_data_i         ,
  // pt if
  cover_valid_i      ,
  cover_value_i      ,
  // row/col sram if
  wena_o             ,
  w_addr_row_o       ,  w_addr_col_o       ,
  w_data_row_o       ,  w_data_col_o       ,
  // frame sram if
  wena_frame_o       ,
  w_addr_frame_o     ,
  w_data_frame_o     ,
  // row/col sram if
  cena_row_o         ,  cena_col_o         ,
  r_addr_row_o       ,  r_addr_col_o       ,
  r_data_row_i_y     ,  r_data_col_0_i_y   ,
                        r_data_col_1_i_y   ,
                        r_data_col_2_i_y   ,
  r_data_row_i_u     ,  r_data_col_0_i_u   ,
                        r_data_col_1_i_u   ,
                        r_data_col_2_i_u   ,
  r_data_row_i_v     ,  r_data_col_0_i_v   ,
                        r_data_col_1_i_v   ,
                        r_data_col_2_i_v   ,
  // frame sram if
  cena_frame_o       ,
  r_data_frame_i_y   ,
  r_data_frame_i_u   ,
  r_data_frame_i_v   ,
  r_addr_frame_o     ,
  // intra pred if tl
  ref_tl_o           ,
  // intra pred if t
  ref_t00_o          ,  ref_t01_o          ,  ref_t02_o          ,  ref_t03_o          ,
  ref_t04_o          ,  ref_t05_o          ,  ref_t06_o          ,  ref_t07_o          ,
  ref_t08_o          ,  ref_t09_o          ,  ref_t10_o          ,  ref_t11_o          ,
  ref_t12_o          ,  ref_t13_o          ,  ref_t14_o          ,  ref_t15_o          ,
  ref_t16_o          ,  ref_t17_o          ,  ref_t18_o          ,  ref_t19_o          ,
  ref_t20_o          ,  ref_t21_o          ,  ref_t22_o          ,  ref_t23_o          ,
  ref_t24_o          ,  ref_t25_o          ,  ref_t26_o          ,  ref_t27_o          ,
  ref_t28_o          ,  ref_t29_o          ,  ref_t30_o          ,  ref_t31_o          ,
  // intra pred if r
  ref_r00_o          ,  ref_r01_o          ,  ref_r02_o          ,  ref_r03_o          ,
  ref_r04_o          ,  ref_r05_o          ,  ref_r06_o          ,  ref_r07_o          ,
  ref_r08_o          ,  ref_r09_o          ,  ref_r10_o          ,  ref_r11_o          ,
  ref_r12_o          ,  ref_r13_o          ,  ref_r14_o          ,  ref_r15_o          ,
  ref_r16_o          ,  ref_r17_o          ,  ref_r18_o          ,  ref_r19_o          ,
  ref_r20_o          ,  ref_r21_o          ,  ref_r22_o          ,  ref_r23_o          ,
  ref_r24_o          ,  ref_r25_o          ,  ref_r26_o          ,  ref_r27_o          ,
  ref_r28_o          ,  ref_r29_o          ,  ref_r30_o          ,  ref_r31_o          ,
  // intra pred if l
  ref_l00_o          ,  ref_l01_o          ,  ref_l02_o          ,  ref_l03_o          ,
  ref_l04_o          ,  ref_l05_o          ,  ref_l06_o          ,  ref_l07_o          ,
  ref_l08_o          ,  ref_l09_o          ,  ref_l10_o          ,  ref_l11_o          ,
  ref_l12_o          ,  ref_l13_o          ,  ref_l14_o          ,  ref_l15_o          ,
  ref_l16_o          ,  ref_l17_o          ,  ref_l18_o          ,  ref_l19_o          ,
  ref_l20_o          ,  ref_l21_o          ,  ref_l22_o          ,  ref_l23_o          ,
  ref_l24_o          ,  ref_l25_o          ,  ref_l26_o          ,  ref_l27_o          ,
  ref_l28_o          ,  ref_l29_o          ,  ref_l30_o          ,  ref_l31_o          ,
  // intra pred if d
  ref_d00_o          ,  ref_d01_o          ,  ref_d02_o          ,  ref_d03_o          ,
  ref_d04_o          ,  ref_d05_o          ,  ref_d06_o          ,  ref_d07_o          ,
  ref_d08_o          ,  ref_d09_o          ,  ref_d10_o          ,  ref_d11_o          ,
  ref_d12_o          ,  ref_d13_o          ,  ref_d14_o          ,  ref_d15_o          ,
  ref_d16_o          ,  ref_d17_o          ,  ref_d18_o          ,  ref_d19_o          ,
  ref_d20_o          ,  ref_d21_o          ,  ref_d22_o          ,  ref_d23_o          ,
  ref_d24_o          ,  ref_d25_o          ,  ref_d26_o          ,  ref_d27_o          ,
  ref_d28_o          ,  ref_d29_o          ,  ref_d30_o          ,  ref_d31_o
  );




//*********************************************** INPUT/OUTPUT *********************************************

  input clk,rst_n;
  // intra ctrl if
  input                               start_i          ;
  output                              done_o           ;
  input    [1                 : 0]    size_i           ;
  input    [5                 : 0]    mode_i           ;
  input                               pre_min_size_i   ;
  input    [1                 : 0]    ref_sel_i        ;
  input    [5                 : 0]    position_i       ;
  input    [`PIC_X_WIDTH      : 0]    LCU_x_i          ;
  input    [`PIC_Y_WIDTH      : 0]    LCU_y_i          ;
  input    [`PIC_X_WIDTH      : 0]    LCU_x_total      ;
  output                              pre_ready_o      ;
  // tq if
  input                               rec_val_i        ;
  input    [4                 : 0]    rec_idx_i        ;
  input    [32*`PIXEL_WIDTH-1 : 0]    rec_data_i       ;
  // pt_if
  input                               cover_valid_i    ;
  input                               cover_value_i    ;
  // row/col sram if
  output                              wena_o           ;
  output   [5                 : 0]    w_addr_row_o     , w_addr_col_o     ;
  output   [31                : 0]    w_data_row_o     , w_data_col_o     ;
  // frame sram if
  output                              wena_frame_o     ;
  output   [8                 : 0]    w_addr_frame_o   ;                     // to be confirmed
  output   [31                : 0]    w_data_frame_o   ;
  // row/col sram if
  output                              cena_row_o       , cena_col_o       ;
  output   [5                 : 0]    r_addr_row_o     , r_addr_col_o     ;
  input    [31                : 0]    r_data_row_i_y   , r_data_col_0_i_y ;
  input    [31                : 0]                       r_data_col_1_i_y ;
  input    [31                : 0]                       r_data_col_2_i_y ;
  input    [31                : 0]    r_data_row_i_u   , r_data_col_0_i_u ;
  input    [31                : 0]                       r_data_col_1_i_u ;
  input    [31                : 0]                       r_data_col_2_i_u ;
  input    [31                : 0]    r_data_row_i_v   , r_data_col_0_i_v ;
  input    [31                : 0]                       r_data_col_1_i_v ;
  input    [31                : 0]                       r_data_col_2_i_v ;
  // frame sram if
  output                              cena_frame_o     ;
  output   [8                 : 0]    r_addr_frame_o   ;                       // to be confirmed
  input    [31                : 0]    r_data_frame_i_y ;
  input    [31                : 0]    r_data_frame_i_u ;
  input    [31                : 0]    r_data_frame_i_v ;
  // intra pred if tl
  output   [`PIXEL_WIDTH-1    : 0]    ref_tl_o         ;
  // intra pred if t
  output   [`PIXEL_WIDTH-1    : 0]    ref_t00_o        , ref_t01_o        , ref_t02_o        , ref_t03_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_t04_o        , ref_t05_o        , ref_t06_o        , ref_t07_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_t08_o        , ref_t09_o        , ref_t10_o        , ref_t11_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_t12_o        , ref_t13_o        , ref_t14_o        , ref_t15_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_t16_o        , ref_t17_o        , ref_t18_o        , ref_t19_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_t20_o        , ref_t21_o        , ref_t22_o        , ref_t23_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_t24_o        , ref_t25_o        , ref_t26_o        , ref_t27_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_t28_o        , ref_t29_o        , ref_t30_o        , ref_t31_o        ;
  // intra pred if r
  output   [`PIXEL_WIDTH-1    : 0]    ref_r00_o        , ref_r01_o        , ref_r02_o        , ref_r03_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_r04_o        , ref_r05_o        , ref_r06_o        , ref_r07_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_r08_o        , ref_r09_o        , ref_r10_o        , ref_r11_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_r12_o        , ref_r13_o        , ref_r14_o        , ref_r15_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_r16_o        , ref_r17_o        , ref_r18_o        , ref_r19_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_r20_o        , ref_r21_o        , ref_r22_o        , ref_r23_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_r24_o        , ref_r25_o        , ref_r26_o        , ref_r27_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_r28_o        , ref_r29_o        , ref_r30_o        , ref_r31_o        ;
  // intra pred if l
  output   [`PIXEL_WIDTH-1    : 0]    ref_l00_o        , ref_l01_o        , ref_l02_o        , ref_l03_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_l04_o        , ref_l05_o        , ref_l06_o        , ref_l07_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_l08_o        , ref_l09_o        , ref_l10_o        , ref_l11_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_l12_o        , ref_l13_o        , ref_l14_o        , ref_l15_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_l16_o        , ref_l17_o        , ref_l18_o        , ref_l19_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_l20_o        , ref_l21_o        , ref_l22_o        , ref_l23_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_l24_o        , ref_l25_o        , ref_l26_o        , ref_l27_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_l28_o        , ref_l29_o        , ref_l30_o        , ref_l31_o        ;
  // intra pred if d
  output   [`PIXEL_WIDTH-1    : 0]    ref_d00_o        , ref_d01_o        , ref_d02_o        , ref_d03_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_d04_o        , ref_d05_o        , ref_d06_o        , ref_d07_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_d08_o        , ref_d09_o        , ref_d10_o        , ref_d11_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_d12_o        , ref_d13_o        , ref_d14_o        , ref_d15_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_d16_o        , ref_d17_o        , ref_d18_o        , ref_d19_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_d20_o        , ref_d21_o        , ref_d22_o        , ref_d23_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_d24_o        , ref_d25_o        , ref_d26_o        , ref_d27_o        ;
  output   [`PIXEL_WIDTH-1    : 0]    ref_d28_o        , ref_d29_o        , ref_d30_o        , ref_d31_o        ;




//************************************************************************************************************

//************************** PARAMETER ***********************
 parameter    IDLE    =  3'b000,
            FREAD    = 3'b001,
            LREAD    = 3'b010,
            PADING  =  3'b011, //padding
            FILTER  =  3'b100, //filter
            WRITE    = 3'b101;
//************************************************************

//******************************************** REG ******************************************************
reg [`PIXEL_WIDTH-1:0] ref_tl_o;

reg [`PIXEL_WIDTH-1:0] ref_t00_o,ref_t01_o,ref_t02_o,ref_t03_o,ref_t04_o,ref_t05_o,ref_t06_o,ref_t07_o;
reg [`PIXEL_WIDTH-1:0] ref_t08_o,ref_t09_o,ref_t10_o,ref_t11_o,ref_t12_o,ref_t13_o,ref_t14_o,ref_t15_o;
reg [`PIXEL_WIDTH-1:0] ref_t16_o,ref_t17_o,ref_t18_o,ref_t19_o,ref_t20_o,ref_t21_o,ref_t22_o,ref_t23_o;
reg [`PIXEL_WIDTH-1:0] ref_t24_o,ref_t25_o,ref_t26_o,ref_t27_o,ref_t28_o,ref_t29_o,ref_t30_o,ref_t31_o;

reg [`PIXEL_WIDTH-1:0] ref_r00_o,ref_r01_o,ref_r02_o,ref_r03_o,ref_r04_o,ref_r05_o,ref_r06_o,ref_r07_o;
reg [`PIXEL_WIDTH-1:0] ref_r08_o,ref_r09_o,ref_r10_o,ref_r11_o,ref_r12_o,ref_r13_o,ref_r14_o,ref_r15_o;
reg [`PIXEL_WIDTH-1:0] ref_r16_o,ref_r17_o,ref_r18_o,ref_r19_o,ref_r20_o,ref_r21_o,ref_r22_o,ref_r23_o;
reg [`PIXEL_WIDTH-1:0] ref_r24_o,ref_r25_o,ref_r26_o,ref_r27_o,ref_r28_o,ref_r29_o,ref_r30_o,ref_r31_o;

reg [`PIXEL_WIDTH-1:0] ref_l00_o,ref_l01_o,ref_l02_o,ref_l03_o,ref_l04_o,ref_l05_o,ref_l06_o,ref_l07_o;
reg [`PIXEL_WIDTH-1:0] ref_l08_o,ref_l09_o,ref_l10_o,ref_l11_o,ref_l12_o,ref_l13_o,ref_l14_o,ref_l15_o;
reg [`PIXEL_WIDTH-1:0] ref_l16_o,ref_l17_o,ref_l18_o,ref_l19_o,ref_l20_o,ref_l21_o,ref_l22_o,ref_l23_o;
reg [`PIXEL_WIDTH-1:0] ref_l24_o,ref_l25_o,ref_l26_o,ref_l27_o,ref_l28_o,ref_l29_o,ref_l30_o,ref_l31_o;

reg [`PIXEL_WIDTH-1:0] ref_d00_o,ref_d01_o,ref_d02_o,ref_d03_o,ref_d04_o,ref_d05_o,ref_d06_o,ref_d07_o;
reg [`PIXEL_WIDTH-1:0] ref_d08_o,ref_d09_o,ref_d10_o,ref_d11_o,ref_d12_o,ref_d13_o,ref_d14_o,ref_d15_o;
reg [`PIXEL_WIDTH-1:0] ref_d16_o,ref_d17_o,ref_d18_o,ref_d19_o,ref_d20_o,ref_d21_o,ref_d22_o,ref_d23_o;
reg [`PIXEL_WIDTH-1:0] ref_d24_o,ref_d25_o,ref_d26_o,ref_d27_o,ref_d28_o,ref_d29_o,ref_d30_o,ref_d31_o;

reg [2:0] state,next_state;

reg avail_tl,avail_t,avail_r,avail_l,avail_d;//current CU neigbour availability

reg filter_flag;//reference filter do or not

reg w_done_w;
reg w_done_r;//reference write done
reg r_done_r;//reference read  done
reg done_o;
reg wena_frame_r;

reg pre_ready_o;//reference ready for predict

//*******************************************************************************************************

//********************************************* WIRE ****************************************************
reg LCU_t,LCU_l,LCU_tl,LCU_r;//current LCU neigbour availability

reg  [5:0] cu_num_w;

wire [3:0] i4x4_x_w,i4x4_y_w; //4x4 block index (x,y) in LCU


reg [`PIXEL_WIDTH-1:0] pref_tl_w;

reg [`PIXEL_WIDTH-1:0] pref_t00_w,pref_t01_w,pref_t02_w,pref_t03_w,pref_t04_w,pref_t05_w,pref_t06_w,pref_t07_w;
reg [`PIXEL_WIDTH-1:0] pref_t08_w,pref_t09_w,pref_t10_w,pref_t11_w,pref_t12_w,pref_t13_w,pref_t14_w,pref_t15_w;
reg [`PIXEL_WIDTH-1:0] pref_t16_w,pref_t17_w,pref_t18_w,pref_t19_w,pref_t20_w,pref_t21_w,pref_t22_w,pref_t23_w;
reg [`PIXEL_WIDTH-1:0] pref_t24_w,pref_t25_w,pref_t26_w,pref_t27_w,pref_t28_w,pref_t29_w,pref_t30_w,pref_t31_w;

reg [`PIXEL_WIDTH-1:0] pref_r00_w,pref_r01_w,pref_r02_w,pref_r03_w,pref_r04_w,pref_r05_w,pref_r06_w,pref_r07_w;
reg [`PIXEL_WIDTH-1:0] pref_r08_w,pref_r09_w,pref_r10_w,pref_r11_w,pref_r12_w,pref_r13_w,pref_r14_w,pref_r15_w;
reg [`PIXEL_WIDTH-1:0] pref_r16_w,pref_r17_w,pref_r18_w,pref_r19_w,pref_r20_w,pref_r21_w,pref_r22_w,pref_r23_w;
reg [`PIXEL_WIDTH-1:0] pref_r24_w,pref_r25_w,pref_r26_w,pref_r27_w,pref_r28_w,pref_r29_w,pref_r30_w,pref_r31_w;

reg [`PIXEL_WIDTH-1:0] pref_l00_w,pref_l01_w,pref_l02_w,pref_l03_w,pref_l04_w,pref_l05_w,pref_l06_w,pref_l07_w;
reg [`PIXEL_WIDTH-1:0] pref_l08_w,pref_l09_w,pref_l10_w,pref_l11_w,pref_l12_w,pref_l13_w,pref_l14_w,pref_l15_w;
reg [`PIXEL_WIDTH-1:0] pref_l16_w,pref_l17_w,pref_l18_w,pref_l19_w,pref_l20_w,pref_l21_w,pref_l22_w,pref_l23_w;
reg [`PIXEL_WIDTH-1:0] pref_l24_w,pref_l25_w,pref_l26_w,pref_l27_w,pref_l28_w,pref_l29_w,pref_l30_w,pref_l31_w;

reg [`PIXEL_WIDTH-1:0] pref_d00_w,pref_d01_w,pref_d02_w,pref_d03_w,pref_d04_w,pref_d05_w,pref_d06_w,pref_d07_w;
reg [`PIXEL_WIDTH-1:0] pref_d08_w,pref_d09_w,pref_d10_w,pref_d11_w,pref_d12_w,pref_d13_w,pref_d14_w,pref_d15_w;
reg [`PIXEL_WIDTH-1:0] pref_d16_w,pref_d17_w,pref_d18_w,pref_d19_w,pref_d20_w,pref_d21_w,pref_d22_w,pref_d23_w;
reg [`PIXEL_WIDTH-1:0] pref_d24_w,pref_d25_w,pref_d26_w,pref_d27_w,pref_d28_w,pref_d29_w,pref_d30_w,pref_d31_w;


reg [`PIXEL_WIDTH-1:0] fref_tl_w;

reg [`PIXEL_WIDTH-1:0] fref_t00_w,fref_t01_w,fref_t02_w,fref_t03_w,fref_t04_w,fref_t05_w,fref_t06_w,fref_t07_w;
reg [`PIXEL_WIDTH-1:0] fref_t08_w,fref_t09_w,fref_t10_w,fref_t11_w,fref_t12_w,fref_t13_w,fref_t14_w,fref_t15_w;
reg [`PIXEL_WIDTH-1:0] fref_t16_w,fref_t17_w,fref_t18_w,fref_t19_w,fref_t20_w,fref_t21_w,fref_t22_w,fref_t23_w;
reg [`PIXEL_WIDTH-1:0] fref_t24_w,fref_t25_w,fref_t26_w,fref_t27_w,fref_t28_w,fref_t29_w,fref_t30_w,fref_t31_w;

reg [`PIXEL_WIDTH-1:0] fref_r00_w,fref_r01_w,fref_r02_w,fref_r03_w,fref_r04_w,fref_r05_w,fref_r06_w,fref_r07_w;
reg [`PIXEL_WIDTH-1:0] fref_r08_w,fref_r09_w,fref_r10_w,fref_r11_w,fref_r12_w,fref_r13_w,fref_r14_w,fref_r15_w;
reg [`PIXEL_WIDTH-1:0] fref_r16_w,fref_r17_w,fref_r18_w,fref_r19_w,fref_r20_w,fref_r21_w,fref_r22_w,fref_r23_w;
reg [`PIXEL_WIDTH-1:0] fref_r24_w,fref_r25_w,fref_r26_w,fref_r27_w,fref_r28_w,fref_r29_w,fref_r30_w,fref_r31_w;

reg [`PIXEL_WIDTH-1:0] fref_l00_w,fref_l01_w,fref_l02_w,fref_l03_w,fref_l04_w,fref_l05_w,fref_l06_w,fref_l07_w;
reg [`PIXEL_WIDTH-1:0] fref_l08_w,fref_l09_w,fref_l10_w,fref_l11_w,fref_l12_w,fref_l13_w,fref_l14_w,fref_l15_w;
reg [`PIXEL_WIDTH-1:0] fref_l16_w,fref_l17_w,fref_l18_w,fref_l19_w,fref_l20_w,fref_l21_w,fref_l22_w,fref_l23_w;
reg [`PIXEL_WIDTH-1:0] fref_l24_w,fref_l25_w,fref_l26_w,fref_l27_w,fref_l28_w,fref_l29_w,fref_l30_w,fref_l31_w;

reg [`PIXEL_WIDTH-1:0] fref_d00_w,fref_d01_w,fref_d02_w,fref_d03_w,fref_d04_w,fref_d05_w,fref_d06_w,fref_d07_w;
reg [`PIXEL_WIDTH-1:0] fref_d08_w,fref_d09_w,fref_d10_w,fref_d11_w,fref_d12_w,fref_d13_w,fref_d14_w,fref_d15_w;
reg [`PIXEL_WIDTH-1:0] fref_d16_w,fref_d17_w,fref_d18_w,fref_d19_w,fref_d20_w,fref_d21_w,fref_d22_w,fref_d23_w;
reg [`PIXEL_WIDTH-1:0] fref_d24_w,fref_d25_w,fref_d26_w,fref_d27_w,fref_d28_w,fref_d29_w,fref_d30_w,fref_d31_w;




  reg  [31 : 0] r_data_col_i   ;
  wire [31 : 0] r_data_col_i_y ;
  wire [31 : 0] r_data_col_i_u ;
  wire [31 : 0] r_data_col_i_v ;
  reg  [31 : 0] r_data_col_2_i ;
  reg  [ 5 : 0] r_addr_col_r   ;
  reg  [31 : 0] r_data_row_i   ;
  reg  [31 : 0] r_data_frame_i ;

  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      r_addr_col_r <= 'd0 ;
    else begin
      r_addr_col_r <= r_addr_col_o ;
    end
  end

  assign r_data_col_i_y =   ( r_addr_col_r>='d56 )
                          ? ( ( LCU_y_i[0]=='d0 )
                            ? r_data_col_1_i_y
                            : r_data_col_2_i_y
                          )
                          : r_data_col_0_i_y ;

  assign r_data_col_i_u =   ( r_addr_col_r>='d12 )
                          ? ( ( LCU_y_i[0]=='d0 )
                              ? r_data_col_1_i_u
                              : r_data_col_2_i_u
                            )
                          : r_data_col_0_i_u ;

  assign r_data_col_i_v =   ( r_addr_col_r>='d12 )
                          ? ( ( LCU_y_i[0]=='d0 )
                              ? r_data_col_1_i_v
                              : r_data_col_2_i_v
                            )
                          : r_data_col_0_i_v ;

  always @(*) begin
    case( ref_sel_i )
      2'b00   : begin   r_data_col_i   = r_data_col_i_y   ;
                        r_data_row_i   = r_data_row_i_y   ;
                        r_data_frame_i = r_data_frame_i_y ;
                        r_data_col_2_i = r_data_col_2_i_y ;
                end
      2'b10   : begin   r_data_col_i   = r_data_col_i_u   ;
                        r_data_row_i   = r_data_row_i_u   ;
                        r_data_frame_i = r_data_frame_i_u ;
                        r_data_col_2_i = r_data_col_2_i_u ;
                end
      2'b11   : begin   r_data_col_i   = r_data_col_i_v   ;
                        r_data_row_i   = r_data_row_i_v   ;
                        r_data_frame_i = r_data_frame_i_v ;
                        r_data_col_2_i = r_data_col_2_i_v ;
                end
      default : begin   r_data_col_i   = r_data_col_i_y   ;
                        r_data_row_i   = r_data_row_i_y   ;
                        r_data_frame_i = r_data_frame_i_y ;
                        r_data_col_2_i = r_data_col_2_i_y ;
                end
    endcase
  end


//********************************************************************************************************

  assign i4x4_y_w = ( ref_sel_i==2'b00 ) ? { 1'b0 ,position_i[5] ,position_i[3] ,position_i[1] } : { 2'b0 ,position_i[5] ,position_i[3] };
  assign i4x4_x_w = ( ref_sel_i==2'b00 ) ? { 1'b0 ,position_i[4] ,position_i[2] ,position_i[0] } : { 2'b0 ,position_i[4] ,position_i[2] };

always @(posedge clk or negedge rst_n) begin
  if(!rst_n)
    state <= IDLE;
  else
    state <= next_state;
end

always @( * ) begin
  next_state = IDLE;
  case(state)
    IDLE:begin
      if(start_i) begin
        if(position_i=='d0 && size_i==2'b00 && LCU_x_i=='d0 && LCU_y_i=='d0)begin
            next_state = PADING;
        end
        else begin
          if(LCU_y_i>0 && i4x4_y_w=='d0)
            next_state = FREAD;
          else
            next_state = LREAD;
        end
      end
      else begin
        next_state = IDLE;
      end
    end

    FREAD:begin
      if(r_done_r)
        next_state = PADING;
      else
        next_state = FREAD;
    end

    LREAD:begin
      if(r_done_r)
        next_state = PADING;
      else
        next_state = LREAD;
    end

    PADING:next_state = FILTER;

    FILTER:next_state = WRITE;

    WRITE:begin
      if(w_done_r)
        next_state = IDLE;
      else
        next_state = WRITE;
    end

    default: next_state = IDLE;
  endcase
end


//**************************************** WRITE *********************************************
//--------row/column sram IF-----------
reg  wena_o;
reg [31:0] w_data_row_o,w_data_col_o;
reg [ 5:0] w_addr_row_o,w_addr_col_o;
//-------------------------------------
//------------frame sram IF------------
wire [31:0] w_data_frame_o;
reg  [ 8:0] w_addr_frame_o;//to be confirmed
//-------------------------------------
reg [ 4:0] wcnt_r;

  // wena_o
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      wena_o <= 'd0;
    else begin
      if( size_i==2'b00 )
        if( cover_valid_i )
          wena_o <= 'd1;
        else begin
          wena_o <= 'd0;
        end
      else begin
        if( cover_valid_i && cover_value_i )
          wena_o <= 'd1;
        else if( w_done_w ) begin
          wena_o <= 'd0;
        end
      end
    end
  end

  // wcnt_r
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      wcnt_r <= 'd0;
    else if( w_done_w )
      wcnt_r <= 'd0;
    else if( wena_o ) begin
      wcnt_r <= wcnt_r+'d1 ;
    end
  end

  // w_done_w
  always @(*) begin
    case( size_i )
      2'b00 : w_done_w = wena_o && (wcnt_r=='d0) ;
      2'b01 : w_done_w = wena_o && (wcnt_r=='d1) ;
      2'b10 : w_done_w = wena_o && (wcnt_r=='d3) ;
      2'b11 : w_done_w = wena_o && (wcnt_r=='d7) ;
    endcase
  end

  // w_done_r
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      w_done_r <= 'd0;
    else begin
      if( w_done_r )
        w_done_r <= 'd0 ;
      else if( cover_valid_i && !cover_value_i )
        w_done_r <= 'd1 ;
      else begin
        w_done_r <= w_done_w ;
      end
    end
  end

  wire [1   : 0] offset_w ;
  assign offset_w = ( ref_sel_i==2'b00 ) ? 3 : 2 ;

always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    w_addr_col_o <= 'd0;
    w_addr_row_o <= 'd0;
  end
  else begin
    case(size_i)
      2'b00:
        if(rec_val_i) begin
          w_addr_col_o <= (i4x4_x_w<<offset_w)+i4x4_y_w;
          w_addr_row_o <= (i4x4_y_w<<offset_w)+i4x4_x_w;
        end

      2'b01:
        if(rec_val_i && (rec_idx_i=='d4)) begin
          w_addr_col_o <= ((i4x4_x_w+1)<<offset_w)+i4x4_y_w;
          w_addr_row_o <= ((i4x4_y_w+1)<<offset_w)+i4x4_x_w;
        end
        else begin
          if(wena_o)begin
            w_addr_col_o <= w_addr_col_o+1;
            w_addr_row_o <= w_addr_row_o+1;
          end
        end

      2'b10:
        if(rec_val_i && (rec_idx_i=='d14)) begin
          w_addr_col_o <= ((i4x4_x_w+3)<<offset_w)+i4x4_y_w;
          w_addr_row_o <= ((i4x4_y_w+3)<<offset_w)+i4x4_x_w;
        end
        else begin
          if(wena_o)begin
            w_addr_col_o <= w_addr_col_o+1;
            w_addr_row_o <= w_addr_row_o+1;
          end
        end

      2'b11:
        if(rec_val_i && (rec_idx_i=='d31)) begin
          w_addr_col_o <= (ref_sel_i==2'b00) ? 'd56 : 'd12 ;
          w_addr_row_o <= (ref_sel_i==2'b00) ? 'd56 : 'd12 ;
        end
        else begin
          if(wena_o)begin
            w_addr_col_o <= w_addr_col_o+1;
            w_addr_row_o <= w_addr_row_o+1;
          end
        end
    endcase
  end
end//w_addr

always @ ( * ) begin
  if(wena_o) begin
    case(wcnt_r)
      'd0:begin
        w_data_row_o = {ref_r00_o,ref_r01_o,ref_r02_o,ref_r03_o};
        w_data_col_o = {ref_t00_o,ref_t01_o,ref_t02_o,ref_t03_o};
      end
      'd1:begin
        w_data_row_o = {ref_r04_o,ref_r05_o,ref_r06_o,ref_r07_o};
        w_data_col_o = {ref_t04_o,ref_t05_o,ref_t06_o,ref_t07_o};
      end
      'd2:begin
        w_data_row_o = {ref_r08_o,ref_r09_o,ref_r10_o,ref_r11_o};
        w_data_col_o = {ref_t08_o,ref_t09_o,ref_t10_o,ref_t11_o};
      end
      'd3:begin
        w_data_row_o = {ref_r12_o,ref_r13_o,ref_r14_o,ref_r15_o};
        w_data_col_o = {ref_t12_o,ref_t13_o,ref_t14_o,ref_t15_o};
      end

      'd4:begin
        w_data_row_o = {ref_r16_o,ref_r17_o,ref_r18_o,ref_r19_o};
        w_data_col_o = {ref_t16_o,ref_t17_o,ref_t18_o,ref_t19_o};
      end
      'd5:begin
        w_data_row_o = {ref_r20_o,ref_r21_o,ref_r22_o,ref_r23_o};
        w_data_col_o = {ref_t20_o,ref_t21_o,ref_t22_o,ref_t23_o};
      end
      'd6:begin
        w_data_row_o = {ref_r24_o,ref_r25_o,ref_r26_o,ref_r27_o};
        w_data_col_o = {ref_t24_o,ref_t25_o,ref_t26_o,ref_t27_o};
      end
      'd7:begin
        w_data_row_o = {ref_r28_o,ref_r29_o,ref_r30_o,ref_r31_o};
        w_data_col_o = {ref_t28_o,ref_t29_o,ref_t30_o,ref_t31_o};
      end

      default:begin
        w_data_row_o = 'd0;
        w_data_col_o = 'd0;
      end
    endcase
  end
  else begin
    w_data_row_o = 'd0;
    w_data_col_o = 'd0;
  end
end//w_data_row_o and w_data_col_o

  // wena_frame_w
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      wena_frame_r <= 'd0 ;
    else if( start_i )
      wena_frame_r <= 'd0 ;
    else begin
      case( size_i )
        2'b00 : begin if( rec_val_i && ( ( (i4x4_y_w=='d7)&&(ref_sel_i==2'b00) ) ||
                                         ( (i4x4_y_w=='d3)&&(ref_sel_i!=2'b00) )
                                       )
                        )                                                                   wena_frame_r <= 'd1 ;
                end

        2'b01 : begin if( rec_val_i && ( ( (i4x4_y_w=='d6)&&(ref_sel_i==2'b00) ) ||
                                         ( (i4x4_y_w=='d2)&&(ref_sel_i!=2'b00) )
                                       )
                        )                                                                   wena_frame_r <= 'd1;
                end

        2'b10 : begin if( rec_val_i && ( ( (i4x4_y_w=='d4)&&(ref_sel_i==2'b00) ) ||
                                         (                  (ref_sel_i!=2'b00) )
                                       )
                        )                                                                   wena_frame_r <= 'd1;
                end

        2'b11 : begin                                                                       wena_frame_r <= 'd1;
                end
      endcase
    end
  end

  // wena_frame_w
  assign wena_frame_o = wena_frame_r && wena_o ;

always @(posedge clk or negedge rst_n) begin
  if(!rst_n)
    w_addr_frame_o <= 'd0;
  else begin
    case(size_i)
      2'b00:
        if(rec_val_i && ( ( (i4x4_y_w=='d7)&&(ref_sel_i==2'b00) ) ||
                          ( (i4x4_y_w=='d3)&&(ref_sel_i!=2'b00) )
                        )
          ) begin
          w_addr_frame_o <= (LCU_x_i<<offset_w)+i4x4_x_w;
        end

      2'b01:
        if(rec_val_i && (rec_idx_i=='d4) && ( ( (i4x4_y_w=='d6)&&(ref_sel_i==2'b00) ) ||
                                              ( (i4x4_y_w=='d2)&&(ref_sel_i!=2'b00) )
                                            )
          ) begin
          w_addr_frame_o <= (LCU_x_i<<offset_w)+i4x4_x_w;
        end
        else begin
          if(wena_frame_o) begin
            w_addr_frame_o <= w_addr_frame_o+1;
          end
        end

      2'b10:
        if(rec_val_i && (rec_idx_i=='d14) && ( ( (i4x4_y_w=='d4)&&(ref_sel_i==2'b00) ) ||
                                               (                  (ref_sel_i!=2'b00) )
                                             )
          ) begin
          w_addr_frame_o <= (LCU_x_i<<offset_w)+i4x4_x_w;
        end
        else begin
          if(wena_frame_o) begin
            w_addr_frame_o <= w_addr_frame_o+1;
          end
        end

      2'b11:
        if(rec_val_i && (rec_idx_i=='d31)) begin
          w_addr_frame_o <= (LCU_x_i<<offset_w)+i4x4_x_w;
        end
        else begin
          if(wena_frame_o) begin
            w_addr_frame_o <= w_addr_frame_o+1;
          end
        end
    endcase
  end
end//w_addr_frame_o

assign w_data_frame_o=w_data_row_o;
//**********************************************************************************************



//**************************************** READ ************************************************
reg done_r0,done_r1;
reg [4:0] rcnt_r;
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    r_done_r <= 'd0;
    done_r1  <= 'd0;
  end
  else begin
    r_done_r <= done_r1;
    done_r1  <= done_r0;
  end
end

always @(posedge clk or negedge rst_n) begin
  if(!rst_n)
    done_r0 <= 'd0;
  else
    if(done_r0)
      done_r0 <= 'd0;
    else
      case(size_i)
        2'b00:if(rcnt_r=='d1)  done_r0 <= 'd1;
        2'b01:if(rcnt_r=='d3)  done_r0 <= 'd1;
        2'b10:if(rcnt_r=='d7)  done_r0 <= 'd1;
        2'b11:if(rcnt_r=='d15) done_r0 <= 'd1;
      endcase
end


always @(posedge clk or negedge rst_n) begin
  if(!rst_n)
    rcnt_r <= 'd0;
  else begin
    if(state==FREAD || state==LREAD)
      if(r_done_r)
        rcnt_r <= 'd0;
      else
        rcnt_r <= rcnt_r+1;
  end
end//rcnt_r



//*************************************************
//--------row/column sram IF-----------
reg  cena_row_o,cena_col_o;
//reg [31:0] r_data_row_i,r_data_col_i;
reg [ 5:0] r_addr_row_o,r_addr_col_o;
//-------------------------------------
//------------frame sram IF------------
reg cena_frame_o;
//wire [31:0] r_data_frame_i;
reg  [ 8:0] r_addr_frame_o;//to be confirmed
//-------------------------------------

always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    cena_frame_o <= 'd0; cena_row_o   <= 'd0; cena_col_o   <= 'd0;
  end
  else begin
    case(state)
      IDLE:begin
        if(start_i) begin
          if(position_i!='d0 || size_i!=2'b00 || LCU_x_i!='d0 || LCU_y_i!='d0)begin
            if(LCU_y_i>0 && i4x4_y_w=='d0)
              cena_frame_o <= 'd1;
            else begin
              if(position_i[1:0]==2'b10 || position_i[3:0]==4'b1000)
                cena_col_o <= 'd1;
              else
                cena_row_o <= 'd1;
            end
          end
        end
      end

      FREAD:begin
        if(done_r0)begin
          cena_frame_o <= 'd0;
          cena_col_o   <= 'd0;
        end
        else begin
          if(!rcnt_r)
            cena_col_o <= 'd1;
        end
      end

      LREAD:begin
        if(done_r0)begin
          cena_row_o <= 'd0;
          cena_col_o <= 'd0;
        end
        else begin
          if(!rcnt_r) begin
            cena_row_o <= 'd1;
            cena_col_o <= 'd1;
          end
        end
      end
    endcase
  end
end//cena_o(row col frame)

  wire [5   : 0] position_w ;
  assign position_w = ( ref_sel_i==2'b00 ) ? position_i : position_i>>2 ;

always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    r_addr_frame_o <= 'd0;
    r_addr_row_o   <= 'd0;
    r_addr_col_o   <= 'd0;
  end
  else begin
    case(state)
      IDLE:begin
        if(start_i) begin
          if(position_w!='d0 || size_i!=2'b00 || LCU_x_i!='d0 || LCU_y_i!='d0)begin
            if(LCU_y_i>0 && i4x4_y_w=='d0) begin
              r_addr_frame_o <= (LCU_x_i<<offset_w)+i4x4_x_w-1;
            end
            else begin
              if(position_w[1:0]==2'b10 || position_w[3:0]==4'b1000) begin
                if( !i4x4_x_w )
                  r_addr_col_o <= (ref_sel_i==2'b00) ? ('d56+i4x4_y_w-1) : ('d12+i4x4_y_w-1);
                else begin
                  r_addr_col_o <= ((i4x4_x_w-1)<<offset_w)+i4x4_y_w-1;
                end
              end
              else begin
                if(!i4x4_x_w) begin
                  r_addr_row_o <= ((i4x4_y_w-1)<<offset_w)+i4x4_x_w+7;
                end
                else begin
                  r_addr_row_o <= ((i4x4_y_w-1)<<offset_w)+i4x4_x_w-1;
                end
              end
            end
          end
        end
      end

      LREAD:begin
        if(done_r0||done_r1)begin
          r_addr_row_o <= 'd0;
          r_addr_col_o <= 'd0;
        end
        else begin
          if(!rcnt_r) begin
            if(i4x4_y_w!='d0)
              r_addr_row_o <= ((i4x4_y_w-1)<<offset_w)+i4x4_x_w;
            else begin
              r_addr_row_o <= (ref_sel_i==2'b00) ? ('d56+i4x4_x_w) : ('d12+i4x4_x_w);
            end
            if(i4x4_x_w!='d0)
              r_addr_col_o <= ((i4x4_x_w-1)<<offset_w)+i4x4_y_w;
            else begin
              r_addr_col_o <= (ref_sel_i==2'b00) ? ('d56+i4x4_y_w) : ('d12+i4x4_y_w);
            end
          end
          else begin
            r_addr_row_o <= r_addr_row_o+1;
            if( (ref_sel_i==2'b00)&&(r_addr_col_o=='d63) || (ref_sel_i!=2'b00)&&(r_addr_col_o=='d15) )
              r_addr_col_o <= 'd0 ;
            else begin
              r_addr_col_o <= r_addr_col_o+1 ;
            end
          end
        end
      end

      FREAD:begin
        if(done_r0||done_r1)begin
          r_addr_frame_o <= 'd0;
          r_addr_col_o   <= 'd0;
        end
        else begin
          r_addr_frame_o <= r_addr_frame_o +1;
          if(!rcnt_r)
            if(i4x4_x_w!='d0)
              r_addr_col_o <= ((i4x4_x_w-1)<<offset_w)+i4x4_y_w;
            else begin
              r_addr_col_o <= (ref_sel_i==2'b00) ? ('d56+i4x4_y_w) : ('d12+i4x4_y_w);
            end
          else begin
            if( (ref_sel_i==2'b00)&&(r_addr_col_o=='d63) || (ref_sel_i!=2'b00)&&(r_addr_col_o=='d15) )
              r_addr_col_o <= 'd0 ;
            else begin
              r_addr_col_o <= r_addr_col_o+1 ;
            end
          end
        end
      end
    endcase
  end
end//address(row col frame)

//*************************************************

//************************************************************
//special reference pixel needed to be reserved
reg [`PIXEL_WIDTH-1:0] ref_t00_r,ref_t01_r,ref_t02_r,ref_t03_r,ref_t04_r,ref_t05_r,ref_t06_r,ref_t07_r;
reg [`PIXEL_WIDTH-1:0] ref_t08_r,ref_t09_r,ref_t10_r,ref_t11_r,ref_t12_r,ref_t13_r,ref_t14_r,ref_t15_r;
reg [`PIXEL_WIDTH-1:0] ref_t16_r,ref_t17_r,ref_t18_r,ref_t19_r,ref_t20_r,ref_t21_r,ref_t22_r,ref_t23_r;
reg [`PIXEL_WIDTH-1:0] ref_t24_r,ref_t25_r,ref_t26_r,ref_t27_r,ref_t28_r,ref_t29_r,ref_t30_r,ref_t31_r;

reg [`PIXEL_WIDTH-1:0] ref_l00_r,ref_l01_r,ref_l02_r,ref_l03_r,ref_l04_r,ref_l05_r,ref_l06_r,ref_l07_r;
reg [`PIXEL_WIDTH-1:0] ref_l08_r,ref_l09_r,ref_l10_r,ref_l11_r,ref_l12_r,ref_l13_r,ref_l14_r,ref_l15_r;
reg [`PIXEL_WIDTH-1:0] ref_l16_r,ref_l17_r,ref_l18_r,ref_l19_r,ref_l20_r,ref_l21_r,ref_l22_r,ref_l23_r;
reg [`PIXEL_WIDTH-1:0] ref_l24_r,ref_l25_r,ref_l26_r,ref_l27_r,ref_l28_r,ref_l29_r,ref_l30_r,ref_l31_r;

//top1 & left1
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_t00_r<='d0;ref_t01_r<='d0;ref_t02_r<='d0;ref_t03_r<='d0;
    ref_l00_r<='d0;ref_l01_r<='d0;ref_l02_r<='d0;ref_l03_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d0) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d2)&&(size_i==2'b01)&&(position_i=='d0) ) ) begin
      ref_t00_r<=r_data_frame_i[31:24];  ref_t01_r<=r_data_frame_i[23:16];
      ref_t02_r<=r_data_frame_i[15: 8];  ref_t03_r<=r_data_frame_i[ 7: 0];

      ref_l00_r<=r_data_col_i[31:24];      ref_l01_r<=r_data_col_i[23:16];
      ref_l02_r<=r_data_col_i[15: 8];      ref_l03_r<=r_data_col_i[ 7: 0];
    end
  end
end

//top2
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_t04_r<='d0;ref_t05_r<='d0;ref_t06_r<='d0;ref_t07_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d1) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d3)&&(size_i==2'b01)&&(position_i=='d0) ) ) begin
      ref_t04_r<=r_data_frame_i[31:24];  ref_t05_r<=r_data_frame_i[23:16];
      ref_t06_r<=r_data_frame_i[15: 8];  ref_t07_r<=r_data_frame_i[ 7: 0];
    end
  end
end

//top3
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_t08_r<='d0;ref_t09_r<='d0;ref_t10_r<='d0;ref_t11_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d4) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d2)&&(size_i==2'b01)&&(position_i=='d4) ) ) begin
      ref_t08_r<=r_data_frame_i[31:24];  ref_t09_r<=r_data_frame_i[23:16];
      ref_t10_r<=r_data_frame_i[15: 8];  ref_t11_r<=r_data_frame_i[ 7: 0];
    end
  end
end

//top4
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_t12_r<='d0;ref_t13_r<='d0;ref_t14_r<='d0;ref_t15_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d5) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d3)&&(size_i==2'b01)&&(position_i=='d4) ) ) begin
      ref_t12_r<=r_data_frame_i[31:24];  ref_t13_r<=r_data_frame_i[23:16];
      ref_t14_r<=r_data_frame_i[15: 8];  ref_t15_r<=r_data_frame_i[ 7: 0];
    end
  end
end

//top5
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_t16_r<='d0;ref_t17_r<='d0;ref_t18_r<='d0;ref_t19_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d16) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d2)&&(size_i==2'b01)&&(position_i=='d16) ) ) begin
      ref_t16_r<=r_data_frame_i[31:24];  ref_t17_r<=r_data_frame_i[23:16];
      ref_t18_r<=r_data_frame_i[15: 8];  ref_t19_r<=r_data_frame_i[ 7: 0];
    end
  end
end

//top6
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_t20_r<='d0;ref_t21_r<='d0;ref_t22_r<='d0;ref_t23_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d17) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d3)&&(size_i==2'b01)&&(position_i=='d16) ) ) begin
      ref_t20_r<=r_data_frame_i[31:24];  ref_t21_r<=r_data_frame_i[23:16];
      ref_t22_r<=r_data_frame_i[15: 8];  ref_t23_r<=r_data_frame_i[ 7: 0];
    end
  end
end

//top7
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_t24_r<='d0;ref_t25_r<='d0;ref_t26_r<='d0;ref_t27_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d20) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d2)&&(size_i==2'b01)&&(position_i=='d20) ) ) begin
      ref_t24_r<=r_data_frame_i[31:24];  ref_t25_r<=r_data_frame_i[23:16];
      ref_t26_r<=r_data_frame_i[15: 8];  ref_t27_r<=r_data_frame_i[ 7: 0];
    end
  end
end

//top8
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_t28_r<='d0;ref_t29_r<='d0;ref_t30_r<='d0;ref_t31_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d21) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d3)&&(size_i==2'b01)&&(position_i=='d20) ) ) begin
      ref_t28_r<=r_data_frame_i[31:24];  ref_t29_r<=r_data_frame_i[23:16];
      ref_t30_r<=r_data_frame_i[15: 8];  ref_t31_r<=r_data_frame_i[ 7: 0];
    end
  end
end

//left2
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_l04_r<='d0;ref_l05_r<='d0;ref_l06_r<='d0;ref_l07_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d2) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d3)&&(size_i==2'b01)&&(position_i=='d0) ) ) begin
      ref_l04_r<=r_data_col_i[31:24];  ref_l05_r<=r_data_col_i[23:16];
      ref_l06_r<=r_data_col_i[15: 8];  ref_l07_r<=r_data_col_i[ 7: 0];
    end
  end
end

//left3
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_l08_r<='d0;ref_l09_r<='d0;ref_l10_r<='d0;ref_l11_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d8) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d2)&&(size_i==2'b01)&&(position_i=='d8) ) ) begin
      ref_l08_r<=r_data_col_i[31:24];  ref_l09_r<=r_data_col_i[23:16];
      ref_l10_r<=r_data_col_i[15: 8];  ref_l11_r<=r_data_col_i[ 7: 0];
    end
  end
end

//left4
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_l12_r<='d0;ref_l13_r<='d0;ref_l14_r<='d0;ref_l15_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d10) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d3)&&(size_i==2'b01)&&(position_i=='d8) ) ) begin
      ref_l12_r<=r_data_col_i[31:24];  ref_l13_r<=r_data_col_i[23:16];
      ref_l14_r<=r_data_col_i[15: 8];  ref_l15_r<=r_data_col_i[ 7: 0];
    end
  end
end

//left5
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_l16_r<='d0;ref_l17_r<='d0;ref_l18_r<='d0;ref_l19_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d32) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d2)&&(size_i==2'b01)&&(position_i=='d32) ) ) begin
      ref_l16_r<=r_data_col_i[31:24];  ref_l17_r<=r_data_col_i[23:16];
      ref_l18_r<=r_data_col_i[15: 8];  ref_l19_r<=r_data_col_i[ 7: 0];
    end
  end
end

//left6
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_l20_r<='d0;ref_l21_r<='d0;ref_l22_r<='d0;ref_l23_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d34) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d3)&&(size_i==2'b01)&&(position_i=='d32) ) ) begin
      ref_l20_r<=r_data_col_i[31:24];  ref_l21_r<=r_data_col_i[23:16];
      ref_l22_r<=r_data_col_i[15: 8];  ref_l23_r<=r_data_col_i[ 7: 0];
    end
  end
end

//left7
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_l24_r<='d0;ref_l25_r<='d0;ref_l26_r<='d0;ref_l27_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d40) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d2)&&(size_i==2'b01)&&(position_i=='d40) ) ) begin
      ref_l24_r<=r_data_col_i[31:24];  ref_l25_r<=r_data_col_i[23:16];
      ref_l26_r<=r_data_col_i[15: 8];  ref_l27_r<=r_data_col_i[ 7: 0];
    end
  end
end

//left8
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_l28_r<='d0;ref_l29_r<='d0;ref_l30_r<='d0;ref_l31_r<='d0;
  end
  else begin
    if( ( (pre_min_size_i==1'b0)&&(rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d42) ) ||
        ( (pre_min_size_i==1'b1)&&(rcnt_r=='d3)&&(size_i==2'b01)&&(position_i=='d40) ) ) begin
      ref_l28_r<=r_data_col_i[31:24];  ref_l29_r<=r_data_col_i[23:16];
      ref_l30_r<=r_data_col_i[15: 8];  ref_l31_r<=r_data_col_i[ 7: 0];
    end
  end
end

//**********************************************************************************************


//***************************************** PADING *********************************************
  // LCU neigbour availabilty
  always @( * ) begin
    if( (LCU_x_i==0) && (LCU_y_i==0) ) begin
      LCU_tl = 1'b0;
      LCU_t  = 1'b0;
      LCU_l  = 1'b0;
    end
    else if( LCU_x_i==0 ) begin
      LCU_tl = 1'b0;
      LCU_t  = 1'b1;
      LCU_l  = 1'b0;
    end
    else if( LCU_y_i==0 ) begin
      LCU_tl = 1'b0;
      LCU_t  = 1'b0;
      LCU_l  = 1'b1;
    end
    else if( LCU_x_i==LCU_x_total ) begin
      LCU_tl = 1'b1;
      LCU_t  = 1'b1;
      LCU_l  = 1'b1;
    end
    else begin
      LCU_tl = 1'b1;
      LCU_t  = 1'b1;
      LCU_l  = 1'b1;
    end
  end

  always @(*) begin
    if( (LCU_x_i==0)&&(LCU_y_i==0) )
      LCU_r = 1'b0;
    else if ( LCU_y_i==0 )
      LCU_r = 1'b0;
    else if ( LCU_x_i==LCU_x_total )
      LCU_r = 1'b0;
    else if ( (LCU_x_i[0]==1)&&(LCU_y_i[0]==1) )
      LCU_r = 1'b0;
    else begin
      LCU_r = 1'b1;
    end
  end

  reg LCU_d ;

  always @(*) begin
    if( LCU_x_i==0 )
      LCU_d = 'd0 ;
    else if( (LCU_x_i[0]==0) && (LCU_y_i[0]==0) )
      LCU_d = 'd1 ;
    else begin
      LCU_d = 'd0 ;
    end
  end

wire [1:0] size_w ;
assign size_w = (ref_sel_i==2'b00) ? size_i : size_i+1 ;

always @( * ) begin
  case(size_w)
    2'b00:cu_num_w = position_i;
    2'b01:cu_num_w = (position_i>>2);
    2'b10:cu_num_w = (position_i>>4);
    2'b11:cu_num_w = 'd0;
  endcase
end

//CU neigbour availabilty
//tl : topleft      t : top      l : left      r : topright       d : downleft
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    avail_tl <= 1'b0;
    avail_t  <= 1'b0;
    avail_l  <= 1'b0;
    avail_r  <= 1'b0;
    avail_d  <= 1'b0;
  end
  else begin
    if(start_i) begin
      case (cu_num_w)
        3,7,11,13,15,19,23,27,29,31,35,39,43,45,47,51,53,55,59,61,63:
          begin
            avail_tl <= 1'b1;
            avail_t  <= 1'b1;
            avail_l  <= 1'b1;
            avail_r  <= 1'b0;
            avail_d  <= 1'b0;
          end

        6,9,14,22,25,26,30,33,37,38,41,49,46,54,57,58,62:
          begin
            avail_tl <= 1'b1;
            avail_t  <= 1'b1;
            avail_l  <= 1'b1;
            avail_r  <= 1'b1;
            avail_d  <= 1'b0;
          end

        12,18,24,28,36,44,48,50,52,56,60:
          begin
            avail_tl <= 1'b1;
            avail_t  <= 1'b1;
            avail_l  <= 1'b1;
            avail_r  <= 1'b1;
            avail_d  <= 1'b1;
          end

        4,16,20:
          begin
            avail_tl <= LCU_t;
            avail_t  <= LCU_t;
            avail_l  <= 1'b1;
            avail_r  <= LCU_t;
            avail_d  <= 1'b1;
          end

        17:
          begin
            avail_tl <= LCU_t;
            avail_t  <= LCU_t;
            avail_l  <= 1'b1;
            avail_r  <= LCU_t;
            avail_d  <= 1'b0;
          end

        21:
          begin
            avail_tl <= LCU_t;
            avail_t  <= LCU_t;
            avail_l  <= 1'b1;
            avail_r  <= LCU_r;
            avail_d  <= 1'b0;
          end

        8,32,34,40:
          begin
            avail_tl <= LCU_l;
            avail_t  <= 1'b1;
            avail_l  <= LCU_l;
            avail_r  <= 1'b1;
            avail_d  <= LCU_l;
          end

        42:
          begin
            avail_tl <= LCU_l;
            avail_t  <= 1'b1;
            avail_l  <= LCU_l;
            avail_r  <= 1'b1;
            avail_d  <= LCU_d;
          end

        1:
          begin
            if (size_w==2'b10) begin// && !idx_i)||(cu_size_i==2'b10 && idx_i)) begin
              avail_tl <= LCU_t;
              avail_t  <= LCU_t;
              avail_l  <= 1'b1;
              avail_r  <= LCU_r;
              avail_d  <= 1'b0;
            end
            else begin
              avail_tl <= LCU_t;
              avail_t  <= LCU_t;
              avail_l  <= 1'b1;
              avail_r  <= LCU_t;
              avail_d  <= 1'b0;
            end
          end

        5:
          begin
            if (size_w == 2'b01) begin// && !idx_i)||(cu_size_i == 2'b01 && idx_i)) begin
              avail_tl <= LCU_t;
              avail_t  <= LCU_t;
              avail_l  <= 1'b1;
              avail_r  <= LCU_r;
              avail_d  <= 1'b0;
            end
            else begin
              avail_tl <= LCU_t;
              avail_t  <= LCU_t;
              avail_l  <= 1'b1;
              avail_r  <= LCU_t;
              avail_d  <= 1'b0;
            end
          end

        2:
          begin
            if(size_w == 2'b10) begin// && !idx_i)||(cu_size_i == 2'b10 && idx_i)) begin
              avail_tl <= LCU_l;
              avail_t  <= 1'b1;
              avail_l  <= LCU_l;
              avail_r  <= 1'b1;
              avail_d  <= LCU_d;
            end
            else begin
              avail_tl <= LCU_l;
              avail_t  <= 1'b1;
              avail_l  <= LCU_l;
              avail_r  <= 1'b1;
              avail_d  <= LCU_l;
            end
          end

        10:
          begin
            if(size_w == 2'b01) begin// && !idx_i)||(cu_size_i == 2'b01 && idx_i)) begin
              avail_tl <= LCU_l;
              avail_t  <= 1'b1;
              avail_l  <= LCU_l;
              avail_r  <= 1'b1;
              avail_d  <= LCU_d;
            end
            else begin
              avail_tl <= LCU_l;
              avail_t  <= 1'b1;
              avail_l  <= LCU_l;
              avail_r  <= 1'b1;
              avail_d  <= LCU_l;
            end
          end

        0:
          begin
            if(size_w == 2'b11) begin
              avail_tl <= LCU_tl;
              avail_t  <= LCU_t;
              avail_l  <= LCU_l;
              avail_r  <= LCU_r;
              avail_d  <= LCU_d;
            end
            else begin
              avail_tl <= LCU_tl;
              avail_t  <= LCU_t;
              avail_l  <= LCU_l;
              avail_r  <= LCU_t;
              avail_d  <= LCU_l;
            end
          end

      endcase
    end
  end
end


//padding the downleft reference pixel
always @( * ) begin
  begin
     pref_d00_w = 'd128; pref_d04_w = 'd128; pref_d08_w = 'd128; pref_d12_w = 'd128;
     pref_d01_w = 'd128; pref_d05_w = 'd128; pref_d09_w = 'd128; pref_d13_w = 'd128;
     pref_d02_w = 'd128; pref_d06_w = 'd128; pref_d10_w = 'd128; pref_d14_w = 'd128;
     pref_d03_w = 'd128; pref_d07_w = 'd128; pref_d11_w = 'd128; pref_d15_w = 'd128;

     pref_d16_w = 'd128; pref_d20_w = 'd128; pref_d24_w = 'd128; pref_d28_w = 'd128;
     pref_d17_w = 'd128; pref_d21_w = 'd128; pref_d25_w = 'd128; pref_d29_w = 'd128;
     pref_d18_w = 'd128; pref_d22_w = 'd128; pref_d26_w = 'd128; pref_d30_w = 'd128;
     pref_d19_w = 'd128; pref_d23_w = 'd128; pref_d27_w = 'd128; pref_d31_w = 'd128;
  end
  case (size_i)
    2'b00:begin //cu_size == 4
      if (avail_d == 1'b0) begin
        if(avail_l == 1'b1) begin
          pref_d00_w = ref_l03_o;
          pref_d01_w = ref_l03_o;
          pref_d02_w = ref_l03_o;
          pref_d03_w = ref_l03_o;
        end
        else begin
          if(avail_tl == 1'b1 ) begin
            pref_d00_w = ref_tl_o;
            pref_d01_w = ref_tl_o;
            pref_d02_w = ref_tl_o;
            pref_d03_w = ref_tl_o;
          end
          else begin
            if(avail_t == 1'b1) begin
              pref_d00_w = ref_t00_o;
              pref_d01_w = ref_t00_o;
              pref_d02_w = ref_t00_o;
              pref_d03_w = ref_t00_o;
            end
            else begin
              if(avail_r == 1'b1) begin
                pref_d00_w = ref_r00_o;
                pref_d01_w = ref_r00_o;
                pref_d02_w = ref_r00_o;
                pref_d03_w = ref_r00_o;
              end
              else begin
                pref_d00_w = 'd128;
                pref_d01_w = 'd128;
                pref_d02_w = 'd128;
                pref_d03_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_d00_w = ref_d00_o;
        pref_d01_w = ref_d01_o;
        pref_d02_w = ref_d02_o;
        pref_d03_w = ref_d03_o;
      end
    end
    2'b01:begin//cu_size == 8
      if (avail_d == 1'b0) begin
        if(avail_l == 1'b1) begin
          pref_d00_w = ref_l07_o; pref_d04_w = ref_l07_o;
          pref_d01_w = ref_l07_o; pref_d05_w = ref_l07_o;
          pref_d02_w = ref_l07_o; pref_d06_w = ref_l07_o;
          pref_d03_w = ref_l07_o; pref_d07_w = ref_l07_o;
        end
        else begin
          if(avail_tl == 1'b1 ) begin
            pref_d00_w = ref_tl_o; pref_d04_w = ref_tl_o;
            pref_d01_w = ref_tl_o; pref_d05_w = ref_tl_o;
            pref_d02_w = ref_tl_o; pref_d06_w = ref_tl_o;
            pref_d03_w = ref_tl_o; pref_d07_w = ref_tl_o;
          end
          else begin
            if(avail_t == 1'b1) begin
              pref_d00_w = ref_t00_o; pref_d04_w = ref_t00_o;
              pref_d01_w = ref_t00_o; pref_d05_w = ref_t00_o;
              pref_d02_w = ref_t00_o; pref_d06_w = ref_t00_o;
              pref_d03_w = ref_t00_o; pref_d07_w = ref_t00_o;
            end
            else begin
              if(avail_r == 1'b1) begin
                pref_d00_w = ref_r00_o; pref_d04_w = ref_r00_o;
                pref_d01_w = ref_r00_o; pref_d05_w = ref_r00_o;
                pref_d02_w = ref_r00_o; pref_d06_w = ref_r00_o;
                pref_d03_w = ref_r00_o; pref_d07_w = ref_r00_o;
              end
              else begin
                pref_d00_w = 'd128; pref_d04_w = 'd128;
                pref_d01_w = 'd128; pref_d05_w = 'd128;
                pref_d02_w = 'd128; pref_d06_w = 'd128;
                pref_d03_w = 'd128; pref_d07_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_d00_w = ref_d00_o; pref_d04_w = ref_d04_o;
        pref_d01_w = ref_d01_o; pref_d05_w = ref_d05_o;
        pref_d02_w = ref_d02_o; pref_d06_w = ref_d06_o;
        pref_d03_w = ref_d03_o; pref_d07_w = ref_d07_o;
      end
    end
    2'b10:begin//cu_size == 16
      if (avail_d == 1'b0) begin
        if(avail_l == 1'b1) begin
          pref_d00_w = ref_l15_o; pref_d04_w = ref_l15_o; pref_d08_w = ref_l15_o; pref_d12_w = ref_l15_o;
          pref_d01_w = ref_l15_o; pref_d05_w = ref_l15_o; pref_d09_w = ref_l15_o; pref_d13_w = ref_l15_o;
          pref_d02_w = ref_l15_o; pref_d06_w = ref_l15_o; pref_d10_w = ref_l15_o; pref_d14_w = ref_l15_o;
          pref_d03_w = ref_l15_o; pref_d07_w = ref_l15_o; pref_d11_w = ref_l15_o; pref_d15_w = ref_l15_o;
        end
        else begin
          if(avail_tl == 1'b1 ) begin
            pref_d00_w = ref_tl_o; pref_d04_w = ref_tl_o; pref_d08_w = ref_tl_o; pref_d12_w = ref_tl_o;
            pref_d01_w = ref_tl_o; pref_d05_w = ref_tl_o; pref_d09_w = ref_tl_o; pref_d13_w = ref_tl_o;
            pref_d02_w = ref_tl_o; pref_d06_w = ref_tl_o; pref_d10_w = ref_tl_o; pref_d14_w = ref_tl_o;
            pref_d03_w = ref_tl_o; pref_d07_w = ref_tl_o; pref_d11_w = ref_tl_o; pref_d15_w = ref_tl_o;
          end
          else begin
            if(avail_t == 1'b1) begin
              pref_d00_w = ref_t00_o;pref_d04_w = ref_t00_o; pref_d08_w = ref_t00_o; pref_d12_w = ref_t00_o;
              pref_d01_w = ref_t00_o;pref_d05_w = ref_t00_o; pref_d09_w = ref_t00_o; pref_d13_w = ref_t00_o;
              pref_d02_w = ref_t00_o;pref_d06_w = ref_t00_o; pref_d10_w = ref_t00_o; pref_d14_w = ref_t00_o;
              pref_d03_w = ref_t00_o;pref_d07_w = ref_t00_o; pref_d11_w = ref_t00_o; pref_d15_w = ref_t00_o;
            end
            else begin
              if(avail_r == 1'b1) begin
                pref_d00_w = ref_r00_o; pref_d04_w = ref_r00_o; pref_d08_w = ref_r00_o; pref_d12_w = ref_r00_o;
                pref_d01_w = ref_r00_o; pref_d05_w = ref_r00_o; pref_d09_w = ref_r00_o; pref_d13_w = ref_r00_o;
                pref_d02_w = ref_r00_o; pref_d06_w = ref_r00_o; pref_d10_w = ref_r00_o; pref_d14_w = ref_r00_o;
                pref_d03_w = ref_r00_o; pref_d07_w = ref_r00_o; pref_d11_w = ref_r00_o; pref_d15_w = ref_r00_o;
              end
              else begin
                pref_d00_w = 'd128; pref_d04_w = 'd128; pref_d08_w = 'd128; pref_d12_w = 'd128;
                pref_d01_w = 'd128; pref_d05_w = 'd128; pref_d09_w = 'd128; pref_d13_w = 'd128;
                pref_d02_w = 'd128; pref_d06_w = 'd128; pref_d10_w = 'd128; pref_d14_w = 'd128;
                pref_d03_w = 'd128; pref_d07_w = 'd128; pref_d11_w = 'd128; pref_d15_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_d00_w = ref_d00_o; pref_d04_w = ref_d04_o; pref_d08_w = ref_d08_o; pref_d12_w = ref_d12_o;
        pref_d01_w = ref_d01_o; pref_d05_w = ref_d05_o; pref_d09_w = ref_d09_o; pref_d13_w = ref_d13_o;
        pref_d02_w = ref_d02_o; pref_d06_w = ref_d06_o; pref_d10_w = ref_d10_o; pref_d14_w = ref_d14_o;
        pref_d03_w = ref_d03_o; pref_d07_w = ref_d07_o; pref_d11_w = ref_d11_o; pref_d15_w = ref_d15_o;
      end
    end
    2'b11:begin//cu_size == 32
      if (avail_d == 1'b0) begin
        if(avail_l == 1'b1) begin
          pref_d00_w = ref_l31_o; pref_d04_w = ref_l31_o; pref_d08_w = ref_l31_o; pref_d12_w = ref_l31_o;
          pref_d01_w = ref_l31_o; pref_d05_w = ref_l31_o; pref_d09_w = ref_l31_o; pref_d13_w = ref_l31_o;
          pref_d02_w = ref_l31_o; pref_d06_w = ref_l31_o; pref_d10_w = ref_l31_o; pref_d14_w = ref_l31_o;
          pref_d03_w = ref_l31_o; pref_d07_w = ref_l31_o; pref_d11_w = ref_l31_o; pref_d15_w = ref_l31_o;

          pref_d16_w = ref_l31_o; pref_d20_w = ref_l31_o; pref_d24_w = ref_l31_o; pref_d28_w = ref_l31_o;
          pref_d17_w = ref_l31_o; pref_d21_w = ref_l31_o; pref_d25_w = ref_l31_o; pref_d29_w = ref_l31_o;
          pref_d18_w = ref_l31_o; pref_d22_w = ref_l31_o; pref_d26_w = ref_l31_o; pref_d30_w = ref_l31_o;
          pref_d19_w = ref_l31_o; pref_d23_w = ref_l31_o; pref_d27_w = ref_l31_o; pref_d31_w = ref_l31_o;
        end
        else begin
          if(avail_tl == 1'b1 ) begin
            pref_d00_w = ref_tl_o; pref_d04_w = ref_tl_o; pref_d08_w = ref_tl_o; pref_d12_w = ref_tl_o;
            pref_d01_w = ref_tl_o; pref_d05_w = ref_tl_o; pref_d09_w = ref_tl_o; pref_d13_w = ref_tl_o;
            pref_d02_w = ref_tl_o; pref_d06_w = ref_tl_o; pref_d10_w = ref_tl_o; pref_d14_w = ref_tl_o;
            pref_d03_w = ref_tl_o; pref_d07_w = ref_tl_o; pref_d11_w = ref_tl_o; pref_d15_w = ref_tl_o;

            pref_d16_w = ref_tl_o; pref_d20_w = ref_tl_o; pref_d24_w = ref_tl_o; pref_d28_w = ref_tl_o;
            pref_d17_w = ref_tl_o; pref_d21_w = ref_tl_o; pref_d25_w = ref_tl_o; pref_d29_w = ref_tl_o;
            pref_d18_w = ref_tl_o; pref_d22_w = ref_tl_o; pref_d26_w = ref_tl_o; pref_d30_w = ref_tl_o;
            pref_d19_w = ref_tl_o; pref_d23_w = ref_tl_o; pref_d27_w = ref_tl_o; pref_d31_w = ref_tl_o;
          end
          else begin
            if(avail_t == 1'b1) begin
              pref_d00_w = ref_t00_o; pref_d04_w = ref_t00_o; pref_d08_w = ref_t00_o; pref_d12_w = ref_t00_o;
              pref_d01_w = ref_t00_o; pref_d05_w = ref_t00_o; pref_d09_w = ref_t00_o; pref_d13_w = ref_t00_o;
              pref_d02_w = ref_t00_o; pref_d06_w = ref_t00_o; pref_d10_w = ref_t00_o; pref_d14_w = ref_t00_o;
              pref_d03_w = ref_t00_o; pref_d07_w = ref_t00_o; pref_d11_w = ref_t00_o; pref_d15_w = ref_t00_o;

              pref_d16_w = ref_t00_o; pref_d20_w = ref_t00_o; pref_d24_w = ref_t00_o; pref_d28_w = ref_t00_o;
              pref_d17_w = ref_t00_o; pref_d21_w = ref_t00_o; pref_d25_w = ref_t00_o; pref_d29_w = ref_t00_o;
              pref_d18_w = ref_t00_o; pref_d22_w = ref_t00_o; pref_d26_w = ref_t00_o; pref_d30_w = ref_t00_o;
              pref_d19_w = ref_t00_o; pref_d23_w = ref_t00_o; pref_d27_w = ref_t00_o; pref_d31_w = ref_t00_o;
            end
            else begin
              if(avail_r == 1'b1) begin
                pref_d00_w = ref_r00_o; pref_d04_w = ref_r00_o; pref_d08_w = ref_r00_o; pref_d12_w = ref_r00_o;
                pref_d01_w = ref_r00_o; pref_d05_w = ref_r00_o; pref_d09_w = ref_r00_o; pref_d13_w = ref_r00_o;
                pref_d02_w = ref_r00_o; pref_d06_w = ref_r00_o; pref_d10_w = ref_r00_o; pref_d14_w = ref_r00_o;
                pref_d03_w = ref_r00_o; pref_d07_w = ref_r00_o; pref_d11_w = ref_r00_o; pref_d15_w = ref_r00_o;

                pref_d16_w = ref_r00_o; pref_d20_w = ref_r00_o; pref_d24_w = ref_r00_o; pref_d28_w = ref_r00_o;
                pref_d17_w = ref_r00_o; pref_d21_w = ref_r00_o; pref_d25_w = ref_r00_o; pref_d29_w = ref_r00_o;
                pref_d18_w = ref_r00_o; pref_d22_w = ref_r00_o; pref_d26_w = ref_r00_o; pref_d30_w = ref_r00_o;
                pref_d19_w = ref_r00_o; pref_d23_w = ref_r00_o; pref_d27_w = ref_r00_o; pref_d31_w = ref_r00_o;
              end
              else begin
                pref_d00_w = 'd128; pref_d04_w = 'd128; pref_d08_w = 'd128; pref_d12_w = 'd128;
                pref_d01_w = 'd128; pref_d05_w = 'd128; pref_d09_w = 'd128; pref_d13_w = 'd128;
                pref_d02_w = 'd128; pref_d06_w = 'd128; pref_d10_w = 'd128; pref_d14_w = 'd128;
                pref_d03_w = 'd128; pref_d07_w = 'd128; pref_d11_w = 'd128; pref_d15_w = 'd128;

                pref_d16_w = 'd128; pref_d20_w = 'd128; pref_d24_w = 'd128; pref_d28_w = 'd128;
                pref_d17_w = 'd128; pref_d21_w = 'd128; pref_d25_w = 'd128; pref_d29_w = 'd128;
                pref_d18_w = 'd128; pref_d22_w = 'd128; pref_d26_w = 'd128; pref_d30_w = 'd128;
                pref_d19_w = 'd128; pref_d23_w = 'd128; pref_d27_w = 'd128; pref_d31_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_d00_w = ref_d00_o; pref_d04_w = ref_d04_o; pref_d08_w = ref_d08_o; pref_d12_w = ref_d12_o;
        pref_d01_w = ref_d01_o; pref_d05_w = ref_d05_o; pref_d09_w = ref_d09_o; pref_d13_w = ref_d13_o;
        pref_d02_w = ref_d02_o; pref_d06_w = ref_d06_o; pref_d10_w = ref_d10_o; pref_d14_w = ref_d14_o;
        pref_d03_w = ref_d03_o; pref_d07_w = ref_d07_o; pref_d11_w = ref_d11_o; pref_d15_w = ref_d15_o;

        pref_d16_w = ref_d16_o; pref_d20_w = ref_d20_o; pref_d24_w = ref_d24_o; pref_d28_w = ref_d28_o;
        pref_d17_w = ref_d17_o; pref_d21_w = ref_d21_o; pref_d25_w = ref_d25_o; pref_d29_w = ref_d29_o;
        pref_d18_w = ref_d18_o; pref_d22_w = ref_d22_o; pref_d26_w = ref_d26_o; pref_d30_w = ref_d30_o;
        pref_d19_w = ref_d19_o; pref_d23_w = ref_d23_o; pref_d27_w = ref_d27_o; pref_d31_w = ref_d31_o;
      end
    end
  endcase
end

//padding the left reference pixel
always @( * ) begin
  begin
     pref_l00_w = 'd128; pref_l04_w = 'd128; pref_l08_w = 'd128; pref_l12_w = 'd128;
     pref_l01_w = 'd128; pref_l05_w = 'd128; pref_l09_w = 'd128; pref_l13_w = 'd128;
     pref_l02_w = 'd128; pref_l06_w = 'd128; pref_l10_w = 'd128; pref_l14_w = 'd128;
     pref_l03_w = 'd128; pref_l07_w = 'd128; pref_l11_w = 'd128; pref_l15_w = 'd128;

     pref_l16_w = 'd128; pref_l20_w = 'd128; pref_l24_w = 'd128; pref_l28_w = 'd128;
     pref_l17_w = 'd128; pref_l21_w = 'd128; pref_l25_w = 'd128; pref_l29_w = 'd128;
     pref_l18_w = 'd128; pref_l22_w = 'd128; pref_l26_w = 'd128; pref_l30_w = 'd128;
     pref_l19_w = 'd128; pref_l23_w = 'd128; pref_l27_w = 'd128; pref_l31_w = 'd128;
  end
  case (size_i)
    2'b00:begin //cu_size == 4
      if (avail_l == 1'b0) begin
        if(avail_d == 1'b1) begin
          pref_l00_w = ref_d00_o;
          pref_l01_w = ref_d00_o;
          pref_l02_w = ref_d00_o;
          pref_l03_w = ref_d00_o;
        end
        else begin
          if(avail_tl == 1'b1 ) begin
            pref_l00_w = ref_tl_o;
            pref_l01_w = ref_tl_o;
            pref_l02_w = ref_tl_o;
            pref_l03_w = ref_tl_o;
          end
          else begin
            if(avail_t == 1'b1) begin
              pref_l00_w = ref_t00_o;
              pref_l01_w = ref_t00_o;
              pref_l02_w = ref_t00_o;
              pref_l03_w = ref_t00_o;
            end
            else begin
              if(avail_r == 1'b1) begin
                pref_l00_w = ref_r00_o;
                pref_l01_w = ref_r00_o;
                pref_l02_w = ref_r00_o;
                pref_l03_w = ref_r00_o;
              end
              else begin
                pref_l00_w = 'd128;
                pref_l01_w = 'd128;
                pref_l02_w = 'd128;
                pref_l03_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_l00_w = ref_l00_o;
        pref_l01_w = ref_l01_o;
        pref_l02_w = ref_l02_o;
        pref_l03_w = ref_l03_o;
      end
    end
    2'b01:begin//cu_size == 8
      if (avail_l == 1'b0) begin
        if(avail_d == 1'b1) begin
          pref_l00_w = ref_d00_o; pref_l04_w = ref_d00_o;
          pref_l01_w = ref_d00_o; pref_l05_w = ref_d00_o;
          pref_l02_w = ref_d00_o; pref_l06_w = ref_d00_o;
          pref_l03_w = ref_d00_o; pref_l07_w = ref_d00_o;
        end
        else begin
          if(avail_tl == 1'b1 ) begin
            pref_l00_w = ref_tl_o; pref_l04_w = ref_tl_o;
            pref_l01_w = ref_tl_o; pref_l05_w = ref_tl_o;
            pref_l02_w = ref_tl_o; pref_l06_w = ref_tl_o;
            pref_l03_w = ref_tl_o; pref_l07_w = ref_tl_o;
          end
          else begin
            if(avail_t == 1'b1) begin
              pref_l00_w = ref_t00_o; pref_l04_w = ref_t00_o;
              pref_l01_w = ref_t00_o; pref_l05_w = ref_t00_o;
              pref_l02_w = ref_t00_o; pref_l06_w = ref_t00_o;
              pref_l03_w = ref_t00_o; pref_l07_w = ref_t00_o;
            end
            else begin
              if(avail_r == 1'b1) begin
                pref_l00_w = ref_r00_o; pref_l04_w = ref_r00_o;
                pref_l01_w = ref_r00_o; pref_l05_w = ref_r00_o;
                pref_l02_w = ref_r00_o; pref_l06_w = ref_r00_o;
                pref_l03_w = ref_r00_o; pref_l07_w = ref_r00_o;
              end
              else begin
                pref_l00_w = 'd128; pref_l04_w = 'd128;
                pref_l01_w = 'd128; pref_l05_w = 'd128;
                pref_l02_w = 'd128; pref_l06_w = 'd128;
                pref_l03_w = 'd128; pref_l07_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_l00_w = ref_l00_o; pref_l04_w = ref_l04_o;
        pref_l01_w = ref_l01_o; pref_l05_w = ref_l05_o;
        pref_l02_w = ref_l02_o; pref_l06_w = ref_l06_o;
        pref_l03_w = ref_l03_o; pref_l07_w = ref_l07_o;
      end
    end
    2'b10:begin//cu_size == 16
      if (avail_l == 1'b0) begin
        if(avail_d == 1'b1) begin
          pref_l00_w = ref_d00_o; pref_l04_w = ref_d00_o; pref_l08_w = ref_d00_o; pref_l12_w = ref_d00_o;
          pref_l01_w = ref_d00_o; pref_l05_w = ref_d00_o; pref_l09_w = ref_d00_o; pref_l13_w = ref_d00_o;
          pref_l02_w = ref_d00_o; pref_l06_w = ref_d00_o; pref_l10_w = ref_d00_o; pref_l14_w = ref_d00_o;
          pref_l03_w = ref_d00_o; pref_l07_w = ref_d00_o; pref_l11_w = ref_d00_o; pref_l15_w = ref_d00_o;
        end
        else begin
          if(avail_tl == 1'b1 ) begin
            pref_l00_w = ref_tl_o; pref_l04_w = ref_tl_o; pref_l08_w = ref_tl_o; pref_l12_w = ref_tl_o;
            pref_l01_w = ref_tl_o; pref_l05_w = ref_tl_o; pref_l09_w = ref_tl_o; pref_l13_w = ref_tl_o;
            pref_l02_w = ref_tl_o; pref_l06_w = ref_tl_o; pref_l10_w = ref_tl_o; pref_l14_w = ref_tl_o;
            pref_l03_w = ref_tl_o; pref_l07_w = ref_tl_o; pref_l11_w = ref_tl_o; pref_l15_w = ref_tl_o;
          end
          else begin
            if(avail_t == 1'b1) begin
              pref_l00_w = ref_t00_o; pref_l04_w = ref_t00_o; pref_l08_w = ref_t00_o; pref_l12_w = ref_t00_o;
              pref_l01_w = ref_t00_o; pref_l05_w = ref_t00_o; pref_l09_w = ref_t00_o; pref_l13_w = ref_t00_o;
              pref_l02_w = ref_t00_o; pref_l06_w = ref_t00_o; pref_l10_w = ref_t00_o; pref_l14_w = ref_t00_o;
              pref_l03_w = ref_t00_o; pref_l07_w = ref_t00_o; pref_l11_w = ref_t00_o; pref_l15_w = ref_t00_o;
            end
            else begin
              if(avail_r == 1'b1) begin
                pref_l00_w = ref_r00_o; pref_l04_w = ref_r00_o; pref_l08_w = ref_r00_o; pref_l12_w = ref_r00_o;
                pref_l01_w = ref_r00_o; pref_l05_w = ref_r00_o; pref_l09_w = ref_r00_o; pref_l13_w = ref_r00_o;
                pref_l02_w = ref_r00_o; pref_l06_w = ref_r00_o; pref_l10_w = ref_r00_o; pref_l14_w = ref_r00_o;
                pref_l03_w = ref_r00_o; pref_l07_w = ref_r00_o; pref_l11_w = ref_r00_o; pref_l15_w = ref_r00_o;
              end
              else begin
                pref_l00_w = 'd128; pref_l04_w = 'd128; pref_l08_w = 'd128; pref_l12_w = 'd128;
                pref_l01_w = 'd128; pref_l05_w = 'd128; pref_l09_w = 'd128; pref_l13_w = 'd128;
                pref_l02_w = 'd128; pref_l06_w = 'd128; pref_l10_w = 'd128; pref_l14_w = 'd128;
                pref_l03_w = 'd128; pref_l07_w = 'd128; pref_l11_w = 'd128; pref_l15_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_l00_w = ref_l00_o; pref_l04_w = ref_l04_o; pref_l08_w = ref_l08_o; pref_l12_w = ref_l12_o;
        pref_l01_w = ref_l01_o; pref_l05_w = ref_l05_o; pref_l09_w = ref_l09_o; pref_l13_w = ref_l13_o;
        pref_l02_w = ref_l02_o; pref_l06_w = ref_l06_o; pref_l10_w = ref_l10_o; pref_l14_w = ref_l14_o;
        pref_l03_w = ref_l03_o; pref_l07_w = ref_l07_o; pref_l11_w = ref_l11_o; pref_l15_w = ref_l15_o;
      end
    end
    2'b11:begin//cu_size == 32
      if (avail_l == 1'b0) begin
        if(avail_d == 1'b1) begin
          pref_l00_w = ref_d00_o; pref_l04_w = ref_d00_o; pref_l08_w = ref_d00_o; pref_l12_w = ref_d00_o;
          pref_l01_w = ref_d00_o; pref_l05_w = ref_d00_o; pref_l09_w = ref_d00_o; pref_l13_w = ref_d00_o;
          pref_l02_w = ref_d00_o; pref_l06_w = ref_d00_o; pref_l10_w = ref_d00_o; pref_l14_w = ref_d00_o;
          pref_l03_w = ref_d00_o; pref_l07_w = ref_d00_o; pref_l11_w = ref_d00_o; pref_l15_w = ref_d00_o;

          pref_l16_w = ref_d00_o; pref_l20_w = ref_d00_o; pref_l24_w = ref_d00_o; pref_l28_w = ref_d00_o;
          pref_l17_w = ref_d00_o; pref_l21_w = ref_d00_o; pref_l25_w = ref_d00_o; pref_l29_w = ref_d00_o;
          pref_l18_w = ref_d00_o; pref_l22_w = ref_d00_o; pref_l26_w = ref_d00_o; pref_l30_w = ref_d00_o;
          pref_l19_w = ref_d00_o; pref_l23_w = ref_d00_o; pref_l27_w = ref_d00_o; pref_l31_w = ref_d00_o;
        end
        else begin
          if(avail_tl == 1'b1 ) begin
            pref_l00_w = ref_tl_o; pref_l04_w = ref_tl_o; pref_l08_w = ref_tl_o; pref_l12_w = ref_tl_o;
            pref_l01_w = ref_tl_o; pref_l05_w = ref_tl_o; pref_l09_w = ref_tl_o; pref_l13_w = ref_tl_o;
            pref_l02_w = ref_tl_o; pref_l06_w = ref_tl_o; pref_l10_w = ref_tl_o; pref_l14_w = ref_tl_o;
            pref_l03_w = ref_tl_o; pref_l07_w = ref_tl_o; pref_l11_w = ref_tl_o; pref_l15_w = ref_tl_o;

            pref_l16_w = ref_tl_o; pref_l20_w = ref_tl_o; pref_l24_w = ref_tl_o; pref_l28_w = ref_tl_o;
            pref_l17_w = ref_tl_o; pref_l21_w = ref_tl_o; pref_l25_w = ref_tl_o; pref_l29_w = ref_tl_o;
            pref_l18_w = ref_tl_o; pref_l22_w = ref_tl_o; pref_l26_w = ref_tl_o; pref_l30_w = ref_tl_o;
            pref_l19_w = ref_tl_o; pref_l23_w = ref_tl_o; pref_l27_w = ref_tl_o; pref_l31_w = ref_tl_o;
          end
          else begin
            if(avail_t == 1'b1) begin
              pref_l00_w = ref_t00_o; pref_l04_w = ref_t00_o; pref_l08_w = ref_t00_o; pref_l12_w = ref_t00_o;
              pref_l01_w = ref_t00_o; pref_l05_w = ref_t00_o; pref_l09_w = ref_t00_o; pref_l13_w = ref_t00_o;
              pref_l02_w = ref_t00_o; pref_l06_w = ref_t00_o; pref_l10_w = ref_t00_o; pref_l14_w = ref_t00_o;
              pref_l03_w = ref_t00_o; pref_l07_w = ref_t00_o; pref_l11_w = ref_t00_o; pref_l15_w = ref_t00_o;

              pref_l16_w = ref_t00_o; pref_l20_w = ref_t00_o; pref_l24_w = ref_t00_o; pref_l28_w = ref_t00_o;
              pref_l17_w = ref_t00_o; pref_l21_w = ref_t00_o; pref_l25_w = ref_t00_o; pref_l29_w = ref_t00_o;
              pref_l18_w = ref_t00_o; pref_l22_w = ref_t00_o; pref_l26_w = ref_t00_o; pref_l30_w = ref_t00_o;
              pref_l19_w = ref_t00_o; pref_l23_w = ref_t00_o; pref_l27_w = ref_t00_o; pref_l31_w = ref_t00_o;
            end
            else begin
              if(avail_r == 1'b1) begin
                pref_l00_w = ref_r00_o; pref_l04_w = ref_r00_o; pref_l08_w = ref_r00_o; pref_l12_w = ref_r00_o;
                pref_l01_w = ref_r00_o; pref_l05_w = ref_r00_o; pref_l09_w = ref_r00_o; pref_l13_w = ref_r00_o;
                pref_l02_w = ref_r00_o; pref_l06_w = ref_r00_o; pref_l10_w = ref_r00_o; pref_l14_w = ref_r00_o;
                pref_l03_w = ref_r00_o; pref_l07_w = ref_r00_o; pref_l11_w = ref_r00_o; pref_l15_w = ref_r00_o;

                pref_l16_w = ref_r00_o; pref_l20_w = ref_r00_o; pref_l24_w = ref_r00_o; pref_l28_w = ref_r00_o;
                pref_l17_w = ref_r00_o; pref_l21_w = ref_r00_o; pref_l25_w = ref_r00_o; pref_l29_w = ref_r00_o;
                pref_l18_w = ref_r00_o; pref_l22_w = ref_r00_o; pref_l26_w = ref_r00_o; pref_l30_w = ref_r00_o;
                pref_l19_w = ref_r00_o; pref_l23_w = ref_r00_o; pref_l27_w = ref_r00_o; pref_l31_w = ref_r00_o;
              end
              else begin
                pref_l00_w = 'd128; pref_l04_w = 'd128; pref_l08_w = 'd128; pref_l12_w = 'd128;
                pref_l01_w = 'd128; pref_l05_w = 'd128; pref_l09_w = 'd128; pref_l13_w = 'd128;
                pref_l02_w = 'd128; pref_l06_w = 'd128; pref_l10_w = 'd128; pref_l14_w = 'd128;
                pref_l03_w = 'd128; pref_l07_w = 'd128; pref_l11_w = 'd128; pref_l15_w = 'd128;

                pref_l16_w = 'd128; pref_l20_w = 'd128; pref_l24_w = 'd128; pref_l28_w = 'd128;
                pref_l17_w = 'd128; pref_l21_w = 'd128; pref_l25_w = 'd128; pref_l29_w = 'd128;
                pref_l18_w = 'd128; pref_l22_w = 'd128; pref_l26_w = 'd128; pref_l30_w = 'd128;
                pref_l19_w = 'd128; pref_l23_w = 'd128; pref_l27_w = 'd128; pref_l31_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_l00_w = ref_l00_o; pref_l04_w = ref_l04_o; pref_l08_w = ref_l08_o; pref_l12_w = ref_l12_o;
        pref_l01_w = ref_l01_o; pref_l05_w = ref_l05_o; pref_l09_w = ref_l09_o; pref_l13_w = ref_l13_o;
        pref_l02_w = ref_l02_o; pref_l06_w = ref_l06_o; pref_l10_w = ref_l10_o; pref_l14_w = ref_l14_o;
        pref_l03_w = ref_l03_o; pref_l07_w = ref_l07_o; pref_l11_w = ref_l11_o; pref_l15_w = ref_l15_o;

        pref_l16_w = ref_l16_o; pref_l20_w = ref_l20_o; pref_l24_w = ref_l24_o; pref_l28_w = ref_l28_o;
        pref_l17_w = ref_l17_o; pref_l21_w = ref_l21_o; pref_l25_w = ref_l25_o; pref_l29_w = ref_l29_o;
        pref_l18_w = ref_l18_o; pref_l22_w = ref_l22_o; pref_l26_w = ref_l26_o; pref_l30_w = ref_l30_o;
        pref_l19_w = ref_l19_o; pref_l23_w = ref_l23_o; pref_l27_w = ref_l27_o; pref_l31_w = ref_l31_o;
      end
    end
  endcase
end

//padding the topleft reference pixel
always @( * ) begin
  if (avail_tl == 1'b0) begin
    if(avail_l == 1'b1 ) begin
      pref_tl_w = ref_l00_o;
    end
    else begin
      if(avail_d == 1'b1) begin
        pref_tl_w = ref_d00_o;
      end
      else begin
        if(avail_t == 1'b1) begin
          pref_tl_w = ref_t00_o;
        end
        else begin
          if(avail_r == 1'b1) begin
            pref_tl_w = ref_r00_o;
          end
          else begin
            pref_tl_w = 'd128;
          end
        end
      end
    end
  end
  else begin
    pref_tl_w = ref_tl_o;
  end
end

//padding the top reference pixel
always @( * ) begin
  begin
     pref_t00_w = 'd128; pref_t04_w = 'd128; pref_t08_w = 'd128; pref_t12_w = 'd128;
     pref_t01_w = 'd128; pref_t05_w = 'd128; pref_t09_w = 'd128; pref_t13_w = 'd128;
     pref_t02_w = 'd128; pref_t06_w = 'd128; pref_t10_w = 'd128; pref_t14_w = 'd128;
     pref_t03_w = 'd128; pref_t07_w = 'd128; pref_t11_w = 'd128; pref_t15_w = 'd128;

     pref_t16_w = 'd128; pref_t20_w = 'd128; pref_t24_w = 'd128; pref_t28_w = 'd128;
     pref_t17_w = 'd128; pref_t21_w = 'd128; pref_t25_w = 'd128; pref_t29_w = 'd128;
     pref_t18_w = 'd128; pref_t22_w = 'd128; pref_t26_w = 'd128; pref_t30_w = 'd128;
     pref_t19_w = 'd128; pref_t23_w = 'd128; pref_t27_w = 'd128; pref_t31_w = 'd128;
  end
  case (size_i)
    2'b00:begin //cu_size == 4
      if (avail_t == 1'b0) begin
        if(avail_tl == 1'b1) begin
          pref_t00_w = ref_tl_o;
          pref_t01_w = ref_tl_o;
          pref_t02_w = ref_tl_o;
          pref_t03_w = ref_tl_o;
        end
        else begin
          if(avail_l == 1'b1 ) begin
            pref_t00_w = ref_l00_o;
            pref_t01_w = ref_l00_o;
            pref_t02_w = ref_l00_o;
            pref_t03_w = ref_l00_o;
          end
          else begin
            if(avail_d == 1'b1) begin
              pref_t00_w = ref_d00_o;
              pref_t01_w = ref_d00_o;
              pref_t02_w = ref_d00_o;
              pref_t03_w = ref_d00_o;
            end
            else begin
              if(avail_r == 1'b1) begin
                pref_t00_w = ref_r00_o;
                pref_t01_w = ref_r00_o;
                pref_t02_w = ref_r00_o;
                pref_t03_w = ref_r00_o;
              end
              else begin
                pref_t00_w = 'd128;
                pref_t01_w = 'd128;
                pref_t02_w = 'd128;
                pref_t03_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_t00_w = ref_t00_o;
        pref_t01_w = ref_t01_o;
        pref_t02_w = ref_t02_o;
        pref_t03_w = ref_t03_o;
      end
    end
    2'b01:begin//cu_size == 8
      if (avail_t == 1'b0) begin
        if(avail_tl == 1'b1) begin
          pref_t00_w = ref_tl_o; pref_t04_w = ref_tl_o;
          pref_t01_w = ref_tl_o; pref_t05_w = ref_tl_o;
          pref_t02_w = ref_tl_o; pref_t06_w = ref_tl_o;
          pref_t03_w = ref_tl_o; pref_t07_w = ref_tl_o;
        end
        else begin
          if(avail_l == 1'b1 ) begin
            pref_t00_w = ref_l00_o; pref_t04_w = ref_l00_o;
            pref_t01_w = ref_l00_o; pref_t05_w = ref_l00_o;
            pref_t02_w = ref_l00_o; pref_t06_w = ref_l00_o;
            pref_t03_w = ref_l00_o; pref_t07_w = ref_l00_o;
          end
          else begin
            if(avail_d == 1'b1) begin
              pref_t00_w = ref_d00_o; pref_t04_w = ref_d00_o;
              pref_t01_w = ref_d00_o; pref_t05_w = ref_d00_o;
              pref_t02_w = ref_d00_o; pref_t06_w = ref_d00_o;
              pref_t03_w = ref_d00_o; pref_t07_w = ref_d00_o;
            end
            else begin
              if(avail_r == 1'b1) begin
                pref_t00_w = ref_r00_o; pref_t04_w = ref_r00_o;
                pref_t01_w = ref_r00_o; pref_t05_w = ref_r00_o;
                pref_t02_w = ref_r00_o; pref_t06_w = ref_r00_o;
                pref_t03_w = ref_r00_o; pref_t07_w = ref_r00_o;
              end
              else begin
                pref_t00_w = 'd128; pref_t04_w = 'd128;
                pref_t01_w = 'd128; pref_t05_w = 'd128;
                pref_t02_w = 'd128; pref_t06_w = 'd128;
                pref_t03_w = 'd128; pref_t07_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_t00_w = ref_t00_o; pref_t04_w = ref_t04_o;
        pref_t01_w = ref_t01_o; pref_t05_w = ref_t05_o;
        pref_t02_w = ref_t02_o; pref_t06_w = ref_t06_o;
        pref_t03_w = ref_t03_o; pref_t07_w = ref_t07_o;
      end
    end
    2'b10:begin//cu_size == 16
      if (avail_t == 1'b0) begin
        if(avail_tl == 1'b1) begin
          pref_t00_w = ref_tl_o; pref_t04_w = ref_tl_o; pref_t08_w = ref_tl_o; pref_t12_w = ref_tl_o;
          pref_t01_w = ref_tl_o; pref_t05_w = ref_tl_o; pref_t09_w = ref_tl_o; pref_t13_w = ref_tl_o;
          pref_t02_w = ref_tl_o; pref_t06_w = ref_tl_o; pref_t10_w = ref_tl_o; pref_t14_w = ref_tl_o;
          pref_t03_w = ref_tl_o; pref_t07_w = ref_tl_o; pref_t11_w = ref_tl_o; pref_t15_w = ref_tl_o;
        end
        else begin
          if(avail_l == 1'b1 ) begin
            pref_t00_w = ref_l00_o; pref_t04_w = ref_l00_o; pref_t08_w = ref_l00_o; pref_t12_w = ref_l00_o;
            pref_t01_w = ref_l00_o; pref_t05_w = ref_l00_o; pref_t09_w = ref_l00_o; pref_t13_w = ref_l00_o;
            pref_t02_w = ref_l00_o; pref_t06_w = ref_l00_o; pref_t10_w = ref_l00_o; pref_t14_w = ref_l00_o;
            pref_t03_w = ref_l00_o; pref_t07_w = ref_l00_o; pref_t11_w = ref_l00_o; pref_t15_w = ref_l00_o;
          end
          else begin
            if(avail_d == 1'b1) begin
              pref_t00_w = ref_d00_o; pref_t04_w = ref_d00_o; pref_t08_w = ref_d00_o; pref_t12_w = ref_d00_o;
              pref_t01_w = ref_d00_o; pref_t05_w = ref_d00_o; pref_t09_w = ref_d00_o; pref_t13_w = ref_d00_o;
              pref_t02_w = ref_d00_o; pref_t06_w = ref_d00_o; pref_t10_w = ref_d00_o; pref_t14_w = ref_d00_o;
              pref_t03_w = ref_d00_o; pref_t07_w = ref_d00_o; pref_t11_w = ref_d00_o; pref_t15_w = ref_d00_o;
            end
            else begin
              if(avail_r == 1'b1) begin
                pref_t00_w = ref_r00_o; pref_t04_w = ref_r00_o; pref_t08_w = ref_r00_o; pref_t12_w = ref_r00_o;
                pref_t01_w = ref_r00_o; pref_t05_w = ref_r00_o; pref_t09_w = ref_r00_o; pref_t13_w = ref_r00_o;
                pref_t02_w = ref_r00_o; pref_t06_w = ref_r00_o; pref_t10_w = ref_r00_o; pref_t14_w = ref_r00_o;
                pref_t03_w = ref_r00_o; pref_t07_w = ref_r00_o; pref_t11_w = ref_r00_o; pref_t15_w = ref_r00_o;
              end
              else begin
                pref_t00_w = 'd128; pref_t04_w = 'd128; pref_t08_w = 'd128; pref_t12_w = 'd128;
                pref_t01_w = 'd128; pref_t05_w = 'd128; pref_t09_w = 'd128; pref_t13_w = 'd128;
                pref_t02_w = 'd128; pref_t06_w = 'd128; pref_t10_w = 'd128; pref_t14_w = 'd128;
                pref_t03_w = 'd128; pref_t07_w = 'd128; pref_t11_w = 'd128; pref_t15_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_t00_w = ref_t00_o; pref_t04_w = ref_t04_o; pref_t08_w = ref_t08_o; pref_t12_w = ref_t12_o;
        pref_t01_w = ref_t01_o; pref_t05_w = ref_t05_o; pref_t09_w = ref_t09_o; pref_t13_w = ref_t13_o;
        pref_t02_w = ref_t02_o; pref_t06_w = ref_t06_o; pref_t10_w = ref_t10_o; pref_t14_w = ref_t14_o;
        pref_t03_w = ref_t03_o; pref_t07_w = ref_t07_o; pref_t11_w = ref_t11_o; pref_t15_w = ref_t15_o;
      end
    end
    2'b11:begin//cu_size == 32
      if (avail_t == 1'b0) begin
        if(avail_tl == 1'b1) begin
          pref_t00_w = ref_tl_o; pref_t04_w = ref_tl_o; pref_t08_w = ref_tl_o; pref_t12_w = ref_tl_o;
          pref_t01_w = ref_tl_o; pref_t05_w = ref_tl_o; pref_t09_w = ref_tl_o; pref_t13_w = ref_tl_o;
          pref_t02_w = ref_tl_o; pref_t06_w = ref_tl_o; pref_t10_w = ref_tl_o; pref_t14_w = ref_tl_o;
          pref_t03_w = ref_tl_o; pref_t07_w = ref_tl_o; pref_t11_w = ref_tl_o; pref_t15_w = ref_tl_o;

          pref_t16_w = ref_tl_o; pref_t20_w = ref_tl_o; pref_t24_w = ref_tl_o; pref_t28_w = ref_tl_o;
          pref_t17_w = ref_tl_o; pref_t21_w = ref_tl_o; pref_t25_w = ref_tl_o; pref_t29_w = ref_tl_o;
          pref_t18_w = ref_tl_o; pref_t22_w = ref_tl_o; pref_t26_w = ref_tl_o; pref_t30_w = ref_tl_o;
          pref_t19_w = ref_tl_o; pref_t23_w = ref_tl_o; pref_t27_w = ref_tl_o; pref_t31_w = ref_tl_o;
        end
        else begin
          if(avail_l == 1'b1 ) begin
            pref_t00_w = ref_l00_o; pref_t04_w = ref_l00_o; pref_t08_w = ref_l00_o; pref_t12_w = ref_l00_o;
            pref_t01_w = ref_l00_o; pref_t05_w = ref_l00_o; pref_t09_w = ref_l00_o; pref_t13_w = ref_l00_o;
            pref_t02_w = ref_l00_o; pref_t06_w = ref_l00_o; pref_t10_w = ref_l00_o; pref_t14_w = ref_l00_o;
            pref_t03_w = ref_l00_o; pref_t07_w = ref_l00_o; pref_t11_w = ref_l00_o; pref_t15_w = ref_l00_o;

            pref_t16_w = ref_l00_o; pref_t20_w = ref_l00_o; pref_t24_w = ref_l00_o; pref_t28_w = ref_l00_o;
            pref_t17_w = ref_l00_o; pref_t21_w = ref_l00_o; pref_t25_w = ref_l00_o; pref_t29_w = ref_l00_o;
            pref_t18_w = ref_l00_o; pref_t22_w = ref_l00_o; pref_t26_w = ref_l00_o; pref_t30_w = ref_l00_o;
            pref_t19_w = ref_l00_o; pref_t23_w = ref_l00_o; pref_t27_w = ref_l00_o; pref_t31_w = ref_l00_o;
          end
          else begin
            if(avail_d == 1'b1) begin
              pref_t00_w = ref_d00_o; pref_t04_w = ref_d00_o; pref_t08_w = ref_d00_o; pref_t12_w = ref_d00_o;
              pref_t01_w = ref_d00_o; pref_t05_w = ref_d00_o; pref_t09_w = ref_d00_o; pref_t13_w = ref_d00_o;
              pref_t02_w = ref_d00_o; pref_t06_w = ref_d00_o; pref_t10_w = ref_d00_o; pref_t14_w = ref_d00_o;
              pref_t03_w = ref_d00_o; pref_t07_w = ref_d00_o; pref_t11_w = ref_d00_o; pref_t15_w = ref_d00_o;

              pref_t16_w = ref_d00_o; pref_t20_w = ref_d00_o; pref_t24_w = ref_d00_o; pref_t28_w = ref_d00_o;
              pref_t17_w = ref_d00_o; pref_t21_w = ref_d00_o; pref_t25_w = ref_d00_o; pref_t29_w = ref_d00_o;
              pref_t18_w = ref_d00_o; pref_t22_w = ref_d00_o; pref_t26_w = ref_d00_o; pref_t30_w = ref_d00_o;
              pref_t19_w = ref_d00_o; pref_t23_w = ref_d00_o; pref_t27_w = ref_d00_o; pref_t31_w = ref_d00_o;
            end
            else begin
              if(avail_r == 1'b1) begin
                pref_t00_w = ref_r00_o; pref_t04_w = ref_r00_o; pref_t08_w = ref_r00_o; pref_t12_w = ref_r00_o;
                pref_t01_w = ref_r00_o; pref_t05_w = ref_r00_o; pref_t09_w = ref_r00_o; pref_t13_w = ref_r00_o;
                pref_t02_w = ref_r00_o; pref_t06_w = ref_r00_o; pref_t10_w = ref_r00_o; pref_t14_w = ref_r00_o;
                pref_t03_w = ref_r00_o; pref_t07_w = ref_r00_o; pref_t11_w = ref_r00_o; pref_t15_w = ref_r00_o;

                pref_t16_w = ref_r00_o; pref_t20_w = ref_r00_o; pref_t24_w = ref_r00_o; pref_t28_w = ref_r00_o;
                pref_t17_w = ref_r00_o; pref_t21_w = ref_r00_o; pref_t25_w = ref_r00_o; pref_t29_w = ref_r00_o;
                pref_t18_w = ref_r00_o; pref_t22_w = ref_r00_o; pref_t26_w = ref_r00_o; pref_t30_w = ref_r00_o;
                pref_t19_w = ref_r00_o; pref_t23_w = ref_r00_o; pref_t27_w = ref_r00_o; pref_t31_w = ref_r00_o;
              end
              else begin
                pref_t00_w = 'd128; pref_t04_w = 'd128; pref_t08_w = 'd128; pref_t12_w = 'd128;
                pref_t01_w = 'd128; pref_t05_w = 'd128; pref_t09_w = 'd128; pref_t13_w = 'd128;
                pref_t02_w = 'd128; pref_t06_w = 'd128; pref_t10_w = 'd128; pref_t14_w = 'd128;
                pref_t03_w = 'd128; pref_t07_w = 'd128; pref_t11_w = 'd128; pref_t15_w = 'd128;

                pref_t16_w = 'd128; pref_t20_w = 'd128; pref_t24_w = 'd128; pref_t28_w = 'd128;
                pref_t17_w = 'd128; pref_t21_w = 'd128; pref_t25_w = 'd128; pref_t29_w = 'd128;
                pref_t18_w = 'd128; pref_t22_w = 'd128; pref_t26_w = 'd128; pref_t30_w = 'd128;
                pref_t19_w = 'd128; pref_t23_w = 'd128; pref_t27_w = 'd128; pref_t31_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_t00_w = ref_t00_o; pref_t04_w = ref_t04_o; pref_t08_w = ref_t08_o; pref_t12_w = ref_t12_o;
        pref_t01_w = ref_t01_o; pref_t05_w = ref_t05_o; pref_t09_w = ref_t09_o; pref_t13_w = ref_t13_o;
        pref_t02_w = ref_t02_o; pref_t06_w = ref_t06_o; pref_t10_w = ref_t10_o; pref_t14_w = ref_t14_o;
        pref_t03_w = ref_t03_o; pref_t07_w = ref_t07_o; pref_t11_w = ref_t11_o; pref_t15_w = ref_t15_o;

        pref_t16_w = ref_t16_o; pref_t20_w = ref_t20_o; pref_t24_w = ref_t24_o; pref_t28_w = ref_t28_o;
        pref_t17_w = ref_t17_o; pref_t21_w = ref_t21_o; pref_t25_w = ref_t25_o; pref_t29_w = ref_t29_o;
        pref_t18_w = ref_t18_o; pref_t22_w = ref_t22_o; pref_t26_w = ref_t26_o; pref_t30_w = ref_t30_o;
        pref_t19_w = ref_t19_o; pref_t23_w = ref_t23_o; pref_t27_w = ref_t27_o; pref_t31_w = ref_t31_o;
      end
    end
  endcase
end

//padding the topright reference pixel
always @( * ) begin
  begin
    pref_r00_w = 'd0; pref_r04_w = 'd0; pref_r08_w = 'd0; pref_r12_w = 'd0;
    pref_r01_w = 'd0; pref_r05_w = 'd0; pref_r09_w = 'd0; pref_r13_w = 'd0;
    pref_r02_w = 'd0; pref_r06_w = 'd0; pref_r10_w = 'd0; pref_r14_w = 'd0;
    pref_r03_w = 'd0; pref_r07_w = 'd0; pref_r11_w = 'd0; pref_r15_w = 'd0;

    pref_r16_w = 'd0; pref_r20_w = 'd0; pref_r24_w = 'd0; pref_r28_w = 'd0;
    pref_r17_w = 'd0; pref_r21_w = 'd0; pref_r25_w = 'd0; pref_r29_w = 'd0;
    pref_r18_w = 'd0; pref_r22_w = 'd0; pref_r26_w = 'd0; pref_r30_w = 'd0;
    pref_r19_w = 'd0; pref_r23_w = 'd0; pref_r27_w = 'd0; pref_r31_w = 'd0;
  end
  case (size_i)
    2'b00:begin //cu_size == 4
      if (avail_r == 1'b0) begin
        if(avail_t == 1'b1) begin
          pref_r00_w = ref_t03_o;
          pref_r01_w = ref_t03_o;
          pref_r02_w = ref_t03_o;
          pref_r03_w = ref_t03_o;
        end
        else begin
          if(avail_tl == 1'b1 ) begin
            pref_r00_w = ref_tl_o;
            pref_r01_w = ref_tl_o;
            pref_r02_w = ref_tl_o;
            pref_r03_w = ref_tl_o;
          end
          else begin
            if(avail_l == 1'b1) begin
              pref_r00_w = ref_l00_o;
              pref_r01_w = ref_l00_o;
              pref_r02_w = ref_l00_o;
              pref_r03_w = ref_l00_o;
            end
            else begin
              if(avail_d == 1'b1) begin
                pref_r00_w = ref_d00_o;
                pref_r01_w = ref_d00_o;
                pref_r02_w = ref_d00_o;
                pref_r03_w = ref_d00_o;
              end
              else begin
                pref_r00_w = 'd128;
                pref_r01_w = 'd128;
                pref_r02_w = 'd128;
                pref_r03_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_r00_w = ref_r00_o;
        pref_r01_w = ref_r01_o;
        pref_r02_w = ref_r02_o;
        pref_r03_w = ref_r03_o;
      end
    end
    2'b01:begin//cu_size == 8
      if (avail_r == 1'b0) begin
        if(avail_t == 1'b1) begin
          pref_r00_w = ref_t07_o; pref_r04_w = ref_t07_o;
          pref_r01_w = ref_t07_o; pref_r05_w = ref_t07_o;
          pref_r02_w = ref_t07_o; pref_r06_w = ref_t07_o;
          pref_r03_w = ref_t07_o; pref_r07_w = ref_t07_o;
        end
        else begin
          if(avail_tl == 1'b1 ) begin
            pref_r00_w = ref_tl_o; pref_r04_w = ref_tl_o;
            pref_r01_w = ref_tl_o; pref_r05_w = ref_tl_o;
            pref_r02_w = ref_tl_o; pref_r06_w = ref_tl_o;
            pref_r03_w = ref_tl_o; pref_r07_w = ref_tl_o;
          end
          else begin
            if(avail_l == 1'b1) begin
              pref_r00_w = ref_l00_o; pref_r04_w = ref_l00_o;
              pref_r01_w = ref_l00_o; pref_r05_w = ref_l00_o;
              pref_r02_w = ref_l00_o; pref_r06_w = ref_l00_o;
              pref_r03_w = ref_l00_o; pref_r07_w = ref_l00_o;
            end
            else begin
              if(avail_d == 1'b1) begin
                pref_r00_w = ref_d00_o; pref_r04_w = ref_d00_o;
                pref_r01_w = ref_d00_o; pref_r05_w = ref_d00_o;
                pref_r02_w = ref_d00_o; pref_r06_w = ref_d00_o;
                pref_r03_w = ref_d00_o; pref_r07_w = ref_d00_o;
              end
              else begin
                pref_r00_w = 'd128; pref_r04_w = 'd128;
                pref_r01_w = 'd128; pref_r05_w = 'd128;
                pref_r02_w = 'd128; pref_r06_w = 'd128;
                pref_r03_w = 'd128; pref_r07_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_r00_w = ref_r00_o; pref_r04_w = ref_r04_o;
        pref_r01_w = ref_r01_o; pref_r05_w = ref_r05_o;
        pref_r02_w = ref_r02_o; pref_r06_w = ref_r06_o;
        pref_r03_w = ref_r03_o; pref_r07_w = ref_r07_o;
      end
    end
    2'b10:begin//cu_size == 16
      if (avail_r == 1'b0) begin
        if(avail_t == 1'b1) begin
          pref_r00_w = ref_t15_o; pref_r04_w = ref_t15_o; pref_r08_w = ref_t15_o; pref_r12_w = ref_t15_o;
          pref_r01_w = ref_t15_o; pref_r05_w = ref_t15_o; pref_r09_w = ref_t15_o; pref_r13_w = ref_t15_o;
          pref_r02_w = ref_t15_o; pref_r06_w = ref_t15_o; pref_r10_w = ref_t15_o; pref_r14_w = ref_t15_o;
          pref_r03_w = ref_t15_o; pref_r07_w = ref_t15_o; pref_r11_w = ref_t15_o; pref_r15_w = ref_t15_o;
        end
        else begin
          if(avail_tl == 1'b1 ) begin
            pref_r00_w = ref_tl_o; pref_r04_w = ref_tl_o; pref_r08_w = ref_tl_o; pref_r12_w = ref_tl_o;
            pref_r01_w = ref_tl_o; pref_r05_w = ref_tl_o; pref_r09_w = ref_tl_o; pref_r13_w = ref_tl_o;
            pref_r02_w = ref_tl_o; pref_r06_w = ref_tl_o; pref_r10_w = ref_tl_o; pref_r14_w = ref_tl_o;
            pref_r03_w = ref_tl_o; pref_r07_w = ref_tl_o; pref_r11_w = ref_tl_o; pref_r15_w = ref_tl_o;
          end
          else begin
            if(avail_l == 1'b1) begin
              pref_r00_w = ref_l00_o; pref_r04_w = ref_l00_o; pref_r08_w = ref_l00_o; pref_r12_w = ref_l00_o;
              pref_r01_w = ref_l00_o; pref_r05_w = ref_l00_o; pref_r09_w = ref_l00_o; pref_r13_w = ref_l00_o;
              pref_r02_w = ref_l00_o; pref_r06_w = ref_l00_o; pref_r10_w = ref_l00_o; pref_r14_w = ref_l00_o;
              pref_r03_w = ref_l00_o; pref_r07_w = ref_l00_o; pref_r11_w = ref_l00_o; pref_r15_w = ref_l00_o;
            end
            else begin
              if(avail_d == 1'b1) begin
                pref_r00_w = ref_d00_o; pref_r04_w = ref_d00_o; pref_r08_w = ref_d00_o; pref_r12_w = ref_d00_o;
                pref_r01_w = ref_d00_o; pref_r05_w = ref_d00_o; pref_r09_w = ref_d00_o; pref_r13_w = ref_d00_o;
                pref_r02_w = ref_d00_o; pref_r06_w = ref_d00_o; pref_r10_w = ref_d00_o; pref_r14_w = ref_d00_o;
                pref_r03_w = ref_d00_o; pref_r07_w = ref_d00_o; pref_r11_w = ref_d00_o; pref_r15_w = ref_d00_o;
              end
              else begin
                pref_r00_w = 'd128; pref_r04_w = 'd128; pref_r08_w = 'd128; pref_r12_w = 'd128;
                pref_r01_w = 'd128; pref_r05_w = 'd128; pref_r09_w = 'd128; pref_r13_w = 'd128;
                pref_r02_w = 'd128; pref_r06_w = 'd128; pref_r10_w = 'd128; pref_r14_w = 'd128;
                pref_r03_w = 'd128; pref_r07_w = 'd128; pref_r11_w = 'd128; pref_r15_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_r00_w = ref_r00_o; pref_r04_w = ref_r04_o; pref_r08_w = ref_r08_o; pref_r12_w = ref_r12_o;
        pref_r01_w = ref_r01_o; pref_r05_w = ref_r05_o; pref_r09_w = ref_r09_o; pref_r13_w = ref_r13_o;
        pref_r02_w = ref_r02_o; pref_r06_w = ref_r06_o; pref_r10_w = ref_r10_o; pref_r14_w = ref_r14_o;
        pref_r03_w = ref_r03_o; pref_r07_w = ref_r07_o; pref_r11_w = ref_r11_o; pref_r15_w = ref_r15_o;
      end
    end
    2'b11:begin//cu_size == 32
      if (avail_r == 1'b0) begin
        if(avail_t == 1'b1) begin
          pref_r00_w = ref_t31_o; pref_r04_w = ref_t31_o; pref_r08_w = ref_t31_o; pref_r12_w = ref_t31_o;
          pref_r01_w = ref_t31_o; pref_r05_w = ref_t31_o; pref_r09_w = ref_t31_o; pref_r13_w = ref_t31_o;
          pref_r02_w = ref_t31_o; pref_r06_w = ref_t31_o; pref_r10_w = ref_t31_o; pref_r14_w = ref_t31_o;
          pref_r03_w = ref_t31_o; pref_r07_w = ref_t31_o; pref_r11_w = ref_t31_o; pref_r15_w = ref_t31_o;

          pref_r16_w = ref_t31_o; pref_r20_w = ref_t31_o; pref_r24_w = ref_t31_o; pref_r28_w = ref_t31_o;
          pref_r17_w = ref_t31_o; pref_r21_w = ref_t31_o; pref_r25_w = ref_t31_o; pref_r29_w = ref_t31_o;
          pref_r18_w = ref_t31_o; pref_r22_w = ref_t31_o; pref_r26_w = ref_t31_o; pref_r30_w = ref_t31_o;
          pref_r19_w = ref_t31_o; pref_r23_w = ref_t31_o; pref_r27_w = ref_t31_o; pref_r31_w = ref_t31_o;
        end
        else begin
          if(avail_tl == 1'b1 ) begin
            pref_r00_w = ref_tl_o; pref_r04_w = ref_tl_o; pref_r08_w = ref_tl_o; pref_r12_w = ref_tl_o;
            pref_r01_w = ref_tl_o; pref_r05_w = ref_tl_o; pref_r09_w = ref_tl_o; pref_r13_w = ref_tl_o;
            pref_r02_w = ref_tl_o; pref_r06_w = ref_tl_o; pref_r10_w = ref_tl_o; pref_r14_w = ref_tl_o;
            pref_r03_w = ref_tl_o; pref_r07_w = ref_tl_o; pref_r11_w = ref_tl_o; pref_r15_w = ref_tl_o;

            pref_r16_w = ref_tl_o; pref_r20_w = ref_tl_o; pref_r24_w = ref_tl_o; pref_r28_w = ref_tl_o;
            pref_r17_w = ref_tl_o; pref_r21_w = ref_tl_o; pref_r25_w = ref_tl_o; pref_r29_w = ref_tl_o;
            pref_r18_w = ref_tl_o; pref_r22_w = ref_tl_o; pref_r26_w = ref_tl_o; pref_r30_w = ref_tl_o;
            pref_r19_w = ref_tl_o; pref_r23_w = ref_tl_o; pref_r27_w = ref_tl_o; pref_r31_w = ref_tl_o;
          end
          else begin
            if(avail_l == 1'b1) begin
              pref_r00_w = ref_l00_o; pref_r04_w = ref_l00_o; pref_r08_w = ref_l00_o; pref_r12_w = ref_l00_o;
              pref_r01_w = ref_l00_o; pref_r05_w = ref_l00_o; pref_r09_w = ref_l00_o; pref_r13_w = ref_l00_o;
              pref_r02_w = ref_l00_o; pref_r06_w = ref_l00_o; pref_r10_w = ref_l00_o; pref_r14_w = ref_l00_o;
              pref_r03_w = ref_l00_o; pref_r07_w = ref_l00_o; pref_r11_w = ref_l00_o; pref_r15_w = ref_l00_o;

              pref_r16_w = ref_l00_o; pref_r20_w = ref_l00_o; pref_r24_w = ref_l00_o; pref_r28_w = ref_l00_o;
              pref_r17_w = ref_l00_o; pref_r21_w = ref_l00_o; pref_r25_w = ref_l00_o; pref_r29_w = ref_l00_o;
              pref_r18_w = ref_l00_o; pref_r22_w = ref_l00_o; pref_r26_w = ref_l00_o; pref_r30_w = ref_l00_o;
              pref_r19_w = ref_l00_o; pref_r23_w = ref_l00_o; pref_r27_w = ref_l00_o; pref_r31_w = ref_l00_o;
            end
            else begin
              if(avail_d == 1'b1) begin
                pref_r00_w = ref_d00_o; pref_r04_w = ref_d00_o; pref_r08_w = ref_d00_o; pref_r12_w = ref_d00_o;
                pref_r01_w = ref_d00_o; pref_r05_w = ref_d00_o; pref_r09_w = ref_d00_o; pref_r13_w = ref_d00_o;
                pref_r02_w = ref_d00_o; pref_r06_w = ref_d00_o; pref_r10_w = ref_d00_o; pref_r14_w = ref_d00_o;
                pref_r03_w = ref_d00_o; pref_r07_w = ref_d00_o; pref_r11_w = ref_d00_o; pref_r15_w = ref_d00_o;

                pref_r16_w = ref_d00_o; pref_r20_w = ref_d00_o; pref_r24_w = ref_d00_o; pref_r28_w = ref_d00_o;
                pref_r17_w = ref_d00_o; pref_r21_w = ref_d00_o; pref_r25_w = ref_d00_o; pref_r29_w = ref_d00_o;
                pref_r18_w = ref_d00_o; pref_r22_w = ref_d00_o; pref_r26_w = ref_d00_o; pref_r30_w = ref_d00_o;
                pref_r19_w = ref_d00_o; pref_r23_w = ref_d00_o; pref_r27_w = ref_d00_o; pref_r31_w = ref_d00_o;
              end
              else begin
                pref_r00_w = 'd128; pref_r04_w = 'd128; pref_r08_w = 'd128; pref_r12_w = 'd128;
                pref_r01_w = 'd128; pref_r05_w = 'd128; pref_r09_w = 'd128; pref_r13_w = 'd128;
                pref_r02_w = 'd128; pref_r06_w = 'd128; pref_r10_w = 'd128; pref_r14_w = 'd128;
                pref_r03_w = 'd128; pref_r07_w = 'd128; pref_r11_w = 'd128; pref_r15_w = 'd128;

                pref_r16_w = 'd128; pref_r20_w = 'd128; pref_r24_w = 'd128; pref_r28_w = 'd128;
                pref_r17_w = 'd128; pref_r21_w = 'd128; pref_r25_w = 'd128; pref_r29_w = 'd128;
                pref_r18_w = 'd128; pref_r22_w = 'd128; pref_r26_w = 'd128; pref_r30_w = 'd128;
                pref_r19_w = 'd128; pref_r23_w = 'd128; pref_r27_w = 'd128; pref_r31_w = 'd128;
              end
            end
          end
        end
      end
      else begin
        pref_r00_w = ref_r00_o; pref_r04_w = ref_r04_o; pref_r08_w = ref_r08_o; pref_r12_w = ref_r12_o;
        pref_r01_w = ref_r01_o; pref_r05_w = ref_r05_o; pref_r09_w = ref_r09_o; pref_r13_w = ref_r13_o;
        pref_r02_w = ref_r02_o; pref_r06_w = ref_r06_o; pref_r10_w = ref_r10_o; pref_r14_w = ref_r14_o;
        pref_r03_w = ref_r03_o; pref_r07_w = ref_r07_o; pref_r11_w = ref_r11_o; pref_r15_w = ref_r15_o;

        pref_r16_w = ref_r16_o; pref_r20_w = ref_r20_o; pref_r24_w = ref_r24_o; pref_r28_w = ref_r28_o;
        pref_r17_w = ref_r17_o; pref_r21_w = ref_r21_o; pref_r25_w = ref_r25_o; pref_r29_w = ref_r29_o;
        pref_r18_w = ref_r18_o; pref_r22_w = ref_r22_o; pref_r26_w = ref_r26_o; pref_r30_w = ref_r30_o;
        pref_r19_w = ref_r19_o; pref_r23_w = ref_r23_o; pref_r27_w = ref_r27_o; pref_r31_w = ref_r31_o;
      end
    end
  endcase
end
//**********************************************************************************************


//***************************************** FILTER *********************************************
//filter_flag
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    filter_flag <= 'd0;
  end
  else begin
    if( ref_sel_i==2'b00 ) begin
      case (size_i)
        2'b00: filter_flag <= 1'b0;
        2'b01:begin
          if((mode_i=='d0)||(mode_i=='d2)||(mode_i=='d18)||(mode_i=='d34))
            filter_flag <= 1'b1;
          else
            filter_flag <= 1'b0;
        end
        2'b10:begin
          if((mode_i=='d1)||(mode_i=='d9)||(mode_i=='d10)||(mode_i=='d11)||(mode_i=='d25)||(mode_i=='d26)||(mode_i=='d27))
            filter_flag <= 1'b0;
          else
            filter_flag <= 1'b1;
        end
        2'b11:begin
          if((mode_i=='d1)||(mode_i=='d10)||(mode_i=='d26))
            filter_flag <= 1'b0;
          else
            filter_flag <= 1'b1;
        end
      endcase
    end
    else begin
      filter_flag <= 1'b0 ;
    end
  end
end

//filter downleft reference pixel
always @( * ) begin
  if(filter_flag==1'b1) begin
                                                             fref_d04_w = (ref_d05_o+(ref_d04_o<<1)+ref_d03_o+2)>>2;
    fref_d01_w = (ref_d02_o+(ref_d01_o<<1)+ref_d00_o+2)>>2;  fref_d05_w = (ref_d06_o+(ref_d05_o<<1)+ref_d04_o+2)>>2;
    fref_d02_w = (ref_d03_o+(ref_d02_o<<1)+ref_d01_o+2)>>2;  fref_d06_w = (ref_d07_o+(ref_d06_o<<1)+ref_d05_o+2)>>2;

    fref_d08_w = (ref_d09_o+(ref_d08_o<<1)+ref_d07_o+2)>>2;  fref_d12_w = (ref_d13_o+(ref_d12_o<<1)+ref_d11_o+2)>>2;
    fref_d09_w = (ref_d10_o+(ref_d09_o<<1)+ref_d08_o+2)>>2;  fref_d13_w = (ref_d14_o+(ref_d13_o<<1)+ref_d12_o+2)>>2;
    fref_d10_w = (ref_d11_o+(ref_d10_o<<1)+ref_d09_o+2)>>2;  fref_d14_w = (ref_d15_o+(ref_d14_o<<1)+ref_d13_o+2)>>2;
    fref_d11_w = (ref_d12_o+(ref_d11_o<<1)+ref_d10_o+2)>>2;

    fref_d16_w = (ref_d17_o+(ref_d16_o<<1)+ref_d15_o+2)>>2;  fref_d20_w = (ref_d21_o+(ref_d20_o<<1)+ref_d19_o+2)>>2;
    fref_d17_w = (ref_d18_o+(ref_d17_o<<1)+ref_d16_o+2)>>2;  fref_d21_w = (ref_d22_o+(ref_d21_o<<1)+ref_d20_o+2)>>2;
    fref_d18_w = (ref_d19_o+(ref_d18_o<<1)+ref_d17_o+2)>>2;  fref_d22_w = (ref_d23_o+(ref_d22_o<<1)+ref_d21_o+2)>>2;
    fref_d19_w = (ref_d20_o+(ref_d19_o<<1)+ref_d18_o+2)>>2;  fref_d23_w = (ref_d24_o+(ref_d23_o<<1)+ref_d22_o+2)>>2;

    fref_d24_w = (ref_d25_o+(ref_d24_o<<1)+ref_d23_o+2)>>2;  fref_d28_w = (ref_d29_o+(ref_d28_o<<1)+ref_d27_o+2)>>2;
    fref_d25_w = (ref_d26_o+(ref_d25_o<<1)+ref_d24_o+2)>>2;  fref_d29_w = (ref_d30_o+(ref_d29_o<<1)+ref_d28_o+2)>>2;
    fref_d26_w = (ref_d27_o+(ref_d26_o<<1)+ref_d25_o+2)>>2;  fref_d30_w = (ref_d31_o+(ref_d30_o<<1)+ref_d29_o+2)>>2;
    fref_d27_w = (ref_d28_o+(ref_d27_o<<1)+ref_d26_o+2)>>2;  fref_d31_w = ref_d31_o;

    case (size_i)
      2'b00:fref_d00_w = ref_d00_o;
      2'b01:fref_d00_w = (ref_d01_o+(ref_d00_o<<1)+ref_l07_o+2)>>2;
      2'b10:fref_d00_w = (ref_d01_o+(ref_d00_o<<1)+ref_l15_o+2)>>2;
      2'b11:fref_d00_w = (ref_d01_o+(ref_d00_o<<1)+ref_l31_o+2)>>2;
    endcase

    fref_d03_w = (ref_d04_o+(ref_d03_o<<1)+ref_d02_o+2)>>2;

    if(size_i == 2'b01)
      fref_d07_w = ref_d07_o;
    else
      fref_d07_w = (ref_d08_o+(ref_d07_o<<1)+ref_d06_o+2)>>2;

    if(size_i == 2'b10)
      fref_d15_w = ref_d15_o;
    else
      fref_d15_w = (ref_d16_o+(ref_d15_o<<1)+ref_d14_o+2)>>2;

  end
  else begin
    fref_d00_w = ref_d00_o;   fref_d04_w = ref_d04_o;   fref_d08_w = ref_d08_o;   fref_d12_w = ref_d12_o;
    fref_d01_w = ref_d01_o;   fref_d05_w = ref_d05_o;   fref_d09_w = ref_d09_o;   fref_d13_w = ref_d13_o;
    fref_d02_w = ref_d02_o;   fref_d06_w = ref_d06_o;   fref_d10_w = ref_d10_o;   fref_d14_w = ref_d14_o;
    fref_d03_w = ref_d03_o;   fref_d07_w = ref_d07_o;   fref_d11_w = ref_d11_o;   fref_d15_w = ref_d15_o;

    fref_d16_w = ref_d16_o;   fref_d20_w = ref_d20_o;   fref_d24_w = ref_d24_o;   fref_d28_w = ref_d28_o;
    fref_d17_w = ref_d17_o;   fref_d21_w = ref_d21_o;   fref_d25_w = ref_d25_o;   fref_d29_w = ref_d29_o;
    fref_d18_w = ref_d18_o;   fref_d22_w = ref_d22_o;   fref_d26_w = ref_d26_o;   fref_d30_w = ref_d30_o;
    fref_d19_w = ref_d19_o;   fref_d23_w = ref_d23_o;   fref_d27_w = ref_d27_o;   fref_d31_w = ref_d31_o;
  end
end

//filter left reference pixel
always @( * ) begin
  if(filter_flag==1'b1) begin
    fref_l00_w = (ref_l01_o+(ref_l00_o<<1)+ref_tl_o+2)>>2;   fref_l04_w = (ref_l05_o+(ref_l04_o<<1)+ref_l03_o+2)>>2;
    fref_l01_w = (ref_l02_o+(ref_l01_o<<1)+ref_l00_o+2)>>2;  fref_l05_w = (ref_l06_o+(ref_l05_o<<1)+ref_l04_o+2)>>2;
    fref_l02_w = (ref_l03_o+(ref_l02_o<<1)+ref_l01_o+2)>>2;  fref_l06_w = (ref_l07_o+(ref_l06_o<<1)+ref_l05_o+2)>>2;

    fref_l08_w = (ref_l09_o+(ref_l08_o<<1)+ref_l07_o+2)>>2;  fref_l12_w = (ref_l13_o+(ref_l12_o<<1)+ref_l11_o+2)>>2;
    fref_l09_w = (ref_l10_o+(ref_l09_o<<1)+ref_l08_o+2)>>2;  fref_l13_w = (ref_l14_o+(ref_l13_o<<1)+ref_l12_o+2)>>2;
    fref_l10_w = (ref_l11_o+(ref_l10_o<<1)+ref_l09_o+2)>>2;  fref_l14_w = (ref_l15_o+(ref_l14_o<<1)+ref_l13_o+2)>>2;
    fref_l11_w = (ref_l12_o+(ref_l11_o<<1)+ref_l10_o+2)>>2;

    fref_l16_w = (ref_l17_o+(ref_l16_o<<1)+ref_l15_o+2)>>2;  fref_l20_w = (ref_l21_o+(ref_l20_o<<1)+ref_l19_o+2)>>2;
    fref_l17_w = (ref_l18_o+(ref_l17_o<<1)+ref_l16_o+2)>>2;  fref_l21_w = (ref_l22_o+(ref_l21_o<<1)+ref_l20_o+2)>>2;
    fref_l18_w = (ref_l19_o+(ref_l18_o<<1)+ref_l17_o+2)>>2;  fref_l22_w = (ref_l23_o+(ref_l22_o<<1)+ref_l21_o+2)>>2;
    fref_l19_w = (ref_l20_o+(ref_l19_o<<1)+ref_l18_o+2)>>2;  fref_l23_w = (ref_l24_o+(ref_l23_o<<1)+ref_l22_o+2)>>2;

    fref_l24_w = (ref_l25_o+(ref_l24_o<<1)+ref_l23_o+2)>>2;  fref_l28_w = (ref_l29_o+(ref_l28_o<<1)+ref_l27_o+2)>>2;
    fref_l25_w = (ref_l26_o+(ref_l25_o<<1)+ref_l24_o+2)>>2;  fref_l29_w = (ref_l30_o+(ref_l29_o<<1)+ref_l28_o+2)>>2;
    fref_l26_w = (ref_l27_o+(ref_l26_o<<1)+ref_l25_o+2)>>2;  fref_l30_w = (ref_l31_o+(ref_l30_o<<1)+ref_l29_o+2)>>2;
    fref_l27_w = (ref_l28_o+(ref_l27_o<<1)+ref_l26_o+2)>>2;  fref_l31_w = (ref_d00_o+(ref_l31_o<<1)+ref_l30_o+2)>>2;

    fref_l03_w = (ref_l04_o+(ref_l03_o<<1)+ref_l02_o+2)>>2;

    if(size_i == 2'b01)
      fref_l07_w = (ref_d00_o+(ref_l07_o<<1)+ref_l06_o+2)>>2;
    else
      fref_l07_w = (ref_l08_o+(ref_l07_o<<1)+ref_l06_o+2)>>2;

    if(size_i == 2'b10)
      fref_l15_w = (ref_d00_o+(ref_l15_o<<1)+ref_l14_o+2)>>2;
    else
      fref_l15_w = (ref_l16_o+(ref_l15_o<<1)+ref_l14_o+2)>>2;

  end
  else begin
    fref_l00_w = ref_l00_o;   fref_l04_w = ref_l04_o;   fref_l08_w = ref_l08_o;   fref_l12_w = ref_l12_o;
    fref_l01_w = ref_l01_o;   fref_l05_w = ref_l05_o;   fref_l09_w = ref_l09_o;   fref_l13_w = ref_l13_o;
    fref_l02_w = ref_l02_o;   fref_l06_w = ref_l06_o;   fref_l10_w = ref_l10_o;   fref_l14_w = ref_l14_o;
    fref_l03_w = ref_l03_o;   fref_l07_w = ref_l07_o;   fref_l11_w = ref_l11_o;   fref_l15_w = ref_l15_o;

    fref_l16_w = ref_l16_o;   fref_l20_w = ref_l20_o;   fref_l24_w = ref_l24_o;   fref_l28_w = ref_l28_o;
    fref_l17_w = ref_l17_o;   fref_l21_w = ref_l21_o;   fref_l25_w = ref_l25_o;   fref_l29_w = ref_l29_o;
    fref_l18_w = ref_l18_o;   fref_l22_w = ref_l22_o;   fref_l26_w = ref_l26_o;   fref_l30_w = ref_l30_o;
    fref_l19_w = ref_l19_o;   fref_l23_w = ref_l23_o;   fref_l27_w = ref_l27_o;   fref_l31_w = ref_l31_o;
  end
end

//filter topleft reference pixel
always @( * ) begin
   if(filter_flag == 1'b1)
     fref_tl_w = (ref_l00_o+(ref_tl_o<<1)+ref_t00_o+2)>>2;
   else
     fref_tl_w = ref_tl_o;
end


//filter top reference pixel
always @( * ) begin
  if(filter_flag==1'b1) begin
    fref_t00_w = (ref_t01_o+(ref_t00_o<<1)+ref_tl_o+2)>>2;   fref_t04_w = (ref_t05_o+(ref_t04_o<<1)+ref_t03_o+2)>>2;
    fref_t01_w = (ref_t02_o+(ref_t01_o<<1)+ref_t00_o+2)>>2;  fref_t05_w = (ref_t06_o+(ref_t05_o<<1)+ref_t04_o+2)>>2;
    fref_t02_w = (ref_t03_o+(ref_t02_o<<1)+ref_t01_o+2)>>2;  fref_t06_w = (ref_t07_o+(ref_t06_o<<1)+ref_t05_o+2)>>2;

    fref_t08_w = (ref_t09_o+(ref_t08_o<<1)+ref_t07_o+2)>>2;  fref_t12_w = (ref_t13_o+(ref_t12_o<<1)+ref_t11_o+2)>>2;
    fref_t09_w = (ref_t10_o+(ref_t09_o<<1)+ref_t08_o+2)>>2;  fref_t13_w = (ref_t14_o+(ref_t13_o<<1)+ref_t12_o+2)>>2;
    fref_t10_w = (ref_t11_o+(ref_t10_o<<1)+ref_t09_o+2)>>2;  fref_t14_w = (ref_t15_o+(ref_t14_o<<1)+ref_t13_o+2)>>2;
    fref_t11_w = (ref_t12_o+(ref_t11_o<<1)+ref_t10_o+2)>>2;

    fref_t16_w = (ref_t17_o+(ref_t16_o<<1)+ref_t15_o+2)>>2;  fref_t20_w = (ref_t21_o+(ref_t20_o<<1)+ref_t19_o+2)>>2;
    fref_t17_w = (ref_t18_o+(ref_t17_o<<1)+ref_t16_o+2)>>2;  fref_t21_w = (ref_t22_o+(ref_t21_o<<1)+ref_t20_o+2)>>2;
    fref_t18_w = (ref_t19_o+(ref_t18_o<<1)+ref_t17_o+2)>>2;  fref_t22_w = (ref_t23_o+(ref_t22_o<<1)+ref_t21_o+2)>>2;
    fref_t19_w = (ref_t20_o+(ref_t19_o<<1)+ref_t18_o+2)>>2;  fref_t23_w = (ref_t24_o+(ref_t23_o<<1)+ref_t22_o+2)>>2;

    fref_t24_w = (ref_t25_o+(ref_t24_o<<1)+ref_t23_o+2)>>2;  fref_t28_w = (ref_t29_o+(ref_t28_o<<1)+ref_t27_o+2)>>2;
    fref_t25_w = (ref_t26_o+(ref_t25_o<<1)+ref_t24_o+2)>>2;  fref_t29_w = (ref_t30_o+(ref_t29_o<<1)+ref_t28_o+2)>>2;
    fref_t26_w = (ref_t27_o+(ref_t26_o<<1)+ref_t25_o+2)>>2;  fref_t30_w = (ref_t31_o+(ref_t30_o<<1)+ref_t29_o+2)>>2;
    fref_t27_w = (ref_t28_o+(ref_t27_o<<1)+ref_t26_o+2)>>2;  fref_t31_w = (ref_r00_o+(ref_t31_o<<1)+ref_t30_o+2)>>2;

    fref_t03_w = (ref_t04_o+(ref_t03_o<<1)+ref_t02_o+2)>>2;

    if(size_i == 2'b01)
      fref_t07_w = (ref_r00_o+(ref_t07_o<<1)+ref_t06_o+2)>>2;
    else
      fref_t07_w = (ref_t08_o+(ref_t07_o<<1)+ref_t06_o+2)>>2;

    if(size_i == 2'b10)
      fref_t15_w = (ref_r00_o+(ref_t15_o<<1)+ref_t14_o+2)>>2;
    else
      fref_t15_w = (ref_t16_o+(ref_t15_o<<1)+ref_t14_o+2)>>2;

  end
  else begin
    fref_t00_w = ref_t00_o;   fref_t04_w = ref_t04_o;   fref_t08_w = ref_t08_o;   fref_t12_w = ref_t12_o;
    fref_t01_w = ref_t01_o;   fref_t05_w = ref_t05_o;   fref_t09_w = ref_t09_o;   fref_t13_w = ref_t13_o;
    fref_t02_w = ref_t02_o;   fref_t06_w = ref_t06_o;   fref_t10_w = ref_t10_o;   fref_t14_w = ref_t14_o;
    fref_t03_w = ref_t03_o;   fref_t07_w = ref_t07_o;   fref_t11_w = ref_t11_o;   fref_t15_w = ref_t15_o;

    fref_t16_w = ref_t16_o;   fref_t20_w = ref_t20_o;   fref_t24_w = ref_t24_o;   fref_t28_w = ref_t28_o;
    fref_t17_w = ref_t17_o;   fref_t21_w = ref_t21_o;   fref_t25_w = ref_t25_o;   fref_t29_w = ref_t29_o;
    fref_t18_w = ref_t18_o;   fref_t22_w = ref_t22_o;   fref_t26_w = ref_t26_o;   fref_t30_w = ref_t30_o;
    fref_t19_w = ref_t19_o;   fref_t23_w = ref_t23_o;   fref_t27_w = ref_t27_o;   fref_t31_w = ref_t31_o;
  end
end

//filter righttop reference pixel
always @( * ) begin
  if(filter_flag==1'b1) begin
                                                             fref_r04_w = (ref_r05_o+(ref_r04_o<<1)+ref_r03_o+2)>>2;
    fref_r01_w = (ref_r02_o+(ref_r01_o<<1)+ref_r00_o+2)>>2;  fref_r05_w = (ref_r06_o+(ref_r05_o<<1)+ref_r04_o+2)>>2;
    fref_r02_w = (ref_r03_o+(ref_r02_o<<1)+ref_r01_o+2)>>2;  fref_r06_w = (ref_r07_o+(ref_r06_o<<1)+ref_r05_o+2)>>2;

    fref_r08_w = (ref_r09_o+(ref_r08_o<<1)+ref_r07_o+2)>>2;  fref_r12_w = (ref_r13_o+(ref_r12_o<<1)+ref_r11_o+2)>>2;
    fref_r09_w = (ref_r10_o+(ref_r09_o<<1)+ref_r08_o+2)>>2;  fref_r13_w = (ref_r14_o+(ref_r13_o<<1)+ref_r12_o+2)>>2;
    fref_r10_w = (ref_r11_o+(ref_r10_o<<1)+ref_r09_o+2)>>2;  fref_r14_w = (ref_r15_o+(ref_r14_o<<1)+ref_r13_o+2)>>2;
    fref_r11_w = (ref_r12_o+(ref_r11_o<<1)+ref_r10_o+2)>>2;

    fref_r16_w = (ref_r17_o+(ref_r16_o<<1)+ref_r15_o+2)>>2;  fref_r20_w = (ref_r21_o+(ref_r20_o<<1)+ref_r19_o+2)>>2;
    fref_r17_w = (ref_r18_o+(ref_r17_o<<1)+ref_r16_o+2)>>2;  fref_r21_w = (ref_r22_o+(ref_r21_o<<1)+ref_r20_o+2)>>2;
    fref_r18_w = (ref_r19_o+(ref_r18_o<<1)+ref_r17_o+2)>>2;  fref_r22_w = (ref_r23_o+(ref_r22_o<<1)+ref_r21_o+2)>>2;
    fref_r19_w = (ref_r20_o+(ref_r19_o<<1)+ref_r18_o+2)>>2;  fref_r23_w = (ref_r24_o+(ref_r23_o<<1)+ref_r22_o+2)>>2;

    fref_r24_w = (ref_r25_o+(ref_r24_o<<1)+ref_r23_o+2)>>2;  fref_r28_w = (ref_r29_o+(ref_r28_o<<1)+ref_r27_o+2)>>2;
    fref_r25_w = (ref_r26_o+(ref_r25_o<<1)+ref_r24_o+2)>>2;  fref_r29_w = (ref_r30_o+(ref_r29_o<<1)+ref_r28_o+2)>>2;
    fref_r26_w = (ref_r27_o+(ref_r26_o<<1)+ref_r25_o+2)>>2;  fref_r30_w = (ref_r31_o+(ref_r30_o<<1)+ref_r29_o+2)>>2;
    fref_r27_w = (ref_r28_o+(ref_r27_o<<1)+ref_r26_o+2)>>2;  fref_r31_w = ref_r31_o;

    case (size_i)
      2'b00:fref_r00_w = ref_r00_o;
      2'b01:fref_r00_w = (ref_r01_o+(ref_r00_o<<1)+ref_t07_o+2)>>2;
      2'b10:fref_r00_w = (ref_r01_o+(ref_r00_o<<1)+ref_t15_o+2)>>2;
      2'b11:fref_r00_w = (ref_r01_o+(ref_r00_o<<1)+ref_t31_o+2)>>2;
    endcase

    fref_r03_w = (ref_r04_o+(ref_r03_o<<1)+ref_r02_o+2)>>2;

    if(size_i == 2'b01)
      fref_r07_w = ref_r07_o;
    else
      fref_r07_w = (ref_r08_o+(ref_r07_o<<1)+ref_r06_o+2)>>2;

    if(size_i == 2'b10)
      fref_r15_w = ref_r15_o;
    else
      fref_r15_w = (ref_r16_o+(ref_r15_o<<1)+ref_r14_o+2)>>2;

  end
  else begin
    fref_r00_w = ref_r00_o;   fref_r04_w = ref_r04_o;   fref_r08_w = ref_r08_o;   fref_r12_w = ref_r12_o;
    fref_r01_w = ref_r01_o;   fref_r05_w = ref_r05_o;   fref_r09_w = ref_r09_o;   fref_r13_w = ref_r13_o;
    fref_r02_w = ref_r02_o;   fref_r06_w = ref_r06_o;   fref_r10_w = ref_r10_o;   fref_r14_w = ref_r14_o;
    fref_r03_w = ref_r03_o;   fref_r07_w = ref_r07_o;   fref_r11_w = ref_r11_o;   fref_r15_w = ref_r15_o;

    fref_r16_w = ref_r16_o;   fref_r20_w = ref_r20_o;   fref_r24_w = ref_r24_o;   fref_r28_w = ref_r28_o;
    fref_r17_w = ref_r17_o;   fref_r21_w = ref_r21_o;   fref_r25_w = ref_r25_o;   fref_r29_w = ref_r29_o;
    fref_r18_w = ref_r18_o;   fref_r22_w = ref_r22_o;   fref_r26_w = ref_r26_o;   fref_r30_w = ref_r30_o;
    fref_r19_w = ref_r19_o;   fref_r23_w = ref_r23_o;   fref_r27_w = ref_r27_o;   fref_r31_w = ref_r31_o;
  end
end
//**********************************************************************************************

always @(posedge clk or negedge rst_n) begin
  if(!rst_n)
    done_o <= 'd0;
  else begin
    if(done_o)
      done_o <= 'd0;
    else
      if(w_done_r)
        done_o <= 'd1;
  end
end//done_o

always @(posedge clk or negedge rst_n) begin
  if(!rst_n)
    pre_ready_o <= 'd0;
  else begin
    if(pre_ready_o)
      pre_ready_o <= 'd0;
    else
      if(state==PADING)
        pre_ready_o <= 'd1;
  end
end//done_o

//********************** reference pixel ****************************
//tl
  reg [`PIXEL_WIDTH-1:0] ref_t31_0_r ;
  reg [`PIXEL_WIDTH-1:0] ref_t31_1_r ;
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n ) begin
      ref_t31_0_r <= 'd0 ;
      ref_t31_1_r <= 'd0 ;
    end
    else if( (LCU_x_i[0]=='d0)&&(position_i=='d0)&&(start_i=='d1)&&(ref_sel_i==2'b00)&&
             ( ( (pre_min_size_i==1'b0)&&(size_i==2'b00) ) ||
               ( (pre_min_size_i==1'b1)&&(size_i==2'b01) )
             )
           ) begin
      ref_t31_0_r <= ref_t31_r ;
      ref_t31_1_r <= ref_t31_0_r ;
    end
  end

  reg [`PIXEL_WIDTH-1:0] ref_l15_r_u ;
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      ref_l15_r_u <= 'd0 ;
    end
    else begin
      if( (ref_sel_i==2'b10) && ( ((rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d8)) ||
                                  ((rcnt_r=='d3)&&(size_i==2'b01)&&(position_i=='d0))
                                )
        ) begin
        ref_l15_r_u <= r_data_col_i[7:0] ;
      end
    end
  end

  reg [`PIXEL_WIDTH-1:0] ref_l15_r_v ;
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      ref_l15_r_v <= 'd0 ;
    end
    else begin
      if( (ref_sel_i==2'b11) && ( ((rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d8)) ||
                                  ((rcnt_r=='d3)&&(size_i==2'b01)&&(position_i=='d0))
                                )
        ) begin
        ref_l15_r_v <= r_data_col_i[7:0] ;
      end
    end
  end

  reg [`PIXEL_WIDTH-1:0] ref_t31_r_u ;
  reg [`PIXEL_WIDTH-1:0] ref_t31_0_r_u ;
  reg [`PIXEL_WIDTH-1:0] ref_t31_1_r_u ;
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      ref_t31_r_u   <= 'd0 ;
      ref_t31_0_r_u <= 'd0 ;
      ref_t31_1_r_u <= 'd0 ;
    end
    else begin
      if( (ref_sel_i==2'b10) && ( ((rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d20)) ||
                                  ((rcnt_r=='d3)&&(size_i==2'b01)&&(position_i=='d16)) ||
                                  ((rcnt_r=='d5)&&(size_i==2'b10)&&(position_i=='d00))
                                )
        ) begin
        ref_t31_r_u   <= r_data_frame_i[7:0] ;
        ref_t31_0_r_u <= ref_t31_r_u      ;
        ref_t31_1_r_u <= ref_t31_0_r_u    ;
      end
    end
  end

  reg [`PIXEL_WIDTH-1:0] ref_t31_r_v ;
  reg [`PIXEL_WIDTH-1:0] ref_t31_0_r_v ;
  reg [`PIXEL_WIDTH-1:0] ref_t31_1_r_v ;
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      ref_t31_r_v   <= 'd0 ;
      ref_t31_0_r_v <= 'd0 ;
      ref_t31_1_r_v <= 'd0 ;
    end
    else begin
      if( (ref_sel_i==2'b11) && ( ((rcnt_r=='d2)&&(size_i==2'b00)&&(position_i=='d20)) ||
                                  ((rcnt_r=='d3)&&(size_i==2'b01)&&(position_i=='d16)) ||
                                  ((rcnt_r=='d5)&&(size_i==2'b10)&&(position_i=='d00))
                                )
        ) begin
        ref_t31_r_v   <= r_data_frame_i[7:0] ;
        ref_t31_0_r_v <= ref_t31_r_v      ;
        ref_t31_1_r_v <= ref_t31_0_r_v    ;
      end
    end
  end

reg [`PIXEL_WIDTH-1:0] ref_temp_r;
always @(posedge clk or negedge rst_n) begin
  if(!rst_n)
    ref_tl_o <='d0;
  else begin
    case(state)
      FREAD,LREAD:begin
        if(rcnt_r == 'd1) begin
          if(LCU_y_i>0 && i4x4_y_w=='d0) begin
            if(!position_i) begin
              if( ref_sel_i==2'b00 )
                if( size_i!=2'b11 ) begin
                  ref_tl_o   <= (LCU_x_i[0]==0) ? ref_t31_1_r : ref_t31_r ;
                  ref_temp_r <= (LCU_x_i[0]==0) ? ref_t31_1_r : ref_t31_r ;
                end
                else begin
                  ref_tl_o <= ref_temp_r;
                end
              else if( ref_sel_i==2'b10 )
                ref_tl_o <= (LCU_x_i[0]==0) ? ref_t31_1_r_u : ref_t31_r_u ;
              else begin
                ref_tl_o <= (LCU_x_i[0]==0) ? ref_t31_1_r_v : ref_t31_r_v ;
              end
            end
            else begin
              ref_tl_o <= r_data_frame_i[7:0];
            end
          end
          else begin
            if( position_i=='d32 ) begin
              case( ref_sel_i )
                2'b00 : ref_tl_o <= ref_l15_r   ;
                2'b10 : ref_tl_o <= ref_l15_r_u ;
                2'b11 : ref_tl_o <= ref_l15_r_v ;
              endcase
            end
            else begin
              if(position_i[1:0]==2'b10 || position_i[3:0]==4'b1000)
                ref_tl_o <= r_data_col_i[7:0];
              else begin
                ref_tl_o <= r_data_row_i[7:0];
              end
            end
          end
        end
      end
      PADING:ref_tl_o <=pref_tl_w ;
      FILTER:ref_tl_o <=fref_tl_w ;
    endcase
  end
end

//t
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_t00_o<='d0; ref_t01_o<='d0; ref_t02_o<='d0; ref_t03_o<='d0; ref_t04_o<='d0; ref_t05_o<='d0; ref_t06_o<='d0; ref_t07_o<='d0;
    ref_t08_o<='d0; ref_t09_o<='d0; ref_t10_o<='d0; ref_t11_o<='d0; ref_t12_o<='d0; ref_t13_o<='d0; ref_t14_o<='d0; ref_t15_o<='d0;
    ref_t16_o<='d0; ref_t17_o<='d0; ref_t18_o<='d0; ref_t19_o<='d0; ref_t20_o<='d0; ref_t21_o<='d0; ref_t22_o<='d0; ref_t23_o<='d0;
    ref_t24_o<='d0; ref_t25_o<='d0; ref_t26_o<='d0; ref_t27_o<='d0; ref_t28_o<='d0; ref_t29_o<='d0; ref_t30_o<='d0; ref_t31_o<='d0;
  end
  else begin
    case(state)
      WRITE:begin
        if(rec_val_i) begin
          case(size_i)
            2'b00:begin
              ref_t00_o<=rec_data_i[29*`PIXEL_WIDTH-1:28*`PIXEL_WIDTH]; ref_t01_o<=rec_data_i[25*`PIXEL_WIDTH-1:24*`PIXEL_WIDTH];
              ref_t02_o<=rec_data_i[21*`PIXEL_WIDTH-1:20*`PIXEL_WIDTH]; ref_t03_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH];
            end
            2'b01:begin
              if(!rec_idx_i)begin
                ref_t00_o<=rec_data_i[25*`PIXEL_WIDTH-1:24*`PIXEL_WIDTH]; ref_t01_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH];
                ref_t02_o<=rec_data_i[ 9*`PIXEL_WIDTH-1: 8*`PIXEL_WIDTH]; ref_t03_o<=rec_data_i[   `PIXEL_WIDTH-1:0];
              end
              else begin
                ref_t04_o<=rec_data_i[25*`PIXEL_WIDTH-1:24*`PIXEL_WIDTH]; ref_t05_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH];
                ref_t06_o<=rec_data_i[ 9*`PIXEL_WIDTH-1: 8*`PIXEL_WIDTH]; ref_t07_o<=rec_data_i[   `PIXEL_WIDTH-1:0];
              end
            end
            2'b10:begin
              case(rec_idx_i)
                 'd0:begin
                   ref_t00_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH]; ref_t01_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                end
                 'd2:begin
                   ref_t02_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH]; ref_t03_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                end
                 'd4:begin
                   ref_t04_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH]; ref_t05_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                end
                 'd6:begin
                   ref_t06_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH]; ref_t07_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                end
                 'd8:begin
                   ref_t08_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH]; ref_t09_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                end
                'd10:begin
                  ref_t10_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH]; ref_t11_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                end
                'd12:begin
                  ref_t12_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH]; ref_t13_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                end
                'd14:begin
                  ref_t14_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH]; ref_t15_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                end
              endcase
            end
            2'b11:begin
              case(rec_idx_i)
                 'd0:ref_t00_o<=rec_data_i[`PIXEL_WIDTH-1:0]; 'd4:ref_t04_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                 'd1:ref_t01_o<=rec_data_i[`PIXEL_WIDTH-1:0]; 'd5:ref_t05_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                 'd2:ref_t02_o<=rec_data_i[`PIXEL_WIDTH-1:0]; 'd6:ref_t06_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                 'd3:ref_t03_o<=rec_data_i[`PIXEL_WIDTH-1:0]; 'd7:ref_t07_o<=rec_data_i[`PIXEL_WIDTH-1:0];

                 'd8:ref_t08_o<=rec_data_i[`PIXEL_WIDTH-1:0];'d12:ref_t12_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                 'd9:ref_t09_o<=rec_data_i[`PIXEL_WIDTH-1:0];'d13:ref_t13_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                'd10:ref_t10_o<=rec_data_i[`PIXEL_WIDTH-1:0];'d14:ref_t14_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                'd11:ref_t11_o<=rec_data_i[`PIXEL_WIDTH-1:0];'d15:ref_t15_o<=rec_data_i[`PIXEL_WIDTH-1:0];

                'd16:ref_t16_o<=rec_data_i[`PIXEL_WIDTH-1:0];'d20:ref_t20_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                'd17:ref_t17_o<=rec_data_i[`PIXEL_WIDTH-1:0];'d21:ref_t21_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                'd18:ref_t18_o<=rec_data_i[`PIXEL_WIDTH-1:0];'d22:ref_t22_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                'd19:ref_t19_o<=rec_data_i[`PIXEL_WIDTH-1:0];'d23:ref_t23_o<=rec_data_i[`PIXEL_WIDTH-1:0];

                'd24:ref_t24_o<=rec_data_i[`PIXEL_WIDTH-1:0];'d28:ref_t28_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                'd25:ref_t25_o<=rec_data_i[`PIXEL_WIDTH-1:0];'d29:ref_t29_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                'd26:ref_t26_o<=rec_data_i[`PIXEL_WIDTH-1:0];'d30:ref_t30_o<=rec_data_i[`PIXEL_WIDTH-1:0];
                'd27:ref_t27_o<=rec_data_i[`PIXEL_WIDTH-1:0];'d31:ref_t31_o<=rec_data_i[`PIXEL_WIDTH-1:0];
              endcase
            end
          endcase
        end
      end

      FREAD,LREAD:begin
        if(size_i==2'b11 && done_r1)begin
          ref_t00_o<=ref_t00_r; ref_t01_o<=ref_t01_r; ref_t02_o<=ref_t02_r; ref_t03_o<=ref_t03_r; ref_t04_o<=ref_t04_r; ref_t05_o<=ref_t05_r; ref_t06_o<=ref_t06_r; ref_t07_o<=ref_t07_r;
          ref_t08_o<=ref_t08_r; ref_t09_o<=ref_t09_r; ref_t10_o<=ref_t10_r; ref_t11_o<=ref_t11_r; ref_t12_o<=ref_t12_r; ref_t13_o<=ref_t13_r; ref_t14_o<=ref_t14_r; ref_t15_o<=ref_t15_r;
          ref_t16_o<=ref_t16_r; ref_t17_o<=ref_t17_r; ref_t18_o<=ref_t18_r; ref_t19_o<=ref_t19_r; ref_t20_o<=ref_t20_r; ref_t21_o<=ref_t21_r; ref_t22_o<=ref_t22_r; ref_t23_o<=ref_t23_r;
          ref_t24_o<=ref_t24_r; ref_t25_o<=ref_t25_r; ref_t26_o<=ref_t26_r; ref_t27_o<=ref_t27_r; ref_t28_o<=ref_t28_r; ref_t29_o<=ref_t29_r; ref_t30_o<=ref_t30_r; ref_t31_o<=ref_t31_r;
        end
        else begin
          case(rcnt_r)
            'd2:begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_t00_o<=r_data_frame_i[31:24]; ref_t01_o<=r_data_frame_i[23:16];
                ref_t02_o<=r_data_frame_i[15: 8]; ref_t03_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_t00_o<=r_data_row_i[31:24]; ref_t01_o<=r_data_row_i[23:16];
                ref_t02_o<=r_data_row_i[15: 8]; ref_t03_o<=r_data_row_i[ 7: 0];
              end
            end

            'd3:begin
              if(size_i!=2'b00) begin
                if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                  ref_t04_o<=r_data_frame_i[31:24]; ref_t05_o<=r_data_frame_i[23:16];
                  ref_t06_o<=r_data_frame_i[15: 8]; ref_t07_o<=r_data_frame_i[ 7: 0];
                end
                else begin
                  ref_t04_o<=r_data_row_i[31:24]; ref_t05_o<=r_data_row_i[23:16];
                  ref_t06_o<=r_data_row_i[15: 8]; ref_t07_o<=r_data_row_i[ 7: 0];
                end
              end
            end

            'd4:begin
              if(size_i==2'b10) begin
                if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                  ref_t08_o<=r_data_frame_i[31:24]; ref_t09_o<=r_data_frame_i[23:16];
                  ref_t10_o<=r_data_frame_i[15: 8]; ref_t11_o<=r_data_frame_i[ 7: 0];
                end
                else begin
                  ref_t08_o<=r_data_row_i[31:24]; ref_t09_o<=r_data_row_i[23:16];
                  ref_t10_o<=r_data_row_i[15: 8]; ref_t11_o<=r_data_row_i[ 7: 0];
                end
              end
            end

            'd5:begin
              if(size_i==2'b10) begin
                if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                  ref_t12_o<=r_data_frame_i[31:24]; ref_t13_o<=r_data_frame_i[23:16];
                  ref_t14_o<=r_data_frame_i[15: 8]; ref_t15_o<=r_data_frame_i[ 7: 0];
                end
                else begin
                  ref_t12_o<=r_data_row_i[31:24]; ref_t13_o<=r_data_row_i[23:16];
                  ref_t14_o<=r_data_row_i[15: 8]; ref_t15_o<=r_data_row_i[ 7: 0];
                end
              end
            end
          endcase
        end
      end

      PADING:begin
        ref_t00_o<=pref_t00_w; ref_t01_o<=pref_t01_w; ref_t02_o<=pref_t02_w; ref_t03_o<=pref_t03_w; ref_t04_o<=pref_t04_w; ref_t05_o<=pref_t05_w; ref_t06_o<=pref_t06_w; ref_t07_o<=pref_t07_w;
        ref_t08_o<=pref_t08_w; ref_t09_o<=pref_t09_w; ref_t10_o<=pref_t10_w; ref_t11_o<=pref_t11_w; ref_t12_o<=pref_t12_w; ref_t13_o<=pref_t13_w; ref_t14_o<=pref_t14_w; ref_t15_o<=pref_t15_w;
        ref_t16_o<=pref_t16_w; ref_t17_o<=pref_t17_w; ref_t18_o<=pref_t18_w; ref_t19_o<=pref_t19_w; ref_t20_o<=pref_t20_w; ref_t21_o<=pref_t21_w; ref_t22_o<=pref_t22_w; ref_t23_o<=pref_t23_w;
        ref_t24_o<=pref_t24_w; ref_t25_o<=pref_t25_w; ref_t26_o<=pref_t26_w; ref_t27_o<=pref_t27_w; ref_t28_o<=pref_t28_w; ref_t29_o<=pref_t29_w; ref_t30_o<=pref_t30_w; ref_t31_o<=pref_t31_w;
      end

      FILTER:begin
        ref_t00_o<=fref_t00_w; ref_t01_o<=fref_t01_w; ref_t02_o<=fref_t02_w; ref_t03_o<=fref_t03_w; ref_t04_o<=fref_t04_w; ref_t05_o<=fref_t05_w; ref_t06_o<=fref_t06_w; ref_t07_o<=fref_t07_w;
        ref_t08_o<=fref_t08_w; ref_t09_o<=fref_t09_w; ref_t10_o<=fref_t10_w; ref_t11_o<=fref_t11_w; ref_t12_o<=fref_t12_w; ref_t13_o<=fref_t13_w; ref_t14_o<=fref_t14_w; ref_t15_o<=fref_t15_w;
        ref_t16_o<=fref_t16_w; ref_t17_o<=fref_t17_w; ref_t18_o<=fref_t18_w; ref_t19_o<=fref_t19_w; ref_t20_o<=fref_t20_w; ref_t21_o<=fref_t21_w; ref_t22_o<=fref_t22_w; ref_t23_o<=fref_t23_w;
        ref_t24_o<=fref_t24_w; ref_t25_o<=fref_t25_w; ref_t26_o<=fref_t26_w; ref_t27_o<=fref_t27_w; ref_t28_o<=fref_t28_w; ref_t29_o<=fref_t29_w; ref_t30_o<=fref_t30_w; ref_t31_o<=fref_t31_w;
      end
    endcase
  end
end

//r
always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_r00_o<='d0; ref_r01_o<='d0; ref_r02_o<='d0; ref_r03_o<='d0; ref_r04_o<='d0; ref_r05_o<='d0; ref_r06_o<='d0; ref_r07_o<='d0;
    ref_r08_o<='d0; ref_r09_o<='d0; ref_r10_o<='d0; ref_r11_o<='d0; ref_r12_o<='d0; ref_r13_o<='d0; ref_r14_o<='d0; ref_r15_o<='d0;
    ref_r16_o<='d0; ref_r17_o<='d0; ref_r18_o<='d0; ref_r19_o<='d0; ref_r20_o<='d0; ref_r21_o<='d0; ref_r22_o<='d0; ref_r23_o<='d0;
    ref_r24_o<='d0; ref_r25_o<='d0; ref_r26_o<='d0; ref_r27_o<='d0; ref_r28_o<='d0; ref_r29_o<='d0; ref_r30_o<='d0; ref_r31_o<='d0;
  end
  else begin
    case(state)
      WRITE:begin
        if(rec_val_i) begin
          case(size_i)
            2'b00:begin
              ref_r00_o<=rec_data_i[20*`PIXEL_WIDTH-1:19*`PIXEL_WIDTH]; ref_r01_o<=rec_data_i[19*`PIXEL_WIDTH-1:18*`PIXEL_WIDTH];
              ref_r02_o<=rec_data_i[18*`PIXEL_WIDTH-1:17*`PIXEL_WIDTH]; ref_r03_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH];
            end
            2'b01:begin
              if(rec_idx_i)begin
                ref_r00_o<=rec_data_i[8*`PIXEL_WIDTH-1:7*`PIXEL_WIDTH]; ref_r01_o<=rec_data_i[7*`PIXEL_WIDTH-1:6*`PIXEL_WIDTH];
                ref_r02_o<=rec_data_i[6*`PIXEL_WIDTH-1:5*`PIXEL_WIDTH]; ref_r03_o<=rec_data_i[5*`PIXEL_WIDTH-1:4*`PIXEL_WIDTH];
                ref_r04_o<=rec_data_i[4*`PIXEL_WIDTH-1:3*`PIXEL_WIDTH]; ref_r05_o<=rec_data_i[3*`PIXEL_WIDTH-1:2*`PIXEL_WIDTH];
                ref_r06_o<=rec_data_i[2*`PIXEL_WIDTH-1:  `PIXEL_WIDTH]; ref_r07_o<=rec_data_i[  `PIXEL_WIDTH-1:0];
              end
            end
            2'b10:begin
              if(rec_idx_i=='d14) begin
                ref_r00_o<=rec_data_i[16*`PIXEL_WIDTH-1:15*`PIXEL_WIDTH]; ref_r01_o<=rec_data_i[15*`PIXEL_WIDTH-1:14*`PIXEL_WIDTH];
                ref_r02_o<=rec_data_i[14*`PIXEL_WIDTH-1:13*`PIXEL_WIDTH]; ref_r03_o<=rec_data_i[13*`PIXEL_WIDTH-1:12*`PIXEL_WIDTH];
                ref_r04_o<=rec_data_i[12*`PIXEL_WIDTH-1:11*`PIXEL_WIDTH]; ref_r05_o<=rec_data_i[11*`PIXEL_WIDTH-1:10*`PIXEL_WIDTH];
                ref_r06_o<=rec_data_i[10*`PIXEL_WIDTH-1: 9*`PIXEL_WIDTH]; ref_r07_o<=rec_data_i[ 9*`PIXEL_WIDTH-1: 8*`PIXEL_WIDTH];

                ref_r08_o<=rec_data_i[8*`PIXEL_WIDTH-1:7*`PIXEL_WIDTH]; ref_r09_o<=rec_data_i[7*`PIXEL_WIDTH-1:6*`PIXEL_WIDTH];
                ref_r10_o<=rec_data_i[6*`PIXEL_WIDTH-1:5*`PIXEL_WIDTH]; ref_r11_o<=rec_data_i[5*`PIXEL_WIDTH-1:4*`PIXEL_WIDTH];
                ref_r12_o<=rec_data_i[4*`PIXEL_WIDTH-1:3*`PIXEL_WIDTH]; ref_r13_o<=rec_data_i[3*`PIXEL_WIDTH-1:2*`PIXEL_WIDTH];
                ref_r14_o<=rec_data_i[2*`PIXEL_WIDTH-1:  `PIXEL_WIDTH]; ref_r15_o<=rec_data_i[  `PIXEL_WIDTH-1:0];
              end
            end
            2'b11:begin
              if(rec_idx_i=='d31) begin
                ref_r00_o<=rec_data_i[32*`PIXEL_WIDTH-1:31*`PIXEL_WIDTH]; ref_r04_o<=rec_data_i[28*`PIXEL_WIDTH-1:27*`PIXEL_WIDTH];
                ref_r01_o<=rec_data_i[31*`PIXEL_WIDTH-1:30*`PIXEL_WIDTH]; ref_r05_o<=rec_data_i[27*`PIXEL_WIDTH-1:26*`PIXEL_WIDTH];
                ref_r02_o<=rec_data_i[30*`PIXEL_WIDTH-1:29*`PIXEL_WIDTH]; ref_r06_o<=rec_data_i[26*`PIXEL_WIDTH-1:25*`PIXEL_WIDTH];
                ref_r03_o<=rec_data_i[29*`PIXEL_WIDTH-1:28*`PIXEL_WIDTH]; ref_r07_o<=rec_data_i[25*`PIXEL_WIDTH-1:24*`PIXEL_WIDTH];

                ref_r08_o<=rec_data_i[24*`PIXEL_WIDTH-1:23*`PIXEL_WIDTH]; ref_r12_o<=rec_data_i[20*`PIXEL_WIDTH-1:19*`PIXEL_WIDTH];
                ref_r09_o<=rec_data_i[23*`PIXEL_WIDTH-1:22*`PIXEL_WIDTH]; ref_r13_o<=rec_data_i[19*`PIXEL_WIDTH-1:18*`PIXEL_WIDTH];
                ref_r10_o<=rec_data_i[22*`PIXEL_WIDTH-1:21*`PIXEL_WIDTH]; ref_r14_o<=rec_data_i[18*`PIXEL_WIDTH-1:17*`PIXEL_WIDTH];
                ref_r11_o<=rec_data_i[21*`PIXEL_WIDTH-1:20*`PIXEL_WIDTH]; ref_r15_o<=rec_data_i[17*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH];

                ref_r16_o<=rec_data_i[16*`PIXEL_WIDTH-1:15*`PIXEL_WIDTH]; ref_r20_o<=rec_data_i[12*`PIXEL_WIDTH-1:11*`PIXEL_WIDTH];
                ref_r17_o<=rec_data_i[15*`PIXEL_WIDTH-1:14*`PIXEL_WIDTH]; ref_r21_o<=rec_data_i[11*`PIXEL_WIDTH-1:10*`PIXEL_WIDTH];
                ref_r18_o<=rec_data_i[14*`PIXEL_WIDTH-1:13*`PIXEL_WIDTH]; ref_r22_o<=rec_data_i[10*`PIXEL_WIDTH-1: 9*`PIXEL_WIDTH];
                ref_r19_o<=rec_data_i[13*`PIXEL_WIDTH-1:12*`PIXEL_WIDTH]; ref_r23_o<=rec_data_i[ 9*`PIXEL_WIDTH-1: 8*`PIXEL_WIDTH];

                ref_r24_o<=rec_data_i[ 8*`PIXEL_WIDTH-1: 7*`PIXEL_WIDTH]; ref_r28_o<=rec_data_i[ 4*`PIXEL_WIDTH-1: 3*`PIXEL_WIDTH];
                ref_r25_o<=rec_data_i[ 7*`PIXEL_WIDTH-1: 6*`PIXEL_WIDTH]; ref_r29_o<=rec_data_i[ 3*`PIXEL_WIDTH-1: 2*`PIXEL_WIDTH];
                ref_r26_o<=rec_data_i[ 6*`PIXEL_WIDTH-1: 5*`PIXEL_WIDTH]; ref_r30_o<=rec_data_i[ 2*`PIXEL_WIDTH-1:   `PIXEL_WIDTH];
                ref_r27_o<=rec_data_i[ 5*`PIXEL_WIDTH-1: 4*`PIXEL_WIDTH]; ref_r31_o<=rec_data_i[   `PIXEL_WIDTH-1:    0];
              end
            end
          endcase
        end
      end

      FREAD,LREAD:begin
        case(rcnt_r)
          'd3:begin
            if(size_i==2'b00) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r00_o<=r_data_frame_i[31:24]; ref_r01_o<=r_data_frame_i[23:16];
                ref_r02_o<=r_data_frame_i[15: 8]; ref_r03_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r00_o<=r_data_row_i[31:24]; ref_r01_o<=r_data_row_i[23:16];
                ref_r02_o<=r_data_row_i[15: 8]; ref_r03_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd4:begin
            if(size_i==2'b01) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r00_o<=r_data_frame_i[31:24]; ref_r01_o<=r_data_frame_i[23:16];
                ref_r02_o<=r_data_frame_i[15: 8]; ref_r03_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r00_o<=r_data_row_i[31:24]; ref_r01_o<=r_data_row_i[23:16];
                ref_r02_o<=r_data_row_i[15: 8]; ref_r03_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd5:begin
            if(size_i==2'b01) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r04_o<=r_data_frame_i[31:24]; ref_r05_o<=r_data_frame_i[23:16];
                ref_r06_o<=r_data_frame_i[15: 8]; ref_r07_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r04_o<=r_data_row_i[31:24]; ref_r05_o<=r_data_row_i[23:16];
                ref_r06_o<=r_data_row_i[15: 8]; ref_r07_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd6:begin
            if(size_i==2'b10) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r00_o<=r_data_frame_i[31:24]; ref_r01_o<=r_data_frame_i[23:16];
                ref_r02_o<=r_data_frame_i[15: 8]; ref_r03_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r00_o<=r_data_row_i[31:24]; ref_r01_o<=r_data_row_i[23:16];
                ref_r02_o<=r_data_row_i[15: 8]; ref_r03_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd7:begin
            if(size_i==2'b10) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r04_o<=r_data_frame_i[31:24]; ref_r05_o<=r_data_frame_i[23:16];
                ref_r06_o<=r_data_frame_i[15: 8]; ref_r07_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r04_o<=r_data_row_i[31:24]; ref_r05_o<=r_data_row_i[23:16];
                ref_r06_o<=r_data_row_i[15: 8]; ref_r07_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd8:begin
            if(size_i==2'b10) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r08_o<=r_data_frame_i[31:24]; ref_r09_o<=r_data_frame_i[23:16];
                ref_r10_o<=r_data_frame_i[15: 8]; ref_r11_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r08_o<=r_data_row_i[31:24]; ref_r09_o<=r_data_row_i[23:16];
                ref_r10_o<=r_data_row_i[15: 8]; ref_r11_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd9:begin
            if(size_i==2'b10) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r12_o<=r_data_frame_i[31:24]; ref_r13_o<=r_data_frame_i[23:16];
                ref_r14_o<=r_data_frame_i[15: 8]; ref_r15_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r12_o<=r_data_row_i[31:24]; ref_r13_o<=r_data_row_i[23:16];
                ref_r14_o<=r_data_row_i[15: 8]; ref_r15_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd10:begin
            if(size_i==2'b11) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r00_o<=r_data_frame_i[31:24]; ref_r01_o<=r_data_frame_i[23:16];
                ref_r02_o<=r_data_frame_i[15: 8]; ref_r03_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r00_o<=r_data_row_i[31:24]; ref_r01_o<=r_data_row_i[23:16];
                ref_r02_o<=r_data_row_i[15: 8]; ref_r03_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd11:begin
            if(size_i==2'b11) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r04_o<=r_data_frame_i[31:24]; ref_r05_o<=r_data_frame_i[23:16];
                ref_r06_o<=r_data_frame_i[15: 8]; ref_r07_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r04_o<=r_data_row_i[31:24]; ref_r05_o<=r_data_row_i[23:16];
                ref_r06_o<=r_data_row_i[15: 8]; ref_r07_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd12:begin
            if(size_i==2'b11) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r08_o<=r_data_frame_i[31:24]; ref_r09_o<=r_data_frame_i[23:16];
                ref_r10_o<=r_data_frame_i[15: 8]; ref_r11_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r08_o<=r_data_row_i[31:24]; ref_r09_o<=r_data_row_i[23:16];
                ref_r10_o<=r_data_row_i[15: 8]; ref_r11_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd13:begin
            if(size_i==2'b11) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r12_o<=r_data_frame_i[31:24]; ref_r13_o<=r_data_frame_i[23:16];
                ref_r14_o<=r_data_frame_i[15: 8]; ref_r15_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r12_o<=r_data_row_i[31:24]; ref_r13_o<=r_data_row_i[23:16];
                ref_r14_o<=r_data_row_i[15: 8]; ref_r15_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd14:begin
            if(size_i==2'b11) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r16_o<=r_data_frame_i[31:24]; ref_r17_o<=r_data_frame_i[23:16];
                ref_r18_o<=r_data_frame_i[15: 8]; ref_r19_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r16_o<=r_data_row_i[31:24]; ref_r17_o<=r_data_row_i[23:16];
                ref_r18_o<=r_data_row_i[15: 8]; ref_r19_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd15:begin
            if(size_i==2'b11) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r20_o<=r_data_frame_i[31:24]; ref_r21_o<=r_data_frame_i[23:16];
                ref_r22_o<=r_data_frame_i[15: 8]; ref_r23_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r20_o<=r_data_row_i[31:24]; ref_r21_o<=r_data_row_i[23:16];
                ref_r22_o<=r_data_row_i[15: 8]; ref_r23_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd16:begin
            if(size_i==2'b11) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r24_o<=r_data_frame_i[31:24]; ref_r25_o<=r_data_frame_i[23:16];
                ref_r26_o<=r_data_frame_i[15: 8]; ref_r27_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r24_o<=r_data_row_i[31:24]; ref_r25_o<=r_data_row_i[23:16];
                ref_r26_o<=r_data_row_i[15: 8]; ref_r27_o<=r_data_row_i[ 7: 0];
              end
            end
          end

          'd17:begin
            if(size_i==2'b11) begin
              if(LCU_y_i>0 && i4x4_y_w=='d0) begin
                ref_r28_o<=r_data_frame_i[31:24]; ref_r29_o<=r_data_frame_i[23:16];
                ref_r30_o<=r_data_frame_i[15: 8]; ref_r31_o<=r_data_frame_i[ 7: 0];
              end
              else begin
                ref_r28_o<=r_data_row_i[31:24]; ref_r29_o<=r_data_row_i[23:16];
                ref_r30_o<=r_data_row_i[15: 8]; ref_r31_o<=r_data_row_i[ 7: 0];
              end
            end
          end
        endcase
      end

      PADING:begin
        ref_r00_o<=pref_r00_w; ref_r01_o<=pref_r01_w; ref_r02_o<=pref_r02_w; ref_r03_o<=pref_r03_w; ref_r04_o<=pref_r04_w; ref_r05_o<=pref_r05_w; ref_r06_o<=pref_r06_w; ref_r07_o<=pref_r07_w;
        ref_r08_o<=pref_r08_w; ref_r09_o<=pref_r09_w; ref_r10_o<=pref_r10_w; ref_r11_o<=pref_r11_w; ref_r12_o<=pref_r12_w; ref_r13_o<=pref_r13_w; ref_r14_o<=pref_r14_w; ref_r15_o<=pref_r15_w;
        ref_r16_o<=pref_r16_w; ref_r17_o<=pref_r17_w; ref_r18_o<=pref_r18_w; ref_r19_o<=pref_r19_w; ref_r20_o<=pref_r20_w; ref_r21_o<=pref_r21_w; ref_r22_o<=pref_r22_w; ref_r23_o<=pref_r23_w;
        ref_r24_o<=pref_r24_w; ref_r25_o<=pref_r25_w; ref_r26_o<=pref_r26_w; ref_r27_o<=pref_r27_w; ref_r28_o<=pref_r28_w; ref_r29_o<=pref_r29_w; ref_r30_o<=pref_r30_w; ref_r31_o<=pref_r31_w;
      end

      FILTER:begin
        ref_r00_o<=fref_r00_w; ref_r01_o<=fref_r01_w; ref_r02_o<=fref_r02_w; ref_r03_o<=fref_r03_w; ref_r04_o<=fref_r04_w; ref_r05_o<=fref_r05_w; ref_r06_o<=fref_r06_w; ref_r07_o<=fref_r07_w;
        ref_r08_o<=fref_r08_w; ref_r09_o<=fref_r09_w; ref_r10_o<=fref_r10_w; ref_r11_o<=fref_r11_w; ref_r12_o<=fref_r12_w; ref_r13_o<=fref_r13_w; ref_r14_o<=fref_r14_w; ref_r15_o<=fref_r15_w;
        ref_r16_o<=fref_r16_w; ref_r17_o<=fref_r17_w; ref_r18_o<=fref_r18_w; ref_r19_o<=fref_r19_w; ref_r20_o<=fref_r20_w; ref_r21_o<=fref_r21_w; ref_r22_o<=fref_r22_w; ref_r23_o<=fref_r23_w;
        ref_r24_o<=fref_r24_w; ref_r25_o<=fref_r25_w; ref_r26_o<=fref_r26_w; ref_r27_o<=fref_r27_w; ref_r28_o<=fref_r28_w; ref_r29_o<=fref_r29_w; ref_r30_o<=fref_r30_w; ref_r31_o<=fref_r31_w;
      end
    endcase
  end
end

always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    ref_l00_o<='d0; ref_l01_o<='d0; ref_l02_o<='d0; ref_l03_o<='d0; ref_l04_o<='d0; ref_l05_o<='d0; ref_l06_o<='d0; ref_l07_o<='d0;
    ref_l08_o<='d0; ref_l09_o<='d0; ref_l10_o<='d0; ref_l11_o<='d0; ref_l12_o<='d0; ref_l13_o<='d0; ref_l14_o<='d0; ref_l15_o<='d0;
    ref_l16_o<='d0; ref_l17_o<='d0; ref_l18_o<='d0; ref_l19_o<='d0; ref_l20_o<='d0; ref_l21_o<='d0; ref_l22_o<='d0; ref_l23_o<='d0;
    ref_l24_o<='d0; ref_l25_o<='d0; ref_l26_o<='d0; ref_l27_o<='d0; ref_l28_o<='d0; ref_l29_o<='d0; ref_l30_o<='d0; ref_l31_o<='d0;

    ref_d00_o<='d0; ref_d01_o<='d0; ref_d02_o<='d0; ref_d03_o<='d0; ref_d04_o<='d0; ref_d05_o<='d0; ref_d06_o<='d0; ref_d07_o<='d0;
    ref_d08_o<='d0; ref_d09_o<='d0; ref_d10_o<='d0; ref_d11_o<='d0; ref_d12_o<='d0; ref_d13_o<='d0; ref_d14_o<='d0; ref_d15_o<='d0;
    ref_d16_o<='d0; ref_d17_o<='d0; ref_d18_o<='d0; ref_d19_o<='d0; ref_d20_o<='d0; ref_d21_o<='d0; ref_d22_o<='d0; ref_d23_o<='d0;
    ref_d24_o<='d0; ref_d25_o<='d0; ref_d26_o<='d0; ref_d27_o<='d0; ref_d28_o<='d0; ref_d29_o<='d0; ref_d30_o<='d0; ref_d31_o<='d0;
  end
  else begin
    case(state)
      FREAD,LREAD:begin
        if(size_i==2'b11 && done_r1) begin
          ref_l00_o<=ref_l00_r; ref_l01_o<=ref_l01_r; ref_l02_o<=ref_l02_r; ref_l03_o<=ref_l03_r; ref_l04_o<=ref_l04_r; ref_l05_o<=ref_l05_r; ref_l06_o<=ref_l06_r; ref_l07_o<=ref_l07_r;
          ref_l08_o<=ref_l08_r; ref_l09_o<=ref_l09_r; ref_l10_o<=ref_l10_r; ref_l11_o<=ref_l11_r; ref_l12_o<=ref_l12_r; ref_l13_o<=ref_l13_r; ref_l14_o<=ref_l14_r; ref_l15_o<=ref_l15_r;
          ref_l16_o<=ref_l16_r; ref_l17_o<=ref_l17_r; ref_l18_o<=ref_l18_r; ref_l19_o<=ref_l19_r; ref_l20_o<=ref_l20_r; ref_l21_o<=ref_l21_r; ref_l22_o<=ref_l22_r; ref_l23_o<=ref_l23_r;
          ref_l24_o<=ref_l24_r; ref_l25_o<=ref_l25_r; ref_l26_o<=ref_l26_r; ref_l27_o<=ref_l27_r; ref_l28_o<=ref_l28_r; ref_l29_o<=ref_l29_r; ref_l30_o<=ref_l30_r; ref_l31_o<=ref_l31_r;

          ref_d28_o<=r_data_col_2_i[31:24]; ref_d29_o<=r_data_col_2_i[23:16];
          ref_d30_o<=r_data_col_2_i[15: 8]; ref_d31_o<=r_data_col_2_i[ 7: 0];

        end
        else begin
          case(rcnt_r)
            'd2:begin
              ref_l00_o<=r_data_col_i[31:24]; ref_l01_o<=r_data_col_i[23:16];
              ref_l02_o<=r_data_col_i[15: 8]; ref_l03_o<=r_data_col_i[ 7: 0];
            end

            'd3:begin
              if(size_i!=2'b00) begin
                ref_l04_o<=r_data_col_i[31:24]; ref_l05_o<=r_data_col_i[23:16];
                ref_l06_o<=r_data_col_i[15: 8]; ref_l07_o<=r_data_col_i[ 7: 0];
              end
              else if( (size_i==2'b00) && ((ref_sel_i==2'b00)?(position_i=='d42):(position_i=='d40)) ) begin
                ref_d00_o<=r_data_col_2_i[31:24]; ref_d01_o<=r_data_col_2_i[23:16];
                ref_d02_o<=r_data_col_2_i[15: 8]; ref_d03_o<=r_data_col_2_i[ 7: 0];
              end
              else begin
                ref_d00_o<=r_data_col_i[31:24]; ref_d01_o<=r_data_col_i[23:16];
                ref_d02_o<=r_data_col_i[15: 8]; ref_d03_o<=r_data_col_i[ 7: 0];
              end
            end

            'd4:begin
              if(size_i==2'b10 || size_i==2'b11) begin
                ref_l08_o<=r_data_col_i[31:24]; ref_l09_o<=r_data_col_i[23:16];
                ref_l10_o<=r_data_col_i[15: 8]; ref_l11_o<=r_data_col_i[ 7: 0];
              end
              else if( (size_i==2'b01) && ((ref_sel_i==2'b00)?(position_i=='d40):(position_i=='d32)) ) begin
                ref_d00_o<=r_data_col_2_i[31:24]; ref_d01_o<=r_data_col_2_i[23:16];
                ref_d02_o<=r_data_col_2_i[15: 8]; ref_d03_o<=r_data_col_2_i[ 7: 0];
              end
              else if(size_i == 2'b01) begin
                ref_d00_o<=r_data_col_i[31:24]; ref_d01_o<=r_data_col_i[23:16];
                ref_d02_o<=r_data_col_i[15: 8]; ref_d03_o<=r_data_col_i[ 7: 0];
              end
            end

            'd5:begin
              if(size_i==2'b10 || size_i==2'b11) begin
                ref_l12_o<=r_data_col_i[31:24]; ref_l13_o<=r_data_col_i[23:16];
                ref_l14_o<=r_data_col_i[15: 8]; ref_l15_o<=r_data_col_i[ 7: 0];
              end
              else if( (size_i==2'b01) && ((ref_sel_i==2'b00)?(position_i=='d40):(position_i=='d32)) ) begin
                ref_d04_o<=r_data_col_2_i[31:24]; ref_d05_o<=r_data_col_2_i[23:16];
                ref_d06_o<=r_data_col_2_i[15: 8]; ref_d07_o<=r_data_col_2_i[ 7: 0];
              end
              else if(size_i == 2'b01) begin
                ref_d04_o<=r_data_col_i[31:24]; ref_d05_o<=r_data_col_i[23:16];
                ref_d06_o<=r_data_col_i[15: 8]; ref_d07_o<=r_data_col_i[ 7: 0];
              end
            end

            'd6:begin
              if(size_i==2'b11) begin
                ref_l16_o<=r_data_col_i[31:24]; ref_l17_o<=r_data_col_i[23:16];
                ref_l18_o<=r_data_col_i[15: 8]; ref_l19_o<=r_data_col_i[ 7: 0];
              end
              else if( (size_i==2'b10) && ((ref_sel_i==2'b00)?(position_i=='d32):1) )begin
                ref_d00_o<=r_data_col_2_i[31:24]; ref_d01_o<=r_data_col_2_i[23:16];
                ref_d02_o<=r_data_col_2_i[15: 8]; ref_d03_o<=r_data_col_2_i[ 7: 0];
              end
              else if(size_i==2'b10)begin
                ref_d00_o<=r_data_col_i[31:24]; ref_d01_o<=r_data_col_i[23:16];
                ref_d02_o<=r_data_col_i[15: 8]; ref_d03_o<=r_data_col_i[ 7: 0];
              end
            end

            'd7:begin
              if(size_i==2'b11) begin
                ref_l20_o<=r_data_col_i[31:24]; ref_l21_o<=r_data_col_i[23:16];
                ref_l22_o<=r_data_col_i[15: 8]; ref_l23_o<=r_data_col_i[ 7: 0];
              end
              else if( (size_i==2'b10) && ((ref_sel_i==2'b00)?(position_i=='d32):1) )begin
                ref_d04_o<=r_data_col_2_i[31:24]; ref_d05_o<=r_data_col_2_i[23:16];
                ref_d06_o<=r_data_col_2_i[15: 8]; ref_d07_o<=r_data_col_2_i[ 7: 0];
              end
              else if(size_i==2'b10)begin
                ref_d04_o<=r_data_col_i[31:24]; ref_d05_o<=r_data_col_i[23:16];
                ref_d06_o<=r_data_col_i[15: 8]; ref_d07_o<=r_data_col_i[ 7: 0];
              end
            end

            'd8:begin
              if(size_i==2'b11) begin
                ref_l24_o<=r_data_col_i[31:24]; ref_l25_o<=r_data_col_i[23:16];
                ref_l26_o<=r_data_col_i[15: 8]; ref_l27_o<=r_data_col_i[ 7: 0];
              end
              else if( (size_i==2'b10) && ((ref_sel_i==2'b00)?(position_i=='d32):1) )begin
                ref_d08_o<=r_data_col_2_i[31:24]; ref_d09_o<=r_data_col_2_i[23:16];
                ref_d10_o<=r_data_col_2_i[15: 8]; ref_d11_o<=r_data_col_2_i[ 7: 0];
              end
              else if(size_i==2'b10)begin
                ref_d08_o<=r_data_col_i[31:24]; ref_d09_o<=r_data_col_i[23:16];
                ref_d10_o<=r_data_col_i[15: 8]; ref_d11_o<=r_data_col_i[ 7: 0];
              end
            end

            'd9:begin
              if(size_i==2'b11) begin
                ref_l28_o<=r_data_col_i[31:24]; ref_l29_o<=r_data_col_i[23:16];
                ref_l30_o<=r_data_col_i[15: 8]; ref_l31_o<=r_data_col_i[ 7: 0];
              end
              else if( (size_i==2'b10) && ((ref_sel_i==2'b00)?(position_i=='d32):1) )begin
                ref_d12_o<=r_data_col_2_i[31:24]; ref_d13_o<=r_data_col_2_i[23:16];
                ref_d14_o<=r_data_col_2_i[15: 8]; ref_d15_o<=r_data_col_2_i[ 7: 0];
              end
              else if(size_i==2'b10)begin
                ref_d12_o<=r_data_col_i[31:24]; ref_d13_o<=r_data_col_i[23:16];
                ref_d14_o<=r_data_col_i[15: 8]; ref_d15_o<=r_data_col_i[ 7: 0];
              end
            end

            'd10:begin
              if(size_i==2'b11) begin
                ref_d00_o<=r_data_col_2_i[31:24]; ref_d01_o<=r_data_col_2_i[23:16];
                ref_d02_o<=r_data_col_2_i[15: 8]; ref_d03_o<=r_data_col_2_i[ 7: 0];
              end
            end

            'd11:begin
              if(size_i==2'b11) begin
                ref_d04_o<=r_data_col_2_i[31:24]; ref_d05_o<=r_data_col_2_i[23:16];
                ref_d06_o<=r_data_col_2_i[15: 8]; ref_d07_o<=r_data_col_2_i[ 7: 0];
              end
            end

            'd12:begin
              if(size_i==2'b11) begin
                ref_d08_o<=r_data_col_2_i[31:24]; ref_d09_o<=r_data_col_2_i[23:16];
                ref_d10_o<=r_data_col_2_i[15: 8]; ref_d11_o<=r_data_col_2_i[ 7: 0];
              end
            end

            'd13:begin
              if(size_i==2'b11) begin
                ref_d12_o<=r_data_col_2_i[31:24]; ref_d13_o<=r_data_col_2_i[23:16];
                ref_d14_o<=r_data_col_2_i[15: 8]; ref_d15_o<=r_data_col_2_i[ 7: 0];
              end
            end

            'd14:begin
              if(size_i==2'b11) begin
                ref_d16_o<=r_data_col_2_i[31:24]; ref_d17_o<=r_data_col_2_i[23:16];
                ref_d18_o<=r_data_col_2_i[15: 8]; ref_d19_o<=r_data_col_2_i[ 7: 0];
              end
            end

            'd15:begin
              if(size_i==2'b11) begin
                ref_d20_o<=r_data_col_2_i[31:24]; ref_d21_o<=r_data_col_2_i[23:16];
                ref_d22_o<=r_data_col_2_i[15: 8]; ref_d23_o<=r_data_col_2_i[ 7: 0];
              end
            end

            'd16:begin
              if(size_i==2'b11) begin
                ref_d24_o<=r_data_col_2_i[31:24]; ref_d25_o<=r_data_col_2_i[23:16];
                ref_d26_o<=r_data_col_2_i[15: 8]; ref_d27_o<=r_data_col_2_i[ 7: 0];
              end
            end

            'd17:begin    // coverd by (size_i==2'b11 && done_r1)
              if(size_i==2'b11) begin
                ref_d28_o<=r_data_col_2_i[31:24]; ref_d29_o<=r_data_col_2_i[23:16];
                ref_d30_o<=r_data_col_2_i[15: 8]; ref_d31_o<=r_data_col_2_i[ 7: 0];
              end
            end
          endcase
        end
      end

      PADING:begin
        ref_l00_o<=pref_l00_w; ref_l01_o<=pref_l01_w; ref_l02_o<=pref_l02_w; ref_l03_o<=pref_l03_w; ref_l04_o<=pref_l04_w; ref_l05_o<=pref_l05_w; ref_l06_o<=pref_l06_w; ref_l07_o<=pref_l07_w;
        ref_l08_o<=pref_l08_w; ref_l09_o<=pref_l09_w; ref_l10_o<=pref_l10_w; ref_l11_o<=pref_l11_w; ref_l12_o<=pref_l12_w; ref_l13_o<=pref_l13_w; ref_l14_o<=pref_l14_w; ref_l15_o<=pref_l15_w;
        ref_l16_o<=pref_l16_w; ref_l17_o<=pref_l17_w; ref_l18_o<=pref_l18_w; ref_l19_o<=pref_l19_w; ref_l20_o<=pref_l20_w; ref_l21_o<=pref_l21_w; ref_l22_o<=pref_l22_w; ref_l23_o<=pref_l23_w;
        ref_l24_o<=pref_l24_w; ref_l25_o<=pref_l25_w; ref_l26_o<=pref_l26_w; ref_l27_o<=pref_l27_w; ref_l28_o<=pref_l28_w; ref_l29_o<=pref_l29_w; ref_l30_o<=pref_l30_w; ref_l31_o<=pref_l31_w;

        ref_d00_o<=pref_d00_w; ref_d01_o<=pref_d01_w; ref_d02_o<=pref_d02_w; ref_d03_o<=pref_d03_w; ref_d04_o<=pref_d04_w; ref_d05_o<=pref_d05_w; ref_d06_o<=pref_d06_w; ref_d07_o<=pref_d07_w;
        ref_d08_o<=pref_d08_w; ref_d09_o<=pref_d09_w; ref_d10_o<=pref_d10_w; ref_d11_o<=pref_d11_w; ref_d12_o<=pref_d12_w; ref_d13_o<=pref_d13_w; ref_d14_o<=pref_d14_w; ref_d15_o<=pref_d15_w;
        ref_d16_o<=pref_d16_w; ref_d17_o<=pref_d17_w; ref_d18_o<=pref_d18_w; ref_d19_o<=pref_d19_w; ref_d20_o<=pref_d20_w; ref_d21_o<=pref_d21_w; ref_d22_o<=pref_d22_w; ref_d23_o<=pref_d23_w;
        ref_d24_o<=pref_d24_w; ref_d25_o<=pref_d25_w; ref_d26_o<=pref_d26_w; ref_d27_o<=pref_d27_w; ref_d28_o<=pref_d28_w; ref_d29_o<=pref_d29_w; ref_d30_o<=pref_d30_w; ref_d31_o<=pref_d31_w;
      end

      FILTER:begin
        ref_l00_o<=fref_l00_w; ref_l01_o<=fref_l01_w; ref_l02_o<=fref_l02_w; ref_l03_o<=fref_l03_w; ref_l04_o<=fref_l04_w; ref_l05_o<=fref_l05_w; ref_l06_o<=fref_l06_w; ref_l07_o<=fref_l07_w;
        ref_l08_o<=fref_l08_w; ref_l09_o<=fref_l09_w; ref_l10_o<=fref_l10_w; ref_l11_o<=fref_l11_w; ref_l12_o<=fref_l12_w; ref_l13_o<=fref_l13_w; ref_l14_o<=fref_l14_w; ref_l15_o<=fref_l15_w;
        ref_l16_o<=fref_l16_w; ref_l17_o<=fref_l17_w; ref_l18_o<=fref_l18_w; ref_l19_o<=fref_l19_w; ref_l20_o<=fref_l20_w; ref_l21_o<=fref_l21_w; ref_l22_o<=fref_l22_w; ref_l23_o<=fref_l23_w;
        ref_l24_o<=fref_l24_w; ref_l25_o<=fref_l25_w; ref_l26_o<=fref_l26_w; ref_l27_o<=fref_l27_w; ref_l28_o<=fref_l28_w; ref_l29_o<=fref_l29_w; ref_l30_o<=fref_l30_w; ref_l31_o<=fref_l31_w;

        ref_d00_o<=fref_d00_w; ref_d01_o<=fref_d01_w; ref_d02_o<=fref_d02_w; ref_d03_o<=fref_d03_w; ref_d04_o<=fref_d04_w; ref_d05_o<=fref_d05_w; ref_d06_o<=fref_d06_w; ref_d07_o<=fref_d07_w;
        ref_d08_o<=fref_d08_w; ref_d09_o<=fref_d09_w; ref_d10_o<=fref_d10_w; ref_d11_o<=fref_d11_w; ref_d12_o<=fref_d12_w; ref_d13_o<=fref_d13_w; ref_d14_o<=fref_d14_w; ref_d15_o<=fref_d15_w;
        ref_d16_o<=fref_d16_w; ref_d17_o<=fref_d17_w; ref_d18_o<=fref_d18_w; ref_d19_o<=fref_d19_w; ref_d20_o<=fref_d20_w; ref_d21_o<=fref_d21_w; ref_d22_o<=fref_d22_w; ref_d23_o<=fref_d23_w;
        ref_d24_o<=fref_d24_w; ref_d25_o<=fref_d25_w; ref_d26_o<=fref_d26_w; ref_d27_o<=fref_d27_w; ref_d28_o<=fref_d28_w; ref_d29_o<=fref_d29_w; ref_d30_o<=fref_d30_w; ref_d31_o<=fref_d31_w;
      end
    endcase
  end
end


endmodule