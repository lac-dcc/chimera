//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2014, VIPcore Group, Fudan University
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
//  Filename      : ime_best_mv_above_16.v
//  Author        : Huang Lei Lei
//  Created       : 2014-12-08
//  Description   : best motion vector and corressponding cost for blocks above 16 (not including 16x16)
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-12-21
//  Description   : mv_cost added
//  Modified      : 2014-12-21
//  Description   : update added (to generate partition and mode)
//  Modified      : 2015-03-20
//  Description   : bugs removed (init problems)
//  Modified      : 2015-08-18
//  Description   : datawidth of mv_x_16x16_c_w and mv_y_16x16_c_w corrected
//
//-------------------------------------------------------------------

`include "enc_defines.v"

`define COST_WIDTH (`PIXEL_WIDTH+12)

module ime_best_mv_above_16 (
  // global
  clk                ,
  rstn               ,

  // ctrl_i
  start_i            ,
  val_i              ,
  qp_i               ,

  // update_i
  update_wrk_i       ,
  update_cnt_i       ,
  update_cst_i       ,

  // sad_i
  sad_16x16_00_i     , sad_16x16_10_i     , sad_16x16_20_i     , sad_16x16_30_i     ,
  sad_16x16_01_i     , sad_16x16_11_i     , sad_16x16_21_i     , sad_16x16_31_i     ,
  sad_16x16_02_i     , sad_16x16_12_i     , sad_16x16_22_i     , sad_16x16_32_i     ,
  sad_16x16_03_i     , sad_16x16_13_i     , sad_16x16_23_i     , sad_16x16_33_i     ,

  // mv_i
  mv_x_16x16_i       ,
  mv_y_16x16_i       ,

  // cost_o
  // cost_16x32
  cost_16x32_00_o    , cost_16x32_20_o    ,
  cost_16x32_01_o    , cost_16x32_21_o    ,
  cost_16x32_02_o    , cost_16x32_22_o    ,
  cost_16x32_03_o    , cost_16x32_23_o    ,
  // cost_32x16
  cost_32x16_00_o    , cost_32x16_20_o    ,
  cost_32x16_10_o    , cost_32x16_30_o    ,
  cost_32x16_02_o    , cost_32x16_22_o    ,
  cost_32x16_12_o    , cost_32x16_32_o    ,
  // cost_32x32
  cost_32x32_00_o    , cost_32x32_20_o    ,
  cost_32x32_02_o    , cost_32x32_22_o    ,
  // cost_32x64
  cost_32x64_00_o    ,
  cost_32x64_02_o    ,
  // cost_64x32
  cost_64x32_00_o    , cost_64x32_20_o    ,
  // cost_64x64
  cost_64x64_00_o    ,

  // mv_x_o
  // mv_x_16x32
  mv_x_16x32_00_o    , mv_x_16x32_20_o    ,
  mv_x_16x32_01_o    , mv_x_16x32_21_o    ,
  mv_x_16x32_02_o    , mv_x_16x32_22_o    ,
  mv_x_16x32_03_o    , mv_x_16x32_23_o    ,
  // mv_x_32x16
  mv_x_32x16_00_o    , mv_x_32x16_20_o    ,
  mv_x_32x16_10_o    , mv_x_32x16_30_o    ,
  mv_x_32x16_02_o    , mv_x_32x16_22_o    ,
  mv_x_32x16_12_o    , mv_x_32x16_32_o    ,
  // mv_x_32x32
  mv_x_32x32_00_o    , mv_x_32x32_20_o    ,
  mv_x_32x32_02_o    , mv_x_32x32_22_o    ,
  // mv_x_32x64
  mv_x_32x64_00_o    ,
  mv_x_32x64_02_o    ,
  // mv_x_64x32
  mv_x_64x32_00_o    , mv_x_64x32_20_o    ,
  // mv_x_64x64
  mv_x_64x64_00_o    ,

  // mv_y_o
  // mv_y_16x32
  mv_y_16x32_00_o    , mv_y_16x32_20_o    ,
  mv_y_16x32_01_o    , mv_y_16x32_21_o    ,
  mv_y_16x32_02_o    , mv_y_16x32_22_o    ,
  mv_y_16x32_03_o    , mv_y_16x32_23_o    ,
  // mv_y_32x16
  mv_y_32x16_00_o    , mv_y_32x16_20_o    ,
  mv_y_32x16_10_o    , mv_y_32x16_30_o    ,
  mv_y_32x16_02_o    , mv_y_32x16_22_o    ,
  mv_y_32x16_12_o    , mv_y_32x16_32_o    ,
  // mv_y_32x32
  mv_y_32x32_00_o    , mv_y_32x32_20_o    ,
  mv_y_32x32_02_o    , mv_y_32x32_22_o    ,
  // mv_y_32x64
  mv_y_32x64_00_o    ,
  mv_y_32x64_02_o    ,
  // mv_y_64x32
  mv_y_64x32_00_o    , mv_y_64x32_20_o    ,
  // mv_y_64x64
  mv_y_64x64_00_o
  );


//*** PARAMETER DECLARATION ****************************************************


//*** INPUT/OUTPUT DECLARATION *************************************************

  // global
  input                              clk                ;
  input                              rstn               ;

  // ctrl_i
  input                              start_i            ;
  input                              val_i              ;
  input      [5              : 0]    qp_i               ;

  // update_i
  input                              update_wrk_i       ;
  input      [6              : 0]    update_cnt_i       ;
  input      [`COST_WIDTH-1  : 0]    update_cst_i       ;

  // sad_i
  input      [`PIXEL_WIDTH+7 : 0]    sad_16x16_00_i     , sad_16x16_10_i     , sad_16x16_20_i     , sad_16x16_30_i     ;
  input      [`PIXEL_WIDTH+7 : 0]    sad_16x16_01_i     , sad_16x16_11_i     , sad_16x16_21_i     , sad_16x16_31_i     ;
  input      [`PIXEL_WIDTH+7 : 0]    sad_16x16_02_i     , sad_16x16_12_i     , sad_16x16_22_i     , sad_16x16_32_i     ;
  input      [`PIXEL_WIDTH+7 : 0]    sad_16x16_03_i     , sad_16x16_13_i     , sad_16x16_23_i     , sad_16x16_33_i     ;

  // mv_i
  input      [`IMV_WIDTH-1   : 0]    mv_x_16x16_i       ;
  input      [`IMV_WIDTH-1   : 0]    mv_y_16x16_i       ;

  // cost_o
  // cost_16x32
  output reg [`COST_WIDTH-1  : 0]    cost_16x32_00_o    , cost_16x32_20_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x32_01_o    , cost_16x32_21_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x32_02_o    , cost_16x32_22_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x32_03_o    , cost_16x32_23_o    ;
  // cost_32x16
  output reg [`COST_WIDTH-1  : 0]    cost_32x16_00_o    , cost_32x16_20_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_32x16_10_o    , cost_32x16_30_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_32x16_02_o    , cost_32x16_22_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_32x16_12_o    , cost_32x16_32_o    ;
  // cost_32x32
  output reg [`COST_WIDTH-1  : 0]    cost_32x32_00_o    , cost_32x32_20_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_32x32_02_o    , cost_32x32_22_o    ;
  // cost_32x64
  output reg [`COST_WIDTH-1  : 0]    cost_32x64_00_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_32x64_02_o    ;
  // cost_64x32
  output reg [`COST_WIDTH-1  : 0]    cost_64x32_00_o    , cost_64x32_20_o    ;
  // cost_64x64
  output reg [`COST_WIDTH-1  : 0]    cost_64x64_00_o    ;

  // mv_x_o
  // mv_x_16x32
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x32_00_o    , mv_x_16x32_20_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x32_01_o    , mv_x_16x32_21_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x32_02_o    , mv_x_16x32_22_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x32_03_o    , mv_x_16x32_23_o    ;
  // mv_x_32x16
  output reg [`IMV_WIDTH-1   : 0]    mv_x_32x16_00_o    , mv_x_32x16_20_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_32x16_10_o    , mv_x_32x16_30_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_32x16_02_o    , mv_x_32x16_22_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_32x16_12_o    , mv_x_32x16_32_o    ;
  // mv_x_32x32
  output reg [`IMV_WIDTH-1   : 0]    mv_x_32x32_00_o    , mv_x_32x32_20_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_32x32_02_o    , mv_x_32x32_22_o    ;
  // mv_x_32x64
  output reg [`IMV_WIDTH-1   : 0]    mv_x_32x64_00_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_32x64_02_o    ;
  // mv_x_64x32
  output reg [`IMV_WIDTH-1   : 0]    mv_x_64x32_00_o    , mv_x_64x32_20_o    ;
  // mv_x_64x64
  output reg [`IMV_WIDTH-1   : 0]    mv_x_64x64_00_o    ;

  // mv_y_o
  // mv_y_16x32
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x32_00_o    , mv_y_16x32_20_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x32_01_o    , mv_y_16x32_21_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x32_02_o    , mv_y_16x32_22_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x32_03_o    , mv_y_16x32_23_o    ;
  // mv_y_32x16
  output reg [`IMV_WIDTH-1   : 0]    mv_y_32x16_00_o    , mv_y_32x16_20_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_32x16_10_o    , mv_y_32x16_30_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_32x16_02_o    , mv_y_32x16_22_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_32x16_12_o    , mv_y_32x16_32_o    ;
  // mv_y_32x32
  output reg [`IMV_WIDTH-1   : 0]    mv_y_32x32_00_o    , mv_y_32x32_20_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_32x32_02_o    , mv_y_32x32_22_o    ;
  // mv_y_32x64
  output reg [`IMV_WIDTH-1   : 0]    mv_y_32x64_00_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_32x64_02_o    ;
  // mv_y_64x32
  output reg [`IMV_WIDTH-1   : 0]    mv_y_64x32_00_o    , mv_y_64x32_20_o    ;
  // mv_y_64x64
  output reg [`IMV_WIDTH-1   : 0]    mv_y_64x64_00_o    ;


