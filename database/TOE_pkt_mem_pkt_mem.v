`timescale 1ns / 1ps
module pkt_mem #(
    parameter    CELL_RAM_AWID = 12          ,   
    parameter    DAT_TYP       = "ETH"       ,   
    parameter    CHN_NUM       = 6           ,   
    parameter    DWID          = 256         ,   
    parameter    MSG_WID         = 13        ,   
    parameter    CRC_WID       = 16          ,   
    parameter    PIMWID        = 48          ,   
    parameter    REQWID        = 37          ,    
    parameter    PTR_WID       = CELL_RAM_AWID-3               
)
(
    input   wire                        clk                         ,   
    input   wire                        rst                         ,   
	output  wire                        fptr_fifo_naempty           ,   
    output  wire [PTR_WID-1:0]          fptr_fifo_cnt_used          , 
    input   wire                        in_cell_vld                 ,   
    output  wire                        in_cell_rdy                 ,   
    input   wire [DWID-1:0]             in_cell_dat                 ,   
    input   wire [MSG_WID-1:0]          in_cell_msg                 ,   
    output  wire                        pkt_info_vld                ,   
    input   wire                        pkt_info_rdy                ,   
    output  wire [PIMWID-1:0]           pkt_info_msg                ,   
    input   wire [1-1:0]                pkt_req_vld                 ,   
    output  wire [1-1:0]                pkt_req_rdy                 ,   
    input   wire [REQWID-1:0]           pkt_req_msg                 ,   
    output  wire [1-1:0]                out_cell_vld                ,   
    input   wire [1-1:0]                out_cell_rdy                ,   
    output  wire [DWID-1:0]             out_cell_dat                ,   
    output  wire [MSG_WID-1:0]          out_cell_msg                    
);
localparam    PLST_WID      = 16                                    ;   
wire                                    fptr_fifo_nfull             ;   
wire                                    fptr_fifo_wen               ;   
wire [PTR_WID-1:0]                      fptr_fifo_wdata             ;   
wire                                    fptr_fifo_nempty            ;   
wire                                    fptr_fifo_ren               ;   
wire [PTR_WID-1:0]                      fptr_fifo_rdata             ;   
wire                                    wr_plst_ram_wen             ;   
wire [PTR_WID-1:0]                      wr_plst_ram_waddr           ;   
wire [PLST_WID-1:0]                     wr_plst_ram_wdata           ;   
wire                                    rd_plst_ram_wen             ;   
wire [PTR_WID-1:0]                      rd_plst_ram_waddr           ;   
wire [PLST_WID-1:0]                     rd_plst_ram_wdata           ;   
wire                                    plst_ram_wen                ;   
wire [PTR_WID-1:0]                      plst_ram_waddr              ;   
wire [PLST_WID-1:0]                     plst_ram_wdata              ;   
wire                                    plst_ram_ren                ;   
wire [PTR_WID-1:0]                      plst_ram_raddr              ;   
wire [PLST_WID-1:0]                     plst_ram_rdata              ;   
wire                                    cell_ram_wen                ;   
wire [CELL_RAM_AWID-1:0]                cell_ram_waddr              ;   
wire [DWID-1:0]                         cell_ram_wdata              ;   
wire                                    cell_ram_ren                ;   
wire [CELL_RAM_AWID-1:0]                cell_ram_raddr              ;   
wire [DWID-1:0]                         cell_ram_rdata              ;   
wire                                    wr_in_cell_rdy              ;   
pkt_mem_wr #(
    .DAT_TYP                ( DAT_TYP                   ),
    .CHN_NUM                ( CHN_NUM                   ),
    .DWID                   ( DWID                      ),
    .MSG_WID                ( MSG_WID                   ),
    .CRC_WID                ( CRC_WID                   ),
    .PIMWID                 ( PIMWID                    ),
    .PTR_WID                ( PTR_WID                   ),
    .PLST_WID               ( PLST_WID                  ),
    .CELL_RAM_AWID          ( CELL_RAM_AWID             )
) u_pkt_mem_wr (
    .clk                    ( clk                       ),              
    .rst                    ( rst                       ),              
    .in_cell_vld            ( in_cell_vld               ),              
    .in_cell_rdy            ( wr_in_cell_rdy            ),              
    .in_cell_dat            ( in_cell_dat               ),              
    .in_cell_msg            ( in_cell_msg               ),              
    .pkt_info_vld           ( pkt_info_vld              ),              
    .pkt_info_rdy           ( pkt_info_rdy              ),              
    .pkt_info_msg           ( pkt_info_msg              ),              
    .fptr_fifo_nempty       ( fptr_fifo_nempty          ),              
    .fptr_fifo_ren          ( fptr_fifo_ren             ),              
    .fptr_fifo_rdata        ( fptr_fifo_rdata           ),              
    .plst_ram_wen           ( wr_plst_ram_wen           ),              
    .plst_ram_waddr         ( wr_plst_ram_waddr         ),              
    .plst_ram_wdata         ( wr_plst_ram_wdata         ),              
    .cell_ram_wen           ( cell_ram_wen              ),              
    .cell_ram_waddr         ( cell_ram_waddr            ),              
    .cell_ram_wdata         ( cell_ram_wdata            )               
);
pkt_mem_rd #(
    .DWID                   ( DWID                      ),
    .MSG_WID                ( MSG_WID                   ),
    .CHN_NUM                ( CHN_NUM                   ),
    .REQWID                 ( REQWID                    ),
    .PTR_WID                ( PTR_WID                   ),
    .PLST_WID               ( PLST_WID                  ),
    .CELL_RAM_AWID          ( CELL_RAM_AWID             )
) u_pkt_mem_rd (
    .clk                    ( clk                       ),              
    .rst                    ( rst                       ),              
    .pkt_req_vld            ( pkt_req_vld               ),              
    .pkt_req_rdy            ( pkt_req_rdy               ),              
    .pkt_req_msg            ( pkt_req_msg               ),              
    .out_cell_vld           ( out_cell_vld              ),              
    .out_cell_rdy           ( out_cell_rdy              ),              
    .out_cell_dat           ( out_cell_dat              ),              
    .out_cell_msg           ( out_cell_msg              ),              
    .fptr_fifo_nfull        ( fptr_fifo_nfull           ),              
    .fptr_fifo_wen          ( fptr_fifo_wen             ),              
    .fptr_fifo_wdata        ( fptr_fifo_wdata           ),              
    .plst_ram_ren           ( plst_ram_ren              ),              
    .plst_ram_raddr         ( plst_ram_raddr            ),              
    .plst_ram_rdata         ( plst_ram_rdata            ),              
    .plst_ram_wen           ( rd_plst_ram_wen           ),              
    .plst_ram_waddr         ( rd_plst_ram_waddr         ),              
    .plst_ram_wdata         ( rd_plst_ram_wdata         ),              
    .cell_ram_ren           ( cell_ram_ren              ),              
    .cell_ram_raddr         ( cell_ram_raddr            ),              
    .cell_ram_rdata         ( cell_ram_rdata            )               
);
assign in_cell_rdy = fptr_fifo_naempty & wr_in_cell_rdy ;
bfifo #(
    .RAM_STYLE              ( "distributed"             ),              
    .DWID                   ( PTR_WID                   ),
    .AWID                   ( PTR_WID                   ),
    .AFULL_TH               ( 8                         ),
    .AEMPTY_TH              ( 8                         ),
    .DBG_WID                ( 32                        )
) u_fptr_fifo (
    .clk                    ( clk                       ),              
    .rst                    ( rst                       ),              
    .wen                    ( fptr_fifo_wen             ),              
    .wdata                  ( fptr_fifo_wdata           ),              
    .nfull                  ( fptr_fifo_nfull           ),              
    .nafull                 (                           ),              
    .woverflow              (                           ),              
    .cnt_free               (                           ),              
    .ren                    ( fptr_fifo_ren             ),              
    .rdata                  ( fptr_fifo_rdata           ),              
    .nempty                 ( fptr_fifo_nempty          ),              
    .naempty                ( fptr_fifo_naempty         ),              
    .roverflow              (                           ),              
    .cnt_used               ( fptr_fifo_cnt_used        ),              
    .dbg_sig                (                           )               
);
assign plst_ram_wen   = ( wr_plst_ram_wen == 1'b1 ) ? 1'b1 : rd_plst_ram_wen ;
assign plst_ram_waddr = ( wr_plst_ram_wen == 1'b1 ) ? wr_plst_ram_waddr : rd_plst_ram_waddr ;
assign plst_ram_wdata = ( wr_plst_ram_wen == 1'b1 ) ? wr_plst_ram_wdata : rd_plst_ram_wdata ;
sdp_ram #(
    .RAM_STYLE              ( "block"                   ),              
    .DWID                   ( PLST_WID                  ),
    .AWID                   ( PTR_WID                   ),
    .DBG_WID                ( 32                        )
) u_plst_ram (
    .clk                    ( clk                       ),              
    .waddr                  ( plst_ram_waddr            ),              
    .wen                    ( plst_ram_wen              ),              
    .wdata                  ( plst_ram_wdata            ),              
    .raddr                  ( plst_ram_raddr            ),              
    .ren                    ( plst_ram_ren              ),              
    .rdata                  ( plst_ram_rdata            ),              
    .dbg                    (                           )               
);
sdp_ram #(
    .RAM_STYLE              ( "block"                   ),              
    .DWID                   ( DWID                      ),
    .AWID                   ( CELL_RAM_AWID             ),
    .DBG_WID                ( 32                        )
) u_cell_ram (
    .clk                    ( clk                       ),              
    .waddr                  ( cell_ram_waddr            ),              
    .wen                    ( cell_ram_wen              ),              
    .wdata                  ( cell_ram_wdata            ),              
    .raddr                  ( cell_ram_raddr            ),              
    .ren                    ( cell_ram_ren              ),              
    .rdata                  ( cell_ram_rdata            ),              
    .dbg                    (                           )               
);
endmodule
