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
//  Filename      : fetch_ctrl.v
//  Author        : Yufeng Bai
//  Email     : byfchina@gmail.com
//  Created On    : 2015-04-30
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-08-18 by HLL
//  Description   : db supported
//  Modified      : 2015-09-02 by HLL
//  Description   : db rearranged to next pipeline
//  Modified      : 2015-09-05 by HLL
//  Description   : intra supported
//  Modified      : 2015-09-16 by HLL
//  Description   : cur_chroma provided in the order of uvuvuv...
//  Modified      : 2015-09-17 by HLL
//  Description   : ref_chroma provided in the order of uvuvuv...
//  Modified      : 2015-09-19 by HLL
//  Description   : load_db_chroma & store_db_chroma provided in the order of uvuvuv...
//                  more modes connected out
//
//-------------------------------------------------------------------

`include "enc_defines.v"

module fetch_ctrl (
  clk           ,
  rstn            ,

  sysif_start_i   ,
  sysif_type_i    ,
  sysif_done_o    ,
  sysif_total_x_i   ,
  sysif_total_y_i   ,
        sysif_fime_y_o          ,
        sysif_fme_y_o           ,
        sysif_mc_y_o            ,

  cimv_pre_i    ,
  cimv_fme_i    ,

  cur_luma_done_o   ,
  cur_luma_data_o   ,
  cur_luma_valid_o  ,
  cur_luma_addr_o   ,

  cur_chroma_done_o ,
  cur_chroma_data_o ,
  cur_chroma_valid_o  ,
  cur_chroma_addr_o ,

  ref_luma_done_o   ,
  ref_luma_data_o   ,
  ref_luma_valid_o  ,
  ref_luma_addr_o   ,

  ref_chroma_done_o ,
  ref_chroma_data_o ,
  ref_chroma_valid_o  ,
  ref_chroma_addr_o ,

  db_store_addr_o   ,
  db_store_en_o   ,
  db_store_data_i   ,
        db_store_done_o         ,
  db_ref_addr_o   ,
  db_ref_en_o   ,
  db_ref_data_o   ,

  extif_start_o   ,
  extif_done_i    ,
  extif_mode_o    ,
  extif_x_o   ,
  extif_y_o   ,
  extif_width_o   ,
  extif_height_o    ,
        extif_wren_i            ,
        extif_rden_i            ,
  extif_data_i    ,
  extif_data_o
);

// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************

input    [1-1:0]          clk                    ; // clk signal
input    [1-1:0]          rstn                   ; // asynchronous reset

input    [1-1:0]          sysif_start_i            ; // "system interface
output   [1-1:0]          sysif_done_o           ; // "system interface
input                     sysif_type_i    ;
input    [`PIC_X_WIDTH-1:0]   sysif_total_x_i    ; // "system interface
input    [`PIC_Y_WIDTH-1:0]   sysif_total_y_i    ; // "system interface
output   [8-1:0]                sysif_fime_y_o           ; // cur fime y num
output   [8-1:0]                sysif_fme_y_o            ; // cur fme y num
output   [8-1:0]                sysif_mc_y_o             ; // cur fme y num

input    [20-1:0]           cimv_pre_i           ; // cime mv
input    [20-1:0]           cimv_fme_i           ; // fme mv

output   [1-1:0]          cur_luma_done_o    ; // write current lcu done
output   [32*`PIXEL_WIDTH-1:0]  cur_luma_data_o    ; // write current lcu data
output   [1-1:0]          cur_luma_valid_o   ; // write current lcu data valid
output   [7-1:0]          cur_luma_addr_o    ; // write current lcu data address

output   [1-1:0]          cur_chroma_done_o    ; // write current lcu done
output   [32*`PIXEL_WIDTH-1:0]  cur_chroma_data_o    ; // write current lcu data
output   [1-1:0]          cur_chroma_valid_o   ; // write current lcu data valid
output   [6-1:0]          cur_chroma_addr_o    ; // write current lcu data address

output   [1-1:0]          ref_luma_done_o    ; // write ref lcu done
output   [96*`PIXEL_WIDTH-1:0]  ref_luma_data_o    ; // write ref  lcu data
output   [1-1:0]          ref_luma_valid_o   ; // write ref data valid
output   [7-1:0]          ref_luma_addr_o    ; // write ref luma addr

