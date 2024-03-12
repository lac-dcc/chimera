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
//  Filename      : tb_top.v
//  Author        : Huang Leilei
//  Created       : 2015-09-07
//  Description   : test bench for top_with_more
//
//-------------------------------------------------------------------
//
//  Modified      : 2015-09-16 by HLL
//  Description   : cur_chroma provided in the order of uvuvuv...
//  Modified      : 2015-09-17 by HLL
//  Description   : ref_chroma provided in the order of uvuvuv...
//  Modified      : 2015-09-19 by HLL
//  Description   : load_db_chroma & store_db_chroma provided in the order of uvuvuv...
//                  more modes connected out
//  Modified      : 2015-10-11 by HLL
//  Description   : define TEST_FETCH changed to NO_FETCH
//
//-------------------------------------------------------------------

`include "enc_defines.v"

`define FETCH_AUTO_CHECK
//        `define DUMP_FETCH
`define FIME_AUTO_CHECK
`define FME_AUTO_CHECK
`define MVD_AUTO_CHECK
//        `define DUMP_MC
//        `define DUMP_TQ
`define DB_AUTO_CHECK

//        `define DUMP_INTRA
`define BS_AUTO_CHECK
//        `define DUMP_BS

//`define DUMP_FSDB
        `define DUMP_TIME    0
        `define DUMP_FILE    "tb_top.fsdb"

`define TEST_P
`define TEST_I


module tb_top;

//*** PARAMETER ****************************************************************

  parameter INTRA = 0 ,
            INTER = 1 ;

  parameter FIME_CUR_FILE_0    = "./tv/fime_cur_mb_p32_0.dat" ,
            FIME_CUR_FILE_1    = "./tv/fime_cur_mb_p32_0.dat" ,
            FIME_REF_FILE      = "./tv/fime_check_i.dat"      ,
            FME_CUR_FILE       = "./tv/fme_cur_mb_p32.dat"    ,
            FME_REF_FILE       = "./tv/fme_check_i.dat"       ,  // just copy fime_check_i.dat
            MC_CUR_FILE        = "./tv/mc_cur_mb_p32.dat"     ,
            MC_REF_FILE        = "./tv/mc_check_i.dat"        ,
            BS_I_CHECK_FILE    = "./tv/bs_i_check_o.dat"      ,
            BS_P_CHECK_FILE    = "./tv/bs_p_check_o.dat"      ,
            FIME_CHECK_FILE    = "./tv/fime_check_o.dat"      ,
            FME_CHECK_FILE     = "./tv/fme_check_o.dat"       ,
            MVD_CHECK_FILE     = "./tv/mvd_check_o.dat"       ,
            FETCH_P_CUR_FILE   = "./tv/fetch_p_cur.yuv"       ,
            FETCH_P_REF_FILE   = "./tv/fetch_p_check_i.yuv"   ,
            FETCH_P_CHECK_FILE = "./tv/fetch_p_check_o.yuv"   ,
            FETCH_I_CUR_FILE   = "./tv/fetch_i_cur.yuv"       ,
            FETCH_I_CHECK_FILE = "./tv/fetch_i_check_o.yuv"   ;


//*** WIRE/REG DECLARATION *****************************************************

  // GLOBAL
  reg                                clk                  ;
  reg                                rst_n                ;

  reg                                sys_start            ;
  wire                               sys_done             ;
  reg     [`PIC_X_WIDTH-1    : 0]    sys_x_total          ;
  reg     [`PIC_Y_WIDTH-1    : 0]    sys_y_total          ;
  reg                                sys_mode             ;
  reg     [5                 : 0]    sys_qp               ;
  reg                                sys_type             ;
  reg                                pre_min_size         ;

  // EXT_IF
  wire    [1-1               : 0]    extif_start_o        ; // ext mem load start
  reg     [1-1               : 0]    extif_done_i         ; // ext mem load done
  wire    [5-1               : 0]    extif_mode_o         ; // "ext mode: {load/store} {luma
  wire    [6+`PIC_X_WIDTH-1  : 0]    extif_x_o            ; // x in ref frame
  wire    [6+`PIC_Y_WIDTH-1  : 0]    extif_y_o            ; // y in ref frame
  wire    [8-1               : 0]    extif_width_o        ; // ref window width
  wire    [8-1               : 0]    extif_height_o       ; // ref window height
  reg                                extif_wren_i         ;
  reg                                extif_rden_i         ;
  reg     [8-1               : 0]    extif_addr_i         ; // fetch ram write/read addr
  reg     [16*`PIXEL_WIDTH-1 : 0]    extif_data_i         ; // ext data reg
  wire    [16*`PIXEL_WIDTH-1 : 0]    extif_data_o         ; // ext data outp

  // BS_IF
  wire                               winc_o               ;
  wire    [7                 : 0]    wdata_o              ;

  // WATCH
  integer                            frame_num            ;

  // FIME CHECK
  integer                            fime_check_fp_i      ;
  integer                            fime_check_fp_o      ;
  integer                            fime_check_tp        ;
  reg     [`IMV_WIDTH-1      : 0]    fime_check_mv_x      ;
  reg     [`IMV_WIDTH-1      : 0]    fime_check_mv_y      ;
  reg     [42-1              : 0]    fime_check_partition ;

  // FME CHECK
  integer                            fme_check_fp_i       ;
  integer                            fme_check_fp_o       ;
  integer                            fme_check_tp         ;
  integer                            fme_check_cntrow     ;
  reg     [64*`PIXEL_WIDTH-1 : 0]    fme_check_pixel_hw   ;
  reg     [64*`PIXEL_WIDTH-1 : 0]    fme_check_pixel_sw   ;

  // MC CHECK
  integer                            mc_check_fp_i        ;
  integer                            mc_check_fp_o        ;

  // MVD_CHECK
  integer                            mvd_check_tp_o       ;
  integer                            mvd_check_fp_o       ;


//*** DUT DECLARATION **********************************************************

  h265core dut(
    // global
    .clk               ( clk               ),
    .rst_n             ( rst_n             ),
    // config
    .sys_start_i       ( sys_start         ),
    .sys_done_o        ( sys_done          ),
    .sys_x_total_i     ( sys_x_total       ),
    .sys_y_total_i     ( sys_y_total       ),
    .sys_mode_i        ( sys_mode          ),
    .sys_qp_i          ( sys_qp            ),
    .sys_type_i        ( sys_type          ),
    .pre_min_size_i    ( pre_min_size      ),
    // ext
    .extif_start_o     ( extif_start_o     ),
    .extif_done_i      ( extif_done_i      ),
    .extif_mode_o      ( extif_mode_o      ),
    .extif_x_o         ( extif_x_o         ),
    .extif_y_o         ( extif_y_o         ),
    .extif_width_o     ( extif_width_o     ),
    .extif_height_o    ( extif_height_o    ),
    .extif_wren_i      ( extif_wren_i      ),
    .extif_rden_i      ( extif_rden_i      ),
    .extif_addr_i      ( extif_addr_i      ),
    .extif_data_i      ( extif_data_i      ),
    .extif_data_o      ( extif_data_o      ),
    // bs
    .winc_o            ( winc_o            ),
    .wdata_o           ( wdata_o           )
    );


