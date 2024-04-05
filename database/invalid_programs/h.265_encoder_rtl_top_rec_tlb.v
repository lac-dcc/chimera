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
//  Filename      : rec_tlb.v
//  Author        : Huang Lei Lei
//  Created       : 2014-09-23
//  Description   : A Translation Lookaside Like Buffer for Reconstruction Memory (along with coe_tlb, it can be merged into a universal tlb )
//  Modified      : 2015-04-29 by HLL
//  Description   : inter supported
//
//  $Id$
//
//-------------------------------------------------------------------

`include "enc_defines.v"


module rec_tlb (
  // global
  clk             ,
  rst_n           ,
  // rec
  cover_valid_i   ,
  cover_value_i   ,
  // pre
  pre_start_i     ,
  pre_type_i      ,
  pre_sel_i       ,
  pre_tl_4x4_x_i  ,
  pre_tl_4x4_y_i  ,
  pre_size_i      ,
  pre_idx_i       ,
  pre_bank_0_o    ,
  pre_bank_1_o    ,
  pre_bank_2_o    ,
  pre_bank_3_o    ,
  pre_cbank_o     ,
  // ec
  ec_addr_i       ,
  ec_bank_o       ,
  ec_cbank_o
  );


//*** PARAMETER DECLARATION ****************************************************

  localparam  I_4x4         = 2'b00                  ,
              I_8x8         = 2'b01                  ,
              I_16x16       = 2'b10                  ,
              I_32x32       = 2'b11                  ;

  localparam  INTRA         = 0                      ,
              INTER         = 1                      ;


//*** IN/OUTPUT DECLARATION ****************************************************

  // global
  input                     clk                      ;
  input                     rst_n                    ;
  // rec
  input                     cover_valid_i            ;
  input                     cover_value_i            ;
  // pre
  input                     pre_start_i              ;
  input                     pre_type_i               ;
  input      [1     : 0]    pre_sel_i                ;
  input      [3     : 0]    pre_tl_4x4_x_i           ;
  input      [3     : 0]    pre_tl_4x4_y_i           ;
  input      [1     : 0]    pre_size_i               ;
  input      [4     : 0]    pre_idx_i                ;
  output reg [1     : 0]    pre_bank_0_o             ;  // wire in fact
  output reg [1     : 0]    pre_bank_1_o             ;  // wire in fact
  output reg [1     : 0]    pre_bank_2_o             ;  // wire in fact
  output reg [1     : 0]    pre_bank_3_o             ;  // wire in fact
  output                    pre_cbank_o              ;
  // ec
  input      [8     : 0]    ec_addr_i                ;
  output     [1     : 0]    ec_bank_o                ;
  output                    ec_cbank_o               ;


//*** REG/WIRES DECLARATION ****************************************************

//--- Pointer_R ------------------------

  reg        [255   : 0]    pointer_r                ;

  reg                       cover_en                 ;
  reg        [4     : 0]    rec_cnt_r                ;
  reg                       rec_cnt_bd_w             ;

  reg                       shifter_r                ;

  wire       [127   : 0]    rec_mask_pos_w           ;
  wire       [127   : 0]    rec_mask_neg_w           ;
  wire       [127   : 0]    rec_mask_bank_w          ;

  wire       [7     : 0]    rec_8x8_addr_w           ;

  wire       [2     : 0]    rec_8x8_x_w              ;
  wire       [2     : 0]    rec_8x8_y_w              ;

  wire       [1     : 0]    rec_bank_w               ;
  wire       [1     : 0]    pointer_fmr_rec_a_w      ;
  wire       [1     : 0]    pointer_fmr_rec_b_w      ;

//--- Pre_Bank_O -----------------------

  wire       [127   : 0]    pointer_pre_w            ;
  wire       [1     : 0]    pointer_cur_pre_w        ;

  wire       [127   : 0]    pointer_ec_w             ;
  wire       [1     : 0]    pointer_cur_ec_w         ;

  wire       [1     : 0]    pre_bank_0_w             ;
  wire       [1     : 0]    pre_bank_1_w             ;
  wire       [1     : 0]    pre_bank_2_w             ;
  wire       [1     : 0]    pre_bank_3_w             ;

  wire       [1     : 0]    pointer_fmr_pre_0_a_w    ;
  wire       [1     : 0]    pointer_fmr_pre_0_b_w    ;
  wire       [1     : 0]    pointer_fmr_pre_1_a_w    ;
  wire       [1     : 0]    pointer_fmr_pre_1_b_w    ;
  wire       [1     : 0]    pointer_fmr_pre_2_a_w    ;
  wire       [1     : 0]    pointer_fmr_pre_2_b_w    ;
  wire       [1     : 0]    pointer_fmr_pre_3_a_w    ;
  wire       [1     : 0]    pointer_fmr_pre_3_b_w    ;

  wire       [7     : 0]    pre_8x8_addr_w           ;

  wire       [2     : 0]    pre_8x8_x_w              ;
  wire       [2     : 0]    pre_8x8_y_w              ;

//--- Ec_Bank_O ------------------------

  wire       [127   : 0]    ec_pointer_w             ;
  wire       [7     : 0]    ec_8x8_addr_w            ;
  wire                      ec_sel_w                 ;


//*** MAIN BODY ****************************************************************

//--- Pointer_R ------------------------

  // pointer_r
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n ) begin
      pointer_r[255:128] <= {64{2'b00}} ;
      pointer_r[127:000] <= {64{2'b01}} ;
    end
    else if( cover_en ) begin
      if( shifter_r )
        pointer_r[127:000] <= ( pointer_r[127:000] & rec_mask_neg_w ) | rec_mask_bank_w ;
      else begin
        pointer_r[255:128] <= ( pointer_r[255:128] & rec_mask_neg_w ) | rec_mask_bank_w ;
      end
    end
  end

  // cover_en
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
		cover_en <= 'd0 ;
    else if( cover_valid_i & cover_value_i )
      cover_en <= 'd1 ;
    else if( rec_cnt_bd_w ) begin
      cover_en <= 'd0 ;
    end
  end

  // rec_cnt
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      rec_cnt_r <= 'd0 ;
    else if( cover_en ) begin
      if( rec_cnt_bd_w )
        rec_cnt_r <= 'd0 ;
      else begin
        rec_cnt_r <= rec_cnt_r + 'd1 ;
      end
    end
  end

  // rec_cnt_bd_w
  always @(*) begin
    case( pre_size_i )
      I_4x4    : rec_cnt_bd_w = (rec_cnt_r=='d01-'d01) ;
      I_8x8    : rec_cnt_bd_w = (rec_cnt_r=='d01-'d01) ;
      I_16x16  : rec_cnt_bd_w = (rec_cnt_r=='d04-'d01) ;
      I_32x32  : rec_cnt_bd_w = (rec_cnt_r=='d16-'d01) ;
    endcase
  end

  // shifter_r
  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      shifter_r <= 1'b0 ;
    else if( pre_start_i ) begin
      shifter_r <= !shifter_r ;
    end
  end

  // rec_mask_pos_w & rec_mask_neg_w
  assign rec_mask_pos_w = 2'b11 << (rec_8x8_addr_w<<1) ;
  assign rec_mask_neg_w = ~rec_mask_pos_w ;
  assign rec_mask_bank_w = rec_bank_w << (rec_8x8_addr_w<<1) ;

  // rec_8x8_addr_w
  assign rec_8x8_addr_w = { 1'b0           ,1'b0           ,
                            rec_8x8_y_w[2] ,rec_8x8_x_w[2] ,
                            rec_8x8_y_w[1] ,rec_8x8_x_w[1] ,
                            rec_8x8_y_w[0] ,rec_8x8_x_w[0] } + rec_cnt_r ;

  // rec_8x8_x_w & rec_8x8_y_w
  assign rec_8x8_x_w = pre_tl_4x4_x_i[3:1] ;
  assign rec_8x8_y_w = pre_tl_4x4_y_i[3:1] ;

  // rec_bank_w
  assign rec_bank_w = 2'b11 - pointer_fmr_rec_a_w - pointer_fmr_rec_b_w ;

  // pointer_fmr_rec_a_w & pointer_fmr_rec_b_w
  assign pointer_fmr_rec_a_w = pointer_r[255:128] >> (rec_8x8_addr_w<<1) ;
  assign pointer_fmr_rec_b_w = pointer_r[127:000] >> (rec_8x8_addr_w<<1) ;


//--- Pre_Bank_O -----------------------

  // pre_cbank_o
  assign pre_cbank_o = shifter_r ;

  // pre_bank_o
  always @(*) begin
    if( pre_sel_i[1] ) begin
      pre_bank_0_o = 2'b11 ;
      pre_bank_1_o = 2'b11 ;
      pre_bank_2_o = 2'b11 ;
      pre_bank_3_o = 2'b11 ;
    end
    else if( pre_type_i==INTER ) begin
      pre_bank_0_o = shifter_r ;
      pre_bank_1_o = shifter_r ;
      pre_bank_2_o = shifter_r ;
      pre_bank_3_o = shifter_r ;
    end
    else begin
      case( pre_size_i )
        I_4x4,I_8x8   : begin                                pre_bank_0_o = pre_bank_0_w ;
                                                             pre_bank_1_o = pre_bank_0_w ;
                                                             pre_bank_2_o = pre_bank_0_w ;
                                                             pre_bank_3_o = pre_bank_0_w ;
                        end
        I_16x16       : begin    if( pre_8x8_x_w[1] ) begin
                                   if( pre_idx_i[1] ) begin  pre_bank_0_o = pre_bank_0_w ;
                                                             pre_bank_1_o = pre_bank_1_w ;
                                                             pre_bank_2_o = pre_bank_1_w ;
                                                             pre_bank_3_o = pre_bank_0_w ;
                                   end
                                   else begin                pre_bank_0_o = pre_bank_1_w ;
                                                             pre_bank_1_o = pre_bank_0_w ;
                                                             pre_bank_2_o = pre_bank_0_w ;
                                                             pre_bank_3_o = pre_bank_1_w ;
                                   end
                                 end
                                 else begin
                                   if( pre_idx_i[1] ) begin  pre_bank_0_o = pre_bank_1_w ;
                                                             pre_bank_1_o = pre_bank_1_w ;
                                                             pre_bank_2_o = pre_bank_0_w ;
                                                             pre_bank_3_o = pre_bank_0_w ;
                                   end
                                   else begin                pre_bank_0_o = pre_bank_0_w ;
                                                             pre_bank_1_o = pre_bank_0_w ;
                                                             pre_bank_2_o = pre_bank_1_w ;
                                                             pre_bank_3_o = pre_bank_1_w ;
                                   end
                                 end
                        end
        I_32x32       : begin    case( pre_idx_i[1:0] )
                                   2'd0 : begin              pre_bank_0_o = pre_bank_0_w ;
                                                             pre_bank_1_o = pre_bank_2_w ;
                                                             pre_bank_2_o = pre_bank_1_w ;
                                                             pre_bank_3_o = pre_bank_3_w ;
                                          end
                                   2'd1 : begin              pre_bank_0_o = pre_bank_3_w ;
                                                             pre_bank_1_o = pre_bank_0_w ;
                                                             pre_bank_2_o = pre_bank_2_w ;
                                                             pre_bank_3_o = pre_bank_1_w ;
                                          end
                                   2'd2 : begin              pre_bank_0_o = pre_bank_1_w ;
                                                             pre_bank_1_o = pre_bank_3_w ;
                                                             pre_bank_2_o = pre_bank_0_w ;
                                                             pre_bank_3_o = pre_bank_2_w ;
                                          end
                                   2'd3 : begin              pre_bank_0_o = pre_bank_2_w ;
                                                             pre_bank_1_o = pre_bank_1_w ;
                                                             pre_bank_2_o = pre_bank_3_w ;
                                                             pre_bank_3_o = pre_bank_0_w ;
                                          end
                                 endcase
                        end
      endcase
    end
  end

  // pre_bank_w
  assign pre_bank_0_w = (pre_sel_i[1]) ? 2'b11 : (2'b11-pointer_fmr_pre_0_a_w-pointer_fmr_pre_0_b_w) ;
  assign pre_bank_1_w = (pre_sel_i[1]) ? 2'b11 : (2'b11-pointer_fmr_pre_1_a_w-pointer_fmr_pre_1_b_w) ;
  assign pre_bank_2_w = (pre_sel_i[1]) ? 2'b11 : (2'b11-pointer_fmr_pre_2_a_w-pointer_fmr_pre_2_b_w) ;
  assign pre_bank_3_w = (pre_sel_i[1]) ? 2'b11 : (2'b11-pointer_fmr_pre_3_a_w-pointer_fmr_pre_3_b_w) ;

  // pointer_fmr_pre_0_w & pointer_fmr_pre_1_w
  assign pointer_fmr_pre_0_a_w = pointer_r[255:128] >> ((pre_8x8_addr_w+0)<<1) ;
  assign pointer_fmr_pre_0_b_w = pointer_r[127:000] >> ((pre_8x8_addr_w+0)<<1) ;
  assign pointer_fmr_pre_1_a_w = pointer_r[255:128] >> ((pre_8x8_addr_w+1)<<1) ;
  assign pointer_fmr_pre_1_b_w = pointer_r[127:000] >> ((pre_8x8_addr_w+1)<<1) ;
  assign pointer_fmr_pre_2_a_w = pointer_r[255:128] >> ((pre_8x8_addr_w+4)<<1) ;
  assign pointer_fmr_pre_2_b_w = pointer_r[127:000] >> ((pre_8x8_addr_w+4)<<1) ;
  assign pointer_fmr_pre_3_a_w = pointer_r[255:128] >> ((pre_8x8_addr_w+5)<<1) ;
  assign pointer_fmr_pre_3_b_w = pointer_r[127:000] >> ((pre_8x8_addr_w+5)<<1) ;

  // pre_8x8_addr_w
  assign pre_8x8_addr_w = { 1'b0           ,1'b0           ,
                            pre_8x8_y_w[2] ,pre_8x8_x_w[2] ,
                            pre_8x8_y_w[1] ,pre_8x8_x_w[1] ,
                            pre_8x8_y_w[0] ,pre_8x8_x_w[0] };

  // pre_8x8_x_w & pre_8x8_y_w
  assign pre_8x8_x_w = pre_tl_4x4_x_i[3:1] ;
  assign pre_8x8_y_w = pre_tl_4x4_y_i[3:1] + pre_idx_i[4:3] ;


//--- Ec_Bank_O ------------------------

  // ec_cbank_o                  
  assign ec_cbank_o = !shifter_r ;

  // ec_bank_o
  assign ec_bank_o = ec_sel_w ? 2'b11
                              : ( (pre_type_i==INTER) ? ( !shifter_r )
                                                      : ( ec_pointer_w>>(ec_8x8_addr_w<<1) )
                                );

  // ec_pointer_w                                                            
  assign ec_pointer_w = shifter_r ? pointer_r[255:128] : pointer_r[127:000] ;
  
  // ec_8x8_addr_w
  assign ec_8x8_addr_w = ec_addr_i>>2 ;
  //{ec_addr_i[6],ec_addr_i[7],ec_addr_i[4],ec_addr_i[5],ec_addr_i[2],ec_addr_i[3],ec_addr_i[0],ec_addr_i[1]}>>2 ;

  // ec_sel_w
  assign ec_sel_w = ec_addr_i > 255 ;

endmodule