//*** WIRE & REG DECLARATION ***************************************************

  // sad_w
  // sad_16x32
  wire [`PIXEL_WIDTH+8  : 0]    sad_16x32_00_w     , sad_16x32_20_w     ;
  wire [`PIXEL_WIDTH+8  : 0]    sad_16x32_01_w     , sad_16x32_21_w     ;
  wire [`PIXEL_WIDTH+8  : 0]    sad_16x32_02_w     , sad_16x32_22_w     ;
  wire [`PIXEL_WIDTH+8  : 0]    sad_16x32_03_w     , sad_16x32_23_w     ;
  // sad_32x16
  wire [`PIXEL_WIDTH+8  : 0]    sad_32x16_00_w     , sad_32x16_20_w     ;
  wire [`PIXEL_WIDTH+8  : 0]    sad_32x16_10_w     , sad_32x16_30_w     ;
  wire [`PIXEL_WIDTH+8  : 0]    sad_32x16_02_w     , sad_32x16_22_w     ;
  wire [`PIXEL_WIDTH+8  : 0]    sad_32x16_12_w     , sad_32x16_32_w     ;
  // sad_32x32
  wire [`PIXEL_WIDTH+9  : 0]    sad_32x32_00_w     , sad_32x32_20_w     ;
  wire [`PIXEL_WIDTH+9  : 0]    sad_32x32_02_w     , sad_32x32_22_w     ;
  // sad_32x64
  wire [`PIXEL_WIDTH+10 : 0]    sad_32x64_00_w     ;
  wire [`PIXEL_WIDTH+10 : 0]    sad_32x64_02_w     ;
  // sad_64x32
  wire [`PIXEL_WIDTH+10 : 0]    sad_64x32_00_w     , sad_64x32_20_w     ;
  // sad_64x64
  wire [`PIXEL_WIDTH+11 : 0]    sad_64x64_00_w     ;

  // mv_cost
  wire [`FMV_WIDTH-1   : 0]    mv_x_16x16_s_w    ;
  wire [`FMV_WIDTH-1   : 0]    mv_y_16x16_s_w    ;
  wire [`FMV_WIDTH     : 0]    mv_x_16x16_c_w    ;
  wire [`FMV_WIDTH     : 0]    mv_y_16x16_c_w    ;
  reg  [4              : 0]    bitsnum_x_w       ;
  reg  [4              : 0]    bitsnum_y_w       ;
  reg  [6              : 0]    lambda_w          ;
  wire [12             : 0]    mv_cost_w         ;

  // cost_w
  // cost_16x32
  wire [`COST_WIDTH-1   : 0]    cost_16x32_00_w    , cost_16x32_20_w    ;
  wire [`COST_WIDTH-1   : 0]    cost_16x32_01_w    , cost_16x32_21_w    ;
  wire [`COST_WIDTH-1   : 0]    cost_16x32_02_w    , cost_16x32_22_w    ;
  wire [`COST_WIDTH-1   : 0]    cost_16x32_03_w    , cost_16x32_23_w    ;
  // cost_32x16
  wire [`COST_WIDTH-1   : 0]    cost_32x16_00_w    , cost_32x16_20_w    ;
  wire [`COST_WIDTH-1   : 0]    cost_32x16_10_w    , cost_32x16_30_w    ;
  wire [`COST_WIDTH-1   : 0]    cost_32x16_02_w    , cost_32x16_22_w    ;
  wire [`COST_WIDTH-1   : 0]    cost_32x16_12_w    , cost_32x16_32_w    ;
  // cost_32x32
  wire [`COST_WIDTH-1   : 0]    cost_32x32_00_w    , cost_32x32_20_w    ;
  wire [`COST_WIDTH-1   : 0]    cost_32x32_02_w    , cost_32x32_22_w    ;
  // cost_32x64
  wire [`COST_WIDTH-1   : 0]    cost_32x64_00_w    ;
  wire [`COST_WIDTH-1   : 0]    cost_32x64_02_w    ;
  // cost_64x32
  wire [`COST_WIDTH-1   : 0]    cost_64x32_00_w    , cost_64x32_20_w    ;
  // cost_64x64
  wire [`COST_WIDTH-1   : 0]    cost_64x64_00_w    ;

  // cover_w
  // cover_16x32
  wire    cover_16x32_00_w    , cover_16x32_20_w    ;
  wire    cover_16x32_01_w    , cover_16x32_21_w    ;
  wire    cover_16x32_02_w    , cover_16x32_22_w    ;
  wire    cover_16x32_03_w    , cover_16x32_23_w    ;
  // cover_32x16
  wire    cover_32x16_00_w    , cover_32x16_20_w    ;
  wire    cover_32x16_10_w    , cover_32x16_30_w    ;
  wire    cover_32x16_02_w    , cover_32x16_22_w    ;
  wire    cover_32x16_12_w    , cover_32x16_32_w    ;
  // cover_32x32
  wire    cover_32x32_00_w    , cover_32x32_20_w    ;
  wire    cover_32x32_02_w    , cover_32x32_22_w    ;
  // cover_32x64
  wire    cover_32x64_00_w    ;
  wire    cover_32x64_02_w    ;
  // cover_64x32
  wire    cover_64x32_00_w    , cover_64x32_20_w    ;
  // cover_64x64
  wire    cover_64x64_00_w    ;


