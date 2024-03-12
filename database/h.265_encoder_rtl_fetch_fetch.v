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
//  Filename      : fetch.v
//  Author        : Yufeng Bai
//  Email     : byfchina@gmail.com
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-08-18 by HLL
//  Description   : db supported
//  Modified      : 2014-08-20 by HLL
//  Description   : rotate logic corrected
//  Modified      : 2015-09-02 by HLL
//  Description   : fetch and enc run simultaneously
//                  one more buffer added in fetch_db
//  Modified      : 2015-09-05 by HLL
//  Description   : intra supported
//  Modified      : 2015-09-07 by HLL
//  Description   : pre_intra supported
//  Modified      : 2015-09-17 by HLL
//  Description   : ref_chroma provided in the order of uvuvuv...
//  Modified      : 2015-09-19 by HLL
//  Description   : more modes connected out
//
//-------------------------------------------------------------------

`include "enc_defines.v"

module fetch (
  clk           ,
  rstn            ,

  sysif_start_i   ,
  sysif_done_o    ,
  sysif_type_i    ,
  sysif_total_x_i   ,
  sysif_total_y_i   ,

  pre_i_4x4_x_i      ,
  pre_i_4x4_y_i      ,
  pre_i_4x4_idx_i    ,
  pre_i_sel_i        ,
  pre_i_size_i       ,
  pre_i_rden_i       ,
  pre_i_pel_o        ,

  cimv_pre_i    ,
  cimv_fme_i    ,

  cime_cur_4x4_x_i  ,
  cime_cur_4x4_y_i  ,
  cime_cur_4x4_idx_i  ,
  cime_cur_sel_i    ,
  cime_cur_size_i   ,
  cime_cur_rden_i   ,
  cime_cur_pel_o    ,
  cime_ref_x_i    ,
  cime_ref_y_i    ,
  cime_ref_rden_i   ,
  cime_ref_pel_o    ,

  fime_cur_4x4_x_i  ,
  fime_cur_4x4_y_i  ,
  fime_cur_4x4_idx_i  ,
  fime_cur_sel_i    ,
  fime_cur_size_i   ,
  fime_cur_rden_i   ,
  fime_cur_pel_o    ,
  fime_ref_x_i    ,
  fime_ref_y_i    ,
  fime_ref_rden_i   ,
  fime_ref_pel_o    ,

  fme_cur_4x4_x_i   ,
  fme_cur_4x4_y_i   ,
  fme_cur_4x4_idx_i ,
  fme_cur_sel_i   ,
  fme_cur_size_i    ,
  fme_cur_rden_i    ,
  fme_cur_pel_o   ,
  fme_ref_x_i   ,
  fme_ref_y_i   ,
  fme_ref_rden_i    ,
  fme_ref_pel_o   ,

  mc_cur_4x4_x_i    ,
  mc_cur_4x4_y_i    ,
  mc_cur_4x4_idx_i  ,
  mc_cur_sel_i    ,
  mc_cur_size_i   ,
  mc_cur_rden_i   ,
  mc_cur_pel_o    ,

  mc_ref_x_i    ,
  mc_ref_y_i    ,
  mc_ref_rden_i   ,
  mc_ref_sel_i    ,
  mc_ref_pel_o    ,

  db_cur_4x4_x_i    ,
  db_cur_4x4_y_i    ,
  db_cur_4x4_idx_i  ,
  db_cur_sel_i    ,
  db_cur_size_i   ,
  db_cur_rden_i   ,
  db_cur_pel_o    ,

  db_wen_i    ,
  db_w4x4_x_i   ,
  db_w4x4_y_i   ,
        db_wprevious_i          ,
        db_done_i              ,
        db_wsel_i               ,
  db_wdata_i    ,
  db_ren_i    ,
  db_r4x4_i   ,
  db_ridx_i   ,
  db_rdata_o    ,

        extif_start_o   ,
  extif_done_i    ,
  extif_mode_o    ,
  extif_x_o   ,
  extif_y_o   ,
        extif_rden_i            ,
        extif_wren_i            ,
  extif_width_o   ,
  extif_height_o    ,
  extif_data_i    ,
  extif_data_o
);

// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************

input    [1-1:0]              clk            ; // clk signal
input    [1-1:0]              rstn           ; // asynchronous reset
input    [1-1:0]              sysif_start_i    ; // "system interface
output   [1-1:0]              sysif_done_o   ; // "system interface
input                         sysif_type_i    ;
input    [`PIC_X_WIDTH-1:0]       sysif_total_x_i    ; // "system interface
input    [`PIC_Y_WIDTH-1:0]       sysif_total_y_i    ; // "system interface

input    [4-1               : 0]    pre_i_4x4_x_i   ; // pre_i current lcu x
input    [4-1               : 0]    pre_i_4x4_y_i   ; // pre_i current lcu y
input    [5-1               : 0]    pre_i_4x4_idx_i ; // pre_i current lcu idx
input    [1-1               : 0]    pre_i_sel_i     ; // pre_i current lcu chroma/luma sel
input    [2-1               : 0]    pre_i_size_i    ; // pre_i current lcu size :4x4
input    [1-1               : 0]    pre_i_rden_i    ; // pre_i current lcu read enable
output   [32*`PIXEL_WIDTH-1 : 0]    pre_i_pel_o     ; // pre_i current lcu pixel

