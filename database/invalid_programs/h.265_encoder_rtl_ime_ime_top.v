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
//  Filename      : ime_top.v
//  Author        : Huang Lei Lei
//  Created       : 2014-12-13
//  Description   : top of ime
//
//-------------------------------------------------------------------
//
//  Modified      : 2014-12-21
//  Description   : 5 stages established, tested with one LCU on the condition of no mv_cost
//  Modified      : 2014-12-21
//  Description   : mv_cost added
//  Modified      : 2014-12-21
//  Description   : partition and mode added
//  Modified      : 2014-12-22
//  Description   : dump added (6 stages together)
//  Modified      : 2015-03-18
//  Description   : signal done converted from level to pulse
//  Modified      : 2015-03-20
//  Description   : bugs removed (connection, typo, and init clear problems)
//  Modified      : 2015-03-20
//  Description   : data format added
//
//-------------------------------------------------------------------
//
//  PARTITION
//  order(zigzag) : 00 01 ... 15 | 00 01 ... 03 | 00
//  size          : 16 16 ... 16 | 32 32 ... 32 | 64
//  bits          : xx xx ... xx | xx xx ... xx | xx
//  value         : 00 2Nx2N
//                  01 2NxN
//                  10 Nx2N
//                  11 NxN (SPLIT)
//
//  MV
//  order         : zigzag
//  value         : mv_x     | mv_y
//  bits          : xxxxxxxx | xxxxxxxx
//
//-------------------------------------------------------------------

`include "enc_defines.v"

module ime_top (
  // global
  clk                  ,
  rstn                 ,
  // sys
  sysif_cmb_x_i        ,
  sysif_cmb_y_i        ,
  sysif_qp_i           ,
  sysif_start_i        ,
  sysif_done_o         ,
  // cur_if
  curif_en_o           ,
  curif_num_o          ,
  curif_data_i         ,
  // fetch_if
  fetchif_ref_x_o      ,
  fetchif_ref_y_o      ,
  fetchif_load_o       ,
  fetchif_data_i       ,
  // fme_if
  fmeif_partition_o    ,
  fmeif_cu_num_o       ,
  fmeif_mv_o           ,
  fmeif_en_o
  );


//*** PARAMETER DECLARATION ****************************************************

  parameter                             IDLE = 0          ,
                                        FILL = 1          ,
                                        FtoS = 2          ,
                                        SCAN = 3          ,
                                        DECI = 4          ,
                                        DUMP = 5          ;


//*** INPUT/OUTPUT DECLARATION *************************************************

  // global
  input                                 clk               ; // clk signal
  input                                 rstn              ; // asynchronous reset

  // sys
  input      [`PIC_X_WIDTH-1    : 0]    sysif_cmb_x_i     ; // x position of the current LCU in the frame
  input      [`PIC_Y_WIDTH-1    : 0]    sysif_cmb_y_i     ; // y position of the current LCU in the frame
  input      [6-1               : 0]    sysif_qp_i        ; // qp of the current LCU
  input                                 sysif_start_i     ; // F-ime start trigger signal
  output reg                            sysif_done_o      ; // F-ime done ack signal

  // cur_if
  output                                curif_en_o        ; // current LCU load enabale signal
  output     [5                 : 0]    curif_num_o       ; // current LCU row number to load (64 rows)
  input      [64*`PIXEL_WIDTH-1 : 0]    curif_data_i      ; // current LCU row data

  // fetch_if
  output     [4                 : 0]    fetchif_ref_x_o   ; // x position of ref LCU in the search window; (-12
  output     [6                 : 0]    fetchif_ref_y_o   ; // y position of ref LCU in the search window; (-12
  output                                fetchif_load_o    ; // load ref LCU start signal
  input      [64*`PIXEL_WIDTH-1 : 0]    fetchif_data_i    ; // ref LCU pixel data

  // fme_if
  output reg [41                : 0]    fmeif_partition_o ; // CU partition info (16+4+1)*2
  output     [5                 : 0]    fmeif_cu_num_o    ; // 8x8 CU number
  output     [`FMV_WIDTH*2-1    : 0]    fmeif_mv_o        ; // 8x8 PU MVs
  output                                fmeif_en_o        ; // 8x8 PU dump enable signal


//*** WIRE & REG DECLARATION ***************************************************

  reg  [2               : 0]    cur_state       ;
  reg  [2               : 0]    nxt_state       ;

  wire                          fill_done_w     ;
  wire                          scan_done_w     ;
  wire                          deci_start_w    ;
  wire                          deci_done_w     ;
  wire                          dump_done_w     ;

  reg  [6               : 0]    y_cnt_r         ;
  reg  [1               : 0]    block_r         ;
  wire [5               : 0]    y_base_w        ;
  reg  [4               : 0]    x_base_r        ;

  wire                          deci_doing_w    ;

  reg  [`IMV_WIDTH-1    : 0]    mv_x_dump_r     ;
  reg  [`IMV_WIDTH-1    : 0]    mv_y_dump_r     ;


//*** MAIN BODY ****************************************************************

//*** FSM ******************************

  // FSM : cur_state
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      cur_state <= 'd0 ;
    else begin
      cur_state <= nxt_state ;
    end
  end

  // FSM : nxt_state
  always @(*) begin
    case( cur_state )
      IDLE :    begin    if( sysif_start_i )       nxt_state = FILL ;
                         else                      nxt_state = IDLE ;
                end
      FILL :    begin    if( fill_done_w )         nxt_state = FtoS ;
                         else                      nxt_state = FILL ;
                end

      FtoS :    begin                              nxt_state = SCAN ;
                end

      SCAN :    begin    if( deci_start_w )        nxt_state = DECI ;
                         else if( scan_done_w )    nxt_state = FILL ;
                         else                      nxt_state = SCAN ;
                end
      DECI :    begin    if( deci_done_w )         nxt_state = DUMP ;
                         else                      nxt_state = DECI ;
                end
      DUMP :    begin    if( dump_done_w )         nxt_state = IDLE ;
                         else                      nxt_state = DUMP ;
                end
      default :                                    nxt_state = IDLE ;
    endcase
  end


//*** INNER CONTROL ********************

  // y_cnt_r
  always @(posedge clk or negedge rstn) begin
    if( !rstn )
      y_cnt_r <= 0 ;
    else begin
      case( cur_state )
        IDLE : begin                              y_cnt_r <= 0 ;
               end
        FILL : begin                              y_cnt_r <= y_cnt_r + 1 ;
               end
        FtoS : begin                              y_cnt_r <= y_cnt_r + 1 ;
               end
        SCAN : begin    if( deci_start_w )        y_cnt_r <= -4 ;
                        else if( scan_done_w )    y_cnt_r <= 0 ;
                        else                      y_cnt_r <= y_cnt_r + 1 ;
               end
        DECI : begin    if( deci_done_w )         y_cnt_r <= 0 ;
                        else                      y_cnt_r <= y_cnt_r + 1 ;
               end
        DUMP : begin    if( dump_done_w )         y_cnt_r <= 0 ;
                        else                      y_cnt_r <= y_cnt_r + 1 ;
               end
      endcase
    end
  end

  // block_r
  always @(posedge clk or negedge rstn) begin
    if( !rstn )
      block_r <= 0 ;
    else begin
      case( cur_state )
        IDLE : begin                         block_r <= 0 ;
               end
        SCAN : begin    if( scan_done_w )    block_r <= block_r + 1 ;
               end
      endcase
    end
  end

  // y_base_w
  assign y_base_w = block_r<<4 ;

  // x_base_r
  always @(posedge clk or negedge rstn) begin
    if( !rstn )
      x_base_r <= 0 ;
    else begin
      case( cur_state )
        IDLE : begin                                      x_base_r <= 0 ;
               end
        SCAN : begin    if( (block_r==3)&scan_done_w )    x_base_r <= x_base_r + 1 ;
               end
      endcase
    end
  end

  // start_w & done_w
  assign fill_done_w  = y_cnt_r==14 ;
  assign scan_done_w  = y_cnt_r==39 ;
  assign deci_start_w = (block_r==3)&(x_base_r==24)&scan_done_w ;
  assign deci_done_w  = y_cnt_r==20 ;
  assign dump_done_w  = y_cnt_r==63 ;

  assign deci_doing_w = (cur_state==DECI) ;


//*** STAGE 0 **************************

  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      sysif_done_o <= 0 ;
    else begin
      sysif_done_o <= (cur_state==DUMP) & (nxt_state==IDLE) ;
    end
  end

  assign curif_en_o      = (cur_state==FILL) | (cur_state==FtoS) ;
  assign curif_num_o     = y_cnt_r + y_base_w ;

  assign fetchif_ref_x_o = x_base_r ;
  assign fetchif_ref_y_o = y_cnt_r + y_base_w ;
  assign fetchif_load_o  = (cur_state==FILL) | (cur_state==FtoS) | (cur_state==SCAN) ;

  assign fmeif_en_o      = (cur_state==DUMP) ;
  assign fmeif_cu_num_o  = y_cnt_r ;
  assign fmeif_mv_o      = { mv_x_dump_r ,mv_y_dump_r };



