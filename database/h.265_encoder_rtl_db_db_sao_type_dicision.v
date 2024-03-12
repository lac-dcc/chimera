//------------------------------------------------------------------- 
//                                                                    
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University               
//                                                                    
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE        
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group                        
//                                                                    
//  VIPcore       : http://soc.fudan.edu.cn/vip                       
//  IP Owner 	  : Yibo FAN                                          
//  Contact       : fanyibo@fudan.edu.cn                              
//------------------------------------------------------------------- 
// Filename       : db_sao_type_dicision.v                            
// Author         : Chewein                                           
// Created        : 2015-04-19                                        
// Description    : calculation the final offset                      
//------------------------------------------------------------------- 
module db_sao_type_dicision(
                                clk                        ,
                                rst_n                      ,
                                data_valid_i               ,
                                data_over_i                ,
                                b_offset_0_i               ,
                                b_offset_1_i               ,
                                b_offset_2_i               ,
                                b_offset_3_i               ,
                                b_offset_4_i               ,
                                b_offset_5_i               ,
                                b_offset_6_i               ,
                                b_offset_7_i               ,
                                b_offset_8_i               ,
                                b_offset_9_i               ,
                                b_offset_10_i              ,
                                b_offset_11_i              ,
                                b_offset_12_i              ,
                                b_offset_13_i              ,
                                b_offset_14_i              ,
                                b_offset_15_i              ,
                                b_offset_16_i              ,
                                b_offset_17_i              ,
                                b_offset_18_i              ,
                                b_offset_19_i              ,
                                b_offset_20_i              ,
                                b_offset_21_i              ,
                                b_offset_22_i              ,
                                b_offset_23_i              ,
                                b_offset_24_i              ,
                                b_offset_25_i              ,
                                b_offset_26_i              ,
                                b_offset_27_i              ,
                                b_offset_28_i              ,
                                b_offset_29_i              ,
                                b_offset_30_i              ,
                                b_offset_31_i              ,
                                b_distortion_0_i           ,
                                b_distortion_1_i           ,
                                b_distortion_2_i           ,
                                b_distortion_3_i           ,
                                b_distortion_4_i           ,
                                b_distortion_5_i           ,
                                b_distortion_6_i           ,
                                b_distortion_7_i           ,
                                b_distortion_8_i           ,
                                b_distortion_9_i           ,
                                b_distortion_10_i           ,
                                b_distortion_11_i           ,
                                b_distortion_12_i           ,
                                b_distortion_13_i           ,
                                b_distortion_14_i           ,
                                b_distortion_15_i           ,
                                b_distortion_16_i           ,
                                b_distortion_17_i           ,
                                b_distortion_18_i           ,
                                b_distortion_19_i           ,
                                b_distortion_20_i           ,
                                b_distortion_21_i           ,
                                b_distortion_22_i           ,
                                b_distortion_23_i           ,
                                b_distortion_24_i           ,
                                b_distortion_25_i           ,
                                b_distortion_26_i           ,
                                b_distortion_27_i           ,
                                b_distortion_28_i           ,
                                b_distortion_29_i           ,
                                b_distortion_30_i           ,
                                b_distortion_31_i           ,
                                b_offset_o                  ,
                                b_band_o                
                            );
//---------------------------------------------------------------------------
//                                                                           
//                        INPUT/OUTPUT DECLARATION                           
//                                                                           
//---------------------------------------------------------------------------
parameter DIS_WIDTH     =    25                    ;
input                           clk                ;
input                           rst_n              ;
input                           data_valid_i       ;
input                           data_over_i        ;
input  signed  [          2:0 ] b_offset_0_i       ;
input  signed  [          2:0 ] b_offset_1_i       ;
input  signed  [          2:0 ] b_offset_2_i       ;
input  signed  [          2:0 ] b_offset_3_i       ;
input  signed  [          2:0 ] b_offset_4_i       ;
input  signed  [          2:0 ] b_offset_5_i       ;
input  signed  [          2:0 ] b_offset_6_i       ;
input  signed  [          2:0 ] b_offset_7_i       ;
input  signed  [          2:0 ] b_offset_8_i       ;
input  signed  [          2:0 ] b_offset_9_i       ;
input  signed  [          2:0 ] b_offset_10_i      ;
input  signed  [          2:0 ] b_offset_11_i      ;
input  signed  [          2:0 ] b_offset_12_i      ;
input  signed  [          2:0 ] b_offset_13_i      ;
input  signed  [          2:0 ] b_offset_14_i      ;
input  signed  [          2:0 ] b_offset_15_i      ;
input  signed  [          2:0 ] b_offset_16_i      ;
input  signed  [          2:0 ] b_offset_17_i      ;
input  signed  [          2:0 ] b_offset_18_i      ;
input  signed  [          2:0 ] b_offset_19_i      ;
input  signed  [          2:0 ] b_offset_20_i      ;
input  signed  [          2:0 ] b_offset_21_i      ;
input  signed  [          2:0 ] b_offset_22_i      ;
input  signed  [          2:0 ] b_offset_23_i      ;
input  signed  [          2:0 ] b_offset_24_i      ;
input  signed  [          2:0 ] b_offset_25_i      ;
input  signed  [          2:0 ] b_offset_26_i      ;
input  signed  [          2:0 ] b_offset_27_i      ;
input  signed  [          2:0 ] b_offset_28_i      ;
input  signed  [          2:0 ] b_offset_29_i      ;
input  signed  [          2:0 ] b_offset_30_i      ;
input  signed  [          2:0 ] b_offset_31_i      ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_0_i   ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_1_i   ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_2_i   ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_3_i   ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_4_i   ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_5_i   ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_6_i   ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_7_i   ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_8_i   ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_9_i   ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_10_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_11_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_12_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_13_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_14_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_15_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_16_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_17_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_18_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_19_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_20_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_21_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_22_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_23_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_24_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_25_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_26_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_27_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_28_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_29_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_30_i  ;
input  signed  [DIS_WIDTH-1:0 ] b_distortion_31_i  ;
output signed  [         11:0 ] b_offset_o         ;
output signed  [          4:0 ] b_band_o           ;
//---------------------------------------------------------------------------
//                                                                           
//               declare reg signals                                         
//                                                                           
//---------------------------------------------------------------------------
reg  signed     [          2:0 ] b_offset_0_r       ;
reg  signed     [          2:0 ] b_offset_1_r       ;
reg  signed     [          2:0 ] b_offset_2_r       ;
reg  signed     [          2:0 ] b_offset_3_r       ;
reg  signed     [          2:0 ] b_offset_4_r       ;
reg  signed     [          2:0 ] b_offset_5_r       ;
reg  signed     [          2:0 ] b_offset_6_r       ;
reg  signed     [          2:0 ] b_offset_7_r       ;
reg  signed     [          2:0 ] b_offset_8_r       ;
reg  signed     [          2:0 ] b_offset_9_r       ;
reg  signed     [          2:0 ] b_offset_10_r      ;
reg  signed     [          2:0 ] b_offset_11_r      ;
reg  signed     [          2:0 ] b_offset_12_r      ;
reg  signed     [          2:0 ] b_offset_13_r      ;
reg  signed     [          2:0 ] b_offset_14_r      ;
reg  signed     [          2:0 ] b_offset_15_r      ;
reg  signed     [          2:0 ] b_offset_16_r      ;
reg  signed     [          2:0 ] b_offset_17_r      ;
reg  signed     [          2:0 ] b_offset_18_r      ;
reg  signed     [          2:0 ] b_offset_19_r      ;
reg  signed     [          2:0 ] b_offset_20_r      ;
reg  signed     [          2:0 ] b_offset_21_r      ;
reg  signed     [          2:0 ] b_offset_22_r      ;
reg  signed     [          2:0 ] b_offset_23_r      ;
reg  signed     [          2:0 ] b_offset_24_r      ;
reg  signed     [          2:0 ] b_offset_25_r      ;
reg  signed     [          2:0 ] b_offset_26_r      ;
reg  signed     [          2:0 ] b_offset_27_r      ;
reg  signed     [          2:0 ] b_offset_28_r      ;
reg  signed     [          2:0 ] b_offset_29_r      ;
reg  signed     [          2:0 ] b_offset_30_r      ;
reg  signed     [          2:0 ] b_offset_31_r      ;