input    [20-1:0]           cimv_pre_i           ; // cime mv
input    [20-1:0]           cimv_fme_i           ; // fme mv

input    [4-1:0]              cime_cur_4x4_x_i   ; // cime current lcu x
input    [4-1:0]              cime_cur_4x4_y_i   ; // cime current lcu y
input    [6-1:0]              cime_cur_4x4_idx_i   ; // cime current lcu idx
input    [1-1:0]              cime_cur_sel_i   ; // cime current lcu chroma/luma sel
input    [2-1:0]              cime_cur_size_i    ; // "cime current lcu size :4x4
input    [1-1:0]              cime_cur_rden_i    ; // cime current lcu read enable
output   [32*`PIXEL_WIDTH-1:0]      cime_cur_pel_o   ; // cime current lcu pixel
input    [6-1:0]              cime_ref_x_i   ; // cime ref x
input    [6-1:0]              cime_ref_y_i   ; // cime ref y
input    [1-1:0]              cime_ref_rden_i    ; // cime ref read enable
output   [16*`PIXEL_WIDTH-1:0]      cime_ref_pel_o   ; // cime ref pixel

input    [4-1:0]              fime_cur_4x4_x_i   ; // fime current lcu x
input    [4-1:0]              fime_cur_4x4_y_i   ; // fime current lcu y
input    [5-1:0]              fime_cur_4x4_idx_i   ; // fime current lcu idx
input    [1-1:0]              fime_cur_sel_i   ; // fime current lcu chroma/luma sel
input    [3-1:0]              fime_cur_size_i    ; // "fime current lcu size :4x4
input    [1-1:0]              fime_cur_rden_i    ; // fime current lcu read enable
output   [64*`PIXEL_WIDTH-1:0]      fime_cur_pel_o   ; // fime current lcu pixel
input    [8-1:0]              fime_ref_x_i   ; // fime ref x
input    [8-1:0]              fime_ref_y_i   ; // fime ref y
input    [1-1:0]              fime_ref_rden_i    ; // fime ref read enable
output   [64*`PIXEL_WIDTH-1:0]      fime_ref_pel_o   ; // fime ref pixel

input    [4-1:0]              fme_cur_4x4_x_i    ; // fme current lcu x
input    [4-1:0]              fme_cur_4x4_y_i    ; // fme current lcu y
input    [5-1:0]              fme_cur_4x4_idx_i    ; // fme current lcu idx
input    [1-1:0]              fme_cur_sel_i    ; // fme current lcu chroma/luma sel
input    [2-1:0]              fme_cur_size_i   ; // "fme current lcu size :4x4
input    [1-1:0]              fme_cur_rden_i   ; // fme current lcu read enable
output   [32*`PIXEL_WIDTH-1:0]      fme_cur_pel_o    ; // fme current lcu pixel
input    [7-1:0]              fme_ref_x_i    ; // fme ref x
input    [7-1:0]              fme_ref_y_i    ; // fme ref y
input    [1-1:0]              fme_ref_rden_i   ; // fme ref read enable
output   [64*`PIXEL_WIDTH-1:0]      fme_ref_pel_o    ; // fme ref pixel

