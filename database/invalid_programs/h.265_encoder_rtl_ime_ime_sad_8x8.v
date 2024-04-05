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
//  Filename      : ime_sad_8x8.v
//  Author        : Huang Lei Lei
//  Created       : 2014-12-08
//  Description   : calculate the SAD value of a 8x8 matrix
//
//-------------------------------------------------------------------

`include "enc_defines.v"

module ime_sad_8x8 (
  // global
  clk         , rstn        ,
  // ena_i
  enable_i    ,
  // ori_i
  ori_i       ,

/*
  ori_00_i    , ori_10_i    , ori_20_i    , ori_30_i    , ori_40_i    , ori_50_i    , ori_60_i    , ori_70_i    ,
  ori_01_i    , ori_11_i    , ori_21_i    , ori_31_i    , ori_41_i    , ori_51_i    , ori_61_i    , ori_71_i    ,
  ori_02_i    , ori_12_i    , ori_22_i    , ori_32_i    , ori_42_i    , ori_52_i    , ori_62_i    , ori_72_i    ,
  ori_03_i    , ori_13_i    , ori_23_i    , ori_33_i    , ori_43_i    , ori_53_i    , ori_63_i    , ori_73_i    ,
  ori_04_i    , ori_14_i    , ori_24_i    , ori_34_i    , ori_44_i    , ori_54_i    , ori_64_i    , ori_74_i    ,
  ori_05_i    , ori_15_i    , ori_25_i    , ori_35_i    , ori_45_i    , ori_55_i    , ori_65_i    , ori_75_i    ,
  ori_06_i    , ori_16_i    , ori_26_i    , ori_36_i    , ori_46_i    , ori_56_i    , ori_66_i    , ori_76_i    ,
  ori_07_i    , ori_17_i    , ori_27_i    , ori_37_i    , ori_47_i    , ori_57_i    , ori_67_i    , ori_77_i    ,
*/
  // ref_i
  ref_i       ,

/*
  ref_00_i    , ref_10_i    , ref_20_i    , ref_30_i    , ref_40_i    , ref_50_i    , ref_60_i    , ref_70_i    ,
  ref_01_i    , ref_11_i    , ref_21_i    , ref_31_i    , ref_41_i    , ref_51_i    , ref_61_i    , ref_71_i    ,
  ref_02_i    , ref_12_i    , ref_22_i    , ref_32_i    , ref_42_i    , ref_52_i    , ref_62_i    , ref_72_i    ,
  ref_03_i    , ref_13_i    , ref_23_i    , ref_33_i    , ref_43_i    , ref_53_i    , ref_63_i    , ref_73_i    ,
  ref_04_i    , ref_14_i    , ref_24_i    , ref_34_i    , ref_44_i    , ref_54_i    , ref_64_i    , ref_74_i    ,
  ref_05_i    , ref_15_i    , ref_25_i    , ref_35_i    , ref_45_i    , ref_55_i    , ref_65_i    , ref_75_i    ,
  ref_06_i    , ref_16_i    , ref_26_i    , ref_36_i    , ref_46_i    , ref_56_i    , ref_66_i    , ref_76_i    ,
  ref_07_i    , ref_17_i    , ref_27_i    , ref_37_i    , ref_47_i    , ref_57_i    , ref_67_i    , ref_77_i    ,
*/

/*
  // val_o
  val_o       ,
*/

  // sad_o
  sad_o
  );


//*** PARAMETER DECLARATION ****************************************************


//*** INPUT/OUTPUT DECLARATION *************************************************

  // global
  input                                 clk         ;
  input                                 rstn        ;

  // ena_i
  input                                 enable_i    ;

  // ori_i
  input      [`PIXEL_WIDTH*64-1 : 0]    ori_i       ;

/*
  input      [`PIXEL_WIDTH-1 : 0]    ori_00_i    , ori_10_i    , ori_20_i    , ori_30_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_01_i    , ori_11_i    , ori_21_i    , ori_31_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_02_i    , ori_12_i    , ori_22_i    , ori_32_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_03_i    , ori_13_i    , ori_23_i    , ori_33_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_04_i    , ori_14_i    , ori_24_i    , ori_34_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_05_i    , ori_15_i    , ori_25_i    , ori_35_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_06_i    , ori_16_i    , ori_26_i    , ori_36_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_07_i    , ori_17_i    , ori_27_i    , ori_37_i    ;

  input      [`PIXEL_WIDTH-1 : 0]    ori_40_i    , ori_50_i    , ori_60_i    , ori_70_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_41_i    , ori_51_i    , ori_61_i    , ori_71_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_42_i    , ori_52_i    , ori_62_i    , ori_72_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_43_i    , ori_53_i    , ori_63_i    , ori_73_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_44_i    , ori_54_i    , ori_64_i    , ori_74_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_45_i    , ori_55_i    , ori_65_i    , ori_75_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_46_i    , ori_56_i    , ori_66_i    , ori_76_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ori_47_i    , ori_57_i    , ori_67_i    , ori_77_i    ;
*/

  // ref_i
  input      [`PIXEL_WIDTH*64-1 : 0]    ref_i       ;

/*
  input      [`PIXEL_WIDTH-1 : 0]    ref_00_i    , ref_10_i    , ref_20_i    , ref_30_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_01_i    , ref_11_i    , ref_21_i    , ref_31_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_02_i    , ref_12_i    , ref_22_i    , ref_32_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_03_i    , ref_13_i    , ref_23_i    , ref_33_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_04_i    , ref_14_i    , ref_24_i    , ref_34_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_05_i    , ref_15_i    , ref_25_i    , ref_35_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_06_i    , ref_16_i    , ref_26_i    , ref_36_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_07_i    , ref_17_i    , ref_27_i    , ref_37_i    ;

  input      [`PIXEL_WIDTH-1 : 0]    ref_40_i    , ref_50_i    , ref_60_i    , ref_70_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_41_i    , ref_51_i    , ref_61_i    , ref_71_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_42_i    , ref_52_i    , ref_62_i    , ref_72_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_43_i    , ref_53_i    , ref_63_i    , ref_73_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_44_i    , ref_54_i    , ref_64_i    , ref_74_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_45_i    , ref_55_i    , ref_65_i    , ref_75_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_46_i    , ref_56_i    , ref_66_i    , ref_76_i    ;
  input      [`PIXEL_WIDTH-1 : 0]    ref_47_i    , ref_57_i    , ref_67_i    , ref_77_i    ;
