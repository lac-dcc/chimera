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
//  Filename      : top.v
//  Author        : Yibo FAN
//  Created       : 2013-12-24
//  Description   : top of encoder
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-07-17 by HLL
//  Description   : lcu size changed into 64x64 (prediction to 64x64 block remains to be added)
//  Modified      : 2014-08-23 by HLL
//  Description   : optional mode for minimal tu size added
//  Modified      : 2014-09-11 by HLL
//  Description   : chroma supported
//  Modified      : 2014-09-18 by HLL
//  Description   : coe_mem bank write and read supported, cabac added
//  Modified      : 2014-09-22 by HLL
//  Description   : separated reconstruction and cover signals supported by intra
//                  (cover signals could come later than reconstruction signals instead of simultaneously, which gives time for partition decision)
//  Modified      : 2014-09-23 by HLL
//  Description   : rec_mem bank write and read supported, db added
//  Modified      : 2014-10-13 by HLL
//  Description   : cbf added
//  Modified      : 2014-10-14 by HLL
//  Description   : partition added
//  Modified      : 2014-09-15 by HLL
//  Description   : partition supported by h265_intra
//  Modified      : 2014-10-16 by HLL
//  Description   : mode added
//  Modified      : 2014-10-17 by HLL
//  Description   : mode_uv supported by h265_intra
//  Modified      : 2014-10-19 by HLL
//  Description   : mode_uv in h265_intra fetched from cur_mb
//  Modified      : 2014-10-21 by HLL
//  Description   : rdcost added
//  Modified      : 2014-11-30 by HLL
//  Description   : cabac renewed
//  Modified      : 2015-01-23 by HLL
//  Description   : updated for external fetch
//  Modified      : 2015-03-11 by HLL
//  Description   : bug removed (qp for tq didn't change according to "QPC" when doing prediction to chroma)
//  Modified      : 2015-03-12 by HLL
//  Description   : bug removed (the ping-pong buffers in mem_buf controlled by sys_start instead of pre_start)
//  Modified      : 2015-03-21 by HLL
//  Description   : fime added (tested with 8 (P) frames)
//  Modified      : 2015-03-26 by HLL
//  Description   : fme added (tested with 8 (P) frames)
//  Modified      : 2015-04-25 by HLL
//  Description   : mc added (tested with 8 (P) frames)
//  Modified      : 2015-04-29 by HLL
//  Description   : db connected to mc (tested with 8 (P) frames)
//  Modified      : 2015-06-30 by HLL
//  Description   : db renewed (sao supported, fetch interface added)
//  Modified      : 2015-08-18 by HLL
//  Description   : db wires connected to i/o
//  Modified      : 2015-08-31 by HLL
//  Description   : mvd added
//  Modified      : 2015-09-02 by HLL
//  Description   : mvd connected to cabac
//                  cabac renewed (sao function added)
//                  (tested with 8 P_frames and 10 I_frames)
//                  (small bugs(?) detected in cabac, not fixed yet)
//                  unnecessary fake statements removed
//  Modified      : 2015-09-05 by HLL
//  Description   : db_wdone_o replaced with db_done_o
//  Modified      : 2015-10-11 by HLL
//  Description   : define TEST_FETCH changed to NO_FETCH
//
//-------------------------------------------------------------------

`include "enc_defines.v"


module top (
  // global
  clk                ,
  rst_n              ,

  // INTRA_CUR_IF
  intra_cur_4x4_x_o  ,
  intra_cur_4x4_y_o  ,
  intra_cur_idx_o    ,
  intra_cur_sel_o    ,
  intra_cur_size_o   ,
  intra_cur_ren_o    ,
  intra_cur_data_i   ,
  // INTRA_MODE_IF
  intra_md_ren_o     ,
  intra_md_addr_o    ,
  intra_md_data_i    ,

  // FIME_MV_IF
  fime_mv_x_i        ,
  fime_mv_y_i        ,
  // FIME_CUR_IF
  fime_cur_4x4_x_o   ,
  fime_cur_4x4_y_o   ,
  fime_cur_idx_o     ,
  fime_cur_sel_o     ,
  fime_cur_size_o    ,
  fime_cur_ren_o     ,
  fime_cur_data_i    ,
  // FIME_REF_IF
  fime_ref_x_o       ,
  fime_ref_y_o       ,
  fime_ref_ren_o     ,
  fime_ref_data_i    ,

  // FME_CUR_IF
  fme_cur_4x4_x_o    ,
  fme_cur_4x4_y_o    ,
  fme_cur_idx_o      ,
  fme_cur_sel_o      ,
  fme_cur_size_o     ,
  fme_cur_ren_o      ,
  fme_cur_data_i     ,
  // FME_REF_IF
  fme_ref_x_o        ,
  fme_ref_y_o        ,
  fme_ref_ren_o      ,
  fme_ref_data_i     ,
  // MC_REF_IF
  mc_ref_x_o         ,
  mc_ref_y_o         ,
  mc_ref_ren_o       ,
  mc_ref_sel_o       ,
  mc_ref_data_i      ,

  // DB_FETCH_IF
  db_wen_o           ,
  db_w4x4_x_o        ,
  db_w4x4_y_o        ,
  db_wprevious_o     ,
  db_done_o          ,
  db_wsel_o          ,
  db_wdata_o         ,
  db_ren_o           ,
  db_r4x4_o          ,
  db_ridx_o          ,
  db_rdata_i         ,

  // ORIGINAL SIGNALS
  sys_x_total_i      ,
  sys_y_total_i      ,
  sys_mode_i         ,
  sys_type_i         ,
  sys_qp_i           ,
  sys_start_i        ,
  sys_done_o         ,
  pre_min_size_i     ,

  rinc_o             ,
  rvalid_i           ,
  rdata_i            ,

  winc_o             ,
  wdata_o            ,
  wfull_i
  );


//*** PARAMETER ****************************************************************

  localparam    INTRA = 0  ,
                INTER = 1  ;


//*** INPUT/OUTPUT DECLARATION *************************************************

  input                             clk                  ; //clock
  input                             rst_n                ; //reset signal

  // INTRA_CUR_IF
  output [3                 : 0]    intra_cur_4x4_x_o    ;
  output [3                 : 0]    intra_cur_4x4_y_o    ;
  output [4                 : 0]    intra_cur_idx_o      ;
  output                            intra_cur_sel_o      ;
  output [1                 : 0]    intra_cur_size_o     ;
  output                            intra_cur_ren_o      ;
  input  [`PIXEL_WIDTH*32-1 : 0]    intra_cur_data_i     ;
  // INTRA_MODE_IF
  output                            intra_md_ren_o       ;
  output [9                 : 0]    intra_md_addr_o      ;
  input  [5                 : 0]    intra_md_data_i      ;

  // FIME_MV_IF
  input  [9-1               : 0]    fime_mv_x_i          ;
  input  [9-1               : 0]    fime_mv_y_i          ;
  // FIME_CUR_IF
  output [4-1               : 0]    fime_cur_4x4_x_o     ;
  output [4-1               : 0]    fime_cur_4x4_y_o     ;
  output [5-1               : 0]    fime_cur_idx_o       ;
  output                            fime_cur_sel_o       ;
  output [2-1               : 0]    fime_cur_size_o      ;
  output                            fime_cur_ren_o       ;
  input  [64*`PIXEL_WIDTH-1 : 0]    fime_cur_data_i      ;
  // FIME_REF_IF
  output [5-1               : 0]    fime_ref_x_o         ;
  output [7-1               : 0]    fime_ref_y_o         ;
  output                            fime_ref_ren_o       ;
  input  [64*`PIXEL_WIDTH-1 : 0]    fime_ref_data_i      ;

  // FME_CUR_IF
  output [4-1               : 0]    fme_cur_4x4_x_o      ;
  output [4-1               : 0]    fme_cur_4x4_y_o      ;
  output [5-1               : 0]    fme_cur_idx_o        ;
  output                            fme_cur_sel_o        ;
  output [2-1               : 0]    fme_cur_size_o       ;
  output                            fme_cur_ren_o        ;
  input  [32*`PIXEL_WIDTH-1 : 0]    fme_cur_data_i       ;
  // FME_REF_IF
  output [7-1               : 0]    fme_ref_x_o          ;
  output [7-1               : 0]    fme_ref_y_o          ;
  output                            fme_ref_ren_o        ;
  input  [64*`PIXEL_WIDTH-1 : 0]    fme_ref_data_i       ;
  // MC_REF_IF
  output [6-1               : 0]    mc_ref_x_o           ;
  output [6-1               : 0]    mc_ref_y_o           ;
  output                            mc_ref_ren_o         ;
  output                            mc_ref_sel_o         ;
  input  [8*`PIXEL_WIDTH-1  : 0]    mc_ref_data_i        ;

  // DB_FETCH_IF
  output [1-1               : 0]    db_wen_o             ; // db write enable
  output [5-1               : 0]    db_w4x4_x_o          ; // db write 4x4 block index in x
  output [5-1               : 0]    db_w4x4_y_o          ; // db write 4x4 block index in y
  output [1-1               : 0]    db_wprevious_o       ; // db write previous lcu data
  output [1-1               : 0]    db_done_o            ; // db done
  output [2-1               : 0]    db_wsel_o            ; // db write 4x4 block sel : 0x:luma, 10: u, 11:v
  output [16*`PIXEL_WIDTH-1 : 0]    db_wdata_o           ; // db write 4x4 block data
  output [1-1               : 0]    db_ren_o             ; // db read enable
  output [5-1               : 0]    db_r4x4_o            ; // db_read 4x4 block index
  output [2-1               : 0]    db_ridx_o            ; // db read pixel index in the block
  input  [16*`PIXEL_WIDTH-1 : 0]    db_rdata_i           ; // db read 4x4 block data

  // sys if
  input  [`PIC_X_WIDTH-1    : 0]    sys_x_total_i        ; // Total LCU number-1 in X
  input  [`PIC_Y_WIDTH-1    : 0]    sys_y_total_i        ; // Total LCU number-1 in y
  input                             sys_mode_i           ; // Encoder Mode
  input  [5                 : 0]    sys_qp_i             ; // QP assigned to CMB
  input                             sys_start_i          ; // Start to encoder a Frame
  input                             sys_type_i           ; // Encoder Type
  output                            sys_done_o           ; // Frame encoding Done
  input                             pre_min_size_i       ; // minimal tu size
  // raw input if
  output                            rinc_o               ; // read data enable
  input                             rvalid_i             ; // read data valid
  input  [`PIXEL_WIDTH*8-1  : 0]    rdata_i              ; // read data
  // stream output if
  output                            winc_o               ; // write bs enable
  output [7                 : 0]    wdata_o              ; // write bs data
  input                             wfull_i              ; // outside buffer FULL!


//*** WIRE & REG DECLARATION ***************************************************

//------------------ u_top_ctrl -----------------//
  wire                                   intra_start , ec_start , fime_start , fme_start , mc_start ;
  wire                                   intra_done  , ec_done  , fime_done  , fme_done  , mc_done  ;
  wire [`PIC_X_WIDTH-1           : 0]    intra_x     , ec_x     , fime_x     , fme_x     , mc_x     ;
  wire [`PIC_Y_WIDTH-1           : 0]    intra_y     , ec_y     , fime_y     , fme_y     , mc_y     ;
  reg  [5                        : 0]    intra_qp    , ec_qp    , fime_qp    , fme_qp    , mc_qp    ;

  wire [5                        : 0]    tq_qp                 ;

  reg                                    sel_r                 ;
  reg  [1                        : 0]    sel_mod_3_r           ;