input    [4-1:0]              mc_cur_4x4_x_i   ; // mc current lcu x
input    [4-1:0]              mc_cur_4x4_y_i   ; // mc current lcu y
input    [5-1:0]              mc_cur_4x4_idx_i   ; // mc current lcu idx
input    [1-1:0]              mc_cur_sel_i   ; // mc current lcu chroma/luma sel
input    [2-1:0]              mc_cur_size_i    ; // "mc current lcu size :4x4
input    [1-1:0]              mc_cur_rden_i    ; // mc current lcu read enable
output   [32*`PIXEL_WIDTH-1:0]      mc_cur_pel_o   ; // mc current lcu pixel

input    [6-1:0]                    mc_ref_x_i     ;
input    [6-1:0]                    mc_ref_y_i     ;
input                               mc_ref_rden_i  ;
input                               mc_ref_sel_i   ;
output   [8*`PIXEL_WIDTH-1:0]       mc_ref_pel_o   ;

input    [4-1:0]              db_cur_4x4_x_i   ; // mc current lcu x
input    [4-1:0]              db_cur_4x4_y_i   ; // mc current lcu y
input    [5-1:0]              db_cur_4x4_idx_i   ; // mc current lcu idx
input    [1-1:0]              db_cur_sel_i   ; // db current lcu chroma/luma sel
input    [2-1:0]              db_cur_size_i    ; // "db current lcu size :4x4
input    [1-1:0]              db_cur_rden_i    ; // db current lcu read enable
output   [32*`PIXEL_WIDTH-1:0]      db_cur_pel_o   ; // db current lcu pixel

input    [1-1:0]              db_wen_i       ; // db write enable
input    [5-1:0]              db_w4x4_x_i        ; // db write 4x4 block index in x
input    [5-1:0]              db_w4x4_y_i        ; // db write 4x4 block index in y
input    [1-1:0]                    db_wprevious_i       ; // db write previous lcu data
input    [1-1:0]                    db_done_i           ; // db write previous lcu done
input    [2-1:0]                    db_wsel_i            ; // db write 4x4 block sel : 0x:luma, 10: u, 11:v
input    [16*`PIXEL_WIDTH-1:0]      db_wdata_i       ; // db write 4x4 block data

input    [1-1:0]              db_ren_i       ; // db read enable
input    [5-1:0]              db_r4x4_i        ; // db_read 4x4 block index
input    [2-1:0]              db_ridx_i        ; // db read pixel index in the block
output   [4*`PIXEL_WIDTH-1:0]       db_rdata_o       ; // db read pixel data

output   [1-1:0]              extif_start_o    ; // ext mem load start
input    [1-1:0]              extif_done_i   ; // ext mem load done
output   [5-1:0]              extif_mode_o   ; // "ext mode: {load/store} {luma
output   [6+`PIC_X_WIDTH-1:0]       extif_x_o            ; // x in ref frame
output   [6+`PIC_Y_WIDTH-1:0]       extif_y_o            ; // y in ref frame
output   [8-1:0]              extif_width_o    ; // ref window width
output   [8-1:0]              extif_height_o   ; // ref window height
input                               extif_rden_i         ;
input                               extif_wren_i         ;
input    [16*`PIXEL_WIDTH-1:0]      extif_data_i   ; // ext data input
output   [16*`PIXEL_WIDTH-1:0]      extif_data_o   ; // ext data output


// ********************************************
//
//    WIRE / REG DECLARATION
//
// ********************************************
wire                                cur_luma_done   ;
wire     [32*`PIXEL_WIDTH-1:0]      cur_luma_data   ;
wire                                cur_luma_valid  ;
wire     [7-1:0]                    cur_luma_addr   ;

wire                                cur_chroma_done ;
wire     [32*`PIXEL_WIDTH-1:0]      cur_chroma_data ;
wire                                cur_chroma_valid  ;
wire     [6-1:0]                    cur_chroma_addr ;

wire                                ref_luma_done   ;
wire     [96*`PIXEL_WIDTH-1:0]      ref_luma_data   ;
wire                                ref_luma_valid  ;
wire     [7-1:0]                    ref_luma_addr   ;

