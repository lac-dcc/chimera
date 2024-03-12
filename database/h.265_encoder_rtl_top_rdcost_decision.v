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
//  Filename      : rdcost_decision.v
//  Author        : Huang Lei Lei
//  Created       : 2014-10-21
//  Description   : linear approximation of RDcost 
//
//-------------------------------------------------------------------
//
//  Modified      : 2015-08-18 by HLL
//  Description   : abs logic of coe_x_abs corrected
//
//  $Id$
//
//-------------------------------------------------------------------

module rdcost_decision (
  clk               ,
  rst_n             ,

  pre_min_size_i    ,

  pre_qp_i          ,
  pre_sel_i         ,
  pre_size_i        ,
  pre_position_i    ,

  coe_val_i         ,
  coe_data_i        ,

  rec_val_i         ,
  rec_data_i        ,
  ori_data_i        ,

  cover_valid_o     ,
  cover_value_o
  );

//*** INPUT/OUPUT DECLRATION ***************************************************

  // global
  input               clk               ;
  input               rst_n             ;

  // sys ctrl
  input               pre_min_size_i    ;

  // pre information
  input [5    : 0]    pre_qp_i          ;
  input [1    : 0]    pre_sel_i         ;
  input [1    : 0]    pre_size_i        ;
  input [7    : 0]    pre_position_i    ;
  
  // coe data
  input               coe_val_i         ;
  input [511  : 0]    coe_data_i        ;

  // rec & ori data
  input               rec_val_i         ;
  input [255  : 0]    rec_data_i        ;
  input [255  : 0]    ori_data_i        ;

  // cover
  output reg          cover_valid_o     ;
  output reg          cover_value_o     ;


//*** WIRE/REG DECLRATION ******************************************************

  wire        [7  : 0]      rec_0_i    , ori_0_i     , rec_10_i    , ori_10_i    , rec_20_i    , ori_20_i    , rec_30_i    , ori_30_i    ;
  wire        [7  : 0]      rec_1_i    , ori_1_i     , rec_11_i    , ori_11_i    , rec_21_i    , ori_21_i    , rec_31_i    , ori_31_i    ;
  wire        [7  : 0]      rec_2_i    , ori_2_i     , rec_12_i    , ori_12_i    , rec_22_i    , ori_22_i    ;
  wire        [7  : 0]      rec_3_i    , ori_3_i     , rec_13_i    , ori_13_i    , rec_23_i    , ori_23_i    ;
  wire        [7  : 0]      rec_4_i    , ori_4_i     , rec_14_i    , ori_14_i    , rec_24_i    , ori_24_i    ;
  wire        [7  : 0]      rec_5_i    , ori_5_i     , rec_15_i    , ori_15_i    , rec_25_i    , ori_25_i    ;
  wire        [7  : 0]      rec_6_i    , ori_6_i     , rec_16_i    , ori_16_i    , rec_26_i    , ori_26_i    ;
  wire        [7  : 0]      rec_7_i    , ori_7_i     , rec_17_i    , ori_17_i    , rec_27_i    , ori_27_i    ;
  wire        [7  : 0]      rec_8_i    , ori_8_i     , rec_18_i    , ori_18_i    , rec_28_i    , ori_28_i    ;
  wire        [7  : 0]      rec_9_i    , ori_9_i     , rec_19_i    , ori_19_i    , rec_29_i    , ori_29_i    ;
                                                                                                            
  wire signed [15 : 0]      coe_0_i    , coe_10_i    , coe_20_i    , coe_30_i    ;
  wire signed [15 : 0]      coe_1_i    , coe_11_i    , coe_21_i    , coe_31_i    ;
  wire signed [15 : 0]      coe_2_i    , coe_12_i    , coe_22_i    ;
  wire signed [15 : 0]      coe_3_i    , coe_13_i    , coe_23_i    ;
  wire signed [15 : 0]      coe_4_i    , coe_14_i    , coe_24_i    ;
  wire signed [15 : 0]      coe_5_i    , coe_15_i    , coe_25_i    ;
  wire signed [15 : 0]      coe_6_i    , coe_16_i    , coe_26_i    ;
  wire signed [15 : 0]      coe_7_i    , coe_17_i    , coe_27_i    ;
  wire signed [15 : 0]      coe_8_i    , coe_18_i    , coe_28_i    ;
  wire signed [15 : 0]      coe_9_i    , coe_19_i    , coe_29_i    ;