*/

/*
  // val_o
  output reg                         val_o       ;
*/

  // sad_o
  output reg [`PIXEL_WIDTH+6-1  : 0]    sad_o       ;


//*** WIRE & REG DECLARATION ***************************************************

  wire        [`PIXEL_WIDTH-1 : 0]    ori_00_w    , ori_10_w    , ori_20_w    , ori_30_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_01_w    , ori_11_w    , ori_21_w    , ori_31_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_02_w    , ori_12_w    , ori_22_w    , ori_32_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_03_w    , ori_13_w    , ori_23_w    , ori_33_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_04_w    , ori_14_w    , ori_24_w    , ori_34_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_05_w    , ori_15_w    , ori_25_w    , ori_35_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_06_w    , ori_16_w    , ori_26_w    , ori_36_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_07_w    , ori_17_w    , ori_27_w    , ori_37_w    ;

  wire        [`PIXEL_WIDTH-1 : 0]    ori_40_w    , ori_50_w    , ori_60_w    , ori_70_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_41_w    , ori_51_w    , ori_61_w    , ori_71_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_42_w    , ori_52_w    , ori_62_w    , ori_72_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_43_w    , ori_53_w    , ori_63_w    , ori_73_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_44_w    , ori_54_w    , ori_64_w    , ori_74_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_45_w    , ori_55_w    , ori_65_w    , ori_75_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_46_w    , ori_56_w    , ori_66_w    , ori_76_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ori_47_w    , ori_57_w    , ori_67_w    , ori_77_w    ;

  wire        [`PIXEL_WIDTH-1 : 0]    ref_00_w    , ref_10_w    , ref_20_w    , ref_30_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_01_w    , ref_11_w    , ref_21_w    , ref_31_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_02_w    , ref_12_w    , ref_22_w    , ref_32_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_03_w    , ref_13_w    , ref_23_w    , ref_33_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_04_w    , ref_14_w    , ref_24_w    , ref_34_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_05_w    , ref_15_w    , ref_25_w    , ref_35_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_06_w    , ref_16_w    , ref_26_w    , ref_36_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_07_w    , ref_17_w    , ref_27_w    , ref_37_w    ;

  wire        [`PIXEL_WIDTH-1 : 0]    ref_40_w    , ref_50_w    , ref_60_w    , ref_70_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_41_w    , ref_51_w    , ref_61_w    , ref_71_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_42_w    , ref_52_w    , ref_62_w    , ref_72_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_43_w    , ref_53_w    , ref_63_w    , ref_73_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_44_w    , ref_54_w    , ref_64_w    , ref_74_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_45_w    , ref_55_w    , ref_65_w    , ref_75_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_46_w    , ref_56_w    , ref_66_w    , ref_76_w    ;
  wire        [`PIXEL_WIDTH-1 : 0]    ref_47_w    , ref_57_w    , ref_67_w    , ref_77_w    ;

  // pixel difference
  wire signed [`PIXEL_WIDTH   : 0]    p_d_00_w    , p_d_10_w    , p_d_20_w    , p_d_30_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_01_w    , p_d_11_w    , p_d_21_w    , p_d_31_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_02_w    , p_d_12_w    , p_d_22_w    , p_d_32_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_03_w    , p_d_13_w    , p_d_23_w    , p_d_33_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_04_w    , p_d_14_w    , p_d_24_w    , p_d_34_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_05_w    , p_d_15_w    , p_d_25_w    , p_d_35_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_06_w    , p_d_16_w    , p_d_26_w    , p_d_36_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_07_w    , p_d_17_w    , p_d_27_w    , p_d_37_w    ;

  wire signed [`PIXEL_WIDTH   : 0]    p_d_40_w    , p_d_50_w    , p_d_60_w    , p_d_70_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_41_w    , p_d_51_w    , p_d_61_w    , p_d_71_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_42_w    , p_d_52_w    , p_d_62_w    , p_d_72_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_43_w    , p_d_53_w    , p_d_63_w    , p_d_73_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_44_w    , p_d_54_w    , p_d_64_w    , p_d_74_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_45_w    , p_d_55_w    , p_d_65_w    , p_d_75_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_46_w    , p_d_56_w    , p_d_66_w    , p_d_76_w    ;
  wire signed [`PIXEL_WIDTH   : 0]    p_d_47_w    , p_d_57_w    , p_d_67_w    , p_d_77_w    ;

  // pixel absolute difference
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_00_w   , p_ad_10_w   , p_ad_20_w   , p_ad_30_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_01_w   , p_ad_11_w   , p_ad_21_w   , p_ad_31_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_02_w   , p_ad_12_w   , p_ad_22_w   , p_ad_32_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_03_w   , p_ad_13_w   , p_ad_23_w   , p_ad_33_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_04_w   , p_ad_14_w   , p_ad_24_w   , p_ad_34_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_05_w   , p_ad_15_w   , p_ad_25_w   , p_ad_35_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_06_w   , p_ad_16_w   , p_ad_26_w   , p_ad_36_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_07_w   , p_ad_17_w   , p_ad_27_w   , p_ad_37_w   ;

  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_40_w   , p_ad_50_w   , p_ad_60_w   , p_ad_70_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_41_w   , p_ad_51_w   , p_ad_61_w   , p_ad_71_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_42_w   , p_ad_52_w   , p_ad_62_w   , p_ad_72_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_43_w   , p_ad_53_w   , p_ad_63_w   , p_ad_73_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_44_w   , p_ad_54_w   , p_ad_64_w   , p_ad_74_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_45_w   , p_ad_55_w   , p_ad_65_w   , p_ad_75_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_46_w   , p_ad_56_w   , p_ad_66_w   , p_ad_76_w   ;
  wire        [`PIXEL_WIDTH-1 : 0]    p_ad_47_w   , p_ad_57_w   , p_ad_67_w   , p_ad_77_w   ;

  // level 2: 64 to 32
  wire        [`PIXEL_WIDTH   : 0]    l_2_00_w    , l_2_20_w    , l_2_40_w    , l_2_60_w   ;
  wire        [`PIXEL_WIDTH   : 0]    l_2_01_w    , l_2_21_w    , l_2_41_w    , l_2_61_w   ;
  wire        [`PIXEL_WIDTH   : 0]    l_2_02_w    , l_2_22_w    , l_2_42_w    , l_2_62_w   ;
  wire        [`PIXEL_WIDTH   : 0]    l_2_03_w    , l_2_23_w    , l_2_43_w    , l_2_63_w   ;
  wire        [`PIXEL_WIDTH   : 0]    l_2_04_w    , l_2_24_w    , l_2_44_w    , l_2_64_w   ;
  wire        [`PIXEL_WIDTH   : 0]    l_2_05_w    , l_2_25_w    , l_2_45_w    , l_2_65_w   ;
  wire        [`PIXEL_WIDTH   : 0]    l_2_06_w    , l_2_26_w    , l_2_46_w    , l_2_66_w   ;
  wire        [`PIXEL_WIDTH   : 0]    l_2_07_w    , l_2_27_w    , l_2_47_w    , l_2_67_w   ;

  // level 3: 32 to 16
  wire        [`PIXEL_WIDTH+1 : 0]    l_3_00_w    , l_3_40_w    ;
  wire        [`PIXEL_WIDTH+1 : 0]    l_3_01_w    , l_3_41_w    ;
  wire        [`PIXEL_WIDTH+1 : 0]    l_3_02_w    , l_3_42_w    ;
  wire        [`PIXEL_WIDTH+1 : 0]    l_3_03_w    , l_3_43_w    ;
  wire        [`PIXEL_WIDTH+1 : 0]    l_3_04_w    , l_3_44_w    ;
  wire        [`PIXEL_WIDTH+1 : 0]    l_3_05_w    , l_3_45_w    ;
  wire        [`PIXEL_WIDTH+1 : 0]    l_3_06_w    , l_3_46_w    ;
  wire        [`PIXEL_WIDTH+1 : 0]    l_3_07_w    , l_3_47_w    ;

  // level 4: 16 to 8
  wire        [`PIXEL_WIDTH+2 : 0]    l_4_00_w    ;
  wire        [`PIXEL_WIDTH+2 : 0]    l_4_01_w    ;
  wire        [`PIXEL_WIDTH+2 : 0]    l_4_02_w    ;
  wire        [`PIXEL_WIDTH+2 : 0]    l_4_03_w    ;
  wire        [`PIXEL_WIDTH+2 : 0]    l_4_04_w    ;
  wire        [`PIXEL_WIDTH+2 : 0]    l_4_05_w    ;
  wire        [`PIXEL_WIDTH+2 : 0]    l_4_06_w    ;
  wire        [`PIXEL_WIDTH+2 : 0]    l_4_07_w    ;

  // level 5: 8 to 4
  wire        [`PIXEL_WIDTH+3 : 0]    l_5_00_w    ;
  wire        [`PIXEL_WIDTH+3 : 0]    l_5_02_w    ;
  wire        [`PIXEL_WIDTH+3 : 0]    l_5_04_w    ;
  wire        [`PIXEL_WIDTH+3 : 0]    l_5_06_w    ;

  // level 6: 4 to 2
  wire        [`PIXEL_WIDTH+4 : 0]    l_6_00_w    ;
  wire        [`PIXEL_WIDTH+4 : 0]    l_6_04_w    ;

  // level 7: 2 to 1
  wire        [`PIXEL_WIDTH+5 : 0]    l_7_00_w    ;


//*** MAIN BODY ****************************************************************

  // distribution
  assign { ori_00_w ,ori_10_w ,ori_20_w ,ori_30_w ,ori_40_w ,ori_50_w ,ori_60_w ,ori_70_w ,
           ori_01_w ,ori_11_w ,ori_21_w ,ori_31_w ,ori_41_w ,ori_51_w ,ori_61_w ,ori_71_w ,
           ori_02_w ,ori_12_w ,ori_22_w ,ori_32_w ,ori_42_w ,ori_52_w ,ori_62_w ,ori_72_w ,
           ori_03_w ,ori_13_w ,ori_23_w ,ori_33_w ,ori_43_w ,ori_53_w ,ori_63_w ,ori_73_w ,
           ori_04_w ,ori_14_w ,ori_24_w ,ori_34_w ,ori_44_w ,ori_54_w ,ori_64_w ,ori_74_w ,
           ori_05_w ,ori_15_w ,ori_25_w ,ori_35_w ,ori_45_w ,ori_55_w ,ori_65_w ,ori_75_w ,
           ori_06_w ,ori_16_w ,ori_26_w ,ori_36_w ,ori_46_w ,ori_56_w ,ori_66_w ,ori_76_w ,
           ori_07_w ,ori_17_w ,ori_27_w ,ori_37_w ,ori_47_w ,ori_57_w ,ori_67_w ,ori_77_w } = ori_i ;

  assign { ref_00_w ,ref_10_w ,ref_20_w ,ref_30_w ,ref_40_w ,ref_50_w ,ref_60_w ,ref_70_w ,
           ref_01_w ,ref_11_w ,ref_21_w ,ref_31_w ,ref_41_w ,ref_51_w ,ref_61_w ,ref_71_w ,
           ref_02_w ,ref_12_w ,ref_22_w ,ref_32_w ,ref_42_w ,ref_52_w ,ref_62_w ,ref_72_w ,
           ref_03_w ,ref_13_w ,ref_23_w ,ref_33_w ,ref_43_w ,ref_53_w ,ref_63_w ,ref_73_w ,
           ref_04_w ,ref_14_w ,ref_24_w ,ref_34_w ,ref_44_w ,ref_54_w ,ref_64_w ,ref_74_w ,
           ref_05_w ,ref_15_w ,ref_25_w ,ref_35_w ,ref_45_w ,ref_55_w ,ref_65_w ,ref_75_w ,
           ref_06_w ,ref_16_w ,ref_26_w ,ref_36_w ,ref_46_w ,ref_56_w ,ref_66_w ,ref_76_w ,
           ref_07_w ,ref_17_w ,ref_27_w ,ref_37_w ,ref_47_w ,ref_57_w ,ref_67_w ,ref_77_w } = ref_i ;

  // pixel difference
  assign p_d_00_w = ref_00_w - ori_00_w ;    assign p_d_10_w = ref_10_w - ori_10_w ;    assign p_d_20_w = ref_20_w - ori_20_w ;
  assign p_d_01_w = ref_01_w - ori_01_w ;    assign p_d_11_w = ref_11_w - ori_11_w ;    assign p_d_21_w = ref_21_w - ori_21_w ;
  assign p_d_02_w = ref_02_w - ori_02_w ;    assign p_d_12_w = ref_12_w - ori_12_w ;    assign p_d_22_w = ref_22_w - ori_22_w ;
  assign p_d_03_w = ref_03_w - ori_03_w ;    assign p_d_13_w = ref_13_w - ori_13_w ;    assign p_d_23_w = ref_23_w - ori_23_w ;
  assign p_d_04_w = ref_04_w - ori_04_w ;    assign p_d_14_w = ref_14_w - ori_14_w ;    assign p_d_24_w = ref_24_w - ori_24_w ;
  assign p_d_05_w = ref_05_w - ori_05_w ;    assign p_d_15_w = ref_15_w - ori_15_w ;    assign p_d_25_w = ref_25_w - ori_25_w ;
  assign p_d_06_w = ref_06_w - ori_06_w ;    assign p_d_16_w = ref_16_w - ori_16_w ;    assign p_d_26_w = ref_26_w - ori_26_w ;
  assign p_d_07_w = ref_07_w - ori_07_w ;    assign p_d_17_w = ref_17_w - ori_17_w ;    assign p_d_27_w = ref_27_w - ori_27_w ;

  assign p_d_30_w = ref_30_w - ori_30_w ;    assign p_d_40_w = ref_40_w - ori_40_w ;    assign p_d_50_w = ref_50_w - ori_50_w ;
  assign p_d_31_w = ref_31_w - ori_31_w ;    assign p_d_41_w = ref_41_w - ori_41_w ;    assign p_d_51_w = ref_51_w - ori_51_w ;
  assign p_d_32_w = ref_32_w - ori_32_w ;    assign p_d_42_w = ref_42_w - ori_42_w ;    assign p_d_52_w = ref_52_w - ori_52_w ;
  assign p_d_33_w = ref_33_w - ori_33_w ;    assign p_d_43_w = ref_43_w - ori_43_w ;    assign p_d_53_w = ref_53_w - ori_53_w ;
  assign p_d_34_w = ref_34_w - ori_34_w ;    assign p_d_44_w = ref_44_w - ori_44_w ;    assign p_d_54_w = ref_54_w - ori_54_w ;
  assign p_d_35_w = ref_35_w - ori_35_w ;    assign p_d_45_w = ref_45_w - ori_45_w ;    assign p_d_55_w = ref_55_w - ori_55_w ;
  assign p_d_36_w = ref_36_w - ori_36_w ;    assign p_d_46_w = ref_46_w - ori_46_w ;    assign p_d_56_w = ref_56_w - ori_56_w ;
  assign p_d_37_w = ref_37_w - ori_37_w ;    assign p_d_47_w = ref_47_w - ori_47_w ;    assign p_d_57_w = ref_57_w - ori_57_w ;

  assign p_d_60_w = ref_60_w - ori_60_w ;    assign p_d_70_w = ref_70_w - ori_70_w ;
  assign p_d_61_w = ref_61_w - ori_61_w ;    assign p_d_71_w = ref_71_w - ori_71_w ;
  assign p_d_62_w = ref_62_w - ori_62_w ;    assign p_d_72_w = ref_72_w - ori_72_w ;
  assign p_d_63_w = ref_63_w - ori_63_w ;    assign p_d_73_w = ref_73_w - ori_73_w ;
  assign p_d_64_w = ref_64_w - ori_64_w ;    assign p_d_74_w = ref_74_w - ori_74_w ;
  assign p_d_65_w = ref_65_w - ori_65_w ;    assign p_d_75_w = ref_75_w - ori_75_w ;
  assign p_d_66_w = ref_66_w - ori_66_w ;    assign p_d_76_w = ref_76_w - ori_76_w ;
  assign p_d_67_w = ref_67_w - ori_67_w ;    assign p_d_77_w = ref_77_w - ori_77_w ;

  // pixel absolute difference
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs00 ( .a_i ( p_d_00_w ), .b_o ( p_ad_00_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs01 ( .a_i ( p_d_01_w ), .b_o ( p_ad_01_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs02 ( .a_i ( p_d_02_w ), .b_o ( p_ad_02_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs03 ( .a_i ( p_d_03_w ), .b_o ( p_ad_03_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs04 ( .a_i ( p_d_04_w ), .b_o ( p_ad_04_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs05 ( .a_i ( p_d_05_w ), .b_o ( p_ad_05_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs06 ( .a_i ( p_d_06_w ), .b_o ( p_ad_06_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs07 ( .a_i ( p_d_07_w ), .b_o ( p_ad_07_w ) );

  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs10 ( .a_i ( p_d_10_w ), .b_o ( p_ad_10_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs11 ( .a_i ( p_d_11_w ), .b_o ( p_ad_11_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs12 ( .a_i ( p_d_12_w ), .b_o ( p_ad_12_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs13 ( .a_i ( p_d_13_w ), .b_o ( p_ad_13_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs14 ( .a_i ( p_d_14_w ), .b_o ( p_ad_14_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs15 ( .a_i ( p_d_15_w ), .b_o ( p_ad_15_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs16 ( .a_i ( p_d_16_w ), .b_o ( p_ad_16_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs17 ( .a_i ( p_d_17_w ), .b_o ( p_ad_17_w ) );

  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs20 ( .a_i ( p_d_20_w ), .b_o ( p_ad_20_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs21 ( .a_i ( p_d_21_w ), .b_o ( p_ad_21_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs22 ( .a_i ( p_d_22_w ), .b_o ( p_ad_22_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs23 ( .a_i ( p_d_23_w ), .b_o ( p_ad_23_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs24 ( .a_i ( p_d_24_w ), .b_o ( p_ad_24_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs25 ( .a_i ( p_d_25_w ), .b_o ( p_ad_25_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs26 ( .a_i ( p_d_26_w ), .b_o ( p_ad_26_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs27 ( .a_i ( p_d_27_w ), .b_o ( p_ad_27_w ) );

  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs30 ( .a_i ( p_d_30_w ), .b_o ( p_ad_30_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs31 ( .a_i ( p_d_31_w ), .b_o ( p_ad_31_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs32 ( .a_i ( p_d_32_w ), .b_o ( p_ad_32_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs33 ( .a_i ( p_d_33_w ), .b_o ( p_ad_33_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs34 ( .a_i ( p_d_34_w ), .b_o ( p_ad_34_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs35 ( .a_i ( p_d_35_w ), .b_o ( p_ad_35_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs36 ( .a_i ( p_d_36_w ), .b_o ( p_ad_36_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs37 ( .a_i ( p_d_37_w ), .b_o ( p_ad_37_w ) );

  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs40 ( .a_i ( p_d_40_w ), .b_o ( p_ad_40_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs41 ( .a_i ( p_d_41_w ), .b_o ( p_ad_41_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs42 ( .a_i ( p_d_42_w ), .b_o ( p_ad_42_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs43 ( .a_i ( p_d_43_w ), .b_o ( p_ad_43_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs44 ( .a_i ( p_d_44_w ), .b_o ( p_ad_44_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs45 ( .a_i ( p_d_45_w ), .b_o ( p_ad_45_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs46 ( .a_i ( p_d_46_w ), .b_o ( p_ad_46_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs47 ( .a_i ( p_d_47_w ), .b_o ( p_ad_47_w ) );

  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs50 ( .a_i ( p_d_50_w ), .b_o ( p_ad_50_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs51 ( .a_i ( p_d_51_w ), .b_o ( p_ad_51_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs52 ( .a_i ( p_d_52_w ), .b_o ( p_ad_52_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs53 ( .a_i ( p_d_53_w ), .b_o ( p_ad_53_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs54 ( .a_i ( p_d_54_w ), .b_o ( p_ad_54_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs55 ( .a_i ( p_d_55_w ), .b_o ( p_ad_55_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs56 ( .a_i ( p_d_56_w ), .b_o ( p_ad_56_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs57 ( .a_i ( p_d_57_w ), .b_o ( p_ad_57_w ) );

  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs60 ( .a_i ( p_d_60_w ), .b_o ( p_ad_60_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs61 ( .a_i ( p_d_61_w ), .b_o ( p_ad_61_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs62 ( .a_i ( p_d_62_w ), .b_o ( p_ad_62_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs63 ( .a_i ( p_d_63_w ), .b_o ( p_ad_63_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs64 ( .a_i ( p_d_64_w ), .b_o ( p_ad_64_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs65 ( .a_i ( p_d_65_w ), .b_o ( p_ad_65_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs66 ( .a_i ( p_d_66_w ), .b_o ( p_ad_66_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs67 ( .a_i ( p_d_67_w ), .b_o ( p_ad_67_w ) );

  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs70 ( .a_i ( p_d_70_w ), .b_o ( p_ad_70_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs71 ( .a_i ( p_d_71_w ), .b_o ( p_ad_71_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs72 ( .a_i ( p_d_72_w ), .b_o ( p_ad_72_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs73 ( .a_i ( p_d_73_w ), .b_o ( p_ad_73_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs74 ( .a_i ( p_d_74_w ), .b_o ( p_ad_74_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs75 ( .a_i ( p_d_75_w ), .b_o ( p_ad_75_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs76 ( .a_i ( p_d_76_w ), .b_o ( p_ad_76_w ) );
  abs #( .INPUT_BITS ( `PIXEL_WIDTH+1 ) ) abs77 ( .a_i ( p_d_77_w ), .b_o ( p_ad_77_w ) );