reg   signed  [DIS_WIDTH-1:0 ] b_distortion_0_r   ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_1_r   ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_2_r   ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_3_r   ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_4_r   ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_5_r   ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_6_r   ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_7_r   ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_8_r   ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_9_r   ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_10_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_11_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_12_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_13_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_14_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_15_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_16_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_17_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_18_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_19_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_20_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_21_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_22_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_23_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_24_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_25_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_26_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_27_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_28_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_29_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_30_r  ;
reg   signed  [DIS_WIDTH-1:0 ] b_distortion_31_r  ;

reg           [          2:0 ] b_offset_abs_0_r   ;
reg           [          2:0 ] b_offset_abs_1_r   ;
reg           [          2:0 ] b_offset_abs_2_r   ;
reg           [          2:0 ] b_offset_abs_3_r   ;
reg           [          2:0 ] b_offset_abs_4_r   ;
reg           [          2:0 ] b_offset_abs_5_r   ;
reg           [          2:0 ] b_offset_abs_6_r   ;
reg           [          2:0 ] b_offset_abs_7_r   ;
reg           [          2:0 ] b_offset_abs_8_r   ;
reg           [          2:0 ] b_offset_abs_9_r   ;
reg           [          2:0 ] b_offset_abs_10_r  ;
reg           [          2:0 ] b_offset_abs_11_r  ;
reg           [          2:0 ] b_offset_abs_12_r  ;
reg           [          2:0 ] b_offset_abs_13_r  ;
reg           [          2:0 ] b_offset_abs_14_r  ;
reg           [          2:0 ] b_offset_abs_15_r  ;
reg           [          2:0 ] b_offset_abs_16_r  ;
reg           [          2:0 ] b_offset_abs_17_r  ;
reg           [          2:0 ] b_offset_abs_18_r  ;
reg           [          2:0 ] b_offset_abs_19_r  ;
reg           [          2:0 ] b_offset_abs_20_r  ;
reg           [          2:0 ] b_offset_abs_21_r  ;
reg           [          2:0 ] b_offset_abs_22_r  ;
reg           [          2:0 ] b_offset_abs_23_r  ;
reg           [          2:0 ] b_offset_abs_24_r  ;
reg           [          2:0 ] b_offset_abs_25_r  ;
reg           [          2:0 ] b_offset_abs_26_r  ;
reg           [          2:0 ] b_offset_abs_27_r  ;
reg           [          2:0 ] b_offset_abs_28_r  ;
reg           [          2:0 ] b_offset_abs_29_r  ;
reg           [          2:0 ] b_offset_abs_30_r  ;
reg           [          2:0 ] b_offset_abs_31_r  ;

wire          [          4:0 ] b_offset_abs_0t3_w  ;
wire          [          4:0 ] b_offset_abs_1t4_w  ;
wire          [          4:0 ] b_offset_abs_2t5_w  ;
wire          [          4:0 ] b_offset_abs_3t6_w  ;
wire          [          4:0 ] b_offset_abs_4t7_w  ;
wire          [          4:0 ] b_offset_abs_5t8_w  ;
wire          [          4:0 ] b_offset_abs_6t9_w  ;
wire          [          4:0 ] b_offset_abs_7t10_w  ;
wire          [          4:0 ] b_offset_abs_8t11_w  ;
wire          [          4:0 ] b_offset_abs_9t12_w  ;
wire          [          4:0 ] b_offset_abs_10t13_w  ;
wire          [          4:0 ] b_offset_abs_11t14_w  ;
wire          [          4:0 ] b_offset_abs_12t15_w  ;
wire          [          4:0 ] b_offset_abs_13t16_w  ;
wire          [          4:0 ] b_offset_abs_14t17_w  ;
wire          [          4:0 ] b_offset_abs_15t18_w  ;
wire          [          4:0 ] b_offset_abs_16t19_w  ;
wire          [          4:0 ] b_offset_abs_17t20_w  ;
wire          [          4:0 ] b_offset_abs_18t21_w  ;
wire          [          4:0 ] b_offset_abs_19t22_w  ;
wire          [          4:0 ] b_offset_abs_20t23_w  ;
wire          [          4:0 ] b_offset_abs_21t24_w  ;
wire          [          4:0 ] b_offset_abs_22t25_w  ;
wire          [          4:0 ] b_offset_abs_23t26_w  ;
wire          [          4:0 ] b_offset_abs_24t27_w  ;
wire          [          4:0 ] b_offset_abs_25t28_w  ;
wire          [          4:0 ] b_offset_abs_26t29_w  ;
wire          [          4:0 ] b_offset_abs_27t30_w  ;
wire          [          4:0 ] b_offset_abs_28t31_w  ;

wire  signed  [          5:0 ] b_offset_0t3_w      ;
wire  signed  [          5:0 ] b_offset_1t4_w      ;
wire  signed  [          5:0 ] b_offset_2t5_w      ;
wire  signed  [          5:0 ] b_offset_3t6_w      ;
wire  signed  [          5:0 ] b_offset_4t7_w      ;
wire  signed  [          5:0 ] b_offset_5t8_w      ;
wire  signed  [          5:0 ] b_offset_6t9_w      ;
wire  signed  [          5:0 ] b_offset_7t10_w      ;
wire  signed  [          5:0 ] b_offset_8t11_w      ;
wire  signed  [          5:0 ] b_offset_9t12_w      ;
wire  signed  [          5:0 ] b_offset_10t13_w      ;
wire  signed  [          5:0 ] b_offset_11t14_w      ;
wire  signed  [          5:0 ] b_offset_12t15_w      ;
wire  signed  [          5:0 ] b_offset_13t16_w      ;
wire  signed  [          5:0 ] b_offset_14t17_w      ;
wire  signed  [          5:0 ] b_offset_15t18_w      ;
wire  signed  [          5:0 ] b_offset_16t19_w      ;
wire  signed  [          5:0 ] b_offset_17t20_w      ;
wire  signed  [          5:0 ] b_offset_18t21_w      ;
wire  signed  [          5:0 ] b_offset_19t22_w      ;
wire  signed  [          5:0 ] b_offset_20t23_w      ;
wire  signed  [          5:0 ] b_offset_21t24_w      ;
wire  signed  [          5:0 ] b_offset_22t25_w      ;
wire  signed  [          5:0 ] b_offset_23t26_w      ;
wire  signed  [          5:0 ] b_offset_24t27_w      ;
wire  signed  [          5:0 ] b_offset_25t28_w      ;
wire  signed  [          5:0 ] b_offset_26t29_w      ;
wire  signed  [          5:0 ] b_offset_27t30_w      ;
wire  signed  [          5:0 ] b_offset_28t31_w      ;

wire  signed   [DIS_WIDTH+1:0 ] b_distortion_0t3_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_1t4_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_2t5_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_3t6_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_4t7_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_5t8_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_6t9_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_7t10_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_8t11_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_9t12_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_10t13_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_11t14_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_12t15_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_13t16_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_14t17_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_15t18_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_16t19_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_17t20_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_18t21_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_19t22_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_20t23_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_21t24_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_22t25_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_23t26_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_24t27_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_25t28_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_26t29_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_27t30_w       ;
wire  signed   [DIS_WIDTH+1:0 ] b_distortion_28t31_w       ;