//*** MAIN BODY ****************************************************************

//--- Global Signals -------------------

  assign { coe_0_i  ,coe_1_i  ,coe_2_i  ,coe_3_i  ,coe_4_i  ,coe_5_i  ,coe_6_i  ,coe_7_i  ,coe_8_i  ,coe_9_i  ,
           coe_10_i ,coe_11_i ,coe_12_i ,coe_13_i ,coe_14_i ,coe_15_i ,coe_16_i ,coe_17_i ,coe_18_i ,coe_19_i ,
           coe_20_i ,coe_21_i ,coe_22_i ,coe_23_i ,coe_24_i ,coe_25_i ,coe_26_i ,coe_27_i ,coe_28_i ,coe_29_i ,
           coe_30_i ,coe_31_i }
                                = coe_data_i ;
           
  assign { rec_0_i  ,rec_1_i  ,rec_2_i  ,rec_3_i  ,rec_4_i  ,rec_5_i  ,rec_6_i  ,rec_7_i  ,rec_8_i  ,rec_9_i  ,
           rec_10_i ,rec_11_i ,rec_12_i ,rec_13_i ,rec_14_i ,rec_15_i ,rec_16_i ,rec_17_i ,rec_18_i ,rec_19_i ,
           rec_20_i ,rec_21_i ,rec_22_i ,rec_23_i ,rec_24_i ,rec_25_i ,rec_26_i ,rec_27_i ,rec_28_i ,rec_29_i ,
           rec_30_i ,rec_31_i }
                                = rec_data_i ;
  
  assign { ori_0_i  ,ori_1_i  ,ori_2_i  ,ori_3_i  ,ori_4_i  ,ori_5_i  ,ori_6_i  ,ori_7_i  ,ori_8_i  ,ori_9_i  ,
           ori_10_i ,ori_11_i ,ori_12_i ,ori_13_i ,ori_14_i ,ori_15_i ,ori_16_i ,ori_17_i ,ori_18_i ,ori_19_i ,
           ori_20_i ,ori_21_i ,ori_22_i ,ori_23_i ,ori_24_i ,ori_25_i ,ori_26_i ,ori_27_i ,ori_28_i ,ori_29_i ,
           ori_30_i ,ori_31_i }
                                = ori_data_i ;

  reg [5:0] coe_cnt_r;
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      coe_cnt_r <= 'd0;
    else if( (cover_valid_o) )
      coe_cnt_r <= 'd0 ;
    else if( (coe_val_i=='d1) || ( (coe_cnt_r>='d01)&&(coe_cnt_r<='d40) ) ) begin
      coe_cnt_r <= coe_cnt_r + 'd1;
    end
  end

  reg [5:0] rec_cnt_r;
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      rec_cnt_r <= 'd0;
    else if( (cover_valid_o) )
      rec_cnt_r <= 'd0 ;
    else if( (rec_val_i=='d1) || ( (rec_cnt_r>='d01)&&(rec_cnt_r<='d40) ) ) begin
      rec_cnt_r <= rec_cnt_r + 'd1 ;
    end
  end


//--- Distortion -----------------------

  // pipeline 1
  wire signed [8:0] dif_0 = ori_0_i - rec_0_i ;
  wire signed [8:0] dif_1 = ori_1_i - rec_1_i ;
  wire signed [8:0] dif_2 = ori_2_i - rec_2_i ;
  wire signed [8:0] dif_3 = ori_3_i - rec_3_i ;
  wire signed [8:0] dif_4 = ori_4_i - rec_4_i ;
  wire signed [8:0] dif_5 = ori_5_i - rec_5_i ;
  wire signed [8:0] dif_6 = ori_6_i - rec_6_i ;
  wire signed [8:0] dif_7 = ori_7_i - rec_7_i ;
  wire signed [8:0] dif_8 = ori_8_i - rec_8_i ;
  wire signed [8:0] dif_9 = ori_9_i - rec_9_i ;
  
  wire signed [8:0] dif_10 = ori_10_i - rec_10_i ;
  wire signed [8:0] dif_11 = ori_11_i - rec_11_i ;
  wire signed [8:0] dif_12 = ori_12_i - rec_12_i ;
  wire signed [8:0] dif_13 = ori_13_i - rec_13_i ;
  wire signed [8:0] dif_14 = ori_14_i - rec_14_i ;
  wire signed [8:0] dif_15 = ori_15_i - rec_15_i ;
  wire signed [8:0] dif_16 = ori_16_i - rec_16_i ;
  wire signed [8:0] dif_17 = ori_17_i - rec_17_i ;
  wire signed [8:0] dif_18 = ori_18_i - rec_18_i ;
  wire signed [8:0] dif_19 = ori_19_i - rec_19_i ;

  wire signed [8:0] dif_20 = ori_20_i - rec_20_i ;
  wire signed [8:0] dif_21 = ori_21_i - rec_21_i ;
  wire signed [8:0] dif_22 = ori_22_i - rec_22_i ;
  wire signed [8:0] dif_23 = ori_23_i - rec_23_i ;
  wire signed [8:0] dif_24 = ori_24_i - rec_24_i ;
  wire signed [8:0] dif_25 = ori_25_i - rec_25_i ;
  wire signed [8:0] dif_26 = ori_26_i - rec_26_i ;
  wire signed [8:0] dif_27 = ori_27_i - rec_27_i ;
  wire signed [8:0] dif_28 = ori_28_i - rec_28_i ;
  wire signed [8:0] dif_29 = ori_29_i - rec_29_i ;

  wire signed [8:0] dif_30 = ori_30_i - rec_30_i ;
  wire signed [8:0] dif_31 = ori_31_i - rec_31_i ;

  wire [07:0] dif_0_abs  = ( dif_0[8]==0 ) ? dif_0[7:0] : (~dif_0+1) ;
  wire [07:0] dif_1_abs  = ( dif_1[8]==0 ) ? dif_1[7:0] : (~dif_1+1) ;
  wire [07:0] dif_2_abs  = ( dif_2[8]==0 ) ? dif_2[7:0] : (~dif_2+1) ;
  wire [07:0] dif_3_abs  = ( dif_3[8]==0 ) ? dif_3[7:0] : (~dif_3+1) ;
  wire [07:0] dif_4_abs  = ( dif_4[8]==0 ) ? dif_4[7:0] : (~dif_4+1) ;
  wire [07:0] dif_5_abs  = ( dif_5[8]==0 ) ? dif_5[7:0] : (~dif_5+1) ;
  wire [07:0] dif_6_abs  = ( dif_6[8]==0 ) ? dif_6[7:0] : (~dif_6+1) ;
  wire [07:0] dif_7_abs  = ( dif_7[8]==0 ) ? dif_7[7:0] : (~dif_7+1) ;
  wire [07:0] dif_8_abs  = ( dif_8[8]==0 ) ? dif_8[7:0] : (~dif_8+1) ;
  wire [07:0] dif_9_abs  = ( dif_9[8]==0 ) ? dif_9[7:0] : (~dif_9+1) ;
  
  wire [07:0] dif_10_abs = ( dif_10[8]==0 ) ? dif_10[7:0] : (~dif_10+1) ;
  wire [07:0] dif_11_abs = ( dif_11[8]==0 ) ? dif_11[7:0] : (~dif_11+1) ;
  wire [07:0] dif_12_abs = ( dif_12[8]==0 ) ? dif_12[7:0] : (~dif_12+1) ;
  wire [07:0] dif_13_abs = ( dif_13[8]==0 ) ? dif_13[7:0] : (~dif_13+1) ;
  wire [07:0] dif_14_abs = ( dif_14[8]==0 ) ? dif_14[7:0] : (~dif_14+1) ;
  wire [07:0] dif_15_abs = ( dif_15[8]==0 ) ? dif_15[7:0] : (~dif_15+1) ;
  wire [07:0] dif_16_abs = ( dif_16[8]==0 ) ? dif_16[7:0] : (~dif_16+1) ;
  wire [07:0] dif_17_abs = ( dif_17[8]==0 ) ? dif_17[7:0] : (~dif_17+1) ;
  wire [07:0] dif_18_abs = ( dif_18[8]==0 ) ? dif_18[7:0] : (~dif_18+1) ;
  wire [07:0] dif_19_abs = ( dif_19[8]==0 ) ? dif_19[7:0] : (~dif_19+1) ;

  wire [07:0] dif_20_abs = ( dif_20[8]==0 ) ? dif_20[7:0] : (~dif_20+1) ;
  wire [07:0] dif_21_abs = ( dif_21[8]==0 ) ? dif_21[7:0] : (~dif_21+1) ;
  wire [07:0] dif_22_abs = ( dif_22[8]==0 ) ? dif_22[7:0] : (~dif_22+1) ;
  wire [07:0] dif_23_abs = ( dif_23[8]==0 ) ? dif_23[7:0] : (~dif_23+1) ;
  wire [07:0] dif_24_abs = ( dif_24[8]==0 ) ? dif_24[7:0] : (~dif_24+1) ;
  wire [07:0] dif_25_abs = ( dif_25[8]==0 ) ? dif_25[7:0] : (~dif_25+1) ;
  wire [07:0] dif_26_abs = ( dif_26[8]==0 ) ? dif_26[7:0] : (~dif_26+1) ;
  wire [07:0] dif_27_abs = ( dif_27[8]==0 ) ? dif_27[7:0] : (~dif_27+1) ;
  wire [07:0] dif_28_abs = ( dif_28[8]==0 ) ? dif_28[7:0] : (~dif_28+1) ;
  wire [07:0] dif_29_abs = ( dif_29[8]==0 ) ? dif_29[7:0] : (~dif_29+1) ;
  
  wire [07:0] dif_30_abs = ( dif_30[8]==0 ) ? dif_30[7:0] : (~dif_30+1) ;
  wire [07:0] dif_31_abs = ( dif_31[8]==0 ) ? dif_31[7:0] : (~dif_31+1) ;

  wire [09:0] add_0 = dif_0_abs  + dif_1_abs  + dif_2_abs  + dif_3_abs  ;
  wire [09:0] add_1 = dif_4_abs  + dif_5_abs  + dif_6_abs  + dif_7_abs  ;
  wire [09:0] add_2 = dif_8_abs  + dif_9_abs  + dif_10_abs + dif_11_abs ;
  wire [09:0] add_3 = dif_12_abs + dif_13_abs + dif_14_abs + dif_15_abs ;
  wire [09:0] add_4 = dif_16_abs + dif_17_abs + dif_18_abs + dif_19_abs ;
  wire [09:0] add_5 = dif_20_abs + dif_21_abs + dif_22_abs + dif_23_abs ;
  wire [09:0] add_6 = dif_24_abs + dif_25_abs + dif_26_abs + dif_27_abs ;
  wire [09:0] add_7 = dif_28_abs + dif_29_abs + dif_30_abs + dif_31_abs ;

  wire [17:0] sse_0 = add_0 * add_0[9:2] ;
  wire [17:0] sse_1 = add_1 * add_1[9:2] ;
  wire [17:0] sse_2 = add_2 * add_2[9:2] ;
  wire [17:0] sse_3 = add_3 * add_3[9:2] ;
  wire [17:0] sse_4 = add_4 * add_4[9:2] ;
  wire [17:0] sse_5 = add_5 * add_5[9:2] ;
  wire [17:0] sse_6 = add_6 * add_6[9:2] ;
  wire [17:0] sse_7 = add_7 * add_7[9:2] ;

  reg  [17:0] sse_0_reg ,sse_1_reg ,sse_2_reg ,sse_3_reg ,sse_4_reg ,sse_5_reg ,sse_6_reg ,sse_7_reg ;

  always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
      sse_0_reg <= 'd0 ;
      sse_1_reg <= 'd0 ;
      sse_2_reg <= 'd0 ;
      sse_3_reg <= 'd0 ;
      sse_4_reg <= 'd0 ;
      sse_5_reg <= 'd0 ;
      sse_6_reg <= 'd0 ;
      sse_7_reg <= 'd0 ;
    end
    else begin
      sse_0_reg <= sse_0 ;
      sse_1_reg <= sse_1 ;
      sse_2_reg <= sse_2 ;
      sse_3_reg <= sse_3 ;
      sse_4_reg <= sse_4 ;
      sse_5_reg <= sse_5 ;
      sse_6_reg <= sse_6 ;
      sse_7_reg <= sse_7 ;
    end
  end

  // pipeline 2
  wire [17:0] sse_0_dec = sse_0_reg ;
  wire [17:0] sse_2_dec = sse_2_reg ;
  wire [17:0] sse_4_dec = sse_4_reg ;
  wire [17:0] sse_6_dec = sse_6_reg ;
  wire [17:0] sse_1_dec = ( pre_size_i==2'b00 ) ? 0 : sse_1_reg ;
  wire [17:0] sse_3_dec = ( pre_size_i==2'b00 ) ? 0 : sse_3_reg ;
  wire [17:0] sse_5_dec = ( pre_size_i==2'b00 ) ? 0 : sse_5_reg ;
  wire [17:0] sse_7_dec = ( pre_size_i==2'b00 ) ? 0 : sse_7_reg ;

  wire [21:0] sse_line = sse_0_reg + sse_1_reg + sse_2_dec + sse_3_dec + sse_4_dec + sse_5_dec + sse_6_dec + sse_7_dec ;

  reg  [21:0] sse_line_reg ;
  
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      sse_line_reg <= 'd0;
    else begin
      sse_line_reg <= sse_line;
    end
  end

  // pipeline 3
  reg[26:0] sse;
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      sse <= 'd0;
    else if( (rec_cnt_r=='d1) )
      sse <= 'd0;
    else if( (pre_sel_i=='d0) && ( ((pre_size_i=='d0)&&(rec_cnt_r<='d02)) ||
                                   ((pre_size_i=='d1)&&(rec_cnt_r<='d03)) ||
                                   ((pre_size_i=='d2)&&(rec_cnt_r<='d09)) ||
                                   ((pre_size_i=='d3)&&(rec_cnt_r<='d33)) 
                                 )
           )
      sse <= sse + sse_line_reg;
    else begin
      sse <= sse;
    end
  end

//--- Bitrate --------------------------

  // pipeline 1
  reg [11:0] a, b ;
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n ) begin
      a <= 'd0 ;
      b <= 'd0 ;
    end
    else if( coe_cnt_r==1 )begin
      case( pre_qp_i )
        6'd0    : begin a <= 'd1    ; b <= 'd1   ; end
        6'd1    : begin a <= 'd1    ; b <= 'd1   ; end
        6'd2    : begin a <= 'd1    ; b <= 'd1   ; end
        6'd3    : begin a <= 'd1    ; b <= 'd1   ; end
        6'd4    : begin a <= 'd1    ; b <= 'd2   ; end
        6'd5    : begin a <= 'd1    ; b <= 'd2   ; end
        6'd6    : begin a <= 'd1    ; b <= 'd2   ; end
        6'd7    : begin a <= 'd1    ; b <= 'd2   ; end
        6'd8    : begin a <= 'd1    ; b <= 'd3   ; end
        6'd9    : begin a <= 'd1    ; b <= 'd3   ; end
        6'd10   : begin a <= 'd1    ; b <= 'd4   ; end
        6'd11   : begin a <= 'd1    ; b <= 'd4   ; end
        6'd12   : begin a <= 'd1    ; b <= 'd5   ; end
        6'd13   : begin a <= 'd1    ; b <= 'd5   ; end
        6'd14   : begin a <= 'd1    ; b <= 'd6   ; end
        6'd15   : begin a <= 'd1    ; b <= 'd7   ; end
        6'd16   : begin a <= 'd1    ; b <= 'd8   ; end
        6'd17   : begin a <= 'd1    ; b <= 'd9   ; end
        6'd18   : begin a <= 'd1    ; b <= 'd11  ; end
        6'd19   : begin a <= 'd1    ; b <= 'd13  ; end
        6'd20   : begin a <= 'd1    ; b <= 'd15  ; end
        6'd21   : begin a <= 'd1    ; b <= 'd17  ; end
        6'd22   : begin a <= 'd2    ; b <= 'd19  ; end
        6'd23   : begin a <= 'd2    ; b <= 'd22  ; end
        6'd24   : begin a <= 'd2    ; b <= 'd25  ; end
        6'd25   : begin a <= 'd3    ; b <= 'd29  ; end
        6'd26   : begin a <= 'd4    ; b <= 'd33  ; end
        6'd27   : begin a <= 'd5    ; b <= 'd38  ; end
        6'd28   : begin a <= 'd6    ; b <= 'd43  ; end
        6'd29   : begin a <= 'd8    ; b <= 'd49  ; end
        6'd30   : begin a <= 'd10   ; b <= 'd56  ; end
        6'd31   : begin a <= 'd13   ; b <= 'd62  ; end
        6'd32   : begin a <= 'd17   ; b <= 'd70  ; end
        6'd33   : begin a <= 'd21   ; b <= 'd78  ; end
        6'd34   : begin a <= 'd28   ; b <= 'd86  ; end
        6'd35   : begin a <= 'd36   ; b <= 'd93  ; end
        6'd36   : begin a <= 'd47   ; b <= 'd100 ; end
        6'd37   : begin a <= 'd61   ; b <= 'd105 ; end
        6'd38   : begin a <= 'd78   ; b <= 'd108 ; end
        6'd39   : begin a <= 'd100  ; b <= 'd107 ; end
        6'd40   : begin a <= 'd130  ; b <= 'd101 ; end
        6'd41   : begin a <= 'd167  ; b <= 'd87  ; end
        6'd42   : begin a <= 'd216  ; b <= 'd62  ; end
        6'd43   : begin a <= 'd279  ; b <= 'd22  ; end
        6'd44   : begin a <= 'd358  ; b <= 'd1   ; end
        6'd45   : begin a <= 'd461  ; b <= 'd1   ; end
        6'd46   : begin a <= 'd593  ; b <= 'd1   ; end
        6'd47   : begin a <= 'd762  ; b <= 'd1   ; end
        6'd48   : begin a <= 'd980  ; b <= 'd1   ; end
        6'd49   : begin a <= 'd1260 ; b <= 'd1   ; end
        6'd50   : begin a <= 'd1618 ; b <= 'd1   ; end
        6'd51   : begin a <= 'd2078 ; b <= 'd1   ; end
        default : begin a <= 'd1    ; b <= 'd1   ; end
      endcase
    end
  end

  wire [14:0] coe_0_abs  = ( coe_0_i[15] ==0 ) ? coe_0_i  : (~coe_0_i  + 1) ;
  wire [14:0] coe_1_abs  = ( coe_1_i[15] ==0 ) ? coe_1_i  : (~coe_1_i  + 1) ;
  wire [14:0] coe_2_abs  = ( coe_2_i[15] ==0 ) ? coe_2_i  : (~coe_2_i  + 1) ;
  wire [14:0] coe_3_abs  = ( coe_3_i[15] ==0 ) ? coe_3_i  : (~coe_3_i  + 1) ;
  wire [14:0] coe_4_abs  = ( coe_4_i[15] ==0 ) ? coe_4_i  : (~coe_4_i  + 1) ;
  wire [14:0] coe_5_abs  = ( coe_5_i[15] ==0 ) ? coe_5_i  : (~coe_5_i  + 1) ;
  wire [14:0] coe_6_abs  = ( coe_6_i[15] ==0 ) ? coe_6_i  : (~coe_6_i  + 1) ;
  wire [14:0] coe_7_abs  = ( coe_7_i[15] ==0 ) ? coe_7_i  : (~coe_7_i  + 1) ;
  wire [14:0] coe_8_abs  = ( coe_8_i[15] ==0 ) ? coe_8_i  : (~coe_8_i  + 1) ;
  wire [14:0] coe_9_abs  = ( coe_9_i[15] ==0 ) ? coe_9_i  : (~coe_9_i  + 1) ;
  wire [14:0] coe_10_abs = ( coe_10_i[15]==0 ) ? coe_10_i : (~coe_10_i + 1) ;
  wire [14:0] coe_11_abs = ( coe_11_i[15]==0 ) ? coe_11_i : (~coe_11_i + 1) ;
  wire [14:0] coe_12_abs = ( coe_12_i[15]==0 ) ? coe_12_i : (~coe_12_i + 1) ;
  wire [14:0] coe_13_abs = ( coe_13_i[15]==0 ) ? coe_13_i : (~coe_13_i + 1) ;
  wire [14:0] coe_14_abs = ( coe_14_i[15]==0 ) ? coe_14_i : (~coe_14_i + 1) ;
  wire [14:0] coe_15_abs = ( coe_15_i[15]==0 ) ? coe_15_i : (~coe_15_i + 1) ;
  wire [14:0] coe_16_abs = ( coe_16_i[15]==0 ) ? coe_16_i : (~coe_16_i + 1) ;
  wire [14:0] coe_17_abs = ( coe_17_i[15]==0 ) ? coe_17_i : (~coe_17_i + 1) ;
  wire [14:0] coe_18_abs = ( coe_18_i[15]==0 ) ? coe_18_i : (~coe_18_i + 1) ;
  wire [14:0] coe_19_abs = ( coe_19_i[15]==0 ) ? coe_19_i : (~coe_19_i + 1) ;
  wire [14:0] coe_20_abs = ( coe_20_i[15]==0 ) ? coe_20_i : (~coe_20_i + 1) ;
  wire [14:0] coe_21_abs = ( coe_21_i[15]==0 ) ? coe_21_i : (~coe_21_i + 1) ;
  wire [14:0] coe_22_abs = ( coe_22_i[15]==0 ) ? coe_22_i : (~coe_22_i + 1) ;
  wire [14:0] coe_23_abs = ( coe_23_i[15]==0 ) ? coe_23_i : (~coe_23_i + 1) ;
  wire [14:0] coe_24_abs = ( coe_24_i[15]==0 ) ? coe_24_i : (~coe_24_i + 1) ;
  wire [14:0] coe_25_abs = ( coe_25_i[15]==0 ) ? coe_25_i : (~coe_25_i + 1) ;
  wire [14:0] coe_26_abs = ( coe_26_i[15]==0 ) ? coe_26_i : (~coe_26_i + 1) ;
  wire [14:0] coe_27_abs = ( coe_27_i[15]==0 ) ? coe_27_i : (~coe_27_i + 1) ;
  wire [14:0] coe_28_abs = ( coe_28_i[15]==0 ) ? coe_28_i : (~coe_28_i + 1) ;
  wire [14:0] coe_29_abs = ( coe_29_i[15]==0 ) ? coe_29_i : (~coe_29_i + 1) ;
  wire [14:0] coe_30_abs = ( coe_30_i[15]==0 ) ? coe_30_i : (~coe_30_i + 1) ;
  wire [14:0] coe_31_abs = ( coe_31_i[15]==0 ) ? coe_31_i : (~coe_31_i + 1) ;

  wire [16:0] add_coe_0 = coe_0_abs  + coe_1_abs  + coe_2_abs  + coe_3_abs  ;
  wire [16:0] add_coe_1 = coe_4_abs  + coe_5_abs  + coe_6_abs  + coe_7_abs  ;
  wire [16:0] add_coe_2 = coe_8_abs  + coe_9_abs  + coe_10_abs + coe_11_abs ;
  wire [16:0] add_coe_3 = coe_12_abs + coe_13_abs + coe_14_abs + coe_15_abs ;
  wire [16:0] add_coe_4 = coe_16_abs + coe_17_abs + coe_18_abs + coe_19_abs ;
  wire [16:0] add_coe_5 = coe_20_abs + coe_21_abs + coe_22_abs + coe_23_abs ;
  wire [16:0] add_coe_6 = coe_24_abs + coe_25_abs + coe_26_abs + coe_27_abs ;
  wire [16:0] add_coe_7 = coe_28_abs + coe_29_abs + coe_30_abs + coe_31_abs ;

  wire [17:0] rate_0 = add_coe_0 + add_coe_1 ;
  wire [17:0] rate_1 = add_coe_2 + add_coe_3 ;
  wire [17:0] rate_2 = add_coe_4 + add_coe_5 ;
  wire [17:0] rate_3 = add_coe_6 + add_coe_7 ;

  reg  [17:0] rate_0_reg;
  reg  [17:0] rate_1_reg;
  reg  [17:0] rate_2_reg;
  reg  [17:0] rate_3_reg;

  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )begin
      rate_0_reg <= 'd0;
      rate_1_reg <= 'd0;
      rate_2_reg <= 'd0;
      rate_3_reg <= 'd0;
    end 
    else begin
      rate_0_reg <= rate_0;
      rate_1_reg <= rate_1;
      rate_2_reg <= rate_2;
      rate_3_reg <= rate_3;
    end
  end

  // pipeline 2
  wire [16:0] rate_0_dec = rate_0_reg ;
  wire [16:0] rate_2_dec = rate_2_reg ;
  wire [16:0] rate_1_dec = ( pre_size_i==2'b00 ) ? 0 : rate_1_reg ;
  wire [16:0] rate_3_dec = ( pre_size_i==2'b00 ) ? 0 : rate_3_reg ;

  wire [18:0] rate_line = rate_0_reg + rate_1_dec + rate_2_dec + rate_3_dec;

  reg  [18:0] rate_line_reg;

  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      rate_line_reg <= 'd0;
    else begin
      rate_line_reg <= rate_line;
    end
  end

  // pipeline 3
  wire [23:0] bitrate_line = a * rate_line_reg ;
  
  reg  [23:0] bitrate_line_reg ;
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      bitrate_line_reg <= 'd0;
    else begin
      bitrate_line_reg <= bitrate_line;
    end
  end

  // pipeline 4
  reg [23:0] bitrate;
  always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
      bitrate <= 'd0;
    else if( (coe_cnt_r=='d2) )
      bitrate <= 'd0;
    else if( (pre_sel_i=='d0) && ( ((pre_size_i=='d0)&&(coe_cnt_r<='d03))||
                                   ((pre_size_i=='d1)&&(coe_cnt_r<='d04))||
                                   ((pre_size_i=='d2)&&(coe_cnt_r<='d10))||
                                   ((pre_size_i=='d3)&&(coe_cnt_r<='d34))
                                 )
           )
      bitrate <= bitrate + bitrate_line_reg;
    else begin
      bitrate <= bitrate;
    end
  end


//--- Cost -----------------------------

  wire [23:0] cost_current_w = sse[26:3] + bitrate + b ;

//--- Compare --------------------------

  reg  [23:0] cost_in_8x8   ;
  reg  [23:0] cost_in_16x16 ;
  reg  [23:0] cost_in_32x32 ;

  // pipeline 1
  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      cover_valid_o <= 'd0 ;
    else if( (pre_size_i=='d0)&&(rec_cnt_r=='d03) ||
             (pre_size_i=='d1)&&(rec_cnt_r=='d04) ||
             (pre_size_i=='d2)&&(rec_cnt_r=='d10) ||
             (pre_size_i=='d3)&&(rec_cnt_r=='d34)
           )
      cover_valid_o <= 'd1 ;
    else begin
      cover_valid_o <= 'd0 ;
    end
  end

  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      cover_value_o <= 'd0 ;
    else if( pre_sel_i )
      cover_value_o <= 'd1 ;
    else if( (pre_size_i=='d0)&&(rec_cnt_r=='d03) )
      cover_value_o <= 'd1 ;
    else if( (pre_size_i=='d1)&&(rec_cnt_r=='d04) )
      if( pre_min_size_i )
        cover_value_o <= 'd1 ;
      else begin
        cover_value_o <= ( cost_current_w<=cost_in_8x8 ) ;
      end
    else if( (pre_size_i=='d2)&&(rec_cnt_r=='d10) )
      cover_value_o <= ( cost_current_w<=cost_in_16x16 ) ;
    else if( (pre_size_i=='d3)&&(rec_cnt_r=='d34) ) begin
      cover_value_o <= ( cost_current_w<=cost_in_32x32 ) ;
    end
  end

  // pipeline 2
  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      cost_in_8x8 <= 'd0 ;
    else if( (pre_size_i=='d0)&&(rec_cnt_r=='d01)&&(pre_position_i[1:0]=='b00) )
      cost_in_8x8 <= 'd0 ;
    else if( (pre_size_i=='d0)&&(rec_cnt_r=='d04) ) begin
      cost_in_8x8 <= cost_in_8x8 + cost_current_w ;
    end
  end
  
  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      cost_in_16x16 <= 'd0 ;
    else if( (pre_size_i=='d1)&&(rec_cnt_r=='d01)&&(pre_position_i[3:0]=='b00) )
      cost_in_16x16 <= 'd0 ;
    else if( (pre_size_i=='d1)&&(rec_cnt_r=='d05) ) begin
      if( cover_value_o )
        cost_in_16x16 <= cost_in_16x16 + cost_current_w ;
      else begin
        cost_in_16x16 <= cost_in_16x16 + cost_in_8x8 ;
      end
    end
  end
  
  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      cost_in_32x32 <= 'd0 ;
    else if( (pre_size_i=='d2)&&(rec_cnt_r=='d01)&&(pre_position_i[5:0]=='b00) )
      cost_in_32x32 <= 'd0 ;
    else if( (pre_size_i=='d2)&&(rec_cnt_r=='d11) ) begin
      if( cover_value_o )
        cost_in_32x32 <= cost_in_32x32 + cost_current_w ;
      else begin
        cost_in_32x32 <= cost_in_32x32 + cost_in_16x16 ;
      end
    end
  end

endmodule