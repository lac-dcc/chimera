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
//  Filename      : ime_best_mv_below_16.v
//  Author        : Huang Lei Lei
//  Created       : 2014-12-08
//  Description   : best motion vector and corressponding cost for blocks below 16 (including 16x16)
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-12-21
//  Description   : mv_cost added
//  Modified      : 2014-12-21
//  Description   : update added (to generate partition)
//  Modified      : 2015-08-18
//  Description   : datawidth of mv_x_08x08_c_w and mv_y_08x08_c_w corrected
//
//-------------------------------------------------------------------

`include "enc_defines.v"

`define COST_WIDTH (`PIXEL_WIDTH+12)

module ime_best_mv_below_16 (
  // global
  clk                ,
  rstn               ,

  // ctrl_i
  start_i            ,
  val_i              ,
  block_i            ,
  qp_i               ,

  // update_i
  update_wrk_i       ,
  update_cnt_i       ,
  update_cst_i       ,

  // sad_i
  sad_08x08_00_i     ,
  sad_08x08_01_i     ,
  sad_08x08_02_i     ,
  sad_08x08_03_i     ,
  sad_08x08_04_i     ,
  sad_08x08_05_i     ,
  sad_08x08_06_i     ,
  sad_08x08_07_i     ,

  sad_08x08_10_i     ,
  sad_08x08_11_i     ,
  sad_08x08_12_i     ,
  sad_08x08_13_i     ,
  sad_08x08_14_i     ,
  sad_08x08_15_i     ,
  sad_08x08_16_i     ,
  sad_08x08_17_i     ,

  // sad_o
  sad_16x16_00_o     ,
  sad_16x16_02_o     ,
  sad_16x16_04_o     ,
  sad_16x16_06_o     ,

  // mv_i
  mv_x_08x08_i       ,
  mv_y_08x08_i       ,

  // cost_o
  // cost_08x08
  cost_08x08_00_o    , cost_08x08_10_o    , cost_08x08_20_o    , cost_08x08_30_o    ,
  cost_08x08_01_o    , cost_08x08_11_o    , cost_08x08_21_o    , cost_08x08_31_o    ,
  cost_08x08_02_o    , cost_08x08_12_o    , cost_08x08_22_o    , cost_08x08_32_o    ,
  cost_08x08_03_o    , cost_08x08_13_o    , cost_08x08_23_o    , cost_08x08_33_o    ,
  cost_08x08_04_o    , cost_08x08_14_o    , cost_08x08_24_o    , cost_08x08_34_o    ,
  cost_08x08_05_o    , cost_08x08_15_o    , cost_08x08_25_o    , cost_08x08_35_o    ,
  cost_08x08_06_o    , cost_08x08_16_o    , cost_08x08_26_o    , cost_08x08_36_o    ,
  cost_08x08_07_o    , cost_08x08_17_o    , cost_08x08_27_o    , cost_08x08_37_o    ,

  cost_08x08_40_o    , cost_08x08_50_o    , cost_08x08_60_o    , cost_08x08_70_o    ,
  cost_08x08_41_o    , cost_08x08_51_o    , cost_08x08_61_o    , cost_08x08_71_o    ,
  cost_08x08_42_o    , cost_08x08_52_o    , cost_08x08_62_o    , cost_08x08_72_o    ,
  cost_08x08_43_o    , cost_08x08_53_o    , cost_08x08_63_o    , cost_08x08_73_o    ,
  cost_08x08_44_o    , cost_08x08_54_o    , cost_08x08_64_o    , cost_08x08_74_o    ,
  cost_08x08_45_o    , cost_08x08_55_o    , cost_08x08_65_o    , cost_08x08_75_o    ,
  cost_08x08_46_o    , cost_08x08_56_o    , cost_08x08_66_o    , cost_08x08_76_o    ,
  cost_08x08_47_o    , cost_08x08_57_o    , cost_08x08_67_o    , cost_08x08_77_o    ,
  // cost_08x16
  cost_08x16_00_o    , cost_08x16_20_o    , cost_08x16_40_o    , cost_08x16_60_o    ,
  cost_08x16_01_o    , cost_08x16_21_o    , cost_08x16_41_o    , cost_08x16_61_o    ,
  cost_08x16_02_o    , cost_08x16_22_o    , cost_08x16_42_o    , cost_08x16_62_o    ,
  cost_08x16_03_o    , cost_08x16_23_o    , cost_08x16_43_o    , cost_08x16_63_o    ,
  cost_08x16_04_o    , cost_08x16_24_o    , cost_08x16_44_o    , cost_08x16_64_o    ,
  cost_08x16_05_o    , cost_08x16_25_o    , cost_08x16_45_o    , cost_08x16_65_o    ,
  cost_08x16_06_o    , cost_08x16_26_o    , cost_08x16_46_o    , cost_08x16_66_o    ,
  cost_08x16_07_o    , cost_08x16_27_o    , cost_08x16_47_o    , cost_08x16_67_o    ,
  // cost_16x08
  cost_16x08_00_o    , cost_16x08_20_o    , cost_16x08_40_o    , cost_16x08_60_o    ,
  cost_16x08_10_o    , cost_16x08_30_o    , cost_16x08_50_o    , cost_16x08_70_o    ,
  cost_16x08_02_o    , cost_16x08_22_o    , cost_16x08_42_o    , cost_16x08_62_o    ,
  cost_16x08_12_o    , cost_16x08_32_o    , cost_16x08_52_o    , cost_16x08_72_o    ,
  cost_16x08_04_o    , cost_16x08_24_o    , cost_16x08_44_o    , cost_16x08_64_o    ,
  cost_16x08_14_o    , cost_16x08_34_o    , cost_16x08_54_o    , cost_16x08_74_o    ,
  cost_16x08_06_o    , cost_16x08_26_o    , cost_16x08_46_o    , cost_16x08_66_o    ,
  cost_16x08_16_o    , cost_16x08_36_o    , cost_16x08_56_o    , cost_16x08_76_o    ,
  // cost_16x16
  cost_16x16_00_o    , cost_16x16_20_o    , cost_16x16_40_o    , cost_16x16_60_o    ,
  cost_16x16_02_o    , cost_16x16_22_o    , cost_16x16_42_o    , cost_16x16_62_o    ,
  cost_16x16_04_o    , cost_16x16_24_o    , cost_16x16_44_o    , cost_16x16_64_o    ,
  cost_16x16_06_o    , cost_16x16_26_o    , cost_16x16_46_o    , cost_16x16_66_o    ,

  // mv_x
  // mv_x_08x08
  mv_x_08x08_00_o    , mv_x_08x08_10_o    , mv_x_08x08_20_o    , mv_x_08x08_30_o    ,
  mv_x_08x08_01_o    , mv_x_08x08_11_o    , mv_x_08x08_21_o    , mv_x_08x08_31_o    ,
  mv_x_08x08_02_o    , mv_x_08x08_12_o    , mv_x_08x08_22_o    , mv_x_08x08_32_o    ,
  mv_x_08x08_03_o    , mv_x_08x08_13_o    , mv_x_08x08_23_o    , mv_x_08x08_33_o    ,
  mv_x_08x08_04_o    , mv_x_08x08_14_o    , mv_x_08x08_24_o    , mv_x_08x08_34_o    ,
  mv_x_08x08_05_o    , mv_x_08x08_15_o    , mv_x_08x08_25_o    , mv_x_08x08_35_o    ,
  mv_x_08x08_06_o    , mv_x_08x08_16_o    , mv_x_08x08_26_o    , mv_x_08x08_36_o    ,
  mv_x_08x08_07_o    , mv_x_08x08_17_o    , mv_x_08x08_27_o    , mv_x_08x08_37_o    ,

  mv_x_08x08_40_o    , mv_x_08x08_50_o    , mv_x_08x08_60_o    , mv_x_08x08_70_o    ,
  mv_x_08x08_41_o    , mv_x_08x08_51_o    , mv_x_08x08_61_o    , mv_x_08x08_71_o    ,
  mv_x_08x08_42_o    , mv_x_08x08_52_o    , mv_x_08x08_62_o    , mv_x_08x08_72_o    ,
  mv_x_08x08_43_o    , mv_x_08x08_53_o    , mv_x_08x08_63_o    , mv_x_08x08_73_o    ,
  mv_x_08x08_44_o    , mv_x_08x08_54_o    , mv_x_08x08_64_o    , mv_x_08x08_74_o    ,
  mv_x_08x08_45_o    , mv_x_08x08_55_o    , mv_x_08x08_65_o    , mv_x_08x08_75_o    ,
  mv_x_08x08_46_o    , mv_x_08x08_56_o    , mv_x_08x08_66_o    , mv_x_08x08_76_o    ,
  mv_x_08x08_47_o    , mv_x_08x08_57_o    , mv_x_08x08_67_o    , mv_x_08x08_77_o    ,
  // mv_y_08x08
  mv_y_08x08_00_o    , mv_y_08x08_10_o    , mv_y_08x08_20_o    , mv_y_08x08_30_o    ,
  mv_y_08x08_01_o    , mv_y_08x08_11_o    , mv_y_08x08_21_o    , mv_y_08x08_31_o    ,
  mv_y_08x08_02_o    , mv_y_08x08_12_o    , mv_y_08x08_22_o    , mv_y_08x08_32_o    ,
  mv_y_08x08_03_o    , mv_y_08x08_13_o    , mv_y_08x08_23_o    , mv_y_08x08_33_o    ,
  mv_y_08x08_04_o    , mv_y_08x08_14_o    , mv_y_08x08_24_o    , mv_y_08x08_34_o    ,
  mv_y_08x08_05_o    , mv_y_08x08_15_o    , mv_y_08x08_25_o    , mv_y_08x08_35_o    ,
  mv_y_08x08_06_o    , mv_y_08x08_16_o    , mv_y_08x08_26_o    , mv_y_08x08_36_o    ,
  mv_y_08x08_07_o    , mv_y_08x08_17_o    , mv_y_08x08_27_o    , mv_y_08x08_37_o    ,

  mv_y_08x08_40_o    , mv_y_08x08_50_o    , mv_y_08x08_60_o    , mv_y_08x08_70_o    ,
  mv_y_08x08_41_o    , mv_y_08x08_51_o    , mv_y_08x08_61_o    , mv_y_08x08_71_o    ,
  mv_y_08x08_42_o    , mv_y_08x08_52_o    , mv_y_08x08_62_o    , mv_y_08x08_72_o    ,
  mv_y_08x08_43_o    , mv_y_08x08_53_o    , mv_y_08x08_63_o    , mv_y_08x08_73_o    ,
  mv_y_08x08_44_o    , mv_y_08x08_54_o    , mv_y_08x08_64_o    , mv_y_08x08_74_o    ,
  mv_y_08x08_45_o    , mv_y_08x08_55_o    , mv_y_08x08_65_o    , mv_y_08x08_75_o    ,
  mv_y_08x08_46_o    , mv_y_08x08_56_o    , mv_y_08x08_66_o    , mv_y_08x08_76_o    ,
  mv_y_08x08_47_o    , mv_y_08x08_57_o    , mv_y_08x08_67_o    , mv_y_08x08_77_o    ,
  // mv_x_08x16
  mv_x_08x16_00_o    , mv_x_08x16_20_o    , mv_x_08x16_40_o    , mv_x_08x16_60_o    ,
  mv_x_08x16_01_o    , mv_x_08x16_21_o    , mv_x_08x16_41_o    , mv_x_08x16_61_o    ,
  mv_x_08x16_02_o    , mv_x_08x16_22_o    , mv_x_08x16_42_o    , mv_x_08x16_62_o    ,
  mv_x_08x16_03_o    , mv_x_08x16_23_o    , mv_x_08x16_43_o    , mv_x_08x16_63_o    ,
  mv_x_08x16_04_o    , mv_x_08x16_24_o    , mv_x_08x16_44_o    , mv_x_08x16_64_o    ,
  mv_x_08x16_05_o    , mv_x_08x16_25_o    , mv_x_08x16_45_o    , mv_x_08x16_65_o    ,
  mv_x_08x16_06_o    , mv_x_08x16_26_o    , mv_x_08x16_46_o    , mv_x_08x16_66_o    ,
  mv_x_08x16_07_o    , mv_x_08x16_27_o    , mv_x_08x16_47_o    , mv_x_08x16_67_o    ,
  // mv_y_08x16
  mv_y_08x16_00_o    , mv_y_08x16_20_o    , mv_y_08x16_40_o    , mv_y_08x16_60_o    ,
  mv_y_08x16_01_o    , mv_y_08x16_21_o    , mv_y_08x16_41_o    , mv_y_08x16_61_o    ,
  mv_y_08x16_02_o    , mv_y_08x16_22_o    , mv_y_08x16_42_o    , mv_y_08x16_62_o    ,
  mv_y_08x16_03_o    , mv_y_08x16_23_o    , mv_y_08x16_43_o    , mv_y_08x16_63_o    ,
  mv_y_08x16_04_o    , mv_y_08x16_24_o    , mv_y_08x16_44_o    , mv_y_08x16_64_o    ,
  mv_y_08x16_05_o    , mv_y_08x16_25_o    , mv_y_08x16_45_o    , mv_y_08x16_65_o    ,
  mv_y_08x16_06_o    , mv_y_08x16_26_o    , mv_y_08x16_46_o    , mv_y_08x16_66_o    ,
  mv_y_08x16_07_o    , mv_y_08x16_27_o    , mv_y_08x16_47_o    , mv_y_08x16_67_o    ,
  // mv_x_16x08
  mv_x_16x08_00_o    , mv_x_16x08_20_o    , mv_x_16x08_40_o    , mv_x_16x08_60_o    ,
  mv_x_16x08_10_o    , mv_x_16x08_30_o    , mv_x_16x08_50_o    , mv_x_16x08_70_o    ,
  mv_x_16x08_02_o    , mv_x_16x08_22_o    , mv_x_16x08_42_o    , mv_x_16x08_62_o    ,
  mv_x_16x08_12_o    , mv_x_16x08_32_o    , mv_x_16x08_52_o    , mv_x_16x08_72_o    ,
  mv_x_16x08_04_o    , mv_x_16x08_24_o    , mv_x_16x08_44_o    , mv_x_16x08_64_o    ,
  mv_x_16x08_14_o    , mv_x_16x08_34_o    , mv_x_16x08_54_o    , mv_x_16x08_74_o    ,
  mv_x_16x08_06_o    , mv_x_16x08_26_o    , mv_x_16x08_46_o    , mv_x_16x08_66_o    ,
  mv_x_16x08_16_o    , mv_x_16x08_36_o    , mv_x_16x08_56_o    , mv_x_16x08_76_o    ,
  // mv_y_16x08
  mv_y_16x08_00_o    , mv_y_16x08_20_o    , mv_y_16x08_40_o    , mv_y_16x08_60_o    ,
  mv_y_16x08_10_o    , mv_y_16x08_30_o    , mv_y_16x08_50_o    , mv_y_16x08_70_o    ,
  mv_y_16x08_02_o    , mv_y_16x08_22_o    , mv_y_16x08_42_o    , mv_y_16x08_62_o    ,
  mv_y_16x08_12_o    , mv_y_16x08_32_o    , mv_y_16x08_52_o    , mv_y_16x08_72_o    ,
  mv_y_16x08_04_o    , mv_y_16x08_24_o    , mv_y_16x08_44_o    , mv_y_16x08_64_o    ,
  mv_y_16x08_14_o    , mv_y_16x08_34_o    , mv_y_16x08_54_o    , mv_y_16x08_74_o    ,
  mv_y_16x08_06_o    , mv_y_16x08_26_o    , mv_y_16x08_46_o    , mv_y_16x08_66_o    ,
  mv_y_16x08_16_o    , mv_y_16x08_36_o    , mv_y_16x08_56_o    , mv_y_16x08_76_o    ,
  // mv_x_16x16
  mv_x_16x16_00_o    , mv_x_16x16_20_o    , mv_x_16x16_40_o    , mv_x_16x16_60_o    ,
  mv_x_16x16_02_o    , mv_x_16x16_22_o    , mv_x_16x16_42_o    , mv_x_16x16_62_o    ,
  mv_x_16x16_04_o    , mv_x_16x16_24_o    , mv_x_16x16_44_o    , mv_x_16x16_64_o    ,
  mv_x_16x16_06_o    , mv_x_16x16_26_o    , mv_x_16x16_46_o    , mv_x_16x16_66_o    ,
  // mv_y_16x16
  mv_y_16x16_00_o    , mv_y_16x16_20_o    , mv_y_16x16_40_o    , mv_y_16x16_60_o    ,
  mv_y_16x16_02_o    , mv_y_16x16_22_o    , mv_y_16x16_42_o    , mv_y_16x16_62_o    ,
  mv_y_16x16_04_o    , mv_y_16x16_24_o    , mv_y_16x16_44_o    , mv_y_16x16_64_o    ,
  mv_y_16x16_06_o    , mv_y_16x16_26_o    , mv_y_16x16_46_o    , mv_y_16x16_66_o
  );


//*** PARAMETER DECLARATION ****************************************************


//*** INPUT/OUTPUT DECLARATION *************************************************

  // global
  input                              clk               ;
  input                              rstn              ;

  // ctrl_i
  input                              start_i           ;
  input                              val_i             ;
  input      [1              : 0]    block_i           ;
  input      [5              : 0]    qp_i              ;

  // update_i
  input                              update_wrk_i      ;
  input      [6              : 0]    update_cnt_i      ;
  input      [`COST_WIDTH-1  : 0]    update_cst_i      ;

  // sad_i
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_00_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_01_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_02_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_03_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_04_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_05_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_06_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_07_i    ;

  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_10_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_11_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_12_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_13_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_14_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_15_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_16_i    ;
  input      [`PIXEL_WIDTH+5 : 0]    sad_08x08_17_i    ;

  // mv_i
  input      [`IMV_WIDTH-1   : 0]    mv_x_08x08_i      ;
  input      [`IMV_WIDTH-1   : 0]    mv_y_08x08_i      ;

  // sad_o
  output reg [`PIXEL_WIDTH+7 : 0]    sad_16x16_00_o    ;
  output reg [`PIXEL_WIDTH+7 : 0]    sad_16x16_02_o    ;
  output reg [`PIXEL_WIDTH+7 : 0]    sad_16x16_04_o    ;
  output reg [`PIXEL_WIDTH+7 : 0]    sad_16x16_06_o    ;

  // cost_o
  // cost_08x08
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_00_o    , cost_08x08_10_o    , cost_08x08_20_o    , cost_08x08_30_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_01_o    , cost_08x08_11_o    , cost_08x08_21_o    , cost_08x08_31_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_02_o    , cost_08x08_12_o    , cost_08x08_22_o    , cost_08x08_32_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_03_o    , cost_08x08_13_o    , cost_08x08_23_o    , cost_08x08_33_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_04_o    , cost_08x08_14_o    , cost_08x08_24_o    , cost_08x08_34_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_05_o    , cost_08x08_15_o    , cost_08x08_25_o    , cost_08x08_35_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_06_o    , cost_08x08_16_o    , cost_08x08_26_o    , cost_08x08_36_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_07_o    , cost_08x08_17_o    , cost_08x08_27_o    , cost_08x08_37_o    ;

  output reg [`COST_WIDTH-1  : 0]    cost_08x08_40_o    , cost_08x08_50_o    , cost_08x08_60_o    , cost_08x08_70_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_41_o    , cost_08x08_51_o    , cost_08x08_61_o    , cost_08x08_71_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_42_o    , cost_08x08_52_o    , cost_08x08_62_o    , cost_08x08_72_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_43_o    , cost_08x08_53_o    , cost_08x08_63_o    , cost_08x08_73_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_44_o    , cost_08x08_54_o    , cost_08x08_64_o    , cost_08x08_74_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_45_o    , cost_08x08_55_o    , cost_08x08_65_o    , cost_08x08_75_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_46_o    , cost_08x08_56_o    , cost_08x08_66_o    , cost_08x08_76_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x08_47_o    , cost_08x08_57_o    , cost_08x08_67_o    , cost_08x08_77_o    ;
  // cost_08x16
  output reg [`COST_WIDTH-1  : 0]    cost_08x16_00_o    , cost_08x16_20_o    , cost_08x16_40_o    , cost_08x16_60_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x16_01_o    , cost_08x16_21_o    , cost_08x16_41_o    , cost_08x16_61_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x16_02_o    , cost_08x16_22_o    , cost_08x16_42_o    , cost_08x16_62_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x16_03_o    , cost_08x16_23_o    , cost_08x16_43_o    , cost_08x16_63_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x16_04_o    , cost_08x16_24_o    , cost_08x16_44_o    , cost_08x16_64_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x16_05_o    , cost_08x16_25_o    , cost_08x16_45_o    , cost_08x16_65_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x16_06_o    , cost_08x16_26_o    , cost_08x16_46_o    , cost_08x16_66_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_08x16_07_o    , cost_08x16_27_o    , cost_08x16_47_o    , cost_08x16_67_o    ;
  // cost_16x08
  output reg [`COST_WIDTH-1  : 0]    cost_16x08_00_o    , cost_16x08_20_o    , cost_16x08_40_o    , cost_16x08_60_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x08_10_o    , cost_16x08_30_o    , cost_16x08_50_o    , cost_16x08_70_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x08_02_o    , cost_16x08_22_o    , cost_16x08_42_o    , cost_16x08_62_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x08_12_o    , cost_16x08_32_o    , cost_16x08_52_o    , cost_16x08_72_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x08_04_o    , cost_16x08_24_o    , cost_16x08_44_o    , cost_16x08_64_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x08_14_o    , cost_16x08_34_o    , cost_16x08_54_o    , cost_16x08_74_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x08_06_o    , cost_16x08_26_o    , cost_16x08_46_o    , cost_16x08_66_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x08_16_o    , cost_16x08_36_o    , cost_16x08_56_o    , cost_16x08_76_o    ;
  // cost_16x16
  output reg [`COST_WIDTH-1  : 0]    cost_16x16_00_o    , cost_16x16_20_o    , cost_16x16_40_o    , cost_16x16_60_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x16_02_o    , cost_16x16_22_o    , cost_16x16_42_o    , cost_16x16_62_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x16_04_o    , cost_16x16_24_o    , cost_16x16_44_o    , cost_16x16_64_o    ;
  output reg [`COST_WIDTH-1  : 0]    cost_16x16_06_o    , cost_16x16_26_o    , cost_16x16_46_o    , cost_16x16_66_o    ;

  // mv_o
  // mv_x_08x08
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_00_o    , mv_x_08x08_10_o    , mv_x_08x08_20_o    , mv_x_08x08_30_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_01_o    , mv_x_08x08_11_o    , mv_x_08x08_21_o    , mv_x_08x08_31_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_02_o    , mv_x_08x08_12_o    , mv_x_08x08_22_o    , mv_x_08x08_32_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_03_o    , mv_x_08x08_13_o    , mv_x_08x08_23_o    , mv_x_08x08_33_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_04_o    , mv_x_08x08_14_o    , mv_x_08x08_24_o    , mv_x_08x08_34_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_05_o    , mv_x_08x08_15_o    , mv_x_08x08_25_o    , mv_x_08x08_35_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_06_o    , mv_x_08x08_16_o    , mv_x_08x08_26_o    , mv_x_08x08_36_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_07_o    , mv_x_08x08_17_o    , mv_x_08x08_27_o    , mv_x_08x08_37_o    ;

  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_40_o    , mv_x_08x08_50_o    , mv_x_08x08_60_o    , mv_x_08x08_70_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_41_o    , mv_x_08x08_51_o    , mv_x_08x08_61_o    , mv_x_08x08_71_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_42_o    , mv_x_08x08_52_o    , mv_x_08x08_62_o    , mv_x_08x08_72_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_43_o    , mv_x_08x08_53_o    , mv_x_08x08_63_o    , mv_x_08x08_73_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_44_o    , mv_x_08x08_54_o    , mv_x_08x08_64_o    , mv_x_08x08_74_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_45_o    , mv_x_08x08_55_o    , mv_x_08x08_65_o    , mv_x_08x08_75_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_46_o    , mv_x_08x08_56_o    , mv_x_08x08_66_o    , mv_x_08x08_76_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x08_47_o    , mv_x_08x08_57_o    , mv_x_08x08_67_o    , mv_x_08x08_77_o    ;
  // mv_y_08x08
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_00_o    , mv_y_08x08_10_o    , mv_y_08x08_20_o    , mv_y_08x08_30_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_01_o    , mv_y_08x08_11_o    , mv_y_08x08_21_o    , mv_y_08x08_31_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_02_o    , mv_y_08x08_12_o    , mv_y_08x08_22_o    , mv_y_08x08_32_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_03_o    , mv_y_08x08_13_o    , mv_y_08x08_23_o    , mv_y_08x08_33_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_04_o    , mv_y_08x08_14_o    , mv_y_08x08_24_o    , mv_y_08x08_34_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_05_o    , mv_y_08x08_15_o    , mv_y_08x08_25_o    , mv_y_08x08_35_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_06_o    , mv_y_08x08_16_o    , mv_y_08x08_26_o    , mv_y_08x08_36_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_07_o    , mv_y_08x08_17_o    , mv_y_08x08_27_o    , mv_y_08x08_37_o    ;

  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_40_o    , mv_y_08x08_50_o    , mv_y_08x08_60_o    , mv_y_08x08_70_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_41_o    , mv_y_08x08_51_o    , mv_y_08x08_61_o    , mv_y_08x08_71_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_42_o    , mv_y_08x08_52_o    , mv_y_08x08_62_o    , mv_y_08x08_72_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_43_o    , mv_y_08x08_53_o    , mv_y_08x08_63_o    , mv_y_08x08_73_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_44_o    , mv_y_08x08_54_o    , mv_y_08x08_64_o    , mv_y_08x08_74_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_45_o    , mv_y_08x08_55_o    , mv_y_08x08_65_o    , mv_y_08x08_75_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_46_o    , mv_y_08x08_56_o    , mv_y_08x08_66_o    , mv_y_08x08_76_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x08_47_o    , mv_y_08x08_57_o    , mv_y_08x08_67_o    , mv_y_08x08_77_o    ;
  // mv_x_08x16
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x16_00_o    , mv_x_08x16_20_o    , mv_x_08x16_40_o    , mv_x_08x16_60_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x16_01_o    , mv_x_08x16_21_o    , mv_x_08x16_41_o    , mv_x_08x16_61_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x16_02_o    , mv_x_08x16_22_o    , mv_x_08x16_42_o    , mv_x_08x16_62_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x16_03_o    , mv_x_08x16_23_o    , mv_x_08x16_43_o    , mv_x_08x16_63_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x16_04_o    , mv_x_08x16_24_o    , mv_x_08x16_44_o    , mv_x_08x16_64_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x16_05_o    , mv_x_08x16_25_o    , mv_x_08x16_45_o    , mv_x_08x16_65_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x16_06_o    , mv_x_08x16_26_o    , mv_x_08x16_46_o    , mv_x_08x16_66_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_08x16_07_o    , mv_x_08x16_27_o    , mv_x_08x16_47_o    , mv_x_08x16_67_o    ;
  // mv_y_08x16
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x16_00_o    , mv_y_08x16_20_o    , mv_y_08x16_40_o    , mv_y_08x16_60_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x16_01_o    , mv_y_08x16_21_o    , mv_y_08x16_41_o    , mv_y_08x16_61_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x16_02_o    , mv_y_08x16_22_o    , mv_y_08x16_42_o    , mv_y_08x16_62_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x16_03_o    , mv_y_08x16_23_o    , mv_y_08x16_43_o    , mv_y_08x16_63_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x16_04_o    , mv_y_08x16_24_o    , mv_y_08x16_44_o    , mv_y_08x16_64_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x16_05_o    , mv_y_08x16_25_o    , mv_y_08x16_45_o    , mv_y_08x16_65_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x16_06_o    , mv_y_08x16_26_o    , mv_y_08x16_46_o    , mv_y_08x16_66_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_08x16_07_o    , mv_y_08x16_27_o    , mv_y_08x16_47_o    , mv_y_08x16_67_o    ;
  // mv_x_16x08
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x08_00_o    , mv_x_16x08_20_o    , mv_x_16x08_40_o    , mv_x_16x08_60_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x08_10_o    , mv_x_16x08_30_o    , mv_x_16x08_50_o    , mv_x_16x08_70_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x08_02_o    , mv_x_16x08_22_o    , mv_x_16x08_42_o    , mv_x_16x08_62_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x08_12_o    , mv_x_16x08_32_o    , mv_x_16x08_52_o    , mv_x_16x08_72_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x08_04_o    , mv_x_16x08_24_o    , mv_x_16x08_44_o    , mv_x_16x08_64_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x08_14_o    , mv_x_16x08_34_o    , mv_x_16x08_54_o    , mv_x_16x08_74_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x08_06_o    , mv_x_16x08_26_o    , mv_x_16x08_46_o    , mv_x_16x08_66_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x08_16_o    , mv_x_16x08_36_o    , mv_x_16x08_56_o    , mv_x_16x08_76_o    ;
  // mv_y_16x08
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x08_00_o    , mv_y_16x08_20_o    , mv_y_16x08_40_o    , mv_y_16x08_60_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x08_10_o    , mv_y_16x08_30_o    , mv_y_16x08_50_o    , mv_y_16x08_70_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x08_02_o    , mv_y_16x08_22_o    , mv_y_16x08_42_o    , mv_y_16x08_62_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x08_12_o    , mv_y_16x08_32_o    , mv_y_16x08_52_o    , mv_y_16x08_72_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x08_04_o    , mv_y_16x08_24_o    , mv_y_16x08_44_o    , mv_y_16x08_64_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x08_14_o    , mv_y_16x08_34_o    , mv_y_16x08_54_o    , mv_y_16x08_74_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x08_06_o    , mv_y_16x08_26_o    , mv_y_16x08_46_o    , mv_y_16x08_66_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x08_16_o    , mv_y_16x08_36_o    , mv_y_16x08_56_o    , mv_y_16x08_76_o    ;
  // mv_x_16x16
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x16_00_o    , mv_x_16x16_20_o    , mv_x_16x16_40_o    , mv_x_16x16_60_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x16_02_o    , mv_x_16x16_22_o    , mv_x_16x16_42_o    , mv_x_16x16_62_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x16_04_o    , mv_x_16x16_24_o    , mv_x_16x16_44_o    , mv_x_16x16_64_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_x_16x16_06_o    , mv_x_16x16_26_o    , mv_x_16x16_46_o    , mv_x_16x16_66_o    ;
  // mv_y_16x16
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x16_00_o    , mv_y_16x16_20_o    , mv_y_16x16_40_o    , mv_y_16x16_60_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x16_02_o    , mv_y_16x16_22_o    , mv_y_16x16_42_o    , mv_y_16x16_62_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x16_04_o    , mv_y_16x16_24_o    , mv_y_16x16_44_o    , mv_y_16x16_64_o    ;
  output reg [`IMV_WIDTH-1   : 0]    mv_y_16x16_06_o    , mv_y_16x16_26_o    , mv_y_16x16_46_o    , mv_y_16x16_66_o    ;


//*** WIRE & REG DECLARATION ***************************************************

  // sad_w
  // sad_08x08
  wire [`PIXEL_WIDTH+5 : 0]    sad_08x08_00_w    , sad_08x08_10_w    ;
  wire [`PIXEL_WIDTH+5 : 0]    sad_08x08_01_w    , sad_08x08_11_w    ;
  wire [`PIXEL_WIDTH+5 : 0]    sad_08x08_02_w    , sad_08x08_12_w    ;
  wire [`PIXEL_WIDTH+5 : 0]    sad_08x08_03_w    , sad_08x08_13_w    ;
  wire [`PIXEL_WIDTH+5 : 0]    sad_08x08_04_w    , sad_08x08_14_w    ;
  wire [`PIXEL_WIDTH+5 : 0]    sad_08x08_05_w    , sad_08x08_15_w    ;
  wire [`PIXEL_WIDTH+5 : 0]    sad_08x08_06_w    , sad_08x08_16_w    ;
  wire [`PIXEL_WIDTH+5 : 0]    sad_08x08_07_w    , sad_08x08_17_w    ;

  // sad_08x16
  wire [`PIXEL_WIDTH+6 : 0]    sad_08x16_00_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_08x16_01_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_08x16_02_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_08x16_03_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_08x16_04_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_08x16_05_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_08x16_06_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_08x16_07_w    ;
  // sad_16x08
  wire [`PIXEL_WIDTH+6 : 0]    sad_16x08_00_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_16x08_10_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_16x08_02_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_16x08_12_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_16x08_04_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_16x08_14_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_16x08_06_w    ;
  wire [`PIXEL_WIDTH+6 : 0]    sad_16x08_16_w    ;
  // sad_16x16
  wire [`PIXEL_WIDTH+7 : 0]    sad_16x16_00_w    ;
  wire [`PIXEL_WIDTH+7 : 0]    sad_16x16_02_w    ;
  wire [`PIXEL_WIDTH+7 : 0]    sad_16x16_04_w    ;
  wire [`PIXEL_WIDTH+7 : 0]    sad_16x16_06_w    ;

  // mv_cost
  wire [`FMV_WIDTH-1   : 0]    mv_x_08x08_s_w    ;
  wire [`FMV_WIDTH-1   : 0]    mv_y_08x08_s_w    ;
  wire [`FMV_WIDTH     : 0]    mv_x_08x08_c_w    ;
  wire [`FMV_WIDTH     : 0]    mv_y_08x08_c_w    ;
  reg  [4              : 0]    bitsnum_x_w       ;
  reg  [4              : 0]    bitsnum_y_w       ;
  reg  [6              : 0]    lambda_w          ;
  wire [12             : 0]    mv_cost_w         ;

  // cost_w
  // cost_08x08
  wire [`COST_WIDTH-1  : 0]    cost_08x08_00_w    , cost_08x08_10_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_01_w    , cost_08x08_11_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_02_w    , cost_08x08_12_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_03_w    , cost_08x08_13_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_04_w    , cost_08x08_14_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_05_w    , cost_08x08_15_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_06_w    , cost_08x08_16_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_07_w    , cost_08x08_17_w    ;

  // cost_08x16
  wire [`COST_WIDTH-1  : 0]    cost_08x16_00_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_01_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_02_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_03_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_04_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_05_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_06_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_07_w    ;
  // cost_16x08
  wire [`COST_WIDTH-1  : 0]    cost_16x08_00_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_10_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_02_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_12_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_04_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_14_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_06_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_16_w    ;
  // cost_16x16
  wire [`COST_WIDTH-1  : 0]    cost_16x16_00_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x16_02_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x16_04_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x16_06_w    ;

  // cover_w
  // cover_08x08
  wire    cover_08x08_00_w    , cover_08x08_10_w    , cover_08x08_20_w    , cover_08x08_30_w    ;
  wire    cover_08x08_01_w    , cover_08x08_11_w    , cover_08x08_21_w    , cover_08x08_31_w    ;
  wire    cover_08x08_02_w    , cover_08x08_12_w    , cover_08x08_22_w    , cover_08x08_32_w    ;
  wire    cover_08x08_03_w    , cover_08x08_13_w    , cover_08x08_23_w    , cover_08x08_33_w    ;
  wire    cover_08x08_04_w    , cover_08x08_14_w    , cover_08x08_24_w    , cover_08x08_34_w    ;
  wire    cover_08x08_05_w    , cover_08x08_15_w    , cover_08x08_25_w    , cover_08x08_35_w    ;
  wire    cover_08x08_06_w    , cover_08x08_16_w    , cover_08x08_26_w    , cover_08x08_36_w    ;
  wire    cover_08x08_07_w    , cover_08x08_17_w    , cover_08x08_27_w    , cover_08x08_37_w    ;

  wire    cover_08x08_40_w    , cover_08x08_50_w    , cover_08x08_60_w    , cover_08x08_70_w    ;
  wire    cover_08x08_41_w    , cover_08x08_51_w    , cover_08x08_61_w    , cover_08x08_71_w    ;
  wire    cover_08x08_42_w    , cover_08x08_52_w    , cover_08x08_62_w    , cover_08x08_72_w    ;
  wire    cover_08x08_43_w    , cover_08x08_53_w    , cover_08x08_63_w    , cover_08x08_73_w    ;
  wire    cover_08x08_44_w    , cover_08x08_54_w    , cover_08x08_64_w    , cover_08x08_74_w    ;
  wire    cover_08x08_45_w    , cover_08x08_55_w    , cover_08x08_65_w    , cover_08x08_75_w    ;
  wire    cover_08x08_46_w    , cover_08x08_56_w    , cover_08x08_66_w    , cover_08x08_76_w    ;
  wire    cover_08x08_47_w    , cover_08x08_57_w    , cover_08x08_67_w    , cover_08x08_77_w    ;
  // cover_08x16
  wire    cover_08x16_00_w    , cover_08x16_20_w    , cover_08x16_40_w    , cover_08x16_60_w    ;
  wire    cover_08x16_01_w    , cover_08x16_21_w    , cover_08x16_41_w    , cover_08x16_61_w    ;
  wire    cover_08x16_02_w    , cover_08x16_22_w    , cover_08x16_42_w    , cover_08x16_62_w    ;
  wire    cover_08x16_03_w    , cover_08x16_23_w    , cover_08x16_43_w    , cover_08x16_63_w    ;
  wire    cover_08x16_04_w    , cover_08x16_24_w    , cover_08x16_44_w    , cover_08x16_64_w    ;
  wire    cover_08x16_05_w    , cover_08x16_25_w    , cover_08x16_45_w    , cover_08x16_65_w    ;
  wire    cover_08x16_06_w    , cover_08x16_26_w    , cover_08x16_46_w    , cover_08x16_66_w    ;
  wire    cover_08x16_07_w    , cover_08x16_27_w    , cover_08x16_47_w    , cover_08x16_67_w    ;
  // cover_16x08
  wire    cover_16x08_00_w    , cover_16x08_20_w    , cover_16x08_40_w    , cover_16x08_60_w    ;
  wire    cover_16x08_10_w    , cover_16x08_30_w    , cover_16x08_50_w    , cover_16x08_70_w    ;
  wire    cover_16x08_02_w    , cover_16x08_22_w    , cover_16x08_42_w    , cover_16x08_62_w    ;
  wire    cover_16x08_12_w    , cover_16x08_32_w    , cover_16x08_52_w    , cover_16x08_72_w    ;
  wire    cover_16x08_04_w    , cover_16x08_24_w    , cover_16x08_44_w    , cover_16x08_64_w    ;
  wire    cover_16x08_14_w    , cover_16x08_34_w    , cover_16x08_54_w    , cover_16x08_74_w    ;
  wire    cover_16x08_06_w    , cover_16x08_26_w    , cover_16x08_46_w    , cover_16x08_66_w    ;
  wire    cover_16x08_16_w    , cover_16x08_36_w    , cover_16x08_56_w    , cover_16x08_76_w    ;
  // cover_16x16
  wire    cover_16x16_00_w    , cover_16x16_20_w    , cover_16x16_40_w    , cover_16x16_60_w    ;
  wire    cover_16x16_02_w    , cover_16x16_22_w    , cover_16x16_42_w    , cover_16x16_62_w    ;
  wire    cover_16x16_04_w    , cover_16x16_24_w    , cover_16x16_44_w    , cover_16x16_64_w    ;
  wire    cover_16x16_06_w    , cover_16x16_26_w    , cover_16x16_46_w    , cover_16x16_66_w    ;