wire  signed   [DIS_WIDTH+2:0 ] b_cost_0t3_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_1t4_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_2t5_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_3t6_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_4t7_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_5t8_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_6t9_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_7t10_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_8t11_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_9t12_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_10t13_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_11t14_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_12t15_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_13t16_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_14t17_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_15t18_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_16t19_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_17t20_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_18t21_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_19t22_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_20t23_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_21t24_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_22t25_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_23t26_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_24t27_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_25t28_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_26t29_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_27t30_w       ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_28t31_w       ;

wire  signed   [DIS_WIDTH+2:0 ] b_cost_stage_0_w     ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_stage_1_w     ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_stage_2_w     ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_stage_3_w     ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_stage_4_w     ;
wire  signed   [DIS_WIDTH+2:0 ] b_cost_stage_5_w     ;

reg  signed    [DIS_WIDTH+2:0 ] b_cost_stage_0_r     ;
reg  signed    [DIS_WIDTH+2:0 ] b_cost_stage_1_r     ;
reg  signed    [DIS_WIDTH+2:0 ] b_cost_stage_2_r     ;
reg  signed    [DIS_WIDTH+2:0 ] b_cost_stage_3_r     ;
reg  signed    [DIS_WIDTH+2:0 ] b_cost_stage_4_r     ;
reg  signed    [DIS_WIDTH+2:0 ] b_cost_stage_5_r     ;

wire          [         2:0 ] b_band_stage_0_w     ;
wire          [         2:0 ] b_band_stage_1_w     ;
wire          [         2:0 ] b_band_stage_2_w     ;
wire          [         2:0 ] b_band_stage_3_w     ;
wire          [         2:0 ] b_band_stage_4_w     ;
wire          [         2:0 ] b_band_stage_5_w     ;

reg           [         2:0 ] b_band_stage_0_r     ;
reg           [         2:0 ] b_band_stage_1_r     ;
reg           [         2:0 ] b_band_stage_2_r     ;
reg           [         2:0 ] b_band_stage_3_r     ;
reg           [         2:0 ] b_band_stage_4_r     ;
reg           [         2:0 ] b_band_stage_5_r     ;

wire  signed  [DIS_WIDTH+2:0 ] b_cost_w            ;
wire          [          2:0 ] b_band_w            ;
reg           [          4:0 ] b_band_final_r      ;
reg   signed  [         11:0 ] b_offset_final_r    ;


// reg signals  b_offset__r 
always @(posedge clk or negedge rst_n) begin       
    if(!rst_n)  begin                              
        b_offset_0_r <= 3'd0 ;b_offset_1_r <= 3'd0 ;b_offset_2_r <= 3'd0 ;b_offset_3_r <= 3'd0 ;
        b_offset_4_r <= 3'd0 ;b_offset_5_r <= 3'd0 ;b_offset_6_r <= 3'd0 ;b_offset_7_r <= 3'd0 ;
        b_offset_8_r <= 3'd0 ;b_offset_9_r <= 3'd0 ;b_offset_10_r <= 3'd0 ;b_offset_11_r <= 3'd0 ;
        b_offset_12_r <= 3'd0 ;b_offset_13_r <= 3'd0 ;b_offset_14_r <= 3'd0 ;b_offset_15_r <= 3'd0 ;
        b_offset_16_r <= 3'd0 ;b_offset_17_r <= 3'd0 ;b_offset_18_r <= 3'd0 ;b_offset_19_r <= 3'd0 ;
        b_offset_20_r <= 3'd0 ;b_offset_21_r <= 3'd0 ;b_offset_22_r <= 3'd0 ;b_offset_23_r <= 3'd0 ;
        b_offset_24_r <= 3'd0 ;b_offset_25_r <= 3'd0 ;b_offset_26_r <= 3'd0 ;b_offset_27_r <= 3'd0 ;
        b_offset_28_r <= 3'd0 ;b_offset_29_r <= 3'd0 ;b_offset_30_r <= 3'd0 ;b_offset_31_r <= 3'd0 ;
    end
    else if(data_valid_i)  begin                    
        b_offset_0_r <= b_offset_0_i ;b_offset_1_r <= b_offset_1_i ;
        b_offset_2_r <= b_offset_2_i ;b_offset_3_r <= b_offset_3_i ;
        b_offset_4_r <= b_offset_4_i ;b_offset_5_r <= b_offset_5_i ;
        b_offset_6_r <= b_offset_6_i ;b_offset_7_r <= b_offset_7_i ;
        b_offset_8_r <= b_offset_8_i ;b_offset_9_r <= b_offset_9_i ;
        b_offset_10_r <= b_offset_10_i ;b_offset_11_r <= b_offset_11_i ;
        b_offset_12_r <= b_offset_12_i ;b_offset_13_r <= b_offset_13_i ;
        b_offset_14_r <= b_offset_14_i ;b_offset_15_r <= b_offset_15_i ;
        b_offset_16_r <= b_offset_16_i ;b_offset_17_r <= b_offset_17_i ;
        b_offset_18_r <= b_offset_18_i ;b_offset_19_r <= b_offset_19_i ;
        b_offset_20_r <= b_offset_20_i ;b_offset_21_r <= b_offset_21_i ;
        b_offset_22_r <= b_offset_22_i ;b_offset_23_r <= b_offset_23_i ;
        b_offset_24_r <= b_offset_24_i ;b_offset_25_r <= b_offset_25_i ;
        b_offset_26_r <= b_offset_26_i ;b_offset_27_r <= b_offset_27_i ;
        b_offset_28_r <= b_offset_28_i ;b_offset_29_r <= b_offset_29_i ;
        b_offset_30_r <= b_offset_30_i ;b_offset_31_r <= b_offset_31_i ;
    end
	else if(data_over_i)   begin                   
        b_offset_0_r <= 3'd0 ;b_offset_1_r <= 3'd0 ;b_offset_2_r <= 3'd0 ;b_offset_3_r <= 3'd0 ;
        b_offset_4_r <= 3'd0 ;b_offset_5_r <= 3'd0 ;b_offset_6_r <= 3'd0 ;b_offset_7_r <= 3'd0 ;
        b_offset_8_r <= 3'd0 ;b_offset_9_r <= 3'd0 ;b_offset_10_r <= 3'd0 ;b_offset_11_r <= 3'd0 ;
        b_offset_12_r <= 3'd0 ;b_offset_13_r <= 3'd0 ;b_offset_14_r <= 3'd0 ;b_offset_15_r <= 3'd0 ;
        b_offset_16_r <= 3'd0 ;b_offset_17_r <= 3'd0 ;b_offset_18_r <= 3'd0 ;b_offset_19_r <= 3'd0 ;
        b_offset_20_r <= 3'd0 ;b_offset_21_r <= 3'd0 ;b_offset_22_r <= 3'd0 ;b_offset_23_r <= 3'd0 ;
        b_offset_24_r <= 3'd0 ;b_offset_25_r <= 3'd0 ;b_offset_26_r <= 3'd0 ;b_offset_27_r <= 3'd0 ;
        b_offset_28_r <= 3'd0 ;b_offset_29_r <= 3'd0 ;b_offset_30_r <= 3'd0 ;b_offset_31_r <= 3'd0 ;
    end
end