//*** MAIN BODY ****************************************************************

  // clk
  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end

  // fake ext memory : para, memory & h_w_A
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

  reg [`PIXEL_WIDTH-1:0] ext_ori_yuv   [448*256*3/2-1:0] ;
  reg [`PIXEL_WIDTH-1:0] ext_rec_0_yuv [448*256*3/2-1:0] ;
  reg [`PIXEL_WIDTH-1:0] ext_rec_1_yuv [448*256*3/2-1:0] ;
  reg [`PIXEL_WIDTH-1:0] ext_temp_yuv ;

  reg [`PIXEL_WIDTH-1:0] ext_debug_yuv_00 ,ext_debug_yuv_01 ,ext_debug_yuv_02 ,ext_debug_yuv_03 ;
  reg [`PIXEL_WIDTH-1:0] ext_debug_yuv_04 ,ext_debug_yuv_05 ,ext_debug_yuv_06 ,ext_debug_yuv_07 ;
  reg [`PIXEL_WIDTH-1:0] ext_debug_yuv_08 ,ext_debug_yuv_09 ,ext_debug_yuv_10 ,ext_debug_yuv_11 ;
  reg [`PIXEL_WIDTH-1:0] ext_debug_yuv_12 ,ext_debug_yuv_13 ,ext_debug_yuv_14 ,ext_debug_yuv_15 ;

  integer ext_check_h ;
  integer ext_check_w ;
  integer ext_check_A ;

  reg ext_uv_cnt;

  // fake ext memory : reponse logic
  initial begin
    extif_done_i = 0 ;
    extif_wren_i = 0 ;
    extif_data_i = 0 ;
    ext_uv_cnt   = 0 ;
    #300
    forever begin
      @(negedge extif_start_o );
      case( extif_mode_o )
        LOAD_CUR_LUMA   : // load luma component of current LCU: line in
                          begin             #100 ;
                                            @(negedge clk );
                                            for( ext_check_h=0 ;ext_check_h<extif_height_o ;ext_check_h=ext_check_h+1 ) begin
                                              for( ext_check_w=0 ;ext_check_w<extif_width_o ;ext_check_w=ext_check_w+16 ) begin
                                                extif_wren_i = 1 ;
                                                ext_check_A = (extif_y_o*64+ext_check_h)*448+extif_x_o*64+ext_check_w;
                                                extif_data_i = { ext_ori_yuv[ext_check_A+00] ,ext_ori_yuv[ext_check_A+01] ,ext_ori_yuv[ext_check_A+02] ,ext_ori_yuv[ext_check_A+03]
                                                                ,ext_ori_yuv[ext_check_A+04] ,ext_ori_yuv[ext_check_A+05] ,ext_ori_yuv[ext_check_A+06] ,ext_ori_yuv[ext_check_A+07]
                                                                ,ext_ori_yuv[ext_check_A+08] ,ext_ori_yuv[ext_check_A+09] ,ext_ori_yuv[ext_check_A+10] ,ext_ori_yuv[ext_check_A+11]
                                                                ,ext_ori_yuv[ext_check_A+12] ,ext_ori_yuv[ext_check_A+13] ,ext_ori_yuv[ext_check_A+14] ,ext_ori_yuv[ext_check_A+15]
                                                               };
                                                { ext_debug_yuv_00 ,ext_debug_yuv_01 ,ext_debug_yuv_02 ,ext_debug_yuv_03
                                                 ,ext_debug_yuv_04 ,ext_debug_yuv_05 ,ext_debug_yuv_06 ,ext_debug_yuv_07
                                                 ,ext_debug_yuv_08 ,ext_debug_yuv_09 ,ext_debug_yuv_10 ,ext_debug_yuv_11
                                                 ,ext_debug_yuv_12 ,ext_debug_yuv_13 ,ext_debug_yuv_14 ,ext_debug_yuv_15
                                                } = extif_data_i ;
                                                @(negedge clk );
                                              end
                                            end
                                            extif_wren_i = 0 ;
                                            #100 ;
                                            @(negedge clk)
                                            extif_done_i = 1 ;
                                            @(negedge clk)
                                            extif_done_i = 0 ;
                          end
        LOAD_REF_LUMA   : // load luma component of reference LCU: line in
                          begin             #100 ;
                                            @(negedge clk );
                                            for( ext_check_h=0 ;ext_check_h<extif_height_o ;ext_check_h=ext_check_h+1 ) begin
                                              for( ext_check_w=0 ;ext_check_w<extif_width_o ;ext_check_w=ext_check_w+16 ) begin
                                                extif_wren_i = 1 ;
                                                ext_check_A = (extif_y_o+ext_check_h)*448+extif_x_o+ext_check_w ;
                                                extif_data_i = { ext_rec_0_yuv[ext_check_A+00] ,ext_rec_0_yuv[ext_check_A+01] ,ext_rec_0_yuv[ext_check_A+02] ,ext_rec_0_yuv[ext_check_A+03]
                                                                ,ext_rec_0_yuv[ext_check_A+04] ,ext_rec_0_yuv[ext_check_A+05] ,ext_rec_0_yuv[ext_check_A+06] ,ext_rec_0_yuv[ext_check_A+07]
                                                                ,ext_rec_0_yuv[ext_check_A+08] ,ext_rec_0_yuv[ext_check_A+09] ,ext_rec_0_yuv[ext_check_A+10] ,ext_rec_0_yuv[ext_check_A+11]
                                                                ,ext_rec_0_yuv[ext_check_A+12] ,ext_rec_0_yuv[ext_check_A+13] ,ext_rec_0_yuv[ext_check_A+14] ,ext_rec_0_yuv[ext_check_A+15]
                                                               };
                                                { ext_debug_yuv_00 ,ext_debug_yuv_01 ,ext_debug_yuv_02 ,ext_debug_yuv_03
                                                 ,ext_debug_yuv_04 ,ext_debug_yuv_05 ,ext_debug_yuv_06 ,ext_debug_yuv_07
                                                 ,ext_debug_yuv_08 ,ext_debug_yuv_09 ,ext_debug_yuv_10 ,ext_debug_yuv_11
                                                 ,ext_debug_yuv_12 ,ext_debug_yuv_13 ,ext_debug_yuv_14 ,ext_debug_yuv_15
                                                } = extif_data_i ;
                                                @(negedge clk );
                                              end
                                            end
                                            extif_wren_i = 0 ;
                                            #100 ;
                                            @(negedge clk)
                                            extif_done_i = 1 ;
                                            @(negedge clk)
                                            extif_done_i = 0 ;
                          end
        LOAD_CUR_CHROMA : // load chroma component of current LCU: line in, all u then all v
                          begin             #100 ;
                                            @(negedge clk );
                                            for( ext_check_h=0 ;ext_check_h<extif_height_o/2 ;ext_check_h=ext_check_h+1 ) begin
                                              for( ext_check_w=0 ;ext_check_w<extif_width_o ;ext_check_w=ext_check_w+16 ) begin
                                                extif_wren_i = 1 ;
                                                ext_check_A = 448*256+(extif_y_o*64/2+ext_check_h)*448+extif_x_o*64+ext_check_w;
                                                extif_data_i = { ext_ori_yuv[ext_check_A+00] ,ext_ori_yuv[ext_check_A+01] ,ext_ori_yuv[ext_check_A+02] ,ext_ori_yuv[ext_check_A+03]
                                                                ,ext_ori_yuv[ext_check_A+04] ,ext_ori_yuv[ext_check_A+05] ,ext_ori_yuv[ext_check_A+06] ,ext_ori_yuv[ext_check_A+07]
                                                                ,ext_ori_yuv[ext_check_A+08] ,ext_ori_yuv[ext_check_A+09] ,ext_ori_yuv[ext_check_A+10] ,ext_ori_yuv[ext_check_A+11]
                                                                ,ext_ori_yuv[ext_check_A+12] ,ext_ori_yuv[ext_check_A+13] ,ext_ori_yuv[ext_check_A+14] ,ext_ori_yuv[ext_check_A+15]
                                                               };
                                                { ext_debug_yuv_00 ,ext_debug_yuv_01 ,ext_debug_yuv_02 ,ext_debug_yuv_03
                                                 ,ext_debug_yuv_04 ,ext_debug_yuv_05 ,ext_debug_yuv_06 ,ext_debug_yuv_07
                                                 ,ext_debug_yuv_08 ,ext_debug_yuv_09 ,ext_debug_yuv_10 ,ext_debug_yuv_11
                                                 ,ext_debug_yuv_12 ,ext_debug_yuv_13 ,ext_debug_yuv_14 ,ext_debug_yuv_15
                                                } = extif_data_i ;
                                                @(negedge clk );
                                              end
                                            end
                                            extif_wren_i = 0 ;
                                            #100 ;
                                            @(negedge clk)
                                            extif_done_i = 1 ;
                                            @(negedge clk)
                                            extif_done_i = 0 ;
                          end
        LOAD_REF_CHROMA : // load chroma component of reference LCU: line in, all u then all v
                          begin             #100 ;
                                            @(negedge clk );
                                            for( ext_check_h=0 ;ext_check_h<extif_height_o/2 ;ext_check_h=ext_check_h+1 ) begin
                                              for( ext_check_w=0 ;ext_check_w<extif_width_o ;ext_check_w=ext_check_w+16 ) begin
                                                extif_wren_i = 1 ;
                                                ext_check_A  = 448*256+(extif_y_o/2+ext_check_h)*448+extif_x_o+ext_check_w ;
                                                extif_data_i = { ext_rec_0_yuv[ext_check_A+00] ,ext_rec_0_yuv[ext_check_A+01] ,ext_rec_0_yuv[ext_check_A+02] ,ext_rec_0_yuv[ext_check_A+03]
                                                                ,ext_rec_0_yuv[ext_check_A+04] ,ext_rec_0_yuv[ext_check_A+05] ,ext_rec_0_yuv[ext_check_A+06] ,ext_rec_0_yuv[ext_check_A+07]
                                                                ,ext_rec_0_yuv[ext_check_A+08] ,ext_rec_0_yuv[ext_check_A+09] ,ext_rec_0_yuv[ext_check_A+10] ,ext_rec_0_yuv[ext_check_A+11]
                                                                ,ext_rec_0_yuv[ext_check_A+12] ,ext_rec_0_yuv[ext_check_A+13] ,ext_rec_0_yuv[ext_check_A+14] ,ext_rec_0_yuv[ext_check_A+15]
                                                               };
                                                { ext_debug_yuv_00 ,ext_debug_yuv_01 ,ext_debug_yuv_02 ,ext_debug_yuv_03
                                                 ,ext_debug_yuv_04 ,ext_debug_yuv_05 ,ext_debug_yuv_06 ,ext_debug_yuv_07
                                                 ,ext_debug_yuv_08 ,ext_debug_yuv_09 ,ext_debug_yuv_10 ,ext_debug_yuv_11
                                                 ,ext_debug_yuv_12 ,ext_debug_yuv_13 ,ext_debug_yuv_14 ,ext_debug_yuv_15
                                                } = extif_data_i ;
                                                @(negedge clk );
                                              end
                                            end
                                            extif_wren_i = 0 ;
                                            #100 ;
                                            @(negedge clk)
                                            extif_done_i = 1 ;
                                            @(negedge clk)
                                            extif_done_i = 0 ;
                          end
        LOAD_DB_LUMA    : // load deblocked results: line in
                          begin             #100 ;
                                            @(negedge clk );
                                            for( ext_check_h=0 ;ext_check_h<extif_height_o ;ext_check_h=ext_check_h+1 ) begin
                                              for( ext_check_w=0 ;ext_check_w<extif_width_o ;ext_check_w=ext_check_w+16 ) begin
                                                extif_wren_i = 1 ;
                                                ext_check_A = (extif_y_o+ext_check_h)*448+extif_x_o+ext_check_w ;
                                                extif_data_i = { ext_rec_1_yuv[ext_check_A+00] ,ext_rec_1_yuv[ext_check_A+01] ,ext_rec_1_yuv[ext_check_A+02] ,ext_rec_1_yuv[ext_check_A+03]
                                                                ,ext_rec_1_yuv[ext_check_A+04] ,ext_rec_1_yuv[ext_check_A+05] ,ext_rec_1_yuv[ext_check_A+06] ,ext_rec_1_yuv[ext_check_A+07]
                                                                ,ext_rec_1_yuv[ext_check_A+08] ,ext_rec_1_yuv[ext_check_A+09] ,ext_rec_1_yuv[ext_check_A+10] ,ext_rec_1_yuv[ext_check_A+11]
                                                                ,ext_rec_1_yuv[ext_check_A+12] ,ext_rec_1_yuv[ext_check_A+13] ,ext_rec_1_yuv[ext_check_A+14] ,ext_rec_1_yuv[ext_check_A+15]
                                                               };
                                                { ext_debug_yuv_00 ,ext_debug_yuv_01 ,ext_debug_yuv_02 ,ext_debug_yuv_03
                                                 ,ext_debug_yuv_04 ,ext_debug_yuv_05 ,ext_debug_yuv_06 ,ext_debug_yuv_07
                                                 ,ext_debug_yuv_08 ,ext_debug_yuv_09 ,ext_debug_yuv_10 ,ext_debug_yuv_11
                                                 ,ext_debug_yuv_12 ,ext_debug_yuv_13 ,ext_debug_yuv_14 ,ext_debug_yuv_15
                                                } = extif_data_i ;
                                                @(negedge clk );
                                              end
                                            end
                                            extif_wren_i = 0 ;
                                            #100 ;
                                            @(negedge clk)
                                            extif_done_i = 1 ;
                                            @(negedge clk)
                                            extif_done_i = 0 ;
                          end
        LOAD_DB_CHROMA :  // load deblocked results: line in
                          begin             #100 ;
                                            @(negedge clk );
                                            for( ext_check_h=0 ;ext_check_h<extif_height_o/2 ;ext_check_h=ext_check_h+1 ) begin
                                              for( ext_check_w=0 ;ext_check_w<extif_width_o ;ext_check_w=ext_check_w+16 ) begin
                                                extif_wren_i = 1 ;
                                                ext_check_A  = 448*256+(extif_y_o/2+ext_check_h)*448+extif_x_o+ext_check_w ;
                                                extif_data_i = { ext_rec_1_yuv[ext_check_A+00] ,ext_rec_1_yuv[ext_check_A+01] ,ext_rec_1_yuv[ext_check_A+02] ,ext_rec_1_yuv[ext_check_A+03]
                                                                ,ext_rec_1_yuv[ext_check_A+04] ,ext_rec_1_yuv[ext_check_A+05] ,ext_rec_1_yuv[ext_check_A+06] ,ext_rec_1_yuv[ext_check_A+07]
                                                                ,ext_rec_1_yuv[ext_check_A+08] ,ext_rec_1_yuv[ext_check_A+09] ,ext_rec_1_yuv[ext_check_A+10] ,ext_rec_1_yuv[ext_check_A+11]
                                                                ,ext_rec_1_yuv[ext_check_A+12] ,ext_rec_1_yuv[ext_check_A+13] ,ext_rec_1_yuv[ext_check_A+14] ,ext_rec_1_yuv[ext_check_A+15]
                                                               };
                                                { ext_debug_yuv_00 ,ext_debug_yuv_01 ,ext_debug_yuv_02 ,ext_debug_yuv_03
                                                 ,ext_debug_yuv_04 ,ext_debug_yuv_05 ,ext_debug_yuv_06 ,ext_debug_yuv_07
                                                 ,ext_debug_yuv_08 ,ext_debug_yuv_09 ,ext_debug_yuv_10 ,ext_debug_yuv_11
                                                 ,ext_debug_yuv_12 ,ext_debug_yuv_13 ,ext_debug_yuv_14 ,ext_debug_yuv_15
                                                } = extif_data_i ;
                                                @(negedge clk );
                                              end
                                            end
                                            extif_wren_i = 0 ;
                                            #100 ;
                                            @(negedge clk)
                                            extif_done_i = 1 ;
                                            @(negedge clk)
                                            extif_done_i = 0 ;
                          end
        STORE_DB_LUMA   : // dump deblocked results: line in
                          begin             #100 ;
                                            @(negedge clk );
                                            for( ext_check_h=0 ;ext_check_h<extif_height_o ;ext_check_h=ext_check_h+1 ) begin
                                              for( ext_check_w=0 ;ext_check_w<extif_width_o ;ext_check_w=ext_check_w+16 ) begin
                                                extif_rden_i = 1 ;
                                                ext_check_A = (extif_y_o+ext_check_h)*448+extif_x_o+ext_check_w ;
                                                { ext_rec_1_yuv[ext_check_A+00] ,ext_rec_1_yuv[ext_check_A+01] ,ext_rec_1_yuv[ext_check_A+02] ,ext_rec_1_yuv[ext_check_A+03]
                                                 ,ext_rec_1_yuv[ext_check_A+04] ,ext_rec_1_yuv[ext_check_A+05] ,ext_rec_1_yuv[ext_check_A+06] ,ext_rec_1_yuv[ext_check_A+07]
                                                 ,ext_rec_1_yuv[ext_check_A+08] ,ext_rec_1_yuv[ext_check_A+09] ,ext_rec_1_yuv[ext_check_A+10] ,ext_rec_1_yuv[ext_check_A+11]
                                                 ,ext_rec_1_yuv[ext_check_A+12] ,ext_rec_1_yuv[ext_check_A+13] ,ext_rec_1_yuv[ext_check_A+14] ,ext_rec_1_yuv[ext_check_A+15]
                                                 } = extif_data_o ;
                                                { ext_debug_yuv_00 ,ext_debug_yuv_01 ,ext_debug_yuv_02 ,ext_debug_yuv_03
                                                 ,ext_debug_yuv_04 ,ext_debug_yuv_05 ,ext_debug_yuv_06 ,ext_debug_yuv_07
                                                 ,ext_debug_yuv_08 ,ext_debug_yuv_09 ,ext_debug_yuv_10 ,ext_debug_yuv_11
                                                 ,ext_debug_yuv_12 ,ext_debug_yuv_13 ,ext_debug_yuv_14 ,ext_debug_yuv_15
                                                } = extif_data_o ;
                                                @(negedge clk );
                                              end
                                            end
                                            extif_rden_i = 0 ;
                                            #100 ;
                                            @(negedge clk)
                                            extif_done_i = 1 ;
                                            @(negedge clk)
                                            extif_done_i = 0 ;
                          end
        STORE_DB_CHROMA : // dump deblocked results: line in
                          begin             #100 ;
                                            @(negedge clk );
                                            for( ext_check_h=0 ;ext_check_h<extif_height_o/2 ;ext_check_h=ext_check_h+1 ) begin
                                              for( ext_check_w=0 ;ext_check_w<extif_width_o ;ext_check_w=ext_check_w+16 ) begin
                                                extif_rden_i = 1 ;
                                                ext_check_A  = 448*256+(extif_y_o/2+ext_check_h)*448+extif_x_o+ext_check_w ;
                                                { ext_rec_1_yuv[ext_check_A+00] ,ext_rec_1_yuv[ext_check_A+01] ,ext_rec_1_yuv[ext_check_A+02] ,ext_rec_1_yuv[ext_check_A+03]
                                                 ,ext_rec_1_yuv[ext_check_A+04] ,ext_rec_1_yuv[ext_check_A+05] ,ext_rec_1_yuv[ext_check_A+06] ,ext_rec_1_yuv[ext_check_A+07]
                                                 ,ext_rec_1_yuv[ext_check_A+08] ,ext_rec_1_yuv[ext_check_A+09] ,ext_rec_1_yuv[ext_check_A+10] ,ext_rec_1_yuv[ext_check_A+11]
                                                 ,ext_rec_1_yuv[ext_check_A+12] ,ext_rec_1_yuv[ext_check_A+13] ,ext_rec_1_yuv[ext_check_A+14] ,ext_rec_1_yuv[ext_check_A+15]
                                                 } = extif_data_o ;
                                                { ext_debug_yuv_00 ,ext_debug_yuv_01 ,ext_debug_yuv_02 ,ext_debug_yuv_03
                                                 ,ext_debug_yuv_04 ,ext_debug_yuv_05 ,ext_debug_yuv_06 ,ext_debug_yuv_07
                                                 ,ext_debug_yuv_08 ,ext_debug_yuv_09 ,ext_debug_yuv_10 ,ext_debug_yuv_11
                                                 ,ext_debug_yuv_12 ,ext_debug_yuv_13 ,ext_debug_yuv_14 ,ext_debug_yuv_15
                                                } = extif_data_o ;
                                                @(negedge clk );
                                              end
                                            end
                                            extif_rden_i = 0 ;
                                            #100 ;
                                            @(negedge clk)
                                            extif_done_i = 1 ;
                                            @(negedge clk)
                                            extif_done_i = 0 ;
                          end
        default         : // default response
                          begin             #100 ;
                                            @(negedge clk)
                                            extif_done_i = 1 ;
                                            @(negedge clk)
                                            extif_done_i = 0 ;
                          end
      endcase
    end
  end

  // ctrl : fp tp & i
  integer ext_ori_i_check_i_fp ;
  integer ext_ori_p_check_i_fp ;
  integer ext_ori_check_i_tp   ;
  integer ext_ori_check_i      ;

  integer ext_rec_i_check_i_fp ;
  integer ext_rec_p_check_i_fp ;
  integer ext_rec_check_i_tp   ;
  integer ext_rec_i_check_o_fp ;
  integer ext_rec_p_check_o_fp ;
  integer ext_rec_check_o_tp   ;
  integer ext_rec_check_i      ;

  // ctrl : launch logic
  initial begin
    rst_n           = 0 ;
    sys_start       = 0 ;
    sys_type        = 0 ;  // 0:I frame    1:P frame
    sys_qp          = 0 ;
    sys_mode        = 0 ;  // 0:frame mode 1:MB mode
    sys_x_total     = 6 ;
    sys_y_total     = 3 ;
    pre_min_size    = 1 ;  // 0:4x4        1:8x8

    extif_wren_i    = 0 ;
    extif_rden_i    = 0 ;
    extif_addr_i    = 0 ;
    extif_data_i    = 0 ;

    frame_num       = 0 ;

    #100 ;
    rst_n           = 1'b1;

    $display( "\n\n*** CHECK TOP ! ***\n" );

    ext_ori_p_check_i_fp = $fopen( FETCH_P_CUR_FILE   ,"r" );
    ext_rec_p_check_i_fp = $fopen( FETCH_P_REF_FILE   ,"r" );
    ext_rec_p_check_o_fp = $fopen( FETCH_P_CHECK_FILE ,"r" );

    ext_ori_i_check_i_fp = $fopen( FETCH_I_CUR_FILE   ,"r" );
    ext_rec_i_check_o_fp = $fopen( FETCH_I_CHECK_FILE ,"r" );

    #500 ;
    $monitor( "\tat %08d, Frame Number = %02d, mb_x_first = %02d, mb_y_first = %02d",
              $time, frame_num, dut.u_top.u_top_ctrl.first_x_o, dut.u_top.u_top_ctrl.first_y_o );