//------------------- u_cur_mb ------------------//
  wire [1                        : 0]    fme_cmb_bank          ; // 0x: luma, 10: cb; 11:cr
  wire                                   fme_cmb_ren           ; // cmb read enable
  wire [1                        : 0]    fme_cmb_size          ; // cmb read size (00:4x4 01:8x8 10:16x16 11:32x32)
  wire [3                        : 0]    fme_cmb_4x4_x         ; // cmb read block top_left 4x4 x
  wire [3                        : 0]    fme_cmb_4x4_y         ; // cmb read block top_left 4x4 y
  wire [4                        : 0]    fme_cmb_idx           ; // read index ({blk_index, line_number})
  wire [`PIXEL_WIDTH*32-1        : 0]    fme_cmb_data          ; // pixel data

  wire                                   tq_cmb_sel            ; // 0: luma, 1:chroma
  wire                                   tq_cmb_ren            ; // cmb read enable
  wire [1                        : 0]    tq_cmb_size           ; // cmb read size (00:4x4 01:8x8 10:16x16 11:32x32)
  wire [3                        : 0]    tq_cmb_4x4_x          ; // cmb read block top_left 4x4 x
  wire [3                        : 0]    tq_cmb_4x4_y          ; // cmb read block top_left 4x4 y
  wire [4                        : 0]    tq_cmb_idx            ; // read index ({blk_index, line_number})
  wire [`PIXEL_WIDTH*32-1        : 0]    tq_cmb_data           ; // pixel data

  wire                                   intra_md_ren          ;
  wire [9                        : 0]    intra_md_addr         ;
  wire [5                        : 0]    intra_md_data         ;

//-------------------- u_intra -------------------
  wire                                   intra_ipre_en         ; // tq data enable
  wire [1                        : 0]    intra_ipre_sel        ; // 0x: luma, 10: cb; 11:cr
  wire [1                        : 0]    intra_ipre_size       ; // tq tu size (00:4x4 01:8x8 10:16x16 11:32
  wire [3                        : 0]    intra_ipre_4x4_x      ; // tq 4x4 block index x in LCU
  wire [3                        : 0]    intra_ipre_4x4_y      ; // tq 4x4 block index y in LCU
  wire [`PIXEL_WIDTH*16-1        : 0]    intra_ipre_data       ; // tq predicted pixels
  wire [5                        : 0]    intra_ipre_mode       ; // tq prediction mode

//--------------------- u_fime --------------------
  wire                                   curif_en_w            ; // current LCU load enabale signal
  wire [5                        : 0]    curif_num_w           ; // current LCU row number to load (64 rows)
  wire [`PIXEL_WIDTH*64-1        : 0]    curif_data_w          ; // current LCU row data
  wire [41                       : 0]    fmeif_partition_w     ; // CU partition info (16+4+1) * 2
  wire [5                        : 0]    fmeif_cu_num_w        ; // 8x8 CU number
  wire [`FMV_WIDTH*2-1           : 0]    fmeif_mv_w            ; // 8x8 PU MVs
  wire                                   fmeif_en_w            ; // 8x8 PU dump enable signal

  wire [`FMV_WIDTH-1             : 0]    fmeif_mv_x_w          ;
  wire [`FMV_WIDTH-1             : 0]    fmeif_mv_y_w          ;

  reg  [41                       : 0]    fmeif_partition_r     ;

//--------------------- u_fme ---------------------//
  wire [41                       : 0]    fimeif_partition_w    ; // ime partition info
  wire [1-1                      : 0]    fimeif_mv_rden_w      ; // imv read enable
  wire [6-1                      : 0]    fimeif_mv_rdaddr_w    ; // imv sram read address
  wire [2*`FMV_WIDTH-1           : 0]    fimeif_mv_data_w      ; // imv from fime

  wire [2*`FMV_WIDTH-1           : 0]    fimeif_mv_data_w_0    ;
  wire [2*`FMV_WIDTH-1           : 0]    fimeif_mv_data_w_1    ;

  wire [1-1                      : 0]    mcif_mv_rden_w        ; // half fmv write back enable
  wire [6-1                      : 0]    mcif_mv_rdaddr_w      ; // half fmv write back  address
  reg  [2*`FMV_WIDTH-1           : 0]    mcif_mv_rddata_w      ; // half fmv

  wire                                   mcif_mv_wren_w        ; // fmv sram write enable
  wire [6-1                      : 0]    mcif_mv_wraddr_w      ; // fmv sram write address
  wire [2*`FMV_WIDTH-1           : 0]    mcif_mv_wrdata_w      ; // fmv data

  wire [32*`PIXEL_WIDTH-1        : 0]    mcif_pre_pixel_w      ;
  wire [4-1                      : 0]    mcif_pre_wren_w       ;
  wire [7-1                      : 0]    mcif_pre_addr_w       ;

  reg  [1-1                      : 0]    fme_mv_mem_0_rden_w   ;
  reg  [6-1                      : 0]    fme_mv_mem_0_rdaddr_w ;
  wire [2*`FMV_WIDTH-1           : 0]    fme_mv_mem_0_rddata_w ;

  reg                                    fme_mv_mem_0_wren_w   ;
  reg  [6-1                      : 0]    fme_mv_mem_0_wraddr_w ;
  reg  [2*`FMV_WIDTH-1           : 0]    fme_mv_mem_0_wrdata_w ;

  reg  [1-1                      : 0]    fme_mv_mem_1_rden_w   ;
  reg  [6-1                      : 0]    fme_mv_mem_1_rdaddr_w ;
  wire [2*`FMV_WIDTH-1           : 0]    fme_mv_mem_1_rddata_w ;

  reg                                    fme_mv_mem_1_wren_w   ;
  reg  [6-1                      : 0]    fme_mv_mem_1_wraddr_w ;
  reg  [2*`FMV_WIDTH-1           : 0]    fme_mv_mem_1_wrdata_w ;

  reg  [1-1                      : 0]    fme_mv_mem_2_rden_w   ;
  reg  [6-1                      : 0]    fme_mv_mem_2_rdaddr_w ;
  wire [2*`FMV_WIDTH-1           : 0]    fme_mv_mem_2_rddata_w ;

  reg                                    fme_mv_mem_2_wren_w   ;
  reg  [6-1                      : 0]    fme_mv_mem_2_wraddr_w ;
  reg  [2*`FMV_WIDTH-1           : 0]    fme_mv_mem_2_wrdata_w ;

//---------------------- u_mc ---------------------//
  wire                                   mc_mv_rden_w          ;
  wire [6-1                      : 0]    mc_mv_rdaddr_w        ;
  reg  [2*`FMV_WIDTH-1           : 0]    mc_mv_w               ;

  reg  [41                       : 0]    mc_partition_r        ;

  wire                                   mc_ppre_en            ;
  wire [1                        : 0]    mc_ppre_sel           ;
  wire [1                        : 0]    mc_ppre_size          ;
  wire [3                        : 0]    mc_ppre_4x4_x         ;
  wire [3                        : 0]    mc_ppre_4x4_y         ;
  wire [`PIXEL_WIDTH*16-1        : 0]    mc_ppre_data          ;
  wire [5                        : 0]    mc_ppre_mode          ;

  wire [4-1                      : 0]    fme_rec_mem_0_wen_i   ;
  wire [8-1                      : 0]    fme_rec_mem_0_addr_i  ;
  wire [32*`PIXEL_WIDTH-1        : 0]    fme_rec_mem_0_wdata_i ;

  wire [4-1                      : 0]    fme_rec_mem_1_wen_i   ;
  wire [8-1                      : 0]    fme_rec_mem_1_addr_i  ;
  wire [32*`PIXEL_WIDTH-1        : 0]    fme_rec_mem_1_wdata_i ;

  wire [4-1                      : 0]    mc_pre_wren_w         ;
  wire [7-1                      : 0]    mc_pre_wraddr_w       ;
  wire [32*`PIXEL_WIDTH-1        : 0]    mc_pre_wrdata_w       ;

  wire                                   mc_mvd_wen_w          ;
  wire [`CU_DEPTH*2-1            : 0]    mc_mvd_waddr_w        ;
  wire [`MVD_WIDTH*2             : 0]    mc_mvd_wdata_w        ;

  wire                                   mc_mvd_mem_0_wren_w   ;
  wire [`CU_DEPTH*2-1            : 0]    mc_mvd_mem_0_wraddr_w ;
  wire [`MVD_WIDTH*2             : 0]    mc_mvd_mem_0_wrdata_w ;

  wire                                   mc_mvd_mem_1_wren_w   ;
  wire [`CU_DEPTH*2-1            : 0]    mc_mvd_mem_1_wraddr_w ;
  wire [`MVD_WIDTH*2             : 0]    mc_mvd_mem_1_wrdata_w ;

  wire [1-1                      : 0]    mc_pred_ren_w         ;
  wire [2-1                      : 0]    mc_pred_size_w        ;
  wire [4-1                      : 0]    mc_pred_4x4_x_w       ;
  wire [4-1                      : 0]    mc_pred_4x4_y_w       ;
  wire [5-1                      : 0]    mc_pred_4x4_idx_w     ;
  wire [32*`PIXEL_WIDTH-1        : 0]    mc_pred_rdata_w       ;

  wire [32*`PIXEL_WIDTH-1        : 0]    mc_pred_rdata_0_w     ;
  wire [32*`PIXEL_WIDTH-1        : 0]    mc_pred_rdata_1_w     ;

//------------------- u_mem_buf -------------------//
  wire                                   rec_cov               ; // reconstructed pixel cover flag
  wire                                   rec_val               ;
  wire [4                        : 0]    rec_idx               ;
  wire [`PIXEL_WIDTH*32-1        : 0]    rec_data              ;

  wire [`LCU_SIZE*`LCU_SIZE/16-1 : 0]    tq_cbf_luma           ;
  wire [`LCU_SIZE*`LCU_SIZE/64-1 : 0]    tq_cbf_cb             ;
  wire [`LCU_SIZE*`LCU_SIZE/64-1 : 0]    tq_cbf_cr             ;