//reg signals  b_distortion__r 
always @(posedge clk or negedge rst_n) begin       
    if(!rst_n)  begin                              
        b_distortion_0_r <= 'd0 ;b_distortion_1_r <= 'd0 ;b_distortion_2_r <= 'd0 ;b_distortion_3_r <= 'd0 ;
        b_distortion_4_r <= 'd0 ;b_distortion_5_r <= 'd0 ;b_distortion_6_r <= 'd0 ;b_distortion_7_r <= 'd0 ;
        b_distortion_8_r <= 'd0 ;b_distortion_9_r <= 'd0 ;b_distortion_10_r <= 'd0 ;b_distortion_11_r <= 'd0 ;
        b_distortion_12_r <= 'd0 ;b_distortion_13_r <= 'd0 ;b_distortion_14_r <= 'd0 ;b_distortion_15_r <= 'd0 ;
        b_distortion_16_r <= 'd0 ;b_distortion_17_r <= 'd0 ;b_distortion_18_r <= 'd0 ;b_distortion_19_r <= 'd0 ;
        b_distortion_20_r <= 'd0 ;b_distortion_21_r <= 'd0 ;b_distortion_22_r <= 'd0 ;b_distortion_23_r <= 'd0 ;
        b_distortion_24_r <= 'd0 ;b_distortion_25_r <= 'd0 ;b_distortion_26_r <= 'd0 ;b_distortion_27_r <= 'd0 ;
        b_distortion_28_r <= 'd0 ;b_distortion_29_r <= 'd0 ;b_distortion_30_r <= 'd0 ;b_distortion_31_r <= 'd0 ;
    end
    else if(data_valid_i)  begin                    
        b_distortion_0_r <= b_distortion_0_i ;b_distortion_1_r <= b_distortion_1_i ;
        b_distortion_2_r <= b_distortion_2_i ;b_distortion_3_r <= b_distortion_3_i ;
        b_distortion_4_r <= b_distortion_4_i ;b_distortion_5_r <= b_distortion_5_i ;
        b_distortion_6_r <= b_distortion_6_i ;b_distortion_7_r <= b_distortion_7_i ;
        b_distortion_8_r <= b_distortion_8_i ;b_distortion_9_r <= b_distortion_9_i ;
        b_distortion_10_r <= b_distortion_10_i ;b_distortion_11_r <= b_distortion_11_i ;
        b_distortion_12_r <= b_distortion_12_i ;b_distortion_13_r <= b_distortion_13_i ;
        b_distortion_14_r <= b_distortion_14_i ;b_distortion_15_r <= b_distortion_15_i ;
        b_distortion_16_r <= b_distortion_16_i ;b_distortion_17_r <= b_distortion_17_i ;
        b_distortion_18_r <= b_distortion_18_i ;b_distortion_19_r <= b_distortion_19_i ;
        b_distortion_20_r <= b_distortion_20_i ;b_distortion_21_r <= b_distortion_21_i ;
        b_distortion_22_r <= b_distortion_22_i ;b_distortion_23_r <= b_distortion_23_i ;
        b_distortion_24_r <= b_distortion_24_i ;b_distortion_25_r <= b_distortion_25_i ;
        b_distortion_26_r <= b_distortion_26_i ;b_distortion_27_r <= b_distortion_27_i ;
        b_distortion_28_r <= b_distortion_28_i ;b_distortion_29_r <= b_distortion_29_i ;
        b_distortion_30_r <= b_distortion_30_i ;b_distortion_31_r <= b_distortion_31_i ;
    end
	else if(data_over_i)   begin                   
        b_distortion_0_r <= 'd0 ;b_distortion_1_r <= 'd0 ;b_distortion_2_r <= 'd0 ;b_distortion_3_r <= 'd0 ;
        b_distortion_4_r <= 'd0 ;b_distortion_5_r <= 'd0 ;b_distortion_6_r <= 'd0 ;b_distortion_7_r <= 'd0 ;
        b_distortion_8_r <= 'd0 ;b_distortion_9_r <= 'd0 ;b_distortion_10_r <= 'd0 ;b_distortion_11_r <= 'd0 ;
        b_distortion_12_r <= 'd0 ;b_distortion_13_r <= 'd0 ;b_distortion_14_r <= 'd0 ;b_distortion_15_r <= 'd0 ;
        b_distortion_16_r <= 'd0 ;b_distortion_17_r <= 'd0 ;b_distortion_18_r <= 'd0 ;b_distortion_19_r <= 'd0 ;
        b_distortion_20_r <= 'd0 ;b_distortion_21_r <= 'd0 ;b_distortion_22_r <= 'd0 ;b_distortion_23_r <= 'd0 ;
        b_distortion_24_r <= 'd0 ;b_distortion_25_r <= 'd0 ;b_distortion_26_r <= 'd0 ;b_distortion_27_r <= 'd0 ;
        b_distortion_28_r <= 'd0 ;b_distortion_29_r <= 'd0 ;b_distortion_30_r <= 'd0 ;b_distortion_31_r <= 'd0 ;
    end
end