`ifdef TEST_P

    // test P
    $display("\n*** TEST P FRAMES ! ***\n");
    sys_type = INTER ;
    sys_qp   = 22    ;

    for( frame_num=0 ;frame_num<8 ;frame_num=frame_num+1 ) begin
      // init ori
      for( ext_ori_check_i=0 ;ext_ori_check_i<448*256*3/2 ;ext_ori_check_i=ext_ori_check_i+1 ) begin
        ext_ori_check_i_tp = $fread( ext_temp_yuv ,ext_ori_p_check_i_fp );
        ext_ori_yuv[ext_ori_check_i] = ext_temp_yuv ;
      end

      // init rec
      for( ext_rec_check_i=0 ;ext_rec_check_i<448*256*3/2 ;ext_rec_check_i=ext_rec_check_i+1 ) begin
        ext_rec_check_i_tp = $fread( ext_temp_yuv ,ext_rec_p_check_i_fp );
        ext_rec_0_yuv[ext_rec_check_i] = ext_temp_yuv ;
      end

      @(negedge clk );
      sys_start = 1 ;
      @(negedge clk );
      sys_start = 0 ;
      @(posedge sys_done );

      #500 ;

      `ifdef FETCH_AUTO_CHECK
        // check rec
        for( ext_rec_check_i=0 ;ext_rec_check_i<448*256*3/2 ;ext_rec_check_i=ext_rec_check_i+1 ) begin
          ext_rec_check_o_tp = $fread( ext_temp_yuv ,ext_rec_p_check_o_fp );
          if( ext_rec_1_yuv[ext_rec_check_i] !== ext_temp_yuv ) begin
            $display( "Error!\nrec at address %d has wrong data %x which should be %x."
                     ,ext_rec_check_i ,ext_rec_1_yuv[ext_rec_check_i] ,ext_temp_yuv );
            // $finish ;
          end
        end
      `endif

    end

`endif