output   [1-1:0]          ref_chroma_done_o    ; // write ref lcu done
output   [96*`PIXEL_WIDTH-1:0]  ref_chroma_data_o    ; // write ref  lcu data
output                    ref_chroma_valid_o   ; // write ref data valid
output   [6-1:0]          ref_chroma_addr_o    ; // write ref chroma addr

output reg [8-1:0]          db_store_addr_o    ; // read db_pixel ram address
output   [1-1:0]          db_store_en_o            ; // read db_pixel ram enable
input    [32*`PIXEL_WIDTH-1:0]  db_store_data_i    ; // read db_pixel ram data
output                          db_store_done_o          ;
output   [5-1:0]          db_ref_addr_o            ; // write db_ref ram address
output   [1-1:0]          db_ref_en_o            ; // write db_ref ram enable
output   [16*`PIXEL_WIDTH-1:0]  db_ref_data_o            ; // write db_ref ram data

output   [1-1:0]          extif_start_o            ; // ext mem load start
input    [1-1:0]          extif_done_i           ; // ext mem load done
output   [5-1:0]          extif_mode_o           ; // "ext mode: {load/store} {luma
output   [6+`PIC_X_WIDTH-1:0]   extif_x_o            ; // x in ref frame
output   [6+`PIC_Y_WIDTH-1:0]   extif_y_o            ; // y in ref frame
output   [8-1:0]          extif_width_o            ; // ref window width
output   [8-1:0]          extif_height_o           ; // ref window height
input                           extif_wren_i             ; // write sram enable
input                           extif_rden_i             ; // read sram enable
input    [16*`PIXEL_WIDTH-1:0]  extif_data_i           ; // ext data input
output   [16*`PIXEL_WIDTH-1:0]  extif_data_o           ; // ext data output

// ********************************************
//
//    PARAMETER DECLARATION
//
// ********************************************

  parameter INTRA = 0 ,
            INTER = 1 ;

parameter AXI_WIDTH = 'd128;

localparam AXI_WIDTH_PIXEL = AXI_WIDTH / `PIXEL_WIDTH ;

parameter IDLE      = 'd00; //                                //
parameter P1        = 'd01; // CIME                           // PRELOA
parameter P2        = 'd02; // CIME,PRELOA                    // PRELOA,PRE_I
parameter P3        = 'd03; // CIME,PRELOA,FIME               // PRELOA,PRE_I,INTRA
parameter P4        = 'd04; // CIME,PRELOA,FIME,FME           // PRELOA,PRE_I,INTRA,DB
parameter P5        = 'd05; // CIME,PRELOA,FIME,FME,MC        //        PRE_I,INTRA,DB
parameter P6        = 'd06; // CIME,PRELOA,FIME,FME,MC,DB     //              INTRA,DB
parameter P7        = 'd07; //      PRELOA,FIME,FME,MC,DB     //                    DB
parameter P8        = 'd08; //             FIME,FME,MC,DB     //                    CABAC
parameter P9        = 'd09; //                  FME,MC,DB     //
parameter P10       = 'd10; //                      MC,DB     //
parameter P11       = 'd11; //                         DB     //
parameter P12       = 'd12; //                         CABCA  //


parameter LOAD_CUR_SUB      = 01 ,
          LOAD_REF_SUB      = 02 ,
          LOAD_CUR_LUMA     = 03 ,
          LOAD_REF_LUMA     = 04 ,
          LOAD_CUR_CHROMA   = 05 ,
          LOAD_REF_CHROMA   = 06 ,
          LOAD_DB_LUMA      = 07 ,
          LOAD_DB_CHROMA    = 08 ,
          STORE_DB_LUMA     = 09 ,
          STORE_DB_CHROMA   = 10 ;

parameter DB_STORE_IDLE     = 0 ,
          DB_STORE_LUMA_PRE = 1 ,
          DB_STORE_LUMA_CUR = 2 ,
          DB_STORE_CHRO_PRE = 3 ,
          DB_STORE_CHRO_CUR = 4 ;


// ********************************************
//
//    WIRE / REG DECLARATION
//
// ********************************************

reg  sysif_start_r;

reg  cime, preload, fime, fme, mc, db;
reg  pre_i, intra;

reg  [3:0] current_state, next_state;
reg  [4:0] current_fetch, next_fetch;

reg  [7:0] first_x,first_y ;
reg  [7:0] pre_x ,pre_y  ;
reg  [7:0] fime_x,fime_y ;
reg  [7:0] fme_x ,fme_y  ;
reg  [7:0] mc_x  ,mc_y   ;
reg  [7:0] db_0_x  ,db_0_y   ;
reg  [7:0] db_1_x  ,db_1_y   ;
reg  [7:0] db_2_x  ,db_2_y   ;
reg  [7:0] pre_i_x ,pre_i_y  ;
reg  [7:0] intra_x ,intra_y  ;

reg        store_db_done ;
wire       store_db      ;

reg  [11:0] luma_ref_x_s,luma_ref_y_s,
            luma_ref_x_s_r1,luma_ref_x_s_r2,
            luma_ref_y_s_r1,luma_ref_y_s_r2;

reg  [7:0]  luma_ref_height,luma_ref_height_r1,luma_ref_height_r2;

wire signed [10-1:0] cimv_pre_i_x,cimv_pre_i_y;

reg  [AXI_WIDTH-1:0] extif_data_0;
reg  [AXI_WIDTH-1:0] extif_data_1;
reg  [AXI_WIDTH-1:0] extif_data_2;
reg  [AXI_WIDTH-1:0] extif_data_3;
reg  [AXI_WIDTH-1:0] extif_data_4;

reg  [1:0]           cur_luma_cnt;
reg  [2:0]           ref_luma_cnt;
reg  [1:0]           cur_chroma_cnt;
reg  [2:0]           ref_chroma_cnt;


  reg  [6 : 0]    cur_luma_addr      ;
  reg  [5 : 0]    cur_chroma_addr    ;
  reg  [6 : 0]    ref_luma_addr_o    ;
  reg  [5 : 0]    ref_chroma_addr    ;
  reg  [8 : 0]    db_store_addr_r    ;
  reg  [8 : 0]    db_store_addr_w    ;
  reg  [4 : 0]    db_ref_addr_o      ;


reg  [5-1:0]       extif_mode_o        ; // "ext mode: {load/store} {luma
reg  [6+`PIC_X_WIDTH-1:0]   extif_x_o; // x in ref frame
reg  [6+`PIC_Y_WIDTH-1:0]   extif_y_o; // y in ref frame
reg  [8-1:0]       extif_width_o   ; // ref window width
reg  [8-1:0]       extif_height_o    ; // ref window height

reg  [96*`PIXEL_WIDTH-1:0]  ref_luma_data_o; // write ref  lcu data
wire [96*`PIXEL_WIDTH-1:0]      ref_luma_data;
wire [128*`PIXEL_WIDTH-1:0]     ref_luma_lshift;
wire [128*`PIXEL_WIDTH-1:0]     ref_luma_rshift;

reg  [1-1:0]         extif_start_o;
reg  [1-1:0]         sysif_done_o;
reg  [1-1:0]         cur_luma_valid_o;
reg  [1-1:0]         cur_chroma_valid_o;

reg                  chroma_ref_lshift_r1,chroma_ref_lshift_r2;
reg                  chroma_ref_rshift_r1,chroma_ref_rshift_r2;

  wire [48*`PIXEL_WIDTH-1 : 0]    ref_chroma_u_lshift  ;
  wire [48*`PIXEL_WIDTH-1 : 0]    ref_chroma_u_rshift  ;
  wire [48*`PIXEL_WIDTH-1 : 0]    ref_chroma_v_lshift  ;
  wire [48*`PIXEL_WIDTH-1 : 0]    ref_chroma_v_rshift  ;
  wire [48*`PIXEL_WIDTH-1 : 0]    ref_chroma_u_data    ;
  wire [48*`PIXEL_WIDTH-1 : 0]    ref_chroma_v_data    ;
  wire [96*`PIXEL_WIDTH-1 : 0]    ref_chroma_data      ;
  reg  [96*`PIXEL_WIDTH-1 : 0]    ref_chroma_data_o    ;

  reg                             db_store_done_w      ;
  reg  [2                 : 0]    cur_state_db_store   ;
  reg  [2                 : 0]    cur_state_db_store_d ;
  reg  [2                 : 0]    nxt_state_db_store   ;



// ********************************************
//
//    Sequential Logi
//
// ********************************************
//
// main ctrl
always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
        current_state <= IDLE;
        sysif_start_r <= 1'b0;
    end
    else begin
        current_state <= next_state;
        sysif_start_r <= sysif_start_i;
    end
end

  always @ (*) begin
    next_state = IDLE ;
    if( sysif_type_i==INTER ) begin
      case (current_state)
        IDLE: if (sysif_start_i) next_state = P1   ; else next_state = IDLE ;
        P1  : if (sysif_start_i) next_state = P2   ; else next_state = P1   ;
        P2  : if (sysif_start_i) next_state = P3   ; else next_state = P2   ;
        P3  : if (sysif_start_i) next_state = P4   ; else next_state = P3   ;
        P4  : if (sysif_start_i) next_state = P5   ; else next_state = P4   ;
        P5  : if (sysif_start_i) next_state = P6   ; else next_state = P5   ;
        P6  : if (sysif_start_i && pre_x == sysif_total_x_i && pre_y == sysif_total_y_i)
                                 next_state = P7   ; else next_state = P6   ;
        P7  : if (sysif_start_i) next_state = P8   ; else next_state = P7   ;
        P8  : if (sysif_start_i) next_state = P9   ; else next_state = P8   ;
        P9  : if (sysif_start_i) next_state = P10  ; else next_state = P9   ;
        P10 : if (sysif_start_i) next_state = P11  ; else next_state = P10  ;
        P11 : if (sysif_start_i) next_state = P12  ; else next_state = P11  ;
        P12 : if (sysif_start_i) next_state = IDLE ; else next_state = P12  ;
      endcase
    end
    else begin
      case (current_state)
        IDLE: if (sysif_start_i) next_state = P1   ; else next_state = IDLE ;
        P1  : if (sysif_start_i) next_state = P2   ; else next_state = P1   ;
        P2  : if (sysif_start_i) next_state = P3   ; else next_state = P2   ;
        P3  : if (sysif_start_i) next_state = P4   ; else next_state = P3   ;
        P4  : if (sysif_start_i && pre_i_x == sysif_total_x_i && pre_i_y == sysif_total_y_i)
                                 next_state = P5   ; else next_state = P4   ;
        P5  : if (sysif_start_i) next_state = P6   ; else next_state = P5   ;
        P6  : if (sysif_start_i) next_state = P7   ; else next_state = P6   ;
        P7  : if (sysif_start_i) next_state = P8   ; else next_state = P7   ;
        P8  : if (sysif_start_i) next_state = IDLE ; else next_state = P8   ;
      endcase
    end
  end

  always @ (posedge clk or negedge rstn) begin
    if( !rstn ) begin
      first_x <= 0 ;
      first_y <= 0 ;
    end
    else if( (current_state == IDLE) ) begin
      first_x <= 0 ;
      first_y <= 0 ;
    end
    else if( sysif_start_i ) begin
      if( first_x == sysif_total_x_i ) begin
        first_x <= 0 ;
        first_y <= first_y + 1 ;
      end
      else begin
        first_x <= first_x + 1 ;
      end
    end
  end

  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
        pre_x   <= 0       ;    pre_y   <= 0       ;
        fime_x  <= 0       ;    fime_y  <= 0       ;
        fme_x   <= 0       ;    fme_y   <= 0       ;
        mc_x    <= 0       ;    mc_y    <= 0       ;
        db_0_x  <= 0       ;    db_0_y  <= 0       ;
        db_1_x  <= 0       ;    db_1_y  <= 0       ;
        pre_i_x <= 0       ;    pre_i_y <= 0       ;
        intra_x <= 0       ;    intra_y <= 0       ;
    end
    else if( sysif_start_i ) begin
      if( sysif_type_i==INTER ) begin
        pre_x  <= first_x  ;    pre_y  <= first_y  ;
        fime_x <= pre_x    ;    fime_y <= pre_y    ;
        fme_x  <= fime_x   ;    fme_y  <= fime_y   ;
        mc_x   <= fme_x    ;    mc_y   <= fme_y    ;
        db_0_x <= mc_x     ;    db_0_y <= mc_y     ;
        db_1_x <= db_0_x   ;    db_1_y <= db_0_y   ;
        db_2_x <= db_1_x   ;    db_2_y <= db_1_y   ;
      end
      else begin
        pre_i_x <= first_x ;    pre_i_y <= first_y ;
        intra_x <= pre_i_x ;    intra_y <= pre_i_y ;
        db_0_x  <= intra_x ;    db_0_y  <= intra_y ;
        db_1_x  <= db_0_x  ;    db_1_y  <= db_0_y  ;
        db_2_x  <= db_1_x  ;    db_2_y  <= db_1_y  ;
      end
    end
  end

  always @ (*) begin
              {cime, preload, fime, fme, mc, db} = 6'b000000 ;
              {preload, pre_i, intra ,db}        = 4'b0000   ;
    if( sysif_type_i==INTER ) begin
      case (current_state)
        IDLE: {cime, preload, fime, fme, mc, db} = 6'b000000 ;
        P1  : {cime, preload, fime, fme, mc, db} = 6'b100000 ;
        P2  : {cime, preload, fime, fme, mc, db} = 6'b110000 ;
        P3  : {cime, preload, fime, fme, mc, db} = 6'b111000 ;
        P4  : {cime, preload, fime, fme, mc, db} = 6'b111100 ;
        P5  : {cime, preload, fime, fme, mc, db} = 6'b111110 ;
        P6  : {cime, preload, fime, fme, mc, db} = 6'b111111 ;
        P7  : {cime, preload, fime, fme, mc, db} = 6'b011111 ;
        P8  : {cime, preload, fime, fme, mc, db} = 6'b001111 ;
        P9  : {cime, preload, fime, fme, mc, db} = 6'b000111 ;
        P10 : {cime, preload, fime, fme, mc, db} = 6'b000011 ;
        P11 : {cime, preload, fime, fme, mc, db} = 6'b000001 ;
        P12 : {cime, preload, fime, fme, mc, db} = 6'b000000 ;
      endcase
    end
    else begin
      case (current_state)
        IDLE: {preload, pre_i, intra ,db} = 4'b0000 ;
        P1  : {preload, pre_i, intra ,db} = 4'b1000 ;
        P2  : {preload, pre_i, intra ,db} = 4'b1100 ;
        P3  : {preload, pre_i, intra ,db} = 4'b1110 ;
        P4  : {preload, pre_i, intra ,db} = 4'b1111 ;
        P5  : {preload, pre_i, intra ,db} = 4'b0111 ;
        P6  : {preload, pre_i, intra ,db} = 4'b0011 ;
        P7  : {preload, pre_i, intra ,db} = 4'b0001 ;
        P8  : {preload, pre_i, intra ,db} = 4'b0000 ;
      endcase
    end
  end

// arbiter

always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
  current_fetch <= IDLE;
    end
    else begin
  current_fetch <= next_fetch;
    end
end


//preload : LOAD cur_sub_luma, LOAD ref_sub_luma, LOAD cur_luma, LOAD ref_luma

// fme    : LOAD cur_chroma, LOAD ref_chroma

// mc     : LOAD ref_db

// db     : STORE db


//fetch priority : cur_sub_luma > ref_sub_luma > cur_luma > ref_luma > cur_chroma > ref_chroma > ref_db > db

  always @ (*) begin
                                next_fetch = IDLE;
    case (current_fetch)
      IDLE          :   begin if( sysif_start_r )
                                next_fetch = LOAD_CUR_SUB;
                              else begin
                                next_fetch = IDLE;
                              end
                        end
      LOAD_CUR_SUB  :   begin if((cime    & extif_done_i) | (~cime))
                                next_fetch = LOAD_REF_SUB;
                              else begin
                                next_fetch = LOAD_CUR_SUB;
                              end
                        end
      LOAD_REF_SUB  :   begin if((cime    & extif_done_i) | (~cime))
                                next_fetch = LOAD_CUR_LUMA;
                              else begin
                                next_fetch = LOAD_REF_SUB;
                              end
                        end
      LOAD_CUR_LUMA :   begin if((preload & extif_done_i) | (~preload))
                                next_fetch = LOAD_REF_LUMA;
                              else begin
                                next_fetch = LOAD_CUR_LUMA;
                              end
                        end
      LOAD_REF_LUMA :   begin if((preload & extif_done_i) | (~preload) | (sysif_type_i==INTRA))
                                next_fetch = LOAD_CUR_CHROMA;
                              else begin
                                next_fetch = LOAD_REF_LUMA;
                              end
                        end
      LOAD_CUR_CHROMA : begin if( sysif_type_i==INTRA ) begin
                                if((pre_i & extif_done_i) | (~pre_i))
                                  next_fetch = LOAD_REF_CHROMA;
                                else begin
                                  next_fetch = LOAD_CUR_CHROMA;
                                end
                              end
                              else begin
                                if((fme   & extif_done_i) | (~fme))
                                  next_fetch = LOAD_REF_CHROMA;
                                else begin
                                  next_fetch = LOAD_CUR_CHROMA;
                                end
                              end
                        end
      LOAD_REF_CHROMA : begin if((fme     & extif_done_i) | (~fme))
                                next_fetch = LOAD_DB_LUMA;
                              else begin
                                next_fetch = LOAD_REF_CHROMA;
                              end
                        end
      LOAD_DB_LUMA    : begin if( sysif_type_i==INTRA) begin
                                if((intra & extif_done_i) | (~intra) | (intra_y == 0))
                                  next_fetch = LOAD_DB_CHROMA;
                                else begin
                                  next_fetch = LOAD_DB_LUMA;
                                end
                              end
                              else begin
                                if((mc    & extif_done_i) | (~mc) | (mc_y == 0))
                                  next_fetch = LOAD_DB_CHROMA;
                                else begin
                                  next_fetch = LOAD_DB_LUMA;
                                end
                              end
                        end
      LOAD_DB_CHROMA  : begin if( sysif_type_i==INTRA) begin
                                if((intra & extif_done_i) | (~intra) | (intra_y == 0))
                                  next_fetch = STORE_DB_LUMA;
                                else begin
                                  next_fetch = LOAD_DB_CHROMA;
                                end
                              end
                              else begin
                                if((mc    & extif_done_i) | (~mc) | (mc_y == 0))
                                  next_fetch = STORE_DB_LUMA;
                                else begin
                                  next_fetch = LOAD_DB_CHROMA;
                                end
                              end
                        end
      STORE_DB_LUMA   : begin if( ~store_db )
                                next_fetch = STORE_DB_CHROMA ;
                              else if( extif_done_i )
                                next_fetch = STORE_DB_CHROMA ;
                              else begin
                                next_fetch = STORE_DB_LUMA ;
                              end
                        end
      STORE_DB_CHROMA : begin if( ~store_db )
                                next_fetch = IDLE ;
                              else if( extif_done_i ) begin
                                if( store_db_done )
                                  next_fetch = IDLE ;
                                else begin
                                  next_fetch = STORE_DB_LUMA ;
                                end
                              end
                              else begin
                                next_fetch = STORE_DB_CHROMA ;
                              end
                        end
    endcase
  end

// take care of store_db twice, when x == total_x

assign store_db = db & (db_1_x != 'd0);

always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
        store_db_done <= 'd0;
    end
    else if( current_fetch == LOAD_DB_CHROMA )  begin
        if (db_1_x == sysif_total_x_i)
            store_db_done <= 'd0;
        else
            store_db_done <= 'd1;
    end
    else if( (current_fetch==STORE_DB_CHROMA) & extif_done_i ) begin
        store_db_done <= 'd1;
    end
end


// address gen

  always @ (*) begin
    case (current_fetch)
      LOAD_CUR_SUB    : begin extif_x_o       = first_x;
                              extif_y_o       = first_y;
                              extif_width_o   = 'd16;
                              extif_height_o  = 'd16;
                              extif_mode_o    = LOAD_CUR_SUB;
                        end
      LOAD_REF_SUB    : begin extif_x_o       = first_x;
                              extif_y_o       = first_y;
                              extif_width_o   = 'd16;
                              extif_height_o  = 'd16;
                              extif_mode_o    = LOAD_REF_SUB;
                        end
      LOAD_CUR_LUMA   : begin extif_x_o       = ( sysif_type_i==INTRA ) ? first_x : pre_x ;
                              extif_y_o       = ( sysif_type_i==INTRA ) ? first_y : pre_y ;
                              extif_width_o   = 'd64;
                              extif_height_o  = 'd64;
                              extif_mode_o    = LOAD_CUR_LUMA;
                        end
      LOAD_REF_LUMA   : begin extif_x_o       = luma_ref_x_s;
                              extif_y_o       = luma_ref_y_s;
                              extif_width_o   = 'd96;
                              extif_height_o  = luma_ref_height;
                              extif_mode_o    = LOAD_REF_LUMA;
                        end
      LOAD_CUR_CHROMA : begin extif_x_o       = ( sysif_type_i==INTRA ) ? pre_i_x : fme_x ;
                              extif_y_o       = ( sysif_type_i==INTRA ) ? pre_i_y : fme_y ;
                              extif_width_o   = 'd64;
                              extif_height_o  = 'd64;
                              extif_mode_o    = LOAD_CUR_CHROMA;
                        end
      LOAD_REF_CHROMA : begin extif_x_o       = luma_ref_x_s_r2;
                              extif_y_o       = luma_ref_y_s_r2;
                              extif_width_o   = 'd96;
                              extif_height_o  = luma_ref_height_r2;
                              extif_mode_o    = LOAD_REF_CHROMA;
                        end
      LOAD_DB_LUMA    : begin extif_x_o       =(( sysif_type_i==INTRA ) ? intra_x : mc_x ) * 64;
                              extif_y_o       =(( sysif_type_i==INTRA ) ? intra_y : mc_y ) * 64 - 4;
                              extif_width_o   = 'd64;
                              extif_height_o  = 'd4;
                              extif_mode_o    = LOAD_DB_LUMA;
                        end
      LOAD_DB_CHROMA  : begin extif_x_o       =(( sysif_type_i==INTRA ) ? intra_x : mc_x ) * 64;
                              extif_y_o       =(( sysif_type_i==INTRA ) ? intra_y : mc_y ) * 64 - 8;
                              extif_width_o   = 'd64;
                              extif_height_o  = 'd8;
                              extif_mode_o    = LOAD_DB_CHROMA;
                        end
      STORE_DB_LUMA   : begin extif_x_o       = ( store_db_done & (db_1_x==sysif_total_x_i) ) ? (db_1_x * 64) : (db_2_x * 64    ) ;
                              extif_y_o       = ( db_1_y==0                                 ) ? (db_1_y * 64) : (db_1_y * 64 - 4) ;
                              extif_width_o   =                 64 ;
                              extif_height_o  = ( db_1_y==0 ) ? 64 : 68 ;
                              extif_mode_o    = STORE_DB_LUMA ;
                        end
      STORE_DB_CHROMA : begin extif_x_o       = ( store_db_done & (db_1_x==sysif_total_x_i) ) ? (db_1_x * 64) : (db_2_x * 64    ) ;
                              extif_y_o       = ( db_1_y==0                                 ) ? (db_1_y * 64) : (db_1_y * 64 - 8) ;
                              extif_width_o   =                 64 ;
                              extif_height_o  = ( db_1_y==0 ) ? 64 : 72 ;
                              extif_mode_o    = STORE_DB_CHROMA ;
                        end
      default         : begin extif_x_o       = 'd0;
                              extif_y_o       = 'd0;
                              extif_width_o   = 'd0;
                              extif_height_o  = 'd0;
                              extif_mode_o    = IDLE;
                        end
    endcase
  end

  // extif_start_o
  always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
      extif_start_o <= 1'b0;
    end
    else if( sysif_type_i==INTER ) begin
      if ( (current_fetch  == IDLE            && next_fetch == LOAD_CUR_SUB    && cime                   ) || // cur_sub
           (current_fetch  == LOAD_CUR_SUB    && next_fetch == LOAD_REF_SUB    && cime                   ) || // ref_sub
           (current_fetch  == LOAD_REF_SUB    && next_fetch == LOAD_CUR_LUMA   && preload                ) || // cur_luma
           (current_fetch  == LOAD_CUR_LUMA   && next_fetch == LOAD_REF_LUMA   && preload                ) || // ref_luma
           (current_fetch  == LOAD_REF_LUMA   && next_fetch == LOAD_CUR_CHROMA && fme                    ) || // cur_chroma
           (current_fetch  == LOAD_CUR_CHROMA && next_fetch == LOAD_REF_CHROMA && fme                    ) || // ref_chroma
           (current_fetch  == LOAD_REF_CHROMA && next_fetch == LOAD_DB_LUMA    && mc       && (mc_y !=0) ) || // load db_luma
           (current_fetch  == LOAD_DB_LUMA    && next_fetch == LOAD_DB_CHROMA  && mc       && (mc_y !=0) ) || // load db_chroma
           (current_fetch  == LOAD_DB_CHROMA  && next_fetch == STORE_DB_LUMA   && store_db               ) || // store db luma
           (current_fetch  == STORE_DB_LUMA   && next_fetch == STORE_DB_CHROMA && store_db               ) || // store db chroma
           (current_fetch  == STORE_DB_CHROMA && store_db_done == 1'b0 && extif_done_i                   ) )  // store db luma & chroma again at x=total
        extif_start_o <= 1'b1;
      else begin
        extif_start_o <= 1'b0;
      end
    end
    else begin
      if( (current_fetch  == LOAD_REF_SUB    && next_fetch == LOAD_CUR_LUMA   && preload                   ) || // cur_luma
          (current_fetch  == LOAD_REF_LUMA   && next_fetch == LOAD_CUR_CHROMA && pre_i                     ) || // cur_chroma
          (current_fetch  == LOAD_REF_CHROMA && next_fetch == LOAD_DB_LUMA    && intra    && (intra_y !=0) ) || // load db luma
          (current_fetch  == LOAD_DB_LUMA    && next_fetch == LOAD_DB_CHROMA  && intra    && (intra_y !=0) ) || // load db_chroma
          (current_fetch  == LOAD_DB_CHROMA  && next_fetch == STORE_DB_LUMA   && store_db                  ) || // store db luma
          (current_fetch  == STORE_DB_LUMA   && next_fetch == STORE_DB_CHROMA && store_db                  ) || // store db chroma
          (current_fetch  == STORE_DB_CHROMA && store_db_done == 1'b0 && extif_done_i                      ) )  // store db luma & chroma again at x=total
        extif_start_o <= 1'b1 ;
      else begin
        extif_start_o <= 1'b0 ;
      end
    end
  end


// ref address calc

assign cimv_pre_i_x = cimv_pre_i[19:10];
assign cimv_pre_i_y = cimv_pre_i[9:0];

// ref x & y coordinate
wire signed [13:0] pre_x_minus16  = pre_x * 64 - 'd16;
wire signed [13:0] pre_x_plus80   = pre_x * 64 + cimv_pre_i_x + 'd80;
wire signed [13:0] pre_y_minus16  = pre_y * 64 - 'd16;

always @ (*) begin
    if ( pre_x_minus16 < 0 )
        luma_ref_x_s = 'd0;
//    else if ( pre_x_plus80 > (sysif_total_x_i+1)*64)
//        luma_ref_x_s = (sysif_total_x_i+1)*64 - 'd96;
    else
        luma_ref_x_s = pre_x * 64 + cimv_pre_i_x - 'd16;
end


always @ (*) begin
    if ( pre_y_minus16 < 0 )
        luma_ref_y_s = 'd0;
    else
        luma_ref_y_s = pre_y* 64 + cimv_pre_i_y - 'd16;
end

// ref width & height
always @ (*) begin
    if ( pre_y_minus16 < 0 )
        luma_ref_height = 96 + (pre_y * 64 + cimv_pre_i_y - 'd16) ;
    else if ( (pre_y * 64 + cimv_pre_i_y + 'd80) > (sysif_total_y_i+1)*64)
        luma_ref_height = (sysif_total_y_i+1)*64 - 2 * ( pre_y * 64 + cimv_pre_i_y);
    else
        luma_ref_height = 'd96;
end

  // chroma
  always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
      luma_ref_height_r1   <= 0 ;
      luma_ref_height_r2   <= 0 ;
      luma_ref_x_s_r1      <= 0 ;
      luma_ref_x_s_r2      <= 0 ;
      luma_ref_y_s_r1      <= 0 ;
      luma_ref_y_s_r2      <= 0 ;
      chroma_ref_lshift_r1 <= 0 ;
      chroma_ref_lshift_r2 <= 0 ;
      chroma_ref_rshift_r1 <= 0 ;
      chroma_ref_rshift_r2 <= 0 ;
    end
    else if (sysif_done_o) begin
      luma_ref_height_r1   <= luma_ref_height      ;
      luma_ref_height_r2   <= luma_ref_height_r1   ;
      luma_ref_x_s_r1      <= luma_ref_x_s         ;
      luma_ref_x_s_r2      <= luma_ref_x_s_r1      ;
      luma_ref_y_s_r1      <= luma_ref_y_s         ;
      luma_ref_y_s_r2      <= luma_ref_y_s_r1      ;
      chroma_ref_lshift_r1 <= (pre_x_minus16 < 0)  ;
      chroma_ref_lshift_r2 <= chroma_ref_lshift_r1 ;
      chroma_ref_rshift_r1 <= (pre_x_plus80 > (sysif_total_x_i+1)*64) ;
      chroma_ref_rshift_r2 <= chroma_ref_rshift_r1 ;
    end
  end


// ***********************************************
// Assignment
// ***********************************************

always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
        sysif_done_o <= 1'b0;
    end
    else begin
        sysif_done_o <= (current_fetch == STORE_DB_CHROMA ) & ( (extif_done_i & store_db_done) | (~store_db) ) ;
    end
end

assign cur_luma_done_o    = (current_fetch == LOAD_CUR_LUMA) && (preload & extif_done_i);

assign cur_chroma_done_o  = (current_fetch == LOAD_CUR_CHROMA) && (fme & extif_done_i);

assign ref_luma_done_o    = (current_fetch == LOAD_REF_LUMA) && (preload & extif_done_i);

assign ref_chroma_done_o  = (current_fetch == LOAD_REF_CHROMA) && (fme & extif_done_i);

assign db_store_done_o    = (current_fetch == STORE_DB_CHROMA) && (db & extif_done_i);

assign db_store_en_o    = 1 ;
assign extif_data_o = ((cur_state_db_store_d==DB_STORE_CHRO_PRE)|(cur_state_db_store_d==DB_STORE_CHRO_CUR))
                       ? ( db_store_addr_r[0] ? { db_store_data_i[127:120],db_store_data_i[095:088],db_store_data_i[119:112],db_store_data_i[087:080],db_store_data_i[111:104],db_store_data_i[079:072],db_store_data_i[103:096],db_store_data_i[071:064]
                                                 ,db_store_data_i[063:056],db_store_data_i[031:024],db_store_data_i[055:048],db_store_data_i[023:016],db_store_data_i[047:040],db_store_data_i[015:008],db_store_data_i[039:032],db_store_data_i[007:000]
                                                }
                                              : { db_store_data_i[255:248],db_store_data_i[223:216],db_store_data_i[247:240],db_store_data_i[215:208],db_store_data_i[239:232],db_store_data_i[207:200],db_store_data_i[231:224],db_store_data_i[199:192]
                                                 ,db_store_data_i[191:184],db_store_data_i[159:152],db_store_data_i[183:176],db_store_data_i[151:144],db_store_data_i[175:168],db_store_data_i[143:136],db_store_data_i[167:160],db_store_data_i[135:128]
                                                }
                         )
                       : ( db_store_addr_r[0] ? db_store_data_i[16*`PIXEL_WIDTH-1:0] : db_store_data_i[32*`PIXEL_WIDTH-1:16*`PIXEL_WIDTH] );

assign db_ref_en_o    = ( (current_fetch==LOAD_DB_LUMA)|(current_fetch==LOAD_DB_CHROMA) ) && extif_wren_i ;
assign db_ref_data_o  = ( db_ref_addr_o<16 ) ? extif_data_i :
                        { extif_data_i[127:120],extif_data_i[111:104],extif_data_i[095:088],extif_data_i[079:072],extif_data_i[063:056],extif_data_i[047:040],extif_data_i[031:024],extif_data_i[015:008]
                         ,extif_data_i[119:112],extif_data_i[103:096],extif_data_i[087:080],extif_data_i[071:064],extif_data_i[055:048],extif_data_i[039:032],extif_data_i[023:016],extif_data_i[007:000]
                        } ;


// ***********************
// Data Alias (modify this part if AXI_WIDTH is changed)
// ***********************


always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
        extif_data_0 <= 'd0;
        extif_data_1 <= 'd0;
        extif_data_2 <= 'd0;
        extif_data_3 <= 'd0;
        extif_data_4 <= 'd0;
    end
    else if (extif_wren_i) begin
        extif_data_0 <= extif_data_i;
        extif_data_1 <= extif_data_0;
        extif_data_2 <= extif_data_1;
        extif_data_3 <= extif_data_2;
        extif_data_4 <= extif_data_3;
    end
end


// cur luma
always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
        cur_luma_addr <= 'd0;
    end
    else if (cur_luma_valid_o) begin
        cur_luma_addr <= cur_luma_addr + 'd1;
    end
end

  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      cur_luma_cnt     <= 0 ;
      cur_luma_valid_o <= 0 ;
    end
    else if( current_fetch!=next_fetch ) begin
      cur_luma_cnt     <= 0 ;
      cur_luma_valid_o <= 0 ;
    end
    else if( (current_fetch==LOAD_CUR_LUMA) && extif_wren_i ) begin
      if( cur_luma_cnt==(32/AXI_WIDTH_PIXEL-1) ) begin
        cur_luma_cnt     <= 0 ;
        cur_luma_valid_o <= 1 ;
      end
      else begin
        cur_luma_cnt     <= cur_luma_cnt + 1 ;
        cur_luma_valid_o <= 0 ;
      end
    end
    else begin
      cur_luma_valid_o <= 0 ;
    end
  end

assign cur_luma_data_o = { extif_data_1 ,extif_data_0 };

assign cur_luma_addr_o = {  cur_luma_addr[6],
                            cur_luma_addr[0],
                            cur_luma_addr[5:1]
                         };

// ref_luma

  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      ref_luma_addr_o <= 0 ;
      ref_luma_cnt    <= 0 ;
    end
    else if( current_fetch!=next_fetch ) begin
        ref_luma_addr_o <= 0 ;
        ref_luma_cnt    <= 0 ;
    end
    else if( (current_fetch==LOAD_REF_LUMA) && extif_wren_i ) begin
      if( ref_luma_cnt==(96/AXI_WIDTH_PIXEL-1) ) begin
        ref_luma_addr_o <= ref_luma_addr_o+1 ;
        ref_luma_cnt    <= 0 ;
      end
      else begin
        ref_luma_addr_o <= ref_luma_addr_o ;
        ref_luma_cnt    <= ref_luma_cnt+1  ;
      end
    end
  end

assign ref_luma_data   = {extif_data_4,extif_data_3, extif_data_2,
                          extif_data_1,extif_data_0, extif_data_i};
assign ref_luma_valid_o= (current_fetch==LOAD_REF_LUMA) && extif_wren_i && (ref_luma_cnt==(96/AXI_WIDTH_PIXEL-1)) ;
assign ref_luma_lshift = {{32{extif_data_4[16*`PIXEL_WIDTH-1:15*`PIXEL_WIDTH]}},ref_luma_data} >> ('d16 * `PIXEL_WIDTH);
assign ref_luma_rshift = {extif_data_4,extif_data_3,extif_data_2,
                          extif_data_1,extif_data_0,{32{extif_data_0[`PIXEL_WIDTH-1:0]}}};

always @ (*) begin
    if ( pre_x_minus16< 0)
        ref_luma_data_o = ref_luma_lshift[96*`PIXEL_WIDTH-1:0];
    else if (pre_x_plus80 > (sysif_total_x_i+1)*64)
        ref_luma_data_o = {extif_data_4,extif_data_3,extif_data_2,extif_data_1,extif_data_0,{16{extif_data_0[`PIXEL_WIDTH-1:0]}}};
    else
        ref_luma_data_o = ref_luma_data;
end


// cur_chroma
always @ (posedge clk or negedge rstn) begin
    if(~rstn) begin
        cur_chroma_addr <= 'd0;
    end
    else if (cur_chroma_valid_o) begin
        cur_chroma_addr <= cur_chroma_addr + 'd1;
    end
end

  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      cur_chroma_cnt     <= 0 ;
      cur_chroma_valid_o <= 0 ;
    end
    else if( current_fetch!=next_fetch ) begin
      cur_chroma_cnt     <= 0 ;
      cur_chroma_valid_o <= 0 ;
    end
    else if( (current_fetch==LOAD_CUR_CHROMA) && extif_wren_i ) begin
      if( cur_chroma_cnt==(32/AXI_WIDTH_PIXEL-1) ) begin
        cur_chroma_cnt     <= 0 ;
        cur_chroma_valid_o <= 1 ;
      end
      else begin
        cur_chroma_cnt     <= cur_chroma_cnt + 1 ;
        cur_chroma_valid_o <= 0;
      end
    end
    else begin
      cur_chroma_valid_o <= 0 ;
    end
  end

  assign cur_chroma_data_o  = { extif_data_1[127:120],extif_data_1[111:104],extif_data_1[095:088],extif_data_1[079:072],extif_data_1[063:056],extif_data_1[047:040],extif_data_1[031:024],extif_data_1[015:008]
                               ,extif_data_0[127:120],extif_data_0[111:104],extif_data_0[095:088],extif_data_0[079:072],extif_data_0[063:056],extif_data_0[047:040],extif_data_0[031:024],extif_data_0[015:008]
                               ,extif_data_1[119:112],extif_data_1[103:096],extif_data_1[087:080],extif_data_1[071:064],extif_data_1[055:048],extif_data_1[039:032],extif_data_1[023:016],extif_data_1[007:000]
                               ,extif_data_0[119:112],extif_data_0[103:096],extif_data_0[087:080],extif_data_0[071:064],extif_data_0[055:048],extif_data_0[039:032],extif_data_0[023:016],extif_data_0[007:000]
                              };

assign cur_chroma_addr_o  = { cur_chroma_addr[5],
                              cur_chroma_addr[0],
                              cur_chroma_addr[4:1]
                            };
// ref_chroma ***

  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      ref_chroma_addr    <= 0 ;
      ref_chroma_cnt     <= 0 ;
    end
    else if( current_fetch!=next_fetch ) begin
      ref_chroma_addr    <= 0 ;
      ref_chroma_cnt     <= 0 ;
    end
    else if( (current_fetch==LOAD_REF_CHROMA) && extif_wren_i ) begin
      if( ref_chroma_cnt==(48/AXI_WIDTH_PIXEL*2-1) ) begin
        ref_chroma_cnt     <= 0 ;
        ref_chroma_addr    <= ref_chroma_addr+1 ;
      end
      else begin
        ref_chroma_addr    <= ref_chroma_addr   ;
        ref_chroma_cnt     <= ref_chroma_cnt+1  ;
      end
    end
  end

  assign ref_chroma_valid_o = (current_fetch==LOAD_REF_CHROMA) && extif_wren_i && ref_chroma_cnt==(48/AXI_WIDTH_PIXEL*2-1) ;
  assign ref_chroma_addr_o  = ref_chroma_addr ;
  assign ref_chroma_u_data  = { extif_data_4[127:120],extif_data_4[111:104],extif_data_4[095:088],extif_data_4[079:072],extif_data_4[063:056],extif_data_4[047:040],extif_data_4[031:024],extif_data_4[015:008]
                               ,extif_data_3[127:120],extif_data_3[111:104],extif_data_3[095:088],extif_data_3[079:072],extif_data_3[063:056],extif_data_3[047:040],extif_data_3[031:024],extif_data_3[015:008]
                               ,extif_data_2[127:120],extif_data_2[111:104],extif_data_2[095:088],extif_data_2[079:072],extif_data_2[063:056],extif_data_2[047:040],extif_data_2[031:024],extif_data_2[015:008]
                               ,extif_data_1[127:120],extif_data_1[111:104],extif_data_1[095:088],extif_data_1[079:072],extif_data_1[063:056],extif_data_1[047:040],extif_data_1[031:024],extif_data_1[015:008]
                               ,extif_data_0[127:120],extif_data_0[111:104],extif_data_0[095:088],extif_data_0[079:072],extif_data_0[063:056],extif_data_0[047:040],extif_data_0[031:024],extif_data_0[015:008]
                               ,extif_data_i[127:120],extif_data_i[111:104],extif_data_i[095:088],extif_data_i[079:072],extif_data_i[063:056],extif_data_i[047:040],extif_data_i[031:024],extif_data_i[015:008]
                               };
  assign ref_chroma_v_data  = { extif_data_4[119:112],extif_data_4[103:096],extif_data_4[087:080],extif_data_4[071:064],extif_data_4[055:048],extif_data_4[039:032],extif_data_4[023:016],extif_data_4[007:000]
                               ,extif_data_3[119:112],extif_data_3[103:096],extif_data_3[087:080],extif_data_3[071:064],extif_data_3[055:048],extif_data_3[039:032],extif_data_3[023:016],extif_data_3[007:000]
                               ,extif_data_2[119:112],extif_data_2[103:096],extif_data_2[087:080],extif_data_2[071:064],extif_data_2[055:048],extif_data_2[039:032],extif_data_2[023:016],extif_data_2[007:000]
                               ,extif_data_1[119:112],extif_data_1[103:096],extif_data_1[087:080],extif_data_1[071:064],extif_data_1[055:048],extif_data_1[039:032],extif_data_1[023:016],extif_data_1[007:000]
                               ,extif_data_0[119:112],extif_data_0[103:096],extif_data_0[087:080],extif_data_0[071:064],extif_data_0[055:048],extif_data_0[039:032],extif_data_0[023:016],extif_data_0[007:000]
                               ,extif_data_i[119:112],extif_data_i[103:096],extif_data_i[087:080],extif_data_i[071:064],extif_data_i[055:048],extif_data_i[039:032],extif_data_i[023:016],extif_data_i[007:000]
                               };
  assign ref_chroma_u_lshift = {{8{ref_chroma_u_data[48*`PIXEL_WIDTH-1:47*`PIXEL_WIDTH]}},ref_chroma_u_data}>>(8*`PIXEL_WIDTH) ;
  assign ref_chroma_v_lshift = {{8{ref_chroma_v_data[48*`PIXEL_WIDTH-1:47*`PIXEL_WIDTH]}},ref_chroma_v_data}>>(8*`PIXEL_WIDTH) ;
  assign ref_chroma_u_rshift = {ref_chroma_u_data>>(8*`PIXEL_WIDTH),{8{ref_chroma_u_data[09*`PIXEL_WIDTH-1:08*`PIXEL_WIDTH]}}} ;
  assign ref_chroma_v_rshift = {ref_chroma_v_data>>(8*`PIXEL_WIDTH),{8{ref_chroma_v_data[09*`PIXEL_WIDTH-1:08*`PIXEL_WIDTH]}}} ;

  always @ (*) begin
    if ( chroma_ref_lshift_r2 )
      ref_chroma_data_o = { ref_chroma_u_lshift ,ref_chroma_v_lshift };
    else if ( chroma_ref_rshift_r2 )
      ref_chroma_data_o = { ref_chroma_u_rshift ,ref_chroma_v_rshift };
    else begin
      ref_chroma_data_o = { ref_chroma_u_data   ,ref_chroma_v_data   };
    end
  end

  // db_ref_addr_o
  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      db_ref_addr_o <= 0 ;
    end
    else if( (current_fetch==LOAD_DB_LUMA) & extif_start_o ) begin
      db_ref_addr_o <= 0 ;
    end
    else if( ((current_fetch==LOAD_DB_LUMA)|(current_fetch==LOAD_DB_CHROMA)) & extif_wren_i ) begin
      db_ref_addr_o <= db_ref_addr_o + 1;
    end
  end

  // cur_state_db_store
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      cur_state_db_store   <= DB_STORE_IDLE ;
    else begin
      cur_state_db_store   <= nxt_state_db_store ;
    end
  end

  // nxt_state_db_store
  always @(*) begin
                                                   nxt_state_db_store = DB_STORE_IDLE     ;
    case( cur_state_db_store )
      DB_STORE_IDLE     : if( (current_fetch==STORE_DB_LUMA)&(extif_start_o) )
                            if( db_1_y==0 )        nxt_state_db_store = DB_STORE_LUMA_CUR ;
                            else                   nxt_state_db_store = DB_STORE_LUMA_PRE ;
                          else                     nxt_state_db_store = DB_STORE_IDLE     ;
      DB_STORE_LUMA_PRE : if( db_store_done_w )    nxt_state_db_store = DB_STORE_LUMA_CUR ;
                          else                     nxt_state_db_store = DB_STORE_LUMA_PRE ;
      DB_STORE_LUMA_CUR : if( db_store_done_w )
                            if( db_1_y==0 )        nxt_state_db_store = DB_STORE_CHRO_CUR ;
                            else                   nxt_state_db_store = DB_STORE_CHRO_PRE ;
                          else                     nxt_state_db_store = DB_STORE_LUMA_CUR ;
      DB_STORE_CHRO_PRE : if( db_store_done_w )    nxt_state_db_store = DB_STORE_CHRO_CUR ;
                          else                     nxt_state_db_store = DB_STORE_CHRO_PRE ;
      DB_STORE_CHRO_CUR : if( db_store_done_w )    nxt_state_db_store = DB_STORE_IDLE     ;
                          else                     nxt_state_db_store = DB_STORE_CHRO_CUR ;
    endcase
  end

  // db_store_done_w
  always @(*) begin
                          db_store_done_w = ( db_store_addr_r == (  1-1) ) & extif_rden_i ;
    case( cur_state_db_store )
      DB_STORE_IDLE     : db_store_done_w = ( db_store_addr_r == (  1-1) ) & extif_rden_i ;
      DB_STORE_LUMA_PRE : db_store_done_w = ( db_store_addr_r == ( 16-1) ) & extif_rden_i ;
      DB_STORE_LUMA_CUR : db_store_done_w = ( db_store_addr_r == (256-1) ) & extif_rden_i ;
      DB_STORE_CHRO_PRE : db_store_done_w = ( db_store_addr_r == ( 16-1) ) & extif_rden_i ;
      DB_STORE_CHRO_CUR : db_store_done_w = ( db_store_addr_r == (128-1) ) & extif_rden_i ;
    endcase
  end

  // db_store_addr_r
  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      db_store_addr_r <= 0 ;
    end
    else if( (current_fetch==STORE_DB_LUMA) & extif_start_o ) begin
      db_store_addr_r <= 0 ;
    end
    else if( ((current_fetch==STORE_DB_LUMA)|(current_fetch==STORE_DB_CHROMA)) & extif_rden_i ) begin
      if( db_store_done_w )
        db_store_addr_r <= 0 ;
      else begin
        db_store_addr_r <= db_store_addr_r + 1 ;
      end
    end
  end

  // db_store_addr_w
  always @(*) begin
    db_store_addr_w = db_store_addr_r ;
    if( (current_fetch==STORE_DB_LUMA) & extif_start_o )
      db_store_addr_w = 0 ;
    else if( (current_fetch==STORE_DB_LUMA)|(current_fetch==STORE_DB_CHROMA) ) begin
      if( extif_rden_i ) begin
        if( db_store_done_w )
          db_store_addr_w = 0 ;
        else begin
          db_store_addr_w = db_store_addr_r + 1 ;
        end
      end
      else begin
        db_store_addr_w = db_store_addr_r ;
      end
    end
  end

  // cur_state_db_store_d
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      cur_state_db_store_d <= 0 ;
    else if( (current_fetch==STORE_DB_LUMA) | (current_fetch==STORE_DB_CHROMA) & extif_rden_i )begin
      cur_state_db_store_d <= nxt_state_db_store ;
    end
  end

  // db_store_addr_o
  always @(*) begin
                          db_store_addr_o =   0 ;
    case( nxt_state_db_store )
      DB_STORE_IDLE     : db_store_addr_o =   0 ;
      DB_STORE_LUMA_PRE : db_store_addr_o = 192 + { db_store_addr_w[8:4] ,db_store_addr_w[1] ,db_store_addr_w[3:2] };
      DB_STORE_LUMA_CUR : db_store_addr_o =   0 + { db_store_addr_w[8:7] ,db_store_addr_w[1] ,db_store_addr_w[6:2] };
      DB_STORE_CHRO_PRE : db_store_addr_o = 200 + { db_store_addr_w[8:4] ,db_store_addr_w[1] ,db_store_addr_w[3:2] };
      DB_STORE_CHRO_CUR : db_store_addr_o = 128 + { db_store_addr_w[8:4] ,db_store_addr_w[1] ,db_store_addr_w[3:2] };
    endcase
  end


//output
assign sysif_fime_y_o = fime_y ;
assign sysif_fme_y_o  = fme_y  ;
assign sysif_mc_y_o   = mc_y   ;


endmodule