// calculation b_offset_abs__r  
always @* begin                                               
    case(b_offset_0_r[2])                                     
        1'b1 : b_offset_abs_0_r   =   {~b_offset_0_r} + 1'b1 ;
        1'b0 : b_offset_abs_0_r   =    b_offset_0_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_1_r[2])                                     
        1'b1 : b_offset_abs_1_r   =   {~b_offset_1_r} + 1'b1 ;
        1'b0 : b_offset_abs_1_r   =    b_offset_1_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_2_r[2])                                     
        1'b1 : b_offset_abs_2_r   =   {~b_offset_2_r} + 1'b1 ;
        1'b0 : b_offset_abs_2_r   =    b_offset_2_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_3_r[2])                                     
        1'b1 : b_offset_abs_3_r   =   {~b_offset_3_r} + 1'b1 ;
        1'b0 : b_offset_abs_3_r   =    b_offset_3_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_4_r[2])                                     
        1'b1 : b_offset_abs_4_r   =   {~b_offset_4_r} + 1'b1 ;
        1'b0 : b_offset_abs_4_r   =    b_offset_4_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_5_r[2])                                     
        1'b1 : b_offset_abs_5_r   =   {~b_offset_5_r} + 1'b1 ;
        1'b0 : b_offset_abs_5_r   =    b_offset_5_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_6_r[2])                                     
        1'b1 : b_offset_abs_6_r   =   {~b_offset_6_r} + 1'b1 ;
        1'b0 : b_offset_abs_6_r   =    b_offset_6_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_7_r[2])                                     
        1'b1 : b_offset_abs_7_r   =   {~b_offset_7_r} + 1'b1 ;
        1'b0 : b_offset_abs_7_r   =    b_offset_7_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_8_r[2])                                     
        1'b1 : b_offset_abs_8_r   =   {~b_offset_8_r} + 1'b1 ;
        1'b0 : b_offset_abs_8_r   =    b_offset_8_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_9_r[2])                                     
        1'b1 : b_offset_abs_9_r   =   {~b_offset_9_r} + 1'b1 ;
        1'b0 : b_offset_abs_9_r   =    b_offset_9_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_10_r[2])                                     
        1'b1 : b_offset_abs_10_r   =   {~b_offset_10_r} + 1'b1 ;
        1'b0 : b_offset_abs_10_r   =    b_offset_10_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_11_r[2])                                     
        1'b1 : b_offset_abs_11_r   =   {~b_offset_11_r} + 1'b1 ;
        1'b0 : b_offset_abs_11_r   =    b_offset_11_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_12_r[2])                                     
        1'b1 : b_offset_abs_12_r   =   {~b_offset_12_r} + 1'b1 ;
        1'b0 : b_offset_abs_12_r   =    b_offset_12_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_13_r[2])                                     
        1'b1 : b_offset_abs_13_r   =   {~b_offset_13_r} + 1'b1 ;
        1'b0 : b_offset_abs_13_r   =    b_offset_13_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_14_r[2])                                     
        1'b1 : b_offset_abs_14_r   =   {~b_offset_14_r} + 1'b1 ;
        1'b0 : b_offset_abs_14_r   =    b_offset_14_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_15_r[2])                                     
        1'b1 : b_offset_abs_15_r   =   {~b_offset_15_r} + 1'b1 ;
        1'b0 : b_offset_abs_15_r   =    b_offset_15_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_16_r[2])                                     
        1'b1 : b_offset_abs_16_r   =   {~b_offset_16_r} + 1'b1 ;
        1'b0 : b_offset_abs_16_r   =    b_offset_16_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_17_r[2])                                     
        1'b1 : b_offset_abs_17_r   =   {~b_offset_17_r} + 1'b1 ;
        1'b0 : b_offset_abs_17_r   =    b_offset_17_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_18_r[2])                                     
        1'b1 : b_offset_abs_18_r   =   {~b_offset_18_r} + 1'b1 ;
        1'b0 : b_offset_abs_18_r   =    b_offset_18_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_19_r[2])                                     
        1'b1 : b_offset_abs_19_r   =   {~b_offset_19_r} + 1'b1 ;
        1'b0 : b_offset_abs_19_r   =    b_offset_19_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_20_r[2])                                     
        1'b1 : b_offset_abs_20_r   =   {~b_offset_20_r} + 1'b1 ;
        1'b0 : b_offset_abs_20_r   =    b_offset_20_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_21_r[2])                                     
        1'b1 : b_offset_abs_21_r   =   {~b_offset_21_r} + 1'b1 ;
        1'b0 : b_offset_abs_21_r   =    b_offset_21_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_22_r[2])                                     
        1'b1 : b_offset_abs_22_r   =   {~b_offset_22_r} + 1'b1 ;
        1'b0 : b_offset_abs_22_r   =    b_offset_22_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_23_r[2])                                     
        1'b1 : b_offset_abs_23_r   =   {~b_offset_23_r} + 1'b1 ;
        1'b0 : b_offset_abs_23_r   =    b_offset_23_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_24_r[2])                                     
        1'b1 : b_offset_abs_24_r   =   {~b_offset_24_r} + 1'b1 ;
        1'b0 : b_offset_abs_24_r   =    b_offset_24_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_25_r[2])                                     
        1'b1 : b_offset_abs_25_r   =   {~b_offset_25_r} + 1'b1 ;
        1'b0 : b_offset_abs_25_r   =    b_offset_25_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_26_r[2])                                     
        1'b1 : b_offset_abs_26_r   =   {~b_offset_26_r} + 1'b1 ;
        1'b0 : b_offset_abs_26_r   =    b_offset_26_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_27_r[2])                                     
        1'b1 : b_offset_abs_27_r   =   {~b_offset_27_r} + 1'b1 ;
        1'b0 : b_offset_abs_27_r   =    b_offset_27_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_28_r[2])                                     
        1'b1 : b_offset_abs_28_r   =   {~b_offset_28_r} + 1'b1 ;
        1'b0 : b_offset_abs_28_r   =    b_offset_28_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_29_r[2])                                     
        1'b1 : b_offset_abs_29_r   =   {~b_offset_29_r} + 1'b1 ;
        1'b0 : b_offset_abs_29_r   =    b_offset_29_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_30_r[2])                                     
        1'b1 : b_offset_abs_30_r   =   {~b_offset_30_r} + 1'b1 ;
        1'b0 : b_offset_abs_30_r   =    b_offset_30_r          ;
    endcase                                                     
end                                                           

always @* begin                                               
    case(b_offset_31_r[2])                                     
        1'b1 : b_offset_abs_31_r   =   {~b_offset_31_r} + 1'b1 ;
        1'b0 : b_offset_abs_31_r   =    b_offset_31_r          ;
    endcase                                                     
end                                                           


// calculation b_offset_abs_t_r  
assign  b_offset_abs_0t3_w  =   b_offset_abs_0_r  +  b_offset_abs_1_r + b_offset_abs_2_r  +  b_offset_abs_3_r ;
assign  b_offset_abs_1t4_w  =   b_offset_abs_1_r  +  b_offset_abs_2_r + b_offset_abs_3_r  +  b_offset_abs_4_r ;
assign  b_offset_abs_2t5_w  =   b_offset_abs_2_r  +  b_offset_abs_3_r + b_offset_abs_4_r  +  b_offset_abs_5_r ;
assign  b_offset_abs_3t6_w  =   b_offset_abs_3_r  +  b_offset_abs_4_r + b_offset_abs_5_r  +  b_offset_abs_6_r ;
assign  b_offset_abs_4t7_w  =   b_offset_abs_4_r  +  b_offset_abs_5_r + b_offset_abs_6_r  +  b_offset_abs_7_r ;
assign  b_offset_abs_5t8_w  =   b_offset_abs_5_r  +  b_offset_abs_6_r + b_offset_abs_7_r  +  b_offset_abs_8_r ;
assign  b_offset_abs_6t9_w  =   b_offset_abs_6_r  +  b_offset_abs_7_r + b_offset_abs_8_r  +  b_offset_abs_9_r ;
assign  b_offset_abs_7t10_w  =   b_offset_abs_7_r  +  b_offset_abs_8_r + b_offset_abs_9_r  +  b_offset_abs_10_r ;
assign  b_offset_abs_8t11_w  =   b_offset_abs_8_r  +  b_offset_abs_9_r + b_offset_abs_10_r  +  b_offset_abs_11_r ;
assign  b_offset_abs_9t12_w  =   b_offset_abs_9_r  +  b_offset_abs_10_r + b_offset_abs_11_r  +  b_offset_abs_12_r ;
assign  b_offset_abs_10t13_w  =   b_offset_abs_10_r  +  b_offset_abs_11_r + b_offset_abs_12_r  +  b_offset_abs_13_r ;
assign  b_offset_abs_11t14_w  =   b_offset_abs_11_r  +  b_offset_abs_12_r + b_offset_abs_13_r  +  b_offset_abs_14_r ;
assign  b_offset_abs_12t15_w  =   b_offset_abs_12_r  +  b_offset_abs_13_r + b_offset_abs_14_r  +  b_offset_abs_15_r ;
assign  b_offset_abs_13t16_w  =   b_offset_abs_13_r  +  b_offset_abs_14_r + b_offset_abs_15_r  +  b_offset_abs_16_r ;
assign  b_offset_abs_14t17_w  =   b_offset_abs_14_r  +  b_offset_abs_15_r + b_offset_abs_16_r  +  b_offset_abs_17_r ;
assign  b_offset_abs_15t18_w  =   b_offset_abs_15_r  +  b_offset_abs_16_r + b_offset_abs_17_r  +  b_offset_abs_18_r ;
assign  b_offset_abs_16t19_w  =   b_offset_abs_16_r  +  b_offset_abs_17_r + b_offset_abs_18_r  +  b_offset_abs_19_r ;
assign  b_offset_abs_17t20_w  =   b_offset_abs_17_r  +  b_offset_abs_18_r + b_offset_abs_19_r  +  b_offset_abs_20_r ;
assign  b_offset_abs_18t21_w  =   b_offset_abs_18_r  +  b_offset_abs_19_r + b_offset_abs_20_r  +  b_offset_abs_21_r ;
assign  b_offset_abs_19t22_w  =   b_offset_abs_19_r  +  b_offset_abs_20_r + b_offset_abs_21_r  +  b_offset_abs_22_r ;
assign  b_offset_abs_20t23_w  =   b_offset_abs_20_r  +  b_offset_abs_21_r + b_offset_abs_22_r  +  b_offset_abs_23_r ;
assign  b_offset_abs_21t24_w  =   b_offset_abs_21_r  +  b_offset_abs_22_r + b_offset_abs_23_r  +  b_offset_abs_24_r ;
assign  b_offset_abs_22t25_w  =   b_offset_abs_22_r  +  b_offset_abs_23_r + b_offset_abs_24_r  +  b_offset_abs_25_r ;
assign  b_offset_abs_23t26_w  =   b_offset_abs_23_r  +  b_offset_abs_24_r + b_offset_abs_25_r  +  b_offset_abs_26_r ;
assign  b_offset_abs_24t27_w  =   b_offset_abs_24_r  +  b_offset_abs_25_r + b_offset_abs_26_r  +  b_offset_abs_27_r ;
assign  b_offset_abs_25t28_w  =   b_offset_abs_25_r  +  b_offset_abs_26_r + b_offset_abs_27_r  +  b_offset_abs_28_r ;
assign  b_offset_abs_26t29_w  =   b_offset_abs_26_r  +  b_offset_abs_27_r + b_offset_abs_28_r  +  b_offset_abs_29_r ;
assign  b_offset_abs_27t30_w  =   b_offset_abs_27_r  +  b_offset_abs_28_r + b_offset_abs_29_r  +  b_offset_abs_30_r ;
assign  b_offset_abs_28t31_w  =   b_offset_abs_28_r  +  b_offset_abs_29_r + b_offset_abs_30_r  +  b_offset_abs_31_r ;