//*** STAGE 1 **************************

  // systolic array
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_dat_w    , ori_dat_w    ;
    reg                           ref_val_r    , ori_val_r    ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_00_w     , ori_00_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_01_w     , ori_01_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_02_w     , ori_02_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_03_w     , ori_03_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_04_w     , ori_04_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_05_w     , ori_05_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_06_w     , ori_06_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_07_w     , ori_07_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_08_w     , ori_08_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_09_w     , ori_09_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_10_w     , ori_10_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_11_w     , ori_11_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_12_w     , ori_12_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_13_w     , ori_13_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_14_w     , ori_14_w     ;
  wire [`PIXEL_WIDTH*64-1 : 0]    ref_15_w     , ori_15_w     ;

  // ori_val_w & ref_dat_w
  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      ori_val_r <= 0 ;
      ref_val_r <= 0 ;
    end
    else begin
      ori_val_r <= curif_en_o ;
      ref_val_r <= fetchif_load_o ;
    end
  end

  assign ori_dat_w = curif_data_i ;
  assign ref_dat_w = fetchif_data_i ;

  ime_systolic_array ref(
    // global
    .clk             ( clk          ),
    .rstn            ( rstn         ),
    // shift_i
    .shift_en_i      ( ref_val_r    ),
    .shift_data_i    ( ref_dat_w    ),
    // data_o
    .pixel_00_o      ( ref_00_w     ),
    .pixel_01_o      ( ref_01_w     ),
    .pixel_02_o      ( ref_02_w     ),
    .pixel_03_o      ( ref_03_w     ),
    .pixel_04_o      ( ref_04_w     ),
    .pixel_05_o      ( ref_05_w     ),
    .pixel_06_o      ( ref_06_w     ),
    .pixel_07_o      ( ref_07_w     ),
    .pixel_08_o      ( ref_08_w     ),
    .pixel_09_o      ( ref_09_w     ),
    .pixel_10_o      ( ref_10_w     ),
    .pixel_11_o      ( ref_11_w     ),
    .pixel_12_o      ( ref_12_w     ),
    .pixel_13_o      ( ref_13_w     ),
    .pixel_14_o      ( ref_14_w     ),
    .pixel_15_o      ( ref_15_w     )
    );

  ime_systolic_array ori(
    // global
    .clk             ( clk          ),
    .rstn            ( rstn         ),
    // shift_i
    .shift_en_i      ( ori_val_r    ),
    .shift_data_i    ( ori_dat_w    ),
    // data_o
    .pixel_00_o      ( ori_00_w     ),
    .pixel_01_o      ( ori_01_w     ),
    .pixel_02_o      ( ori_02_w     ),
    .pixel_03_o      ( ori_03_w     ),
    .pixel_04_o      ( ori_04_w     ),
    .pixel_05_o      ( ori_05_w     ),
    .pixel_06_o      ( ori_06_w     ),
    .pixel_07_o      ( ori_07_w     ),
    .pixel_08_o      ( ori_08_w     ),
    .pixel_09_o      ( ori_09_w     ),
    .pixel_10_o      ( ori_10_w     ),
    .pixel_11_o      ( ori_11_w     ),
    .pixel_12_o      ( ori_12_w     ),
    .pixel_13_o      ( ori_13_w     ),
    .pixel_14_o      ( ori_14_w     ),
    .pixel_15_o      ( ori_15_w     )
    );

//*** STAGE 2 **************************

  // sad_8x8
  genvar                                gv_i            ;
  wire                                  sad_8x8_ena_w   ;
    reg                                 sad_8x8_ena_0_r ;
    reg                                 sad_8x8_ena_1_r ;
  wire   [(`PIXEL_WIDTH+6)*8-1 : 0]     sad_8x8_r_0_w   ;
  wire   [(`PIXEL_WIDTH+6)*8-1 : 0]     sad_8x8_r_1_w   ;

  // sad_8x8_ena_w
  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      sad_8x8_ena_0_r <= 0 ;
      sad_8x8_ena_1_r <= 0 ;
    end
    else begin
      sad_8x8_ena_0_r <= (cur_state==FtoS) | (cur_state==SCAN) ;
      sad_8x8_ena_1_r <= sad_8x8_ena_0_r ;
    end
  end

  assign sad_8x8_ena_w = sad_8x8_ena_1_r ;

  generate
    for( gv_i=0 ;gv_i<8 ; gv_i=gv_i+1 ) begin : sad_line_0
      ime_sad_8x8 block_8x64_0(
        // global
        .clk         ( clk              ),
        .rstn        ( rstn             ),
        // dat_i
        .enable_i    ( sad_8x8_ena_w    ),
        .ori_i       ( { ori_07_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_06_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_05_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_04_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_03_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_02_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_01_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_00_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] }
                                        ),
        .ref_i       ( { ref_07_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_06_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_05_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_04_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_03_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_02_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_01_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_00_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] }
                                        ),
        // dat_o
        .sad_o       ( sad_8x8_r_0_w[(`PIXEL_WIDTH+6)*(gv_i+1)-1:(`PIXEL_WIDTH+6)*gv_i]
                                        )
        );
    end
  endgenerate

  generate
    for( gv_i=0 ;gv_i<8 ; gv_i=gv_i+1 ) begin : sad_line_1
      ime_sad_8x8 block_8x64_1(
        // global
        .clk         ( clk              ),
        .rstn        ( rstn             ),
        // dat_i
        .enable_i    ( sad_8x8_ena_w    ),
        .ori_i       ( { ori_15_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_14_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_13_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_12_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_11_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_10_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_09_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ori_08_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] }
                                        ),
        .ref_i       ( { ref_15_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_14_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_13_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_12_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_11_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_10_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_09_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] ,
                         ref_08_w[`PIXEL_WIDTH*8*(gv_i+1)-1:`PIXEL_WIDTH*8*gv_i] }
                                        ),
        // dat_o
        .sad_o       ( sad_8x8_r_1_w[(`PIXEL_WIDTH+6)*(gv_i+1)-1:(`PIXEL_WIDTH+6)*gv_i]
                                        )
        );
    end
  endgenerate

//*** STAGE 3 **************************

  `define COST_WIDTH (`PIXEL_WIDTH+12)

  // best_mv_below_16
  wire                           sad_8x8_val_w  ;
    reg                          sad_8x8_val_r  ;
  wire [1              : 0]      block_8x8_w    ;
    reg  [1              : 0]    block_8x8_r    ;
  wire [`IMV_WIDTH-1   : 0]      mv_x_8x8_w     ;
    reg  [`IMV_WIDTH-1   : 0]      mv_x_8x8_r   ;
  wire [`IMV_WIDTH-1   : 0]      mv_y_8x8_w     ;
    reg  [`IMV_WIDTH-1   : 0]      mv_y_8x8_r   ;

  wire [`COST_WIDTH-1    : 0]    cost_best_w    ;


  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_30_w ;
  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_31_w ;
  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_32_w ;
  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_33_w ;

  // cost_w
  // cost_08x08
  wire [`COST_WIDTH-1  : 0]    cost_08x08_00_w    , cost_08x08_10_w    , cost_08x08_20_w    , cost_08x08_30_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_01_w    , cost_08x08_11_w    , cost_08x08_21_w    , cost_08x08_31_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_02_w    , cost_08x08_12_w    , cost_08x08_22_w    , cost_08x08_32_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_03_w    , cost_08x08_13_w    , cost_08x08_23_w    , cost_08x08_33_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_04_w    , cost_08x08_14_w    , cost_08x08_24_w    , cost_08x08_34_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_05_w    , cost_08x08_15_w    , cost_08x08_25_w    , cost_08x08_35_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_06_w    , cost_08x08_16_w    , cost_08x08_26_w    , cost_08x08_36_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_07_w    , cost_08x08_17_w    , cost_08x08_27_w    , cost_08x08_37_w    ;

  wire [`COST_WIDTH-1  : 0]    cost_08x08_40_w    , cost_08x08_50_w    , cost_08x08_60_w    , cost_08x08_70_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_41_w    , cost_08x08_51_w    , cost_08x08_61_w    , cost_08x08_71_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_42_w    , cost_08x08_52_w    , cost_08x08_62_w    , cost_08x08_72_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_43_w    , cost_08x08_53_w    , cost_08x08_63_w    , cost_08x08_73_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_44_w    , cost_08x08_54_w    , cost_08x08_64_w    , cost_08x08_74_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_45_w    , cost_08x08_55_w    , cost_08x08_65_w    , cost_08x08_75_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_46_w    , cost_08x08_56_w    , cost_08x08_66_w    , cost_08x08_76_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x08_47_w    , cost_08x08_57_w    , cost_08x08_67_w    , cost_08x08_77_w    ;
  // cost_08x16
  wire [`COST_WIDTH-1  : 0]    cost_08x16_00_w    , cost_08x16_20_w    , cost_08x16_40_w    , cost_08x16_60_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_01_w    , cost_08x16_21_w    , cost_08x16_41_w    , cost_08x16_61_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_02_w    , cost_08x16_22_w    , cost_08x16_42_w    , cost_08x16_62_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_03_w    , cost_08x16_23_w    , cost_08x16_43_w    , cost_08x16_63_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_04_w    , cost_08x16_24_w    , cost_08x16_44_w    , cost_08x16_64_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_05_w    , cost_08x16_25_w    , cost_08x16_45_w    , cost_08x16_65_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_06_w    , cost_08x16_26_w    , cost_08x16_46_w    , cost_08x16_66_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_08x16_07_w    , cost_08x16_27_w    , cost_08x16_47_w    , cost_08x16_67_w    ;
  // cost_16x08
  wire [`COST_WIDTH-1  : 0]    cost_16x08_00_w    , cost_16x08_20_w    , cost_16x08_40_w    , cost_16x08_60_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_10_w    , cost_16x08_30_w    , cost_16x08_50_w    , cost_16x08_70_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_02_w    , cost_16x08_22_w    , cost_16x08_42_w    , cost_16x08_62_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_12_w    , cost_16x08_32_w    , cost_16x08_52_w    , cost_16x08_72_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_04_w    , cost_16x08_24_w    , cost_16x08_44_w    , cost_16x08_64_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_14_w    , cost_16x08_34_w    , cost_16x08_54_w    , cost_16x08_74_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_06_w    , cost_16x08_26_w    , cost_16x08_46_w    , cost_16x08_66_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x08_16_w    , cost_16x08_36_w    , cost_16x08_56_w    , cost_16x08_76_w    ;
  // cost_16x16
  wire [`COST_WIDTH-1  : 0]    cost_16x16_00_w    , cost_16x16_20_w    , cost_16x16_40_w    , cost_16x16_60_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x16_02_w    , cost_16x16_22_w    , cost_16x16_42_w    , cost_16x16_62_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x16_04_w    , cost_16x16_24_w    , cost_16x16_44_w    , cost_16x16_64_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x16_06_w    , cost_16x16_26_w    , cost_16x16_46_w    , cost_16x16_66_w    ;

  // mv_w
  // mv_x_08x08
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_00_w    , mv_x_08x08_10_w    , mv_x_08x08_20_w    , mv_x_08x08_30_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_01_w    , mv_x_08x08_11_w    , mv_x_08x08_21_w    , mv_x_08x08_31_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_02_w    , mv_x_08x08_12_w    , mv_x_08x08_22_w    , mv_x_08x08_32_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_03_w    , mv_x_08x08_13_w    , mv_x_08x08_23_w    , mv_x_08x08_33_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_04_w    , mv_x_08x08_14_w    , mv_x_08x08_24_w    , mv_x_08x08_34_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_05_w    , mv_x_08x08_15_w    , mv_x_08x08_25_w    , mv_x_08x08_35_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_06_w    , mv_x_08x08_16_w    , mv_x_08x08_26_w    , mv_x_08x08_36_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_07_w    , mv_x_08x08_17_w    , mv_x_08x08_27_w    , mv_x_08x08_37_w    ;

  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_40_w    , mv_x_08x08_50_w    , mv_x_08x08_60_w    , mv_x_08x08_70_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_41_w    , mv_x_08x08_51_w    , mv_x_08x08_61_w    , mv_x_08x08_71_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_42_w    , mv_x_08x08_52_w    , mv_x_08x08_62_w    , mv_x_08x08_72_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_43_w    , mv_x_08x08_53_w    , mv_x_08x08_63_w    , mv_x_08x08_73_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_44_w    , mv_x_08x08_54_w    , mv_x_08x08_64_w    , mv_x_08x08_74_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_45_w    , mv_x_08x08_55_w    , mv_x_08x08_65_w    , mv_x_08x08_75_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_46_w    , mv_x_08x08_56_w    , mv_x_08x08_66_w    , mv_x_08x08_76_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x08_47_w    , mv_x_08x08_57_w    , mv_x_08x08_67_w    , mv_x_08x08_77_w    ;
  // mv_y_08x08
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_00_w    , mv_y_08x08_10_w    , mv_y_08x08_20_w    , mv_y_08x08_30_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_01_w    , mv_y_08x08_11_w    , mv_y_08x08_21_w    , mv_y_08x08_31_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_02_w    , mv_y_08x08_12_w    , mv_y_08x08_22_w    , mv_y_08x08_32_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_03_w    , mv_y_08x08_13_w    , mv_y_08x08_23_w    , mv_y_08x08_33_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_04_w    , mv_y_08x08_14_w    , mv_y_08x08_24_w    , mv_y_08x08_34_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_05_w    , mv_y_08x08_15_w    , mv_y_08x08_25_w    , mv_y_08x08_35_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_06_w    , mv_y_08x08_16_w    , mv_y_08x08_26_w    , mv_y_08x08_36_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_07_w    , mv_y_08x08_17_w    , mv_y_08x08_27_w    , mv_y_08x08_37_w    ;

  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_40_w    , mv_y_08x08_50_w    , mv_y_08x08_60_w    , mv_y_08x08_70_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_41_w    , mv_y_08x08_51_w    , mv_y_08x08_61_w    , mv_y_08x08_71_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_42_w    , mv_y_08x08_52_w    , mv_y_08x08_62_w    , mv_y_08x08_72_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_43_w    , mv_y_08x08_53_w    , mv_y_08x08_63_w    , mv_y_08x08_73_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_44_w    , mv_y_08x08_54_w    , mv_y_08x08_64_w    , mv_y_08x08_74_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_45_w    , mv_y_08x08_55_w    , mv_y_08x08_65_w    , mv_y_08x08_75_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_46_w    , mv_y_08x08_56_w    , mv_y_08x08_66_w    , mv_y_08x08_76_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x08_47_w    , mv_y_08x08_57_w    , mv_y_08x08_67_w    , mv_y_08x08_77_w    ;
  // mv_x_08x16
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x16_00_w    , mv_x_08x16_20_w    , mv_x_08x16_40_w    , mv_x_08x16_60_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x16_01_w    , mv_x_08x16_21_w    , mv_x_08x16_41_w    , mv_x_08x16_61_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x16_02_w    , mv_x_08x16_22_w    , mv_x_08x16_42_w    , mv_x_08x16_62_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x16_03_w    , mv_x_08x16_23_w    , mv_x_08x16_43_w    , mv_x_08x16_63_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x16_04_w    , mv_x_08x16_24_w    , mv_x_08x16_44_w    , mv_x_08x16_64_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x16_05_w    , mv_x_08x16_25_w    , mv_x_08x16_45_w    , mv_x_08x16_65_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x16_06_w    , mv_x_08x16_26_w    , mv_x_08x16_46_w    , mv_x_08x16_66_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_08x16_07_w    , mv_x_08x16_27_w    , mv_x_08x16_47_w    , mv_x_08x16_67_w    ;
  // mv_y_08x16
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x16_00_w    , mv_y_08x16_20_w    , mv_y_08x16_40_w    , mv_y_08x16_60_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x16_01_w    , mv_y_08x16_21_w    , mv_y_08x16_41_w    , mv_y_08x16_61_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x16_02_w    , mv_y_08x16_22_w    , mv_y_08x16_42_w    , mv_y_08x16_62_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x16_03_w    , mv_y_08x16_23_w    , mv_y_08x16_43_w    , mv_y_08x16_63_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x16_04_w    , mv_y_08x16_24_w    , mv_y_08x16_44_w    , mv_y_08x16_64_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x16_05_w    , mv_y_08x16_25_w    , mv_y_08x16_45_w    , mv_y_08x16_65_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x16_06_w    , mv_y_08x16_26_w    , mv_y_08x16_46_w    , mv_y_08x16_66_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_08x16_07_w    , mv_y_08x16_27_w    , mv_y_08x16_47_w    , mv_y_08x16_67_w    ;
  // mv_x_16x08
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x08_00_w    , mv_x_16x08_20_w    , mv_x_16x08_40_w    , mv_x_16x08_60_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x08_10_w    , mv_x_16x08_30_w    , mv_x_16x08_50_w    , mv_x_16x08_70_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x08_02_w    , mv_x_16x08_22_w    , mv_x_16x08_42_w    , mv_x_16x08_62_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x08_12_w    , mv_x_16x08_32_w    , mv_x_16x08_52_w    , mv_x_16x08_72_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x08_04_w    , mv_x_16x08_24_w    , mv_x_16x08_44_w    , mv_x_16x08_64_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x08_14_w    , mv_x_16x08_34_w    , mv_x_16x08_54_w    , mv_x_16x08_74_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x08_06_w    , mv_x_16x08_26_w    , mv_x_16x08_46_w    , mv_x_16x08_66_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x08_16_w    , mv_x_16x08_36_w    , mv_x_16x08_56_w    , mv_x_16x08_76_w    ;
  // mv_y_16x08
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x08_00_w    , mv_y_16x08_20_w    , mv_y_16x08_40_w    , mv_y_16x08_60_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x08_10_w    , mv_y_16x08_30_w    , mv_y_16x08_50_w    , mv_y_16x08_70_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x08_02_w    , mv_y_16x08_22_w    , mv_y_16x08_42_w    , mv_y_16x08_62_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x08_12_w    , mv_y_16x08_32_w    , mv_y_16x08_52_w    , mv_y_16x08_72_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x08_04_w    , mv_y_16x08_24_w    , mv_y_16x08_44_w    , mv_y_16x08_64_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x08_14_w    , mv_y_16x08_34_w    , mv_y_16x08_54_w    , mv_y_16x08_74_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x08_06_w    , mv_y_16x08_26_w    , mv_y_16x08_46_w    , mv_y_16x08_66_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x08_16_w    , mv_y_16x08_36_w    , mv_y_16x08_56_w    , mv_y_16x08_76_w    ;
  // mv_x_16x16
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x16_00_w    , mv_x_16x16_20_w    , mv_x_16x16_40_w    , mv_x_16x16_60_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x16_02_w    , mv_x_16x16_22_w    , mv_x_16x16_42_w    , mv_x_16x16_62_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x16_04_w    , mv_x_16x16_24_w    , mv_x_16x16_44_w    , mv_x_16x16_64_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x16_06_w    , mv_x_16x16_26_w    , mv_x_16x16_46_w    , mv_x_16x16_66_w    ;
  // mv_y_16x16
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x16_00_w    , mv_y_16x16_20_w    , mv_y_16x16_40_w    , mv_y_16x16_60_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x16_02_w    , mv_y_16x16_22_w    , mv_y_16x16_42_w    , mv_y_16x16_62_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x16_04_w    , mv_y_16x16_24_w    , mv_y_16x16_44_w    , mv_y_16x16_64_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x16_06_w    , mv_y_16x16_26_w    , mv_y_16x16_46_w    , mv_y_16x16_66_w    ;

  // sad_8x8_val_w
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      sad_8x8_val_r <= 0 ;
    else begin
      sad_8x8_val_r <= sad_8x8_ena_w ;
    end
  end

  assign sad_8x8_val_w = sad_8x8_val_r ;

  // mv_y_8x8_w
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      mv_y_8x8_r <= 0 ;
    else if( !sad_8x8_val_w )
      mv_y_8x8_r <= 0 ;
    else begin
      mv_y_8x8_r <= mv_y_8x8_r + 1 ;
    end
  end

  assign mv_y_8x8_w = mv_y_8x8_r ;

  // mv_x_8x8_w
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      mv_x_8x8_r <= 0 ;
    else if( sysif_start_i )
      mv_x_8x8_r <= 0 ;
    else if( (mv_y_8x8_w==24)&(block_8x8_w==3) ) begin
      mv_x_8x8_r <= mv_x_8x8_r + 1 ;
    end
  end

  assign mv_x_8x8_w = mv_x_8x8_r ;

  // block_8x8_w
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      block_8x8_r <= 0 ;
    else if( mv_y_8x8_w==24 ) begin
      block_8x8_r <= block_8x8_r + 1 ;
    end
  end

  assign block_8x8_w = block_8x8_r ;

  ime_best_mv_below_16 best_mv_below_16(
    // global
    .clk                ( clk               ),
    .rstn               ( rstn              ),

    // ctrl_i
    .start_i            ( sysif_start_i     ),
    .val_i              ( sad_8x8_val_w     ),
    .block_i            ( block_8x8_w       ),
    .qp_i               ( sysif_qp_i        ),

    // update_i
    .update_wrk_i       ( deci_doing_w      ),
    .update_cnt_i       ( y_cnt_r           ),
    .update_cst_i       ( cost_best_w       ),

    // sad_i
    .sad_08x08_00_i     ( sad_8x8_r_0_w[(`PIXEL_WIDTH+6)*(07+1)-1:(`PIXEL_WIDTH+6)*07]    ),
    .sad_08x08_01_i     ( sad_8x8_r_0_w[(`PIXEL_WIDTH+6)*(06+1)-1:(`PIXEL_WIDTH+6)*06]    ),
    .sad_08x08_02_i     ( sad_8x8_r_0_w[(`PIXEL_WIDTH+6)*(05+1)-1:(`PIXEL_WIDTH+6)*05]    ),
    .sad_08x08_03_i     ( sad_8x8_r_0_w[(`PIXEL_WIDTH+6)*(04+1)-1:(`PIXEL_WIDTH+6)*04]    ),
    .sad_08x08_04_i     ( sad_8x8_r_0_w[(`PIXEL_WIDTH+6)*(03+1)-1:(`PIXEL_WIDTH+6)*03]    ),
    .sad_08x08_05_i     ( sad_8x8_r_0_w[(`PIXEL_WIDTH+6)*(02+1)-1:(`PIXEL_WIDTH+6)*02]    ),
    .sad_08x08_06_i     ( sad_8x8_r_0_w[(`PIXEL_WIDTH+6)*(01+1)-1:(`PIXEL_WIDTH+6)*01]    ),
    .sad_08x08_07_i     ( sad_8x8_r_0_w[(`PIXEL_WIDTH+6)*(00+1)-1:(`PIXEL_WIDTH+6)*00]    ),

    .sad_08x08_10_i     ( sad_8x8_r_1_w[(`PIXEL_WIDTH+6)*(07+1)-1:(`PIXEL_WIDTH+6)*07]    ),
    .sad_08x08_11_i     ( sad_8x8_r_1_w[(`PIXEL_WIDTH+6)*(06+1)-1:(`PIXEL_WIDTH+6)*06]    ),
    .sad_08x08_12_i     ( sad_8x8_r_1_w[(`PIXEL_WIDTH+6)*(05+1)-1:(`PIXEL_WIDTH+6)*05]    ),
    .sad_08x08_13_i     ( sad_8x8_r_1_w[(`PIXEL_WIDTH+6)*(04+1)-1:(`PIXEL_WIDTH+6)*04]    ),
    .sad_08x08_14_i     ( sad_8x8_r_1_w[(`PIXEL_WIDTH+6)*(03+1)-1:(`PIXEL_WIDTH+6)*03]    ),
    .sad_08x08_15_i     ( sad_8x8_r_1_w[(`PIXEL_WIDTH+6)*(02+1)-1:(`PIXEL_WIDTH+6)*02]    ),
    .sad_08x08_16_i     ( sad_8x8_r_1_w[(`PIXEL_WIDTH+6)*(01+1)-1:(`PIXEL_WIDTH+6)*01]    ),
    .sad_08x08_17_i     ( sad_8x8_r_1_w[(`PIXEL_WIDTH+6)*(00+1)-1:(`PIXEL_WIDTH+6)*00]    ),

    // mv_i
    .mv_x_08x08_i       ( mv_x_8x8_w        ),
    .mv_y_08x08_i       ( mv_y_8x8_w        ),

    // sad_o
    .sad_16x16_00_o     ( sad_16x16_30_w    ),
    .sad_16x16_02_o     ( sad_16x16_31_w    ),
    .sad_16x16_04_o     ( sad_16x16_32_w    ),
    .sad_16x16_06_o     ( sad_16x16_33_w    ),

    // cost_o
    // cost_08x08
    .cost_08x08_00_o ( cost_08x08_00_w ), .cost_08x08_10_o ( cost_08x08_10_w ), .cost_08x08_20_o ( cost_08x08_20_w ), .cost_08x08_30_o ( cost_08x08_30_w ),
    .cost_08x08_01_o ( cost_08x08_01_w ), .cost_08x08_11_o ( cost_08x08_11_w ), .cost_08x08_21_o ( cost_08x08_21_w ), .cost_08x08_31_o ( cost_08x08_31_w ),
    .cost_08x08_02_o ( cost_08x08_02_w ), .cost_08x08_12_o ( cost_08x08_12_w ), .cost_08x08_22_o ( cost_08x08_22_w ), .cost_08x08_32_o ( cost_08x08_32_w ),
    .cost_08x08_03_o ( cost_08x08_03_w ), .cost_08x08_13_o ( cost_08x08_13_w ), .cost_08x08_23_o ( cost_08x08_23_w ), .cost_08x08_33_o ( cost_08x08_33_w ),
    .cost_08x08_04_o ( cost_08x08_04_w ), .cost_08x08_14_o ( cost_08x08_14_w ), .cost_08x08_24_o ( cost_08x08_24_w ), .cost_08x08_34_o ( cost_08x08_34_w ),
    .cost_08x08_05_o ( cost_08x08_05_w ), .cost_08x08_15_o ( cost_08x08_15_w ), .cost_08x08_25_o ( cost_08x08_25_w ), .cost_08x08_35_o ( cost_08x08_35_w ),
    .cost_08x08_06_o ( cost_08x08_06_w ), .cost_08x08_16_o ( cost_08x08_16_w ), .cost_08x08_26_o ( cost_08x08_26_w ), .cost_08x08_36_o ( cost_08x08_36_w ),
    .cost_08x08_07_o ( cost_08x08_07_w ), .cost_08x08_17_o ( cost_08x08_17_w ), .cost_08x08_27_o ( cost_08x08_27_w ), .cost_08x08_37_o ( cost_08x08_37_w ),

    .cost_08x08_40_o ( cost_08x08_40_w ), .cost_08x08_50_o ( cost_08x08_50_w ), .cost_08x08_60_o ( cost_08x08_60_w ), .cost_08x08_70_o ( cost_08x08_70_w ),
    .cost_08x08_41_o ( cost_08x08_41_w ), .cost_08x08_51_o ( cost_08x08_51_w ), .cost_08x08_61_o ( cost_08x08_61_w ), .cost_08x08_71_o ( cost_08x08_71_w ),
    .cost_08x08_42_o ( cost_08x08_42_w ), .cost_08x08_52_o ( cost_08x08_52_w ), .cost_08x08_62_o ( cost_08x08_62_w ), .cost_08x08_72_o ( cost_08x08_72_w ),
    .cost_08x08_43_o ( cost_08x08_43_w ), .cost_08x08_53_o ( cost_08x08_53_w ), .cost_08x08_63_o ( cost_08x08_63_w ), .cost_08x08_73_o ( cost_08x08_73_w ),
    .cost_08x08_44_o ( cost_08x08_44_w ), .cost_08x08_54_o ( cost_08x08_54_w ), .cost_08x08_64_o ( cost_08x08_64_w ), .cost_08x08_74_o ( cost_08x08_74_w ),
    .cost_08x08_45_o ( cost_08x08_45_w ), .cost_08x08_55_o ( cost_08x08_55_w ), .cost_08x08_65_o ( cost_08x08_65_w ), .cost_08x08_75_o ( cost_08x08_75_w ),
    .cost_08x08_46_o ( cost_08x08_46_w ), .cost_08x08_56_o ( cost_08x08_56_w ), .cost_08x08_66_o ( cost_08x08_66_w ), .cost_08x08_76_o ( cost_08x08_76_w ),
    .cost_08x08_47_o ( cost_08x08_47_w ), .cost_08x08_57_o ( cost_08x08_57_w ), .cost_08x08_67_o ( cost_08x08_67_w ), .cost_08x08_77_o ( cost_08x08_77_w ),
    // cost_08x16
    .cost_08x16_00_o ( cost_08x16_00_w ), .cost_08x16_20_o ( cost_08x16_20_w ), .cost_08x16_40_o ( cost_08x16_40_w ), .cost_08x16_60_o ( cost_08x16_60_w ),
    .cost_08x16_01_o ( cost_08x16_01_w ), .cost_08x16_21_o ( cost_08x16_21_w ), .cost_08x16_41_o ( cost_08x16_41_w ), .cost_08x16_61_o ( cost_08x16_61_w ),
    .cost_08x16_02_o ( cost_08x16_02_w ), .cost_08x16_22_o ( cost_08x16_22_w ), .cost_08x16_42_o ( cost_08x16_42_w ), .cost_08x16_62_o ( cost_08x16_62_w ),
    .cost_08x16_03_o ( cost_08x16_03_w ), .cost_08x16_23_o ( cost_08x16_23_w ), .cost_08x16_43_o ( cost_08x16_43_w ), .cost_08x16_63_o ( cost_08x16_63_w ),
    .cost_08x16_04_o ( cost_08x16_04_w ), .cost_08x16_24_o ( cost_08x16_24_w ), .cost_08x16_44_o ( cost_08x16_44_w ), .cost_08x16_64_o ( cost_08x16_64_w ),
    .cost_08x16_05_o ( cost_08x16_05_w ), .cost_08x16_25_o ( cost_08x16_25_w ), .cost_08x16_45_o ( cost_08x16_45_w ), .cost_08x16_65_o ( cost_08x16_65_w ),
    .cost_08x16_06_o ( cost_08x16_06_w ), .cost_08x16_26_o ( cost_08x16_26_w ), .cost_08x16_46_o ( cost_08x16_46_w ), .cost_08x16_66_o ( cost_08x16_66_w ),
    .cost_08x16_07_o ( cost_08x16_07_w ), .cost_08x16_27_o ( cost_08x16_27_w ), .cost_08x16_47_o ( cost_08x16_47_w ), .cost_08x16_67_o ( cost_08x16_67_w ),
    // cost_16x08
    .cost_16x08_00_o ( cost_16x08_00_w ), .cost_16x08_20_o ( cost_16x08_20_w ), .cost_16x08_40_o ( cost_16x08_40_w ), .cost_16x08_60_o ( cost_16x08_60_w ),
    .cost_16x08_10_o ( cost_16x08_10_w ), .cost_16x08_30_o ( cost_16x08_30_w ), .cost_16x08_50_o ( cost_16x08_50_w ), .cost_16x08_70_o ( cost_16x08_70_w ),
    .cost_16x08_02_o ( cost_16x08_02_w ), .cost_16x08_22_o ( cost_16x08_22_w ), .cost_16x08_42_o ( cost_16x08_42_w ), .cost_16x08_62_o ( cost_16x08_62_w ),
    .cost_16x08_12_o ( cost_16x08_12_w ), .cost_16x08_32_o ( cost_16x08_32_w ), .cost_16x08_52_o ( cost_16x08_52_w ), .cost_16x08_72_o ( cost_16x08_72_w ),
    .cost_16x08_04_o ( cost_16x08_04_w ), .cost_16x08_24_o ( cost_16x08_24_w ), .cost_16x08_44_o ( cost_16x08_44_w ), .cost_16x08_64_o ( cost_16x08_64_w ),
    .cost_16x08_14_o ( cost_16x08_14_w ), .cost_16x08_34_o ( cost_16x08_34_w ), .cost_16x08_54_o ( cost_16x08_54_w ), .cost_16x08_74_o ( cost_16x08_74_w ),
    .cost_16x08_06_o ( cost_16x08_06_w ), .cost_16x08_26_o ( cost_16x08_26_w ), .cost_16x08_46_o ( cost_16x08_46_w ), .cost_16x08_66_o ( cost_16x08_66_w ),
    .cost_16x08_16_o ( cost_16x08_16_w ), .cost_16x08_36_o ( cost_16x08_36_w ), .cost_16x08_56_o ( cost_16x08_56_w ), .cost_16x08_76_o ( cost_16x08_76_w ),
    // cost_16x16
    .cost_16x16_00_o ( cost_16x16_00_w ), .cost_16x16_20_o ( cost_16x16_20_w ), .cost_16x16_40_o ( cost_16x16_40_w ), .cost_16x16_60_o ( cost_16x16_60_w ),
    .cost_16x16_02_o ( cost_16x16_02_w ), .cost_16x16_22_o ( cost_16x16_22_w ), .cost_16x16_42_o ( cost_16x16_42_w ), .cost_16x16_62_o ( cost_16x16_62_w ),
    .cost_16x16_04_o ( cost_16x16_04_w ), .cost_16x16_24_o ( cost_16x16_24_w ), .cost_16x16_44_o ( cost_16x16_44_w ), .cost_16x16_64_o ( cost_16x16_64_w ),
    .cost_16x16_06_o ( cost_16x16_06_w ), .cost_16x16_26_o ( cost_16x16_26_w ), .cost_16x16_46_o ( cost_16x16_46_w ), .cost_16x16_66_o ( cost_16x16_66_w ),

    // mv_x
    // mv_x_08x08
    .mv_x_08x08_00_o ( mv_x_08x08_00_w ), .mv_x_08x08_10_o ( mv_x_08x08_10_w ), .mv_x_08x08_20_o ( mv_x_08x08_20_w ), .mv_x_08x08_30_o ( mv_x_08x08_30_w ),
    .mv_x_08x08_01_o ( mv_x_08x08_01_w ), .mv_x_08x08_11_o ( mv_x_08x08_11_w ), .mv_x_08x08_21_o ( mv_x_08x08_21_w ), .mv_x_08x08_31_o ( mv_x_08x08_31_w ),
    .mv_x_08x08_02_o ( mv_x_08x08_02_w ), .mv_x_08x08_12_o ( mv_x_08x08_12_w ), .mv_x_08x08_22_o ( mv_x_08x08_22_w ), .mv_x_08x08_32_o ( mv_x_08x08_32_w ),
    .mv_x_08x08_03_o ( mv_x_08x08_03_w ), .mv_x_08x08_13_o ( mv_x_08x08_13_w ), .mv_x_08x08_23_o ( mv_x_08x08_23_w ), .mv_x_08x08_33_o ( mv_x_08x08_33_w ),
    .mv_x_08x08_04_o ( mv_x_08x08_04_w ), .mv_x_08x08_14_o ( mv_x_08x08_14_w ), .mv_x_08x08_24_o ( mv_x_08x08_24_w ), .mv_x_08x08_34_o ( mv_x_08x08_34_w ),
    .mv_x_08x08_05_o ( mv_x_08x08_05_w ), .mv_x_08x08_15_o ( mv_x_08x08_15_w ), .mv_x_08x08_25_o ( mv_x_08x08_25_w ), .mv_x_08x08_35_o ( mv_x_08x08_35_w ),
    .mv_x_08x08_06_o ( mv_x_08x08_06_w ), .mv_x_08x08_16_o ( mv_x_08x08_16_w ), .mv_x_08x08_26_o ( mv_x_08x08_26_w ), .mv_x_08x08_36_o ( mv_x_08x08_36_w ),
    .mv_x_08x08_07_o ( mv_x_08x08_07_w ), .mv_x_08x08_17_o ( mv_x_08x08_17_w ), .mv_x_08x08_27_o ( mv_x_08x08_27_w ), .mv_x_08x08_37_o ( mv_x_08x08_37_w ),

    .mv_x_08x08_40_o ( mv_x_08x08_40_w ), .mv_x_08x08_50_o ( mv_x_08x08_50_w ), .mv_x_08x08_60_o ( mv_x_08x08_60_w ), .mv_x_08x08_70_o ( mv_x_08x08_70_w ),
    .mv_x_08x08_41_o ( mv_x_08x08_41_w ), .mv_x_08x08_51_o ( mv_x_08x08_51_w ), .mv_x_08x08_61_o ( mv_x_08x08_61_w ), .mv_x_08x08_71_o ( mv_x_08x08_71_w ),
    .mv_x_08x08_42_o ( mv_x_08x08_42_w ), .mv_x_08x08_52_o ( mv_x_08x08_52_w ), .mv_x_08x08_62_o ( mv_x_08x08_62_w ), .mv_x_08x08_72_o ( mv_x_08x08_72_w ),
    .mv_x_08x08_43_o ( mv_x_08x08_43_w ), .mv_x_08x08_53_o ( mv_x_08x08_53_w ), .mv_x_08x08_63_o ( mv_x_08x08_63_w ), .mv_x_08x08_73_o ( mv_x_08x08_73_w ),
    .mv_x_08x08_44_o ( mv_x_08x08_44_w ), .mv_x_08x08_54_o ( mv_x_08x08_54_w ), .mv_x_08x08_64_o ( mv_x_08x08_64_w ), .mv_x_08x08_74_o ( mv_x_08x08_74_w ),
    .mv_x_08x08_45_o ( mv_x_08x08_45_w ), .mv_x_08x08_55_o ( mv_x_08x08_55_w ), .mv_x_08x08_65_o ( mv_x_08x08_65_w ), .mv_x_08x08_75_o ( mv_x_08x08_75_w ),
    .mv_x_08x08_46_o ( mv_x_08x08_46_w ), .mv_x_08x08_56_o ( mv_x_08x08_56_w ), .mv_x_08x08_66_o ( mv_x_08x08_66_w ), .mv_x_08x08_76_o ( mv_x_08x08_76_w ),
    .mv_x_08x08_47_o ( mv_x_08x08_47_w ), .mv_x_08x08_57_o ( mv_x_08x08_57_w ), .mv_x_08x08_67_o ( mv_x_08x08_67_w ), .mv_x_08x08_77_o ( mv_x_08x08_77_w ),
    // mv_y_08x08
    .mv_y_08x08_00_o ( mv_y_08x08_00_w ), .mv_y_08x08_10_o ( mv_y_08x08_10_w ), .mv_y_08x08_20_o ( mv_y_08x08_20_w ), .mv_y_08x08_30_o ( mv_y_08x08_30_w ),
    .mv_y_08x08_01_o ( mv_y_08x08_01_w ), .mv_y_08x08_11_o ( mv_y_08x08_11_w ), .mv_y_08x08_21_o ( mv_y_08x08_21_w ), .mv_y_08x08_31_o ( mv_y_08x08_31_w ),
    .mv_y_08x08_02_o ( mv_y_08x08_02_w ), .mv_y_08x08_12_o ( mv_y_08x08_12_w ), .mv_y_08x08_22_o ( mv_y_08x08_22_w ), .mv_y_08x08_32_o ( mv_y_08x08_32_w ),
    .mv_y_08x08_03_o ( mv_y_08x08_03_w ), .mv_y_08x08_13_o ( mv_y_08x08_13_w ), .mv_y_08x08_23_o ( mv_y_08x08_23_w ), .mv_y_08x08_33_o ( mv_y_08x08_33_w ),
    .mv_y_08x08_04_o ( mv_y_08x08_04_w ), .mv_y_08x08_14_o ( mv_y_08x08_14_w ), .mv_y_08x08_24_o ( mv_y_08x08_24_w ), .mv_y_08x08_34_o ( mv_y_08x08_34_w ),
    .mv_y_08x08_05_o ( mv_y_08x08_05_w ), .mv_y_08x08_15_o ( mv_y_08x08_15_w ), .mv_y_08x08_25_o ( mv_y_08x08_25_w ), .mv_y_08x08_35_o ( mv_y_08x08_35_w ),
    .mv_y_08x08_06_o ( mv_y_08x08_06_w ), .mv_y_08x08_16_o ( mv_y_08x08_16_w ), .mv_y_08x08_26_o ( mv_y_08x08_26_w ), .mv_y_08x08_36_o ( mv_y_08x08_36_w ),
    .mv_y_08x08_07_o ( mv_y_08x08_07_w ), .mv_y_08x08_17_o ( mv_y_08x08_17_w ), .mv_y_08x08_27_o ( mv_y_08x08_27_w ), .mv_y_08x08_37_o ( mv_y_08x08_37_w ),

    .mv_y_08x08_40_o ( mv_y_08x08_40_w ), .mv_y_08x08_50_o ( mv_y_08x08_50_w ), .mv_y_08x08_60_o ( mv_y_08x08_60_w ), .mv_y_08x08_70_o ( mv_y_08x08_70_w ),
    .mv_y_08x08_41_o ( mv_y_08x08_41_w ), .mv_y_08x08_51_o ( mv_y_08x08_51_w ), .mv_y_08x08_61_o ( mv_y_08x08_61_w ), .mv_y_08x08_71_o ( mv_y_08x08_71_w ),
    .mv_y_08x08_42_o ( mv_y_08x08_42_w ), .mv_y_08x08_52_o ( mv_y_08x08_52_w ), .mv_y_08x08_62_o ( mv_y_08x08_62_w ), .mv_y_08x08_72_o ( mv_y_08x08_72_w ),
    .mv_y_08x08_43_o ( mv_y_08x08_43_w ), .mv_y_08x08_53_o ( mv_y_08x08_53_w ), .mv_y_08x08_63_o ( mv_y_08x08_63_w ), .mv_y_08x08_73_o ( mv_y_08x08_73_w ),
    .mv_y_08x08_44_o ( mv_y_08x08_44_w ), .mv_y_08x08_54_o ( mv_y_08x08_54_w ), .mv_y_08x08_64_o ( mv_y_08x08_64_w ), .mv_y_08x08_74_o ( mv_y_08x08_74_w ),
    .mv_y_08x08_45_o ( mv_y_08x08_45_w ), .mv_y_08x08_55_o ( mv_y_08x08_55_w ), .mv_y_08x08_65_o ( mv_y_08x08_65_w ), .mv_y_08x08_75_o ( mv_y_08x08_75_w ),
    .mv_y_08x08_46_o ( mv_y_08x08_46_w ), .mv_y_08x08_56_o ( mv_y_08x08_56_w ), .mv_y_08x08_66_o ( mv_y_08x08_66_w ), .mv_y_08x08_76_o ( mv_y_08x08_76_w ),
    .mv_y_08x08_47_o ( mv_y_08x08_47_w ), .mv_y_08x08_57_o ( mv_y_08x08_57_w ), .mv_y_08x08_67_o ( mv_y_08x08_67_w ), .mv_y_08x08_77_o ( mv_y_08x08_77_w ),
    // mv_x_08x16
    .mv_x_08x16_00_o ( mv_x_08x16_00_w ), .mv_x_08x16_20_o ( mv_x_08x16_20_w ), .mv_x_08x16_40_o ( mv_x_08x16_40_w ), .mv_x_08x16_60_o ( mv_x_08x16_60_w ),
    .mv_x_08x16_01_o ( mv_x_08x16_01_w ), .mv_x_08x16_21_o ( mv_x_08x16_21_w ), .mv_x_08x16_41_o ( mv_x_08x16_41_w ), .mv_x_08x16_61_o ( mv_x_08x16_61_w ),
    .mv_x_08x16_02_o ( mv_x_08x16_02_w ), .mv_x_08x16_22_o ( mv_x_08x16_22_w ), .mv_x_08x16_42_o ( mv_x_08x16_42_w ), .mv_x_08x16_62_o ( mv_x_08x16_62_w ),
    .mv_x_08x16_03_o ( mv_x_08x16_03_w ), .mv_x_08x16_23_o ( mv_x_08x16_23_w ), .mv_x_08x16_43_o ( mv_x_08x16_43_w ), .mv_x_08x16_63_o ( mv_x_08x16_63_w ),
    .mv_x_08x16_04_o ( mv_x_08x16_04_w ), .mv_x_08x16_24_o ( mv_x_08x16_24_w ), .mv_x_08x16_44_o ( mv_x_08x16_44_w ), .mv_x_08x16_64_o ( mv_x_08x16_64_w ),
    .mv_x_08x16_05_o ( mv_x_08x16_05_w ), .mv_x_08x16_25_o ( mv_x_08x16_25_w ), .mv_x_08x16_45_o ( mv_x_08x16_45_w ), .mv_x_08x16_65_o ( mv_x_08x16_65_w ),
    .mv_x_08x16_06_o ( mv_x_08x16_06_w ), .mv_x_08x16_26_o ( mv_x_08x16_26_w ), .mv_x_08x16_46_o ( mv_x_08x16_46_w ), .mv_x_08x16_66_o ( mv_x_08x16_66_w ),
    .mv_x_08x16_07_o ( mv_x_08x16_07_w ), .mv_x_08x16_27_o ( mv_x_08x16_27_w ), .mv_x_08x16_47_o ( mv_x_08x16_47_w ), .mv_x_08x16_67_o ( mv_x_08x16_67_w ),
    // mv_y_08x16
    .mv_y_08x16_00_o ( mv_y_08x16_00_w ), .mv_y_08x16_20_o ( mv_y_08x16_20_w ), .mv_y_08x16_40_o ( mv_y_08x16_40_w ), .mv_y_08x16_60_o ( mv_y_08x16_60_w ),
    .mv_y_08x16_01_o ( mv_y_08x16_01_w ), .mv_y_08x16_21_o ( mv_y_08x16_21_w ), .mv_y_08x16_41_o ( mv_y_08x16_41_w ), .mv_y_08x16_61_o ( mv_y_08x16_61_w ),
    .mv_y_08x16_02_o ( mv_y_08x16_02_w ), .mv_y_08x16_22_o ( mv_y_08x16_22_w ), .mv_y_08x16_42_o ( mv_y_08x16_42_w ), .mv_y_08x16_62_o ( mv_y_08x16_62_w ),
    .mv_y_08x16_03_o ( mv_y_08x16_03_w ), .mv_y_08x16_23_o ( mv_y_08x16_23_w ), .mv_y_08x16_43_o ( mv_y_08x16_43_w ), .mv_y_08x16_63_o ( mv_y_08x16_63_w ),
    .mv_y_08x16_04_o ( mv_y_08x16_04_w ), .mv_y_08x16_24_o ( mv_y_08x16_24_w ), .mv_y_08x16_44_o ( mv_y_08x16_44_w ), .mv_y_08x16_64_o ( mv_y_08x16_64_w ),
    .mv_y_08x16_05_o ( mv_y_08x16_05_w ), .mv_y_08x16_25_o ( mv_y_08x16_25_w ), .mv_y_08x16_45_o ( mv_y_08x16_45_w ), .mv_y_08x16_65_o ( mv_y_08x16_65_w ),
    .mv_y_08x16_06_o ( mv_y_08x16_06_w ), .mv_y_08x16_26_o ( mv_y_08x16_26_w ), .mv_y_08x16_46_o ( mv_y_08x16_46_w ), .mv_y_08x16_66_o ( mv_y_08x16_66_w ),
    .mv_y_08x16_07_o ( mv_y_08x16_07_w ), .mv_y_08x16_27_o ( mv_y_08x16_27_w ), .mv_y_08x16_47_o ( mv_y_08x16_47_w ), .mv_y_08x16_67_o ( mv_y_08x16_67_w ),
    // mv_x_16x08
    .mv_x_16x08_00_o ( mv_x_16x08_00_w ), .mv_x_16x08_20_o ( mv_x_16x08_20_w ), .mv_x_16x08_40_o ( mv_x_16x08_40_w ), .mv_x_16x08_60_o ( mv_x_16x08_60_w ),
    .mv_x_16x08_10_o ( mv_x_16x08_10_w ), .mv_x_16x08_30_o ( mv_x_16x08_30_w ), .mv_x_16x08_50_o ( mv_x_16x08_50_w ), .mv_x_16x08_70_o ( mv_x_16x08_70_w ),
    .mv_x_16x08_02_o ( mv_x_16x08_02_w ), .mv_x_16x08_22_o ( mv_x_16x08_22_w ), .mv_x_16x08_42_o ( mv_x_16x08_42_w ), .mv_x_16x08_62_o ( mv_x_16x08_62_w ),
    .mv_x_16x08_12_o ( mv_x_16x08_12_w ), .mv_x_16x08_32_o ( mv_x_16x08_32_w ), .mv_x_16x08_52_o ( mv_x_16x08_52_w ), .mv_x_16x08_72_o ( mv_x_16x08_72_w ),
    .mv_x_16x08_04_o ( mv_x_16x08_04_w ), .mv_x_16x08_24_o ( mv_x_16x08_24_w ), .mv_x_16x08_44_o ( mv_x_16x08_44_w ), .mv_x_16x08_64_o ( mv_x_16x08_64_w ),
    .mv_x_16x08_14_o ( mv_x_16x08_14_w ), .mv_x_16x08_34_o ( mv_x_16x08_34_w ), .mv_x_16x08_54_o ( mv_x_16x08_54_w ), .mv_x_16x08_74_o ( mv_x_16x08_74_w ),
    .mv_x_16x08_06_o ( mv_x_16x08_06_w ), .mv_x_16x08_26_o ( mv_x_16x08_26_w ), .mv_x_16x08_46_o ( mv_x_16x08_46_w ), .mv_x_16x08_66_o ( mv_x_16x08_66_w ),
    .mv_x_16x08_16_o ( mv_x_16x08_16_w ), .mv_x_16x08_36_o ( mv_x_16x08_36_w ), .mv_x_16x08_56_o ( mv_x_16x08_56_w ), .mv_x_16x08_76_o ( mv_x_16x08_76_w ),
    // mv_y_16x08
    .mv_y_16x08_00_o ( mv_y_16x08_00_w ), .mv_y_16x08_20_o ( mv_y_16x08_20_w ), .mv_y_16x08_40_o ( mv_y_16x08_40_w ), .mv_y_16x08_60_o ( mv_y_16x08_60_w ),
    .mv_y_16x08_10_o ( mv_y_16x08_10_w ), .mv_y_16x08_30_o ( mv_y_16x08_30_w ), .mv_y_16x08_50_o ( mv_y_16x08_50_w ), .mv_y_16x08_70_o ( mv_y_16x08_70_w ),
    .mv_y_16x08_02_o ( mv_y_16x08_02_w ), .mv_y_16x08_22_o ( mv_y_16x08_22_w ), .mv_y_16x08_42_o ( mv_y_16x08_42_w ), .mv_y_16x08_62_o ( mv_y_16x08_62_w ),
    .mv_y_16x08_12_o ( mv_y_16x08_12_w ), .mv_y_16x08_32_o ( mv_y_16x08_32_w ), .mv_y_16x08_52_o ( mv_y_16x08_52_w ), .mv_y_16x08_72_o ( mv_y_16x08_72_w ),
    .mv_y_16x08_04_o ( mv_y_16x08_04_w ), .mv_y_16x08_24_o ( mv_y_16x08_24_w ), .mv_y_16x08_44_o ( mv_y_16x08_44_w ), .mv_y_16x08_64_o ( mv_y_16x08_64_w ),
    .mv_y_16x08_14_o ( mv_y_16x08_14_w ), .mv_y_16x08_34_o ( mv_y_16x08_34_w ), .mv_y_16x08_54_o ( mv_y_16x08_54_w ), .mv_y_16x08_74_o ( mv_y_16x08_74_w ),
    .mv_y_16x08_06_o ( mv_y_16x08_06_w ), .mv_y_16x08_26_o ( mv_y_16x08_26_w ), .mv_y_16x08_46_o ( mv_y_16x08_46_w ), .mv_y_16x08_66_o ( mv_y_16x08_66_w ),
    .mv_y_16x08_16_o ( mv_y_16x08_16_w ), .mv_y_16x08_36_o ( mv_y_16x08_36_w ), .mv_y_16x08_56_o ( mv_y_16x08_56_w ), .mv_y_16x08_76_o ( mv_y_16x08_76_w ),
    // mv_x_16x16
    .mv_x_16x16_00_o ( mv_x_16x16_00_w ), .mv_x_16x16_20_o ( mv_x_16x16_20_w ), .mv_x_16x16_40_o ( mv_x_16x16_40_w ), .mv_x_16x16_60_o ( mv_x_16x16_60_w ),
    .mv_x_16x16_02_o ( mv_x_16x16_02_w ), .mv_x_16x16_22_o ( mv_x_16x16_22_w ), .mv_x_16x16_42_o ( mv_x_16x16_42_w ), .mv_x_16x16_62_o ( mv_x_16x16_62_w ),
    .mv_x_16x16_04_o ( mv_x_16x16_04_w ), .mv_x_16x16_24_o ( mv_x_16x16_24_w ), .mv_x_16x16_44_o ( mv_x_16x16_44_w ), .mv_x_16x16_64_o ( mv_x_16x16_64_w ),
    .mv_x_16x16_06_o ( mv_x_16x16_06_w ), .mv_x_16x16_26_o ( mv_x_16x16_26_w ), .mv_x_16x16_46_o ( mv_x_16x16_46_w ), .mv_x_16x16_66_o ( mv_x_16x16_66_w ),
    // mv_y_16x16
    .mv_y_16x16_00_o ( mv_y_16x16_00_w ), .mv_y_16x16_20_o ( mv_y_16x16_20_w ), .mv_y_16x16_40_o ( mv_y_16x16_40_w ), .mv_y_16x16_60_o ( mv_y_16x16_60_w ),
    .mv_y_16x16_02_o ( mv_y_16x16_02_w ), .mv_y_16x16_22_o ( mv_y_16x16_22_w ), .mv_y_16x16_42_o ( mv_y_16x16_42_w ), .mv_y_16x16_62_o ( mv_y_16x16_62_w ),
    .mv_y_16x16_04_o ( mv_y_16x16_04_w ), .mv_y_16x16_24_o ( mv_y_16x16_24_w ), .mv_y_16x16_44_o ( mv_y_16x16_44_w ), .mv_y_16x16_64_o ( mv_y_16x16_64_w ),
    .mv_y_16x16_06_o ( mv_y_16x16_06_w ), .mv_y_16x16_26_o ( mv_y_16x16_26_w ), .mv_y_16x16_46_o ( mv_y_16x16_46_w ), .mv_y_16x16_66_o ( mv_y_16x16_66_w )
    );

//*** STAGE 4 **************************

  `define COST_WIDTH (`PIXEL_WIDTH+12)

  // 16x16 sad buffer
  wire                           sad_16x16_wren_w   ;
    reg                          sad_16x16_wren_r   ;
  wire [4                : 0]    sad_16x16_addr_w   ;
    reg  [4                : 0]  sad_16x16_addr_w_r ;
    reg  [4                : 0]  sad_16x16_addr_r_r ;
  wire [1                : 0]    block_16x16_w      ;
    reg  [1                : 0]  block_16x16_r      ;

  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_00_w     ;
  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_01_w     ;
  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_02_w     ;
  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_03_w     ;

  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_10_w     ;
  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_11_w     ;
  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_12_w     ;
  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_13_w     ;

  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_20_w     ;
  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_21_w     ;
  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_22_w     ;
  wire [`PIXEL_WIDTH+8-1 : 0]    sad_16x16_23_w     ;

  // sad_16x16_wren_i
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      sad_16x16_wren_r <= 0 ;
    else begin
      sad_16x16_wren_r <= sad_8x8_val_w ;
    end
  end

  assign sad_16x16_wren_w = sad_16x16_wren_r & (block_16x16_w!=3 );

  // sad_16x16_addr_w
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      sad_16x16_addr_w_r <= 0 ;
    else begin
      sad_16x16_addr_w_r <= mv_y_8x8_w ;
    end
  end

  assign sad_16x16_addr_w = sad_16x16_wren_w ? sad_16x16_addr_w_r : mv_y_8x8_w ;

  // block_16x16_w
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      block_16x16_r <= 0 ;
    else begin
      block_16x16_r <= block_8x8_w ;
    end
  end

  assign block_16x16_w = block_16x16_r ;

  ime_sad_16x16_buffer sad_16x16_buffer (
    // global
    .clk               ( clk                 ),
    .rstn              ( rstn                ),

    // ctrl_i
    .addr_i            ( sad_16x16_addr_w    ),
    .wren_i            ( sad_16x16_wren_w    ),
    .block_i           ( block_16x16_w       ),

    // sad_i
    .sad_16x16_x0_i    ( sad_16x16_30_w      ),
    .sad_16x16_x1_i    ( sad_16x16_31_w      ),
    .sad_16x16_x2_i    ( sad_16x16_32_w      ),
    .sad_16x16_x3_i    ( sad_16x16_33_w      ),

    // sad_o
    .sad_16x16_00_o    ( sad_16x16_00_w      ),
    .sad_16x16_01_o    ( sad_16x16_01_w      ),
    .sad_16x16_02_o    ( sad_16x16_02_w      ),
    .sad_16x16_03_o    ( sad_16x16_03_w      ),

    .sad_16x16_10_o    ( sad_16x16_10_w      ),
    .sad_16x16_11_o    ( sad_16x16_11_w      ),
    .sad_16x16_12_o    ( sad_16x16_12_w      ),
    .sad_16x16_13_o    ( sad_16x16_13_w      ),

    .sad_16x16_20_o    ( sad_16x16_20_w      ),
    .sad_16x16_21_o    ( sad_16x16_21_w      ),
    .sad_16x16_22_o    ( sad_16x16_22_w      ),
    .sad_16x16_23_o    ( sad_16x16_23_w      )
    );

  // best_mv_above_16
  wire                           sad_16x16_val_w ;
  wire [`IMV_WIDTH-1    : 0]     mv_x_16x16_w    ;
    reg  [`IMV_WIDTH-1    : 0]     mv_x_16x16_r  ;
  wire [`IMV_WIDTH-1    : 0]     mv_y_16x16_w    ;

  // cost_w
  // cost_16x32
  wire [`COST_WIDTH-1  : 0]    cost_16x32_00_w    , cost_16x32_20_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x32_01_w    , cost_16x32_21_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x32_02_w    , cost_16x32_22_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_16x32_03_w    , cost_16x32_23_w    ;
  // cost_32x16
  wire [`COST_WIDTH-1  : 0]    cost_32x16_00_w    , cost_32x16_20_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_32x16_10_w    , cost_32x16_30_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_32x16_02_w    , cost_32x16_22_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_32x16_12_w    , cost_32x16_32_w    ;
  // cost_32x32
  wire [`COST_WIDTH-1  : 0]    cost_32x32_00_w    , cost_32x32_20_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_32x32_02_w    , cost_32x32_22_w    ;
  // cost_32x64
  wire [`COST_WIDTH-1  : 0]    cost_32x64_00_w    ;
  wire [`COST_WIDTH-1  : 0]    cost_32x64_02_w    ;
  // cost_64x32
  wire [`COST_WIDTH-1  : 0]    cost_64x32_00_w    , cost_64x32_20_w    ;
  // cost_64x64
  wire [`COST_WIDTH-1  : 0]    cost_64x64_00_w    ;

  // mv_x_w
  // mv_x_16x32
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x32_00_w    , mv_x_16x32_20_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x32_01_w    , mv_x_16x32_21_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x32_02_w    , mv_x_16x32_22_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_16x32_03_w    , mv_x_16x32_23_w    ;
  // mv_x_32x16
  wire [`IMV_WIDTH-1   : 0]    mv_x_32x16_00_w    , mv_x_32x16_20_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_32x16_10_w    , mv_x_32x16_30_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_32x16_02_w    , mv_x_32x16_22_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_32x16_12_w    , mv_x_32x16_32_w    ;
  // mv_x_32x32
  wire [`IMV_WIDTH-1   : 0]    mv_x_32x32_00_w    , mv_x_32x32_20_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_32x32_02_w    , mv_x_32x32_22_w    ;
  // mv_x_32x64
  wire [`IMV_WIDTH-1   : 0]    mv_x_32x64_00_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_x_32x64_02_w    ;
  // mv_x_64x32
  wire [`IMV_WIDTH-1   : 0]    mv_x_64x32_00_w    , mv_x_64x32_20_w    ;
  // mv_x_64x64
  wire [`IMV_WIDTH-1   : 0]    mv_x_64x64_00_w    ;

  // mv_y_w
  // mv_y_16x32
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x32_00_w    , mv_y_16x32_20_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x32_01_w    , mv_y_16x32_21_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x32_02_w    , mv_y_16x32_22_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_16x32_03_w    , mv_y_16x32_23_w    ;
  // mv_y_32x16
  wire [`IMV_WIDTH-1   : 0]    mv_y_32x16_00_w    , mv_y_32x16_20_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_32x16_10_w    , mv_y_32x16_30_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_32x16_02_w    , mv_y_32x16_22_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_32x16_12_w    , mv_y_32x16_32_w    ;
  // mv_y_32x32
  wire [`IMV_WIDTH-1   : 0]    mv_y_32x32_00_w    , mv_y_32x32_20_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_32x32_02_w    , mv_y_32x32_22_w    ;
  // mv_y_32x64
  wire [`IMV_WIDTH-1   : 0]    mv_y_32x64_00_w    ;
  wire [`IMV_WIDTH-1   : 0]    mv_y_32x64_02_w    ;
  // mv_y_64x32
  wire [`IMV_WIDTH-1   : 0]    mv_y_64x32_00_w    , mv_y_64x32_20_w    ;
  // mv_y_64x64
  wire [`IMV_WIDTH-1   : 0]    mv_y_64x64_00_w    ;

  assign sad_16x16_val_w = sad_16x16_wren_r & (block_16x16_w==3 );
  assign mv_y_16x16_w    = sad_16x16_addr_w_r ;

  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      mv_x_16x16_r <= 0 ;
    else begin
      mv_x_16x16_r <= mv_x_8x8_r ;
    end
  end

  assign mv_x_16x16_w = mv_x_16x16_r ;

  ime_best_mv_above_16 best_mv_above_16(
    // global
    .clk               ( clk                 ),
    .rstn              ( rstn                ),

    // val_i
    .start_i           ( sysif_start_i       ),
    .val_i             ( sad_16x16_val_w     ),
    .qp_i              ( sysif_qp_i          ),

    // update_i
    .update_wrk_i      ( deci_doing_w        ),
    .update_cnt_i      ( y_cnt_r             ),
    .update_cst_i      ( cost_best_w         ),

    // sad_i
    .sad_16x16_00_i    ( sad_16x16_00_w      ),
    .sad_16x16_01_i    ( sad_16x16_01_w      ),
    .sad_16x16_02_i    ( sad_16x16_02_w      ),
    .sad_16x16_03_i    ( sad_16x16_03_w      ),

    .sad_16x16_10_i    ( sad_16x16_10_w      ),
    .sad_16x16_11_i    ( sad_16x16_11_w      ),
    .sad_16x16_12_i    ( sad_16x16_12_w      ),
    .sad_16x16_13_i    ( sad_16x16_13_w      ),

    .sad_16x16_20_i    ( sad_16x16_20_w      ),
    .sad_16x16_21_i    ( sad_16x16_21_w      ),
    .sad_16x16_22_i    ( sad_16x16_22_w      ),
    .sad_16x16_23_i    ( sad_16x16_23_w      ),

    .sad_16x16_30_i    ( sad_16x16_30_w      ),
    .sad_16x16_31_i    ( sad_16x16_31_w      ),
    .sad_16x16_32_i    ( sad_16x16_32_w      ),
    .sad_16x16_33_i    ( sad_16x16_33_w      ),

    // mv_i
    .mv_x_16x16_i      ( mv_x_16x16_w        ),
    .mv_y_16x16_i      ( mv_y_16x16_w        ),

    // cost_o
    // cost_16x32
    .cost_16x32_00_o   ( cost_16x32_00_w     ), .cost_16x32_20_o   ( cost_16x32_20_w     ),
    .cost_16x32_01_o   ( cost_16x32_01_w     ), .cost_16x32_21_o   ( cost_16x32_21_w     ),
    .cost_16x32_02_o   ( cost_16x32_02_w     ), .cost_16x32_22_o   ( cost_16x32_22_w     ),
    .cost_16x32_03_o   ( cost_16x32_03_w     ), .cost_16x32_23_o   ( cost_16x32_23_w     ),
    // cost_32x16
    .cost_32x16_00_o   ( cost_32x16_00_w     ), .cost_32x16_20_o   ( cost_32x16_20_w     ),
    .cost_32x16_10_o   ( cost_32x16_10_w     ), .cost_32x16_30_o   ( cost_32x16_30_w     ),
    .cost_32x16_02_o   ( cost_32x16_02_w     ), .cost_32x16_22_o   ( cost_32x16_22_w     ),
    .cost_32x16_12_o   ( cost_32x16_12_w     ), .cost_32x16_32_o   ( cost_32x16_32_w     ),
    // cost_32x32
    .cost_32x32_00_o   ( cost_32x32_00_w     ), .cost_32x32_20_o   ( cost_32x32_20_w     ),
    .cost_32x32_02_o   ( cost_32x32_02_w     ), .cost_32x32_22_o   ( cost_32x32_22_w     ),
    // cost_32x64
    .cost_32x64_00_o   ( cost_32x64_00_w     ),
    .cost_32x64_02_o   ( cost_32x64_02_w     ),
    // cost_64x32
    .cost_64x32_00_o   ( cost_64x32_00_w     ), .cost_64x32_20_o   ( cost_64x32_20_w     ),
    // cost_64x64
    .cost_64x64_00_o   ( cost_64x64_00_w     ),

    // mv_x_o
    // mv_x_16x32
    .mv_x_16x32_00_o   ( mv_x_16x32_00_w     ), .mv_x_16x32_20_o   ( mv_x_16x32_20_w     ),
    .mv_x_16x32_01_o   ( mv_x_16x32_01_w     ), .mv_x_16x32_21_o   ( mv_x_16x32_21_w     ),
    .mv_x_16x32_02_o   ( mv_x_16x32_02_w     ), .mv_x_16x32_22_o   ( mv_x_16x32_22_w     ),
    .mv_x_16x32_03_o   ( mv_x_16x32_03_w     ), .mv_x_16x32_23_o   ( mv_x_16x32_23_w     ),
    // mv_x_32x16
    .mv_x_32x16_00_o   ( mv_x_32x16_00_w     ), .mv_x_32x16_20_o   ( mv_x_32x16_20_w     ),
    .mv_x_32x16_10_o   ( mv_x_32x16_10_w     ), .mv_x_32x16_30_o   ( mv_x_32x16_30_w     ),
    .mv_x_32x16_02_o   ( mv_x_32x16_02_w     ), .mv_x_32x16_22_o   ( mv_x_32x16_22_w     ),
    .mv_x_32x16_12_o   ( mv_x_32x16_12_w     ), .mv_x_32x16_32_o   ( mv_x_32x16_32_w     ),
    // mv_x_32x32
    .mv_x_32x32_00_o   ( mv_x_32x32_00_w     ), .mv_x_32x32_20_o   ( mv_x_32x32_20_w     ),
    .mv_x_32x32_02_o   ( mv_x_32x32_02_w     ), .mv_x_32x32_22_o   ( mv_x_32x32_22_w     ),
    // mv_x_32x64
    .mv_x_32x64_00_o   ( mv_x_32x64_00_w     ),
    .mv_x_32x64_02_o   ( mv_x_32x64_02_w     ),
    // mv_x_64x32
    .mv_x_64x32_00_o   ( mv_x_64x32_00_w     ), .mv_x_64x32_20_o   ( mv_x_64x32_20_w     ),
    // mv_x_64x64
    .mv_x_64x64_00_o   ( mv_x_64x64_00_w     ),

    // mv_y_o
    // mv_y_16x32
    .mv_y_16x32_00_o   ( mv_y_16x32_00_w     ), .mv_y_16x32_20_o   ( mv_y_16x32_20_w     ),
    .mv_y_16x32_01_o   ( mv_y_16x32_01_w     ), .mv_y_16x32_21_o   ( mv_y_16x32_21_w     ),
    .mv_y_16x32_02_o   ( mv_y_16x32_02_w     ), .mv_y_16x32_22_o   ( mv_y_16x32_22_w     ),
    .mv_y_16x32_03_o   ( mv_y_16x32_03_w     ), .mv_y_16x32_23_o   ( mv_y_16x32_23_w     ),
    // mv_y_32x16
    .mv_y_32x16_00_o   ( mv_y_32x16_00_w     ), .mv_y_32x16_20_o   ( mv_y_32x16_20_w     ),
    .mv_y_32x16_10_o   ( mv_y_32x16_10_w     ), .mv_y_32x16_30_o   ( mv_y_32x16_30_w     ),
    .mv_y_32x16_02_o   ( mv_y_32x16_02_w     ), .mv_y_32x16_22_o   ( mv_y_32x16_22_w     ),
    .mv_y_32x16_12_o   ( mv_y_32x16_12_w     ), .mv_y_32x16_32_o   ( mv_y_32x16_32_w     ),
    // mv_y_32x32
    .mv_y_32x32_00_o   ( mv_y_32x32_00_w     ), .mv_y_32x32_20_o   ( mv_y_32x32_20_w     ),
    .mv_y_32x32_02_o   ( mv_y_32x32_02_w     ), .mv_y_32x32_22_o   ( mv_y_32x32_22_w     ),
    // mv_y_32x64
    .mv_y_32x64_00_o   ( mv_y_32x64_00_w     ),
    .mv_y_32x64_02_o   ( mv_y_32x64_02_w     ),
    // mv_y_64x32
    .mv_y_64x32_00_o   ( mv_y_64x32_00_w     ), .mv_y_64x32_20_o   ( mv_y_64x32_20_w     ),
    // mv_y_64x64
    .mv_y_64x64_00_o   ( mv_y_64x64_00_w     )
    );

//*** STAGE 5 **************************

  `define COST_WIDTH (`PIXEL_WIDTH+12)

  // cost_w
  reg  [`COST_WIDTH-1    : 0]    cost_NxN_00_w    ;
  reg  [`COST_WIDTH-1    : 0]    cost_NxN_01_w    ;
  reg  [`COST_WIDTH-1    : 0]    cost_NxN_02_w    ;
  reg  [`COST_WIDTH-1    : 0]    cost_NxN_03_w    ;
  reg  [`COST_WIDTH-1    : 0]    cost_2NxN_0_w    ;
  reg  [`COST_WIDTH-1    : 0]    cost_2NxN_1_w    ;
  reg  [`COST_WIDTH-1    : 0]    cost_Nx2N_0_w    ;
  reg  [`COST_WIDTH-1    : 0]    cost_Nx2N_1_w    ;
  reg  [`COST_WIDTH-1    : 0]    cost_2Nx2N_w     ;
  // deci_w
  wire [1                : 0]    partition_w      ;

  always @(*) begin
                  begin    cost_NxN_00_w = {`COST_WIDTH{1'b0}} ; cost_2NxN_0_w = {`COST_WIDTH{1'b0}} ;
                           cost_NxN_01_w = {`COST_WIDTH{1'b0}} ; cost_2NxN_1_w = {`COST_WIDTH{1'b0}} ;
                           cost_NxN_02_w = {`COST_WIDTH{1'b0}} ; cost_Nx2N_0_w = {`COST_WIDTH{1'b0}} ;
                           cost_NxN_03_w = {`COST_WIDTH{1'b0}} ; cost_Nx2N_1_w = {`COST_WIDTH{1'b0}} ; cost_2Nx2N_w = {`COST_WIDTH{1'b0}} ;
                  end
    if( deci_doing_w ) begin
      case( y_cnt_r )
        00      : begin    cost_NxN_00_w = cost_08x08_00_w ; cost_2NxN_0_w = cost_16x08_00_w ;
                           cost_NxN_01_w = cost_08x08_01_w ; cost_2NxN_1_w = cost_16x08_10_w ;
                           cost_NxN_02_w = cost_08x08_10_w ; cost_Nx2N_0_w = cost_08x16_00_w ;
                           cost_NxN_03_w = cost_08x08_11_w ; cost_Nx2N_1_w = cost_08x16_01_w ; cost_2Nx2N_w = cost_16x16_00_w ;
                  end
        01      : begin    cost_NxN_00_w = cost_08x08_02_w ; cost_2NxN_0_w = cost_16x08_02_w ;
                           cost_NxN_01_w = cost_08x08_03_w ; cost_2NxN_1_w = cost_16x08_12_w ;
                           cost_NxN_02_w = cost_08x08_12_w ; cost_Nx2N_0_w = cost_08x16_02_w ;
                           cost_NxN_03_w = cost_08x08_13_w ; cost_Nx2N_1_w = cost_08x16_03_w ; cost_2Nx2N_w = cost_16x16_02_w ;
                  end
        02      : begin    cost_NxN_00_w = cost_08x08_20_w ; cost_2NxN_0_w = cost_16x08_20_w ;
                           cost_NxN_01_w = cost_08x08_21_w ; cost_2NxN_1_w = cost_16x08_30_w ;
                           cost_NxN_02_w = cost_08x08_30_w ; cost_Nx2N_0_w = cost_08x16_20_w ;
                           cost_NxN_03_w = cost_08x08_31_w ; cost_Nx2N_1_w = cost_08x16_21_w ; cost_2Nx2N_w = cost_16x16_20_w ;
                  end
        03      : begin    cost_NxN_00_w = cost_08x08_22_w ; cost_2NxN_0_w = cost_16x08_22_w ;
                           cost_NxN_01_w = cost_08x08_23_w ; cost_2NxN_1_w = cost_16x08_32_w ;
                           cost_NxN_02_w = cost_08x08_32_w ; cost_Nx2N_0_w = cost_08x16_22_w ;
                           cost_NxN_03_w = cost_08x08_33_w ; cost_Nx2N_1_w = cost_08x16_23_w ; cost_2Nx2N_w = cost_16x16_22_w ;
                  end
        04      : begin    cost_NxN_00_w = cost_08x08_04_w ; cost_2NxN_0_w = cost_16x08_04_w ;
                           cost_NxN_01_w = cost_08x08_05_w ; cost_2NxN_1_w = cost_16x08_14_w ;
                           cost_NxN_02_w = cost_08x08_14_w ; cost_Nx2N_0_w = cost_08x16_04_w ;
                           cost_NxN_03_w = cost_08x08_15_w ; cost_Nx2N_1_w = cost_08x16_05_w ; cost_2Nx2N_w = cost_16x16_04_w ;
                  end
        05      : begin    cost_NxN_00_w = cost_08x08_06_w ; cost_2NxN_0_w = cost_16x08_06_w ;
                           cost_NxN_01_w = cost_08x08_07_w ; cost_2NxN_1_w = cost_16x08_16_w ;
                           cost_NxN_02_w = cost_08x08_16_w ; cost_Nx2N_0_w = cost_08x16_06_w ;
                           cost_NxN_03_w = cost_08x08_17_w ; cost_Nx2N_1_w = cost_08x16_07_w ; cost_2Nx2N_w = cost_16x16_06_w ;
                  end
        06      : begin    cost_NxN_00_w = cost_08x08_24_w ; cost_2NxN_0_w = cost_16x08_24_w ;
                           cost_NxN_01_w = cost_08x08_25_w ; cost_2NxN_1_w = cost_16x08_34_w ;
                           cost_NxN_02_w = cost_08x08_34_w ; cost_Nx2N_0_w = cost_08x16_24_w ;
                           cost_NxN_03_w = cost_08x08_35_w ; cost_Nx2N_1_w = cost_08x16_25_w ; cost_2Nx2N_w = cost_16x16_24_w ;
                  end
        07      : begin    cost_NxN_00_w = cost_08x08_26_w ; cost_2NxN_0_w = cost_16x08_26_w ;
                           cost_NxN_01_w = cost_08x08_27_w ; cost_2NxN_1_w = cost_16x08_36_w ;
                           cost_NxN_02_w = cost_08x08_36_w ; cost_Nx2N_0_w = cost_08x16_26_w ;
                           cost_NxN_03_w = cost_08x08_37_w ; cost_Nx2N_1_w = cost_08x16_27_w ; cost_2Nx2N_w = cost_16x16_26_w ;
                  end
        08      : begin    cost_NxN_00_w = cost_08x08_40_w ; cost_2NxN_0_w = cost_16x08_40_w ;
                           cost_NxN_01_w = cost_08x08_41_w ; cost_2NxN_1_w = cost_16x08_50_w ;
                           cost_NxN_02_w = cost_08x08_50_w ; cost_Nx2N_0_w = cost_08x16_40_w ;
                           cost_NxN_03_w = cost_08x08_51_w ; cost_Nx2N_1_w = cost_08x16_41_w ; cost_2Nx2N_w = cost_16x16_40_w ;
                  end
        09      : begin    cost_NxN_00_w = cost_08x08_42_w ; cost_2NxN_0_w = cost_16x08_42_w ;
                           cost_NxN_01_w = cost_08x08_43_w ; cost_2NxN_1_w = cost_16x08_52_w ;
                           cost_NxN_02_w = cost_08x08_52_w ; cost_Nx2N_0_w = cost_08x16_42_w ;
                           cost_NxN_03_w = cost_08x08_53_w ; cost_Nx2N_1_w = cost_08x16_43_w ; cost_2Nx2N_w = cost_16x16_42_w ;
                  end
        10      : begin    cost_NxN_00_w = cost_08x08_60_w ; cost_2NxN_0_w = cost_16x08_60_w ;
                           cost_NxN_01_w = cost_08x08_61_w ; cost_2NxN_1_w = cost_16x08_70_w ;
                           cost_NxN_02_w = cost_08x08_70_w ; cost_Nx2N_0_w = cost_08x16_60_w ;
                           cost_NxN_03_w = cost_08x08_71_w ; cost_Nx2N_1_w = cost_08x16_61_w ; cost_2Nx2N_w = cost_16x16_60_w ;
                  end
        11      : begin    cost_NxN_00_w = cost_08x08_62_w ; cost_2NxN_0_w = cost_16x08_62_w ;
                           cost_NxN_01_w = cost_08x08_63_w ; cost_2NxN_1_w = cost_16x08_72_w ;
                           cost_NxN_02_w = cost_08x08_72_w ; cost_Nx2N_0_w = cost_08x16_62_w ;
                           cost_NxN_03_w = cost_08x08_73_w ; cost_Nx2N_1_w = cost_08x16_63_w ; cost_2Nx2N_w = cost_16x16_62_w ;
                  end
        12      : begin    cost_NxN_00_w = cost_08x08_44_w ; cost_2NxN_0_w = cost_16x08_44_w ;
                           cost_NxN_01_w = cost_08x08_45_w ; cost_2NxN_1_w = cost_16x08_54_w ;
                           cost_NxN_02_w = cost_08x08_54_w ; cost_Nx2N_0_w = cost_08x16_44_w ;
                           cost_NxN_03_w = cost_08x08_55_w ; cost_Nx2N_1_w = cost_08x16_45_w ; cost_2Nx2N_w = cost_16x16_44_w ;
                  end
        13      : begin    cost_NxN_00_w = cost_08x08_46_w ; cost_2NxN_0_w = cost_16x08_46_w ;
                           cost_NxN_01_w = cost_08x08_47_w ; cost_2NxN_1_w = cost_16x08_56_w ;
                           cost_NxN_02_w = cost_08x08_56_w ; cost_Nx2N_0_w = cost_08x16_46_w ;
                           cost_NxN_03_w = cost_08x08_57_w ; cost_Nx2N_1_w = cost_08x16_47_w ; cost_2Nx2N_w = cost_16x16_46_w ;
                  end
        14      : begin    cost_NxN_00_w = cost_08x08_64_w ; cost_2NxN_0_w = cost_16x08_64_w ;
                           cost_NxN_01_w = cost_08x08_65_w ; cost_2NxN_1_w = cost_16x08_74_w ;
                           cost_NxN_02_w = cost_08x08_74_w ; cost_Nx2N_0_w = cost_08x16_64_w ;
                           cost_NxN_03_w = cost_08x08_75_w ; cost_Nx2N_1_w = cost_08x16_65_w ; cost_2Nx2N_w = cost_16x16_64_w ;
                  end
        15      : begin    cost_NxN_00_w = cost_08x08_66_w ; cost_2NxN_0_w = cost_16x08_66_w ;
                           cost_NxN_01_w = cost_08x08_67_w ; cost_2NxN_1_w = cost_16x08_76_w ;
                           cost_NxN_02_w = cost_08x08_76_w ; cost_Nx2N_0_w = cost_08x16_66_w ;
                           cost_NxN_03_w = cost_08x08_77_w ; cost_Nx2N_1_w = cost_08x16_67_w ; cost_2Nx2N_w = cost_16x16_66_w ;
                  end

        16      : begin    cost_NxN_00_w = cost_16x16_00_w ; cost_2NxN_0_w = cost_32x16_00_w ;
                           cost_NxN_01_w = cost_16x16_02_w ; cost_2NxN_1_w = cost_32x16_10_w ;
                           cost_NxN_02_w = cost_16x16_20_w ; cost_Nx2N_0_w = cost_16x32_00_w ;
                           cost_NxN_03_w = cost_16x16_22_w ; cost_Nx2N_1_w = cost_16x32_01_w ; cost_2Nx2N_w = cost_32x32_00_w ;
                  end
        17      : begin    cost_NxN_00_w = cost_16x16_04_w ; cost_2NxN_0_w = cost_32x16_02_w ;
                           cost_NxN_01_w = cost_16x16_06_w ; cost_2NxN_1_w = cost_32x16_12_w ;
                           cost_NxN_02_w = cost_16x16_24_w ; cost_Nx2N_0_w = cost_16x32_02_w ;
                           cost_NxN_03_w = cost_16x16_26_w ; cost_Nx2N_1_w = cost_16x32_03_w ; cost_2Nx2N_w = cost_32x32_02_w ;
                  end
        18      : begin    cost_NxN_00_w = cost_16x16_40_w ; cost_2NxN_0_w = cost_32x16_20_w ;
                           cost_NxN_01_w = cost_16x16_42_w ; cost_2NxN_1_w = cost_32x16_30_w ;
                           cost_NxN_02_w = cost_16x16_60_w ; cost_Nx2N_0_w = cost_16x32_20_w ;
                           cost_NxN_03_w = cost_16x16_62_w ; cost_Nx2N_1_w = cost_16x32_21_w ; cost_2Nx2N_w = cost_32x32_20_w ;
                  end
        19      : begin    cost_NxN_00_w = cost_16x16_44_w ; cost_2NxN_0_w = cost_32x16_22_w ;
                           cost_NxN_01_w = cost_16x16_46_w ; cost_2NxN_1_w = cost_32x16_32_w ;
                           cost_NxN_02_w = cost_16x16_64_w ; cost_Nx2N_0_w = cost_16x32_22_w ;
                           cost_NxN_03_w = cost_16x16_66_w ; cost_Nx2N_1_w = cost_16x32_23_w ; cost_2Nx2N_w = cost_32x32_22_w ;
                  end

        20      : begin    cost_NxN_00_w = cost_32x32_00_w ; cost_2NxN_0_w = cost_64x32_00_w ;
                           cost_NxN_01_w = cost_32x32_02_w ; cost_2NxN_1_w = cost_64x32_20_w ;
                           cost_NxN_02_w = cost_32x32_20_w ; cost_Nx2N_0_w = cost_32x64_00_w ;
                           cost_NxN_03_w = cost_32x32_22_w ; cost_Nx2N_1_w = cost_32x64_02_w ; cost_2Nx2N_w = cost_64x64_00_w ;
                  end

        default : begin    cost_NxN_00_w = cost_32x32_00_w ; cost_2NxN_0_w = cost_64x32_00_w ;
                           cost_NxN_01_w = cost_32x32_02_w ; cost_2NxN_1_w = cost_64x32_20_w ;
                           cost_NxN_02_w = cost_32x32_20_w ; cost_Nx2N_0_w = cost_32x64_00_w ;
                           cost_NxN_03_w = cost_32x32_22_w ; cost_Nx2N_1_w = cost_32x64_02_w ; cost_2Nx2N_w = cost_64x64_00_w ;
                  end
      endcase
    end
  end

  // decision
  ime_decision decision (
    // cost_i
    .cost_NxN_00_i    ( cost_NxN_00_w    ),
    .cost_NxN_01_i    ( cost_NxN_01_w    ),
    .cost_NxN_02_i    ( cost_NxN_02_w    ),
    .cost_NxN_03_i    ( cost_NxN_03_w    ),
    .cost_2NxN_0_i    ( cost_2NxN_0_w    ),
    .cost_2NxN_1_i    ( cost_2NxN_1_w    ),
    .cost_Nx2N_0_i    ( cost_Nx2N_0_w    ),
    .cost_Nx2N_1_i    ( cost_Nx2N_1_w    ),
    .cost_2Nx2N_i     ( cost_2Nx2N_w     ),
    // deci_o
    .partition_o      ( partition_w      ),
    .cost_best_o      ( cost_best_w      )
    );

  always @(posedge clk or negedge rstn ) begin
    if( !rstn ) begin
      fmeif_partition_o <= 42'b0 ;
    end
    else if( deci_doing_w ) begin
      case( y_cnt_r )
        20 : fmeif_partition_o[01*2-1:(01-1)*2] <= partition_w ;
        19 : fmeif_partition_o[02*2-1:(02-1)*2] <= partition_w ;
        18 : fmeif_partition_o[03*2-1:(03-1)*2] <= partition_w ;
        17 : fmeif_partition_o[04*2-1:(04-1)*2] <= partition_w ;
        16 : fmeif_partition_o[05*2-1:(05-1)*2] <= partition_w ;
        15 : fmeif_partition_o[06*2-1:(06-1)*2] <= partition_w ;
        14 : fmeif_partition_o[07*2-1:(07-1)*2] <= partition_w ;
        13 : fmeif_partition_o[08*2-1:(08-1)*2] <= partition_w ;
        12 : fmeif_partition_o[09*2-1:(09-1)*2] <= partition_w ;
        11 : fmeif_partition_o[10*2-1:(10-1)*2] <= partition_w ;
        10 : fmeif_partition_o[11*2-1:(11-1)*2] <= partition_w ;
        09 : fmeif_partition_o[12*2-1:(12-1)*2] <= partition_w ;
        08 : fmeif_partition_o[13*2-1:(13-1)*2] <= partition_w ;
        07 : fmeif_partition_o[14*2-1:(14-1)*2] <= partition_w ;
        06 : fmeif_partition_o[15*2-1:(15-1)*2] <= partition_w ;
        05 : fmeif_partition_o[16*2-1:(16-1)*2] <= partition_w ;
        04 : fmeif_partition_o[17*2-1:(17-1)*2] <= partition_w ;
        03 : fmeif_partition_o[18*2-1:(18-1)*2] <= partition_w ;
        02 : fmeif_partition_o[19*2-1:(19-1)*2] <= partition_w ;
        01 : fmeif_partition_o[20*2-1:(20-1)*2] <= partition_w ;
        00 : fmeif_partition_o[21*2-1:(21-1)*2] <= partition_w ;
      endcase
    end
  end

//*** STAGE 6 **************************

  wire                          dump_doing_w       ;
  reg  [`IMV_WIDTH-1    : 0]    mv_x_64x64_dp_w    , mv_y_64x64_dp_w     ;
  reg  [`IMV_WIDTH-1    : 0]    mv_x_64x32_dp_w    , mv_y_64x32_dp_w     ;
  reg  [`IMV_WIDTH-1    : 0]    mv_x_32x64_dp_w    , mv_y_32x64_dp_w     ;
  reg  [`IMV_WIDTH-1    : 0]    mv_x_32x32_dp_w    , mv_y_32x32_dp_w     ;
  reg  [`IMV_WIDTH-1    : 0]    mv_x_32x16_dp_w    , mv_y_32x16_dp_w     ;
  reg  [`IMV_WIDTH-1    : 0]    mv_x_16x32_dp_w    , mv_y_16x32_dp_w     ;
  reg  [`IMV_WIDTH-1    : 0]    mv_x_16x16_dp_w    , mv_y_16x16_dp_w     ;
  reg  [`IMV_WIDTH-1    : 0]    mv_x_16x08_dp_w    , mv_y_16x08_dp_w     ;
  reg  [`IMV_WIDTH-1    : 0]    mv_x_08x16_dp_w    , mv_y_08x16_dp_w     ;
  reg  [`IMV_WIDTH-1    : 0]    mv_x_08x08_dp_w    , mv_y_08x08_dp_w     ;
  reg  [5               : 0]    dump_w             ;
  
  assign dump_doing_w = (cur_state==DUMP) ;

  always @(*) begin // mv_x_64x64_dp_w & mv_x_64x32_dp_w & mv_x_32x64_dp_w
                  begin mv_x_64x64_dp_w = 0               ; mv_x_64x32_dp_w = 0               ; mv_x_32x64_dp_w = 0               ; end
    if( dump_doing_w ) begin                                                                                                     
      case( y_cnt_r )
        00      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        01      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        02      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        03      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        04      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        05      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        06      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        07      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        08      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        09      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        10      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        11      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        12      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        13      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        14      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        15      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end

        16      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        17      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        18      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        19      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        20      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        21      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        22      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        23      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        24      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        25      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        26      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        27      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        28      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        29      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        30      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        31      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_00_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end

        32      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        33      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        34      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        35      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        36      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        37      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        38      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        39      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        40      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        41      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        42      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        43      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        44      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        45      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        46      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end
        47      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_00_w ; end

        48      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        49      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        50      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        51      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        52      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        53      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        54      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        55      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        56      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        57      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        58      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        59      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        60      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        61      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        62      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        63      : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
        default : begin mv_x_64x64_dp_w = mv_x_64x64_00_w ; mv_x_64x32_dp_w = mv_x_64x32_20_w ; mv_x_32x64_dp_w = mv_x_32x64_02_w ; end
      endcase
    end
  end

  always @(*) begin // mv_y_64x64_dp_w & mv_y_64x32_dp_w & mv_y_32x64_dp_w
                  begin mv_y_64x64_dp_w = 0               ; mv_y_64x32_dp_w = 0               ; mv_y_32x64_dp_w = 0               ; end
    if( dump_doing_w ) begin                                                                                                     
      case( y_cnt_r )
        00      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        01      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        02      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        03      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        04      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        05      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        06      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        07      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        08      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        09      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        10      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        11      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        12      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        13      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        14      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        15      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end

        16      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        17      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        18      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        19      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        20      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        21      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        22      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        23      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        24      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        25      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        26      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        27      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        28      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        29      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        30      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        31      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_00_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end

        32      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        33      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        34      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        35      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        36      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        37      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        38      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        39      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        40      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        41      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        42      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        43      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        44      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        45      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        46      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end
        47      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_00_w ; end

        48      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        49      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        50      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        51      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        52      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        53      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        54      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        55      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        56      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        57      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        58      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        59      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        60      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        61      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        62      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        63      : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
        default : begin mv_y_64x64_dp_w = mv_y_64x64_00_w ; mv_y_64x32_dp_w = mv_y_64x32_20_w ; mv_y_32x64_dp_w = mv_y_32x64_02_w ; end
      endcase
    end
  end

  always @(*) begin // mv_x_32x32_dp_w & mv_x_32x16_dp_w & mv_x_16x32_dp_w
                  begin mv_x_32x32_dp_w = 0               ; mv_x_32x16_dp_w = 0               ; mv_x_16x32_dp_w = 0               ; end
    if( dump_doing_w ) begin                                                                                                     
      case( y_cnt_r )
        00      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_00_w ; mv_x_16x32_dp_w = mv_x_16x32_00_w ; end
        01      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_00_w ; mv_x_16x32_dp_w = mv_x_16x32_00_w ; end
        02      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_00_w ; mv_x_16x32_dp_w = mv_x_16x32_00_w ; end
        03      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_00_w ; mv_x_16x32_dp_w = mv_x_16x32_00_w ; end
        04      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_00_w ; mv_x_16x32_dp_w = mv_x_16x32_01_w ; end
        05      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_00_w ; mv_x_16x32_dp_w = mv_x_16x32_01_w ; end
        06      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_00_w ; mv_x_16x32_dp_w = mv_x_16x32_01_w ; end
        07      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_00_w ; mv_x_16x32_dp_w = mv_x_16x32_01_w ; end

        08      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_00_w ; end
        09      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_00_w ; end
        10      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_00_w ; end
        11      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_00_w ; end
        12      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_01_w ; end
        13      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_01_w ; end
        14      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_01_w ; end
        15      : begin mv_x_32x32_dp_w = mv_x_32x32_00_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_01_w ; end

        16      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_02_w ; mv_x_16x32_dp_w = mv_x_16x32_02_w ; end
        17      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_02_w ; mv_x_16x32_dp_w = mv_x_16x32_02_w ; end
        18      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_02_w ; mv_x_16x32_dp_w = mv_x_16x32_02_w ; end
        19      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_02_w ; mv_x_16x32_dp_w = mv_x_16x32_02_w ; end
        20      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_02_w ; mv_x_16x32_dp_w = mv_x_16x32_03_w ; end
        21      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_02_w ; mv_x_16x32_dp_w = mv_x_16x32_03_w ; end
        22      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_02_w ; mv_x_16x32_dp_w = mv_x_16x32_03_w ; end
        23      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_02_w ; mv_x_16x32_dp_w = mv_x_16x32_03_w ; end

        24      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_12_w ; mv_x_16x32_dp_w = mv_x_16x32_02_w ; end
        25      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_12_w ; mv_x_16x32_dp_w = mv_x_16x32_02_w ; end
        26      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_12_w ; mv_x_16x32_dp_w = mv_x_16x32_02_w ; end
        27      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_12_w ; mv_x_16x32_dp_w = mv_x_16x32_02_w ; end
        28      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_12_w ; mv_x_16x32_dp_w = mv_x_16x32_03_w ; end
        29      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_12_w ; mv_x_16x32_dp_w = mv_x_16x32_03_w ; end
        30      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_12_w ; mv_x_16x32_dp_w = mv_x_16x32_03_w ; end
        31      : begin mv_x_32x32_dp_w = mv_x_32x32_02_w ; mv_x_32x16_dp_w = mv_x_32x16_12_w ; mv_x_16x32_dp_w = mv_x_16x32_03_w ; end

        32      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_20_w ; end
        33      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_20_w ; end
        34      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_20_w ; end
        35      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_20_w ; end
        36      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_21_w ; end
        37      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_21_w ; end
        38      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_21_w ; end
        39      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_20_w ; mv_x_16x32_dp_w = mv_x_16x32_21_w ; end

        40      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_30_w ; mv_x_16x32_dp_w = mv_x_16x32_20_w ; end
        41      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_30_w ; mv_x_16x32_dp_w = mv_x_16x32_20_w ; end
        42      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_30_w ; mv_x_16x32_dp_w = mv_x_16x32_20_w ; end
        43      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_30_w ; mv_x_16x32_dp_w = mv_x_16x32_20_w ; end
        44      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_30_w ; mv_x_16x32_dp_w = mv_x_16x32_21_w ; end
        45      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_30_w ; mv_x_16x32_dp_w = mv_x_16x32_21_w ; end
        46      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_30_w ; mv_x_16x32_dp_w = mv_x_16x32_21_w ; end
        47      : begin mv_x_32x32_dp_w = mv_x_32x32_20_w ; mv_x_32x16_dp_w = mv_x_32x16_30_w ; mv_x_16x32_dp_w = mv_x_16x32_21_w ; end

        48      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_22_w ; mv_x_16x32_dp_w = mv_x_16x32_22_w ; end
        49      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_22_w ; mv_x_16x32_dp_w = mv_x_16x32_22_w ; end
        50      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_22_w ; mv_x_16x32_dp_w = mv_x_16x32_22_w ; end
        51      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_22_w ; mv_x_16x32_dp_w = mv_x_16x32_22_w ; end
        52      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_22_w ; mv_x_16x32_dp_w = mv_x_16x32_23_w ; end
        53      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_22_w ; mv_x_16x32_dp_w = mv_x_16x32_23_w ; end
        54      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_22_w ; mv_x_16x32_dp_w = mv_x_16x32_23_w ; end
        55      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_22_w ; mv_x_16x32_dp_w = mv_x_16x32_23_w ; end

        56      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_32_w ; mv_x_16x32_dp_w = mv_x_16x32_22_w ; end
        57      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_32_w ; mv_x_16x32_dp_w = mv_x_16x32_22_w ; end
        58      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_32_w ; mv_x_16x32_dp_w = mv_x_16x32_22_w ; end
        59      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_32_w ; mv_x_16x32_dp_w = mv_x_16x32_22_w ; end
        60      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_32_w ; mv_x_16x32_dp_w = mv_x_16x32_23_w ; end
        61      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_32_w ; mv_x_16x32_dp_w = mv_x_16x32_23_w ; end
        62      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_32_w ; mv_x_16x32_dp_w = mv_x_16x32_23_w ; end
        63      : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_32_w ; mv_x_16x32_dp_w = mv_x_16x32_23_w ; end
        default : begin mv_x_32x32_dp_w = mv_x_32x32_22_w ; mv_x_32x16_dp_w = mv_x_32x16_32_w ; mv_x_16x32_dp_w = mv_x_16x32_23_w ; end
      endcase
    end
  end

  always @(*) begin // mv_y_32x32_dp_w & mv_y_32x16_dp_w & mv_y_16x32_dp_w
                  begin mv_y_32x32_dp_w = 0               ; mv_y_32x16_dp_w = 0               ; mv_y_16x32_dp_w = 0               ; end
    if( dump_doing_w ) begin                                                                                                      
      case( y_cnt_r )
        00      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_00_w ; mv_y_16x32_dp_w = mv_y_16x32_00_w ; end
        01      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_00_w ; mv_y_16x32_dp_w = mv_y_16x32_00_w ; end
        02      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_00_w ; mv_y_16x32_dp_w = mv_y_16x32_00_w ; end
        03      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_00_w ; mv_y_16x32_dp_w = mv_y_16x32_00_w ; end
        04      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_00_w ; mv_y_16x32_dp_w = mv_y_16x32_01_w ; end
        05      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_00_w ; mv_y_16x32_dp_w = mv_y_16x32_01_w ; end
        06      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_00_w ; mv_y_16x32_dp_w = mv_y_16x32_01_w ; end
        07      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_00_w ; mv_y_16x32_dp_w = mv_y_16x32_01_w ; end

        08      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_00_w ; end
        09      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_00_w ; end
        10      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_00_w ; end
        11      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_00_w ; end
        12      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_01_w ; end
        13      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_01_w ; end
        14      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_01_w ; end
        15      : begin mv_y_32x32_dp_w = mv_y_32x32_00_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_01_w ; end

        16      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_02_w ; mv_y_16x32_dp_w = mv_y_16x32_02_w ; end
        17      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_02_w ; mv_y_16x32_dp_w = mv_y_16x32_02_w ; end
        18      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_02_w ; mv_y_16x32_dp_w = mv_y_16x32_02_w ; end
        19      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_02_w ; mv_y_16x32_dp_w = mv_y_16x32_02_w ; end
        20      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_02_w ; mv_y_16x32_dp_w = mv_y_16x32_03_w ; end
        21      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_02_w ; mv_y_16x32_dp_w = mv_y_16x32_03_w ; end
        22      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_02_w ; mv_y_16x32_dp_w = mv_y_16x32_03_w ; end
        23      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_02_w ; mv_y_16x32_dp_w = mv_y_16x32_03_w ; end

        24      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_12_w ; mv_y_16x32_dp_w = mv_y_16x32_02_w ; end
        25      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_12_w ; mv_y_16x32_dp_w = mv_y_16x32_02_w ; end
        26      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_12_w ; mv_y_16x32_dp_w = mv_y_16x32_02_w ; end
        27      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_12_w ; mv_y_16x32_dp_w = mv_y_16x32_02_w ; end
        28      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_12_w ; mv_y_16x32_dp_w = mv_y_16x32_03_w ; end
        29      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_12_w ; mv_y_16x32_dp_w = mv_y_16x32_03_w ; end
        30      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_12_w ; mv_y_16x32_dp_w = mv_y_16x32_03_w ; end
        31      : begin mv_y_32x32_dp_w = mv_y_32x32_02_w ; mv_y_32x16_dp_w = mv_y_32x16_12_w ; mv_y_16x32_dp_w = mv_y_16x32_03_w ; end

        32      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_20_w ; end
        33      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_20_w ; end
        34      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_20_w ; end
        35      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_20_w ; end
        36      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_21_w ; end
        37      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_21_w ; end
        38      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_21_w ; end
        39      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_20_w ; mv_y_16x32_dp_w = mv_y_16x32_21_w ; end

        40      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_30_w ; mv_y_16x32_dp_w = mv_y_16x32_20_w ; end
        41      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_30_w ; mv_y_16x32_dp_w = mv_y_16x32_20_w ; end
        42      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_30_w ; mv_y_16x32_dp_w = mv_y_16x32_20_w ; end
        43      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_30_w ; mv_y_16x32_dp_w = mv_y_16x32_20_w ; end
        44      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_30_w ; mv_y_16x32_dp_w = mv_y_16x32_21_w ; end
        45      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_30_w ; mv_y_16x32_dp_w = mv_y_16x32_21_w ; end
        46      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_30_w ; mv_y_16x32_dp_w = mv_y_16x32_21_w ; end
        47      : begin mv_y_32x32_dp_w = mv_y_32x32_20_w ; mv_y_32x16_dp_w = mv_y_32x16_30_w ; mv_y_16x32_dp_w = mv_y_16x32_21_w ; end

        48      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_22_w ; mv_y_16x32_dp_w = mv_y_16x32_22_w ; end
        49      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_22_w ; mv_y_16x32_dp_w = mv_y_16x32_22_w ; end
        50      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_22_w ; mv_y_16x32_dp_w = mv_y_16x32_22_w ; end
        51      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_22_w ; mv_y_16x32_dp_w = mv_y_16x32_22_w ; end
        52      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_22_w ; mv_y_16x32_dp_w = mv_y_16x32_23_w ; end
        53      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_22_w ; mv_y_16x32_dp_w = mv_y_16x32_23_w ; end
        54      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_22_w ; mv_y_16x32_dp_w = mv_y_16x32_23_w ; end
        55      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_22_w ; mv_y_16x32_dp_w = mv_y_16x32_23_w ; end

        56      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_32_w ; mv_y_16x32_dp_w = mv_y_16x32_22_w ; end
        57      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_32_w ; mv_y_16x32_dp_w = mv_y_16x32_22_w ; end
        58      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_32_w ; mv_y_16x32_dp_w = mv_y_16x32_22_w ; end
        59      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_32_w ; mv_y_16x32_dp_w = mv_y_16x32_22_w ; end
        60      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_32_w ; mv_y_16x32_dp_w = mv_y_16x32_23_w ; end
        61      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_32_w ; mv_y_16x32_dp_w = mv_y_16x32_23_w ; end
        62      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_32_w ; mv_y_16x32_dp_w = mv_y_16x32_23_w ; end
        63      : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_32_w ; mv_y_16x32_dp_w = mv_y_16x32_23_w ; end
        default : begin mv_y_32x32_dp_w = mv_y_32x32_22_w ; mv_y_32x16_dp_w = mv_y_32x16_32_w ; mv_y_16x32_dp_w = mv_y_16x32_23_w ; end
      endcase
    end
  end

  always @(*) begin // mv_x_16x16_dp_w & mv_x_16x08_dp_w & mv_x_08x16_dp_w
                  begin mv_x_16x16_dp_w = 0               ; mv_x_16x08_dp_w = 0               ; mv_x_08x16_dp_w = 0               ; end
    if( dump_doing_w ) begin                                                                                                     
      case( y_cnt_r )
        00      : begin mv_x_16x16_dp_w = mv_x_16x16_00_w ; mv_x_16x08_dp_w = mv_x_16x08_00_w ; mv_x_08x16_dp_w = mv_x_08x16_00_w ; end
        01      : begin mv_x_16x16_dp_w = mv_x_16x16_00_w ; mv_x_16x08_dp_w = mv_x_16x08_00_w ; mv_x_08x16_dp_w = mv_x_08x16_01_w ; end
        02      : begin mv_x_16x16_dp_w = mv_x_16x16_00_w ; mv_x_16x08_dp_w = mv_x_16x08_10_w ; mv_x_08x16_dp_w = mv_x_08x16_00_w ; end
        03      : begin mv_x_16x16_dp_w = mv_x_16x16_00_w ; mv_x_16x08_dp_w = mv_x_16x08_10_w ; mv_x_08x16_dp_w = mv_x_08x16_01_w ; end
        04      : begin mv_x_16x16_dp_w = mv_x_16x16_02_w ; mv_x_16x08_dp_w = mv_x_16x08_02_w ; mv_x_08x16_dp_w = mv_x_08x16_02_w ; end
        05      : begin mv_x_16x16_dp_w = mv_x_16x16_02_w ; mv_x_16x08_dp_w = mv_x_16x08_02_w ; mv_x_08x16_dp_w = mv_x_08x16_03_w ; end
        06      : begin mv_x_16x16_dp_w = mv_x_16x16_02_w ; mv_x_16x08_dp_w = mv_x_16x08_12_w ; mv_x_08x16_dp_w = mv_x_08x16_02_w ; end
        07      : begin mv_x_16x16_dp_w = mv_x_16x16_02_w ; mv_x_16x08_dp_w = mv_x_16x08_12_w ; mv_x_08x16_dp_w = mv_x_08x16_03_w ; end

        08      : begin mv_x_16x16_dp_w = mv_x_16x16_20_w ; mv_x_16x08_dp_w = mv_x_16x08_20_w ; mv_x_08x16_dp_w = mv_x_08x16_20_w ; end
        09      : begin mv_x_16x16_dp_w = mv_x_16x16_20_w ; mv_x_16x08_dp_w = mv_x_16x08_20_w ; mv_x_08x16_dp_w = mv_x_08x16_21_w ; end
        10      : begin mv_x_16x16_dp_w = mv_x_16x16_20_w ; mv_x_16x08_dp_w = mv_x_16x08_30_w ; mv_x_08x16_dp_w = mv_x_08x16_20_w ; end
        11      : begin mv_x_16x16_dp_w = mv_x_16x16_20_w ; mv_x_16x08_dp_w = mv_x_16x08_30_w ; mv_x_08x16_dp_w = mv_x_08x16_21_w ; end
        12      : begin mv_x_16x16_dp_w = mv_x_16x16_22_w ; mv_x_16x08_dp_w = mv_x_16x08_22_w ; mv_x_08x16_dp_w = mv_x_08x16_22_w ; end
        13      : begin mv_x_16x16_dp_w = mv_x_16x16_22_w ; mv_x_16x08_dp_w = mv_x_16x08_22_w ; mv_x_08x16_dp_w = mv_x_08x16_23_w ; end
        14      : begin mv_x_16x16_dp_w = mv_x_16x16_22_w ; mv_x_16x08_dp_w = mv_x_16x08_32_w ; mv_x_08x16_dp_w = mv_x_08x16_22_w ; end
        15      : begin mv_x_16x16_dp_w = mv_x_16x16_22_w ; mv_x_16x08_dp_w = mv_x_16x08_32_w ; mv_x_08x16_dp_w = mv_x_08x16_23_w ; end

        16      : begin mv_x_16x16_dp_w = mv_x_16x16_04_w ; mv_x_16x08_dp_w = mv_x_16x08_04_w ; mv_x_08x16_dp_w = mv_x_08x16_04_w ; end
        17      : begin mv_x_16x16_dp_w = mv_x_16x16_04_w ; mv_x_16x08_dp_w = mv_x_16x08_04_w ; mv_x_08x16_dp_w = mv_x_08x16_05_w ; end
        18      : begin mv_x_16x16_dp_w = mv_x_16x16_04_w ; mv_x_16x08_dp_w = mv_x_16x08_14_w ; mv_x_08x16_dp_w = mv_x_08x16_04_w ; end
        19      : begin mv_x_16x16_dp_w = mv_x_16x16_04_w ; mv_x_16x08_dp_w = mv_x_16x08_14_w ; mv_x_08x16_dp_w = mv_x_08x16_05_w ; end
        20      : begin mv_x_16x16_dp_w = mv_x_16x16_06_w ; mv_x_16x08_dp_w = mv_x_16x08_06_w ; mv_x_08x16_dp_w = mv_x_08x16_06_w ; end
        21      : begin mv_x_16x16_dp_w = mv_x_16x16_06_w ; mv_x_16x08_dp_w = mv_x_16x08_06_w ; mv_x_08x16_dp_w = mv_x_08x16_07_w ; end
        22      : begin mv_x_16x16_dp_w = mv_x_16x16_06_w ; mv_x_16x08_dp_w = mv_x_16x08_16_w ; mv_x_08x16_dp_w = mv_x_08x16_06_w ; end
        23      : begin mv_x_16x16_dp_w = mv_x_16x16_06_w ; mv_x_16x08_dp_w = mv_x_16x08_16_w ; mv_x_08x16_dp_w = mv_x_08x16_07_w ; end

        24      : begin mv_x_16x16_dp_w = mv_x_16x16_24_w ; mv_x_16x08_dp_w = mv_x_16x08_24_w ; mv_x_08x16_dp_w = mv_x_08x16_24_w ; end
        25      : begin mv_x_16x16_dp_w = mv_x_16x16_24_w ; mv_x_16x08_dp_w = mv_x_16x08_24_w ; mv_x_08x16_dp_w = mv_x_08x16_25_w ; end
        26      : begin mv_x_16x16_dp_w = mv_x_16x16_24_w ; mv_x_16x08_dp_w = mv_x_16x08_34_w ; mv_x_08x16_dp_w = mv_x_08x16_24_w ; end
        27      : begin mv_x_16x16_dp_w = mv_x_16x16_24_w ; mv_x_16x08_dp_w = mv_x_16x08_34_w ; mv_x_08x16_dp_w = mv_x_08x16_25_w ; end
        28      : begin mv_x_16x16_dp_w = mv_x_16x16_26_w ; mv_x_16x08_dp_w = mv_x_16x08_26_w ; mv_x_08x16_dp_w = mv_x_08x16_26_w ; end
        29      : begin mv_x_16x16_dp_w = mv_x_16x16_26_w ; mv_x_16x08_dp_w = mv_x_16x08_26_w ; mv_x_08x16_dp_w = mv_x_08x16_27_w ; end
        30      : begin mv_x_16x16_dp_w = mv_x_16x16_26_w ; mv_x_16x08_dp_w = mv_x_16x08_36_w ; mv_x_08x16_dp_w = mv_x_08x16_26_w ; end
        31      : begin mv_x_16x16_dp_w = mv_x_16x16_26_w ; mv_x_16x08_dp_w = mv_x_16x08_36_w ; mv_x_08x16_dp_w = mv_x_08x16_27_w ; end

        32      : begin mv_x_16x16_dp_w = mv_x_16x16_40_w ; mv_x_16x08_dp_w = mv_x_16x08_40_w ; mv_x_08x16_dp_w = mv_x_08x16_40_w ; end
        33      : begin mv_x_16x16_dp_w = mv_x_16x16_40_w ; mv_x_16x08_dp_w = mv_x_16x08_40_w ; mv_x_08x16_dp_w = mv_x_08x16_41_w ; end
        34      : begin mv_x_16x16_dp_w = mv_x_16x16_40_w ; mv_x_16x08_dp_w = mv_x_16x08_50_w ; mv_x_08x16_dp_w = mv_x_08x16_40_w ; end
        35      : begin mv_x_16x16_dp_w = mv_x_16x16_40_w ; mv_x_16x08_dp_w = mv_x_16x08_50_w ; mv_x_08x16_dp_w = mv_x_08x16_41_w ; end
        36      : begin mv_x_16x16_dp_w = mv_x_16x16_42_w ; mv_x_16x08_dp_w = mv_x_16x08_42_w ; mv_x_08x16_dp_w = mv_x_08x16_42_w ; end
        37      : begin mv_x_16x16_dp_w = mv_x_16x16_42_w ; mv_x_16x08_dp_w = mv_x_16x08_42_w ; mv_x_08x16_dp_w = mv_x_08x16_43_w ; end
        38      : begin mv_x_16x16_dp_w = mv_x_16x16_42_w ; mv_x_16x08_dp_w = mv_x_16x08_52_w ; mv_x_08x16_dp_w = mv_x_08x16_42_w ; end
        39      : begin mv_x_16x16_dp_w = mv_x_16x16_42_w ; mv_x_16x08_dp_w = mv_x_16x08_52_w ; mv_x_08x16_dp_w = mv_x_08x16_43_w ; end

        40      : begin mv_x_16x16_dp_w = mv_x_16x16_60_w ; mv_x_16x08_dp_w = mv_x_16x08_60_w ; mv_x_08x16_dp_w = mv_x_08x16_60_w ; end
        41      : begin mv_x_16x16_dp_w = mv_x_16x16_60_w ; mv_x_16x08_dp_w = mv_x_16x08_60_w ; mv_x_08x16_dp_w = mv_x_08x16_61_w ; end
        42      : begin mv_x_16x16_dp_w = mv_x_16x16_60_w ; mv_x_16x08_dp_w = mv_x_16x08_70_w ; mv_x_08x16_dp_w = mv_x_08x16_60_w ; end
        43      : begin mv_x_16x16_dp_w = mv_x_16x16_60_w ; mv_x_16x08_dp_w = mv_x_16x08_70_w ; mv_x_08x16_dp_w = mv_x_08x16_61_w ; end
        44      : begin mv_x_16x16_dp_w = mv_x_16x16_62_w ; mv_x_16x08_dp_w = mv_x_16x08_62_w ; mv_x_08x16_dp_w = mv_x_08x16_62_w ; end
        45      : begin mv_x_16x16_dp_w = mv_x_16x16_62_w ; mv_x_16x08_dp_w = mv_x_16x08_62_w ; mv_x_08x16_dp_w = mv_x_08x16_63_w ; end
        46      : begin mv_x_16x16_dp_w = mv_x_16x16_62_w ; mv_x_16x08_dp_w = mv_x_16x08_72_w ; mv_x_08x16_dp_w = mv_x_08x16_62_w ; end
        47      : begin mv_x_16x16_dp_w = mv_x_16x16_62_w ; mv_x_16x08_dp_w = mv_x_16x08_72_w ; mv_x_08x16_dp_w = mv_x_08x16_63_w ; end

        48      : begin mv_x_16x16_dp_w = mv_x_16x16_44_w ; mv_x_16x08_dp_w = mv_x_16x08_44_w ; mv_x_08x16_dp_w = mv_x_08x16_44_w ; end
        49      : begin mv_x_16x16_dp_w = mv_x_16x16_44_w ; mv_x_16x08_dp_w = mv_x_16x08_44_w ; mv_x_08x16_dp_w = mv_x_08x16_45_w ; end
        50      : begin mv_x_16x16_dp_w = mv_x_16x16_44_w ; mv_x_16x08_dp_w = mv_x_16x08_54_w ; mv_x_08x16_dp_w = mv_x_08x16_44_w ; end
        51      : begin mv_x_16x16_dp_w = mv_x_16x16_44_w ; mv_x_16x08_dp_w = mv_x_16x08_54_w ; mv_x_08x16_dp_w = mv_x_08x16_45_w ; end
        52      : begin mv_x_16x16_dp_w = mv_x_16x16_46_w ; mv_x_16x08_dp_w = mv_x_16x08_46_w ; mv_x_08x16_dp_w = mv_x_08x16_46_w ; end
        53      : begin mv_x_16x16_dp_w = mv_x_16x16_46_w ; mv_x_16x08_dp_w = mv_x_16x08_46_w ; mv_x_08x16_dp_w = mv_x_08x16_47_w ; end
        54      : begin mv_x_16x16_dp_w = mv_x_16x16_46_w ; mv_x_16x08_dp_w = mv_x_16x08_56_w ; mv_x_08x16_dp_w = mv_x_08x16_46_w ; end
        55      : begin mv_x_16x16_dp_w = mv_x_16x16_46_w ; mv_x_16x08_dp_w = mv_x_16x08_56_w ; mv_x_08x16_dp_w = mv_x_08x16_47_w ; end

        56      : begin mv_x_16x16_dp_w = mv_x_16x16_64_w ; mv_x_16x08_dp_w = mv_x_16x08_64_w ; mv_x_08x16_dp_w = mv_x_08x16_64_w ; end
        57      : begin mv_x_16x16_dp_w = mv_x_16x16_64_w ; mv_x_16x08_dp_w = mv_x_16x08_64_w ; mv_x_08x16_dp_w = mv_x_08x16_65_w ; end
        58      : begin mv_x_16x16_dp_w = mv_x_16x16_64_w ; mv_x_16x08_dp_w = mv_x_16x08_74_w ; mv_x_08x16_dp_w = mv_x_08x16_64_w ; end
        59      : begin mv_x_16x16_dp_w = mv_x_16x16_64_w ; mv_x_16x08_dp_w = mv_x_16x08_74_w ; mv_x_08x16_dp_w = mv_x_08x16_65_w ; end
        60      : begin mv_x_16x16_dp_w = mv_x_16x16_66_w ; mv_x_16x08_dp_w = mv_x_16x08_66_w ; mv_x_08x16_dp_w = mv_x_08x16_66_w ; end
        61      : begin mv_x_16x16_dp_w = mv_x_16x16_66_w ; mv_x_16x08_dp_w = mv_x_16x08_66_w ; mv_x_08x16_dp_w = mv_x_08x16_67_w ; end
        62      : begin mv_x_16x16_dp_w = mv_x_16x16_66_w ; mv_x_16x08_dp_w = mv_x_16x08_76_w ; mv_x_08x16_dp_w = mv_x_08x16_66_w ; end
        63      : begin mv_x_16x16_dp_w = mv_x_16x16_66_w ; mv_x_16x08_dp_w = mv_x_16x08_76_w ; mv_x_08x16_dp_w = mv_x_08x16_67_w ; end
        default : begin mv_x_16x16_dp_w = mv_x_16x16_66_w ; mv_x_16x08_dp_w = mv_x_16x08_76_w ; mv_x_08x16_dp_w = mv_x_08x16_67_w ; end
      endcase
    end
  end

  always @(*) begin // mv_y_16x16_dp_w & mv_y_16x08_dp_w & mv_y_08x16_dp_w
                  begin mv_y_16x16_dp_w = 0               ; mv_y_16x08_dp_w = 0               ; mv_y_08x16_dp_w = 0               ; end
    if( dump_doing_w ) begin                                                                                                     
      case( y_cnt_r )
        00      : begin mv_y_16x16_dp_w = mv_y_16x16_00_w ; mv_y_16x08_dp_w = mv_y_16x08_00_w ; mv_y_08x16_dp_w = mv_y_08x16_00_w ; end
        01      : begin mv_y_16x16_dp_w = mv_y_16x16_00_w ; mv_y_16x08_dp_w = mv_y_16x08_00_w ; mv_y_08x16_dp_w = mv_y_08x16_01_w ; end
        02      : begin mv_y_16x16_dp_w = mv_y_16x16_00_w ; mv_y_16x08_dp_w = mv_y_16x08_10_w ; mv_y_08x16_dp_w = mv_y_08x16_00_w ; end
        03      : begin mv_y_16x16_dp_w = mv_y_16x16_00_w ; mv_y_16x08_dp_w = mv_y_16x08_10_w ; mv_y_08x16_dp_w = mv_y_08x16_01_w ; end
        04      : begin mv_y_16x16_dp_w = mv_y_16x16_02_w ; mv_y_16x08_dp_w = mv_y_16x08_02_w ; mv_y_08x16_dp_w = mv_y_08x16_02_w ; end
        05      : begin mv_y_16x16_dp_w = mv_y_16x16_02_w ; mv_y_16x08_dp_w = mv_y_16x08_02_w ; mv_y_08x16_dp_w = mv_y_08x16_03_w ; end
        06      : begin mv_y_16x16_dp_w = mv_y_16x16_02_w ; mv_y_16x08_dp_w = mv_y_16x08_12_w ; mv_y_08x16_dp_w = mv_y_08x16_02_w ; end
        07      : begin mv_y_16x16_dp_w = mv_y_16x16_02_w ; mv_y_16x08_dp_w = mv_y_16x08_12_w ; mv_y_08x16_dp_w = mv_y_08x16_03_w ; end

        08      : begin mv_y_16x16_dp_w = mv_y_16x16_20_w ; mv_y_16x08_dp_w = mv_y_16x08_20_w ; mv_y_08x16_dp_w = mv_y_08x16_20_w ; end
        09      : begin mv_y_16x16_dp_w = mv_y_16x16_20_w ; mv_y_16x08_dp_w = mv_y_16x08_20_w ; mv_y_08x16_dp_w = mv_y_08x16_21_w ; end
        10      : begin mv_y_16x16_dp_w = mv_y_16x16_20_w ; mv_y_16x08_dp_w = mv_y_16x08_30_w ; mv_y_08x16_dp_w = mv_y_08x16_20_w ; end
        11      : begin mv_y_16x16_dp_w = mv_y_16x16_20_w ; mv_y_16x08_dp_w = mv_y_16x08_30_w ; mv_y_08x16_dp_w = mv_y_08x16_21_w ; end
        12      : begin mv_y_16x16_dp_w = mv_y_16x16_22_w ; mv_y_16x08_dp_w = mv_y_16x08_22_w ; mv_y_08x16_dp_w = mv_y_08x16_22_w ; end
        13      : begin mv_y_16x16_dp_w = mv_y_16x16_22_w ; mv_y_16x08_dp_w = mv_y_16x08_22_w ; mv_y_08x16_dp_w = mv_y_08x16_23_w ; end
        14      : begin mv_y_16x16_dp_w = mv_y_16x16_22_w ; mv_y_16x08_dp_w = mv_y_16x08_32_w ; mv_y_08x16_dp_w = mv_y_08x16_22_w ; end
        15      : begin mv_y_16x16_dp_w = mv_y_16x16_22_w ; mv_y_16x08_dp_w = mv_y_16x08_32_w ; mv_y_08x16_dp_w = mv_y_08x16_23_w ; end

        16      : begin mv_y_16x16_dp_w = mv_y_16x16_04_w ; mv_y_16x08_dp_w = mv_y_16x08_04_w ; mv_y_08x16_dp_w = mv_y_08x16_04_w ; end
        17      : begin mv_y_16x16_dp_w = mv_y_16x16_04_w ; mv_y_16x08_dp_w = mv_y_16x08_04_w ; mv_y_08x16_dp_w = mv_y_08x16_05_w ; end
        18      : begin mv_y_16x16_dp_w = mv_y_16x16_04_w ; mv_y_16x08_dp_w = mv_y_16x08_14_w ; mv_y_08x16_dp_w = mv_y_08x16_04_w ; end
        19      : begin mv_y_16x16_dp_w = mv_y_16x16_04_w ; mv_y_16x08_dp_w = mv_y_16x08_14_w ; mv_y_08x16_dp_w = mv_y_08x16_05_w ; end
        20      : begin mv_y_16x16_dp_w = mv_y_16x16_06_w ; mv_y_16x08_dp_w = mv_y_16x08_06_w ; mv_y_08x16_dp_w = mv_y_08x16_06_w ; end
        21      : begin mv_y_16x16_dp_w = mv_y_16x16_06_w ; mv_y_16x08_dp_w = mv_y_16x08_06_w ; mv_y_08x16_dp_w = mv_y_08x16_07_w ; end
        22      : begin mv_y_16x16_dp_w = mv_y_16x16_06_w ; mv_y_16x08_dp_w = mv_y_16x08_16_w ; mv_y_08x16_dp_w = mv_y_08x16_06_w ; end
        23      : begin mv_y_16x16_dp_w = mv_y_16x16_06_w ; mv_y_16x08_dp_w = mv_y_16x08_16_w ; mv_y_08x16_dp_w = mv_y_08x16_07_w ; end

        24      : begin mv_y_16x16_dp_w = mv_y_16x16_24_w ; mv_y_16x08_dp_w = mv_y_16x08_24_w ; mv_y_08x16_dp_w = mv_y_08x16_24_w ; end
        25      : begin mv_y_16x16_dp_w = mv_y_16x16_24_w ; mv_y_16x08_dp_w = mv_y_16x08_24_w ; mv_y_08x16_dp_w = mv_y_08x16_25_w ; end
        26      : begin mv_y_16x16_dp_w = mv_y_16x16_24_w ; mv_y_16x08_dp_w = mv_y_16x08_34_w ; mv_y_08x16_dp_w = mv_y_08x16_24_w ; end
        27      : begin mv_y_16x16_dp_w = mv_y_16x16_24_w ; mv_y_16x08_dp_w = mv_y_16x08_34_w ; mv_y_08x16_dp_w = mv_y_08x16_25_w ; end
        28      : begin mv_y_16x16_dp_w = mv_y_16x16_26_w ; mv_y_16x08_dp_w = mv_y_16x08_26_w ; mv_y_08x16_dp_w = mv_y_08x16_26_w ; end
        29      : begin mv_y_16x16_dp_w = mv_y_16x16_26_w ; mv_y_16x08_dp_w = mv_y_16x08_26_w ; mv_y_08x16_dp_w = mv_y_08x16_27_w ; end
        30      : begin mv_y_16x16_dp_w = mv_y_16x16_26_w ; mv_y_16x08_dp_w = mv_y_16x08_36_w ; mv_y_08x16_dp_w = mv_y_08x16_26_w ; end
        31      : begin mv_y_16x16_dp_w = mv_y_16x16_26_w ; mv_y_16x08_dp_w = mv_y_16x08_36_w ; mv_y_08x16_dp_w = mv_y_08x16_27_w ; end

        32      : begin mv_y_16x16_dp_w = mv_y_16x16_40_w ; mv_y_16x08_dp_w = mv_y_16x08_40_w ; mv_y_08x16_dp_w = mv_y_08x16_40_w ; end
        33      : begin mv_y_16x16_dp_w = mv_y_16x16_40_w ; mv_y_16x08_dp_w = mv_y_16x08_40_w ; mv_y_08x16_dp_w = mv_y_08x16_41_w ; end
        34      : begin mv_y_16x16_dp_w = mv_y_16x16_40_w ; mv_y_16x08_dp_w = mv_y_16x08_50_w ; mv_y_08x16_dp_w = mv_y_08x16_40_w ; end
        35      : begin mv_y_16x16_dp_w = mv_y_16x16_40_w ; mv_y_16x08_dp_w = mv_y_16x08_50_w ; mv_y_08x16_dp_w = mv_y_08x16_41_w ; end
        36      : begin mv_y_16x16_dp_w = mv_y_16x16_42_w ; mv_y_16x08_dp_w = mv_y_16x08_42_w ; mv_y_08x16_dp_w = mv_y_08x16_42_w ; end
        37      : begin mv_y_16x16_dp_w = mv_y_16x16_42_w ; mv_y_16x08_dp_w = mv_y_16x08_42_w ; mv_y_08x16_dp_w = mv_y_08x16_43_w ; end
        38      : begin mv_y_16x16_dp_w = mv_y_16x16_42_w ; mv_y_16x08_dp_w = mv_y_16x08_52_w ; mv_y_08x16_dp_w = mv_y_08x16_42_w ; end
        39      : begin mv_y_16x16_dp_w = mv_y_16x16_42_w ; mv_y_16x08_dp_w = mv_y_16x08_52_w ; mv_y_08x16_dp_w = mv_y_08x16_43_w ; end

        40      : begin mv_y_16x16_dp_w = mv_y_16x16_60_w ; mv_y_16x08_dp_w = mv_y_16x08_60_w ; mv_y_08x16_dp_w = mv_y_08x16_60_w ; end
        41      : begin mv_y_16x16_dp_w = mv_y_16x16_60_w ; mv_y_16x08_dp_w = mv_y_16x08_60_w ; mv_y_08x16_dp_w = mv_y_08x16_61_w ; end
        42      : begin mv_y_16x16_dp_w = mv_y_16x16_60_w ; mv_y_16x08_dp_w = mv_y_16x08_70_w ; mv_y_08x16_dp_w = mv_y_08x16_60_w ; end
        43      : begin mv_y_16x16_dp_w = mv_y_16x16_60_w ; mv_y_16x08_dp_w = mv_y_16x08_70_w ; mv_y_08x16_dp_w = mv_y_08x16_61_w ; end
        44      : begin mv_y_16x16_dp_w = mv_y_16x16_62_w ; mv_y_16x08_dp_w = mv_y_16x08_62_w ; mv_y_08x16_dp_w = mv_y_08x16_62_w ; end
        45      : begin mv_y_16x16_dp_w = mv_y_16x16_62_w ; mv_y_16x08_dp_w = mv_y_16x08_62_w ; mv_y_08x16_dp_w = mv_y_08x16_63_w ; end
        46      : begin mv_y_16x16_dp_w = mv_y_16x16_62_w ; mv_y_16x08_dp_w = mv_y_16x08_72_w ; mv_y_08x16_dp_w = mv_y_08x16_62_w ; end
        47      : begin mv_y_16x16_dp_w = mv_y_16x16_62_w ; mv_y_16x08_dp_w = mv_y_16x08_72_w ; mv_y_08x16_dp_w = mv_y_08x16_63_w ; end

        48      : begin mv_y_16x16_dp_w = mv_y_16x16_44_w ; mv_y_16x08_dp_w = mv_y_16x08_44_w ; mv_y_08x16_dp_w = mv_y_08x16_44_w ; end
        49      : begin mv_y_16x16_dp_w = mv_y_16x16_44_w ; mv_y_16x08_dp_w = mv_y_16x08_44_w ; mv_y_08x16_dp_w = mv_y_08x16_45_w ; end
        50      : begin mv_y_16x16_dp_w = mv_y_16x16_44_w ; mv_y_16x08_dp_w = mv_y_16x08_54_w ; mv_y_08x16_dp_w = mv_y_08x16_44_w ; end
        51      : begin mv_y_16x16_dp_w = mv_y_16x16_44_w ; mv_y_16x08_dp_w = mv_y_16x08_54_w ; mv_y_08x16_dp_w = mv_y_08x16_45_w ; end
        52      : begin mv_y_16x16_dp_w = mv_y_16x16_46_w ; mv_y_16x08_dp_w = mv_y_16x08_46_w ; mv_y_08x16_dp_w = mv_y_08x16_46_w ; end
        53      : begin mv_y_16x16_dp_w = mv_y_16x16_46_w ; mv_y_16x08_dp_w = mv_y_16x08_46_w ; mv_y_08x16_dp_w = mv_y_08x16_47_w ; end
        54      : begin mv_y_16x16_dp_w = mv_y_16x16_46_w ; mv_y_16x08_dp_w = mv_y_16x08_56_w ; mv_y_08x16_dp_w = mv_y_08x16_46_w ; end
        55      : begin mv_y_16x16_dp_w = mv_y_16x16_46_w ; mv_y_16x08_dp_w = mv_y_16x08_56_w ; mv_y_08x16_dp_w = mv_y_08x16_47_w ; end

        56      : begin mv_y_16x16_dp_w = mv_y_16x16_64_w ; mv_y_16x08_dp_w = mv_y_16x08_64_w ; mv_y_08x16_dp_w = mv_y_08x16_64_w ; end
        57      : begin mv_y_16x16_dp_w = mv_y_16x16_64_w ; mv_y_16x08_dp_w = mv_y_16x08_64_w ; mv_y_08x16_dp_w = mv_y_08x16_65_w ; end
        58      : begin mv_y_16x16_dp_w = mv_y_16x16_64_w ; mv_y_16x08_dp_w = mv_y_16x08_74_w ; mv_y_08x16_dp_w = mv_y_08x16_64_w ; end
        59      : begin mv_y_16x16_dp_w = mv_y_16x16_64_w ; mv_y_16x08_dp_w = mv_y_16x08_74_w ; mv_y_08x16_dp_w = mv_y_08x16_65_w ; end
        60      : begin mv_y_16x16_dp_w = mv_y_16x16_66_w ; mv_y_16x08_dp_w = mv_y_16x08_66_w ; mv_y_08x16_dp_w = mv_y_08x16_66_w ; end
        61      : begin mv_y_16x16_dp_w = mv_y_16x16_66_w ; mv_y_16x08_dp_w = mv_y_16x08_66_w ; mv_y_08x16_dp_w = mv_y_08x16_67_w ; end
        62      : begin mv_y_16x16_dp_w = mv_y_16x16_66_w ; mv_y_16x08_dp_w = mv_y_16x08_76_w ; mv_y_08x16_dp_w = mv_y_08x16_66_w ; end
        63      : begin mv_y_16x16_dp_w = mv_y_16x16_66_w ; mv_y_16x08_dp_w = mv_y_16x08_76_w ; mv_y_08x16_dp_w = mv_y_08x16_67_w ; end
        default : begin mv_y_16x16_dp_w = mv_y_16x16_66_w ; mv_y_16x08_dp_w = mv_y_16x08_76_w ; mv_y_08x16_dp_w = mv_y_08x16_67_w ; end
      endcase
    end
  end

  always @(*) begin // mv_x_08x08_dp_w & mv_y_08x08_dp_w
                  begin mv_x_08x08_dp_w = 0               ; mv_y_08x08_dp_w = 0               ;    end
    if( dump_doing_w ) begin
      case( y_cnt_r )
        00      : begin mv_x_08x08_dp_w = mv_x_08x08_00_w ; mv_y_08x08_dp_w = mv_y_08x08_00_w ;    end
        01      : begin mv_x_08x08_dp_w = mv_x_08x08_01_w ; mv_y_08x08_dp_w = mv_y_08x08_01_w ;    end
        02      : begin mv_x_08x08_dp_w = mv_x_08x08_10_w ; mv_y_08x08_dp_w = mv_y_08x08_10_w ;    end
        03      : begin mv_x_08x08_dp_w = mv_x_08x08_11_w ; mv_y_08x08_dp_w = mv_y_08x08_11_w ;    end
        04      : begin mv_x_08x08_dp_w = mv_x_08x08_02_w ; mv_y_08x08_dp_w = mv_y_08x08_02_w ;    end
        05      : begin mv_x_08x08_dp_w = mv_x_08x08_03_w ; mv_y_08x08_dp_w = mv_y_08x08_03_w ;    end
        06      : begin mv_x_08x08_dp_w = mv_x_08x08_12_w ; mv_y_08x08_dp_w = mv_y_08x08_12_w ;    end
        07      : begin mv_x_08x08_dp_w = mv_x_08x08_13_w ; mv_y_08x08_dp_w = mv_y_08x08_13_w ;    end

        08      : begin mv_x_08x08_dp_w = mv_x_08x08_20_w ; mv_y_08x08_dp_w = mv_y_08x08_20_w ;    end
        09      : begin mv_x_08x08_dp_w = mv_x_08x08_21_w ; mv_y_08x08_dp_w = mv_y_08x08_21_w ;    end
        10      : begin mv_x_08x08_dp_w = mv_x_08x08_30_w ; mv_y_08x08_dp_w = mv_y_08x08_30_w ;    end
        11      : begin mv_x_08x08_dp_w = mv_x_08x08_31_w ; mv_y_08x08_dp_w = mv_y_08x08_31_w ;    end
        12      : begin mv_x_08x08_dp_w = mv_x_08x08_22_w ; mv_y_08x08_dp_w = mv_y_08x08_22_w ;    end
        13      : begin mv_x_08x08_dp_w = mv_x_08x08_23_w ; mv_y_08x08_dp_w = mv_y_08x08_23_w ;    end
        14      : begin mv_x_08x08_dp_w = mv_x_08x08_32_w ; mv_y_08x08_dp_w = mv_y_08x08_32_w ;    end
        15      : begin mv_x_08x08_dp_w = mv_x_08x08_33_w ; mv_y_08x08_dp_w = mv_y_08x08_33_w ;    end

        16      : begin mv_x_08x08_dp_w = mv_x_08x08_04_w ; mv_y_08x08_dp_w = mv_y_08x08_04_w ;    end
        17      : begin mv_x_08x08_dp_w = mv_x_08x08_05_w ; mv_y_08x08_dp_w = mv_y_08x08_05_w ;    end
        18      : begin mv_x_08x08_dp_w = mv_x_08x08_14_w ; mv_y_08x08_dp_w = mv_y_08x08_14_w ;    end
        19      : begin mv_x_08x08_dp_w = mv_x_08x08_15_w ; mv_y_08x08_dp_w = mv_y_08x08_15_w ;    end
        20      : begin mv_x_08x08_dp_w = mv_x_08x08_06_w ; mv_y_08x08_dp_w = mv_y_08x08_06_w ;    end
        21      : begin mv_x_08x08_dp_w = mv_x_08x08_07_w ; mv_y_08x08_dp_w = mv_y_08x08_07_w ;    end
        22      : begin mv_x_08x08_dp_w = mv_x_08x08_16_w ; mv_y_08x08_dp_w = mv_y_08x08_16_w ;    end
        23      : begin mv_x_08x08_dp_w = mv_x_08x08_17_w ; mv_y_08x08_dp_w = mv_y_08x08_17_w ;    end

        24      : begin mv_x_08x08_dp_w = mv_x_08x08_24_w ; mv_y_08x08_dp_w = mv_y_08x08_24_w ;    end
        25      : begin mv_x_08x08_dp_w = mv_x_08x08_25_w ; mv_y_08x08_dp_w = mv_y_08x08_25_w ;    end
        26      : begin mv_x_08x08_dp_w = mv_x_08x08_34_w ; mv_y_08x08_dp_w = mv_y_08x08_34_w ;    end
        27      : begin mv_x_08x08_dp_w = mv_x_08x08_35_w ; mv_y_08x08_dp_w = mv_y_08x08_35_w ;    end
        28      : begin mv_x_08x08_dp_w = mv_x_08x08_26_w ; mv_y_08x08_dp_w = mv_y_08x08_26_w ;    end
        29      : begin mv_x_08x08_dp_w = mv_x_08x08_27_w ; mv_y_08x08_dp_w = mv_y_08x08_27_w ;    end
        30      : begin mv_x_08x08_dp_w = mv_x_08x08_36_w ; mv_y_08x08_dp_w = mv_y_08x08_36_w ;    end
        31      : begin mv_x_08x08_dp_w = mv_x_08x08_37_w ; mv_y_08x08_dp_w = mv_y_08x08_37_w ;    end

        32      : begin mv_x_08x08_dp_w = mv_x_08x08_40_w ; mv_y_08x08_dp_w = mv_y_08x08_40_w ;    end
        33      : begin mv_x_08x08_dp_w = mv_x_08x08_41_w ; mv_y_08x08_dp_w = mv_y_08x08_41_w ;    end
        34      : begin mv_x_08x08_dp_w = mv_x_08x08_50_w ; mv_y_08x08_dp_w = mv_y_08x08_50_w ;    end
        35      : begin mv_x_08x08_dp_w = mv_x_08x08_51_w ; mv_y_08x08_dp_w = mv_y_08x08_51_w ;    end
        36      : begin mv_x_08x08_dp_w = mv_x_08x08_42_w ; mv_y_08x08_dp_w = mv_y_08x08_42_w ;    end
        37      : begin mv_x_08x08_dp_w = mv_x_08x08_43_w ; mv_y_08x08_dp_w = mv_y_08x08_43_w ;    end
        38      : begin mv_x_08x08_dp_w = mv_x_08x08_52_w ; mv_y_08x08_dp_w = mv_y_08x08_52_w ;    end
        39      : begin mv_x_08x08_dp_w = mv_x_08x08_53_w ; mv_y_08x08_dp_w = mv_y_08x08_53_w ;    end

        40      : begin mv_x_08x08_dp_w = mv_x_08x08_60_w ; mv_y_08x08_dp_w = mv_y_08x08_60_w ;    end
        41      : begin mv_x_08x08_dp_w = mv_x_08x08_61_w ; mv_y_08x08_dp_w = mv_y_08x08_61_w ;    end
        42      : begin mv_x_08x08_dp_w = mv_x_08x08_70_w ; mv_y_08x08_dp_w = mv_y_08x08_70_w ;    end
        43      : begin mv_x_08x08_dp_w = mv_x_08x08_71_w ; mv_y_08x08_dp_w = mv_y_08x08_71_w ;    end
        44      : begin mv_x_08x08_dp_w = mv_x_08x08_62_w ; mv_y_08x08_dp_w = mv_y_08x08_62_w ;    end
        45      : begin mv_x_08x08_dp_w = mv_x_08x08_63_w ; mv_y_08x08_dp_w = mv_y_08x08_63_w ;    end
        46      : begin mv_x_08x08_dp_w = mv_x_08x08_72_w ; mv_y_08x08_dp_w = mv_y_08x08_72_w ;    end
        47      : begin mv_x_08x08_dp_w = mv_x_08x08_73_w ; mv_y_08x08_dp_w = mv_y_08x08_73_w ;    end

        48      : begin mv_x_08x08_dp_w = mv_x_08x08_44_w ; mv_y_08x08_dp_w = mv_y_08x08_44_w ;    end
        49      : begin mv_x_08x08_dp_w = mv_x_08x08_45_w ; mv_y_08x08_dp_w = mv_y_08x08_45_w ;    end
        50      : begin mv_x_08x08_dp_w = mv_x_08x08_54_w ; mv_y_08x08_dp_w = mv_y_08x08_54_w ;    end
        51      : begin mv_x_08x08_dp_w = mv_x_08x08_55_w ; mv_y_08x08_dp_w = mv_y_08x08_55_w ;    end
        52      : begin mv_x_08x08_dp_w = mv_x_08x08_46_w ; mv_y_08x08_dp_w = mv_y_08x08_46_w ;    end
        53      : begin mv_x_08x08_dp_w = mv_x_08x08_47_w ; mv_y_08x08_dp_w = mv_y_08x08_47_w ;    end
        54      : begin mv_x_08x08_dp_w = mv_x_08x08_56_w ; mv_y_08x08_dp_w = mv_y_08x08_56_w ;    end
        55      : begin mv_x_08x08_dp_w = mv_x_08x08_57_w ; mv_y_08x08_dp_w = mv_y_08x08_57_w ;    end

        56      : begin mv_x_08x08_dp_w = mv_x_08x08_64_w ; mv_y_08x08_dp_w = mv_y_08x08_64_w ;    end
        57      : begin mv_x_08x08_dp_w = mv_x_08x08_65_w ; mv_y_08x08_dp_w = mv_y_08x08_65_w ;    end
        58      : begin mv_x_08x08_dp_w = mv_x_08x08_74_w ; mv_y_08x08_dp_w = mv_y_08x08_74_w ;    end
        59      : begin mv_x_08x08_dp_w = mv_x_08x08_75_w ; mv_y_08x08_dp_w = mv_y_08x08_75_w ;    end
        60      : begin mv_x_08x08_dp_w = mv_x_08x08_66_w ; mv_y_08x08_dp_w = mv_y_08x08_66_w ;    end
        61      : begin mv_x_08x08_dp_w = mv_x_08x08_67_w ; mv_y_08x08_dp_w = mv_y_08x08_67_w ;    end
        62      : begin mv_x_08x08_dp_w = mv_x_08x08_76_w ; mv_y_08x08_dp_w = mv_y_08x08_76_w ;    end
        63      : begin mv_x_08x08_dp_w = mv_x_08x08_77_w ; mv_y_08x08_dp_w = mv_y_08x08_77_w ;    end
        default : begin mv_x_08x08_dp_w = mv_x_08x08_77_w ; mv_y_08x08_dp_w = mv_y_08x08_77_w ;    end
      endcase
    end
  end

  always @(*) begin // dump_w
                  begin dump_w = 0                                                                          ;    end
    if( dump_doing_w ) begin
      case( y_cnt_r )
        00      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[41:40]};    end
        01      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[41:40]};    end
        02      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[41:40]};    end
        03      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[41:40]};    end
        04      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[39:38]};    end
        05      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[39:38]};    end
        06      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[39:38]};    end
        07      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[39:38]};    end

        08      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[37:36]};    end
        09      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[37:36]};    end
        10      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[37:36]};    end
        11      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[37:36]};    end
        12      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[35:34]};    end
        13      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[35:34]};    end
        14      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[35:34]};    end
        15      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[9:8] ,fmeif_partition_o[35:34]};    end

        16      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[33:32]};    end
        17      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[33:32]};    end
        18      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[33:32]};    end
        19      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[33:32]};    end
        20      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[31:30]};    end
        21      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[31:30]};    end
        22      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[31:30]};    end
        23      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[31:30]};    end

        24      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[29:28]};    end
        25      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[29:28]};    end
        26      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[29:28]};    end
        27      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[29:28]};    end
        28      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[27:26]};    end
        29      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[27:26]};    end
        30      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[27:26]};    end
        31      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[7:6] ,fmeif_partition_o[27:26]};    end

        32      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[25:24]};    end
        33      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[25:24]};    end
        34      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[25:24]};    end
        35      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[25:24]};    end
        36      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[23:22]};    end
        37      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[23:22]};    end
        38      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[23:22]};    end
        39      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[23:22]};    end

        40      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[21:20]};    end
        41      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[21:20]};    end
        42      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[21:20]};    end
        43      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[21:20]};    end
        44      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[19:18]};    end
        45      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[19:18]};    end
        46      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[19:18]};    end
        47      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[5:4] ,fmeif_partition_o[19:18]};    end

        48      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[17:16]};    end
        49      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[17:16]};    end
        50      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[17:16]};    end
        51      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[17:16]};    end
        52      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[15:14]};    end
        53      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[15:14]};    end
        54      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[15:14]};    end
        55      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[15:14]};    end

        56      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[13:12]};    end
        57      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[13:12]};    end
        58      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[13:12]};    end
        59      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[13:12]};    end
        60      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[11:10]};    end
        61      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[11:10]};    end
        62      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[11:10]};    end
        63      : begin dump_w = { fmeif_partition_o[1:0] ,fmeif_partition_o[3:2] ,fmeif_partition_o[11:10]};    end
        default : begin dump_w = 0                                                                          ;    end
      endcase                                                                                               
    end
  end

  always @(*) begin
    casex( dump_w )
      6'b00xxxx : begin mv_x_dump_r = mv_x_64x64_dp_w ; mv_y_dump_r = mv_y_64x64_dp_w ; end
      6'b01xxxx : begin mv_x_dump_r = mv_x_64x32_dp_w ; mv_y_dump_r = mv_y_64x32_dp_w ; end
      6'b10xxxx : begin mv_x_dump_r = mv_x_32x64_dp_w ; mv_y_dump_r = mv_y_32x64_dp_w ; end
      6'b1100xx : begin mv_x_dump_r = mv_x_32x32_dp_w ; mv_y_dump_r = mv_y_32x32_dp_w ; end
      6'b1101xx : begin mv_x_dump_r = mv_x_32x16_dp_w ; mv_y_dump_r = mv_y_32x16_dp_w ; end
      6'b1110xx : begin mv_x_dump_r = mv_x_16x32_dp_w ; mv_y_dump_r = mv_y_16x32_dp_w ; end
      6'b111100 : begin mv_x_dump_r = mv_x_16x16_dp_w ; mv_y_dump_r = mv_y_16x16_dp_w ; end
      6'b111101 : begin mv_x_dump_r = mv_x_16x08_dp_w ; mv_y_dump_r = mv_y_16x08_dp_w ; end
      6'b111110 : begin mv_x_dump_r = mv_x_08x16_dp_w ; mv_y_dump_r = mv_y_08x16_dp_w ; end
      6'b111111 : begin mv_x_dump_r = mv_x_08x08_dp_w ; mv_y_dump_r = mv_y_08x08_dp_w ; end
      default   : begin mv_x_dump_r = 0               ; mv_y_dump_r = 0               ; end
    endcase
  end


endmodule