wire                                ref_chroma_done  ;
wire     [96*`PIXEL_WIDTH-1:0]      ref_chroma_data  ;
wire                                ref_chroma_valid ;
wire     [6-1:0]                    ref_chroma_addr  ;

wire     [8-1:0]                    db_store_addr   ;
wire                                db_store_en   ;
wire                                db_store_ready  ;
wire     [32*`PIXEL_WIDTH-1:0]      db_store_data   ;
wire     [5-1:0]                    db_ref_addr   ;
wire                                db_ref_en   ;
wire     [16*`PIXEL_WIDTH-1:0]      db_ref_data   ;


wire     [8-1:0]                    sysif_fime_y        ;
wire     [8-1:0]                    sysif_fme_y         ;
wire     [8-1:0]                    sysif_mc_y         ;

wire     [32*`PIXEL_WIDTH-1:0]      mc_cur_luma_pel_o   ;
wire     [32*`PIXEL_WIDTH-1:0]      mc_cur_chroma_pel_o ;

wire     [32*`PIXEL_WIDTH-1:0]      db_cur_luma_pel_o   ;
wire     [32*`PIXEL_WIDTH-1:0]      db_cur_chroma_pel_o ;

// ********************************************
//
//    Combinational Logic
//
// ********************************************


// ********************************************
//
//    Sequential Logic
//
// ********************************************

  // fetch_ctrl
  fetch_ctrl u_ctrl (
    .clk                ( clk                 ),
    .rstn               ( rstn                ),
    .sysif_start_i      ( sysif_start_i       ),
    .sysif_done_o       ( sysif_done_o        ),
    .sysif_type_i       ( sysif_type_i        ),
    .sysif_total_x_i    ( sysif_total_x_i     ),
    .sysif_total_y_i    ( sysif_total_y_i     ),
    .sysif_fime_y_o     ( sysif_fime_y        ),
    .sysif_fme_y_o      ( sysif_fme_y         ),
    .sysif_mc_y_o       ( sysif_mc_y          ),
    .cimv_pre_i         ( cimv_pre_i          ),
    .cimv_fme_i         ( cimv_fme_i          ),
    .cur_luma_done_o    ( cur_luma_done       ),
    .cur_luma_data_o    ( cur_luma_data       ),
    .cur_luma_valid_o   ( cur_luma_valid      ),
    .cur_luma_addr_o    ( cur_luma_addr       ),
    .cur_chroma_done_o  ( cur_chroma_done     ),
    .cur_chroma_data_o  ( cur_chroma_data     ),
    .cur_chroma_valid_o ( cur_chroma_valid    ),
    .cur_chroma_addr_o  ( cur_chroma_addr     ),
    .ref_luma_done_o    ( ref_luma_done       ),
    .ref_luma_data_o    ( ref_luma_data       ),
    .ref_luma_valid_o   ( ref_luma_valid      ),
    .ref_luma_addr_o    ( ref_luma_addr       ),
    .ref_chroma_done_o  ( ref_chroma_done     ),
    .ref_chroma_data_o  ( ref_chroma_data     ),
    .ref_chroma_valid_o ( ref_chroma_valid    ),
    .ref_chroma_addr_o  ( ref_chroma_addr     ),
    .db_store_addr_o    ( db_store_addr       ),
    .db_store_en_o      ( db_store_en         ),
    .db_store_data_i    ( db_store_data       ),
    .db_store_done_o    ( db_store_done       ),
    .db_ref_addr_o      ( db_ref_addr         ),
    .db_ref_en_o        ( db_ref_en           ),
    .db_ref_data_o      ( db_ref_data         ),
    .extif_start_o      ( extif_start_o       ),
    .extif_done_i       ( extif_done_i        ),
    .extif_mode_o       ( extif_mode_o        ),
    .extif_x_o          ( extif_x_o           ),
    .extif_y_o          ( extif_y_o           ),
    .extif_width_o      ( extif_width_o       ),
    .extif_height_o     ( extif_height_o      ),
    .extif_wren_i       ( extif_wren_i        ),
    .extif_rden_i       ( extif_rden_i        ),
    .extif_data_i       ( extif_data_i        ),
    .extif_data_o       ( extif_data_o        )
    );

  // fetch_cur_luma
  fetch_cur_luma u_cur_luma (
    .clk                ( clk                 ),
    .rstn               ( rstn                ),
    .sysif_start_i      ( sysif_start_i       ),
    .sysif_type_i       ( sysif_type_i        ),
    .pre_i_4x4_x_i      ( pre_i_4x4_x_i       ),
    .pre_i_4x4_y_i      ( pre_i_4x4_y_i       ),
    .pre_i_4x4_idx_i    ( pre_i_4x4_idx_i     ),
    .pre_i_sel_i        ( pre_i_sel_i         ),
    .pre_i_size_i       ( pre_i_size_i        ),
    .pre_i_rden_i       ( pre_i_rden_i        ),
    .pre_i_pel_o        ( pre_i_pel_o         ),
    .fime_cur_4x4_x_i   ( fime_cur_4x4_x_i    ),
    .fime_cur_4x4_y_i   ( fime_cur_4x4_y_i    ),
    .fime_cur_4x4_idx_i ( fime_cur_4x4_idx_i  ),
    .fime_cur_sel_i     ( fime_cur_sel_i      ),
    .fime_cur_size_i    ( fime_cur_size_i     ),
    .fime_cur_rden_i    ( fime_cur_rden_i     ),
    .fime_cur_pel_o     ( fime_cur_pel_o      ),
    .fme_cur_4x4_x_i    ( fme_cur_4x4_x_i     ),
    .fme_cur_4x4_y_i    ( fme_cur_4x4_y_i     ),
    .fme_cur_4x4_idx_i  ( fme_cur_4x4_idx_i   ),
    .fme_cur_sel_i      ( fme_cur_sel_i       ),
    .fme_cur_size_i     ( fme_cur_size_i      ),
    .fme_cur_rden_i     ( fme_cur_rden_i      ),
    .fme_cur_pel_o      ( fme_cur_pel_o       ),
    .mc_cur_4x4_x_i     ( mc_cur_4x4_x_i      ),
    .mc_cur_4x4_y_i     ( mc_cur_4x4_y_i      ),
    .mc_cur_4x4_idx_i   ( mc_cur_4x4_idx_i    ),
    .mc_cur_sel_i       ( mc_cur_sel_i        ),
    .mc_cur_size_i      ( mc_cur_size_i       ),
    .mc_cur_rden_i      ( mc_cur_rden_i       ),
    .mc_cur_pel_o       ( mc_cur_luma_pel_o   ),
    .db_cur_4x4_x_i     ( db_cur_4x4_x_i      ),
    .db_cur_4x4_y_i     ( db_cur_4x4_y_i      ),
    .db_cur_4x4_idx_i   ( db_cur_4x4_idx_i    ),
    .db_cur_sel_i       ( db_cur_sel_i        ),
    .db_cur_size_i      ( db_cur_size_i       ),
    .db_cur_rden_i      ( db_cur_rden_i       ),
    .db_cur_pel_o       ( db_cur_luma_pel_o   ),
    .ext_load_done_i    ( sysif_done_o        ),
    .ext_load_addr_i    ( cur_luma_addr       ),
    .ext_load_data_i    ( cur_luma_data       ),
    .ext_load_valid_i   ( cur_luma_valid      )
    );

  // fetch_ref_luma
  fetch_ref_luma u_ref_luma (
    .clk                ( clk                 ),
    .rstn               ( rstn                ),
    .sysif_start_i      ( sysif_start_i       ),
    .sysif_total_y_i    ( sysif_total_y_i     ),

    .fime_cur_y_i       ( sysif_fime_y        ),
    .fime_ref_x_i       ( fime_ref_x_i        ),
    .fime_ref_y_i       ( fime_ref_y_i        ),
    .fime_ref_rden_i    ( fime_ref_rden_i     ),
    .fime_ref_pel_o     ( fime_ref_pel_o      ),

    .fme_cur_y_i        ( sysif_fme_y         ),
    .fme_ref_x_i        ( fme_ref_x_i         ),
    .fme_ref_y_i        ( fme_ref_y_i         ),
    .fme_ref_rden_i     ( fme_ref_rden_i      ),
    .fme_ref_pel_o      ( fme_ref_pel_o       ),
    .ext_load_done_i    ( sysif_done_o        ),
    .ext_load_addr_i    ( ref_luma_addr       ),
    .ext_load_data_i    ( ref_luma_data       ),
    .ext_load_valid_i   ( ref_luma_valid      )
  );

  // fetch_cur_chroma
  fetch_cur_chroma u_cur_chroma (
    .clk                ( clk                 ),
    .rstn               ( rstn                ),
    .sysif_start_i      ( sysif_start_i       ),
    .mc_cur_4x4_x_i     ( mc_cur_4x4_x_i      ),
    .mc_cur_4x4_y_i     ( mc_cur_4x4_y_i      ),
    .mc_cur_4x4_idx_i   ( mc_cur_4x4_idx_i    ),
    .mc_cur_sel_i       ( mc_cur_sel_i        ),
    .mc_cur_size_i      ( mc_cur_size_i       ),
    .mc_cur_rden_i      ( mc_cur_rden_i       ),
    .mc_cur_pel_o       ( mc_cur_chroma_pel_o ),
    .db_cur_4x4_x_i     ( db_cur_4x4_x_i      ),
    .db_cur_4x4_y_i     ( db_cur_4x4_y_i      ),
    .db_cur_4x4_idx_i   ( db_cur_4x4_idx_i    ),
    .db_cur_sel_i       ( db_cur_sel_i        ),
    .db_cur_size_i      ( db_cur_size_i       ),
    .db_cur_rden_i      ( db_cur_rden_i       ),
    .db_cur_pel_o       ( db_cur_chroma_pel_o ),
    .ext_load_done_i    ( sysif_done_o        ),
    .ext_load_data_i    ( cur_chroma_data     ),
    .ext_load_addr_i    ( cur_chroma_addr     ),
    .ext_load_valid_i   ( cur_chroma_valid    )
    );

  assign  mc_cur_pel_o = mc_cur_sel_i ? mc_cur_chroma_pel_o : mc_cur_luma_pel_o;
  assign  db_cur_pel_o = db_cur_sel_i ? db_cur_chroma_pel_o : db_cur_luma_pel_o;

  // fetch_ref_chroma
  fetch_ref_chroma  u_ref_chroma(
    .clk                ( clk                 ),
    .rstn               ( rstn                ),
    .sysif_start_i      ( sysif_start_i       ),
    .sysif_total_y_i    ( sysif_total_y_i     ),

    .mc_cur_y_i         ( sysif_mc_y          ),
    .mc_ref_x_i         ( mc_ref_x_i          ),
    .mc_ref_y_i         ( mc_ref_y_i          ),
    .mc_ref_rden_i      ( mc_ref_rden_i       ),
    .mc_ref_sel_i       ( mc_ref_sel_i        ),
    .mc_ref_pel_o       ( mc_ref_pel_o        ),

    .ext_load_done_i    ( sysif_done_o        ),
    .ext_load_data_i    ( ref_chroma_data     ),
    .ext_load_addr_i    ( ref_chroma_addr     ),
    .ext_load_valid_i   ( ref_chroma_valid    )
    );

  // fetch_db
  fetch_db u_db (
    .clk                ( clk                ),
    .rstn               ( rstn               ),
    .sysif_start_i      ( sysif_start_i      ),
    .db_wen_i           ( db_wen_i           ),
    .db_w4x4_x_i        ( db_w4x4_x_i        ),
    .db_w4x4_y_i        ( db_w4x4_y_i        ),
    .db_wprevious_i     ( db_wprevious_i     ),
    .db_done_i          ( db_done_i          ),
    .db_wsel_i          ( db_wsel_i          ),
    .db_wdata_i         ( db_wdata_i         ),
    .db_ren_i           ( db_ren_i           ),
    .db_r4x4_i          ( db_r4x4_i          ),
    .db_ridx_i          ( db_ridx_i          ),
    .db_rdata_o         ( db_rdata_o         ),
    .ext_store_addr_i   ( db_store_addr      ),
    .ext_store_en_i     ( db_store_en        ),
    .ext_store_ready_o  ( db_store_ready     ),
    .ext_store_data_o   ( db_store_data      ),
    .ext_store_done_i   ( db_store_done      ),
    .ext_ref_en_i       ( db_ref_en          ),
    .ext_ref_addr_i     ( db_ref_addr        ),
    .ext_ref_data_i     ( db_ref_data        )
    );


endmodule