`ifdef TEST_I

    // test I
    $display("\n*** TEST I FRAMES ! ***\n");
    sys_type = INTRA ;
    sys_qp   = 22    ;

    for( frame_num=0 ;frame_num<10 ;frame_num=frame_num+1 ) begin
      // init ori
      for( ext_ori_check_i=0 ;ext_ori_check_i<448*256*3/2 ;ext_ori_check_i=ext_ori_check_i+1 ) begin
        ext_ori_check_i_tp = $fread( ext_temp_yuv ,ext_ori_i_check_i_fp );
        ext_ori_yuv[ext_ori_check_i] = ext_temp_yuv ;
      end

      @(negedge clk );
      sys_start = 1 ;
      @(negedge clk );
      sys_start = 0 ;
      @(posedge sys_done );

      #500 ;

      `ifdef FETCH_AUTO_CHECK
        // check rec
        for( ext_rec_check_i=0 ;ext_rec_check_i<448*256*3/2 ;ext_rec_check_i=ext_rec_check_i+1 ) begin
          ext_rec_check_o_tp = $fread( ext_temp_yuv ,ext_rec_i_check_o_fp );
          if( ext_rec_1_yuv[ext_rec_check_i] !== ext_temp_yuv ) begin
            $display( "Error!\nrec at address %d has wrong data %x which should be %x."
                     ,ext_rec_check_i ,ext_rec_1_yuv[ext_rec_check_i] ,ext_temp_yuv );
            // $finish ;
          end
        end
      `endif

    end

`endif

    #1000 ;
    $display( "\n\n*** CHECK FNISHED ! ***\n" );
    #1000 ;
    $finish ;
  end

  // sram init for cabac
  initial begin
    $readmemh( "../../rtl/mem/sram_0_mn.dat" ,dut.u_top.u_cabac_top.cabac_slice_init_u0.cabac_mn_1p_16x64_u0.rom_1p_16x64.mem_array );
    $readmemh( "../../rtl/mem/sram_1_mn.dat" ,dut.u_top.u_cabac_top.cabac_slice_init_u0.cabac_mn_1p_16x64_u1.rom_1p_16x64.mem_array );
    $readmemh( "../../rtl/mem/sram_2_mn.dat" ,dut.u_top.u_cabac_top.cabac_slice_init_u0.cabac_mn_1p_16x64_u2.rom_1p_16x64.mem_array );
    $readmemh( "../../rtl/mem/sram_3_mn.dat" ,dut.u_top.u_cabac_top.cabac_slice_init_u0.cabac_mn_1p_16x64_u3.rom_1p_16x64.mem_array );
    $readmemh( "../../rtl/mem/sram_4_mn.dat" ,dut.u_top.u_cabac_top.cabac_slice_init_u0.cabac_mn_1p_16x64_u4.rom_1p_16x64.mem_array );
  end