// calculation b_offset_abs_t_r  
assign  b_offset_0t3_w  =   {1'b0,b_offset_abs_0t3_w};
assign  b_offset_1t4_w  =   {1'b0,b_offset_abs_1t4_w};
assign  b_offset_2t5_w  =   {1'b0,b_offset_abs_2t5_w};
assign  b_offset_3t6_w  =   {1'b0,b_offset_abs_3t6_w};
assign  b_offset_4t7_w  =   {1'b0,b_offset_abs_4t7_w};
assign  b_offset_5t8_w  =   {1'b0,b_offset_abs_5t8_w};
assign  b_offset_6t9_w  =   {1'b0,b_offset_abs_6t9_w};
assign  b_offset_7t10_w  =   {1'b0,b_offset_abs_7t10_w};
assign  b_offset_8t11_w  =   {1'b0,b_offset_abs_8t11_w};
assign  b_offset_9t12_w  =   {1'b0,b_offset_abs_9t12_w};
assign  b_offset_10t13_w  =   {1'b0,b_offset_abs_10t13_w};
assign  b_offset_11t14_w  =   {1'b0,b_offset_abs_11t14_w};
assign  b_offset_12t15_w  =   {1'b0,b_offset_abs_12t15_w};
assign  b_offset_13t16_w  =   {1'b0,b_offset_abs_13t16_w};
assign  b_offset_14t17_w  =   {1'b0,b_offset_abs_14t17_w};
assign  b_offset_15t18_w  =   {1'b0,b_offset_abs_15t18_w};
assign  b_offset_16t19_w  =   {1'b0,b_offset_abs_16t19_w};
assign  b_offset_17t20_w  =   {1'b0,b_offset_abs_17t20_w};
assign  b_offset_18t21_w  =   {1'b0,b_offset_abs_18t21_w};
assign  b_offset_19t22_w  =   {1'b0,b_offset_abs_19t22_w};
assign  b_offset_20t23_w  =   {1'b0,b_offset_abs_20t23_w};
assign  b_offset_21t24_w  =   {1'b0,b_offset_abs_21t24_w};
assign  b_offset_22t25_w  =   {1'b0,b_offset_abs_22t25_w};
assign  b_offset_23t26_w  =   {1'b0,b_offset_abs_23t26_w};
assign  b_offset_24t27_w  =   {1'b0,b_offset_abs_24t27_w};
assign  b_offset_25t28_w  =   {1'b0,b_offset_abs_25t28_w};
assign  b_offset_26t29_w  =   {1'b0,b_offset_abs_26t29_w};
assign  b_offset_27t30_w  =   {1'b0,b_offset_abs_27t30_w};
assign  b_offset_28t31_w  =   {1'b0,b_offset_abs_28t31_w};

// calculation b_distortion_t_r  
assign  b_distortion_0t3_w  =   b_distortion_0_r  +  b_distortion_1_r + b_distortion_2_r  +  b_distortion_3_r;
assign  b_distortion_1t4_w  =   b_distortion_1_r  +  b_distortion_2_r + b_distortion_3_r  +  b_distortion_4_r;
assign  b_distortion_2t5_w  =   b_distortion_2_r  +  b_distortion_3_r + b_distortion_4_r  +  b_distortion_5_r;
assign  b_distortion_3t6_w  =   b_distortion_3_r  +  b_distortion_4_r + b_distortion_5_r  +  b_distortion_6_r;
assign  b_distortion_4t7_w  =   b_distortion_4_r  +  b_distortion_5_r + b_distortion_6_r  +  b_distortion_7_r;
assign  b_distortion_5t8_w  =   b_distortion_5_r  +  b_distortion_6_r + b_distortion_7_r  +  b_distortion_8_r;
assign  b_distortion_6t9_w  =   b_distortion_6_r  +  b_distortion_7_r + b_distortion_8_r  +  b_distortion_9_r;
assign  b_distortion_7t10_w  =   b_distortion_7_r  +  b_distortion_8_r + b_distortion_9_r  +  b_distortion_10_r;
assign  b_distortion_8t11_w  =   b_distortion_8_r  +  b_distortion_9_r + b_distortion_10_r  +  b_distortion_11_r;
assign  b_distortion_9t12_w  =   b_distortion_9_r  +  b_distortion_10_r + b_distortion_11_r  +  b_distortion_12_r;
assign  b_distortion_10t13_w  =   b_distortion_10_r  +  b_distortion_11_r + b_distortion_12_r  +  b_distortion_13_r;
assign  b_distortion_11t14_w  =   b_distortion_11_r  +  b_distortion_12_r + b_distortion_13_r  +  b_distortion_14_r;
assign  b_distortion_12t15_w  =   b_distortion_12_r  +  b_distortion_13_r + b_distortion_14_r  +  b_distortion_15_r;
assign  b_distortion_13t16_w  =   b_distortion_13_r  +  b_distortion_14_r + b_distortion_15_r  +  b_distortion_16_r;
assign  b_distortion_14t17_w  =   b_distortion_14_r  +  b_distortion_15_r + b_distortion_16_r  +  b_distortion_17_r;
assign  b_distortion_15t18_w  =   b_distortion_15_r  +  b_distortion_16_r + b_distortion_17_r  +  b_distortion_18_r;
assign  b_distortion_16t19_w  =   b_distortion_16_r  +  b_distortion_17_r + b_distortion_18_r  +  b_distortion_19_r;
assign  b_distortion_17t20_w  =   b_distortion_17_r  +  b_distortion_18_r + b_distortion_19_r  +  b_distortion_20_r;
assign  b_distortion_18t21_w  =   b_distortion_18_r  +  b_distortion_19_r + b_distortion_20_r  +  b_distortion_21_r;
assign  b_distortion_19t22_w  =   b_distortion_19_r  +  b_distortion_20_r + b_distortion_21_r  +  b_distortion_22_r;
assign  b_distortion_20t23_w  =   b_distortion_20_r  +  b_distortion_21_r + b_distortion_22_r  +  b_distortion_23_r;
assign  b_distortion_21t24_w  =   b_distortion_21_r  +  b_distortion_22_r + b_distortion_23_r  +  b_distortion_24_r;
assign  b_distortion_22t25_w  =   b_distortion_22_r  +  b_distortion_23_r + b_distortion_24_r  +  b_distortion_25_r;
assign  b_distortion_23t26_w  =   b_distortion_23_r  +  b_distortion_24_r + b_distortion_25_r  +  b_distortion_26_r;
assign  b_distortion_24t27_w  =   b_distortion_24_r  +  b_distortion_25_r + b_distortion_26_r  +  b_distortion_27_r;
assign  b_distortion_25t28_w  =   b_distortion_25_r  +  b_distortion_26_r + b_distortion_27_r  +  b_distortion_28_r;
assign  b_distortion_26t29_w  =   b_distortion_26_r  +  b_distortion_27_r + b_distortion_28_r  +  b_distortion_29_r;
assign  b_distortion_27t30_w  =   b_distortion_27_r  +  b_distortion_28_r + b_distortion_29_r  +  b_distortion_30_r;
assign  b_distortion_28t31_w  =   b_distortion_28_r  +  b_distortion_29_r + b_distortion_30_r  +  b_distortion_31_r;

// calculation b_cost_t_r  
assign  b_cost_0t3_w  =   b_distortion_0t3_w +  b_offset_0t3_w;
assign  b_cost_1t4_w  =   b_distortion_1t4_w +  b_offset_1t4_w;
assign  b_cost_2t5_w  =   b_distortion_2t5_w +  b_offset_2t5_w;
assign  b_cost_3t6_w  =   b_distortion_3t6_w +  b_offset_3t6_w;
assign  b_cost_4t7_w  =   b_distortion_4t7_w +  b_offset_4t7_w;
assign  b_cost_5t8_w  =   b_distortion_5t8_w +  b_offset_5t8_w;
assign  b_cost_6t9_w  =   b_distortion_6t9_w +  b_offset_6t9_w;
assign  b_cost_7t10_w  =   b_distortion_7t10_w +  b_offset_7t10_w;
assign  b_cost_8t11_w  =   b_distortion_8t11_w +  b_offset_8t11_w;
assign  b_cost_9t12_w  =   b_distortion_9t12_w +  b_offset_9t12_w;
assign  b_cost_10t13_w  =   b_distortion_10t13_w +  b_offset_10t13_w;
assign  b_cost_11t14_w  =   b_distortion_11t14_w +  b_offset_11t14_w;
assign  b_cost_12t15_w  =   b_distortion_12t15_w +  b_offset_12t15_w;
assign  b_cost_13t16_w  =   b_distortion_13t16_w +  b_offset_13t16_w;
assign  b_cost_14t17_w  =   b_distortion_14t17_w +  b_offset_14t17_w;
assign  b_cost_15t18_w  =   b_distortion_15t18_w +  b_offset_15t18_w;
assign  b_cost_16t19_w  =   b_distortion_16t19_w +  b_offset_16t19_w;
assign  b_cost_17t20_w  =   b_distortion_17t20_w +  b_offset_17t20_w;
assign  b_cost_18t21_w  =   b_distortion_18t21_w +  b_offset_18t21_w;
assign  b_cost_19t22_w  =   b_distortion_19t22_w +  b_offset_19t22_w;
assign  b_cost_20t23_w  =   b_distortion_20t23_w +  b_offset_20t23_w;
assign  b_cost_21t24_w  =   b_distortion_21t24_w +  b_offset_21t24_w;
assign  b_cost_22t25_w  =   b_distortion_22t25_w +  b_offset_22t25_w;
assign  b_cost_23t26_w  =   b_distortion_23t26_w +  b_offset_23t26_w;
assign  b_cost_24t27_w  =   b_distortion_24t27_w +  b_offset_24t27_w;
assign  b_cost_25t28_w  =   b_distortion_25t28_w +  b_offset_25t28_w;
assign  b_cost_26t29_w  =   b_distortion_26t29_w +  b_offset_26t29_w;
assign  b_cost_27t30_w  =   b_distortion_27t30_w +  b_offset_27t30_w;
assign  b_cost_28t31_w  =   b_distortion_28t31_w +  b_offset_28t31_w;

//---------------------------------------------------------------------------
//                                                                           
//               compare b_cost_t_r                                          
//                                                                           
//---------------------------------------------------------------------------

db_sao_compare_cost     ucomcost0(
                                .b_cost_0_i  ( b_cost_0t3_w         ),
                                .b_cost_1_i  ( b_cost_1t4_w         ),
                                .b_cost_2_i  ( b_cost_2t5_w         ),
                                .b_cost_3_i  ( b_cost_3t6_w         ),
                                .b_cost_4_i  ( b_cost_4t7_w         ),
                                .b_cost_o    ( b_cost_stage_0_w       ),
                                .b_band_o    ( b_band_stage_0_w       )
                        );
db_sao_compare_cost     ucomcost1(
                                .b_cost_0_i  ( b_cost_5t8_w         ),
                                .b_cost_1_i  ( b_cost_6t9_w         ),
                                .b_cost_2_i  ( b_cost_7t10_w         ),
                                .b_cost_3_i  ( b_cost_8t11_w         ),
                                .b_cost_4_i  ( b_cost_9t12_w         ),
                                .b_cost_o    ( b_cost_stage_1_w       ),
                                .b_band_o    ( b_band_stage_1_w       )
                        );
db_sao_compare_cost     ucomcost2(
                                .b_cost_0_i  ( b_cost_10t13_w         ),
                                .b_cost_1_i  ( b_cost_11t14_w         ),
                                .b_cost_2_i  ( b_cost_12t15_w         ),
                                .b_cost_3_i  ( b_cost_13t16_w         ),
                                .b_cost_4_i  ( b_cost_14t17_w         ),
                                .b_cost_o    ( b_cost_stage_2_w       ),
                                .b_band_o    ( b_band_stage_2_w       )
                        );
db_sao_compare_cost     ucomcost3(
                                .b_cost_0_i  ( b_cost_15t18_w         ),
                                .b_cost_1_i  ( b_cost_16t19_w         ),
                                .b_cost_2_i  ( b_cost_17t20_w         ),
                                .b_cost_3_i  ( b_cost_18t21_w         ),
                                .b_cost_4_i  ( b_cost_19t22_w         ),
                                .b_cost_o    ( b_cost_stage_3_w       ),
                                .b_band_o    ( b_band_stage_3_w       )
                        );
db_sao_compare_cost     ucomcost4(
                                .b_cost_0_i  ( b_cost_20t23_w         ),
                                .b_cost_1_i  ( b_cost_21t24_w         ),
                                .b_cost_2_i  ( b_cost_22t25_w         ),
                                .b_cost_3_i  ( b_cost_23t26_w         ),
                                .b_cost_4_i  ( b_cost_24t27_w         ),
                                .b_cost_o    ( b_cost_stage_4_w       ),
                                .b_band_o    ( b_band_stage_4_w       )
                        );

db_sao_compare_cost     ucomcost5(                                    
                                .b_cost_0_i  ( b_cost_25t28_w       ),
                                .b_cost_1_i  ( b_cost_26t29_w       ),
                                .b_cost_2_i  ( b_cost_27t30_w       ),
                                .b_cost_3_i  ( b_cost_28t31_w       ),
                                .b_cost_4_i  ( {1'b0,{(DIS_WIDTH+2){1'b1}}}),
                                .b_cost_o    ( b_cost_stage_5_w     ),
                                .b_band_o    ( b_band_stage_5_w     )
				        );

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin                        
        b_band_stage_0_r  <=  3'd0              ;
        b_band_stage_1_r  <=  3'd0              ;
        b_band_stage_2_r  <=  3'd0              ;
        b_band_stage_3_r  <=  3'd0              ;
        b_band_stage_4_r  <=  3'd0              ;
        b_band_stage_5_r  <=  3'd0              ;
    end                                     
	else begin                              
        b_band_stage_0_r  <=  b_band_stage_0_w  ;
        b_band_stage_1_r  <=  b_band_stage_1_w  ;
        b_band_stage_2_r  <=  b_band_stage_2_w  ;
        b_band_stage_3_r  <=  b_band_stage_3_w  ;
        b_band_stage_4_r  <=  b_band_stage_4_w  ;
        b_band_stage_5_r  <=  b_band_stage_5_w  ;
    end                                     
end                                         

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin                        
        b_cost_stage_0_r  <=   'd0              ;
        b_cost_stage_1_r  <=   'd0              ;
        b_cost_stage_2_r  <=   'd0              ;
        b_cost_stage_3_r  <=   'd0              ;
        b_cost_stage_4_r  <=   'd0              ;
        b_cost_stage_5_r  <=   'd0              ;
    end                                     
	else begin                              
        b_cost_stage_0_r  <=  b_cost_stage_0_w  ;
        b_cost_stage_1_r  <=  b_cost_stage_1_w  ;
        b_cost_stage_2_r  <=  b_cost_stage_2_w  ;
        b_cost_stage_3_r  <=  b_cost_stage_3_w  ;
        b_cost_stage_4_r  <=  b_cost_stage_4_w  ;
        b_cost_stage_5_r  <=  b_cost_stage_5_w  ;
    end                                     
end                                         

db_sao_compare_cost     ucomcost6(                                    
                                .b_cost_0_i  ( b_cost_stage_0_r     ),
                                .b_cost_1_i  ( b_cost_stage_1_r     ),
                                .b_cost_2_i  ( b_cost_stage_2_r     ),
                                .b_cost_3_i  ( b_cost_stage_3_r     ),
                                .b_cost_4_i  ( b_cost_stage_4_r     ),
                                .b_cost_o    ( b_cost_w             ),
                                .b_band_o    ( b_band_w             )
                            );

// calculation b_band_final_r                                      
always @(posedge clk or negedge rst_n) begin                       
	if(!rst_n)					                                   
		b_band_final_r   <=   5'd0    ;                            
	else if(b_cost_stage_5_r<b_cost_w)                             
		b_band_final_r   <=   5'd25  +  b_band_stage_5_r ;		   
	else                                                           
		case(b_band_w)                                             
		    3'd0 : b_band_final_r  <=   5'd0   +  b_band_stage_0_r; 
		    3'd1 : b_band_final_r  <=   5'd5   +  b_band_stage_1_r; 
		    3'd2 : b_band_final_r  <=   5'd10  +  b_band_stage_2_r; 
		    3'd3 : b_band_final_r  <=   5'd15  +  b_band_stage_3_r; 
		    3'd4 : b_band_final_r  <=   5'd20  +  b_band_stage_4_r; 
		  default: b_band_final_r  <=   5'd29                    ; 
		endcase				                                       
end                                                                

// calculation b_offset_final_r                 
always @* begin                                 
    case(b_band_final_r)                        
        5'd0 : b_offset_final_r  = {b_offset_3_r,b_offset_2_r,b_offset_1_r,b_offset_0_r};
        5'd1 : b_offset_final_r  = {b_offset_4_r,b_offset_3_r,b_offset_2_r,b_offset_1_r};
        5'd2 : b_offset_final_r  = {b_offset_5_r,b_offset_4_r,b_offset_3_r,b_offset_2_r};
        5'd3 : b_offset_final_r  = {b_offset_6_r,b_offset_5_r,b_offset_4_r,b_offset_3_r};
        5'd4 : b_offset_final_r  = {b_offset_7_r,b_offset_6_r,b_offset_5_r,b_offset_4_r};
        5'd5 : b_offset_final_r  = {b_offset_8_r,b_offset_7_r,b_offset_6_r,b_offset_5_r};
        5'd6 : b_offset_final_r  = {b_offset_9_r,b_offset_8_r,b_offset_7_r,b_offset_6_r};
        5'd7 : b_offset_final_r  = {b_offset_10_r,b_offset_9_r,b_offset_8_r,b_offset_7_r};
        5'd8 : b_offset_final_r  = {b_offset_11_r,b_offset_10_r,b_offset_9_r,b_offset_8_r};
        5'd9 : b_offset_final_r  = {b_offset_12_r,b_offset_11_r,b_offset_10_r,b_offset_9_r};
        5'd10 : b_offset_final_r  = {b_offset_13_r,b_offset_12_r,b_offset_11_r,b_offset_10_r};
        5'd11 : b_offset_final_r  = {b_offset_14_r,b_offset_13_r,b_offset_12_r,b_offset_11_r};
        5'd12 : b_offset_final_r  = {b_offset_15_r,b_offset_14_r,b_offset_13_r,b_offset_12_r};
        5'd13 : b_offset_final_r  = {b_offset_16_r,b_offset_15_r,b_offset_14_r,b_offset_13_r};
        5'd14 : b_offset_final_r  = {b_offset_17_r,b_offset_16_r,b_offset_15_r,b_offset_14_r};
        5'd15 : b_offset_final_r  = {b_offset_18_r,b_offset_17_r,b_offset_16_r,b_offset_15_r};
        5'd16 : b_offset_final_r  = {b_offset_19_r,b_offset_18_r,b_offset_17_r,b_offset_16_r};
        5'd17 : b_offset_final_r  = {b_offset_20_r,b_offset_19_r,b_offset_18_r,b_offset_17_r};
        5'd18 : b_offset_final_r  = {b_offset_21_r,b_offset_20_r,b_offset_19_r,b_offset_18_r};
        5'd19 : b_offset_final_r  = {b_offset_22_r,b_offset_21_r,b_offset_20_r,b_offset_19_r};
        5'd20 : b_offset_final_r  = {b_offset_23_r,b_offset_22_r,b_offset_21_r,b_offset_20_r};
        5'd21 : b_offset_final_r  = {b_offset_24_r,b_offset_23_r,b_offset_22_r,b_offset_21_r};
        5'd22 : b_offset_final_r  = {b_offset_25_r,b_offset_24_r,b_offset_23_r,b_offset_22_r};
        5'd23 : b_offset_final_r  = {b_offset_26_r,b_offset_25_r,b_offset_24_r,b_offset_23_r};
        5'd24 : b_offset_final_r  = {b_offset_27_r,b_offset_26_r,b_offset_25_r,b_offset_24_r};
        5'd25 : b_offset_final_r  = {b_offset_28_r,b_offset_27_r,b_offset_26_r,b_offset_25_r};
        5'd26 : b_offset_final_r  = {b_offset_29_r,b_offset_28_r,b_offset_27_r,b_offset_26_r};
        5'd27 : b_offset_final_r  = {b_offset_30_r,b_offset_29_r,b_offset_28_r,b_offset_27_r};
        5'd28 : b_offset_final_r  = {b_offset_31_r,b_offset_30_r,b_offset_29_r,b_offset_28_r};
      default:b_offset_final_r  = 12'd0 ;       
    endcase                                     
end                                             


assign   b_band_o       =     b_band_final_r     ;
assign   b_offset_o     =     b_offset_final_r   ;







endmodule