//*** MAIN BODY ****************************************************************

  // sad_w
  // sad_16x32
  assign sad_16x32_00_w = sad_16x16_00_i + sad_16x16_10_i ;
  assign sad_16x32_01_w = sad_16x16_01_i + sad_16x16_11_i ;
  assign sad_16x32_02_w = sad_16x16_02_i + sad_16x16_12_i ;
  assign sad_16x32_03_w = sad_16x16_03_i + sad_16x16_13_i ;

  assign sad_16x32_20_w = sad_16x16_20_i + sad_16x16_30_i ;
  assign sad_16x32_21_w = sad_16x16_21_i + sad_16x16_31_i ;
  assign sad_16x32_22_w = sad_16x16_22_i + sad_16x16_32_i ;
  assign sad_16x32_23_w = sad_16x16_23_i + sad_16x16_33_i ;
  // sad_32x16
  assign sad_32x16_00_w = sad_16x16_00_i + sad_16x16_01_i ;
  assign sad_32x16_10_w = sad_16x16_10_i + sad_16x16_11_i ;
  assign sad_32x16_02_w = sad_16x16_02_i + sad_16x16_03_i ;
  assign sad_32x16_12_w = sad_16x16_12_i + sad_16x16_13_i ;

  assign sad_32x16_20_w = sad_16x16_20_i + sad_16x16_21_i ;
  assign sad_32x16_30_w = sad_16x16_30_i + sad_16x16_31_i ;
  assign sad_32x16_22_w = sad_16x16_22_i + sad_16x16_23_i ;
  assign sad_32x16_32_w = sad_16x16_32_i + sad_16x16_33_i ;
  // sad_32x32
  assign sad_32x32_00_w = sad_16x32_00_w + sad_16x32_01_w ;
  assign sad_32x32_02_w = sad_16x32_02_w + sad_16x32_03_w ;

  assign sad_32x32_20_w = sad_16x32_20_w + sad_16x32_21_w ;
  assign sad_32x32_22_w = sad_16x32_22_w + sad_16x32_23_w ;
  // sad 32x64
  assign sad_32x64_00_w = sad_32x32_00_w + sad_32x32_20_w ;
  assign sad_32x64_02_w = sad_32x32_02_w + sad_32x32_22_w ;
  // sad 64x32
  assign sad_64x32_00_w = sad_32x32_00_w + sad_32x32_02_w ;
  assign sad_64x32_20_w = sad_32x32_20_w + sad_32x32_22_w ;
  // sad 64x64
  assign sad_64x64_00_w = sad_32x64_00_w + sad_32x64_02_w ;

  // mv_cost
  assign mv_x_16x16_s_w = ( mv_x_16x16_i-12 ) * 4 ; //+ mv_x_base_i ;
  assign mv_y_16x16_s_w = ( mv_y_16x16_i-12 ) * 4 ; //+ mv_y_base_i ;

  assign mv_x_16x16_c_w = ( mv_x_16x16_s_w[`FMV_WIDTH-1] ) ? ( {1'b0,~mv_x_16x16_s_w[`FMV_WIDTH-2:0],1'b0} + 3 ) :
                                                             ( (|mv_x_16x16_s_w[`FMV_WIDTH-2:0]) ? ( {1'b0, mv_x_16x16_s_w[`FMV_WIDTH-2:0],1'b0} )
                                                                                                 : 1 );

  assign mv_y_16x16_c_w = ( mv_y_16x16_s_w[`FMV_WIDTH-1] ) ? ( {1'b0,~mv_y_16x16_s_w[`FMV_WIDTH-2:0],1'b0} + 3 ) :
                                                             ( (|mv_y_16x16_s_w[`FMV_WIDTH-2:0]) ? ( {1'b0, mv_y_16x16_s_w[`FMV_WIDTH-2:0],1'b0} )
                                                                                                 : 1 );

  always @(*) begin
    casex( mv_x_16x16_c_w )
      'b000_0000_0001 :    bitsnum_x_w = 01 ;
      'b000_0000_001x :    bitsnum_x_w = 03 ;
      'b000_0000_01xx :    bitsnum_x_w = 05 ;
      'b000_0000_1xxx :    bitsnum_x_w = 07 ;
      'b000_0001_xxxx :    bitsnum_x_w = 09 ;
      'b000_001x_xxxx :    bitsnum_x_w = 11 ;
      'b000_01xx_xxxx :    bitsnum_x_w = 13 ;
      'b000_1xxx_xxxx :    bitsnum_x_w = 15 ;
      'b001_xxxx_xxxx :    bitsnum_x_w = 17 ;
      'b01x_xxxx_xxxx :    bitsnum_x_w = 19 ;
      'b1xx_xxxx_xxxx :    bitsnum_x_w = 21 ;
      default         :    bitsnum_x_w = 21 ;
    endcase
  end

  always @(*) begin
    casex( mv_y_16x16_c_w )
      'b000_0000_0001 :    bitsnum_y_w = 01 ;
      'b000_0000_001x :    bitsnum_y_w = 03 ;
      'b000_0000_01xx :    bitsnum_y_w = 05 ;
      'b000_0000_1xxx :    bitsnum_y_w = 07 ;
      'b000_0001_xxxx :    bitsnum_y_w = 09 ;
      'b000_001x_xxxx :    bitsnum_y_w = 11 ;
      'b000_01xx_xxxx :    bitsnum_y_w = 13 ;
      'b000_1xxx_xxxx :    bitsnum_y_w = 15 ;
      'b001_xxxx_xxxx :    bitsnum_y_w = 17 ;
      'b01x_xxxx_xxxx :    bitsnum_y_w = 19 ;
      'b1xx_xxxx_xxxx :    bitsnum_y_w = 21 ;
      default         :    bitsnum_y_w = 21 ;
    endcase
  end

  always @(*) begin
    case( qp_i )
      0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 :    lambda_w = 01 ;
      16,17,18,19                           :    lambda_w = 02 ;
      20,21,22                              :    lambda_w = 03 ;
      23,24,25                              :    lambda_w = 04 ;
      26                                    :    lambda_w = 05 ;
      27,28                                 :    lambda_w = 06 ;
      29                                    :    lambda_w = 07 ;
      30                                    :    lambda_w = 08 ;
      31                                    :    lambda_w = 09 ;
      32                                    :    lambda_w = 10 ;
      33                                    :    lambda_w = 11 ;
      34                                    :    lambda_w = 13 ;
      35                                    :    lambda_w = 14 ;
      36                                    :    lambda_w = 16 ;
      37                                    :    lambda_w = 18 ;
      38                                    :    lambda_w = 20 ;
      39                                    :    lambda_w = 23 ;
      40                                    :    lambda_w = 25 ;
      41                                    :    lambda_w = 29 ;
      42                                    :    lambda_w = 32 ;
      43                                    :    lambda_w = 36 ;
      44                                    :    lambda_w = 40 ;
      45                                    :    lambda_w = 45 ;
      46                                    :    lambda_w = 51 ;
      47                                    :    lambda_w = 57 ;
      48                                    :    lambda_w = 64 ;
      49                                    :    lambda_w = 72 ;
      50                                    :    lambda_w = 81 ;
      51                                    :    lambda_w = 91 ;
      default                               :    lambda_w = 00 ;
    endcase
  end

  assign mv_cost_w = lambda_w * ( bitsnum_x_w + bitsnum_y_w );

  // cost_w
  // cost_16x32
  assign cost_16x32_00_w = sad_16x32_00_w + mv_cost_w ;
  assign cost_16x32_01_w = sad_16x32_01_w + mv_cost_w ;
  assign cost_16x32_02_w = sad_16x32_02_w + mv_cost_w ;
  assign cost_16x32_03_w = sad_16x32_03_w + mv_cost_w ;

  assign cost_16x32_20_w = sad_16x32_20_w + mv_cost_w ;
  assign cost_16x32_21_w = sad_16x32_21_w + mv_cost_w ;
  assign cost_16x32_22_w = sad_16x32_22_w + mv_cost_w ;
  assign cost_16x32_23_w = sad_16x32_23_w + mv_cost_w ;
  // cost_32x16
  assign cost_32x16_00_w = sad_32x16_00_w + mv_cost_w ;
  assign cost_32x16_10_w = sad_32x16_10_w + mv_cost_w ;
  assign cost_32x16_02_w = sad_32x16_02_w + mv_cost_w ;
  assign cost_32x16_12_w = sad_32x16_12_w + mv_cost_w ;

  assign cost_32x16_20_w = sad_32x16_20_w + mv_cost_w ;
  assign cost_32x16_30_w = sad_32x16_30_w + mv_cost_w ;
  assign cost_32x16_22_w = sad_32x16_22_w + mv_cost_w ;
  assign cost_32x16_32_w = sad_32x16_32_w + mv_cost_w ;
  // cost_32x32
  assign cost_32x32_00_w = sad_32x32_00_w + mv_cost_w ;
  assign cost_32x32_02_w = sad_32x32_02_w + mv_cost_w ;

  assign cost_32x32_20_w = sad_32x32_20_w + mv_cost_w ;
  assign cost_32x32_22_w = sad_32x32_22_w + mv_cost_w ;
  // cost 32x64
  assign cost_32x64_00_w = sad_32x64_00_w + mv_cost_w ;
  assign cost_32x64_02_w = sad_32x64_02_w + mv_cost_w ;
  // cost 64x32
  assign cost_64x32_00_w = sad_64x32_00_w + mv_cost_w ;
  assign cost_64x32_20_w = sad_64x32_20_w + mv_cost_w ;
  // cost 64x64
  assign cost_64x64_00_w = sad_64x64_00_w + mv_cost_w ;

  // cover_w
  // cover_16x32
  assign cover_16x32_00_w = cost_16x32_00_w < cost_16x32_00_o ;
  assign cover_16x32_01_w = cost_16x32_01_w < cost_16x32_01_o ;
  assign cover_16x32_02_w = cost_16x32_02_w < cost_16x32_02_o ;
  assign cover_16x32_03_w = cost_16x32_03_w < cost_16x32_03_o ;

  assign cover_16x32_20_w = cost_16x32_20_w < cost_16x32_20_o ;
  assign cover_16x32_21_w = cost_16x32_21_w < cost_16x32_21_o ;
  assign cover_16x32_22_w = cost_16x32_22_w < cost_16x32_22_o ;
  assign cover_16x32_23_w = cost_16x32_23_w < cost_16x32_23_o ;
  // cover_32x16
  assign cover_32x16_00_w = cost_32x16_00_w < cost_32x16_00_o ;
  assign cover_32x16_10_w = cost_32x16_10_w < cost_32x16_10_o ;
  assign cover_32x16_02_w = cost_32x16_02_w < cost_32x16_02_o ;
  assign cover_32x16_12_w = cost_32x16_12_w < cost_32x16_12_o ;

  assign cover_32x16_20_w = cost_32x16_20_w < cost_32x16_20_o ;
  assign cover_32x16_30_w = cost_32x16_30_w < cost_32x16_30_o ;
  assign cover_32x16_22_w = cost_32x16_22_w < cost_32x16_22_o ;
  assign cover_32x16_32_w = cost_32x16_32_w < cost_32x16_32_o ;
  // cover_32x32
  assign cover_32x32_00_w = cost_32x32_00_w < cost_32x32_00_o ;
  assign cover_32x32_02_w = cost_32x32_02_w < cost_32x32_02_o ;

  assign cover_32x32_20_w = cost_32x32_20_w < cost_32x32_20_o ;
  assign cover_32x32_22_w = cost_32x32_22_w < cost_32x32_22_o ;
  // cover 32x64
  assign cover_32x64_00_w = cost_32x64_00_w < cost_32x64_00_o ;
  assign cover_32x64_02_w = cost_32x64_02_w < cost_32x64_02_o ;
  // cover 64x32
  assign cover_64x32_00_w = cost_64x32_00_w < cost_64x32_00_o ;
  assign cover_64x32_20_w = cost_64x32_20_w < cost_64x32_20_o ;
  // cover 64x64
  assign cover_64x64_00_w = cost_64x64_00_w < cost_64x64_00_o ;

  // cost_o
  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      // cost_16x32
      cost_16x32_00_o <= -1 ;
      cost_16x32_01_o <= -1 ;
      cost_16x32_02_o <= -1 ;
      cost_16x32_03_o <= -1 ;

      cost_16x32_20_o <= -1 ;
      cost_16x32_21_o <= -1 ;
      cost_16x32_22_o <= -1 ;
      cost_16x32_23_o <= -1 ;
      // cost_32x16
      cost_32x16_00_o <= -1 ;
      cost_32x16_10_o <= -1 ;
      cost_32x16_02_o <= -1 ;
      cost_32x16_12_o <= -1 ;
      // cost_32x16
      cost_32x16_20_o <= -1 ;
      cost_32x16_30_o <= -1 ;
      cost_32x16_22_o <= -1 ;
      cost_32x16_32_o <= -1 ;
      // cost_32x32
      cost_32x32_00_o <= -1 ;
      cost_32x32_02_o <= -1 ;
      // cost_32x32
      cost_32x32_20_o <= -1 ;
      cost_32x32_22_o <= -1 ;
      // cost_32x64
      cost_32x64_00_o <= -1 ;
      cost_32x64_02_o <= -1 ;
      // cost_64x32
      cost_64x32_00_o <= -1 ;
      cost_64x32_20_o <= -1 ;
      // cost_64x64
      cost_64x64_00_o <= -1 ;
    end
    else if( start_i ) begin
      // cost_16x32
      cost_16x32_00_o <= -1 ;
      cost_16x32_01_o <= -1 ;
      cost_16x32_02_o <= -1 ;
      cost_16x32_03_o <= -1 ;

      cost_16x32_20_o <= -1 ;
      cost_16x32_21_o <= -1 ;
      cost_16x32_22_o <= -1 ;
      cost_16x32_23_o <= -1 ;
      // cost_32x16
      cost_32x16_00_o <= -1 ;
      cost_32x16_10_o <= -1 ;
      cost_32x16_02_o <= -1 ;
      cost_32x16_12_o <= -1 ;
      // cost_32x16
      cost_32x16_20_o <= -1 ;
      cost_32x16_30_o <= -1 ;
      cost_32x16_22_o <= -1 ;
      cost_32x16_32_o <= -1 ;
      // cost_32x32
      cost_32x32_00_o <= -1 ;
      cost_32x32_02_o <= -1 ;
      // cost_32x32
      cost_32x32_20_o <= -1 ;
      cost_32x32_22_o <= -1 ;
      // cost_32x64
      cost_32x64_00_o <= -1 ;
      cost_32x64_02_o <= -1 ;
      // cost_64x32
      cost_64x32_00_o <= -1 ;
      cost_64x32_20_o <= -1 ;
      // cost_64x64
      cost_64x64_00_o <= -1 ;
    end
    else if( val_i ) begin
      // cover_16x32
      if( cover_16x32_00_w )    cost_16x32_00_o <= cost_16x32_00_w ;
      if( cover_16x32_01_w )    cost_16x32_01_o <= cost_16x32_01_w ;
      if( cover_16x32_02_w )    cost_16x32_02_o <= cost_16x32_02_w ;
      if( cover_16x32_03_w )    cost_16x32_03_o <= cost_16x32_03_w ;

      if( cover_16x32_20_w )    cost_16x32_20_o <= cost_16x32_20_w ;
      if( cover_16x32_21_w )    cost_16x32_21_o <= cost_16x32_21_w ;
      if( cover_16x32_22_w )    cost_16x32_22_o <= cost_16x32_22_w ;
      if( cover_16x32_23_w )    cost_16x32_23_o <= cost_16x32_23_w ;
      // cover_32x16
      if( cover_32x16_00_w )    cost_32x16_00_o <= cost_32x16_00_w ;
      if( cover_32x16_10_w )    cost_32x16_10_o <= cost_32x16_10_w ;
      if( cover_32x16_02_w )    cost_32x16_02_o <= cost_32x16_02_w ;
      if( cover_32x16_12_w )    cost_32x16_12_o <= cost_32x16_12_w ;
      // cover_32x16
      if( cover_32x16_20_w )    cost_32x16_20_o <= cost_32x16_20_w ;
      if( cover_32x16_30_w )    cost_32x16_30_o <= cost_32x16_30_w ;
      if( cover_32x16_22_w )    cost_32x16_22_o <= cost_32x16_22_w ;
      if( cover_32x16_32_w )    cost_32x16_32_o <= cost_32x16_32_w ;
      // cover_32x32
      if( cover_32x32_00_w )    cost_32x32_00_o <= cost_32x32_00_w ;
      if( cover_32x32_02_w )    cost_32x32_02_o <= cost_32x32_02_w ;
      // cover_32x32
      if( cover_32x32_20_w )    cost_32x32_20_o <= cost_32x32_20_w ;
      if( cover_32x32_22_w )    cost_32x32_22_o <= cost_32x32_22_w ;
      // cover_32x64
      if( cover_32x64_00_w )    cost_32x64_00_o <= cost_32x64_00_w ;
      if( cover_32x64_02_w )    cost_32x64_02_o <= cost_32x64_02_w ;
      // cover_64x32
      if( cover_64x32_00_w )    cost_64x32_00_o <= cost_64x32_00_w ;
      if( cover_64x32_20_w )    cost_64x32_20_o <= cost_64x32_20_w ;
      // cover_64x64
      if( cover_64x64_00_w )    cost_64x64_00_o <= cost_64x64_00_w ;
    end
    else if( update_wrk_i ) begin
      case( update_cnt_i )
        16 :    cost_32x32_00_o <= update_cst_i ;
        17 :    cost_32x32_02_o <= update_cst_i ;
        18 :    cost_32x32_20_o <= update_cst_i ;
        19 :    cost_32x32_22_o <= update_cst_i ;
        20 :    cost_64x64_00_o <= update_cst_i ;
      endcase
    end
  end

  // mv_x_o
  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      // mv_x_16x32
      mv_x_16x32_00_o <= -1 ;
      mv_x_16x32_01_o <= -1 ;
      mv_x_16x32_02_o <= -1 ;
      mv_x_16x32_03_o <= -1 ;

      mv_x_16x32_20_o <= -1 ;
      mv_x_16x32_21_o <= -1 ;
      mv_x_16x32_22_o <= -1 ;
      mv_x_16x32_23_o <= -1 ;
      // mv_x_32x16
      mv_x_32x16_00_o <= -1 ;
      mv_x_32x16_10_o <= -1 ;
      mv_x_32x16_02_o <= -1 ;
      mv_x_32x16_12_o <= -1 ;
      // mv_x_32x16
      mv_x_32x16_20_o <= -1 ;
      mv_x_32x16_30_o <= -1 ;
      mv_x_32x16_22_o <= -1 ;
      mv_x_32x16_32_o <= -1 ;
      // mv_x_32x32
      mv_x_32x32_00_o <= -1 ;
      mv_x_32x32_02_o <= -1 ;
      // mv_x_32x32
      mv_x_32x32_20_o <= -1 ;
      mv_x_32x32_22_o <= -1 ;
      // mv_x_32x64
      mv_x_32x64_00_o <= -1 ;
      mv_x_32x64_02_o <= -1 ;
      // mv_x_64x32
      mv_x_64x32_00_o <= -1 ;
      mv_x_64x32_20_o <= -1 ;
      // mv_x_64x64
      mv_x_64x64_00_o <= -1 ;
    end
    else if( val_i ) begin
      // cover_16x32
      if( cover_16x32_00_w )    mv_x_16x32_00_o <= mv_x_16x16_i ;
      if( cover_16x32_01_w )    mv_x_16x32_01_o <= mv_x_16x16_i ;
      if( cover_16x32_02_w )    mv_x_16x32_02_o <= mv_x_16x16_i ;
      if( cover_16x32_03_w )    mv_x_16x32_03_o <= mv_x_16x16_i ;

      if( cover_16x32_20_w )    mv_x_16x32_20_o <= mv_x_16x16_i ;
      if( cover_16x32_21_w )    mv_x_16x32_21_o <= mv_x_16x16_i ;
      if( cover_16x32_22_w )    mv_x_16x32_22_o <= mv_x_16x16_i ;
      if( cover_16x32_23_w )    mv_x_16x32_23_o <= mv_x_16x16_i ;
      // cover_32x16
      if( cover_32x16_00_w )    mv_x_32x16_00_o <= mv_x_16x16_i ;
      if( cover_32x16_10_w )    mv_x_32x16_10_o <= mv_x_16x16_i ;
      if( cover_32x16_02_w )    mv_x_32x16_02_o <= mv_x_16x16_i ;
      if( cover_32x16_12_w )    mv_x_32x16_12_o <= mv_x_16x16_i ;
      // cover_32x16
      if( cover_32x16_20_w )    mv_x_32x16_20_o <= mv_x_16x16_i ;
      if( cover_32x16_30_w )    mv_x_32x16_30_o <= mv_x_16x16_i ;
      if( cover_32x16_22_w )    mv_x_32x16_22_o <= mv_x_16x16_i ;
      if( cover_32x16_32_w )    mv_x_32x16_32_o <= mv_x_16x16_i ;
      // cover_32x32
      if( cover_32x32_00_w )    mv_x_32x32_00_o <= mv_x_16x16_i ;
      if( cover_32x32_02_w )    mv_x_32x32_02_o <= mv_x_16x16_i ;
      // cover_32x32
      if( cover_32x32_20_w )    mv_x_32x32_20_o <= mv_x_16x16_i ;
      if( cover_32x32_22_w )    mv_x_32x32_22_o <= mv_x_16x16_i ;
      // cover_32x64
      if( cover_32x64_00_w )    mv_x_32x64_00_o <= mv_x_16x16_i ;
      if( cover_32x64_02_w )    mv_x_32x64_02_o <= mv_x_16x16_i ;
      // cover_64x32
      if( cover_64x32_00_w )    mv_x_64x32_00_o <= mv_x_16x16_i ;
      if( cover_64x32_20_w )    mv_x_64x32_20_o <= mv_x_16x16_i ;
      // cover_64x64
      if( cover_64x64_00_w )    mv_x_64x64_00_o <= mv_x_16x16_i ;
    end
  end

  // mv_y_o
  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      // mv_y_16x32
      mv_y_16x32_00_o <= -1 ;
      mv_y_16x32_01_o <= -1 ;
      mv_y_16x32_02_o <= -1 ;
      mv_y_16x32_03_o <= -1 ;

      mv_y_16x32_20_o <= -1 ;
      mv_y_16x32_21_o <= -1 ;
      mv_y_16x32_22_o <= -1 ;
      mv_y_16x32_23_o <= -1 ;
      // mv_y_32x16
      mv_y_32x16_00_o <= -1 ;
      mv_y_32x16_10_o <= -1 ;
      mv_y_32x16_02_o <= -1 ;
      mv_y_32x16_12_o <= -1 ;
      // mv_y_32x16
      mv_y_32x16_20_o <= -1 ;
      mv_y_32x16_30_o <= -1 ;
      mv_y_32x16_22_o <= -1 ;
      mv_y_32x16_32_o <= -1 ;
      // mv_y_32x32
      mv_y_32x32_00_o <= -1 ;
      mv_y_32x32_02_o <= -1 ;
      // mv_y_32x32
      mv_y_32x32_20_o <= -1 ;
      mv_y_32x32_22_o <= -1 ;
      // mv_y_32x64
      mv_y_32x64_00_o <= -1 ;
      mv_y_32x64_02_o <= -1 ;
      // mv_y_64x32
      mv_y_64x32_00_o <= -1 ;
      mv_y_64x32_20_o <= -1 ;
      // mv_y_64x64
      mv_y_64x64_00_o <= -1 ;
    end
    else if( val_i ) begin
      // cover_16x32
      if( cover_16x32_00_w )    mv_y_16x32_00_o <= mv_y_16x16_i ;
      if( cover_16x32_01_w )    mv_y_16x32_01_o <= mv_y_16x16_i ;
      if( cover_16x32_02_w )    mv_y_16x32_02_o <= mv_y_16x16_i ;
      if( cover_16x32_03_w )    mv_y_16x32_03_o <= mv_y_16x16_i ;

      if( cover_16x32_20_w )    mv_y_16x32_20_o <= mv_y_16x16_i ;
      if( cover_16x32_21_w )    mv_y_16x32_21_o <= mv_y_16x16_i ;
      if( cover_16x32_22_w )    mv_y_16x32_22_o <= mv_y_16x16_i ;
      if( cover_16x32_23_w )    mv_y_16x32_23_o <= mv_y_16x16_i ;
      // cover_32x16
      if( cover_32x16_00_w )    mv_y_32x16_00_o <= mv_y_16x16_i ;
      if( cover_32x16_10_w )    mv_y_32x16_10_o <= mv_y_16x16_i ;
      if( cover_32x16_02_w )    mv_y_32x16_02_o <= mv_y_16x16_i ;
      if( cover_32x16_12_w )    mv_y_32x16_12_o <= mv_y_16x16_i ;
      // cover_32x16
      if( cover_32x16_20_w )    mv_y_32x16_20_o <= mv_y_16x16_i ;
      if( cover_32x16_30_w )    mv_y_32x16_30_o <= mv_y_16x16_i ;
      if( cover_32x16_22_w )    mv_y_32x16_22_o <= mv_y_16x16_i ;
      if( cover_32x16_32_w )    mv_y_32x16_32_o <= mv_y_16x16_i ;
      // cover_32x32
      if( cover_32x32_00_w )    mv_y_32x32_00_o <= mv_y_16x16_i ;
      if( cover_32x32_02_w )    mv_y_32x32_02_o <= mv_y_16x16_i ;
      // cover_32x32
      if( cover_32x32_20_w )    mv_y_32x32_20_o <= mv_y_16x16_i ;
      if( cover_32x32_22_w )    mv_y_32x32_22_o <= mv_y_16x16_i ;
      // cover_32x64
      if( cover_32x64_00_w )    mv_y_32x64_00_o <= mv_y_16x16_i ;
      if( cover_32x64_02_w )    mv_y_32x64_02_o <= mv_y_16x16_i ;
      // cover_64x32
      if( cover_64x32_00_w )    mv_y_64x32_00_o <= mv_y_16x16_i ;
      if( cover_64x32_20_w )    mv_y_64x32_20_o <= mv_y_16x16_i ;
      // cover_64x64
      if( cover_64x64_00_w )    mv_y_64x64_00_o <= mv_y_16x16_i ;
    end
  end

//*** DEBUG ********************************************************************


endmodule
