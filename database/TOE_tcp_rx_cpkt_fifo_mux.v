`timescale 1ns / 1ps
module cpkt_fifo_mux #(
    parameter    IN1_HPRIORITY    = 0         ,   
    parameter    CELL_WID         = 128       ,   
    parameter    CELL_SZ          = 4         ,   
    parameter    CELL_GAP         = 8         ,   
    parameter    FIFO1_AWID       = 4         ,   
    parameter    FIFO2_AWID       = 9         ,   
    parameter    FIFO1_AFULL_TH   = 8         ,   
    parameter    FIFO2_AFULL_TH   = 8         ,   
    parameter    FIFO1_TYPE       = "block"   ,
    parameter    FIFO2_TYPE       = "block"   ,
    parameter    DBG_WID          = 32            
) (
    input   wire                    clk           ,
    input   wire                    rst           ,
    input   wire                    clr_cnt       ,
    input   wire                    fst_in_vld       ,
    input   wire  [CELL_WID-1:0]    fst_in_dat       ,
    output  wire                    fst_in_rdy       ,
    output  wire                    fst_in_rd        ,
    output  wire                    fst_in_woverflow ,
    output  wire                    fst_in_roverflow ,
    output  wire  [FIFO1_AWID:0]    fst_in_fifo_cnt_free ,
    input   wire                    snd_in_vld       ,
    input   wire  [CELL_WID-1:0]    snd_in_dat       ,
    output  wire                    snd_in_rdy       ,
    output  wire                    snd_in_rd        ,
    output  wire                    snd_in_woverflow ,
    output  wire                    snd_in_roverflow ,
    output  wire  [FIFO2_AWID:0]    snd_in_fifo_cnt_free ,
    output  wire                    out_msg_vld  ,
    output  wire  [1       -1:0]    out_msg_data ,
    output  wire                    out_vld       ,
    output  wire  [CELL_WID-1:0]    out_data      ,
    input   wire                    out_rdy       ,
    output  wire  [DBG_WID-1:0]     dbg_sig
);
wire                    fst_in_fifo_rd    ;   
wire  [CELL_WID-1:0]    fst_in_fifo_rdata  ; 
wire                    fst_in_fifo_nempty ;  
wire                    snd_in_fifo_rd    ;   
wire  [CELL_WID-1:0]    snd_in_fifo_rdata  ; 
wire                    snd_in_fifo_nempty ;  
bfifo #(
    .RAM_STYLE     ( FIFO1_TYPE              ),              
    .DWID          ( CELL_WID                ),
    .AWID          ( FIFO1_AWID              ),
    .AFULL_TH      ( FIFO1_AFULL_TH          ),
    .AEMPTY_TH     ( 8                       ),
    .DBG_WID       ( 32                      )
) u_fst_in_bd_fifo (
    .clk           ( clk                     ),
    .rst           ( rst                     ),
    .wen           ( fst_in_vld                 ),
    .wdata         ( fst_in_dat                 ),
    .nafull        ( fst_in_rdy                 ),
    .nfull         (                         ),
    .woverflow     ( fst_in_woverflow           ),
    .cnt_free      ( fst_in_fifo_cnt_free       ),
    .ren           ( fst_in_fifo_rd            ),
    .rdata         ( fst_in_fifo_rdata          ),
    .nempty        ( fst_in_fifo_nempty         ),
    .naempty       (                         ),
    .roverflow     ( fst_in_roverflow           ),
    .cnt_used      (                         ),
    .dbg_sig       ( dbg_sig[31:28]          )
);
assign fst_in_rd = fst_in_fifo_rd ;
bfifo #(
    .RAM_STYLE     ( FIFO2_TYPE              ),              
    .DWID          ( CELL_WID                ),
    .AWID          ( FIFO2_AWID              ),
    .AFULL_TH      ( FIFO2_AFULL_TH          ),
    .AEMPTY_TH     ( 8                       ),
    .DBG_WID       ( 32                      )
) u_snd_in_bd_fifo (
    .clk           ( clk                     ),
    .rst           ( rst                     ),
    .wen           ( snd_in_vld                 ),
    .wdata         ( snd_in_dat                 ),
    .nafull        ( snd_in_rdy                 ),
    .nfull         (                         ),
    .woverflow     ( snd_in_woverflow           ),
    .cnt_free      ( snd_in_fifo_cnt_free       ),
    .ren           ( snd_in_fifo_rd            ),
    .rdata         ( snd_in_fifo_rdata          ),
    .nempty        ( snd_in_fifo_nempty         ),
    .naempty       (                         ),
    .roverflow     ( snd_in_roverflow           ),
    .cnt_used      (                         ),
    .dbg_sig       ( dbg_sig[27:24]          )
);
assign snd_in_rd = snd_in_fifo_rd ;

cpkt_mux #(
    .CHN0_HPRIORY ( IN1_HPRIORITY )   ,   
    .UNUM     (2          ),
    .CELLSZ   (CELL_SZ    ),
    .GAP      (CELL_GAP   ),
    .DWID     (CELL_WID   ),
    .DBG_WID  (32         )
) u_cpkt_mux(
    .clk              ( clk                                     ) ,
    .rst              ( rst                                     ) ,
    .in_cpkt_ren      ({ snd_in_fifo_rd   , fst_in_fifo_rd    }     ),
    .in_cpkt_rdata    ({ snd_in_fifo_rdata , fst_in_fifo_rdata  }     ),
    .in_cpkt_nempty   ({ snd_in_fifo_nempty, fst_in_fifo_nempty }     ),
    .out_info_wen     ( out_msg_vld                            ),
    .out_info_wdata   ( out_msg_data                           ),
    .out_info_nafull  ( 1'b1                                    ),
    .out_cpkt_wen     ( out_vld                                 ),
    .out_cpkt_wdata   ( out_data                                ),
    .out_cpkt_nafull  ( out_rdy                                 ),
    .dbg_sig          (                                         )
);
wire [31:0]    fst_in_cnt      ;
wire [31:0]    snd_in_cnt      ;
//dbg_cnt #( .DWID(32), .LEVEL_EDGE(1) ) u_dbg_fst_in_cnt   ( .clk(clk), .rst(rst), .clr_cnt(clr_cnt), .add_cnt( fst_in_vld ),                                      .dbg_cnt( fst_in_cnt    ) );
//dbg_cnt #( .DWID(32), .LEVEL_EDGE(1) ) u_dbg_snd_in_cnt   ( .clk(clk), .rst(rst), .clr_cnt(clr_cnt), .add_cnt( snd_in_vld ),                                      .dbg_cnt( snd_in_cnt    ) );
assign dbg_sig[23:0] = { fst_in_cnt[11:0], snd_in_cnt[11:0] };
endmodule