/*
  assign p_ad_00_w = (p_d_00_w>0) ? p_d_00_w : -p_d_00_w ;    assign p_ad_10_w = (p_d_10_w>0) ? p_d_10_w : -p_d_10_w ;
  assign p_ad_01_w = (p_d_01_w>0) ? p_d_01_w : -p_d_01_w ;    assign p_ad_11_w = (p_d_11_w>0) ? p_d_11_w : -p_d_11_w ;
  assign p_ad_02_w = (p_d_02_w>0) ? p_d_02_w : -p_d_02_w ;    assign p_ad_12_w = (p_d_12_w>0) ? p_d_12_w : -p_d_12_w ;
  assign p_ad_03_w = (p_d_03_w>0) ? p_d_03_w : -p_d_03_w ;    assign p_ad_13_w = (p_d_13_w>0) ? p_d_13_w : -p_d_13_w ;
  assign p_ad_04_w = (p_d_04_w>0) ? p_d_04_w : -p_d_04_w ;    assign p_ad_14_w = (p_d_14_w>0) ? p_d_14_w : -p_d_14_w ;
  assign p_ad_05_w = (p_d_05_w>0) ? p_d_05_w : -p_d_05_w ;    assign p_ad_15_w = (p_d_15_w>0) ? p_d_15_w : -p_d_15_w ;
  assign p_ad_06_w = (p_d_06_w>0) ? p_d_06_w : -p_d_06_w ;    assign p_ad_16_w = (p_d_16_w>0) ? p_d_16_w : -p_d_16_w ;
  assign p_ad_07_w = (p_d_07_w>0) ? p_d_07_w : -p_d_07_w ;    assign p_ad_17_w = (p_d_17_w>0) ? p_d_17_w : -p_d_17_w ;

  assign p_ad_20_w = (p_d_20_w>0) ? p_d_20_w : -p_d_20_w ;    assign p_ad_30_w = (p_d_30_w>0) ? p_d_30_w : -p_d_30_w ;
  assign p_ad_21_w = (p_d_21_w>0) ? p_d_21_w : -p_d_21_w ;    assign p_ad_31_w = (p_d_31_w>0) ? p_d_31_w : -p_d_31_w ;
  assign p_ad_22_w = (p_d_22_w>0) ? p_d_22_w : -p_d_22_w ;    assign p_ad_32_w = (p_d_32_w>0) ? p_d_32_w : -p_d_32_w ;
  assign p_ad_23_w = (p_d_23_w>0) ? p_d_23_w : -p_d_23_w ;    assign p_ad_33_w = (p_d_33_w>0) ? p_d_33_w : -p_d_33_w ;
  assign p_ad_24_w = (p_d_24_w>0) ? p_d_24_w : -p_d_24_w ;    assign p_ad_34_w = (p_d_34_w>0) ? p_d_34_w : -p_d_34_w ;
  assign p_ad_25_w = (p_d_25_w>0) ? p_d_25_w : -p_d_25_w ;    assign p_ad_35_w = (p_d_35_w>0) ? p_d_35_w : -p_d_35_w ;
  assign p_ad_26_w = (p_d_26_w>0) ? p_d_26_w : -p_d_26_w ;    assign p_ad_36_w = (p_d_36_w>0) ? p_d_36_w : -p_d_36_w ;
  assign p_ad_27_w = (p_d_27_w>0) ? p_d_27_w : -p_d_27_w ;    assign p_ad_37_w = (p_d_37_w>0) ? p_d_37_w : -p_d_37_w ;

  assign p_ad_40_w = (p_d_40_w>0) ? p_d_40_w : -p_d_40_w ;    assign p_ad_50_w = (p_d_50_w>0) ? p_d_50_w : -p_d_50_w ;
  assign p_ad_41_w = (p_d_41_w>0) ? p_d_41_w : -p_d_41_w ;    assign p_ad_51_w = (p_d_51_w>0) ? p_d_51_w : -p_d_51_w ;
  assign p_ad_42_w = (p_d_42_w>0) ? p_d_42_w : -p_d_42_w ;    assign p_ad_52_w = (p_d_52_w>0) ? p_d_52_w : -p_d_52_w ;
  assign p_ad_43_w = (p_d_43_w>0) ? p_d_43_w : -p_d_43_w ;    assign p_ad_53_w = (p_d_53_w>0) ? p_d_53_w : -p_d_53_w ;
  assign p_ad_44_w = (p_d_44_w>0) ? p_d_44_w : -p_d_44_w ;    assign p_ad_54_w = (p_d_54_w>0) ? p_d_54_w : -p_d_54_w ;
  assign p_ad_45_w = (p_d_45_w>0) ? p_d_45_w : -p_d_45_w ;    assign p_ad_55_w = (p_d_55_w>0) ? p_d_55_w : -p_d_55_w ;
  assign p_ad_46_w = (p_d_46_w>0) ? p_d_46_w : -p_d_46_w ;    assign p_ad_56_w = (p_d_56_w>0) ? p_d_56_w : -p_d_56_w ;
  assign p_ad_47_w = (p_d_47_w>0) ? p_d_47_w : -p_d_47_w ;    assign p_ad_57_w = (p_d_57_w>0) ? p_d_57_w : -p_d_57_w ;

  assign p_ad_60_w = (p_d_60_w>0) ? p_d_60_w : -p_d_60_w ;    assign p_ad_70_w = (p_d_70_w>0) ? p_d_70_w : -p_d_70_w ;
  assign p_ad_61_w = (p_d_61_w>0) ? p_d_61_w : -p_d_61_w ;    assign p_ad_71_w = (p_d_71_w>0) ? p_d_71_w : -p_d_71_w ;
  assign p_ad_62_w = (p_d_62_w>0) ? p_d_62_w : -p_d_62_w ;    assign p_ad_72_w = (p_d_72_w>0) ? p_d_72_w : -p_d_72_w ;
  assign p_ad_63_w = (p_d_63_w>0) ? p_d_63_w : -p_d_63_w ;    assign p_ad_73_w = (p_d_73_w>0) ? p_d_73_w : -p_d_73_w ;
  assign p_ad_64_w = (p_d_64_w>0) ? p_d_64_w : -p_d_64_w ;    assign p_ad_74_w = (p_d_74_w>0) ? p_d_74_w : -p_d_74_w ;
  assign p_ad_65_w = (p_d_65_w>0) ? p_d_65_w : -p_d_65_w ;    assign p_ad_75_w = (p_d_75_w>0) ? p_d_75_w : -p_d_75_w ;
  assign p_ad_66_w = (p_d_66_w>0) ? p_d_66_w : -p_d_66_w ;    assign p_ad_76_w = (p_d_76_w>0) ? p_d_76_w : -p_d_76_w ;
  assign p_ad_67_w = (p_d_67_w>0) ? p_d_67_w : -p_d_67_w ;    assign p_ad_77_w = (p_d_77_w>0) ? p_d_77_w : -p_d_77_w ;
*/

  // level 2: 64 to 32
  assign l_2_00_w = p_ad_00_w + p_ad_10_w ;    assign l_2_20_w = p_ad_20_w + p_ad_30_w ;
  assign l_2_01_w = p_ad_01_w + p_ad_11_w ;    assign l_2_21_w = p_ad_21_w + p_ad_31_w ;
  assign l_2_02_w = p_ad_02_w + p_ad_12_w ;    assign l_2_22_w = p_ad_22_w + p_ad_32_w ;
  assign l_2_03_w = p_ad_03_w + p_ad_13_w ;    assign l_2_23_w = p_ad_23_w + p_ad_33_w ;
  assign l_2_04_w = p_ad_04_w + p_ad_14_w ;    assign l_2_24_w = p_ad_24_w + p_ad_34_w ;
  assign l_2_05_w = p_ad_05_w + p_ad_15_w ;    assign l_2_25_w = p_ad_25_w + p_ad_35_w ;
  assign l_2_06_w = p_ad_06_w + p_ad_16_w ;    assign l_2_26_w = p_ad_26_w + p_ad_36_w ;
  assign l_2_07_w = p_ad_07_w + p_ad_17_w ;    assign l_2_27_w = p_ad_27_w + p_ad_37_w ;

  assign l_2_40_w = p_ad_40_w + p_ad_50_w ;    assign l_2_60_w = p_ad_60_w + p_ad_70_w ;
  assign l_2_41_w = p_ad_41_w + p_ad_51_w ;    assign l_2_61_w = p_ad_61_w + p_ad_71_w ;
  assign l_2_42_w = p_ad_42_w + p_ad_52_w ;    assign l_2_62_w = p_ad_62_w + p_ad_72_w ;
  assign l_2_43_w = p_ad_43_w + p_ad_53_w ;    assign l_2_63_w = p_ad_63_w + p_ad_73_w ;
  assign l_2_44_w = p_ad_44_w + p_ad_54_w ;    assign l_2_64_w = p_ad_64_w + p_ad_74_w ;
  assign l_2_45_w = p_ad_45_w + p_ad_55_w ;    assign l_2_65_w = p_ad_65_w + p_ad_75_w ;
  assign l_2_46_w = p_ad_46_w + p_ad_56_w ;    assign l_2_66_w = p_ad_66_w + p_ad_76_w ;
  assign l_2_47_w = p_ad_47_w + p_ad_57_w ;    assign l_2_67_w = p_ad_67_w + p_ad_77_w ;

  // level 3: 32 to 16
  assign l_3_00_w = l_2_00_w + l_2_20_w ;    assign l_3_40_w = l_2_40_w + l_2_60_w ;
  assign l_3_01_w = l_2_01_w + l_2_21_w ;    assign l_3_41_w = l_2_41_w + l_2_61_w ;
  assign l_3_02_w = l_2_02_w + l_2_22_w ;    assign l_3_42_w = l_2_42_w + l_2_62_w ;
  assign l_3_03_w = l_2_03_w + l_2_23_w ;    assign l_3_43_w = l_2_43_w + l_2_63_w ;
  assign l_3_04_w = l_2_04_w + l_2_24_w ;    assign l_3_44_w = l_2_44_w + l_2_64_w ;
  assign l_3_05_w = l_2_05_w + l_2_25_w ;    assign l_3_45_w = l_2_45_w + l_2_65_w ;
  assign l_3_06_w = l_2_06_w + l_2_26_w ;    assign l_3_46_w = l_2_46_w + l_2_66_w ;
  assign l_3_07_w = l_2_07_w + l_2_27_w ;    assign l_3_47_w = l_2_47_w + l_2_67_w ;

  // level 4: 16 to 8
  assign l_4_00_w = l_3_00_w + l_3_40_w ;
  assign l_4_01_w = l_3_01_w + l_3_41_w ;
  assign l_4_02_w = l_3_02_w + l_3_42_w ;
  assign l_4_03_w = l_3_03_w + l_3_43_w ;
  assign l_4_04_w = l_3_04_w + l_3_44_w ;
  assign l_4_05_w = l_3_05_w + l_3_45_w ;
  assign l_4_06_w = l_3_06_w + l_3_46_w ;
  assign l_4_07_w = l_3_07_w + l_3_47_w ;

  // level 5: 8 to 4
  assign l_5_00_w = l_4_00_w + l_4_01_w ;
  assign l_5_02_w = l_4_02_w + l_4_03_w ;
  assign l_5_04_w = l_4_04_w + l_4_05_w ;
  assign l_5_06_w = l_4_06_w + l_4_07_w ;

  // level 6: 4 to 2
  assign l_6_00_w = l_5_00_w + l_5_02_w ;
  assign l_6_04_w = l_5_04_w + l_5_06_w ;

  // level 7: 2 to 1
  assign l_7_00_w = l_6_00_w + l_6_04_w ;

/*
  // val_o

  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      val_o <= 'd0 ;
    else begin
      val_o <= enable_i ;
    end
  end
*/

  // sad_o
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      sad_o <= 'd0 ;
    else if( enable_i ) begin
      sad_o <= l_7_00_w ;
    end
  end

//*** DEBUG ********************************************************************

`ifdef DEBUG

  wire debug_0 ;
  wire debug_1 ;

  assign debug_0 = p_d_00_w>0 ;
  assign debug_1 = p_d_00_w>'d0 ;

`endif


endmodule

module abs (                                      // created by Yufeng Bai
  a_i   ,
  b_o
  );

  parameter INPUT_BITS = `PIXEL_WIDTH ;

  input  [INPUT_BITS-1 : 0] a_i   ;
  output [INPUT_BITS-2 : 0] b_o   ;

  wire   [INPUT_BITS-1 : 0] b_o_w ;

  assign b_o_w = ({(INPUT_BITS-1){a_i[INPUT_BITS-1]}} ^ {a_i[INPUT_BITS-2:0]}) + {{(INPUT_BITS-1){1'b0}},a_i[INPUT_BITS-1]};
  assign b_o   = b_o_w[INPUT_BITS-2:0];

endmodule