//-------------------- u_md --------------------//
  wire [1                        : 0]    pre_bank              ; // memory bank sel for coeff. & rec.
  wire [1                        : 0]    ec_bank               ; // memory bank sel for cabac
  wire [1                        : 0]    db_bank               ; // memory bank sel for deblocking filter
  wire                                   pre_cbank             ; // memory bank sel for chroma
  wire                                   ec_cbank              ; // memory bank sel for chroma
  wire                                   db_cbank              ; // memory bank sel for chroma

  wire                                   md_mb_type            ; // 1: I MB, 0: P/B MB
  wire [20                       : 0]    md_mb_partition       ; // CU partition mode
  wire [((2^`CU_DEPTH)^2)*6-1    : 0]    md_i_mode             ; // intra mode info
  wire [169                      : 0]    md_p_mode             ; // Inter PU partition mode for every CU size

//-------------------- u_tq --------------------//
  // Residual
  wire                                   tq_res_en             ; // tq data input enable
  wire [1                        : 0]    tq_res_sel            ; // 0x: luma, 10: cb; 11:cr
  wire [1                        : 0]    tq_res_size           ; // tq input tu size (00:4x4 01:8x8 10:16x16 11:32x32)
  wire [4                        : 0]    tq_res_idx            ; // tq input row pixel index
  wire [(`PIXEL_WIDTH+1)*32-1    : 0]    tq_res_data           ; // tq input residuals
  // Reconstructed
  wire                                   tq_rec_val            ; // tq data output valid
  wire [4                        : 0]    tq_rec_idx            ; // tq output row pixel index
  wire [(`PIXEL_WIDTH+1)*32-1    : 0]    tq_rec_data           ; // tq output reconstructed pixels
  // Coefficient
  wire                                   tq_cef_en             ; // tq coefficient enable
  wire                                   tq_cef_rw             ; // tq coefficient read/write, 1: write; 0: read
  wire [4                        : 0]    tq_cef_idx            ; // tq coefficient row pixel index
  wire [`COEFF_WIDTH*32-1        : 0]    tq_cef_wdata          ; // tq coefficient write values
  wire [`COEFF_WIDTH*32-1        : 0]    tq_cef_rdata          ; // tq coefficient read values
  // to be delete
  wire                                   tq_cef_ren            ;
  wire [4                        : 0]    tq_cef_ridx           ;
  wire                                   tq_cef_wen            ;
  wire [4                        : 0]    tq_cef_widx           ;

  wire                                   ipre_en               ;
  wire [1                        : 0]    ipre_sel              ;
  wire [1                        : 0]    ipre_size             ;
  wire [3                        : 0]    ipre_4x4_x            ;
  wire [3                        : 0]    ipre_4x4_y            ;
  wire [`PIXEL_WIDTH*16-1        : 0]    ipre_data             ;
  wire [5                        : 0]    ipre_mode             ;

//---------------------- u_ec ---------------------//
  reg  [41                       : 0]    ec_partition_r        ;

  wire                                   ec_mb_type            ; // 1: I MB, 0: P/B MB
  wire [20                       : 0]    ec_mb_partition       ; // CU partition mode
  wire [((2^`CU_DEPTH)^2)*6-1    : 0]    ec_i_mode             ; // intra mode info
  wire [169                      : 0]    ec_p_mode             ; // Inter PU partition mode for every CU size

  wire                                   ec_mvd_ren_w          ; // Inter MVD MEM IF
  wire [`CU_DEPTH*2-1            : 0]    ec_mvd_raddr_w        ;
  wire [`MVD_WIDTH*2             : 0]    ec_mvd_rdata_w        ;

  wire [`CU_DEPTH*2-1            : 0]    mc_mvd_mem_0_rdaddr_w ;
  wire [`MVD_WIDTH*2             : 0]    mc_mvd_mem_0_rddata_w ;

  wire [`CU_DEPTH*2-1            : 0]    mc_mvd_mem_1_rdaddr_w ;
  wire [`MVD_WIDTH*2             : 0]    mc_mvd_mem_1_rddata_w ;

  wire                                   ec_mem_ren            ;
  wire [1                        : 0]    ec_mem_sel            ;
  wire [8                        : 0]    ec_mem_raddr          ;
  wire [`COEFF_WIDTH*16-1        : 0]    ec_mem_rdata          ;

  wire [`LCU_SIZE*`LCU_SIZE/16-1 : 0]    ec_cbf_luma           ;
  wire [`LCU_SIZE*`LCU_SIZE/16-1 : 0]    ec_cbf_cb             ;
  wire [`LCU_SIZE*`LCU_SIZE/16-1 : 0]    ec_cbf_cr             ;

//---------------------- u_db ---------------------//
  reg  [41                       : 0]    db_inter_partition_r  ;
  wire [20                       : 0]    db_intra_partition_w  ;

  wire                                   db_mv_rden_w          ;
  wire [7-1                      : 0]    db_mv_rdaddr_ori_w    ;
  wire [6-1                      : 0]    db_mv_rdaddr_w        ;
  reg  [2*`FMV_WIDTH-1           : 0]    db_mv_w               ;

  wire                                   db_mem_ren            ;
  wire [8                        : 0]    db_mem_raddr          ;
  wire [`PIXEL_WIDTH*16-1        : 0]    db_mem_rdata          ;

  wire                                   db_mb_en              ;
  wire                                   db_mb_rw              ;
  wire [8                        : 0]    db_mb_addr            ;

  reg  [128-1                    : 0]    db_rdata              ;

  wire [128-1                    : 0]    db_mb_data_o          ;

  wire [20                       : 0]    partition_old         ;
  wire [20                       : 0]    partition_cur         ;

  wire                                   lm_md_renab           ;
  wire [5                        : 0]    lm_md_raddr           ;
  wire [23                       : 0]    lm_md_rdata           ;
  wire                                   cm_md_renab           ;
  wire [3                        : 0]    cm_md_raddr           ;
  wire [23                       : 0]    cm_md_rdata           ;


//*** MAIN BODY ****************************************************************

//-------------------------------------------------------------------
//
//    Global Signals
//
//-------------------------------------------------------------------

  // intra_qp
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      intra_qp <= 0 ;
    else if( sys_start_i ) begin
      intra_qp <= sys_qp_i ;
    end
  end

  // ec_qp
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      ec_qp <= 0 ;
    else if( sys_start_i ) begin
      if( sys_type_i==INTRA )
        ec_qp <= intra_qp ;
      else begin
        ec_qp <= mc_qp ;
      end
    end
  end

  // fime_qp
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      fime_qp <= 0 ;
    else if( sys_start_i ) begin
      fime_qp <= sys_qp_i ;
    end
  end

  // fme_qp
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      fme_qp <= 0 ;
    else if( sys_start_i ) begin
      fme_qp <= fime_qp ;
    end
  end

  // mc_qp
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      mc_qp <= 0 ;
    else if( sys_start_i ) begin
      mc_qp <= fme_qp ;
    end
  end

  // sel_r
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      sel_r <= 0 ;
    else if( sys_start_i ) begin
      sel_r <= !sel_r ;
    end
  end

  // sel_mod_3_r
  always @(posedge clk or negedge rst_n )begin
    if( !rst_n )
      sel_mod_3_r <= 0 ;
    else if( sys_start_i ) begin
      if( sel_mod_3_r==2 )
        sel_mod_3_r <= 0 ;
      else begin
        sel_mod_3_r <= sel_mod_3_r + 1 ;
      end
    end
  end


//--------------------------------------------------------------------
//
//    Top module controller
//
//--------------------------------------------------------------------

  top_ctrl u_top_ctrl(
    .clk              ( clk               ),
    .rst_n            ( rst_n             ),

    .sys_x_total_i    ( sys_x_total_i     ),
    .sys_y_total_i    ( sys_y_total_i     ),
    .sys_mode_i       ( sys_mode_i        ),
    .sys_type_i       ( sys_type_i        ),
    .enc_start_i      ( sys_start_i       ),
    .enc_done_o       ( sys_done_o        ),

    .intra_start_o    ( intra_start       ),
    .ec_start_o       ( ec_start          ),
    .fime_start_o     ( fime_start        ),
    .fme_start_o      ( fme_start         ),
    .mc_start_o       ( mc_start          ),

    .intra_done_i     ( intra_done        ),
    .ec_done_i        ( ec_done           ),
    .fime_done_i      ( fime_done         ),
    .fme_done_i       ( fme_done          ),
    .mc_done_i        ( mc_done           ),
    .db_done_i        ( db_done           ),

    .intra_x_o        ( intra_x           ),
    .intra_y_o        ( intra_y           ),
    .ec_x_o           ( ec_x              ),
    .ec_y_o           ( ec_y              ),
    .fime_x_o         ( fime_x            ),
    .fime_y_o         ( fime_y            ),
    .fme_x_o          ( fme_x             ),
    .fme_y_o          ( fme_y             ),
    .mc_x_o           ( mc_x              ),
    .mc_y_o           ( mc_y              )
    );


//-------------------------------------------------------------------
//
//    Intra Block
//
//-------------------------------------------------------------------

  intra_top u_intra_top(
    .clk                  ( clk                ),
    .rst_n                ( rst_n              ),
    // ctrl if
    .pre_min_size_i       ( pre_min_size_i     ),
    .uv_partition_i       ( partition_cur      ),
    .mb_x_total_i         ( sys_x_total_i      ),
    .mb_x_i               ( intra_x            ),
    .mb_y_i               ( intra_y            ),
    .start_i              ( intra_start        ),
    .done_o               ( intra_done         ),
    //  pre mode if
    .md_rden_o            ( intra_md_ren_o     ),
    .md_raddr_o           ( intra_md_addr_o    ),
    .md_rdata_i           ( intra_md_data_i    ),
    // tq pred if
    .pre_en_o             ( intra_ipre_en      ),
    .pre_sel_o            ( intra_ipre_sel     ),
    .pre_size_o           ( intra_ipre_size    ),
    .pre_4x4_x_o          ( intra_ipre_4x4_x   ),
    .pre_4x4_y_o          ( intra_ipre_4x4_y   ),
    .pre_data_o           ( intra_ipre_data    ),
    .pre_mode_o           ( intra_ipre_mode    ),
    // tq rec if
    .rec_val_i            ( rec_val & (sys_type_i==INTRA)    ),
    .rec_idx_i            ( rec_idx            ),
    .rec_data_i           ( rec_data           ),
    // pt if
    .cover_valid_i        ( cover_valid        ),
    .cover_value_i        ( cover_value        )
    );


//-------------------------------------------------------------------
//
//    FIME Block
//
//-------------------------------------------------------------------

  assign fime_cur_4x4_x_o = 0                 ;
  assign fime_cur_4x4_y_o = curif_num_w[5]<<3 ;
  assign fime_cur_idx_o   = curif_num_w[4:0]  ;
  assign fime_cur_sel_o   = 0                 ;
  assign fime_cur_size_o  = 2'b11             ;
  assign fime_cur_ren_o   = curif_en_w        ;

  assign curif_data_w     = fime_cur_data_i   ;

  ime_top u_ime_top(
   // global
   .clk               ( clk               ),
   .rstn              ( rst_n             ),
   // sys
   .sysif_cmb_x_i     ( fime_x            ),
   .sysif_cmb_y_i     ( fime_y            ),
   .sysif_qp_i        ( fime_qp           ),
   .sysif_start_i     ( fime_start        ),
   .sysif_done_o      ( fime_done         ),
   // cur_if
   .curif_en_o        ( curif_en_w        ),
   .curif_num_o       ( curif_num_w       ),
   .curif_data_i      ( curif_data_w      ),
   // fetch_if
   .fetchif_ref_x_o   ( fime_ref_x_o      ),
   .fetchif_ref_y_o   ( fime_ref_y_o      ),
   .fetchif_load_o    ( fime_ref_ren_o    ),
   .fetchif_data_i    ( fime_ref_data_i   ),
   // fme_if
   .fmeif_partition_o ( fmeif_partition_w ),
   .fmeif_cu_num_o    ( fmeif_cu_num_w    ),
   .fmeif_mv_o        ( fmeif_mv_w        ),
   .fmeif_en_o        ( fmeif_en_w        )
   );

  // mask the donnot-care bit
  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      fmeif_partition_r <= 42'b0 ;
    else if( sys_start_i ) begin
      fmeif_partition_r <= 42'b0 ;
      fmeif_partition_r[1:0] <= fmeif_partition_w[1:0];
      if( fmeif_partition_w[1:0]==2'b11 ) begin
        fmeif_partition_r[9:2] <= fmeif_partition_w[9:2];
        if( fmeif_partition_w[3:2]==2'b11 ) begin
          fmeif_partition_r[17:10] <= fmeif_partition_w[17:10];
        end
        if( fmeif_partition_w[5:4]==2'b11 ) begin
          fmeif_partition_r[25:18] <= fmeif_partition_w[25:18];
        end
        if( fmeif_partition_w[7:6]==2'b11 ) begin
          fmeif_partition_r[33:26] <= fmeif_partition_w[33:26];
        end
        if( fmeif_partition_w[9:8]==2'b11 ) begin
          fmeif_partition_r[41:34] <= fmeif_partition_w[41:34];
        end
      end
    end
  end

  // mv_mem
  assign fmeif_mv_y_w = {(fmeif_mv_w[1*`IMV_WIDTH-1:0*`IMV_WIDTH]-12),2'b0} ;
  assign fmeif_mv_x_w = {(fmeif_mv_w[2*`IMV_WIDTH-1:1*`IMV_WIDTH]-12),2'b0} ;

  rf_2p #(
    .Word_Width     ( 2*`FMV_WIDTH             ),
    .Addr_Width     ( 6                        )
  ) fime_mv_mem_0 (
    .clkb           ( clk                      ),
    .cenb_i         ( 1'b0                     ),
    .wenb_i         ( !(fmeif_en_w&( sel_r))   ),
    .addrb_i        ( fmeif_cu_num_w           ),
    .datab_i        ( { fmeif_mv_x_w
                       ,fmeif_mv_y_w
                      }                        ),
    .clka           ( clk                      ),
    .cena_i         ( 1'b0                     ),
    .addra_i        ( { fimeif_mv_rdaddr_w[5]
                       ,fimeif_mv_rdaddr_w[2]
                       ,fimeif_mv_rdaddr_w[4]
                       ,fimeif_mv_rdaddr_w[1]
                       ,fimeif_mv_rdaddr_w[3]
                       ,fimeif_mv_rdaddr_w[0]
                      }                        ),
    .dataa_o        ( fimeif_mv_data_w_0       )
    );

  rf_2p #(
    .Word_Width     ( 2*`FMV_WIDTH             ),
    .Addr_Width     ( 6                        )
  ) fime_mv_mem_1 (
    .clkb           ( clk                      ),
    .cenb_i         ( 1'b0                     ),
    .wenb_i         ( !(fmeif_en_w&(!sel_r))   ),
    .addrb_i        ( fmeif_cu_num_w           ),
    .datab_i        ( { fmeif_mv_x_w
                       ,fmeif_mv_y_w
                      }                        ),
    .clka           ( clk                      ),
    .cena_i         ( 1'b0                     ),
    .addra_i        ( { fimeif_mv_rdaddr_w[5]
                       ,fimeif_mv_rdaddr_w[2]
                       ,fimeif_mv_rdaddr_w[4]
                       ,fimeif_mv_rdaddr_w[1]
                       ,fimeif_mv_rdaddr_w[3]
                       ,fimeif_mv_rdaddr_w[0]
                      }                        ),
    .dataa_o        ( fimeif_mv_data_w_1       )
    );


//-------------------------------------------------------------------
//
//          FME Block
//
//-------------------------------------------------------------------

  assign fme_cur_sel_o  = 1'b0  ;
  assign fme_cur_size_o = 2'b01 ;

  // change the order
  assign fimeif_partition_w = { fmeif_partition_r[11:10] ,fmeif_partition_r[11+2:10+2] ,fmeif_partition_r[11+4:10+4] ,fmeif_partition_r[11+6:10+6]
                               ,fmeif_partition_r[19:18] ,fmeif_partition_r[19+2:18+2] ,fmeif_partition_r[19+4:18+4] ,fmeif_partition_r[19+6:18+6]
                               ,fmeif_partition_r[27:26] ,fmeif_partition_r[27+2:26+2] ,fmeif_partition_r[27+4:26+4] ,fmeif_partition_r[27+6:26+6]
                               ,fmeif_partition_r[35:34] ,fmeif_partition_r[35+2:34+2] ,fmeif_partition_r[35+4:34+4] ,fmeif_partition_r[35+6:34+6]
                               ,fmeif_partition_r[03:02] ,fmeif_partition_r[03+2:02+2] ,fmeif_partition_r[03+4:02+4] ,fmeif_partition_r[03+6:02+6]
                               ,fmeif_partition_r[01:00]
                              };

  assign fimeif_mv_data_w = sel_r ? fimeif_mv_data_w_1 : fimeif_mv_data_w_0 ;

  fme_top u_fme_top(
    .clk                  ( clk                    ),
    .rstn                 ( rst_n                  ),
    .sysif_cmb_x_i        ( fme_x                  ),
    .sysif_cmb_y_i        ( fme_y                  ),
    .sysif_qp_i           ( fme_qp                 ),
    .sysif_start_i        ( fme_start              ),
    .sysif_done_o         ( fme_done               ),

    .fimeif_partition_i   ( fimeif_partition_w     ),
    .fimeif_mv_rden_o     ( fimeif_mv_rden_w       ),
    .fimeif_mv_rdaddr_o   ( fimeif_mv_rdaddr_w     ),
    .fimeif_mv_data_i     ( fimeif_mv_data_w       ),

    .cur_rden_o           ( fme_cur_ren_o          ),
    .cur_4x4_idx_o        ( fme_cur_idx_o          ),
    .cur_4x4_x_o          ( fme_cur_4x4_x_o        ),
    .cur_4x4_y_o          ( fme_cur_4x4_y_o        ),
    .cur_pel_i            ( fme_cur_data_i         ),

    .ref_rden_o           ( fme_ref_ren_o          ),
    .ref_idx_x_o          ( fme_ref_x_o            ),
    .ref_idx_y_o          ( fme_ref_y_o            ),
    .ref_pel_i            ( fme_ref_data_i         ),

    .mcif_mv_rden_o       ( mcif_mv_rden_w         ),
    .mcif_mv_rdaddr_o     ( mcif_mv_rdaddr_w       ),
    .mcif_mv_data_i       ( mcif_mv_rddata_w       ),
    .mcif_mv_wren_o       ( mcif_mv_wren_w         ),
    .mcif_mv_wraddr_o     ( mcif_mv_wraddr_w       ),
    .mcif_mv_data_o       ( mcif_mv_wrdata_w       ),
    .mcif_pre_pixel_o     ( mcif_pre_pixel_w       ),
    .mcif_pre_wren_o      ( mcif_pre_wren_w        ),
    .mcif_pre_addr_o      ( mcif_pre_addr_w        )
    );

  // rec_mem
  assign fme_rec_mem_0_wen_i   = ( sel_r) ? mcif_pre_wren_w        : mc_pre_wren_w          ;
  assign fme_rec_mem_0_addr_i  = ( sel_r) ? {1'b0,mcif_pre_addr_w} : {1'b0,mc_pre_wraddr_w} ;
  assign fme_rec_mem_0_wdata_i = ( sel_r) ? mcif_pre_pixel_w       : mc_pre_wrdata_w        ;

  assign fme_rec_mem_1_wen_i   = (!sel_r) ? mcif_pre_wren_w        : mc_pre_wren_w          ;
  assign fme_rec_mem_1_addr_i  = (!sel_r) ? {1'b0,mcif_pre_addr_w} : {1'b0,mc_pre_wraddr_w} ;
  assign fme_rec_mem_1_wdata_i = (!sel_r) ? mcif_pre_pixel_w       : mc_pre_wrdata_w        ;

  mem_lipo_1p_bw fme_rec_mem_0 (
    .clk                  ( clk                    ),
    .rst_n                ( rst_n                  ),

    .a_wen_i              ( fme_rec_mem_0_wen_i    ),
    .a_addr_i             ( fme_rec_mem_0_addr_i   ),
    .a_wdata_i            ( fme_rec_mem_0_wdata_i  ),

    .b_ren_i              ( mc_pred_ren_w          ),
    .b_sel_i              ( 1'b0                   ),
    .b_size_i             ( mc_pred_size_w         ),
    .b_4x4_x_i            ( mc_pred_4x4_x_w        ),
    .b_4x4_y_i            ( mc_pred_4x4_y_w        ),
    .b_idx_i              ( mc_pred_4x4_idx_w      ),
    .b_rdata_o            ( mc_pred_rdata_0_w      )
    );

  mem_lipo_1p_bw fme_rec_mem_1 (
    .clk                  ( clk                    ),
    .rst_n                ( rst_n                  ),

    .a_wen_i              ( fme_rec_mem_1_wen_i    ),
    .a_addr_i             ( fme_rec_mem_1_addr_i   ),
    .a_wdata_i            ( fme_rec_mem_1_wdata_i  ),

    .b_ren_i              ( mc_pred_ren_w          ),
    .b_sel_i              ( 1'b0                   ),
    .b_size_i             ( mc_pred_size_w         ),
    .b_4x4_x_i            ( mc_pred_4x4_x_w        ),
    .b_4x4_y_i            ( mc_pred_4x4_y_w        ),
    .b_idx_i              ( mc_pred_4x4_idx_w      ),
    .b_rdata_o            ( mc_pred_rdata_1_w      )
    );

  // mv_mem
  always @(*) begin
                   fme_mv_mem_0_rdaddr_w = 0 ;
                   fme_mv_mem_0_wren_w   = 0 ;
                   fme_mv_mem_0_wraddr_w = 0 ;
                   fme_mv_mem_0_wrdata_w = 0 ;
    case( sel_mod_3_r )
      0 : begin    fme_mv_mem_0_rdaddr_w = mcif_mv_rdaddr_w ;
                   fme_mv_mem_0_wren_w   = mcif_mv_wren_w   ;
                   fme_mv_mem_0_wraddr_w = mcif_mv_wraddr_w ;
                   fme_mv_mem_0_wrdata_w = mcif_mv_wrdata_w ;
          end
      1 : begin    fme_mv_mem_0_rdaddr_w = mc_mv_rdaddr_w   ;
          end
      2 : begin    fme_mv_mem_0_rdaddr_w = db_mv_rdaddr_w   ;
          end
    endcase
  end

  always @(*) begin
                   fme_mv_mem_1_rdaddr_w = 0 ;
                   fme_mv_mem_1_wren_w   = 0 ;
                   fme_mv_mem_1_wraddr_w = 0 ;
                   fme_mv_mem_1_wrdata_w = 0 ;
    case( sel_mod_3_r )
      1 : begin    fme_mv_mem_1_rdaddr_w = mcif_mv_rdaddr_w ;
                   fme_mv_mem_1_wren_w   = mcif_mv_wren_w   ;
                   fme_mv_mem_1_wraddr_w = mcif_mv_wraddr_w ;
                   fme_mv_mem_1_wrdata_w = mcif_mv_wrdata_w ;
          end
      2 : begin    fme_mv_mem_1_rdaddr_w = mc_mv_rdaddr_w   ;
          end
      0 : begin    fme_mv_mem_1_rdaddr_w = db_mv_rdaddr_w   ;
          end
    endcase
  end

  always @(*) begin
                   fme_mv_mem_2_rdaddr_w = 0 ;
                   fme_mv_mem_2_wren_w   = 0 ;
                   fme_mv_mem_2_wraddr_w = 0 ;
                   fme_mv_mem_2_wrdata_w = 0 ;
    case( sel_mod_3_r )
      2 : begin    fme_mv_mem_2_rdaddr_w = mcif_mv_rdaddr_w ;
                   fme_mv_mem_2_wren_w   = mcif_mv_wren_w   ;
                   fme_mv_mem_2_wraddr_w = mcif_mv_wraddr_w ;
                   fme_mv_mem_2_wrdata_w = mcif_mv_wrdata_w ;
          end
      0 : begin    fme_mv_mem_2_rdaddr_w = mc_mv_rdaddr_w   ;
          end
      1 : begin    fme_mv_mem_2_rdaddr_w = db_mv_rdaddr_w   ;
          end
    endcase
  end

  always @(*) begin
          mcif_mv_rddata_w = 0 ;
    case( sel_mod_3_r )
      0 : mcif_mv_rddata_w = fme_mv_mem_0_rddata_w ;
      1 : mcif_mv_rddata_w = fme_mv_mem_1_rddata_w ;
      2 : mcif_mv_rddata_w = fme_mv_mem_2_rddata_w ;
    endcase
  end

  rf_2p #(
    .Word_Width           ( 2*`FMV_WIDTH           ),
    .Addr_Width           ( 6                      )
  ) fme_mv_mem_0 (
    .clka                 ( clk                    ),
    .cena_i               ( 1'b0                   ),
    .addra_i              ( fme_mv_mem_0_rdaddr_w  ),
    .dataa_o              ( fme_mv_mem_0_rddata_w  ),
    .clkb                 ( clk                    ),
    .cenb_i               ( 1'b0                   ),
    .wenb_i               ( !fme_mv_mem_0_wren_w   ),
    .addrb_i              ( fme_mv_mem_0_wraddr_w  ),
    .datab_i              ( fme_mv_mem_0_wrdata_w  )
    );

  rf_2p #(
    .Word_Width           ( 2*`FMV_WIDTH           ),
    .Addr_Width           ( 6                      )
  ) fme_mv_mem_1 (
    .clka                 ( clk                    ),
    .cena_i               ( 1'b0                   ),
    .addra_i              ( fme_mv_mem_1_rdaddr_w  ),
    .dataa_o              ( fme_mv_mem_1_rddata_w  ),
    .clkb                 ( clk                    ),
    .cenb_i               ( 1'b0                   ),
    .wenb_i               ( !fme_mv_mem_1_wren_w   ),
    .addrb_i              ( fme_mv_mem_1_wraddr_w  ),
    .datab_i              ( fme_mv_mem_1_wrdata_w  )
    );

  rf_2p #(
    .Word_Width           ( 2*`FMV_WIDTH           ),
    .Addr_Width           ( 6                      )
  ) fme_mv_mem_2 (
    .clka                 ( clk                    ),
    .cena_i               ( 1'b0                   ),
    .addra_i              ( fme_mv_mem_2_rdaddr_w  ),
    .dataa_o              ( fme_mv_mem_2_rddata_w  ),
    .clkb                 ( clk                    ),
    .cenb_i               ( 1'b0                   ),
    .wenb_i               ( !fme_mv_mem_2_wren_w   ),
    .addrb_i              ( fme_mv_mem_2_wraddr_w  ),
    .datab_i              ( fme_mv_mem_2_wrdata_w  )
    );


//-------------------------------------------------------------------
//
//          MC Block
//
//-------------------------------------------------------------------

  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      mc_partition_r <= 42'b0 ;
    else if( sys_start_i )  begin
      mc_partition_r <= fimeif_partition_w ;
    end
  end

  always @(*) begin
          mc_mv_w = 0 ;
    case( sel_mod_3_r )
      1 : mc_mv_w = fme_mv_mem_0_rddata_w ;
      2 : mc_mv_w = fme_mv_mem_1_rddata_w ;
      0 : mc_mv_w = fme_mv_mem_2_rddata_w ;
    endcase
  end

  assign mc_pred_rdata_w = sel_r ? mc_pred_rdata_1_w : mc_pred_rdata_0_w ;

  mc_top u_mc_top(
    .clk                  ( clk                    ),
    .rstn                 ( rst_n                  ),
    .mb_x_total_i         ( sys_x_total_i          ),
    .mb_y_total_i         ( sys_y_total_i          ),
    .sysif_cmb_x_i        ( mc_x                   ),
    .sysif_cmb_y_i        ( mc_y                   ),
    .sysif_qp_i           ( mc_qp                  ),
    .sysif_start_i        ( mc_start               ),
    .sysif_done_o         ( mc_done                ),

    .fetchif_rden_o       ( mc_ref_ren_o           ),
    .fetchif_idx_x_o      ( mc_ref_x_o             ),
    .fetchif_idx_y_o      ( mc_ref_y_o             ),
    .fetchif_sel_o        ( mc_ref_sel_o           ),
    .fetchif_pel_i        ( mc_ref_data_i          ),

    .fmeif_partition_i    ( mc_partition_r         ),

    .fmeif_mv_i           ( mc_mv_w                ),
    .fmeif_mv_rden_o      ( mc_mv_rden_w           ),
    .fmeif_mv_rdaddr_o    ( mc_mv_rdaddr_w         ),

    .pred_wrdata_o        ( mc_pre_wrdata_w        ),
    .pred_wren_o          ( mc_pre_wren_w          ),
    .pred_wraddr_o        ( mc_pre_wraddr_w        ),

    .pred_ren_o           ( mc_pred_ren_w          ),
    .pred_size_o          ( mc_pred_size_w         ),
    .pred_4x4_x_o         ( mc_pred_4x4_x_w        ),
    .pred_4x4_y_o         ( mc_pred_4x4_y_w        ),
    .pred_4x4_idx_o       ( mc_pred_4x4_idx_w      ),
    .pred_rdata_i         ( mc_pred_rdata_w        ),

    .mvd_wen_o            ( mc_mvd_wen_w           ),
    .mvd_waddr_o          ( mc_mvd_waddr_w         ),
    .mvd_wdata_o          ( mc_mvd_wdata_w         ),

    .pre_start_o          (                        ),
    .pre_en_o             ( mc_ppre_en             ),
    .pre_sel_o            ( mc_ppre_sel            ),
    .pre_size_o           ( mc_ppre_size           ),
    .pre_4x4_x_o          ( mc_ppre_4x4_x          ),
    .pre_4x4_y_o          ( mc_ppre_4x4_y          ),
    .pre_data_o           ( mc_ppre_data           ),
    .rec_val_i            ( rec_val & (sys_type_i==INTER)    ),
    .rec_idx_i            ( rec_idx                )
    );

  assign mc_mvd_mem_0_wren_w   = sel_r ? mc_mvd_wen_w   : 0 ;
  assign mc_mvd_mem_0_wraddr_w = sel_r ? mc_mvd_waddr_w : 0 ;
  assign mc_mvd_mem_0_wrdata_w = sel_r ? mc_mvd_wdata_w : 0 ;

  assign mc_mvd_mem_1_wren_w   = sel_r ? 0 : mc_mvd_wen_w   ;
  assign mc_mvd_mem_1_wraddr_w = sel_r ? 0 : mc_mvd_waddr_w ;
  assign mc_mvd_mem_1_wrdata_w = sel_r ? 0 : mc_mvd_wdata_w ;

  assign mc_mvd_mem_0_rdaddr_w = ec_mvd_raddr_w ;
  assign mc_mvd_mem_1_rdaddr_w = ec_mvd_raddr_w ;

  rf_2p #(
    .Word_Width           ( 2*(`MVD_WIDTH)+1       ),
    .Addr_Width           ( 6                      )
  ) mc_mvd_mem_0 (
    .clka                 ( clk                    ),
    .cena_i               ( 1'b0                   ),
    .addra_i              ( mc_mvd_mem_0_rdaddr_w  ),
    .dataa_o              ( mc_mvd_mem_0_rddata_w  ),
    .clkb                 ( clk                    ),
    .cenb_i               ( 1'b0                   ),
    .wenb_i               (!mc_mvd_mem_0_wren_w    ),
    .addrb_i              ( mc_mvd_mem_0_wraddr_w  ),
    .datab_i              ( mc_mvd_mem_0_wrdata_w  )
    );

  rf_2p #(
    .Word_Width           ( 2*(`MVD_WIDTH)+1       ),
    .Addr_Width           ( 6                      )
  ) mc_mvd_mem_1 (
    .clka                 ( clk                    ),
    .cena_i               ( 1'b0                   ),
    .addra_i              ( mc_mvd_mem_1_rdaddr_w  ),
    .dataa_o              ( mc_mvd_mem_1_rddata_w  ),
    .clkb                 ( clk                    ),
    .cenb_i               ( 1'b0                   ),
    .wenb_i               (!mc_mvd_mem_1_wren_w    ),
    .addrb_i              ( mc_mvd_mem_1_wraddr_w  ),
    .datab_i              ( mc_mvd_mem_1_wrdata_w  )
    );


//-------------------------------------------------------------------
//
//          MEM BUF Block
//
//-------------------------------------------------------------------

  assign pre_bank  = 'd0 ;
  assign ec_bank   = 'd0 ;
  assign db_bank   = 'd0 ;
  assign pre_cbank = 'd0 ;
  assign ec_cbank  = 'd0 ;
  assign db_cbank  = 'd0 ;

  assign ipre_en    = ( sys_type_i==INTRA ) ? intra_ipre_en    : mc_ppre_en    ;
  assign ipre_sel   = ( sys_type_i==INTRA ) ? intra_ipre_sel   : mc_ppre_sel   ;
  assign ipre_size  = ( sys_type_i==INTRA ) ? intra_ipre_size  : mc_ppre_size  ;
  assign ipre_4x4_x = ( sys_type_i==INTRA ) ? intra_ipre_4x4_x : mc_ppre_4x4_x ;
  assign ipre_4x4_y = ( sys_type_i==INTRA ) ? intra_ipre_4x4_y : mc_ppre_4x4_y ;
  assign ipre_data  = ( sys_type_i==INTRA ) ? intra_ipre_data  : mc_ppre_data  ;
  assign ipre_mode  = ( sys_type_i==INTRA ) ? intra_ipre_mode  : mc_ppre_mode  ;

  mem_buf u_mem_buf   (
    .clk              ( clk               ),
    .rst_n            ( rst_n             ),

    .pre_start_i      ( sys_start_i       ),
    .pre_type_i       ( sys_type_i        ),
    .pre_bank_i       ( pre_bank          ),
    .ec_bank_i        ( ec_bank           ),
    .db_bank_i        ( db_bank           ),
    .pre_cbank_i      ( pre_cbank         ),
    .ec_cbank_i       ( ec_cbank          ),
    .db_cbank_i       ( db_cbank          ),

    .cmb_sel_o        ( intra_cur_sel_o   ),
    .cmb_ren_o        ( intra_cur_ren_o   ),
    .cmb_size_o       ( intra_cur_size_o  ),
    .cmb_4x4_x_o      ( intra_cur_4x4_x_o ),
    .cmb_4x4_y_o      ( intra_cur_4x4_y_o ),
    .cmb_idx_o        ( intra_cur_idx_o   ),
    .cmb_data_i       ( intra_cur_data_i  ),

    .ipre_min_size_i  ( pre_min_size_i    ),
    .ipre_en_i        ( ipre_en           ),
    .ipre_sel_i       ( ipre_sel          ),
    .ipre_size_i      ( ipre_size         ),
    .ipre_4x4_x_i     ( ipre_4x4_x        ),
    .ipre_4x4_y_i     ( ipre_4x4_y        ),
    .ipre_data_i      ( ipre_data         ),
    .ipre_mode_i      ( ipre_mode         ),
    .ipre_qp_i        ( intra_qp          ),

    .tq_res_en_o      ( tq_res_en         ),
    .tq_res_sel_o     ( tq_res_sel        ),
    .tq_res_size_o    ( tq_res_size       ),
    .tq_res_idx_o     ( tq_res_idx        ),
    .tq_res_data_o    ( tq_res_data       ),

    .tq_rec_val_i     ( tq_rec_val        ),
    .tq_rec_idx_i     ( tq_rec_idx        ),
    .tq_rec_data_i    ( tq_rec_data       ),

    .tq_cef_en_i      ( tq_cef_en         ),
    .tq_cef_rw_i      ( tq_cef_rw         ),
    .tq_cef_idx_i     ( tq_cef_idx        ),
    .tq_cef_data_i    ( tq_cef_wdata      ),
    .tq_cef_data_o    ( tq_cef_rdata      ),

    .rec_val_o        ( rec_val           ),
    .rec_idx_o        ( rec_idx           ),
    .rec_data_o       ( rec_data          ),

    .cover_valid_o    ( cover_valid       ),
    .cover_value_o    ( cover_value       ),

    .db_mem_ren_i     ( 1'b1              ), // !!!
    .db_mem_raddr_i   ( db_mem_raddr      ),
    .db_mem_rdata_o   ( db_mem_rdata      ),

    .ec_mem_ren_i     ( 1'b1              ), // !!!
    .ec_mem_sel_i     ( ec_mem_sel        ),
    .ec_mem_raddr_i   ( ec_mem_raddr      ),
    .ec_mem_rdata_o   ( ec_mem_rdata      ),
    .ec_cbf_luma_o    ( ec_cbf_luma       ),
    .ec_cbf_cb_o      ( ec_cbf_cb         ),
    .ec_cbf_cr_o      ( ec_cbf_cr         ),

    .partition_old_o  ( partition_old     ),
    .partition_cur_o  ( partition_cur     ),

    .lm_md_renab_i    ( lm_md_renab       ),
    .lm_md_raddr_i    ( lm_md_raddr       ),
    .lm_md_rdata_o    ( lm_md_rdata       ),
    .cm_md_renab_i    ( cm_md_renab       ),
    .cm_md_raddr_i    ( cm_md_raddr       ),
    .cm_md_rdata_o    ( cm_md_rdata       )
    );


//-------------------------------------------------------------------
//
//          Mode Decision
//
//-------------------------------------------------------------------

  md u_md (
    .clk                 ( clk               ),
    .rst_n               ( rst_n             ),

    .ipre_bank_o         ( pre_bank          ),
    .ec_bank_o           ( ec_bank           ),
    .db_bank_o           ( db_bank           ),

    .cef_wen_i           ( tq_cef_wen        ),
    .cef_widx_i          ( tq_cef_widx       ),
    .cef_data_i          ( tq_cef_wdata      ),

    .ec_mb_type_o        ( ec_mb_type        ),
    .ec_mb_partition_o   ( ec_mb_partition   ),
    .ec_i_mode_o         ( ec_i_mode         ),
    .ec_p_mode_o         ( ec_p_mode         ),
    .db_non_zero_count_o ( db_non_zero_count )
    );


//-------------------------------------------------------------------
//
//          TQ Block
//
//-------------------------------------------------------------------

  assign tq_qp      = ( sys_type_i==INTRA ) ? intra_qp : mc_qp ;
  assign tq_cef_en  = tq_cef_ren | tq_cef_wen ;
  assign tq_cef_rw  = tq_cef_wen ? 1'b1: 1'b0 ;
  assign tq_cef_idx = tq_cef_wen ? tq_cef_widx : tq_cef_ridx ;

  reg  [5  : 0]    tq_qp_c ;
  wire [5  : 0]    tq_qp_w ;

  always @(*) begin
    tq_qp_c = tq_qp ;
    if( tq_qp>43 )
      tq_qp_c = tq_qp-6 ;
    else if( tq_qp<30 )
      tq_qp_c = tq_qp ;
    else begin
      case( tq_qp )
        30      : tq_qp_c = 6'd29 ;
        31      : tq_qp_c = 6'd30 ;
        32      : tq_qp_c = 6'd31 ;
        33      : tq_qp_c = 6'd32 ;
        34      : tq_qp_c = 6'd33 ;
        35      : tq_qp_c = 6'd33 ;
        36      : tq_qp_c = 6'd34 ;
        37      : tq_qp_c = 6'd34 ;
        38      : tq_qp_c = 6'd35 ;
        39      : tq_qp_c = 6'd35 ;
        40      : tq_qp_c = 6'd36 ;
        41      : tq_qp_c = 6'd36 ;
        42      : tq_qp_c = 6'd37 ;
        43      : tq_qp_c = 6'd37 ;
        default : tq_qp_c = 6'hxx ;
      endcase
    end
  end

  assign tq_qp_w = ( tq_res_sel==2'b00 ) ? tq_qp : tq_qp_c ;  // still missing inter one

  tq_top u_tq_top(
    .clk           ( clk             ),
    .rst           ( rst_n           ),
    .type_i        ( sys_type_i      ),
    .qp_i          ( tq_qp_w         ),

    .tq_en_i       ( tq_res_en       ),
    .tq_sel_i      ( tq_res_sel      ),
    .tq_size_i     ( tq_res_size     ),
    .tq_idx_i      ( tq_res_idx      ),
    .tq_res_i      ( tq_res_data     ),

    .rec_val_o     ( tq_rec_val      ),
    .rec_idx_o     ( tq_rec_idx      ),
    .rec_data_o    ( tq_rec_data     ),

    .cef_ren_o     ( tq_cef_ren      ),
    .cef_ridx_o    ( tq_cef_ridx     ),
    .cef_data_i    ( tq_cef_rdata    ),

    .cef_wen_o     ( tq_cef_wen      ),
    .cef_widx_o    ( tq_cef_widx     ),
    .cef_data_o    ( tq_cef_wdata    )
  );


//-------------------------------------------------------------------
//
//    entropy coding module
//
//-------------------------------------------------------------------

  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      ec_partition_r <= 42'b0 ;
    else if( sys_start_i )  begin
      ec_partition_r <= mc_partition_r ;
    end
  end

  assign ec_mvd_rdata_w = sel_r ? mc_mvd_mem_1_rddata_w : mc_mvd_mem_0_rddata_w ;

  cabac_top u_cabac_top(
    .clk                     ( clk               ),
    .rst_n                   ( rst_n             ),
    .mb_x_total_i            ( sys_x_total_i     ),
    .mb_y_total_i            ( sys_y_total_i     ),
    .mb_x_i                  ( ec_x              ),
    .mb_y_i                  ( ec_y              ),
    .mb_type_i               ( (sys_type_i==INTRA)    ),
    .sao_i                   ( 62'b0             ),
    .qp_i                    ( ec_qp             ),
    .param_qp_i              ( (sys_type_i==INTRA) ? (ec_qp)  : (ec_qp+5'd3)    ),
    .start_i                 ( ec_start          ),
    .done_o                  ( ec_done           ),
    .slice_done_o            ( ec_slice_done     ),

    .tq_ren_o                ( ec_mem_ren        ),
    .coeff_type_o            ( ec_mem_sel        ),
    .tq_raddr_o              ( ec_mem_raddr      ),
    .tq_rdata_i              ( ec_mem_rdata      ),
    .tq_cbf_luma_i           ( ec_cbf_luma       ),
    .tq_cbf_cb_i             ( ec_cbf_cb         ),
    .tq_cbf_cr_i             ( ec_cbf_cr         ),
    .mb_partition_i          ( {64'b0 ,partition_old }    ),

    .cu_luma_mode_ren_o      ( lm_md_renab       ),
    .cu_luma_mode_raddr_o    ( lm_md_raddr       ),
    .luma_mode_i             ( lm_md_rdata       ),
    .cu_chroma_mode_ren_o    ( cm_md_renab       ),
    .cu_chroma_mode_raddr_o  ( cm_md_raddr       ),
    .chroma_mode_i           ( 24'h924924        ),
    .merge_flag_i            ( 85'd0             ),
    .merge_idx_i             ( 256'd0            ),
    .cu_skip_flag_i          ( 85'd0             ),

    .mb_p_pu_mode_i          ( {{(170-42){1'b0}},ec_partition_r}    ),

    .mb_mvd_ren_o            ( ec_mvd_ren_w      ),
    .mb_mvd_raddr_o          ( ec_mvd_raddr_w    ),
    .mb_mvd_rdata_i          ( ec_mvd_rdata_w    ),

    .bs_val_o                ( winc_o            ),
    .bs_data_o               ( wdata_o           ),
    .bs_wait_i               ( 1'd1              )
    );


//-------------------------------------------------------------------
//
//    deblocking module
//
//-------------------------------------------------------------------

  reg  [2*`FMV_WIDTH-1 : 0]    mb_mv_rdata  ;
  reg  [128-1          : 0]    tq_ori_data  ;

  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      db_inter_partition_r <= 42'b0 ;
    else if( sys_start_i ) begin
      db_inter_partition_r <= mc_partition_r ;
    end
  end

  assign db_intra_partition_w = (sys_type_i==INTRA) ? partition_old
                                                    : { db_inter_partition_r[41]&db_inter_partition_r[40]
                                                       ,db_inter_partition_r[39]&db_inter_partition_r[38]
                                                       ,db_inter_partition_r[37]&db_inter_partition_r[36]
                                                       ,db_inter_partition_r[35]&db_inter_partition_r[34]
                                                       ,db_inter_partition_r[33]&db_inter_partition_r[32]
                                                       ,db_inter_partition_r[31]&db_inter_partition_r[30]
                                                       ,db_inter_partition_r[29]&db_inter_partition_r[28]
                                                       ,db_inter_partition_r[27]&db_inter_partition_r[26]
                                                       ,db_inter_partition_r[25]&db_inter_partition_r[24]
                                                       ,db_inter_partition_r[23]&db_inter_partition_r[22]
                                                       ,db_inter_partition_r[21]&db_inter_partition_r[20]
                                                       ,db_inter_partition_r[19]&db_inter_partition_r[18]
                                                       ,db_inter_partition_r[17]&db_inter_partition_r[16]
                                                       ,db_inter_partition_r[15]&db_inter_partition_r[14]
                                                       ,db_inter_partition_r[13]&db_inter_partition_r[12]
                                                       ,db_inter_partition_r[11]&db_inter_partition_r[10]
                                                       ,db_inter_partition_r[09]&db_inter_partition_r[08]
                                                       ,db_inter_partition_r[07]&db_inter_partition_r[06]
                                                       ,db_inter_partition_r[05]&db_inter_partition_r[04]
                                                       ,db_inter_partition_r[03]&db_inter_partition_r[02]
                                                       ,db_inter_partition_r[01]&db_inter_partition_r[00]
                                                      };

  always @(*) begin
          db_mv_w = 0 ;
    case( sel_mod_3_r )
      2 : db_mv_w = { fme_mv_mem_0_rddata_w[9:0] ,fme_mv_mem_0_rddata_w[19:10] };
      0 : db_mv_w = { fme_mv_mem_1_rddata_w[9:0] ,fme_mv_mem_1_rddata_w[19:10] };
      1 : db_mv_w = { fme_mv_mem_2_rddata_w[9:0] ,fme_mv_mem_2_rddata_w[19:10] };
    endcase
  end

  assign db_mv_rdaddr_w = { db_mv_rdaddr_ori_w[5]
                           ,db_mv_rdaddr_ori_w[3]
                           ,db_mv_rdaddr_ori_w[1]
                           ,db_mv_rdaddr_ori_w[4]
                           ,db_mv_rdaddr_ori_w[2]
                           ,db_mv_rdaddr_ori_w[0]
                          };

  db_top u_db_top(
    .clk                 ( clk                  ),
    .rst_n               ( rst_n                ),
    .mb_x_total_i        ( sys_x_total_i        ),
    .mb_y_total_i        ( sys_y_total_i        ),
    .mb_x_i              ( ec_x                 ),
    .mb_y_i              ( ec_y                 ),
    .qp_i                ( ec_qp                ),
    .start_i             ( ec_start             ),
    .done_o              ( db_done              ),

    .mb_type_i           ( sys_type_i==INTRA    ),
    .mb_partition_i      ( db_intra_partition_w ),
    .mb_p_pu_mode_i      ( db_inter_partition_r ),
    .mb_cbf_i            ( ec_cbf_luma          ),
    .mb_cbf_u_i          ( (sys_type_i==INTRA) ? ec_cbf_cb : ec_cbf_cr ),
    .mb_cbf_v_i          ( (sys_type_i==INTRA) ? ec_cbf_cr : ec_cbf_cb ),

    .mb_mv_ren_o         ( db_mv_rden_w         ),
    .mb_mv_raddr_o       ( db_mv_rdaddr_ori_w   ),
    .mb_mv_rdata_i       ( db_mv_w              ),

    .tq_ren_o            ( db_mem_ren           ),
    .tq_raddr_o          ( db_mem_raddr         ),
    .tq_rdata_i          ( db_mem_rdata         ),

    .tq_ori_data_i       ( tq_ori_data          ),    // fake (for sao)

    .db_wen_o            ( db_wen_o             ),
    .db_w4x4_x_o         ( db_w4x4_x_o          ),
    .db_w4x4_y_o         ( db_w4x4_y_o          ),
    .db_wprevious_o      ( db_wprevious_o       ),
    .db_wdone_o          ( db_wdone_o           ),
    .db_wsel_o           ( db_wsel_o            ),
    .db_wdata_o          ( db_wdata_o           ),
    .mb_db_ren_o         ( db_ren_o             ),
    .mb_db_r4x4_o        ( db_r4x4_o            ),
    .mb_db_ridx_o        ( db_ridx_o            ),

    .mb_db_en_o          ( db_mb_en             ),    // for db auto check
    .mb_db_rw_o          ( db_mb_rw             ),    // for db auto check
    .mb_db_addr_o        ( db_mb_addr           ),    // for db auto check
    .mb_db_data_o        ( db_mb_data_o         ),    // for db auto check

`ifdef NO_FETCH
    .mb_db_data_i        ( db_rdata             )     // fake
`else
    .mb_db_data_i        ( db_rdata_i           )
`endif
    );

  assign db_done_o = db_done ;


//*** FOR DEBUG ****************************************************************
/*
  reg  [`PIC_X_WIDTH-1 : 0]    db_x_total_r      ;
  reg  [`PIC_Y_WIDTH-1 : 0]    db_y_total_r      ;
  reg  [`PIC_X_WIDTH-1 : 0]    db_x_r            ;
  reg  [`PIC_Y_WIDTH-1 : 0]    db_y_r            ;
  reg  [6-1            : 0]    db_qp_r           ;
  reg  [21-1           : 0]    db_mb_partition_r ;
  reg  [42-1           : 0]    mb_p_pu_mode_r    ;
  reg  [256-1          : 0]    mb_cbf_r          ;
  reg  [16-1           : 0]    mb_cbf_top_r      ;
  reg  [256-1          : 0]    mb_cbf_u_r        ;
  reg  [256-1          : 0]    mb_cbf_v_r        ;

  reg  [128-1          : 0]    yuv_top[0:31]     ;
  reg  [128-1          : 0]    yuv_in[0:383]     ;
  reg  [128-1          : 0]    yuv_out[0:383]    ;
  reg  [128-1          : 0]    yuv_check[0:383]  ;

  reg  [4*32-1         : 0]    tq_rdata          ;

  integer                      f ,i, tp          ;
  integer                      fp_i_input        ;
  integer                      fp_i_check        ;
  integer                      fp_p_input        ;
  integer                      fp_p_check        ;

  reg  [8              : 0]    in                ;
  reg  [8              : 0]    index             ;
  reg  [19             : 0]    mv[0:71]          ;
  reg  [19             : 0]    mv_dat            ;
  reg  [128-1          : 0]    pixels            ;

  // configure db_top
  initial begin
    fp_i_input        = $fopen( "./tv/db_i_check_i.dat" ,"r" );
    fp_i_check        = $fopen( "./tv/db_i_check_o.dat" ,"r" );
    fp_p_input        = $fopen( "./tv/db_p_check_i.dat" ,"r" );
    fp_p_check        = $fopen( "./tv/db_p_check_o.dat" ,"r" );
    db_qp_r           = 6'h16  ;
    db_mb_partition_r = 21'd0  ;
    mb_p_pu_mode_r    = 42'd0  ;
    mb_cbf_r          = 256'd0 ;
    mb_cbf_top_r      = 16'd0  ;
    mb_cbf_u_r        = 256'd0 ;
    mb_cbf_v_r        = 256'd0 ;
    forever begin
      @(posedge ec_start)
      db_start_task ;

`ifdef DB_AUTO_CHECK
      check_task ;
`endif

    end
  end

  // read top reference
  always @(posedge clk) begin
    db_rdata <= db_ren_o ? 'dx : yuv_top[db_r4x4_o] ;
  end

  // read current rec
  always @(posedge clk) begin
    tq_rdata <= db_mem_ren ? 'dx : yuv_in[db_mem_raddr];
  end

  // read mv data
  always @(posedge clk) begin
    mb_mv_rdata <= db_mv_rden_w ? 'dx : mv[db_mv_rdaddr_ori_w];
  end

  // dump data
  always @(posedge clk) begin
    if(!db_mb_en&&db_mb_rw)begin
      yuv_out[db_mb_addr] <= db_mb_data_o ;
    end
  end

  // db_start_task
  task db_start_task ;
  begin
    if( sys_type_i == INTRA ) begin
      f = $fscanf( fp_i_input ,"%h" ,db_x_total_r      );
      f = $fscanf( fp_i_input ,"%h" ,db_y_total_r      );
      f = $fscanf( fp_i_input ,"%h" ,db_x_r            );
      f = $fscanf( fp_i_input ,"%h" ,db_y_r            );
      f = $fscanf( fp_i_input ,"%h" ,db_qp_r           );
      f = $fscanf( fp_i_input ,"%b" ,tp                );
      f = $fscanf( fp_i_input ,"%b" ,db_mb_partition_r );
      f = $fscanf( fp_i_input ,"%b" ,mb_p_pu_mode_r    );
      f = $fscanf( fp_i_input ,"%b" ,mb_cbf_r          );
      f = $fscanf( fp_i_input ,"%b" ,mb_cbf_top_r      );
      f = $fscanf( fp_i_input ,"%b" ,mb_cbf_u_r        );
      f = $fscanf( fp_i_input ,"%b" ,mb_cbf_v_r        );
    end
    else begin
      f = $fscanf( fp_p_input ,"%h" ,db_x_total_r      );
      f = $fscanf( fp_p_input ,"%h" ,db_y_total_r      );
      f = $fscanf( fp_p_input ,"%h" ,db_x_r            );
      f = $fscanf( fp_p_input ,"%h" ,db_y_r            );
      f = $fscanf( fp_p_input ,"%h" ,db_qp_r           );
      f = $fscanf( fp_p_input ,"%b" ,tp                );
      f = $fscanf( fp_p_input ,"%b" ,db_mb_partition_r );
      f = $fscanf( fp_p_input ,"%b" ,mb_p_pu_mode_r    );
      f = $fscanf( fp_p_input ,"%b" ,mb_cbf_r          );
      f = $fscanf( fp_p_input ,"%b" ,mb_cbf_top_r      );
      f = $fscanf( fp_p_input ,"%b" ,mb_cbf_u_r        );
      f = $fscanf( fp_p_input ,"%b" ,mb_cbf_v_r        );
    end

    // current lcu mv
    for ( i=0 ;i<64 ;i=i+1 ) begin
      in    = i ;
      index = getmvindex( in[5:0] );
      if( sys_type_i == INTRA )
        f = $fscanf( fp_i_input ,"%h" ,mv_dat );
      else begin
        f = $fscanf( fp_p_input ,"%h" ,mv_dat );
      end
      mv[index[5:0]] = mv_dat ;
    end

    // top lcu mv
    for ( i=0 ;i<8 ;i=i+1 ) begin
      if( sys_type_i == INTRA )
        f = $fscanf( fp_i_input ,"%h" ,mv_dat );
      else begin
        f = $fscanf( fp_p_input ,"%h" ,mv_dat );
      end
      mv[i+64] = mv_dat ;
    end

    // current lcu pixels
    for( i=0 ;i<384 ;i=i+1 ) begin
      in    = i ;
      index = getindex( in );
      if( sys_type_i == INTRA )
        f = $fscanf( fp_i_input ,"%h" ,pixels );
      else begin
        f = $fscanf( fp_p_input ,"%h" ,pixels );
      end
      yuv_in[index] = pixels ;
    end

    // top lcu pixels
    for( i=0 ;i<32 ;i=i+1 ) begin
      if( sys_type_i == INTRA )
        f = $fscanf( fp_i_input ,"%h" ,pixels );
      else begin
        f = $fscanf( fp_p_input ,"%h" ,pixels );
      end
      yuv_top[i] = pixels ;
    end

    // wait for done
    @(posedge db_done );
  end
  endtask

  // check task
  task check_task;
  begin
    for( i=0 ;i<384 ;i=i+1 ) begin
      in = i ;
      index = getindex( in );
      if( sys_type_i == INTRA )
        f = $fscanf( fp_i_check ,"%h" ,pixels );
      else begin
        f = $fscanf( fp_p_check ,"%h" ,pixels );
      end
      yuv_check[i] = pixels;
    end
    for( i=0 ;i<384 ;i=i+1 ) begin
      in = i ;
      index = getindex( in );
      pixels = yuv_out[index];
      if( (yuv_out[index]!==yuv_check[i]) && (i<256||(i>255 && i%8!=7)) ) begin
        $display( "DB Error : %5d" ,i );
        $display( "right: %h\nwrong: %h" ,yuv_check[index] ,yuv_out[i] );
        #1000 ; $finish ;
      end
    end
  end
  endtask

  // getindex
  function [8:0] getindex ;
    input [8:0] in ;
    begin
      if( in<256 ) begin
        case( in[6:0] )
          'd0     : getindex[6:0] = 'd0   ;
          'd1     : getindex[6:0] = 'd1   ;
          'd2     : getindex[6:0] = 'd4   ;
          'd3     : getindex[6:0] = 'd5   ;
          'd4     : getindex[6:0] = 'd16  ;
          'd5     : getindex[6:0] = 'd17  ;
          'd6     : getindex[6:0] = 'd20  ;
          'd7     : getindex[6:0] = 'd21  ;
          'd8     : getindex[6:0] = 'd64  ;
          'd9     : getindex[6:0] = 'd65  ;
          'd10    : getindex[6:0] = 'd68  ;
          'd11    : getindex[6:0] = 'd69  ;
          'd12    : getindex[6:0] = 'd80  ;
          'd13    : getindex[6:0] = 'd81  ;
          'd14    : getindex[6:0] = 'd84  ;
          'd15    : getindex[6:0] = 'd85  ;
          'd16    : getindex[6:0] = 'd2   ;
          'd17    : getindex[6:0] = 'd3   ;
          'd18    : getindex[6:0] = 'd6   ;
          'd19    : getindex[6:0] = 'd7   ;
          'd20    : getindex[6:0] = 'd18  ;
          'd21    : getindex[6:0] = 'd19  ;
          'd22    : getindex[6:0] = 'd22  ;
          'd23    : getindex[6:0] = 'd23  ;
          'd24    : getindex[6:0] = 'd66  ;
          'd25    : getindex[6:0] = 'd67  ;
          'd26    : getindex[6:0] = 'd70  ;
          'd27    : getindex[6:0] = 'd71  ;
          'd28    : getindex[6:0] = 'd82  ;
          'd29    : getindex[6:0] = 'd83  ;
          'd30    : getindex[6:0] = 'd86  ;
          'd31    : getindex[6:0] = 'd87  ;
          'd32    : getindex[6:0] = 'd8   ;
          'd33    : getindex[6:0] = 'd9   ;
          'd34    : getindex[6:0] = 'd12  ;
          'd35    : getindex[6:0] = 'd13  ;
          'd36    : getindex[6:0] = 'd24  ;
          'd37    : getindex[6:0] = 'd25  ;
          'd38    : getindex[6:0] = 'd28  ;
          'd39    : getindex[6:0] = 'd29  ;
          'd40    : getindex[6:0] = 'd72  ;
          'd41    : getindex[6:0] = 'd73  ;
          'd42    : getindex[6:0] = 'd76  ;
          'd43    : getindex[6:0] = 'd77  ;
          'd44    : getindex[6:0] = 'd88  ;
          'd45    : getindex[6:0] = 'd89  ;
          'd46    : getindex[6:0] = 'd92  ;
          'd47    : getindex[6:0] = 'd93  ;
          'd48    : getindex[6:0] = 'd10  ;
          'd49    : getindex[6:0] = 'd11  ;
          'd50    : getindex[6:0] = 'd14  ;
          'd51    : getindex[6:0] = 'd15  ;
          'd52    : getindex[6:0] = 'd26  ;
          'd53    : getindex[6:0] = 'd27  ;
          'd54    : getindex[6:0] = 'd30  ;
          'd55    : getindex[6:0] = 'd31  ;
          'd56    : getindex[6:0] = 'd74  ;
          'd57    : getindex[6:0] = 'd75  ;
          'd58    : getindex[6:0] = 'd78  ;
          'd59    : getindex[6:0] = 'd79  ;
          'd60    : getindex[6:0] = 'd90  ;
          'd61    : getindex[6:0] = 'd91  ;
          'd62    : getindex[6:0] = 'd94  ;
          'd63    : getindex[6:0] = 'd95  ;
          'd64    : getindex[6:0] = 'd32  ;
          'd65    : getindex[6:0] = 'd33  ;
          'd66    : getindex[6:0] = 'd36  ;
          'd67    : getindex[6:0] = 'd37  ;
          'd68    : getindex[6:0] = 'd48  ;
          'd69    : getindex[6:0] = 'd49  ;
          'd70    : getindex[6:0] = 'd52  ;
          'd71    : getindex[6:0] = 'd53  ;
          'd72    : getindex[6:0] = 'd96  ;
          'd73    : getindex[6:0] = 'd97  ;
          'd74    : getindex[6:0] = 'd100 ;
          'd75    : getindex[6:0] = 'd101 ;
          'd76    : getindex[6:0] = 'd112 ;
          'd77    : getindex[6:0] = 'd113 ;
          'd78    : getindex[6:0] = 'd116 ;
          'd79    : getindex[6:0] = 'd117 ;
          'd80    : getindex[6:0] = 'd34  ;
          'd81    : getindex[6:0] = 'd35  ;
          'd82    : getindex[6:0] = 'd38  ;
          'd83    : getindex[6:0] = 'd39  ;
          'd84    : getindex[6:0] = 'd50  ;
          'd85    : getindex[6:0] = 'd51  ;
          'd86    : getindex[6:0] = 'd54  ;
          'd87    : getindex[6:0] = 'd55  ;
          'd88    : getindex[6:0] = 'd98  ;
          'd89    : getindex[6:0] = 'd99  ;
          'd90    : getindex[6:0] = 'd102 ;
          'd91    : getindex[6:0] = 'd103 ;
          'd92    : getindex[6:0] = 'd114 ;
          'd93    : getindex[6:0] = 'd115 ;
          'd94    : getindex[6:0] = 'd118 ;
          'd95    : getindex[6:0] = 'd119 ;
          'd96    : getindex[6:0] = 'd40  ;
          'd97    : getindex[6:0] = 'd41  ;
          'd98    : getindex[6:0] = 'd44  ;
          'd99    : getindex[6:0] = 'd45  ;
          'd100   : getindex[6:0] = 'd56  ;
          'd101   : getindex[6:0] = 'd57  ;
          'd102   : getindex[6:0] = 'd60  ;
          'd103   : getindex[6:0] = 'd61  ;
          'd104   : getindex[6:0] = 'd104 ;
          'd105   : getindex[6:0] = 'd105 ;
          'd106   : getindex[6:0] = 'd108 ;
          'd107   : getindex[6:0] = 'd109 ;
          'd108   : getindex[6:0] = 'd120 ;
          'd109   : getindex[6:0] = 'd121 ;
          'd110   : getindex[6:0] = 'd124 ;
          'd111   : getindex[6:0] = 'd125 ;
          'd112   : getindex[6:0] = 'd42  ;
          'd113   : getindex[6:0] = 'd43  ;
          'd114   : getindex[6:0] = 'd46  ;
          'd115   : getindex[6:0] = 'd47  ;
          'd116   : getindex[6:0] = 'd58  ;
          'd117   : getindex[6:0] = 'd59  ;
          'd118   : getindex[6:0] = 'd62  ;
          'd119   : getindex[6:0] = 'd63  ;
          'd120   : getindex[6:0] = 'd106 ;
          'd121   : getindex[6:0] = 'd107 ;
          'd122   : getindex[6:0] = 'd110 ;
          'd123   : getindex[6:0] = 'd111 ;
          'd124   : getindex[6:0] = 'd122 ;
          'd125   : getindex[6:0] = 'd123 ;
          'd126   : getindex[6:0] = 'd126 ;
          'd127   : getindex[6:0] = 'd127 ;
          default : getindex[6:0] = 'd0   ;
        endcase
        getindex[8:7] = in[8:7] ;
      end
      else begin
        case( in[5:0] )
          'd0  : getindex[5:0] = 'd0  + 00 ;
          'd1  : getindex[5:0] = 'd1  + 00 ;
          'd2  : getindex[5:0] = 'd4  + 00 ;
          'd3  : getindex[5:0] = 'd5  + 00 ;
          'd4  : getindex[5:0] = 'd16 + 00 ;
          'd5  : getindex[5:0] = 'd17 + 00 ;
          'd6  : getindex[5:0] = 'd20 + 00 ;
          'd7  : getindex[5:0] = 'd21 + 00 ;
          'd8  : getindex[5:0] = 'd0  + 02 ;
          'd9  : getindex[5:0] = 'd1  + 02 ;
          'd10 : getindex[5:0] = 'd4  + 02 ;
          'd11 : getindex[5:0] = 'd5  + 02 ;
          'd12 : getindex[5:0] = 'd16 + 02 ;
          'd13 : getindex[5:0] = 'd17 + 02 ;
          'd14 : getindex[5:0] = 'd20 + 02 ;
          'd15 : getindex[5:0] = 'd21 + 02 ;
          'd16 : getindex[5:0] = 'd0  + 08 ;
          'd17 : getindex[5:0] = 'd1  + 08 ;
          'd18 : getindex[5:0] = 'd4  + 08 ;
          'd19 : getindex[5:0] = 'd5  + 08 ;
          'd20 : getindex[5:0] = 'd16 + 08 ;
          'd21 : getindex[5:0] = 'd17 + 08 ;
          'd22 : getindex[5:0] = 'd20 + 08 ;
          'd23 : getindex[5:0] = 'd21 + 08 ;
          'd24 : getindex[5:0] = 'd0  + 10 ;
          'd25 : getindex[5:0] = 'd1  + 10 ;
          'd26 : getindex[5:0] = 'd4  + 10 ;
          'd27 : getindex[5:0] = 'd5  + 10 ;
          'd28 : getindex[5:0] = 'd16 + 10 ;
          'd29 : getindex[5:0] = 'd17 + 10 ;
          'd30 : getindex[5:0] = 'd20 + 10 ;
          'd31 : getindex[5:0] = 'd21 + 10 ;
          'd32 : getindex[5:0] = 'd0  + 32 ;
          'd33 : getindex[5:0] = 'd1  + 32 ;
          'd34 : getindex[5:0] = 'd4  + 32 ;
          'd35 : getindex[5:0] = 'd5  + 32 ;
          'd36 : getindex[5:0] = 'd16 + 32 ;
          'd37 : getindex[5:0] = 'd17 + 32 ;
          'd38 : getindex[5:0] = 'd20 + 32 ;
          'd39 : getindex[5:0] = 'd21 + 32 ;
          'd40 : getindex[5:0] = 'd0  + 34 ;
          'd41 : getindex[5:0] = 'd1  + 34 ;
          'd42 : getindex[5:0] = 'd4  + 34 ;
          'd43 : getindex[5:0] = 'd5  + 34 ;
          'd44 : getindex[5:0] = 'd16 + 34 ;
          'd45 : getindex[5:0] = 'd17 + 34 ;
          'd46 : getindex[5:0] = 'd20 + 34 ;
          'd47 : getindex[5:0] = 'd21 + 34 ;
          'd48 : getindex[5:0] = 'd0  + 40 ;
          'd49 : getindex[5:0] = 'd1  + 40 ;
          'd50 : getindex[5:0] = 'd4  + 40 ;
          'd51 : getindex[5:0] = 'd5  + 40 ;
          'd52 : getindex[5:0] = 'd16 + 40 ;
          'd53 : getindex[5:0] = 'd17 + 40 ;
          'd54 : getindex[5:0] = 'd20 + 40 ;
          'd55 : getindex[5:0] = 'd21 + 40 ;
          'd56 : getindex[5:0] = 'd0  + 42 ;
          'd57 : getindex[5:0] = 'd1  + 42 ;
          'd58 : getindex[5:0] = 'd4  + 42 ;
          'd59 : getindex[5:0] = 'd5  + 42 ;
          'd60 : getindex[5:0] = 'd16 + 42 ;
          'd61 : getindex[5:0] = 'd17 + 42 ;
          'd62 : getindex[5:0] = 'd20 + 42 ;
          'd63 : getindex[5:0] = 'd21 + 42 ;
        endcase
        getindex[8:6] = in[8:6] ;
      end
    end
  endfunction

  // getmvindex
  function [5:0] getmvindex ;
    input [5:0] in ;
    begin
    case( in[4:0] )
      'd0     : getmvindex[4:0] = 'd0  ;
      'd1     : getmvindex[4:0] = 'd1  ;
      'd2     : getmvindex[4:0] = 'd4  ;
      'd3     : getmvindex[4:0] = 'd5  ;
      'd4     : getmvindex[4:0] = 'd16 ;
      'd5     : getmvindex[4:0] = 'd17 ;
      'd6     : getmvindex[4:0] = 'd20 ;
      'd7     : getmvindex[4:0] = 'd21 ;
      'd8     : getmvindex[4:0] = 'd2  ;
      'd9     : getmvindex[4:0] = 'd3  ;
      'd10    : getmvindex[4:0] = 'd6  ;
      'd11    : getmvindex[4:0] = 'd7  ;
      'd12    : getmvindex[4:0] = 'd18 ;
      'd13    : getmvindex[4:0] = 'd19 ;
      'd14    : getmvindex[4:0] = 'd22 ;
      'd15    : getmvindex[4:0] = 'd23 ;
      'd16    : getmvindex[4:0] = 'd8  ;
      'd17    : getmvindex[4:0] = 'd9  ;
      'd18    : getmvindex[4:0] = 'd12 ;
      'd19    : getmvindex[4:0] = 'd13 ;
      'd20    : getmvindex[4:0] = 'd24 ;
      'd21    : getmvindex[4:0] = 'd25 ;
      'd22    : getmvindex[4:0] = 'd28 ;
      'd23    : getmvindex[4:0] = 'd29 ;
      'd24    : getmvindex[4:0] = 'd10 ;
      'd25    : getmvindex[4:0] = 'd11 ;
      'd26    : getmvindex[4:0] = 'd14 ;
      'd27    : getmvindex[4:0] = 'd15 ;
      'd28    : getmvindex[4:0] = 'd26 ;
      'd29    : getmvindex[4:0] = 'd27 ;
      'd30    : getmvindex[4:0] = 'd30 ;
      'd31    : getmvindex[4:0] = 'd31 ;
      default : getmvindex[4:0] = 'd0  ;
    endcase
    case(in[5])
      1'b0    : getmvindex[5]   = 'd0  ;
      default : getmvindex[5]   = 'd1  ;
    endcase
    end
  endfunction
*/
endmodule