//*** DUMP FSDB ****************************************************************

  `ifdef DUMP_FSDB

    initial begin
      #`DUMP_TIME ;
      $fsdbDumpfile( `DUMP_FILE );
      $fsdbDumpvars( tb_top );
      #100 ;
      $display( "\t\t dump to this test is on !\n" );
    end

  `endif


//*** AUTO CHECK or DUMP *******************************************************

  `ifdef DUMP_FETCH
    // fime_cur
    integer fime_cur_debug_fp_o;
    reg fime_cur_ren_r;

    initial begin
      fime_cur_debug_fp_o = $fopen( "./dump/fime_cur_debug.log" ,"w" );
    end

    always @(posedge clk ) begin
      fime_cur_ren_r <= fime_cur_ren;
      if( fime_cur_ren_r ) begin
        $fwrite(fime_cur_debug_fp_o ,"%128x\n", fime_cur_data );
      end
    end

    // fime_ref
    integer fime_ref_debug_fp_o;
    reg fime_ref_ren_r;

    initial begin
      fime_ref_debug_fp_o = $fopen( "./dump/fime_ref_debug.log" ,"w" );
    end

    always @(posedge clk ) begin
      fime_ref_ren_r <= fime_ref_ren;
      if( fime_ref_ren_r ) begin
        $fwrite(fime_ref_debug_fp_o ,"%128x\n", fime_ref_data );
      end
    end

    // fme_cur
    integer fme_cur_debug_fp_o;
    reg fme_cur_ren_r;

    initial begin
      fme_cur_debug_fp_o = $fopen( "./dump/fme_cur_debug.log" ,"w" );
    end

    always @(posedge clk ) begin
      fme_cur_ren_r <= fme_cur_ren;
      if( fme_cur_ren_r ) begin
        $fwrite(fme_cur_debug_fp_o ,"%128x\n", fme_cur_data );
      end
    end

    // fme_ref
    integer fme_ref_debug_fp_o;
    reg fme_ref_ren_r;

    initial begin
      fme_ref_debug_fp_o = $fopen( "./dump/fme_ref_debug.log" ,"w" );
    end

    always @(posedge clk ) begin
      fme_ref_ren_r <= fme_ref_ren;
      if( fme_ref_ren_r ) begin
        $fwrite(fme_ref_debug_fp_o ,"%128x\n", fme_ref_data );
      end
    end

    // mc_cur
    integer intra_cur_debug_fp_o;
    reg intra_cur_ren_r;

    initial begin
      intra_cur_debug_fp_o = $fopen( "./dump/mc_cur_debug.log" ,"w" );
    end

    always @(posedge clk ) begin
      intra_cur_ren_r <= intra_cur_ren;
      if( intra_cur_ren_r ) begin
        $fwrite(intra_cur_debug_fp_o ,"%128x\n", intra_cur_data );
      end
    end

    // mc_ref
    integer mc_ref_debug_fp_o;
    reg mc_ref_ren_r;

    initial begin
      mc_ref_debug_fp_o = $fopen( "./dump/mc_ref_debug.log" ,"w" );
    end

    always @(posedge clk ) begin
      mc_ref_ren_r <= mc_ref_ren;
//      if( mc_ref_ren & (!mc_ref_ren_r) ) begin
//        $fwrite( mc_ref_debug_fp_o ,"*** x: %d, y: %d, sel: %d ***\n"
//                ,u_top.u_top_ctrl.first_x_o ,u_top.u_top_ctrl.first_y_o ,mc_ref_sel );
//      end
      if( mc_ref_ren_r ) begin
        $fwrite( mc_ref_debug_fp_o ,"%128x\n", mc_ref_data );
      end
    end

    // mc_cur_mem
    integer iii;
    integer fp_mc;
    initial begin
      fp_mc= $fopen("./dump/mc_buf.log");
    end
    always @ (posedge clk) begin
      if( u_fetch.u_ctrl.cur_chroma_done_o ) begin
        for(iii=0 ;iii<64 ;iii=iii+1)
          $fdisplay( fp_mc ,"%064x" ,{ u_fetch.u_cur_chroma.cur00.buf_org_0.u_ram_1p_64x192.mem_array[iii+128],
                                       u_fetch.u_cur_chroma.cur00.buf_org_1.u_ram_1p_64x192.mem_array[iii+128],
                                       u_fetch.u_cur_chroma.cur00.buf_org_2.u_ram_1p_64x192.mem_array[iii+128],
                                       u_fetch.u_cur_chroma.cur00.buf_org_3.u_ram_1p_64x192.mem_array[iii+128]
                                     });
      end
    end

    // db_dat
    integer db_dat_debug_fp_o;
    reg db_ren_r ;

    initial begin
      db_dat_debug_fp_o = $fopen( "./dump/db_dat_debug.log" ,"w" );
    end

    always @(posedge clk ) begin
      db_ren_r <= !u_top.u_db_top.mb_db_ren_o ;
      if( db_ren_r ) begin
        $fwrite( db_dat_debug_fp_o ,"%032x\n", u_top.u_db_top.mb_db_data_i );
      end
    end

    // db_dat_o
    integer db_dat_o_debug_fp_o;
    integer db_dat_o_debug_i;
    reg extif_rden_r ;

    initial begin
      db_dat_o_debug_i = 0;
      db_dat_o_debug_fp_o = $fopen( "./dump/db_dat_o_debug.log" ,"w" );
    end

    always @(posedge clk ) begin
      extif_rden_r <= extif_rden_i ;
      if( extif_rden_r ) begin
        $fwrite( db_dat_o_debug_fp_o ,"%032x", extif_data_o );
        if( db_dat_o_debug_i==3 ) begin
          $fwrite( db_dat_o_debug_fp_o ,"\n" );
        end
        db_dat_o_debug_i = (db_dat_o_debug_i+1)%4;
      end
    end

  `endif

  `ifdef FIME_AUTO_CHECK
    initial begin
      #100 ;
      $display( "\t\t fime auto check is on" );
      fime_check_fp_o = $fopen( FIME_CHECK_FILE , "r" );
    end

    always @(negedge clk ) begin
      if( dut.u_top.fmeif_en_w ) begin
        fime_check_tp = $fscanf( fime_check_fp_o ,"%2h" ,fime_check_mv_x );
        fime_check_tp = $fscanf( fime_check_fp_o ,"%2h" ,fime_check_mv_y );
        if( (fime_check_mv_x!==dut.u_top.fmeif_mv_w[2*`IMV_WIDTH-1:1*`IMV_WIDTH])
          & (fime_check_mv_y!==dut.u_top.fmeif_mv_w[1*`IMV_WIDTH-1:0*`IMV_WIDTH])
          ) begin
          $display( "at %08d, Error!\n(MV_X,MV_Y) should be (%02h,%02h), however is (%02h,%02h)",
                    $time,
                    fime_check_mv_x, fime_check_mv_y,
                    dut.u_top.fmeif_mv_w[2*`IMV_WIDTH-1:1*`IMV_WIDTH], dut.u_top.fmeif_mv_w[1*`IMV_WIDTH-1:0*`IMV_WIDTH]
                  );
          #1000 ;
          $finish ;
        end
      end
    end

    always @(negedge clk ) begin
      if( dut.u_top.fime_done ) begin
        fime_check_tp = $fscanf( fime_check_fp_o ,"%42b" ,fime_check_partition );
        //$display( "\t\tfime partition: %h", u_top.fmeif_partition_w );
        if( dut.u_top.fmeif_partition_w!=fime_check_partition ) begin
          $display( "at %08d, Error!\nFIME_PARTITION should be %b, however is %b",
                    $time,
                    fime_check_partition,
                    dut.u_top.fmeif_partition_w
                  );
          #1000 ;
          $finish ;
        end
      end
    end
  `endif

  `ifdef FME_AUTO_CHECK
    initial begin
      #100 ;
      $display( "\t\t fme auto check is on" );
      fme_check_fp_o = $fopen( FME_CHECK_FILE ,"r" );
    end

    reg [8*`PIXEL_WIDTH-1:0] fme_check_p0 ;
    reg [8*`PIXEL_WIDTH-1:0] fme_check_p1 ;
    reg [8*`PIXEL_WIDTH-1:0] fme_check_p2 ;
    reg [8*`PIXEL_WIDTH-1:0] fme_check_p3 ;
    reg [8*`PIXEL_WIDTH-1:0] fme_check_p4 ;
    reg [8*`PIXEL_WIDTH-1:0] fme_check_p5 ;
    reg [8*`PIXEL_WIDTH-1:0] fme_check_p6 ;
    reg [8*`PIXEL_WIDTH-1:0] fme_check_p7 ;

    always @(posedge dut.u_top.fme_done ) begin

      // check 0 1 of y
      for( fme_check_cntrow=0 ;fme_check_cntrow<32 ;fme_check_cntrow=fme_check_cntrow+1 ) begin
        fme_check_p0 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_0.u_ram_1p_64x192.mem_array[fme_check_cntrow]
                                       : dut.u_top.fme_rec_mem_1.buf_org_0.u_ram_1p_64x192.mem_array[fme_check_cntrow] ;
        fme_check_p1 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_1.u_ram_1p_64x192.mem_array[fme_check_cntrow]
                                       : dut.u_top.fme_rec_mem_1.buf_org_1.u_ram_1p_64x192.mem_array[fme_check_cntrow] ;
        fme_check_p2 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_2.u_ram_1p_64x192.mem_array[fme_check_cntrow]
                                       : dut.u_top.fme_rec_mem_1.buf_org_2.u_ram_1p_64x192.mem_array[fme_check_cntrow] ;
        fme_check_p3 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_3.u_ram_1p_64x192.mem_array[fme_check_cntrow]
                                       : dut.u_top.fme_rec_mem_1.buf_org_3.u_ram_1p_64x192.mem_array[fme_check_cntrow] ;
        fme_check_p4 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_0.u_ram_1p_64x192.mem_array[fme_check_cntrow+32]
                                       : dut.u_top.fme_rec_mem_1.buf_org_0.u_ram_1p_64x192.mem_array[fme_check_cntrow+32] ;
        fme_check_p5 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_1.u_ram_1p_64x192.mem_array[fme_check_cntrow+32]
                                       : dut.u_top.fme_rec_mem_1.buf_org_1.u_ram_1p_64x192.mem_array[fme_check_cntrow+32] ;
        fme_check_p6 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_2.u_ram_1p_64x192.mem_array[fme_check_cntrow+32]
                                       : dut.u_top.fme_rec_mem_1.buf_org_2.u_ram_1p_64x192.mem_array[fme_check_cntrow+32] ;
        fme_check_p7 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_3.u_ram_1p_64x192.mem_array[fme_check_cntrow+32]
                                       : dut.u_top.fme_rec_mem_1.buf_org_3.u_ram_1p_64x192.mem_array[fme_check_cntrow+32] ;
        case( fme_check_cntrow%4 )
          'd0: fme_check_pixel_hw = { fme_check_p0 ,fme_check_p2 ,fme_check_p1 ,fme_check_p3
                                     ,fme_check_p4 ,fme_check_p6 ,fme_check_p5 ,fme_check_p7 };
          'd1: fme_check_pixel_hw = { fme_check_p1 ,fme_check_p3 ,fme_check_p2 ,fme_check_p0
                                     ,fme_check_p5 ,fme_check_p7 ,fme_check_p6 ,fme_check_p4 };
          'd2: fme_check_pixel_hw = { fme_check_p2 ,fme_check_p0 ,fme_check_p3 ,fme_check_p1
                                     ,fme_check_p6 ,fme_check_p4 ,fme_check_p7 ,fme_check_p5 };
          'd3: fme_check_pixel_hw = { fme_check_p3 ,fme_check_p1 ,fme_check_p0 ,fme_check_p2
                                     ,fme_check_p7 ,fme_check_p5 ,fme_check_p4 ,fme_check_p6 };
        endcase
        fme_check_tp = $fscanf( fme_check_fp_o ,"%h" ,fme_check_pixel_sw );
        if( fme_check_pixel_sw!==fme_check_pixel_hw ) begin
          $display( "at %08d, Error!\nFME_REC should be %0128h,\nhowever is        %0128h.\n"
                       ,$time ,fme_check_pixel_sw, fme_check_pixel_hw
                  );
          #1000 ;
          $finish ;
        end
      end

      // check 2 3 of y
      for( fme_check_cntrow=64 ;fme_check_cntrow<96 ;fme_check_cntrow=fme_check_cntrow+1 ) begin
        fme_check_p0 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_0.u_ram_1p_64x192.mem_array[fme_check_cntrow]
                                       : dut.u_top.fme_rec_mem_1.buf_org_0.u_ram_1p_64x192.mem_array[fme_check_cntrow] ;
        fme_check_p1 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_1.u_ram_1p_64x192.mem_array[fme_check_cntrow]
                                       : dut.u_top.fme_rec_mem_1.buf_org_1.u_ram_1p_64x192.mem_array[fme_check_cntrow] ;
        fme_check_p2 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_2.u_ram_1p_64x192.mem_array[fme_check_cntrow]
                                       : dut.u_top.fme_rec_mem_1.buf_org_2.u_ram_1p_64x192.mem_array[fme_check_cntrow] ;
        fme_check_p3 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_3.u_ram_1p_64x192.mem_array[fme_check_cntrow]
                                       : dut.u_top.fme_rec_mem_1.buf_org_3.u_ram_1p_64x192.mem_array[fme_check_cntrow] ;
        fme_check_p4 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_0.u_ram_1p_64x192.mem_array[fme_check_cntrow+32]
                                       : dut.u_top.fme_rec_mem_1.buf_org_0.u_ram_1p_64x192.mem_array[fme_check_cntrow+32] ;
        fme_check_p5 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_1.u_ram_1p_64x192.mem_array[fme_check_cntrow+32]
                                       : dut.u_top.fme_rec_mem_1.buf_org_1.u_ram_1p_64x192.mem_array[fme_check_cntrow+32] ;
        fme_check_p6 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_2.u_ram_1p_64x192.mem_array[fme_check_cntrow+32]
                                       : dut.u_top.fme_rec_mem_1.buf_org_2.u_ram_1p_64x192.mem_array[fme_check_cntrow+32] ;
        fme_check_p7 = dut.u_top.sel_r ? dut.u_top.fme_rec_mem_0.buf_org_3.u_ram_1p_64x192.mem_array[fme_check_cntrow+32]
                                   : dut.u_top.fme_rec_mem_1.buf_org_3.u_ram_1p_64x192.mem_array[fme_check_cntrow+32] ;
        case(fme_check_cntrow%4)
          'd0: fme_check_pixel_hw = { fme_check_p0 ,fme_check_p2 ,fme_check_p1 ,fme_check_p3
                                     ,fme_check_p4 ,fme_check_p6 ,fme_check_p5 ,fme_check_p7 };
          'd1: fme_check_pixel_hw = { fme_check_p1 ,fme_check_p3 ,fme_check_p2 ,fme_check_p0
                                     ,fme_check_p5 ,fme_check_p7 ,fme_check_p6 ,fme_check_p4 };
          'd2: fme_check_pixel_hw = { fme_check_p2 ,fme_check_p0 ,fme_check_p3 ,fme_check_p1
                                     ,fme_check_p6 ,fme_check_p4 ,fme_check_p7 ,fme_check_p5 };
          'd3: fme_check_pixel_hw = { fme_check_p3 ,fme_check_p1 ,fme_check_p0 ,fme_check_p2
                                     ,fme_check_p7 ,fme_check_p5 ,fme_check_p4 ,fme_check_p6 };
        endcase
        fme_check_tp = $fscanf( fme_check_fp_o ,"%h" ,fme_check_pixel_sw );
        if( fme_check_pixel_sw!==fme_check_pixel_hw ) begin
          $display( "at %08d, Error!\nFME_REC should be %0128h,\nhowever is        %0128h.\n"
                       ,$time ,fme_check_pixel_sw, fme_check_pixel_hw
                  );
          #1000 ;
          $finish ;
        end
      end

    end
  `endif

  `ifdef MVD_AUTO_CHECK
    initial begin
      #100 ;
      $display( "\t\t mvd auto check is on" );
      mvd_check_fp_o = $fopen( MVD_CHECK_FILE , "r" );
    end

    reg [2*`FMV_WIDTH-1 : 0]    mvd_check_mv_c_r            ;
    reg [2*`FMV_WIDTH-1 : 0]    mvd_check_mv_p_r            ;
    reg [2*`MVD_WIDTH   : 0]    mvd_check_mvd_and_mvp_idx_r ;

    always @(negedge clk )begin
      if( dut.u_top.u_mc_top.u_mvd_top.lcu_curr_state_r[2] ) begin
        case( dut.u_top.u_mc_top.u_mvd_top.cu_cnt_d1_r[1:0] )
          2'd1:
                begin    mvd_check_tp_o = $fscanf( mvd_check_fp_o ,"%b\n" ,mvd_check_mv_c_r );
                         mvd_check_tp_o = $fscanf( mvd_check_fp_o ,"%b\n" ,mvd_check_mv_p_r );
                         if( (mvd_check_mv_c_r !== dut.u_top.u_mc_top.u_mvd_top.mv_c_r)
                           | (mvd_check_mv_p_r !== dut.u_top.u_mc_top.u_mvd_top.mv_p_r)
                         ) begin
                           $display( "at %08d (%03d), mvd is wrong!\n" ,$time ,dut.u_top.u_mc_top.u_mvd_top.cu_idx_r );
                           #1000 ;
                           $finish ;
                         end
                end
          2'd2:
                begin    mvd_check_tp_o = $fscanf( mvd_check_fp_o ,"%b\n" ,mvd_check_mv_p_r );
                         mvd_check_tp_o = $fscanf( mvd_check_fp_o ,"%b\n" ,mvd_check_mvd_and_mvp_idx_r );
                         if( (mvd_check_mv_p_r            !== dut.u_top.u_mc_top.u_mvd_top.mv_p_r)
                           | (mvd_check_mvd_and_mvp_idx_r !== dut.u_top.u_mc_top.u_mvd_top.mvd_and_mvp_idx_o )
                         ) begin
                           $display( "at %08d (%03d), mvd is wrong!\n" ,$time ,dut.u_top.u_mc_top.u_mvd_top.cu_idx_r );
                           #1000 ;
                           $finish ;
                         end
                end
        endcase
      end
    end
  `endif

  `ifdef DB_AUTO_CHECK
    initial begin
      #100 ;
      $display( "\t\t db auto check is on" );    // embedded in top.v
    end
  `endif

  `ifdef FETCH_AUTO_CHECK
    initial begin
      #100 ;
      $display( "\t\t fetch auto check is on" );    // embedded in above tb
    end
  `endif

  `ifdef BS_AUTO_CHECK
    integer           bs_i_check_fp ;
    integer           bs_i_check_tp ;
    integer           bs_p_check_fp ;
    integer           bs_p_check_tp ;
    reg      [7  : 0] bs_check_data ;

    initial begin
      #100 ;
      $display( "\t\t bs auto check is on" );
      bs_i_check_fp = $fopen( BS_I_CHECK_FILE ,"r" );
      bs_p_check_fp = $fopen( BS_P_CHECK_FILE ,"r" );
    end

    always @(negedge clk) begin
      if( dut.winc_o ) begin
        if( sys_type == INTRA )
          bs_i_check_tp = $fscanf( bs_i_check_fp ,"%h" ,bs_check_data );
        else begin
          bs_p_check_tp = $fscanf( bs_p_check_fp ,"%h" ,bs_check_data );
        end
        if( bs_check_data!==dut.wdata_o ) begin
          $display( "at %08d, Error!\nBS should be %h, however is data %h"
                       ,$time ,bs_check_data ,dut.wdata_o
                  );
          //$display("at %d,\nERROR(MB x:%3d y:%3d): check_data(%h) != bs_data(%h)", $time, u_top.mb_x_ec, u_top.mb_y_ec, check_data, u_top.wdata_o);
          //#5000 $finish ;
        end
      end
    end
  `endif


//*** OTHER BENCH **************************************************************

  `ifdef DUMP_BS
    `include "./bench/bs_dump.v"
  `endif

  `ifdef DUMP_CMB
    `include "./bench/cmb_dump.v"
  `endif

  `ifdef DUMP_INTRA
    `include "./bench/intra_dump.v"
  `endif

  `ifdef DUMP_TQ
    `include "./bench/tq_dump.v"
  `endif

  `ifdef DUMP_CABAC
    `include "./bench/cabac_dump.v"
  `endif

  `ifdef DUMP_DB
    `include "./bench/db_dump.v"
  `endif

  `ifdef DUMP_FME
    `include "./bench/fme_dump.v"
  `endif

  `ifdef DUMP_MC
    `include "./bench/mc_dump.v"
  `endif


endmodule