//*** MAIN BODY ****************************************************************

  // sad_w
  // sad_08x08
  assign sad_08x08_00_w = sad_08x08_00_i ;
  assign sad_08x08_01_w = sad_08x08_01_i ;
  assign sad_08x08_02_w = sad_08x08_02_i ;
  assign sad_08x08_03_w = sad_08x08_03_i ;
  assign sad_08x08_04_w = sad_08x08_04_i ;
  assign sad_08x08_05_w = sad_08x08_05_i ;
  assign sad_08x08_06_w = sad_08x08_06_i ;
  assign sad_08x08_07_w = sad_08x08_07_i ;

  assign sad_08x08_10_w = sad_08x08_10_i ;
  assign sad_08x08_11_w = sad_08x08_11_i ;
  assign sad_08x08_12_w = sad_08x08_12_i ;
  assign sad_08x08_13_w = sad_08x08_13_i ;
  assign sad_08x08_14_w = sad_08x08_14_i ;
  assign sad_08x08_15_w = sad_08x08_15_i ;
  assign sad_08x08_16_w = sad_08x08_16_i ;
  assign sad_08x08_17_w = sad_08x08_17_i ;
  // sad_08x16
  assign sad_08x16_00_w = sad_08x08_00_w + sad_08x08_10_w ;
  assign sad_08x16_01_w = sad_08x08_01_w + sad_08x08_11_w ;
  assign sad_08x16_02_w = sad_08x08_02_w + sad_08x08_12_w ;
  assign sad_08x16_03_w = sad_08x08_03_w + sad_08x08_13_w ;
  assign sad_08x16_04_w = sad_08x08_04_w + sad_08x08_14_w ;
  assign sad_08x16_05_w = sad_08x08_05_w + sad_08x08_15_w ;
  assign sad_08x16_06_w = sad_08x08_06_w + sad_08x08_16_w ;
  assign sad_08x16_07_w = sad_08x08_07_w + sad_08x08_17_w ;
  // sad_16x08
  assign sad_16x08_00_w = sad_08x08_00_w + sad_08x08_01_w ;
  assign sad_16x08_10_w = sad_08x08_10_w + sad_08x08_11_w ;
  assign sad_16x08_02_w = sad_08x08_02_w + sad_08x08_03_w ;
  assign sad_16x08_12_w = sad_08x08_12_w + sad_08x08_13_w ;
  assign sad_16x08_04_w = sad_08x08_04_w + sad_08x08_05_w ;
  assign sad_16x08_14_w = sad_08x08_14_w + sad_08x08_15_w ;
  assign sad_16x08_06_w = sad_08x08_06_w + sad_08x08_07_w ;
  assign sad_16x08_16_w = sad_08x08_16_w + sad_08x08_17_w ;
  // sad_16x16
  assign sad_16x16_00_w = sad_08x16_00_w + sad_08x16_01_w ;
  assign sad_16x16_02_w = sad_08x16_02_w + sad_08x16_03_w ;
  assign sad_16x16_04_w = sad_08x16_04_w + sad_08x16_05_w ;
  assign sad_16x16_06_w = sad_08x16_06_w + sad_08x16_07_w ;

  // mv_cost
  assign mv_x_08x08_s_w = ( mv_x_08x08_i-12 ) * 4 ; //+ mv_x_base_i ;
  assign mv_y_08x08_s_w = ( mv_y_08x08_i-12 ) * 4 ; //+ mv_y_base_i ;

  assign mv_x_08x08_c_w = ( mv_x_08x08_s_w[`FMV_WIDTH-1] ) ? ( {1'b0,~mv_x_08x08_s_w[`FMV_WIDTH-2:0],1'b0} + 3 ) :
                                                             ( (|mv_x_08x08_s_w[`FMV_WIDTH-2:0]) ? ( {1'b0, mv_x_08x08_s_w[`FMV_WIDTH-2:0],1'b0} )
                                                                                                 : 1 );

  assign mv_y_08x08_c_w = ( mv_y_08x08_s_w[`FMV_WIDTH-1] ) ? ( {1'b0,~mv_y_08x08_s_w[`FMV_WIDTH-2:0],1'b0} + 3 ) :
                                                             ( (|mv_y_08x08_s_w[`FMV_WIDTH-2:0]) ? ( {1'b0, mv_y_08x08_s_w[`FMV_WIDTH-2:0],1'b0} )
                                                                                                 : 1 );

  always @(*) begin
    casex( mv_x_08x08_c_w )
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
    casex( mv_y_08x08_c_w )
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
  // cost_08x08
  assign cost_08x08_00_w = sad_08x08_00_w + mv_cost_w ;
  assign cost_08x08_01_w = sad_08x08_01_w + mv_cost_w ;
  assign cost_08x08_02_w = sad_08x08_02_w + mv_cost_w ;
  assign cost_08x08_03_w = sad_08x08_03_w + mv_cost_w ;
  assign cost_08x08_04_w = sad_08x08_04_w + mv_cost_w ;
  assign cost_08x08_05_w = sad_08x08_05_w + mv_cost_w ;
  assign cost_08x08_06_w = sad_08x08_06_w + mv_cost_w ;
  assign cost_08x08_07_w = sad_08x08_07_w + mv_cost_w ;

  assign cost_08x08_10_w = sad_08x08_10_w + mv_cost_w ;
  assign cost_08x08_11_w = sad_08x08_11_w + mv_cost_w ;
  assign cost_08x08_12_w = sad_08x08_12_w + mv_cost_w ;
  assign cost_08x08_13_w = sad_08x08_13_w + mv_cost_w ;
  assign cost_08x08_14_w = sad_08x08_14_w + mv_cost_w ;
  assign cost_08x08_15_w = sad_08x08_15_w + mv_cost_w ;
  assign cost_08x08_16_w = sad_08x08_16_w + mv_cost_w ;
  assign cost_08x08_17_w = sad_08x08_17_w + mv_cost_w ;
  // cost_08x16
  assign cost_08x16_00_w = sad_08x16_00_w + mv_cost_w ;
  assign cost_08x16_01_w = sad_08x16_01_w + mv_cost_w ;
  assign cost_08x16_02_w = sad_08x16_02_w + mv_cost_w ;
  assign cost_08x16_03_w = sad_08x16_03_w + mv_cost_w ;
  assign cost_08x16_04_w = sad_08x16_04_w + mv_cost_w ;
  assign cost_08x16_05_w = sad_08x16_05_w + mv_cost_w ;
  assign cost_08x16_06_w = sad_08x16_06_w + mv_cost_w ;
  assign cost_08x16_07_w = sad_08x16_07_w + mv_cost_w ;
  // cost_16x08
  assign cost_16x08_00_w = sad_16x08_00_w + mv_cost_w ;
  assign cost_16x08_10_w = sad_16x08_10_w + mv_cost_w ;
  assign cost_16x08_02_w = sad_16x08_02_w + mv_cost_w ;
  assign cost_16x08_12_w = sad_16x08_12_w + mv_cost_w ;
  assign cost_16x08_04_w = sad_16x08_04_w + mv_cost_w ;
  assign cost_16x08_14_w = sad_16x08_14_w + mv_cost_w ;
  assign cost_16x08_06_w = sad_16x08_06_w + mv_cost_w ;
  assign cost_16x08_16_w = sad_16x08_16_w + mv_cost_w ;
  // cost_16x16
  assign cost_16x16_00_w = sad_16x16_00_w + mv_cost_w ;
  assign cost_16x16_02_w = sad_16x16_02_w + mv_cost_w ;
  assign cost_16x16_04_w = sad_16x16_04_w + mv_cost_w ;
  assign cost_16x16_06_w = sad_16x16_06_w + mv_cost_w ;

  // cover_w
  // cover_08x08
  assign cover_08x08_00_w = cost_08x08_00_w < cost_08x08_00_o ;    assign cover_08x08_10_w = cost_08x08_10_w < cost_08x08_10_o ;
  assign cover_08x08_01_w = cost_08x08_01_w < cost_08x08_01_o ;    assign cover_08x08_11_w = cost_08x08_11_w < cost_08x08_11_o ;
  assign cover_08x08_02_w = cost_08x08_02_w < cost_08x08_02_o ;    assign cover_08x08_12_w = cost_08x08_12_w < cost_08x08_12_o ;
  assign cover_08x08_03_w = cost_08x08_03_w < cost_08x08_03_o ;    assign cover_08x08_13_w = cost_08x08_13_w < cost_08x08_13_o ;
  assign cover_08x08_04_w = cost_08x08_04_w < cost_08x08_04_o ;    assign cover_08x08_14_w = cost_08x08_14_w < cost_08x08_14_o ;
  assign cover_08x08_05_w = cost_08x08_05_w < cost_08x08_05_o ;    assign cover_08x08_15_w = cost_08x08_15_w < cost_08x08_15_o ;
  assign cover_08x08_06_w = cost_08x08_06_w < cost_08x08_06_o ;    assign cover_08x08_16_w = cost_08x08_16_w < cost_08x08_16_o ;
  assign cover_08x08_07_w = cost_08x08_07_w < cost_08x08_07_o ;    assign cover_08x08_17_w = cost_08x08_17_w < cost_08x08_17_o ;

  assign cover_08x08_20_w = cost_08x08_00_w < cost_08x08_20_o ;    assign cover_08x08_30_w = cost_08x08_10_w < cost_08x08_30_o ;
  assign cover_08x08_21_w = cost_08x08_01_w < cost_08x08_21_o ;    assign cover_08x08_31_w = cost_08x08_11_w < cost_08x08_31_o ;
  assign cover_08x08_22_w = cost_08x08_02_w < cost_08x08_22_o ;    assign cover_08x08_32_w = cost_08x08_12_w < cost_08x08_32_o ;
  assign cover_08x08_23_w = cost_08x08_03_w < cost_08x08_23_o ;    assign cover_08x08_33_w = cost_08x08_13_w < cost_08x08_33_o ;
  assign cover_08x08_24_w = cost_08x08_04_w < cost_08x08_24_o ;    assign cover_08x08_34_w = cost_08x08_14_w < cost_08x08_34_o ;
  assign cover_08x08_25_w = cost_08x08_05_w < cost_08x08_25_o ;    assign cover_08x08_35_w = cost_08x08_15_w < cost_08x08_35_o ;
  assign cover_08x08_26_w = cost_08x08_06_w < cost_08x08_26_o ;    assign cover_08x08_36_w = cost_08x08_16_w < cost_08x08_36_o ;
  assign cover_08x08_27_w = cost_08x08_07_w < cost_08x08_27_o ;    assign cover_08x08_37_w = cost_08x08_17_w < cost_08x08_37_o ;

  assign cover_08x08_40_w = cost_08x08_00_w < cost_08x08_40_o ;    assign cover_08x08_50_w = cost_08x08_10_w < cost_08x08_50_o ;
  assign cover_08x08_41_w = cost_08x08_01_w < cost_08x08_41_o ;    assign cover_08x08_51_w = cost_08x08_11_w < cost_08x08_51_o ;
  assign cover_08x08_42_w = cost_08x08_02_w < cost_08x08_42_o ;    assign cover_08x08_52_w = cost_08x08_12_w < cost_08x08_52_o ;
  assign cover_08x08_43_w = cost_08x08_03_w < cost_08x08_43_o ;    assign cover_08x08_53_w = cost_08x08_13_w < cost_08x08_53_o ;
  assign cover_08x08_44_w = cost_08x08_04_w < cost_08x08_44_o ;    assign cover_08x08_54_w = cost_08x08_14_w < cost_08x08_54_o ;
  assign cover_08x08_45_w = cost_08x08_05_w < cost_08x08_45_o ;    assign cover_08x08_55_w = cost_08x08_15_w < cost_08x08_55_o ;
  assign cover_08x08_46_w = cost_08x08_06_w < cost_08x08_46_o ;    assign cover_08x08_56_w = cost_08x08_16_w < cost_08x08_56_o ;
  assign cover_08x08_47_w = cost_08x08_07_w < cost_08x08_47_o ;    assign cover_08x08_57_w = cost_08x08_17_w < cost_08x08_57_o ;

  assign cover_08x08_60_w = cost_08x08_00_w < cost_08x08_60_o ;    assign cover_08x08_70_w = cost_08x08_10_w < cost_08x08_70_o ;
  assign cover_08x08_61_w = cost_08x08_01_w < cost_08x08_61_o ;    assign cover_08x08_71_w = cost_08x08_11_w < cost_08x08_71_o ;
  assign cover_08x08_62_w = cost_08x08_02_w < cost_08x08_62_o ;    assign cover_08x08_72_w = cost_08x08_12_w < cost_08x08_72_o ;
  assign cover_08x08_63_w = cost_08x08_03_w < cost_08x08_63_o ;    assign cover_08x08_73_w = cost_08x08_13_w < cost_08x08_73_o ;
  assign cover_08x08_64_w = cost_08x08_04_w < cost_08x08_64_o ;    assign cover_08x08_74_w = cost_08x08_14_w < cost_08x08_74_o ;
  assign cover_08x08_65_w = cost_08x08_05_w < cost_08x08_65_o ;    assign cover_08x08_75_w = cost_08x08_15_w < cost_08x08_75_o ;
  assign cover_08x08_66_w = cost_08x08_06_w < cost_08x08_66_o ;    assign cover_08x08_76_w = cost_08x08_16_w < cost_08x08_76_o ;
  assign cover_08x08_67_w = cost_08x08_07_w < cost_08x08_67_o ;    assign cover_08x08_77_w = cost_08x08_17_w < cost_08x08_77_o ;
  // cover_08x16
  assign cover_08x16_00_w = cost_08x16_00_w < cost_08x16_00_o ;    assign cover_08x16_20_w = cost_08x16_00_w < cost_08x16_20_o ;
  assign cover_08x16_01_w = cost_08x16_01_w < cost_08x16_01_o ;    assign cover_08x16_21_w = cost_08x16_01_w < cost_08x16_21_o ;
  assign cover_08x16_02_w = cost_08x16_02_w < cost_08x16_02_o ;    assign cover_08x16_22_w = cost_08x16_02_w < cost_08x16_22_o ;
  assign cover_08x16_03_w = cost_08x16_03_w < cost_08x16_03_o ;    assign cover_08x16_23_w = cost_08x16_03_w < cost_08x16_23_o ;
  assign cover_08x16_04_w = cost_08x16_04_w < cost_08x16_04_o ;    assign cover_08x16_24_w = cost_08x16_04_w < cost_08x16_24_o ;
  assign cover_08x16_05_w = cost_08x16_05_w < cost_08x16_05_o ;    assign cover_08x16_25_w = cost_08x16_05_w < cost_08x16_25_o ;
  assign cover_08x16_06_w = cost_08x16_06_w < cost_08x16_06_o ;    assign cover_08x16_26_w = cost_08x16_06_w < cost_08x16_26_o ;
  assign cover_08x16_07_w = cost_08x16_07_w < cost_08x16_07_o ;    assign cover_08x16_27_w = cost_08x16_07_w < cost_08x16_27_o ;

  assign cover_08x16_40_w = cost_08x16_00_w < cost_08x16_40_o ;    assign cover_08x16_60_w = cost_08x16_00_w < cost_08x16_60_o ;
  assign cover_08x16_41_w = cost_08x16_01_w < cost_08x16_41_o ;    assign cover_08x16_61_w = cost_08x16_01_w < cost_08x16_61_o ;
  assign cover_08x16_42_w = cost_08x16_02_w < cost_08x16_42_o ;    assign cover_08x16_62_w = cost_08x16_02_w < cost_08x16_62_o ;
  assign cover_08x16_43_w = cost_08x16_03_w < cost_08x16_43_o ;    assign cover_08x16_63_w = cost_08x16_03_w < cost_08x16_63_o ;
  assign cover_08x16_44_w = cost_08x16_04_w < cost_08x16_44_o ;    assign cover_08x16_64_w = cost_08x16_04_w < cost_08x16_64_o ;
  assign cover_08x16_45_w = cost_08x16_05_w < cost_08x16_45_o ;    assign cover_08x16_65_w = cost_08x16_05_w < cost_08x16_65_o ;
  assign cover_08x16_46_w = cost_08x16_06_w < cost_08x16_46_o ;    assign cover_08x16_66_w = cost_08x16_06_w < cost_08x16_66_o ;
  assign cover_08x16_47_w = cost_08x16_07_w < cost_08x16_47_o ;    assign cover_08x16_67_w = cost_08x16_07_w < cost_08x16_67_o ;
  // cover_16x08
  assign cover_16x08_00_w = cost_16x08_00_w < cost_16x08_00_o ;    assign cover_16x08_20_w = cost_16x08_00_w < cost_16x08_20_o ;
  assign cover_16x08_10_w = cost_16x08_10_w < cost_16x08_10_o ;    assign cover_16x08_30_w = cost_16x08_10_w < cost_16x08_30_o ;
  assign cover_16x08_02_w = cost_16x08_02_w < cost_16x08_02_o ;    assign cover_16x08_22_w = cost_16x08_02_w < cost_16x08_22_o ;
  assign cover_16x08_12_w = cost_16x08_12_w < cost_16x08_12_o ;    assign cover_16x08_32_w = cost_16x08_12_w < cost_16x08_32_o ;
  assign cover_16x08_04_w = cost_16x08_04_w < cost_16x08_04_o ;    assign cover_16x08_24_w = cost_16x08_04_w < cost_16x08_24_o ;
  assign cover_16x08_14_w = cost_16x08_14_w < cost_16x08_14_o ;    assign cover_16x08_34_w = cost_16x08_14_w < cost_16x08_34_o ;
  assign cover_16x08_06_w = cost_16x08_06_w < cost_16x08_06_o ;    assign cover_16x08_26_w = cost_16x08_06_w < cost_16x08_26_o ;
  assign cover_16x08_16_w = cost_16x08_16_w < cost_16x08_16_o ;    assign cover_16x08_36_w = cost_16x08_16_w < cost_16x08_36_o ;

  assign cover_16x08_40_w = cost_16x08_00_w < cost_16x08_40_o ;    assign cover_16x08_60_w = cost_16x08_00_w < cost_16x08_60_o ;
  assign cover_16x08_50_w = cost_16x08_10_w < cost_16x08_50_o ;    assign cover_16x08_70_w = cost_16x08_10_w < cost_16x08_70_o ;
  assign cover_16x08_42_w = cost_16x08_02_w < cost_16x08_42_o ;    assign cover_16x08_62_w = cost_16x08_02_w < cost_16x08_62_o ;
  assign cover_16x08_52_w = cost_16x08_12_w < cost_16x08_52_o ;    assign cover_16x08_72_w = cost_16x08_12_w < cost_16x08_72_o ;
  assign cover_16x08_44_w = cost_16x08_04_w < cost_16x08_44_o ;    assign cover_16x08_64_w = cost_16x08_04_w < cost_16x08_64_o ;
  assign cover_16x08_54_w = cost_16x08_14_w < cost_16x08_54_o ;    assign cover_16x08_74_w = cost_16x08_14_w < cost_16x08_74_o ;
  assign cover_16x08_46_w = cost_16x08_06_w < cost_16x08_46_o ;    assign cover_16x08_66_w = cost_16x08_06_w < cost_16x08_66_o ;
  assign cover_16x08_56_w = cost_16x08_16_w < cost_16x08_56_o ;    assign cover_16x08_76_w = cost_16x08_16_w < cost_16x08_76_o ;
  // cover_16x16
  assign cover_16x16_00_w = cost_16x16_00_w < cost_16x16_00_o ;    assign cover_16x16_20_w = cost_16x16_00_w < cost_16x16_20_o ;
  assign cover_16x16_02_w = cost_16x16_02_w < cost_16x16_02_o ;    assign cover_16x16_22_w = cost_16x16_02_w < cost_16x16_22_o ;
  assign cover_16x16_04_w = cost_16x16_04_w < cost_16x16_04_o ;    assign cover_16x16_24_w = cost_16x16_04_w < cost_16x16_24_o ;
  assign cover_16x16_06_w = cost_16x16_06_w < cost_16x16_06_o ;    assign cover_16x16_26_w = cost_16x16_06_w < cost_16x16_26_o ;

  assign cover_16x16_40_w = cost_16x16_00_w < cost_16x16_40_o ;    assign cover_16x16_60_w = cost_16x16_00_w < cost_16x16_60_o ;
  assign cover_16x16_42_w = cost_16x16_02_w < cost_16x16_42_o ;    assign cover_16x16_62_w = cost_16x16_02_w < cost_16x16_62_o ;
  assign cover_16x16_44_w = cost_16x16_04_w < cost_16x16_44_o ;    assign cover_16x16_64_w = cost_16x16_04_w < cost_16x16_64_o ;
  assign cover_16x16_46_w = cost_16x16_06_w < cost_16x16_46_o ;    assign cover_16x16_66_w = cost_16x16_06_w < cost_16x16_66_o ;

  // sad_o
  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      sad_16x16_00_o <= 'd0 ;
      sad_16x16_02_o <= 'd0 ;
      sad_16x16_04_o <= 'd0 ;
      sad_16x16_06_o <= 'd0 ;
    end
    else if( val_i ) begin
      sad_16x16_00_o <= sad_16x16_00_w ;
      sad_16x16_02_o <= sad_16x16_02_w ;
      sad_16x16_04_o <= sad_16x16_04_w ;
      sad_16x16_06_o <= sad_16x16_06_w ;
    end
  end

  // cost_o
  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      // cost_08x08
      cost_08x08_00_o <= -1 ;    cost_08x08_10_o <= -1 ;    cost_08x08_20_o <= -1 ;    cost_08x08_30_o <= -1 ;
      cost_08x08_01_o <= -1 ;    cost_08x08_11_o <= -1 ;    cost_08x08_21_o <= -1 ;    cost_08x08_31_o <= -1 ;
      cost_08x08_02_o <= -1 ;    cost_08x08_12_o <= -1 ;    cost_08x08_22_o <= -1 ;    cost_08x08_32_o <= -1 ;
      cost_08x08_03_o <= -1 ;    cost_08x08_13_o <= -1 ;    cost_08x08_23_o <= -1 ;    cost_08x08_33_o <= -1 ;
      cost_08x08_04_o <= -1 ;    cost_08x08_14_o <= -1 ;    cost_08x08_24_o <= -1 ;    cost_08x08_34_o <= -1 ;
      cost_08x08_05_o <= -1 ;    cost_08x08_15_o <= -1 ;    cost_08x08_25_o <= -1 ;    cost_08x08_35_o <= -1 ;
      cost_08x08_06_o <= -1 ;    cost_08x08_16_o <= -1 ;    cost_08x08_26_o <= -1 ;    cost_08x08_36_o <= -1 ;
      cost_08x08_07_o <= -1 ;    cost_08x08_17_o <= -1 ;    cost_08x08_27_o <= -1 ;    cost_08x08_37_o <= -1 ;

      cost_08x08_40_o <= -1 ;    cost_08x08_50_o <= -1 ;    cost_08x08_60_o <= -1 ;    cost_08x08_70_o <= -1 ;
      cost_08x08_41_o <= -1 ;    cost_08x08_51_o <= -1 ;    cost_08x08_61_o <= -1 ;    cost_08x08_71_o <= -1 ;
      cost_08x08_42_o <= -1 ;    cost_08x08_52_o <= -1 ;    cost_08x08_62_o <= -1 ;    cost_08x08_72_o <= -1 ;
      cost_08x08_43_o <= -1 ;    cost_08x08_53_o <= -1 ;    cost_08x08_63_o <= -1 ;    cost_08x08_73_o <= -1 ;
      cost_08x08_44_o <= -1 ;    cost_08x08_54_o <= -1 ;    cost_08x08_64_o <= -1 ;    cost_08x08_74_o <= -1 ;
      cost_08x08_45_o <= -1 ;    cost_08x08_55_o <= -1 ;    cost_08x08_65_o <= -1 ;    cost_08x08_75_o <= -1 ;
      cost_08x08_46_o <= -1 ;    cost_08x08_56_o <= -1 ;    cost_08x08_66_o <= -1 ;    cost_08x08_76_o <= -1 ;
      cost_08x08_47_o <= -1 ;    cost_08x08_57_o <= -1 ;    cost_08x08_67_o <= -1 ;    cost_08x08_77_o <= -1 ;
      // cost_08x16
      cost_08x16_00_o <= -1 ;    cost_08x16_20_o <= -1 ;    cost_08x16_40_o <= -1 ;    cost_08x16_60_o <= -1 ;
      cost_08x16_01_o <= -1 ;    cost_08x16_21_o <= -1 ;    cost_08x16_41_o <= -1 ;    cost_08x16_61_o <= -1 ;
      cost_08x16_02_o <= -1 ;    cost_08x16_22_o <= -1 ;    cost_08x16_42_o <= -1 ;    cost_08x16_62_o <= -1 ;
      cost_08x16_03_o <= -1 ;    cost_08x16_23_o <= -1 ;    cost_08x16_43_o <= -1 ;    cost_08x16_63_o <= -1 ;
      cost_08x16_04_o <= -1 ;    cost_08x16_24_o <= -1 ;    cost_08x16_44_o <= -1 ;    cost_08x16_64_o <= -1 ;
      cost_08x16_05_o <= -1 ;    cost_08x16_25_o <= -1 ;    cost_08x16_45_o <= -1 ;    cost_08x16_65_o <= -1 ;
      cost_08x16_06_o <= -1 ;    cost_08x16_26_o <= -1 ;    cost_08x16_46_o <= -1 ;    cost_08x16_66_o <= -1 ;
      cost_08x16_07_o <= -1 ;    cost_08x16_27_o <= -1 ;    cost_08x16_47_o <= -1 ;    cost_08x16_67_o <= -1 ;
      // cost_16x08
      cost_16x08_00_o <= -1 ;    cost_16x08_20_o <= -1 ;    cost_16x08_40_o <= -1 ;    cost_16x08_60_o <= -1 ;
      cost_16x08_10_o <= -1 ;    cost_16x08_30_o <= -1 ;    cost_16x08_50_o <= -1 ;    cost_16x08_70_o <= -1 ;
      cost_16x08_02_o <= -1 ;    cost_16x08_22_o <= -1 ;    cost_16x08_42_o <= -1 ;    cost_16x08_62_o <= -1 ;
      cost_16x08_12_o <= -1 ;    cost_16x08_32_o <= -1 ;    cost_16x08_52_o <= -1 ;    cost_16x08_72_o <= -1 ;
      cost_16x08_04_o <= -1 ;    cost_16x08_24_o <= -1 ;    cost_16x08_44_o <= -1 ;    cost_16x08_64_o <= -1 ;
      cost_16x08_14_o <= -1 ;    cost_16x08_34_o <= -1 ;    cost_16x08_54_o <= -1 ;    cost_16x08_74_o <= -1 ;
      cost_16x08_06_o <= -1 ;    cost_16x08_26_o <= -1 ;    cost_16x08_46_o <= -1 ;    cost_16x08_66_o <= -1 ;
      cost_16x08_16_o <= -1 ;    cost_16x08_36_o <= -1 ;    cost_16x08_56_o <= -1 ;    cost_16x08_76_o <= -1 ;
      // cost_16x16
      cost_16x16_00_o <= -1 ;    cost_16x16_20_o <= -1 ;    cost_16x16_40_o <= -1 ;    cost_16x16_60_o <= -1 ;
      cost_16x16_02_o <= -1 ;    cost_16x16_22_o <= -1 ;    cost_16x16_42_o <= -1 ;    cost_16x16_62_o <= -1 ;
      cost_16x16_04_o <= -1 ;    cost_16x16_24_o <= -1 ;    cost_16x16_44_o <= -1 ;    cost_16x16_64_o <= -1 ;
      cost_16x16_06_o <= -1 ;    cost_16x16_26_o <= -1 ;    cost_16x16_46_o <= -1 ;    cost_16x16_66_o <= -1 ;
    end
    else if( start_i ) begin
      // cost_08x08
      cost_08x08_00_o <= -1 ;    cost_08x08_10_o <= -1 ;    cost_08x08_20_o <= -1 ;    cost_08x08_30_o <= -1 ;
      cost_08x08_01_o <= -1 ;    cost_08x08_11_o <= -1 ;    cost_08x08_21_o <= -1 ;    cost_08x08_31_o <= -1 ;
      cost_08x08_02_o <= -1 ;    cost_08x08_12_o <= -1 ;    cost_08x08_22_o <= -1 ;    cost_08x08_32_o <= -1 ;
      cost_08x08_03_o <= -1 ;    cost_08x08_13_o <= -1 ;    cost_08x08_23_o <= -1 ;    cost_08x08_33_o <= -1 ;
      cost_08x08_04_o <= -1 ;    cost_08x08_14_o <= -1 ;    cost_08x08_24_o <= -1 ;    cost_08x08_34_o <= -1 ;
      cost_08x08_05_o <= -1 ;    cost_08x08_15_o <= -1 ;    cost_08x08_25_o <= -1 ;    cost_08x08_35_o <= -1 ;
      cost_08x08_06_o <= -1 ;    cost_08x08_16_o <= -1 ;    cost_08x08_26_o <= -1 ;    cost_08x08_36_o <= -1 ;
      cost_08x08_07_o <= -1 ;    cost_08x08_17_o <= -1 ;    cost_08x08_27_o <= -1 ;    cost_08x08_37_o <= -1 ;

      cost_08x08_40_o <= -1 ;    cost_08x08_50_o <= -1 ;    cost_08x08_60_o <= -1 ;    cost_08x08_70_o <= -1 ;
      cost_08x08_41_o <= -1 ;    cost_08x08_51_o <= -1 ;    cost_08x08_61_o <= -1 ;    cost_08x08_71_o <= -1 ;
      cost_08x08_42_o <= -1 ;    cost_08x08_52_o <= -1 ;    cost_08x08_62_o <= -1 ;    cost_08x08_72_o <= -1 ;
      cost_08x08_43_o <= -1 ;    cost_08x08_53_o <= -1 ;    cost_08x08_63_o <= -1 ;    cost_08x08_73_o <= -1 ;
      cost_08x08_44_o <= -1 ;    cost_08x08_54_o <= -1 ;    cost_08x08_64_o <= -1 ;    cost_08x08_74_o <= -1 ;
      cost_08x08_45_o <= -1 ;    cost_08x08_55_o <= -1 ;    cost_08x08_65_o <= -1 ;    cost_08x08_75_o <= -1 ;
      cost_08x08_46_o <= -1 ;    cost_08x08_56_o <= -1 ;    cost_08x08_66_o <= -1 ;    cost_08x08_76_o <= -1 ;
      cost_08x08_47_o <= -1 ;    cost_08x08_57_o <= -1 ;    cost_08x08_67_o <= -1 ;    cost_08x08_77_o <= -1 ;
      // cost_08x16
      cost_08x16_00_o <= -1 ;    cost_08x16_20_o <= -1 ;    cost_08x16_40_o <= -1 ;    cost_08x16_60_o <= -1 ;
      cost_08x16_01_o <= -1 ;    cost_08x16_21_o <= -1 ;    cost_08x16_41_o <= -1 ;    cost_08x16_61_o <= -1 ;
      cost_08x16_02_o <= -1 ;    cost_08x16_22_o <= -1 ;    cost_08x16_42_o <= -1 ;    cost_08x16_62_o <= -1 ;
      cost_08x16_03_o <= -1 ;    cost_08x16_23_o <= -1 ;    cost_08x16_43_o <= -1 ;    cost_08x16_63_o <= -1 ;
      cost_08x16_04_o <= -1 ;    cost_08x16_24_o <= -1 ;    cost_08x16_44_o <= -1 ;    cost_08x16_64_o <= -1 ;
      cost_08x16_05_o <= -1 ;    cost_08x16_25_o <= -1 ;    cost_08x16_45_o <= -1 ;    cost_08x16_65_o <= -1 ;
      cost_08x16_06_o <= -1 ;    cost_08x16_26_o <= -1 ;    cost_08x16_46_o <= -1 ;    cost_08x16_66_o <= -1 ;
      cost_08x16_07_o <= -1 ;    cost_08x16_27_o <= -1 ;    cost_08x16_47_o <= -1 ;    cost_08x16_67_o <= -1 ;
      // cost_16x08
      cost_16x08_00_o <= -1 ;    cost_16x08_20_o <= -1 ;    cost_16x08_40_o <= -1 ;    cost_16x08_60_o <= -1 ;
      cost_16x08_10_o <= -1 ;    cost_16x08_30_o <= -1 ;    cost_16x08_50_o <= -1 ;    cost_16x08_70_o <= -1 ;
      cost_16x08_02_o <= -1 ;    cost_16x08_22_o <= -1 ;    cost_16x08_42_o <= -1 ;    cost_16x08_62_o <= -1 ;
      cost_16x08_12_o <= -1 ;    cost_16x08_32_o <= -1 ;    cost_16x08_52_o <= -1 ;    cost_16x08_72_o <= -1 ;
      cost_16x08_04_o <= -1 ;    cost_16x08_24_o <= -1 ;    cost_16x08_44_o <= -1 ;    cost_16x08_64_o <= -1 ;
      cost_16x08_14_o <= -1 ;    cost_16x08_34_o <= -1 ;    cost_16x08_54_o <= -1 ;    cost_16x08_74_o <= -1 ;
      cost_16x08_06_o <= -1 ;    cost_16x08_26_o <= -1 ;    cost_16x08_46_o <= -1 ;    cost_16x08_66_o <= -1 ;
      cost_16x08_16_o <= -1 ;    cost_16x08_36_o <= -1 ;    cost_16x08_56_o <= -1 ;    cost_16x08_76_o <= -1 ;
      // cost_16x16
      cost_16x16_00_o <= -1 ;    cost_16x16_20_o <= -1 ;    cost_16x16_40_o <= -1 ;    cost_16x16_60_o <= -1 ;
      cost_16x16_02_o <= -1 ;    cost_16x16_22_o <= -1 ;    cost_16x16_42_o <= -1 ;    cost_16x16_62_o <= -1 ;
      cost_16x16_04_o <= -1 ;    cost_16x16_24_o <= -1 ;    cost_16x16_44_o <= -1 ;    cost_16x16_64_o <= -1 ;
      cost_16x16_06_o <= -1 ;    cost_16x16_26_o <= -1 ;    cost_16x16_46_o <= -1 ;    cost_16x16_66_o <= -1 ;
    end
    else if( val_i ) begin
      case( block_i )
        2'b00 : begin    // cost_08x08
                         if( cover_08x08_00_w )    cost_08x08_00_o <= cost_08x08_00_w ;
                         if( cover_08x08_01_w )    cost_08x08_01_o <= cost_08x08_01_w ;
                         if( cover_08x08_02_w )    cost_08x08_02_o <= cost_08x08_02_w ;
                         if( cover_08x08_03_w )    cost_08x08_03_o <= cost_08x08_03_w ;
                         if( cover_08x08_04_w )    cost_08x08_04_o <= cost_08x08_04_w ;
                         if( cover_08x08_05_w )    cost_08x08_05_o <= cost_08x08_05_w ;
                         if( cover_08x08_06_w )    cost_08x08_06_o <= cost_08x08_06_w ;
                         if( cover_08x08_07_w )    cost_08x08_07_o <= cost_08x08_07_w ;

                         if( cover_08x08_10_w )    cost_08x08_10_o <= cost_08x08_10_w ;
                         if( cover_08x08_11_w )    cost_08x08_11_o <= cost_08x08_11_w ;
                         if( cover_08x08_12_w )    cost_08x08_12_o <= cost_08x08_12_w ;
                         if( cover_08x08_13_w )    cost_08x08_13_o <= cost_08x08_13_w ;
                         if( cover_08x08_14_w )    cost_08x08_14_o <= cost_08x08_14_w ;
                         if( cover_08x08_15_w )    cost_08x08_15_o <= cost_08x08_15_w ;
                         if( cover_08x08_16_w )    cost_08x08_16_o <= cost_08x08_16_w ;
                         if( cover_08x08_17_w )    cost_08x08_17_o <= cost_08x08_17_w ;
                         // cost_08x16
                         if( cover_08x16_00_w )    cost_08x16_00_o <= cost_08x16_00_w ;
                         if( cover_08x16_01_w )    cost_08x16_01_o <= cost_08x16_01_w ;
                         if( cover_08x16_02_w )    cost_08x16_02_o <= cost_08x16_02_w ;
                         if( cover_08x16_03_w )    cost_08x16_03_o <= cost_08x16_03_w ;
                         if( cover_08x16_04_w )    cost_08x16_04_o <= cost_08x16_04_w ;
                         if( cover_08x16_05_w )    cost_08x16_05_o <= cost_08x16_05_w ;
                         if( cover_08x16_06_w )    cost_08x16_06_o <= cost_08x16_06_w ;
                         if( cover_08x16_07_w )    cost_08x16_07_o <= cost_08x16_07_w ;
                         // cost_16x08
                         if( cover_16x08_00_w )    cost_16x08_00_o <= cost_16x08_00_w ;
                         if( cover_16x08_10_w )    cost_16x08_10_o <= cost_16x08_10_w ;
                         if( cover_16x08_02_w )    cost_16x08_02_o <= cost_16x08_02_w ;
                         if( cover_16x08_12_w )    cost_16x08_12_o <= cost_16x08_12_w ;
                         if( cover_16x08_04_w )    cost_16x08_04_o <= cost_16x08_04_w ;
                         if( cover_16x08_14_w )    cost_16x08_14_o <= cost_16x08_14_w ;
                         if( cover_16x08_06_w )    cost_16x08_06_o <= cost_16x08_06_w ;
                         if( cover_16x08_16_w )    cost_16x08_16_o <= cost_16x08_16_w ;
                         // cost_16x16
                         if( cover_16x16_00_w )    cost_16x16_00_o <= cost_16x16_00_w ;
                         if( cover_16x16_02_w )    cost_16x16_02_o <= cost_16x16_02_w ;
                         if( cover_16x16_04_w )    cost_16x16_04_o <= cost_16x16_04_w ;
                         if( cover_16x16_06_w )    cost_16x16_06_o <= cost_16x16_06_w ;
                end
        2'b01 : begin    // cost_08x08
                         if( cover_08x08_20_w )    cost_08x08_20_o <= cost_08x08_00_w ;
                         if( cover_08x08_21_w )    cost_08x08_21_o <= cost_08x08_01_w ;
                         if( cover_08x08_22_w )    cost_08x08_22_o <= cost_08x08_02_w ;
                         if( cover_08x08_23_w )    cost_08x08_23_o <= cost_08x08_03_w ;
                         if( cover_08x08_24_w )    cost_08x08_24_o <= cost_08x08_04_w ;
                         if( cover_08x08_25_w )    cost_08x08_25_o <= cost_08x08_05_w ;
                         if( cover_08x08_26_w )    cost_08x08_26_o <= cost_08x08_06_w ;
                         if( cover_08x08_27_w )    cost_08x08_27_o <= cost_08x08_07_w ;

                         if( cover_08x08_30_w )    cost_08x08_30_o <= cost_08x08_10_w ;
                         if( cover_08x08_31_w )    cost_08x08_31_o <= cost_08x08_11_w ;
                         if( cover_08x08_32_w )    cost_08x08_32_o <= cost_08x08_12_w ;
                         if( cover_08x08_33_w )    cost_08x08_33_o <= cost_08x08_13_w ;
                         if( cover_08x08_34_w )    cost_08x08_34_o <= cost_08x08_14_w ;
                         if( cover_08x08_35_w )    cost_08x08_35_o <= cost_08x08_15_w ;
                         if( cover_08x08_36_w )    cost_08x08_36_o <= cost_08x08_16_w ;
                         if( cover_08x08_37_w )    cost_08x08_37_o <= cost_08x08_17_w ;
                         // cost_08x16
                         if( cover_08x16_20_w )    cost_08x16_20_o <= cost_08x16_00_w ;
                         if( cover_08x16_21_w )    cost_08x16_21_o <= cost_08x16_01_w ;
                         if( cover_08x16_22_w )    cost_08x16_22_o <= cost_08x16_02_w ;
                         if( cover_08x16_23_w )    cost_08x16_23_o <= cost_08x16_03_w ;
                         if( cover_08x16_24_w )    cost_08x16_24_o <= cost_08x16_04_w ;
                         if( cover_08x16_25_w )    cost_08x16_25_o <= cost_08x16_05_w ;
                         if( cover_08x16_26_w )    cost_08x16_26_o <= cost_08x16_06_w ;
                         if( cover_08x16_27_w )    cost_08x16_27_o <= cost_08x16_07_w ;
                         // cost_16x08
                         if( cover_16x08_20_w )    cost_16x08_20_o <= cost_16x08_00_w ;
                         if( cover_16x08_30_w )    cost_16x08_30_o <= cost_16x08_10_w ;
                         if( cover_16x08_22_w )    cost_16x08_22_o <= cost_16x08_02_w ;
                         if( cover_16x08_32_w )    cost_16x08_32_o <= cost_16x08_12_w ;
                         if( cover_16x08_24_w )    cost_16x08_24_o <= cost_16x08_04_w ;
                         if( cover_16x08_34_w )    cost_16x08_34_o <= cost_16x08_14_w ;
                         if( cover_16x08_26_w )    cost_16x08_26_o <= cost_16x08_06_w ;
                         if( cover_16x08_36_w )    cost_16x08_36_o <= cost_16x08_16_w ;
                         // cost_16x16
                         if( cover_16x16_20_w )    cost_16x16_20_o <= cost_16x16_00_w ;
                         if( cover_16x16_22_w )    cost_16x16_22_o <= cost_16x16_02_w ;
                         if( cover_16x16_24_w )    cost_16x16_24_o <= cost_16x16_04_w ;
                         if( cover_16x16_26_w )    cost_16x16_26_o <= cost_16x16_06_w ;
                end
        2'b10 : begin    // cost_08x08
                         if( cover_08x08_40_w )    cost_08x08_40_o <= cost_08x08_00_w ;
                         if( cover_08x08_41_w )    cost_08x08_41_o <= cost_08x08_01_w ;
                         if( cover_08x08_42_w )    cost_08x08_42_o <= cost_08x08_02_w ;
                         if( cover_08x08_43_w )    cost_08x08_43_o <= cost_08x08_03_w ;
                         if( cover_08x08_44_w )    cost_08x08_44_o <= cost_08x08_04_w ;
                         if( cover_08x08_45_w )    cost_08x08_45_o <= cost_08x08_05_w ;
                         if( cover_08x08_46_w )    cost_08x08_46_o <= cost_08x08_06_w ;
                         if( cover_08x08_47_w )    cost_08x08_47_o <= cost_08x08_07_w ;

                         if( cover_08x08_50_w )    cost_08x08_50_o <= cost_08x08_10_w ;
                         if( cover_08x08_51_w )    cost_08x08_51_o <= cost_08x08_11_w ;
                         if( cover_08x08_52_w )    cost_08x08_52_o <= cost_08x08_12_w ;
                         if( cover_08x08_53_w )    cost_08x08_53_o <= cost_08x08_13_w ;
                         if( cover_08x08_54_w )    cost_08x08_54_o <= cost_08x08_14_w ;
                         if( cover_08x08_55_w )    cost_08x08_55_o <= cost_08x08_15_w ;
                         if( cover_08x08_56_w )    cost_08x08_56_o <= cost_08x08_16_w ;
                         if( cover_08x08_57_w )    cost_08x08_57_o <= cost_08x08_17_w ;
                         // cost_08x16
                         if( cover_08x16_40_w )    cost_08x16_40_o <= cost_08x16_00_w ;
                         if( cover_08x16_41_w )    cost_08x16_41_o <= cost_08x16_01_w ;
                         if( cover_08x16_42_w )    cost_08x16_42_o <= cost_08x16_02_w ;
                         if( cover_08x16_43_w )    cost_08x16_43_o <= cost_08x16_03_w ;
                         if( cover_08x16_44_w )    cost_08x16_44_o <= cost_08x16_04_w ;
                         if( cover_08x16_45_w )    cost_08x16_45_o <= cost_08x16_05_w ;
                         if( cover_08x16_46_w )    cost_08x16_46_o <= cost_08x16_06_w ;
                         if( cover_08x16_47_w )    cost_08x16_47_o <= cost_08x16_07_w ;
                         // cost_16x08
                         if( cover_16x08_40_w )    cost_16x08_40_o <= cost_16x08_00_w ;
                         if( cover_16x08_50_w )    cost_16x08_50_o <= cost_16x08_10_w ;
                         if( cover_16x08_42_w )    cost_16x08_42_o <= cost_16x08_02_w ;
                         if( cover_16x08_52_w )    cost_16x08_52_o <= cost_16x08_12_w ;
                         if( cover_16x08_44_w )    cost_16x08_44_o <= cost_16x08_04_w ;
                         if( cover_16x08_54_w )    cost_16x08_54_o <= cost_16x08_14_w ;
                         if( cover_16x08_46_w )    cost_16x08_46_o <= cost_16x08_06_w ;
                         if( cover_16x08_56_w )    cost_16x08_56_o <= cost_16x08_16_w ;
                         // cost_16x16
                         if( cover_16x16_40_w )    cost_16x16_40_o <= cost_16x16_00_w ;
                         if( cover_16x16_42_w )    cost_16x16_42_o <= cost_16x16_02_w ;
                         if( cover_16x16_44_w )    cost_16x16_44_o <= cost_16x16_04_w ;
                         if( cover_16x16_46_w )    cost_16x16_46_o <= cost_16x16_06_w ;
                end
        2'b11 : begin    // cost_08x08
                         if( cover_08x08_60_w )    cost_08x08_60_o <= cost_08x08_00_w ;
                         if( cover_08x08_61_w )    cost_08x08_61_o <= cost_08x08_01_w ;
                         if( cover_08x08_62_w )    cost_08x08_62_o <= cost_08x08_02_w ;
                         if( cover_08x08_63_w )    cost_08x08_63_o <= cost_08x08_03_w ;
                         if( cover_08x08_64_w )    cost_08x08_64_o <= cost_08x08_04_w ;
                         if( cover_08x08_65_w )    cost_08x08_65_o <= cost_08x08_05_w ;
                         if( cover_08x08_66_w )    cost_08x08_66_o <= cost_08x08_06_w ;
                         if( cover_08x08_67_w )    cost_08x08_67_o <= cost_08x08_07_w ;

                         if( cover_08x08_70_w )    cost_08x08_70_o <= cost_08x08_10_w ;
                         if( cover_08x08_71_w )    cost_08x08_71_o <= cost_08x08_11_w ;
                         if( cover_08x08_72_w )    cost_08x08_72_o <= cost_08x08_12_w ;
                         if( cover_08x08_73_w )    cost_08x08_73_o <= cost_08x08_13_w ;
                         if( cover_08x08_74_w )    cost_08x08_74_o <= cost_08x08_14_w ;
                         if( cover_08x08_75_w )    cost_08x08_75_o <= cost_08x08_15_w ;
                         if( cover_08x08_76_w )    cost_08x08_76_o <= cost_08x08_16_w ;
                         if( cover_08x08_77_w )    cost_08x08_77_o <= cost_08x08_17_w ;
                         // cost_08x16
                         if( cover_08x16_60_w )    cost_08x16_60_o <= cost_08x16_00_w ;
                         if( cover_08x16_61_w )    cost_08x16_61_o <= cost_08x16_01_w ;
                         if( cover_08x16_62_w )    cost_08x16_62_o <= cost_08x16_02_w ;
                         if( cover_08x16_63_w )    cost_08x16_63_o <= cost_08x16_03_w ;
                         if( cover_08x16_64_w )    cost_08x16_64_o <= cost_08x16_04_w ;
                         if( cover_08x16_65_w )    cost_08x16_65_o <= cost_08x16_05_w ;
                         if( cover_08x16_66_w )    cost_08x16_66_o <= cost_08x16_06_w ;
                         if( cover_08x16_67_w )    cost_08x16_67_o <= cost_08x16_07_w ;
                         // cost_16x08
                         if( cover_16x08_60_w )    cost_16x08_60_o <= cost_16x08_00_w ;
                         if( cover_16x08_70_w )    cost_16x08_70_o <= cost_16x08_10_w ;
                         if( cover_16x08_62_w )    cost_16x08_62_o <= cost_16x08_02_w ;
                         if( cover_16x08_72_w )    cost_16x08_72_o <= cost_16x08_12_w ;
                         if( cover_16x08_64_w )    cost_16x08_64_o <= cost_16x08_04_w ;
                         if( cover_16x08_74_w )    cost_16x08_74_o <= cost_16x08_14_w ;
                         if( cover_16x08_66_w )    cost_16x08_66_o <= cost_16x08_06_w ;
                         if( cover_16x08_76_w )    cost_16x08_76_o <= cost_16x08_16_w ;
                         // cost_16x16
                         if( cover_16x16_60_w )    cost_16x16_60_o <= cost_16x16_00_w ;
                         if( cover_16x16_62_w )    cost_16x16_62_o <= cost_16x16_02_w ;
                         if( cover_16x16_64_w )    cost_16x16_64_o <= cost_16x16_04_w ;
                         if( cover_16x16_66_w )    cost_16x16_66_o <= cost_16x16_06_w ;
                end
      endcase
    end
    else if( update_wrk_i ) begin
      case( update_cnt_i )
        00 :    cost_16x16_00_o <= update_cst_i ;
        01 :    cost_16x16_02_o <= update_cst_i ;
        02 :    cost_16x16_20_o <= update_cst_i ;
        03 :    cost_16x16_22_o <= update_cst_i ;
        04 :    cost_16x16_04_o <= update_cst_i ;
        05 :    cost_16x16_06_o <= update_cst_i ;
        06 :    cost_16x16_24_o <= update_cst_i ;
        07 :    cost_16x16_26_o <= update_cst_i ;
        08 :    cost_16x16_40_o <= update_cst_i ;
        09 :    cost_16x16_42_o <= update_cst_i ;
        10 :    cost_16x16_60_o <= update_cst_i ;
        11 :    cost_16x16_62_o <= update_cst_i ;
        12 :    cost_16x16_44_o <= update_cst_i ;
        13 :    cost_16x16_46_o <= update_cst_i ;
        14 :    cost_16x16_64_o <= update_cst_i ;
        15 :    cost_16x16_66_o <= update_cst_i ;
      endcase
    end
  end

  // mv_x_o
  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      // mv_x_08x08
      mv_x_08x08_00_o <= 'd0 ;    mv_x_08x08_10_o <= 'd0 ;    mv_x_08x08_20_o <= 'd0 ;    mv_x_08x08_30_o <= 'd0 ;
      mv_x_08x08_01_o <= 'd0 ;    mv_x_08x08_11_o <= 'd0 ;    mv_x_08x08_21_o <= 'd0 ;    mv_x_08x08_31_o <= 'd0 ;
      mv_x_08x08_02_o <= 'd0 ;    mv_x_08x08_12_o <= 'd0 ;    mv_x_08x08_22_o <= 'd0 ;    mv_x_08x08_32_o <= 'd0 ;
      mv_x_08x08_03_o <= 'd0 ;    mv_x_08x08_13_o <= 'd0 ;    mv_x_08x08_23_o <= 'd0 ;    mv_x_08x08_33_o <= 'd0 ;
      mv_x_08x08_04_o <= 'd0 ;    mv_x_08x08_14_o <= 'd0 ;    mv_x_08x08_24_o <= 'd0 ;    mv_x_08x08_34_o <= 'd0 ;
      mv_x_08x08_05_o <= 'd0 ;    mv_x_08x08_15_o <= 'd0 ;    mv_x_08x08_25_o <= 'd0 ;    mv_x_08x08_35_o <= 'd0 ;
      mv_x_08x08_06_o <= 'd0 ;    mv_x_08x08_16_o <= 'd0 ;    mv_x_08x08_26_o <= 'd0 ;    mv_x_08x08_36_o <= 'd0 ;
      mv_x_08x08_07_o <= 'd0 ;    mv_x_08x08_17_o <= 'd0 ;    mv_x_08x08_27_o <= 'd0 ;    mv_x_08x08_37_o <= 'd0 ;

      mv_x_08x08_40_o <= 'd0 ;    mv_x_08x08_50_o <= 'd0 ;    mv_x_08x08_60_o <= 'd0 ;    mv_x_08x08_70_o <= 'd0 ;
      mv_x_08x08_41_o <= 'd0 ;    mv_x_08x08_51_o <= 'd0 ;    mv_x_08x08_61_o <= 'd0 ;    mv_x_08x08_71_o <= 'd0 ;
      mv_x_08x08_42_o <= 'd0 ;    mv_x_08x08_52_o <= 'd0 ;    mv_x_08x08_62_o <= 'd0 ;    mv_x_08x08_72_o <= 'd0 ;
      mv_x_08x08_43_o <= 'd0 ;    mv_x_08x08_53_o <= 'd0 ;    mv_x_08x08_63_o <= 'd0 ;    mv_x_08x08_73_o <= 'd0 ;
      mv_x_08x08_44_o <= 'd0 ;    mv_x_08x08_54_o <= 'd0 ;    mv_x_08x08_64_o <= 'd0 ;    mv_x_08x08_74_o <= 'd0 ;
      mv_x_08x08_45_o <= 'd0 ;    mv_x_08x08_55_o <= 'd0 ;    mv_x_08x08_65_o <= 'd0 ;    mv_x_08x08_75_o <= 'd0 ;
      mv_x_08x08_46_o <= 'd0 ;    mv_x_08x08_56_o <= 'd0 ;    mv_x_08x08_66_o <= 'd0 ;    mv_x_08x08_76_o <= 'd0 ;
      mv_x_08x08_47_o <= 'd0 ;    mv_x_08x08_57_o <= 'd0 ;    mv_x_08x08_67_o <= 'd0 ;    mv_x_08x08_77_o <= 'd0 ;
      // mv_x_08x16
      mv_x_08x16_00_o <= 'd0 ;    mv_x_08x16_20_o <= 'd0 ;    mv_x_08x16_40_o <= 'd0 ;    mv_x_08x16_60_o <= 'd0 ;
      mv_x_08x16_01_o <= 'd0 ;    mv_x_08x16_21_o <= 'd0 ;    mv_x_08x16_41_o <= 'd0 ;    mv_x_08x16_61_o <= 'd0 ;
      mv_x_08x16_02_o <= 'd0 ;    mv_x_08x16_22_o <= 'd0 ;    mv_x_08x16_42_o <= 'd0 ;    mv_x_08x16_62_o <= 'd0 ;
      mv_x_08x16_03_o <= 'd0 ;    mv_x_08x16_23_o <= 'd0 ;    mv_x_08x16_43_o <= 'd0 ;    mv_x_08x16_63_o <= 'd0 ;
      mv_x_08x16_04_o <= 'd0 ;    mv_x_08x16_24_o <= 'd0 ;    mv_x_08x16_44_o <= 'd0 ;    mv_x_08x16_64_o <= 'd0 ;
      mv_x_08x16_05_o <= 'd0 ;    mv_x_08x16_25_o <= 'd0 ;    mv_x_08x16_45_o <= 'd0 ;    mv_x_08x16_65_o <= 'd0 ;
      mv_x_08x16_06_o <= 'd0 ;    mv_x_08x16_26_o <= 'd0 ;    mv_x_08x16_46_o <= 'd0 ;    mv_x_08x16_66_o <= 'd0 ;
      mv_x_08x16_07_o <= 'd0 ;    mv_x_08x16_27_o <= 'd0 ;    mv_x_08x16_47_o <= 'd0 ;    mv_x_08x16_67_o <= 'd0 ;
      // mv_x_16x08
      mv_x_16x08_00_o <= 'd0 ;    mv_x_16x08_20_o <= 'd0 ;    mv_x_16x08_40_o <= 'd0 ;    mv_x_16x08_60_o <= 'd0 ;
      mv_x_16x08_10_o <= 'd0 ;    mv_x_16x08_30_o <= 'd0 ;    mv_x_16x08_50_o <= 'd0 ;    mv_x_16x08_70_o <= 'd0 ;
      mv_x_16x08_02_o <= 'd0 ;    mv_x_16x08_22_o <= 'd0 ;    mv_x_16x08_42_o <= 'd0 ;    mv_x_16x08_62_o <= 'd0 ;
      mv_x_16x08_12_o <= 'd0 ;    mv_x_16x08_32_o <= 'd0 ;    mv_x_16x08_52_o <= 'd0 ;    mv_x_16x08_72_o <= 'd0 ;
      mv_x_16x08_04_o <= 'd0 ;    mv_x_16x08_24_o <= 'd0 ;    mv_x_16x08_44_o <= 'd0 ;    mv_x_16x08_64_o <= 'd0 ;
      mv_x_16x08_14_o <= 'd0 ;    mv_x_16x08_34_o <= 'd0 ;    mv_x_16x08_54_o <= 'd0 ;    mv_x_16x08_74_o <= 'd0 ;
      mv_x_16x08_06_o <= 'd0 ;    mv_x_16x08_26_o <= 'd0 ;    mv_x_16x08_46_o <= 'd0 ;    mv_x_16x08_66_o <= 'd0 ;
      mv_x_16x08_16_o <= 'd0 ;    mv_x_16x08_36_o <= 'd0 ;    mv_x_16x08_56_o <= 'd0 ;    mv_x_16x08_76_o <= 'd0 ;
      // mv_x_16x16
      mv_x_16x16_00_o <= 'd0 ;    mv_x_16x16_20_o <= 'd0 ;    mv_x_16x16_40_o <= 'd0 ;    mv_x_16x16_60_o <= 'd0 ;
      mv_x_16x16_02_o <= 'd0 ;    mv_x_16x16_22_o <= 'd0 ;    mv_x_16x16_42_o <= 'd0 ;    mv_x_16x16_62_o <= 'd0 ;
      mv_x_16x16_04_o <= 'd0 ;    mv_x_16x16_24_o <= 'd0 ;    mv_x_16x16_44_o <= 'd0 ;    mv_x_16x16_64_o <= 'd0 ;
      mv_x_16x16_06_o <= 'd0 ;    mv_x_16x16_26_o <= 'd0 ;    mv_x_16x16_46_o <= 'd0 ;    mv_x_16x16_66_o <= 'd0 ;
    end
    else if( val_i ) begin
      case( block_i )
        2'b00 : begin    // mv_x_08x08
                         if( cover_08x08_00_w )    mv_x_08x08_00_o <= mv_x_08x08_i ;
                         if( cover_08x08_01_w )    mv_x_08x08_01_o <= mv_x_08x08_i ;
                         if( cover_08x08_02_w )    mv_x_08x08_02_o <= mv_x_08x08_i ;
                         if( cover_08x08_03_w )    mv_x_08x08_03_o <= mv_x_08x08_i ;
                         if( cover_08x08_04_w )    mv_x_08x08_04_o <= mv_x_08x08_i ;
                         if( cover_08x08_05_w )    mv_x_08x08_05_o <= mv_x_08x08_i ;
                         if( cover_08x08_06_w )    mv_x_08x08_06_o <= mv_x_08x08_i ;
                         if( cover_08x08_07_w )    mv_x_08x08_07_o <= mv_x_08x08_i ;

                         if( cover_08x08_10_w )    mv_x_08x08_10_o <= mv_x_08x08_i ;
                         if( cover_08x08_11_w )    mv_x_08x08_11_o <= mv_x_08x08_i ;
                         if( cover_08x08_12_w )    mv_x_08x08_12_o <= mv_x_08x08_i ;
                         if( cover_08x08_13_w )    mv_x_08x08_13_o <= mv_x_08x08_i ;
                         if( cover_08x08_14_w )    mv_x_08x08_14_o <= mv_x_08x08_i ;
                         if( cover_08x08_15_w )    mv_x_08x08_15_o <= mv_x_08x08_i ;
                         if( cover_08x08_16_w )    mv_x_08x08_16_o <= mv_x_08x08_i ;
                         if( cover_08x08_17_w )    mv_x_08x08_17_o <= mv_x_08x08_i ;
                         // mv_x_08x16
                         if( cover_08x16_00_w )    mv_x_08x16_00_o <= mv_x_08x08_i ;
                         if( cover_08x16_01_w )    mv_x_08x16_01_o <= mv_x_08x08_i ;
                         if( cover_08x16_02_w )    mv_x_08x16_02_o <= mv_x_08x08_i ;
                         if( cover_08x16_03_w )    mv_x_08x16_03_o <= mv_x_08x08_i ;
                         if( cover_08x16_04_w )    mv_x_08x16_04_o <= mv_x_08x08_i ;
                         if( cover_08x16_05_w )    mv_x_08x16_05_o <= mv_x_08x08_i ;
                         if( cover_08x16_06_w )    mv_x_08x16_06_o <= mv_x_08x08_i ;
                         if( cover_08x16_07_w )    mv_x_08x16_07_o <= mv_x_08x08_i ;
                         // mv_x_16x08
                         if( cover_16x08_00_w )    mv_x_16x08_00_o <= mv_x_08x08_i ;
                         if( cover_16x08_10_w )    mv_x_16x08_10_o <= mv_x_08x08_i ;
                         if( cover_16x08_02_w )    mv_x_16x08_02_o <= mv_x_08x08_i ;
                         if( cover_16x08_12_w )    mv_x_16x08_12_o <= mv_x_08x08_i ;
                         if( cover_16x08_04_w )    mv_x_16x08_04_o <= mv_x_08x08_i ;
                         if( cover_16x08_14_w )    mv_x_16x08_14_o <= mv_x_08x08_i ;
                         if( cover_16x08_06_w )    mv_x_16x08_06_o <= mv_x_08x08_i ;
                         if( cover_16x08_16_w )    mv_x_16x08_16_o <= mv_x_08x08_i ;
                         // mv_x_16x16
                         if( cover_16x16_00_w )    mv_x_16x16_00_o <= mv_x_08x08_i ;
                         if( cover_16x16_02_w )    mv_x_16x16_02_o <= mv_x_08x08_i ;
                         if( cover_16x16_04_w )    mv_x_16x16_04_o <= mv_x_08x08_i ;
                         if( cover_16x16_06_w )    mv_x_16x16_06_o <= mv_x_08x08_i ;
                end
        2'b01 : begin    // mv_x_08x08
                         if( cover_08x08_20_w )    mv_x_08x08_20_o <= mv_x_08x08_i ;
                         if( cover_08x08_21_w )    mv_x_08x08_21_o <= mv_x_08x08_i ;
                         if( cover_08x08_22_w )    mv_x_08x08_22_o <= mv_x_08x08_i ;
                         if( cover_08x08_23_w )    mv_x_08x08_23_o <= mv_x_08x08_i ;
                         if( cover_08x08_24_w )    mv_x_08x08_24_o <= mv_x_08x08_i ;
                         if( cover_08x08_25_w )    mv_x_08x08_25_o <= mv_x_08x08_i ;
                         if( cover_08x08_26_w )    mv_x_08x08_26_o <= mv_x_08x08_i ;
                         if( cover_08x08_27_w )    mv_x_08x08_27_o <= mv_x_08x08_i ;

                         if( cover_08x08_30_w )    mv_x_08x08_30_o <= mv_x_08x08_i ;
                         if( cover_08x08_31_w )    mv_x_08x08_31_o <= mv_x_08x08_i ;
                         if( cover_08x08_32_w )    mv_x_08x08_32_o <= mv_x_08x08_i ;
                         if( cover_08x08_33_w )    mv_x_08x08_33_o <= mv_x_08x08_i ;
                         if( cover_08x08_34_w )    mv_x_08x08_34_o <= mv_x_08x08_i ;
                         if( cover_08x08_35_w )    mv_x_08x08_35_o <= mv_x_08x08_i ;
                         if( cover_08x08_36_w )    mv_x_08x08_36_o <= mv_x_08x08_i ;
                         if( cover_08x08_37_w )    mv_x_08x08_37_o <= mv_x_08x08_i ;
                         // mv_x_08x16
                         if( cover_08x16_20_w )    mv_x_08x16_20_o <= mv_x_08x08_i ;
                         if( cover_08x16_21_w )    mv_x_08x16_21_o <= mv_x_08x08_i ;
                         if( cover_08x16_22_w )    mv_x_08x16_22_o <= mv_x_08x08_i ;
                         if( cover_08x16_23_w )    mv_x_08x16_23_o <= mv_x_08x08_i ;
                         if( cover_08x16_24_w )    mv_x_08x16_24_o <= mv_x_08x08_i ;
                         if( cover_08x16_25_w )    mv_x_08x16_25_o <= mv_x_08x08_i ;
                         if( cover_08x16_26_w )    mv_x_08x16_26_o <= mv_x_08x08_i ;
                         if( cover_08x16_27_w )    mv_x_08x16_27_o <= mv_x_08x08_i ;
                         // mv_x_16x08
                         if( cover_16x08_20_w )    mv_x_16x08_20_o <= mv_x_08x08_i ;
                         if( cover_16x08_30_w )    mv_x_16x08_30_o <= mv_x_08x08_i ;
                         if( cover_16x08_22_w )    mv_x_16x08_22_o <= mv_x_08x08_i ;
                         if( cover_16x08_32_w )    mv_x_16x08_32_o <= mv_x_08x08_i ;
                         if( cover_16x08_24_w )    mv_x_16x08_24_o <= mv_x_08x08_i ;
                         if( cover_16x08_34_w )    mv_x_16x08_34_o <= mv_x_08x08_i ;
                         if( cover_16x08_26_w )    mv_x_16x08_26_o <= mv_x_08x08_i ;
                         if( cover_16x08_36_w )    mv_x_16x08_36_o <= mv_x_08x08_i ;
                         // mv_x_16x16
                         if( cover_16x16_20_w )    mv_x_16x16_20_o <= mv_x_08x08_i ;
                         if( cover_16x16_22_w )    mv_x_16x16_22_o <= mv_x_08x08_i ;
                         if( cover_16x16_24_w )    mv_x_16x16_24_o <= mv_x_08x08_i ;
                         if( cover_16x16_26_w )    mv_x_16x16_26_o <= mv_x_08x08_i ;
                end
        2'b10 : begin    // mv_x_08x08
                         if( cover_08x08_40_w )    mv_x_08x08_40_o <= mv_x_08x08_i ;
                         if( cover_08x08_41_w )    mv_x_08x08_41_o <= mv_x_08x08_i ;
                         if( cover_08x08_42_w )    mv_x_08x08_42_o <= mv_x_08x08_i ;
                         if( cover_08x08_43_w )    mv_x_08x08_43_o <= mv_x_08x08_i ;
                         if( cover_08x08_44_w )    mv_x_08x08_44_o <= mv_x_08x08_i ;
                         if( cover_08x08_45_w )    mv_x_08x08_45_o <= mv_x_08x08_i ;
                         if( cover_08x08_46_w )    mv_x_08x08_46_o <= mv_x_08x08_i ;
                         if( cover_08x08_47_w )    mv_x_08x08_47_o <= mv_x_08x08_i ;

                         if( cover_08x08_50_w )    mv_x_08x08_50_o <= mv_x_08x08_i ;
                         if( cover_08x08_51_w )    mv_x_08x08_51_o <= mv_x_08x08_i ;
                         if( cover_08x08_52_w )    mv_x_08x08_52_o <= mv_x_08x08_i ;
                         if( cover_08x08_53_w )    mv_x_08x08_53_o <= mv_x_08x08_i ;
                         if( cover_08x08_54_w )    mv_x_08x08_54_o <= mv_x_08x08_i ;
                         if( cover_08x08_55_w )    mv_x_08x08_55_o <= mv_x_08x08_i ;
                         if( cover_08x08_56_w )    mv_x_08x08_56_o <= mv_x_08x08_i ;
                         if( cover_08x08_57_w )    mv_x_08x08_57_o <= mv_x_08x08_i ;
                         // mv_x_08x16
                         if( cover_08x16_40_w )    mv_x_08x16_40_o <= mv_x_08x08_i ;
                         if( cover_08x16_41_w )    mv_x_08x16_41_o <= mv_x_08x08_i ;
                         if( cover_08x16_42_w )    mv_x_08x16_42_o <= mv_x_08x08_i ;
                         if( cover_08x16_43_w )    mv_x_08x16_43_o <= mv_x_08x08_i ;
                         if( cover_08x16_44_w )    mv_x_08x16_44_o <= mv_x_08x08_i ;
                         if( cover_08x16_45_w )    mv_x_08x16_45_o <= mv_x_08x08_i ;
                         if( cover_08x16_46_w )    mv_x_08x16_46_o <= mv_x_08x08_i ;
                         if( cover_08x16_47_w )    mv_x_08x16_47_o <= mv_x_08x08_i ;
                         // mv_x_16x08
                         if( cover_16x08_40_w )    mv_x_16x08_40_o <= mv_x_08x08_i ;
                         if( cover_16x08_50_w )    mv_x_16x08_50_o <= mv_x_08x08_i ;
                         if( cover_16x08_42_w )    mv_x_16x08_42_o <= mv_x_08x08_i ;
                         if( cover_16x08_52_w )    mv_x_16x08_52_o <= mv_x_08x08_i ;
                         if( cover_16x08_44_w )    mv_x_16x08_44_o <= mv_x_08x08_i ;
                         if( cover_16x08_54_w )    mv_x_16x08_54_o <= mv_x_08x08_i ;
                         if( cover_16x08_46_w )    mv_x_16x08_46_o <= mv_x_08x08_i ;
                         if( cover_16x08_56_w )    mv_x_16x08_56_o <= mv_x_08x08_i ;
                         // mv_x_16x16
                         if( cover_16x16_40_w )    mv_x_16x16_40_o <= mv_x_08x08_i ;
                         if( cover_16x16_42_w )    mv_x_16x16_42_o <= mv_x_08x08_i ;
                         if( cover_16x16_44_w )    mv_x_16x16_44_o <= mv_x_08x08_i ;
                         if( cover_16x16_46_w )    mv_x_16x16_46_o <= mv_x_08x08_i ;
                end
        2'b11 : begin    // mv_x_08x08
                         if( cover_08x08_60_w )    mv_x_08x08_60_o <= mv_x_08x08_i ;
                         if( cover_08x08_61_w )    mv_x_08x08_61_o <= mv_x_08x08_i ;
                         if( cover_08x08_62_w )    mv_x_08x08_62_o <= mv_x_08x08_i ;
                         if( cover_08x08_63_w )    mv_x_08x08_63_o <= mv_x_08x08_i ;
                         if( cover_08x08_64_w )    mv_x_08x08_64_o <= mv_x_08x08_i ;
                         if( cover_08x08_65_w )    mv_x_08x08_65_o <= mv_x_08x08_i ;
                         if( cover_08x08_66_w )    mv_x_08x08_66_o <= mv_x_08x08_i ;
                         if( cover_08x08_67_w )    mv_x_08x08_67_o <= mv_x_08x08_i ;

                         if( cover_08x08_70_w )    mv_x_08x08_70_o <= mv_x_08x08_i ;
                         if( cover_08x08_71_w )    mv_x_08x08_71_o <= mv_x_08x08_i ;
                         if( cover_08x08_72_w )    mv_x_08x08_72_o <= mv_x_08x08_i ;
                         if( cover_08x08_73_w )    mv_x_08x08_73_o <= mv_x_08x08_i ;
                         if( cover_08x08_74_w )    mv_x_08x08_74_o <= mv_x_08x08_i ;
                         if( cover_08x08_75_w )    mv_x_08x08_75_o <= mv_x_08x08_i ;
                         if( cover_08x08_76_w )    mv_x_08x08_76_o <= mv_x_08x08_i ;
                         if( cover_08x08_77_w )    mv_x_08x08_77_o <= mv_x_08x08_i ;
                         // mv_x_08x16
                         if( cover_08x16_60_w )    mv_x_08x16_60_o <= mv_x_08x08_i ;
                         if( cover_08x16_61_w )    mv_x_08x16_61_o <= mv_x_08x08_i ;
                         if( cover_08x16_62_w )    mv_x_08x16_62_o <= mv_x_08x08_i ;
                         if( cover_08x16_63_w )    mv_x_08x16_63_o <= mv_x_08x08_i ;
                         if( cover_08x16_64_w )    mv_x_08x16_64_o <= mv_x_08x08_i ;
                         if( cover_08x16_65_w )    mv_x_08x16_65_o <= mv_x_08x08_i ;
                         if( cover_08x16_66_w )    mv_x_08x16_66_o <= mv_x_08x08_i ;
                         if( cover_08x16_67_w )    mv_x_08x16_67_o <= mv_x_08x08_i ;
                         // mv_x_16x08
                         if( cover_16x08_60_w )    mv_x_16x08_60_o <= mv_x_08x08_i ;
                         if( cover_16x08_70_w )    mv_x_16x08_70_o <= mv_x_08x08_i ;
                         if( cover_16x08_62_w )    mv_x_16x08_62_o <= mv_x_08x08_i ;
                         if( cover_16x08_72_w )    mv_x_16x08_72_o <= mv_x_08x08_i ;
                         if( cover_16x08_64_w )    mv_x_16x08_64_o <= mv_x_08x08_i ;
                         if( cover_16x08_74_w )    mv_x_16x08_74_o <= mv_x_08x08_i ;
                         if( cover_16x08_66_w )    mv_x_16x08_66_o <= mv_x_08x08_i ;
                         if( cover_16x08_76_w )    mv_x_16x08_76_o <= mv_x_08x08_i ;
                         // mv_x_16x16
                         if( cover_16x16_60_w )    mv_x_16x16_60_o <= mv_x_08x08_i ;
                         if( cover_16x16_62_w )    mv_x_16x16_62_o <= mv_x_08x08_i ;
                         if( cover_16x16_64_w )    mv_x_16x16_64_o <= mv_x_08x08_i ;
                         if( cover_16x16_66_w )    mv_x_16x16_66_o <= mv_x_08x08_i ;
                end
      endcase
    end
  end

  // mv_y_o
  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      // mv_y_08x08
      mv_y_08x08_00_o <= 'd0 ;    mv_y_08x08_10_o <= 'd0 ;    mv_y_08x08_20_o <= 'd0 ;    mv_y_08x08_30_o <= 'd0 ;
      mv_y_08x08_01_o <= 'd0 ;    mv_y_08x08_11_o <= 'd0 ;    mv_y_08x08_21_o <= 'd0 ;    mv_y_08x08_31_o <= 'd0 ;
      mv_y_08x08_02_o <= 'd0 ;    mv_y_08x08_12_o <= 'd0 ;    mv_y_08x08_22_o <= 'd0 ;    mv_y_08x08_32_o <= 'd0 ;
      mv_y_08x08_03_o <= 'd0 ;    mv_y_08x08_13_o <= 'd0 ;    mv_y_08x08_23_o <= 'd0 ;    mv_y_08x08_33_o <= 'd0 ;
      mv_y_08x08_04_o <= 'd0 ;    mv_y_08x08_14_o <= 'd0 ;    mv_y_08x08_24_o <= 'd0 ;    mv_y_08x08_34_o <= 'd0 ;
      mv_y_08x08_05_o <= 'd0 ;    mv_y_08x08_15_o <= 'd0 ;    mv_y_08x08_25_o <= 'd0 ;    mv_y_08x08_35_o <= 'd0 ;
      mv_y_08x08_06_o <= 'd0 ;    mv_y_08x08_16_o <= 'd0 ;    mv_y_08x08_26_o <= 'd0 ;    mv_y_08x08_36_o <= 'd0 ;
      mv_y_08x08_07_o <= 'd0 ;    mv_y_08x08_17_o <= 'd0 ;    mv_y_08x08_27_o <= 'd0 ;    mv_y_08x08_37_o <= 'd0 ;

      mv_y_08x08_40_o <= 'd0 ;    mv_y_08x08_50_o <= 'd0 ;    mv_y_08x08_60_o <= 'd0 ;    mv_y_08x08_70_o <= 'd0 ;
      mv_y_08x08_41_o <= 'd0 ;    mv_y_08x08_51_o <= 'd0 ;    mv_y_08x08_61_o <= 'd0 ;    mv_y_08x08_71_o <= 'd0 ;
      mv_y_08x08_42_o <= 'd0 ;    mv_y_08x08_52_o <= 'd0 ;    mv_y_08x08_62_o <= 'd0 ;    mv_y_08x08_72_o <= 'd0 ;
      mv_y_08x08_43_o <= 'd0 ;    mv_y_08x08_53_o <= 'd0 ;    mv_y_08x08_63_o <= 'd0 ;    mv_y_08x08_73_o <= 'd0 ;
      mv_y_08x08_44_o <= 'd0 ;    mv_y_08x08_54_o <= 'd0 ;    mv_y_08x08_64_o <= 'd0 ;    mv_y_08x08_74_o <= 'd0 ;
      mv_y_08x08_45_o <= 'd0 ;    mv_y_08x08_55_o <= 'd0 ;    mv_y_08x08_65_o <= 'd0 ;    mv_y_08x08_75_o <= 'd0 ;
      mv_y_08x08_46_o <= 'd0 ;    mv_y_08x08_56_o <= 'd0 ;    mv_y_08x08_66_o <= 'd0 ;    mv_y_08x08_76_o <= 'd0 ;
      mv_y_08x08_47_o <= 'd0 ;    mv_y_08x08_57_o <= 'd0 ;    mv_y_08x08_67_o <= 'd0 ;    mv_y_08x08_77_o <= 'd0 ;
      // mv_y_08x16
      mv_y_08x16_00_o <= 'd0 ;    mv_y_08x16_20_o <= 'd0 ;    mv_y_08x16_40_o <= 'd0 ;    mv_y_08x16_60_o <= 'd0 ;
      mv_y_08x16_01_o <= 'd0 ;    mv_y_08x16_21_o <= 'd0 ;    mv_y_08x16_41_o <= 'd0 ;    mv_y_08x16_61_o <= 'd0 ;
      mv_y_08x16_02_o <= 'd0 ;    mv_y_08x16_22_o <= 'd0 ;    mv_y_08x16_42_o <= 'd0 ;    mv_y_08x16_62_o <= 'd0 ;
      mv_y_08x16_03_o <= 'd0 ;    mv_y_08x16_23_o <= 'd0 ;    mv_y_08x16_43_o <= 'd0 ;    mv_y_08x16_63_o <= 'd0 ;
      mv_y_08x16_04_o <= 'd0 ;    mv_y_08x16_24_o <= 'd0 ;    mv_y_08x16_44_o <= 'd0 ;    mv_y_08x16_64_o <= 'd0 ;
      mv_y_08x16_05_o <= 'd0 ;    mv_y_08x16_25_o <= 'd0 ;    mv_y_08x16_45_o <= 'd0 ;    mv_y_08x16_65_o <= 'd0 ;
      mv_y_08x16_06_o <= 'd0 ;    mv_y_08x16_26_o <= 'd0 ;    mv_y_08x16_46_o <= 'd0 ;    mv_y_08x16_66_o <= 'd0 ;
      mv_y_08x16_07_o <= 'd0 ;    mv_y_08x16_27_o <= 'd0 ;    mv_y_08x16_47_o <= 'd0 ;    mv_y_08x16_67_o <= 'd0 ;
      // mv_y_16x08
      mv_y_16x08_00_o <= 'd0 ;    mv_y_16x08_20_o <= 'd0 ;    mv_y_16x08_40_o <= 'd0 ;    mv_y_16x08_60_o <= 'd0 ;
      mv_y_16x08_10_o <= 'd0 ;    mv_y_16x08_30_o <= 'd0 ;    mv_y_16x08_50_o <= 'd0 ;    mv_y_16x08_70_o <= 'd0 ;
      mv_y_16x08_02_o <= 'd0 ;    mv_y_16x08_22_o <= 'd0 ;    mv_y_16x08_42_o <= 'd0 ;    mv_y_16x08_62_o <= 'd0 ;
      mv_y_16x08_12_o <= 'd0 ;    mv_y_16x08_32_o <= 'd0 ;    mv_y_16x08_52_o <= 'd0 ;    mv_y_16x08_72_o <= 'd0 ;
      mv_y_16x08_04_o <= 'd0 ;    mv_y_16x08_24_o <= 'd0 ;    mv_y_16x08_44_o <= 'd0 ;    mv_y_16x08_64_o <= 'd0 ;
      mv_y_16x08_14_o <= 'd0 ;    mv_y_16x08_34_o <= 'd0 ;    mv_y_16x08_54_o <= 'd0 ;    mv_y_16x08_74_o <= 'd0 ;
      mv_y_16x08_06_o <= 'd0 ;    mv_y_16x08_26_o <= 'd0 ;    mv_y_16x08_46_o <= 'd0 ;    mv_y_16x08_66_o <= 'd0 ;
      mv_y_16x08_16_o <= 'd0 ;    mv_y_16x08_36_o <= 'd0 ;    mv_y_16x08_56_o <= 'd0 ;    mv_y_16x08_76_o <= 'd0 ;
      // mv_y_16x16
      mv_y_16x16_00_o <= 'd0 ;    mv_y_16x16_20_o <= 'd0 ;    mv_y_16x16_40_o <= 'd0 ;    mv_y_16x16_60_o <= 'd0 ;
      mv_y_16x16_02_o <= 'd0 ;    mv_y_16x16_22_o <= 'd0 ;    mv_y_16x16_42_o <= 'd0 ;    mv_y_16x16_62_o <= 'd0 ;
      mv_y_16x16_04_o <= 'd0 ;    mv_y_16x16_24_o <= 'd0 ;    mv_y_16x16_44_o <= 'd0 ;    mv_y_16x16_64_o <= 'd0 ;
      mv_y_16x16_06_o <= 'd0 ;    mv_y_16x16_26_o <= 'd0 ;    mv_y_16x16_46_o <= 'd0 ;    mv_y_16x16_66_o <= 'd0 ;
    end
    else if( val_i ) begin
      case( block_i )
        2'b00 : begin    // mv_y_08x08
                         if( cover_08x08_00_w )    mv_y_08x08_00_o <= mv_y_08x08_i ;
                         if( cover_08x08_01_w )    mv_y_08x08_01_o <= mv_y_08x08_i ;
                         if( cover_08x08_02_w )    mv_y_08x08_02_o <= mv_y_08x08_i ;
                         if( cover_08x08_03_w )    mv_y_08x08_03_o <= mv_y_08x08_i ;
                         if( cover_08x08_04_w )    mv_y_08x08_04_o <= mv_y_08x08_i ;
                         if( cover_08x08_05_w )    mv_y_08x08_05_o <= mv_y_08x08_i ;
                         if( cover_08x08_06_w )    mv_y_08x08_06_o <= mv_y_08x08_i ;
                         if( cover_08x08_07_w )    mv_y_08x08_07_o <= mv_y_08x08_i ;

                         if( cover_08x08_10_w )    mv_y_08x08_10_o <= mv_y_08x08_i ;
                         if( cover_08x08_11_w )    mv_y_08x08_11_o <= mv_y_08x08_i ;
                         if( cover_08x08_12_w )    mv_y_08x08_12_o <= mv_y_08x08_i ;
                         if( cover_08x08_13_w )    mv_y_08x08_13_o <= mv_y_08x08_i ;
                         if( cover_08x08_14_w )    mv_y_08x08_14_o <= mv_y_08x08_i ;
                         if( cover_08x08_15_w )    mv_y_08x08_15_o <= mv_y_08x08_i ;
                         if( cover_08x08_16_w )    mv_y_08x08_16_o <= mv_y_08x08_i ;
                         if( cover_08x08_17_w )    mv_y_08x08_17_o <= mv_y_08x08_i ;
                         // mv_y_08x16
                         if( cover_08x16_00_w )    mv_y_08x16_00_o <= mv_y_08x08_i ;
                         if( cover_08x16_01_w )    mv_y_08x16_01_o <= mv_y_08x08_i ;
                         if( cover_08x16_02_w )    mv_y_08x16_02_o <= mv_y_08x08_i ;
                         if( cover_08x16_03_w )    mv_y_08x16_03_o <= mv_y_08x08_i ;
                         if( cover_08x16_04_w )    mv_y_08x16_04_o <= mv_y_08x08_i ;
                         if( cover_08x16_05_w )    mv_y_08x16_05_o <= mv_y_08x08_i ;
                         if( cover_08x16_06_w )    mv_y_08x16_06_o <= mv_y_08x08_i ;
                         if( cover_08x16_07_w )    mv_y_08x16_07_o <= mv_y_08x08_i ;
                         // mv_y_16x08
                         if( cover_16x08_00_w )    mv_y_16x08_00_o <= mv_y_08x08_i ;
                         if( cover_16x08_10_w )    mv_y_16x08_10_o <= mv_y_08x08_i ;
                         if( cover_16x08_02_w )    mv_y_16x08_02_o <= mv_y_08x08_i ;
                         if( cover_16x08_12_w )    mv_y_16x08_12_o <= mv_y_08x08_i ;
                         if( cover_16x08_04_w )    mv_y_16x08_04_o <= mv_y_08x08_i ;
                         if( cover_16x08_14_w )    mv_y_16x08_14_o <= mv_y_08x08_i ;
                         if( cover_16x08_06_w )    mv_y_16x08_06_o <= mv_y_08x08_i ;
                         if( cover_16x08_16_w )    mv_y_16x08_16_o <= mv_y_08x08_i ;
                         // mv_y_16x16
                         if( cover_16x16_00_w )    mv_y_16x16_00_o <= mv_y_08x08_i ;
                         if( cover_16x16_02_w )    mv_y_16x16_02_o <= mv_y_08x08_i ;
                         if( cover_16x16_04_w )    mv_y_16x16_04_o <= mv_y_08x08_i ;
                         if( cover_16x16_06_w )    mv_y_16x16_06_o <= mv_y_08x08_i ;
                end
        2'b01 : begin    // mv_y_08x08
                         if( cover_08x08_20_w )    mv_y_08x08_20_o <= mv_y_08x08_i ;
                         if( cover_08x08_21_w )    mv_y_08x08_21_o <= mv_y_08x08_i ;
                         if( cover_08x08_22_w )    mv_y_08x08_22_o <= mv_y_08x08_i ;
                         if( cover_08x08_23_w )    mv_y_08x08_23_o <= mv_y_08x08_i ;
                         if( cover_08x08_24_w )    mv_y_08x08_24_o <= mv_y_08x08_i ;
                         if( cover_08x08_25_w )    mv_y_08x08_25_o <= mv_y_08x08_i ;
                         if( cover_08x08_26_w )    mv_y_08x08_26_o <= mv_y_08x08_i ;
                         if( cover_08x08_27_w )    mv_y_08x08_27_o <= mv_y_08x08_i ;

                         if( cover_08x08_30_w )    mv_y_08x08_30_o <= mv_y_08x08_i ;
                         if( cover_08x08_31_w )    mv_y_08x08_31_o <= mv_y_08x08_i ;
                         if( cover_08x08_32_w )    mv_y_08x08_32_o <= mv_y_08x08_i ;
                         if( cover_08x08_33_w )    mv_y_08x08_33_o <= mv_y_08x08_i ;
                         if( cover_08x08_34_w )    mv_y_08x08_34_o <= mv_y_08x08_i ;
                         if( cover_08x08_35_w )    mv_y_08x08_35_o <= mv_y_08x08_i ;
                         if( cover_08x08_36_w )    mv_y_08x08_36_o <= mv_y_08x08_i ;
                         if( cover_08x08_37_w )    mv_y_08x08_37_o <= mv_y_08x08_i ;
                         // mv_y_08x16
                         if( cover_08x16_20_w )    mv_y_08x16_20_o <= mv_y_08x08_i ;
                         if( cover_08x16_21_w )    mv_y_08x16_21_o <= mv_y_08x08_i ;
                         if( cover_08x16_22_w )    mv_y_08x16_22_o <= mv_y_08x08_i ;
                         if( cover_08x16_23_w )    mv_y_08x16_23_o <= mv_y_08x08_i ;
                         if( cover_08x16_24_w )    mv_y_08x16_24_o <= mv_y_08x08_i ;
                         if( cover_08x16_25_w )    mv_y_08x16_25_o <= mv_y_08x08_i ;
                         if( cover_08x16_26_w )    mv_y_08x16_26_o <= mv_y_08x08_i ;
                         if( cover_08x16_27_w )    mv_y_08x16_27_o <= mv_y_08x08_i ;
                         // mv_y_16x08
                         if( cover_16x08_20_w )    mv_y_16x08_20_o <= mv_y_08x08_i ;
                         if( cover_16x08_30_w )    mv_y_16x08_30_o <= mv_y_08x08_i ;
                         if( cover_16x08_22_w )    mv_y_16x08_22_o <= mv_y_08x08_i ;
                         if( cover_16x08_32_w )    mv_y_16x08_32_o <= mv_y_08x08_i ;
                         if( cover_16x08_24_w )    mv_y_16x08_24_o <= mv_y_08x08_i ;
                         if( cover_16x08_34_w )    mv_y_16x08_34_o <= mv_y_08x08_i ;
                         if( cover_16x08_26_w )    mv_y_16x08_26_o <= mv_y_08x08_i ;
                         if( cover_16x08_36_w )    mv_y_16x08_36_o <= mv_y_08x08_i ;
                         // mv_y_16x16
                         if( cover_16x16_20_w )    mv_y_16x16_20_o <= mv_y_08x08_i ;
                         if( cover_16x16_22_w )    mv_y_16x16_22_o <= mv_y_08x08_i ;
                         if( cover_16x16_24_w )    mv_y_16x16_24_o <= mv_y_08x08_i ;
                         if( cover_16x16_26_w )    mv_y_16x16_26_o <= mv_y_08x08_i ;
                end
        2'b10 : begin    // mv_y_08x08
                         if( cover_08x08_40_w )    mv_y_08x08_40_o <= mv_y_08x08_i ;
                         if( cover_08x08_41_w )    mv_y_08x08_41_o <= mv_y_08x08_i ;
                         if( cover_08x08_42_w )    mv_y_08x08_42_o <= mv_y_08x08_i ;
                         if( cover_08x08_43_w )    mv_y_08x08_43_o <= mv_y_08x08_i ;
                         if( cover_08x08_44_w )    mv_y_08x08_44_o <= mv_y_08x08_i ;
                         if( cover_08x08_45_w )    mv_y_08x08_45_o <= mv_y_08x08_i ;
                         if( cover_08x08_46_w )    mv_y_08x08_46_o <= mv_y_08x08_i ;
                         if( cover_08x08_47_w )    mv_y_08x08_47_o <= mv_y_08x08_i ;

                         if( cover_08x08_50_w )    mv_y_08x08_50_o <= mv_y_08x08_i ;
                         if( cover_08x08_51_w )    mv_y_08x08_51_o <= mv_y_08x08_i ;
                         if( cover_08x08_52_w )    mv_y_08x08_52_o <= mv_y_08x08_i ;
                         if( cover_08x08_53_w )    mv_y_08x08_53_o <= mv_y_08x08_i ;
                         if( cover_08x08_54_w )    mv_y_08x08_54_o <= mv_y_08x08_i ;
                         if( cover_08x08_55_w )    mv_y_08x08_55_o <= mv_y_08x08_i ;
                         if( cover_08x08_56_w )    mv_y_08x08_56_o <= mv_y_08x08_i ;
                         if( cover_08x08_57_w )    mv_y_08x08_57_o <= mv_y_08x08_i ;
                         // mv_y_08x16
                         if( cover_08x16_40_w )    mv_y_08x16_40_o <= mv_y_08x08_i ;
                         if( cover_08x16_41_w )    mv_y_08x16_41_o <= mv_y_08x08_i ;
                         if( cover_08x16_42_w )    mv_y_08x16_42_o <= mv_y_08x08_i ;
                         if( cover_08x16_43_w )    mv_y_08x16_43_o <= mv_y_08x08_i ;
                         if( cover_08x16_44_w )    mv_y_08x16_44_o <= mv_y_08x08_i ;
                         if( cover_08x16_45_w )    mv_y_08x16_45_o <= mv_y_08x08_i ;
                         if( cover_08x16_46_w )    mv_y_08x16_46_o <= mv_y_08x08_i ;
                         if( cover_08x16_47_w )    mv_y_08x16_47_o <= mv_y_08x08_i ;
                         // mv_y_16x08
                         if( cover_16x08_40_w )    mv_y_16x08_40_o <= mv_y_08x08_i ;
                         if( cover_16x08_50_w )    mv_y_16x08_50_o <= mv_y_08x08_i ;
                         if( cover_16x08_42_w )    mv_y_16x08_42_o <= mv_y_08x08_i ;
                         if( cover_16x08_52_w )    mv_y_16x08_52_o <= mv_y_08x08_i ;
                         if( cover_16x08_44_w )    mv_y_16x08_44_o <= mv_y_08x08_i ;
                         if( cover_16x08_54_w )    mv_y_16x08_54_o <= mv_y_08x08_i ;
                         if( cover_16x08_46_w )    mv_y_16x08_46_o <= mv_y_08x08_i ;
                         if( cover_16x08_56_w )    mv_y_16x08_56_o <= mv_y_08x08_i ;
                         // mv_y_16x16
                         if( cover_16x16_40_w )    mv_y_16x16_40_o <= mv_y_08x08_i ;
                         if( cover_16x16_42_w )    mv_y_16x16_42_o <= mv_y_08x08_i ;
                         if( cover_16x16_44_w )    mv_y_16x16_44_o <= mv_y_08x08_i ;
                         if( cover_16x16_46_w )    mv_y_16x16_46_o <= mv_y_08x08_i ;
                end
        2'b11 : begin    // mv_y_08x08
                         if( cover_08x08_60_w )    mv_y_08x08_60_o <= mv_y_08x08_i ;
                         if( cover_08x08_61_w )    mv_y_08x08_61_o <= mv_y_08x08_i ;
                         if( cover_08x08_62_w )    mv_y_08x08_62_o <= mv_y_08x08_i ;
                         if( cover_08x08_63_w )    mv_y_08x08_63_o <= mv_y_08x08_i ;
                         if( cover_08x08_64_w )    mv_y_08x08_64_o <= mv_y_08x08_i ;
                         if( cover_08x08_65_w )    mv_y_08x08_65_o <= mv_y_08x08_i ;
                         if( cover_08x08_66_w )    mv_y_08x08_66_o <= mv_y_08x08_i ;
                         if( cover_08x08_67_w )    mv_y_08x08_67_o <= mv_y_08x08_i ;

                         if( cover_08x08_70_w )    mv_y_08x08_70_o <= mv_y_08x08_i ;
                         if( cover_08x08_71_w )    mv_y_08x08_71_o <= mv_y_08x08_i ;
                         if( cover_08x08_72_w )    mv_y_08x08_72_o <= mv_y_08x08_i ;
                         if( cover_08x08_73_w )    mv_y_08x08_73_o <= mv_y_08x08_i ;
                         if( cover_08x08_74_w )    mv_y_08x08_74_o <= mv_y_08x08_i ;
                         if( cover_08x08_75_w )    mv_y_08x08_75_o <= mv_y_08x08_i ;
                         if( cover_08x08_76_w )    mv_y_08x08_76_o <= mv_y_08x08_i ;
                         if( cover_08x08_77_w )    mv_y_08x08_77_o <= mv_y_08x08_i ;
                         // mv_y_08x16
                         if( cover_08x16_60_w )    mv_y_08x16_60_o <= mv_y_08x08_i ;
                         if( cover_08x16_61_w )    mv_y_08x16_61_o <= mv_y_08x08_i ;
                         if( cover_08x16_62_w )    mv_y_08x16_62_o <= mv_y_08x08_i ;
                         if( cover_08x16_63_w )    mv_y_08x16_63_o <= mv_y_08x08_i ;
                         if( cover_08x16_64_w )    mv_y_08x16_64_o <= mv_y_08x08_i ;
                         if( cover_08x16_65_w )    mv_y_08x16_65_o <= mv_y_08x08_i ;
                         if( cover_08x16_66_w )    mv_y_08x16_66_o <= mv_y_08x08_i ;
                         if( cover_08x16_67_w )    mv_y_08x16_67_o <= mv_y_08x08_i ;
                         // mv_y_16x08
                         if( cover_16x08_60_w )    mv_y_16x08_60_o <= mv_y_08x08_i ;
                         if( cover_16x08_70_w )    mv_y_16x08_70_o <= mv_y_08x08_i ;
                         if( cover_16x08_62_w )    mv_y_16x08_62_o <= mv_y_08x08_i ;
                         if( cover_16x08_72_w )    mv_y_16x08_72_o <= mv_y_08x08_i ;
                         if( cover_16x08_64_w )    mv_y_16x08_64_o <= mv_y_08x08_i ;
                         if( cover_16x08_74_w )    mv_y_16x08_74_o <= mv_y_08x08_i ;
                         if( cover_16x08_66_w )    mv_y_16x08_66_o <= mv_y_08x08_i ;
                         if( cover_16x08_76_w )    mv_y_16x08_76_o <= mv_y_08x08_i ;
                         // mv_y_16x16
                         if( cover_16x16_60_w )    mv_y_16x16_60_o <= mv_y_08x08_i ;
                         if( cover_16x16_62_w )    mv_y_16x16_62_o <= mv_y_08x08_i ;
                         if( cover_16x16_64_w )    mv_y_16x16_64_o <= mv_y_08x08_i ;
                         if( cover_16x16_66_w )    mv_y_16x16_66_o <= mv_y_08x08_i ;
                end
      endcase
    end
  end


//*** DEBUG ********************************************************************


endmodule