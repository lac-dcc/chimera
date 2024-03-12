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
//  Filename      : h265core.v
//  Author        : Huang Leilei
//  Created       : 2015-09-07
//  Description   : integration of fetch, pre_i & enc
//
//-------------------------------------------------------------------
//
//  Modified      : 2015-09-19 by HLL
//  Description   : more modes connected out
//  Modified      : 2015-11-15 by HLL
//  Description   : pulse done modified to level done
//
//-------------------------------------------------------------------

`include "enc_defines.v"


module h265core(
  // global
  clk               ,
  rst_n             ,
  // config
  sys_start_i       ,
  sys_done_o        ,
  sys_x_total_i     ,
  sys_y_total_i     ,
  sys_mode_i        ,
  sys_qp_i          ,
  sys_type_i        ,
  pre_min_size_i    ,
  // ext
  extif_start_o     ,
  extif_done_i      ,
  extif_mode_o      ,
  extif_x_o         ,
  extif_y_o         ,
  extif_width_o     ,
  extif_height_o    ,
  extif_wren_i      ,
  extif_rden_i      ,
  extif_addr_i      ,
  extif_data_i      ,
  extif_data_o      ,
  // bs
  winc_o            ,
  wdata_o
  );


//*** PARAMETER ****************************************************************

  parameter INTRA = 0 ,
            INTER = 1 ;

  parameter IDLE  = 0 ,
            I_S1  = 1 , // I // fetch        ,       ,
            I_S2  = 2 ,      // fetch        , pre_i ,
            I_S3  = 3 ,      // fetch        , pre_i , enc
            I_S4  = 4 ,      // fetch        ,       , enc
            I_S5  = 5 ,      // fetch        ,
            P_S1  = 6 , // P // fetch & cime ,
            P_S2  = 7 ,      // fetch & cime ,
            P_S3  = 8 ,      // fetch & cime ,       , enc
            P_S4  = 9 ;      // fetch & cime ,


//*** WIRE/REG DECLARATION *****************************************************

  // GLOBAL
  input                                 clk                ;
  input                                 rst_n              ;

  // CONFIG
  input                                 sys_start_i        ;
  output reg                            sys_done_o         ;
  input      [`PIC_X_WIDTH-1    : 0]    sys_x_total_i      ;
  input      [`PIC_Y_WIDTH-1    : 0]    sys_y_total_i      ;
  input                                 sys_mode_i         ;
  input      [5                 : 0]    sys_qp_i           ;
  input                                 sys_type_i         ;
  input                                 pre_min_size_i     ;

  // EXT_IF
  output     [1-1               : 0]    extif_start_o      ; // ext mem load start
  input      [1-1               : 0]    extif_done_i       ; // ext mem load done
  output     [5-1               : 0]    extif_mode_o       ; // ext mode
  output     [6+`PIC_X_WIDTH-1  : 0]    extif_x_o          ; // x in ref frame
  output     [6+`PIC_Y_WIDTH-1  : 0]    extif_y_o          ; // y in ref frame
  output     [8-1               : 0]    extif_width_o      ; // ref window width
  output     [8-1               : 0]    extif_height_o     ; // ref window height
  input                                 extif_wren_i       ;
  input                                 extif_rden_i       ;
  input      [8-1               : 0]    extif_addr_i       ; // fetch ram write/read addr
  input      [16*`PIXEL_WIDTH-1 : 0]    extif_data_i       ; // ext data reg
  output     [16*`PIXEL_WIDTH-1 : 0]    extif_data_o       ; // ext data outp

  // BS
  output                                winc_o             ;
  output     [7                 : 0]    wdata_o            ;


//*** WIRE/REG DECLARATION *****************************************************

  // CONTROL
  reg        [3                 : 0]    cur_state          ;
  reg        [3                 : 0]    nxt_state          ;
  wire                                  intra_jump         ;
  wire                                  inter_jump         ;
  wire                                  final_jump         ;
  reg        [`PIC_LCU_WID-1    : 0]    lcu_cnt            ;
  wire                                  stat_done_w        ;
  wire                                  I_S1_done_w        ;
  wire                                  I_S2_done_w        ;
  wire                                  I_S3_done_w        ;
  wire                                  I_S4_done_w        ;
  wire                                  I_S5_done_w        ;
  wire                                  P_S1_done_w        ;
  wire                                  P_S2_done_w        ;
  wire                                  P_S3_done_w        ;
  wire                                  P_S4_done_w        ;

  // START & DONE
  reg                                   enc_start          ;
  wire                                  enc_done           ;
  reg                                   enc_done_flag      ;
  reg                                   fetch_start        ;
  wire                                  fetch_done         ;
  reg                                   fetch_done_flag    ;
  reg                                   pre_i_start        ;
  wire                                  pre_i_done         ;
  reg                                   pre_i_done_flag    ;

  // PRE_I_IF
  wire       [3                 : 0]    pre_i_4x4_x        ;
  wire       [3                 : 0]    pre_i_4x4_y        ;
  wire       [4                 : 0]    pre_i_idx          ;
  wire                                  pre_i_sel          ;
  wire       [1                 : 0]    pre_i_size         ;
  wire                                  pre_i_ren          ;
  wire       [`PIXEL_WIDTH*32-1 : 0]    pre_i_data         ;

  // PER_I_MODE_IF
  wire                                  md_we              ;
  wire       [6                 : 0]    md_waddr           ;
  wire       [5                 : 0]    md_wdata           ;

  // INTRA_CUR_IF
  wire       [3                 : 0]    intra_cur_4x4_x    ;
  wire       [3                 : 0]    intra_cur_4x4_y    ;
  wire       [4                 : 0]    intra_cur_idx      ;
  wire                                  intra_cur_sel      ;
  wire       [1                 : 0]    intra_cur_size     ;
  wire                                  intra_cur_ren      ;
  wire       [`PIXEL_WIDTH*32-1 : 0]    intra_cur_data     ;

  // INTRA_MODE_IF
  wire                                  intra_md_ren       ;
  wire       [9                 : 0]    intra_md_addr      ;
  wire       [5                 : 0]    intra_md_data      ;

  // FIME_CUR_IF
  wire       [4-1               : 0]    fime_cur_4x4_x     ;
  wire       [4-1               : 0]    fime_cur_4x4_y     ;
  wire       [5-1               : 0]    fime_cur_idx       ;
  wire                                  fime_cur_sel       ;
  wire       [2-1               : 0]    fime_cur_size      ;
  wire                                  fime_cur_ren       ;
  wire       [64*`PIXEL_WIDTH-1 : 0]    fime_cur_data      ;

  // FIME_REF_IF
  wire       [5-1               : 0]    fime_ref_x         ;
  wire       [7-1               : 0]    fime_ref_y         ;
  wire                                  fime_ref_ren       ;
  wire       [64*`PIXEL_WIDTH-1 : 0]    fime_ref_data      ;

  // FME_CUR_IF
  wire       [4-1               : 0]    fme_cur_4x4_x      ;
  wire       [4-1               : 0]    fme_cur_4x4_y      ;
  wire       [5-1               : 0]    fme_cur_idx        ;
  wire                                  fme_cur_sel        ;
  wire       [2-1               : 0]    fme_cur_size       ;
  wire                                  fme_cur_ren        ;
  wire       [32*`PIXEL_WIDTH-1 : 0]    fme_cur_data       ;

  // FME_REF_IF
  wire       [7-1               : 0]    fme_ref_x          ;
  wire       [7-1               : 0]    fme_ref_y          ;
  wire                                  fme_ref_ren        ;
  wire       [64*`PIXEL_WIDTH-1 : 0]    fme_ref_data       ;

  // MC_REF_IF
  wire       [6-1               : 0]    mc_ref_x           ;
  wire       [6-1               : 0]    mc_ref_y           ;
  wire                                  mc_ref_ren         ;
  wire                                  mc_ref_sel         ;
  wire       [8*`PIXEL_WIDTH-1  : 0]    mc_ref_data        ;

  // DB_FETCH_IF
  wire       [1-1               : 0]    db_wen             ;
  wire       [5-1               : 0]    db_w4x4_x          ;
  wire       [5-1               : 0]    db_w4x4_y          ;
  wire       [1-1               : 0]    db_wprevious       ;
  wire       [1-1               : 0]    db_done            ;
  wire       [2-1               : 0]    db_wsel            ;
  wire       [16*`PIXEL_WIDTH-1 : 0]    db_wdata           ;
  wire       [1-1               : 0]    db_ren             ;
  wire       [5-1               : 0]    db_r4x4            ;
  wire       [2-1               : 0]    db_ridx            ;
  wire       [4*`PIXEL_WIDTH-1  : 0]    db_rdata           ;


//*** DUT DECLARATION **********************************************************


//--- CONTROL ------------------------------------

  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      sys_done_o <= 0 ;
    else begin
      sys_done_o <= (cur_state==IDLE) ;
    end
  end

  always @(posedge clk or negedge rst_n) begin
    if( !rst_n )
      cur_state <= IDLE ;
    else begin
      cur_state <= nxt_state ;
    end
  end

  always @(*) begin
                                                      nxt_state = IDLE ;
    case( cur_state )
      IDLE : begin    if( sys_start_i )
                        if( sys_type_i==INTRA )         nxt_state = I_S1 ;
                        else                          nxt_state = P_S1 ;
                      else                            nxt_state = IDLE ;
             end
      I_S1 : begin    if( stat_done_w )               nxt_state = I_S2 ;
                      else                            nxt_state = I_S1 ;
             end
      I_S2 : begin    if( stat_done_w )               nxt_state = I_S3 ;
                      else                            nxt_state = I_S2 ;
             end
      I_S3 : begin    if( stat_done_w & intra_jump )  nxt_state = I_S4 ;
                      else                            nxt_state = I_S3 ;
             end
      I_S4 : begin    if( stat_done_w )               nxt_state = I_S5 ;
                      else                            nxt_state = I_S4 ;
             end
      I_S5 : begin    if( stat_done_w & final_jump )  nxt_state = IDLE ;
                      else                            nxt_state = I_S5 ;
             end
      P_S1 : begin    if( stat_done_w )               nxt_state = P_S2 ;
                      else                            nxt_state = P_S1 ;
             end
      P_S2 : begin    if( stat_done_w )               nxt_state = P_S3 ;
                      else                            nxt_state = P_S2 ;
             end
      P_S3 : begin    if( stat_done_w & inter_jump )  nxt_state = P_S4 ;
                      else                            nxt_state = P_S3 ;
             end
      P_S4 : begin    if( stat_done_w & final_jump )  nxt_state = IDLE ;
                      else                            nxt_state = P_S4 ;
             end
    endcase
  end

  assign intra_jump = lcu_cnt == (sys_x_total_i+1)*(sys_y_total_i+1) - 1 ;
  assign inter_jump = lcu_cnt == (sys_x_total_i+1)*(sys_y_total_i+1) + 2 ;
  assign final_jump = lcu_cnt == 2 ;


  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      lcu_cnt <= 0 ;
    else if( cur_state!=nxt_state )
      lcu_cnt <= 0 ;
    else if( stat_done_w ) begin
      lcu_cnt <= lcu_cnt+1 ;
    end
  end

  assign stat_done_w = I_S1_done_w |
                       I_S2_done_w |
                       I_S3_done_w |
                       I_S4_done_w |
                       I_S5_done_w |
                       P_S1_done_w |
                       P_S2_done_w |
                       P_S3_done_w |
                       P_S4_done_w ;

  assign I_S1_done_w = ( cur_state==I_S1 ) & fetch_done_flag                                   ; // I // fetch        ,       ,
  assign I_S2_done_w = ( cur_state==I_S2 ) & fetch_done_flag & pre_i_done_flag                 ;      // fetch        , pre_i ,
  assign I_S3_done_w = ( cur_state==I_S3 ) & fetch_done_flag & pre_i_done_flag & enc_done_flag ;      // fetch        , pre_i , enc
  assign I_S4_done_w = ( cur_state==I_S4 ) & fetch_done_flag                   & enc_done_flag ;      // fetch        ,       , enc
  assign I_S5_done_w = ( cur_state==I_S5 ) & fetch_done_flag                                   ;      // fetch        ,
  assign P_S1_done_w = ( cur_state==P_S1 ) & fetch_done_flag                                   ; //P  // fetch & cime ,
  assign P_S2_done_w = ( cur_state==P_S2 ) & fetch_done_flag                                   ;      // fetch & cime ,
  assign P_S3_done_w = ( cur_state==P_S3 ) & fetch_done_flag                   & enc_done_flag ;      // fetch & cime ,       , enc
  assign P_S4_done_w = ( cur_state==P_S4 ) & fetch_done_flag                                   ;      // fetch & cime ,

  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      fetch_done_flag <= 0 ;
    else if( stat_done_w )
      fetch_done_flag <= 0 ;
    else if( fetch_done ) begin
      fetch_done_flag <= 1 ;
    end
  end

  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      pre_i_done_flag <= 0 ;
    else if( stat_done_w )
      pre_i_done_flag <= 0 ;
    else if( pre_i_done ) begin
      pre_i_done_flag <= 1 ;
    end
  end

  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      enc_done_flag <= 0 ;
    else if( stat_done_w )
      enc_done_flag <= 0 ;
    else if( enc_done ) begin
      enc_done_flag <= 1 ;
    end
  end

  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n ) begin
               { fetch_start ,pre_i_start ,enc_start } <= 3'b000 ;
    end
    else if( stat_done_w | ((cur_state==IDLE)&sys_start_i) ) begin
      case( nxt_state )
        I_S1 : { fetch_start ,pre_i_start ,enc_start } <= 3'b100 ; // I // fetch        ,       ,
        I_S2 : { fetch_start ,pre_i_start ,enc_start } <= 3'b110 ;      // fetch        , pre_i ,
        I_S3 : { fetch_start ,pre_i_start ,enc_start } <= 3'b111 ;      // fetch        , pre_i , enc
        I_S4 : { fetch_start ,pre_i_start ,enc_start } <= 3'b101 ;      // fetch        ,       , enc
        I_S5 : { fetch_start ,pre_i_start ,enc_start } <= 3'b100 ;      // fetch        ,
        P_S1 : { fetch_start ,pre_i_start ,enc_start } <= 3'b100 ; //P  // fetch & cime ,
        P_S2 : { fetch_start ,pre_i_start ,enc_start } <= 3'b100 ;      // fetch & cime ,
        P_S3 : { fetch_start ,pre_i_start ,enc_start } <= 3'b101 ;      // fetch & cime ,       , enc
        P_S4 : { fetch_start ,pre_i_start ,enc_start } <= 3'b100 ;      // fetch & cime ,
      endcase
    end
    else begin
               { fetch_start ,pre_i_start ,enc_start } <= 3'b000 ;
    end
  end


//--- FETCH --------------------------------------

  fetch u_fetch (
    .clk                ( clk                ),
    .rstn               ( rst_n              ),
    // control
    .sysif_start_i      ( fetch_start        ),
    .sysif_done_o       ( fetch_done         ),
    .sysif_type_i       ( sys_type_i         ),
    .sysif_total_x_i    ( sys_x_total_i      ),
    .sysif_total_y_i    ( sys_y_total_i      ),
    // pre_i_if
    .pre_i_4x4_x_i      ( pre_i_4x4_x        ),
    .pre_i_4x4_y_i      ( pre_i_4x4_y        ),
    .pre_i_4x4_idx_i    ( pre_i_idx          ),
    .pre_i_sel_i        ( pre_i_sel          ),
    .pre_i_size_i       ( pre_i_size         ),
    .pre_i_rden_i       ( pre_i_ren          ),
    .pre_i_pel_o        ( pre_i_data         ),
    // cimv_i
    .cimv_pre_i         ( 20'b0              ),
    .cimv_fme_i         ( 20'b0              ),
    // cime_if
    .cime_cur_4x4_x_i   ( 4'b0               ),
    .cime_cur_4x4_y_i   ( 4'b0               ),
    .cime_cur_4x4_idx_i ( 6'b0               ),
    .cime_cur_sel_i     ( 1'b0               ),
    .cime_cur_size_i    ( 2'b0               ),
    .cime_cur_rden_i    ( 1'b0               ),
    .cime_cur_pel_o     (                    ),
    .cime_ref_x_i       ( 6'b0               ),
    .cime_ref_y_i       ( 6'b0               ),
    .cime_ref_rden_i    ( 1'b0               ),
    .cime_ref_pel_o     (                    ),
    // fime_if
    .fime_cur_4x4_x_i   ( fime_cur_4x4_x     ),
    .fime_cur_4x4_y_i   ( fime_cur_4x4_y     ),
    .fime_cur_4x4_idx_i ( fime_cur_idx       ),
    .fime_cur_sel_i     ( fime_cur_sel       ),
    .fime_cur_size_i    ( {1'b0,fime_cur_size}      ),
    .fime_cur_rden_i    ( fime_cur_ren       ),
    .fime_cur_pel_o     ( fime_cur_data      ),
    .fime_ref_x_i       ( {3'b0,fime_ref_x}  ),
    .fime_ref_y_i       ( {1'b0,fime_ref_y}  ),
    .fime_ref_rden_i    ( fime_ref_ren       ),
    .fime_ref_pel_o     ( fime_ref_data      ),
    // fme_if
    .fme_cur_4x4_x_i    ( fme_cur_4x4_x      ),
    .fme_cur_4x4_y_i    ( fme_cur_4x4_y      ),
    .fme_cur_4x4_idx_i  ( fme_cur_idx        ),
    .fme_cur_sel_i      ( fme_cur_sel        ),
    .fme_cur_size_i     ( fme_cur_size       ),
    .fme_cur_rden_i     ( fme_cur_ren        ),
    .fme_cur_pel_o      ( fme_cur_data       ),
    .fme_ref_x_i        ( fme_ref_x          ),
    .fme_ref_y_i        ( fme_ref_y          ),
    .fme_ref_rden_i     ( fme_ref_ren        ),
    .fme_ref_pel_o      ( fme_ref_data       ),
    // mc_if (mc_cur also servers for intra_cur as well)
    .mc_cur_4x4_x_i     ( intra_cur_4x4_x    ),
    .mc_cur_4x4_y_i     ( intra_cur_4x4_y    ),
    .mc_cur_4x4_idx_i   ( intra_cur_idx      ),
    .mc_cur_sel_i       ( intra_cur_sel      ),
    .mc_cur_size_i      ( intra_cur_size     ),
    .mc_cur_rden_i      ( intra_cur_ren      ),
    .mc_cur_pel_o       ( intra_cur_data     ),
    .mc_ref_x_i         ( mc_ref_x           ),
    .mc_ref_y_i         ( mc_ref_y           ),
    .mc_ref_rden_i      ( mc_ref_ren         ),
    .mc_ref_sel_i       ( mc_ref_sel         ),
    .mc_ref_pel_o       ( mc_ref_data        ),
    // db_if
    .db_cur_4x4_x_i     ( 4'b0               ),
    .db_cur_4x4_y_i     ( 4'b0               ),
    .db_cur_4x4_idx_i   ( 5'b0               ),
    .db_cur_sel_i       ( 1'b0               ),
    .db_cur_size_i      ( 2'b0               ),
    .db_cur_rden_i      ( 1'b0               ),
    .db_cur_pel_o       (                    ),
    .db_wen_i           (!db_wen             ),
    .db_w4x4_x_i        ( db_w4x4_x          ),
    .db_w4x4_y_i        ( db_w4x4_y          ),
    .db_wprevious_i     ( db_wprevious       ),
    .db_done_i          ( db_done            ),
    .db_wsel_i          ( db_wsel            ),
    .db_wdata_i         ( db_wdata           ),
    .db_ren_i           (!db_ren             ),
    .db_r4x4_i          ( db_r4x4            ),
    .db_ridx_i          ( db_ridx            ),
    .db_rdata_o         ( db_rdata           ),
    // ext_if
    .extif_start_o      ( extif_start_o      ),
    .extif_done_i       ( extif_done_i       ),
    .extif_mode_o       ( extif_mode_o       ),
    .extif_x_o          ( extif_x_o          ),
    .extif_y_o          ( extif_y_o          ),
    .extif_width_o      ( extif_width_o      ),
    .extif_height_o     ( extif_height_o     ),
    .extif_wren_i       ( extif_wren_i       ),
    .extif_rden_i       ( extif_rden_i       ),
    .extif_data_i       ( extif_data_i       ),
    .extif_data_o       ( extif_data_o       )
    );


//--- PRE_I --------------------------------------

  hevc_md_top u_hevc_md_top(
    .clk                ( clk                ),
    .rstn               ( rst_n              ),
    // control
    .enable             ( pre_i_start        ),
    .finish             ( pre_i_done         ),
    // pixel_i
    .md_ren_o           ( pre_i_ren          ),
    .md_sel_o           ( pre_i_sel          ),
    .md_size_o          ( pre_i_size         ),
    .md_4x4_x_o         ( pre_i_4x4_x        ),
    .md_4x4_y_o         ( pre_i_4x4_y        ),
    .md_idx_o           ( pre_i_idx          ),
    .md_data_i          ( pre_i_data         ),
    // mode_o
    .md_we              ( md_we              ),
    .md_waddr           ( md_waddr           ),
    .md_wdata           ( md_wdata           )
    );

  // mode ram
  reg sel_r;

  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      sel_r <=  1'b0;
    else if( enc_start ) begin
      sel_r <= !sel_r;
    end
  end

  wire            md_we_0         ;
  wire [9 : 0]    md_addr_i_0     ;
  wire [5 : 0]    md_data_i_0     ;
  wire            md_we_1         ;
  wire [9 : 0]    md_addr_i_1     ;
  wire [5 : 0]    md_data_i_1     ;

  wire [5 : 0]    intra_md_data_0 ;
  wire [5 : 0]    intra_md_data_1 ;

  assign  md_we_0       = sel_r ? md_we         : 0             ;
  assign  md_addr_i_0   = sel_r ? md_waddr      : intra_md_addr ;
  assign  md_data_i_0   = sel_r ? md_wdata      : 0             ;
  assign  md_we_1       = sel_r ? 0             : md_we         ;
  assign  md_addr_i_1   = sel_r ? intra_md_addr : md_waddr      ;
  assign  md_data_i_1   = sel_r ? 0             : md_wdata      ;

  assign  intra_md_data = sel_r ? intra_md_data_1 : intra_md_data_0 ;

  buf_ram_1p_6x85 imode_buf_0(
    .clk      ( clk                ),
    .ce       ( 1'b1               ),
    .we       ( md_we_0            ),
    .addr     ( md_addr_i_0        ),
    .data_i   ( md_data_i_0        ),
    .data_o   ( intra_md_data_0    )
    );

  buf_ram_1p_6x85 imode_buf_1(
    .clk      ( clk                ),
    .ce       ( 1'b1               ),
    .we       ( md_we_1            ),
    .addr     ( md_addr_i_1        ),
    .data_i   ( md_data_i_1        ),
    .data_o   ( intra_md_data_1    )
    );


//--- ENC_TOP ------------------------------------

  reg [16*`PIXEL_WIDTH-1 : 0]    db_rdata_w ;

  always @(*) begin
    case( db_ridx )
      1 : begin db_rdata_w = 128'b0 ; db_rdata_w[16*`PIXEL_WIDTH-1:12*`PIXEL_WIDTH] = db_rdata ; end
      2 : begin db_rdata_w = 128'b0 ; db_rdata_w[12*`PIXEL_WIDTH-1:08*`PIXEL_WIDTH] = db_rdata ; end
      3 : begin db_rdata_w = 128'b0 ; db_rdata_w[08*`PIXEL_WIDTH-1:04*`PIXEL_WIDTH] = db_rdata ; end
      0 : begin db_rdata_w = 128'b0 ; db_rdata_w[04*`PIXEL_WIDTH-1:00*`PIXEL_WIDTH] = db_rdata ; end
    endcase
  end

  top u_top (
    .clk                ( clk                ),
    .rst_n              ( rst_n              ),
    // intra_cur_if
    .intra_cur_4x4_x_o  ( intra_cur_4x4_x    ),
    .intra_cur_4x4_y_o  ( intra_cur_4x4_y    ),
    .intra_cur_idx_o    ( intra_cur_idx      ),
    .intra_cur_sel_o    ( intra_cur_sel      ),
    .intra_cur_size_o   ( intra_cur_size     ),
    .intra_cur_ren_o    ( intra_cur_ren      ),
    .intra_cur_data_i   ( intra_cur_data     ),
    // intra_mode_if
    .intra_md_ren_o     ( intra_md_ren       ),
    .intra_md_addr_o    ( intra_md_addr      ),
    .intra_md_data_i    ( intra_md_data      ),
    // fime_mv_if
    .fime_mv_x_i        ( 9'b0               ),
    .fime_mv_y_i        ( 9'b0               ),
    // fime_cur_if
    .fime_cur_4x4_x_o   ( fime_cur_4x4_x     ),
    .fime_cur_4x4_y_o   ( fime_cur_4x4_y     ),
    .fime_cur_idx_o     ( fime_cur_idx       ),
    .fime_cur_sel_o     ( fime_cur_sel       ),
    .fime_cur_size_o    ( fime_cur_size      ),
    .fime_cur_ren_o     ( fime_cur_ren       ),
    .fime_cur_data_i    ( fime_cur_data      ),
    // fime_ref_if
    .fime_ref_x_o       ( fime_ref_x         ),
    .fime_ref_y_o       ( fime_ref_y         ),
    .fime_ref_ren_o     ( fime_ref_ren       ),
    .fime_ref_data_i    ( fime_ref_data      ),
    // fme_cur_if
    .fme_cur_4x4_x_o    ( fme_cur_4x4_x      ),
    .fme_cur_4x4_y_o    ( fme_cur_4x4_y      ),
    .fme_cur_idx_o      ( fme_cur_idx        ),
    .fme_cur_sel_o      ( fme_cur_sel        ),
    .fme_cur_size_o     ( fme_cur_size       ),
    .fme_cur_ren_o      ( fme_cur_ren        ),
    .fme_cur_data_i     ( fme_cur_data       ),
    // fme_ref_if
    .fme_ref_x_o        ( fme_ref_x          ),
    .fme_ref_y_o        ( fme_ref_y          ),
    .fme_ref_ren_o      ( fme_ref_ren        ),
    .fme_ref_data_i     ( fme_ref_data       ),
    // mc_ref_if
    .mc_ref_x_o         ( mc_ref_x           ),
    .mc_ref_y_o         ( mc_ref_y           ),
    .mc_ref_ren_o       ( mc_ref_ren         ),
    .mc_ref_sel_o       ( mc_ref_sel         ),
    .mc_ref_data_i      ( mc_ref_data        ),
    // db_fetch_if
    .db_wen_o           ( db_wen             ),
    .db_w4x4_x_o        ( db_w4x4_x          ),
    .db_w4x4_y_o        ( db_w4x4_y          ),
    .db_wprevious_o     ( db_wprevious       ),
    .db_done_o          ( db_done            ),
    .db_wsel_o          ( db_wsel            ),
    .db_wdata_o         ( db_wdata           ),
    .db_ren_o           ( db_ren             ),
    .db_r4x4_o          ( db_r4x4            ),
    .db_ridx_o          ( db_ridx            ),
    .db_rdata_i         ( db_rdata_w         ),
    // sys_if
    .sys_x_total_i      ( sys_x_total_i      ),
    .sys_y_total_i      ( sys_y_total_i      ),
    .pre_min_size_i     ( pre_min_size_i     ),
    .sys_mode_i         ( sys_mode_i         ),
    .sys_type_i         ( sys_type_i         ),
    .sys_qp_i           ( sys_qp_i           ),
    .sys_start_i        ( enc_start          ),
    .sys_done_o         ( enc_done           ),
    // pixel_i (will be removed)
    .rinc_o             (                    ),
    .rvalid_i           (                    ),
    .rdata_i            (                    ),
    // bs_o
    .winc_o             ( winc_o             ),
    .wdata_o            ( wdata_o            ),
    .wfull_i            (                    )
    );


endmodule
