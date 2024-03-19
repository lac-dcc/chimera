//
//------------------------------------------------------------------------------
//     Copyright (c) 2017 Huawei Technologies Co., Ltd. All Rights Reserved.
//
//     This program is free software; you can redistribute it and/or modify
//     it under the terms of the Huawei Software License (the "License").
//     A copy of the License is located in the "LICENSE" file accompanying
//     this file.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//     Huawei Software License for more details.
//------------------------------------------------------------------------------

`resetall
`timescale 1ns/1ns 

module  smt_con#
(
        parameter AXI_WID = 4'h0


)
               (
                 //globe signals
                 input                            clk_sys                     ,
                 input                            rst                         ,
                 //tx to ddr pkt
                 input                            tx2ddr_cfifo_wr             ,
                 input     [71:0]                 tx2ddr_cfifo_wdata          ,
                 output                           ddr2tx_cfifo_ff             ,
                 input                            tx2ddr_dfifo_wr             ,
                 input     [539:0]                tx2ddr_dfifo_wdata          ,
                 output                           ddr2tx_dfifo_ff             ,

                 output   reg     [3:0]           ddr2tx_bid                  ,
                 output   reg     [1:0]           ddr2tx_bresp                ,
                 output   reg                     ddr2tx_bvalid               ,

                 //kernel to ddr pkt
                 input                            kernel2ddr_cfifo_wr         ,
                 input     [71:0]                 kernel2ddr_cfifo_wdata      ,
                 output                           ddr2kernel_cfifo_ff         ,
                 input                            kernel2ddr_dfifo_wr         ,
                 input     [539:0]                kernel2ddr_dfifo_wdata      ,
                 output                           ddr2kernel_dfifo_ff         ,
                 
                 output   wire    [3:0]           ddr2kernel_bid              ,
                 output   wire    [1:0]           ddr2kernel_bresp            ,
                 output   reg                     ddr2kernel_bvalid           ,

                 //send pkt to ddr : axi 4 interface
                 output   wire    [3:0]           axi4_m2s_awid               ,
                 output   wire    [63:0]          axi4_m2s_awaddr             ,
                 output   wire    [7:0]           axi4_m2s_awlen              ,
                 output   wire    [2:0]           axi4_m2s_awsize             ,
                 output   wire    [74:0]          axi4_m2s_awuser             ,
                                                    
                 output   wire                    axi4_m2s_awvalid            ,
                 input    wire                    axi4_s2m_awready            ,
                                                   
                 output   wire    [3:0]           axi4_m2s_wid                ,
                 output   wire    [511:0]         axi4_m2s_wdata              ,
                 output   wire    [63:0]          axi4_m2s_wstrb              ,
                 output   wire                    axi4_m2s_wlast              ,
                 output   wire                    axi4_m2s_wvalid             ,
                 input    wire                    axi4_s2m_wready             ,
                                                     
                 input    wire    [3:0]           axi4_s2m_bid                ,
                 input    wire    [1:0]           axi4_s2m_bresp              ,
                 input    wire                    axi4_s2m_bvalid             ,
                 output   wire                    axi4_m2s_bready             ,               
                 //ae to ve read command
                 output   wire    [7:0]           tx2ddr_cfifo_stat           ,
                 output   wire    [7:0]           tx2ddr_dfifo_stat           ,
                 output   wire    [7:0]           kernel2ddr_cfifo_stat       ,
                 output   wire    [7:0]           kernel2ddr_dfifo_stat       ,
                 output   wire    [7:0]           ddr_cfifo_stat              ,
                 output   wire    [7:0]           ddr_dfifo_stat              ,
                 output   wire    [7:0]           sel_cfifo_stat              ,
                 output   wire    [13:0]          fifo_state                  ,
                 output   wire                    axi4_s2m_rsp_ok_cnt_en      ,               
                 output   wire                    axi4_s2m_rsp_exok_cnt_en    ,               
                 output   wire                    axi4_s2m_rsp_slverr_cnt_en  ,               
                 output   wire                    axi4_s2m_rsp_decerr_cnt_en  ,               
                 output   wire                    tx2ddr_cfifo_cnt_en         ,               
                 output   wire                    tx2ddr_dfifo_eop_cnt_en     ,               
                 output   wire                    kernel2ddr_cfifo_cnt_en     ,               
                 output   wire                    kernel2ddr_dfifo_eop_cnt_en ,               
                 output   wire                    ddr2tx_bvalid_cnt_en        ,               
                 output   wire                    ddr2kernel_bvalid_cnt_en    ,               
                 output   wire                    pkt_fifo_rdata_sop_cnt_en      
                  );

//********************************************************************************************************************
wire              fifo_sel                  ;
wire              fifo_sel_rdata            ;
wire              fifo_sel_empty            ;
wire              fifo_sel_ff               ;
wire              tx2ddr_cfifo_ren          ;
wire [71:0]       tx2ddr_cfifo_rdata        ;
wire              tx2ddr_cfifo_empty        ;
wire [539:0]      tx2ddr_dfifo_rdata        ;
wire              tx2ddr_dfifo_empty        ;
wire              kernel2ddr_cfifo_ren      ;
wire [71:0]       kernel2ddr_cfifo_rdata    ;
wire              kernel2ddr_cfifo_empty    ;
wire [539:0]      kernel2ddr_dfifo_rdata    ;
wire              kernel2ddr_dfifo_empty    ;
wire              ddr_cfifo_empty           ;
wire              ddr_cfifo_ff              ;
wire              ddr_cfifo_ren             ;
wire [71:0]       ddr_cfifo_rdata           ;
wire              pkt_fifo_ef               ;
wire              ddr_dfifo_ff              ;
wire              pkt_fifo_rd               ;
wire [539:0]      pkt_fifo_rdata            ;
wire              pkt_fifo_rdata_sop        ;
wire [1:0]        rr2_req                   ;

reg               tx2ddr_dfifo_ren          ;
reg               fifo_sel_1dly             ;
reg               kernel2ddr_dfifo_ren      ;
reg               ddr_cfifo_wr              ;
reg  [71:0]       ddr_cfifo_wdata           ;
reg               ddr_dfifo_wr              ;
reg  [539:0]      ddr_dfifo_wdata           ;
reg               pkt_fifo_rdata_sop_lock   ;
reg               tx2ddr_dfifo_sop_lock     ;
reg               kernel2ddr_dfifo_sop_lock ;
reg               rr2_req_en                ;
reg               rr2_req_en_1dly           ;
reg               rr2_req_en_2dly           ;
//********************************************************************************************************************

assign tx2ddr_cfifo_cnt_en         = tx2ddr_cfifo_wr;
assign tx2ddr_dfifo_eop_cnt_en     = tx2ddr_dfifo_wr & (tx2ddr_dfifo_wdata[519]);
assign kernel2ddr_cfifo_cnt_en     = kernel2ddr_cfifo_wr;
assign kernel2ddr_dfifo_eop_cnt_en = kernel2ddr_dfifo_wr & (kernel2ddr_dfifo_wdata[519]);
assign ddr2tx_bvalid_cnt_en        = ddr2tx_bvalid;
assign ddr2kernel_bvalid_cnt_en    = ddr2kernel_bvalid;
assign pkt_fifo_rdata_sop_cnt_en   = pkt_fifo_rdata_sop;
assign fifo_state                  = {fifo_sel_ff,fifo_sel_empty,
                                     ddr2tx_cfifo_ff,tx2ddr_cfifo_empty, 
                                     ddr2tx_dfifo_ff,tx2ddr_dfifo_empty, 
                                     ddr2kernel_cfifo_ff,kernel2ddr_cfifo_empty, 
                                     ddr2kernel_dfifo_ff,kernel2ddr_dfifo_empty, 
                                     ddr_cfifo_ff,ddr_cfifo_empty,
                                     ddr_dfifo_ff,pkt_fifo_ef};
//********************************************************************************************************************
always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        fifo_sel_1dly   <= 1'd0;
        rr2_req_en_1dly <= 1'd0;
        rr2_req_en_2dly <= 1'd0;
    end
    else begin
        fifo_sel_1dly   <= fifo_sel;
        rr2_req_en_1dly <= rr2_req_en;
        rr2_req_en_2dly <= rr2_req_en_1dly;
    end
end

assign rr2_req = {(~kernel2ddr_cfifo_empty),(~tx2ddr_cfifo_empty)};

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        rr2_req_en <= 1'd0;
    end
    else if(rr2_req_en == 1'd1)begin
        rr2_req_en <= 1'd0;
    end
    else if((tx2ddr_dfifo_ren == 1'd0)&&(kernel2ddr_dfifo_ren == 1'd0)&&
            ((tx2ddr_cfifo_empty == 1'd0)||(kernel2ddr_cfifo_empty == 1'd0))&&
            (rr2_req_en_1dly == 1'd0)&&(rr2_req_en_2dly == 1'd0)&&(ddr_dfifo_ff == 1'd0)&&(fifo_sel_ff == 1'd0))begin
        rr2_req_en <= 1'd1;
    end
end

rr2
   #(
    .REQ_W     (2   ),
    .RR_NUM_W  (1   )
    )
u_rr2
    (
    .reset     (rst              ),
    .clks      (clk_sys          ),

    .req       (rr2_req[1 : 0]   ),
    .req_vld   (rr2_req_en       ),
    .rr_bit    (fifo_sel         )
    );

assign tx2ddr_cfifo_ren     = tx2ddr_dfifo_ren & tx2ddr_dfifo_rdata[520];
assign kernel2ddr_cfifo_ren = kernel2ddr_dfifo_ren & kernel2ddr_dfifo_rdata[520];

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        ddr_cfifo_wr <= 1'd0;
    end
    else begin
        ddr_cfifo_wr <= tx2ddr_cfifo_ren | kernel2ddr_cfifo_ren;
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        tx2ddr_dfifo_ren <= 1'd0;
    end
    else if((tx2ddr_dfifo_ren == 1'd1)&&(tx2ddr_dfifo_rdata[519] == 1'd1))begin
        tx2ddr_dfifo_ren <= 1'd0;
    end
    else if((rr2_req_en_1dly == 1'd1)&&(fifo_sel == 1'd0))begin
        tx2ddr_dfifo_ren <= 1'd1;
    end
    else ;
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        kernel2ddr_dfifo_ren <= 1'd0;
    end
    else if((kernel2ddr_dfifo_ren == 1'd1)&&(kernel2ddr_dfifo_rdata[519] == 1'd1))begin
        kernel2ddr_dfifo_ren <= 1'd0;
    end
    else if((rr2_req_en_1dly == 1'd1)&&(fifo_sel == 1'd1))begin
        kernel2ddr_dfifo_ren <= 1'd1;
    end
    else ;
end

always@(posedge clk_sys)
begin
    if(tx2ddr_cfifo_ren == 1'd1)begin
        ddr_cfifo_wdata <= tx2ddr_cfifo_rdata;
    end
    else begin
        ddr_cfifo_wdata <= kernel2ddr_cfifo_rdata;
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        ddr_dfifo_wr <= 1'd0;
    end
    else begin
        ddr_dfifo_wr <= tx2ddr_dfifo_ren | kernel2ddr_dfifo_ren;
    end
end

always@(posedge clk_sys)
begin
    if(tx2ddr_dfifo_ren == 1'd1)begin
        ddr_dfifo_wdata <= tx2ddr_dfifo_rdata;
    end
    else begin
        ddr_dfifo_wdata <= kernel2ddr_dfifo_rdata;
    end
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        tx2ddr_dfifo_sop_lock <= 1'b1;
    end
    else if ((tx2ddr_dfifo_wr & tx2ddr_dfifo_wdata[519]) == 1'b1) begin//eop
        tx2ddr_dfifo_sop_lock <= 1'b1;
    end
    else if (tx2ddr_dfifo_wr == 1'b1) begin
        tx2ddr_dfifo_sop_lock <= 1'b0;
    end
    else ;
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        kernel2ddr_dfifo_sop_lock <= 1'b1;
    end
    else if ((kernel2ddr_dfifo_wr & kernel2ddr_dfifo_wdata[519]) == 1'b1) begin//eop
        kernel2ddr_dfifo_sop_lock <= 1'b1;
    end
    else if (kernel2ddr_dfifo_wr == 1'b1) begin
        kernel2ddr_dfifo_sop_lock <= 1'b0;
    end
    else ;
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        pkt_fifo_rdata_sop_lock <= 1'b1;
    end
    else if ((pkt_fifo_rd & pkt_fifo_rdata[519]) == 1'b1) begin
        pkt_fifo_rdata_sop_lock <= 1'b1;
    end
    else if (pkt_fifo_rd == 1'b1) begin
        pkt_fifo_rdata_sop_lock <= 1'b0;
    end
    else ;
end

assign pkt_fifo_rdata_sop = pkt_fifo_rd & pkt_fifo_rdata_sop_lock;

//axi-4 interface parameter
assign ddr_cfifo_ren   = pkt_fifo_rdata_sop            ;
assign axi4_m2s_awlen  = ddr_cfifo_rdata[50:43]        ; 
assign axi4_m2s_awsize = ddr_cfifo_rdata[42:40]        ;
assign axi4_m2s_awaddr = {28'd0,ddr_cfifo_rdata[35:0]} ;
assign axi4_m2s_awid   = ddr_cfifo_rdata[39:36]        ;
assign axi4_m2s_awuser = 75'd0                         ;

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        ddr2tx_bvalid <= 1'd0;
    end
    else begin
        ddr2tx_bvalid <= axi4_s2m_bvalid & axi4_m2s_bready & (~fifo_sel_rdata);
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        ddr2kernel_bvalid <= 1'd0;
    end
    else begin
        ddr2kernel_bvalid <= axi4_s2m_bvalid & axi4_m2s_bready & fifo_sel_rdata;
    end
end

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        ddr2tx_bid <= 4'd0;
    end
    else begin
        ddr2tx_bid <= axi4_s2m_bid;
    end
end

assign ddr2kernel_bid = ddr2tx_bid;

always@(posedge clk_sys or posedge rst)
begin
    if(rst == 1'd1)begin
        ddr2tx_bresp <= 2'd0;
    end
    else begin
        ddr2tx_bresp <= axi4_s2m_bresp;
    end
end

assign ddr2kernel_bresp = ddr2tx_bresp;

//********************************************************************************************************************
//tx cfifo
sfifo_cbb_enc # (
        .FIFO_PARITY          ( "FALSE"                ),
        .PARITY_DLY           ( "FALSE"                ),
        .FIFO_DO_REG          ( 0                      ), 
        .RAM_DO_REG           ( 0                      ),
        .FIFO_ATTR            ( "ahead"                ),
        .FIFO_WIDTH           ( 72                     ),
        .FIFO_DEEP            ( 9                      ),
        .AFULL_OVFL_THD       ( 450                    ),
        .AFULL_UNFL_THD       ( 450                    ),
        .AEMPTY_THD           ( 8                      ) 
        )
U_tx2ddr_cfifo  (
        .clk_sys              ( clk_sys                ),
        .reset                ( rst                    ),
        .wen                  ( tx2ddr_cfifo_wr        ),
        .wdata                ( tx2ddr_cfifo_wdata     ),
        .ren                  ( tx2ddr_cfifo_ren       ),
        .rdata                ( tx2ddr_cfifo_rdata     ),
        .full                 (                        ),
        .empty                ( tx2ddr_cfifo_empty     ),
        .usedw                (                        ),
        .afull                ( ddr2tx_cfifo_ff        ), 
        .aempty               (                        ),
        .parity_err           (                        ),
        .fifo_stat            ( tx2ddr_cfifo_stat      ) 
        );

//tx dfifo
sfifo_cbb_enc # (
        .FIFO_PARITY          ( "FALSE"                ),
        .PARITY_DLY           ( "FALSE"                ),
        .FIFO_DO_REG          ( 0                      ), 
        .RAM_DO_REG           ( 0                      ),
        .FIFO_ATTR            ( "ahead"                ),
        .FIFO_WIDTH           ( 540                    ),
        .FIFO_DEEP            ( 9                      ),
        .AFULL_OVFL_THD       ( 440                    ),
        .AFULL_UNFL_THD       ( 440                    ),
        .AEMPTY_THD           ( 8                      ) 
        )
U_tx2ddr_dfifo  (
        .clk_sys              ( clk_sys                ),
        .reset                ( rst                    ),
        .wen                  ( tx2ddr_dfifo_wr        ),
        .wdata                ( {tx2ddr_dfifo_wdata[539:521],tx2ddr_dfifo_sop_lock,tx2ddr_dfifo_wdata[519:0]}     ),
        .ren                  ( tx2ddr_dfifo_ren       ),
        .rdata                ( tx2ddr_dfifo_rdata     ),
        .full                 (                        ),
        .empty                ( tx2ddr_dfifo_empty     ),
        .usedw                (                        ),
        .afull                ( ddr2tx_dfifo_ff        ), 
        .aempty               (                        ),
        .parity_err           (                        ),
        .fifo_stat            ( tx2ddr_dfifo_stat      ) 
        );

//kernel cfifo
sfifo_cbb_enc # (
        .FIFO_PARITY          ( "FALSE"                ),
        .PARITY_DLY           ( "FALSE"                ),
        .FIFO_DO_REG          ( 0                      ), 
        .RAM_DO_REG           ( 0                      ),
        .FIFO_ATTR            ( "ahead"                ),
        .FIFO_WIDTH           ( 72                     ),
        .FIFO_DEEP            ( 9                      ),
        .AFULL_OVFL_THD       ( 450                    ),
        .AFULL_UNFL_THD       ( 450                    ),
        .AEMPTY_THD           ( 8                      ) 
        )
U_kernel2ddr_cfifo  (
        .clk_sys              ( clk_sys                ),
        .reset                ( rst                    ),
        .wen                  ( kernel2ddr_cfifo_wr    ),
        .wdata                ( kernel2ddr_cfifo_wdata ),
        .ren                  ( kernel2ddr_cfifo_ren   ),
        .rdata                ( kernel2ddr_cfifo_rdata ),
        .full                 (                        ),
        .empty                ( kernel2ddr_cfifo_empty ),
        .usedw                (                        ),
        .afull                ( ddr2kernel_cfifo_ff    ), 
        .aempty               (                        ),
        .parity_err           (                        ),
        .fifo_stat            ( kernel2ddr_cfifo_stat  ) 
        );

//kernel dfifo
sfifo_cbb_enc # (
        .FIFO_PARITY          ( "FALSE"                ),
        .PARITY_DLY           ( "FALSE"                ),
        .FIFO_DO_REG          ( 0                      ), 
        .RAM_DO_REG           ( 0                      ),
        .FIFO_ATTR            ( "ahead"                ),
        .FIFO_WIDTH           ( 540                    ),
        .FIFO_DEEP            ( 9                      ),
        .AFULL_OVFL_THD       ( 440                    ),
        .AFULL_UNFL_THD       ( 440                    ),
        .AEMPTY_THD           ( 8                      ) 
        )
U_kernel2ddr_dfifo  (
        .clk_sys              ( clk_sys                ),
        .reset                ( rst                    ),
        .wen                  ( kernel2ddr_dfifo_wr    ),
        .wdata                ( {kernel2ddr_dfifo_wdata[539:521],
                                 kernel2ddr_dfifo_sop_lock,kernel2ddr_dfifo_wdata[519:0]}),
        .ren                  ( kernel2ddr_dfifo_ren   ),
        .rdata                ( kernel2ddr_dfifo_rdata ),
        .full                 (                        ),
        .empty                ( kernel2ddr_dfifo_empty ),
        .usedw                (                        ),
        .afull                ( ddr2kernel_dfifo_ff    ), 
        .aempty               (                        ),
        .parity_err           (                        ),
        .fifo_stat            ( kernel2ddr_dfifo_stat  ) 
        );

//ddr cfifo
sfifo_cbb_enc # (
        .FIFO_PARITY          ( "FALSE"                ),
        .PARITY_DLY           ( "FALSE"                ),
        .FIFO_DO_REG          ( 0                      ), 
        .RAM_DO_REG           ( 0                      ),
        .FIFO_ATTR            ( "ahead"                ),
        .FIFO_WIDTH           ( 72                     ),
        .FIFO_DEEP            ( 9                      ),
        .AFULL_OVFL_THD       ( 450                    ),
        .AFULL_UNFL_THD       ( 450                    ),
        .AEMPTY_THD           ( 8                      ) 
        )
U_ddr_cfifo  (
        .clk_sys              ( clk_sys                ),
        .reset                ( rst                    ),
        .wen                  ( ddr_cfifo_wr           ),
        .wdata                ( ddr_cfifo_wdata        ),
        .ren                  ( ddr_cfifo_ren          ),
        .rdata                ( ddr_cfifo_rdata        ),
        .full                 (                        ),
        .empty                ( ddr_cfifo_empty        ),
        .usedw                (                        ),
        .afull                ( ddr_cfifo_ff           ), 
        .aempty               (                        ),
        .parity_err           (                        ),
        .fifo_stat            ( ddr_cfifo_stat         ) 
        );

//ddr dfifo
sfifo_cbb_enc # (
        .FIFO_PARITY          ( "FALSE"                ),
        .PARITY_DLY           ( "FALSE"                ),
        .FIFO_DO_REG          ( 0                      ), 
        .RAM_DO_REG           ( 0                      ),
        .FIFO_ATTR            ( "ahead"                ),
        .FIFO_WIDTH           ( 540                    ),
        .FIFO_DEEP            ( 9                      ),
        .AFULL_OVFL_THD       ( 440                    ),
        .AFULL_UNFL_THD       ( 440                    ),
        .AEMPTY_THD           ( 8                      ) 
        )
U_ddr_dfifo  (
        .clk_sys              ( clk_sys                ),
        .reset                ( rst                    ),
        .wen                  ( ddr_dfifo_wr           ),
        .wdata                ( ddr_dfifo_wdata        ),
        .ren                  ( pkt_fifo_rd            ),
        .rdata                ( pkt_fifo_rdata         ),
        .full                 (                        ),
        .empty                ( pkt_fifo_ef            ),
        .usedw                (                        ),
        .afull                ( ddr_dfifo_ff           ), 
        .aempty               (                        ),
        .parity_err           (                        ),
        .fifo_stat            ( ddr_dfifo_stat         ) 
        );

sfifo_cbb_enc # (
        .FIFO_PARITY          ( "FALSE"                ),
        .PARITY_DLY           ( "FALSE"                ),
        .FIFO_DO_REG          ( 0                      ), 
        .RAM_DO_REG           ( 0                      ),
        .FIFO_ATTR            ( "ahead"                ),
        .FIFO_WIDTH           ( 1                      ),
        .FIFO_DEEP            ( 9                      ),
        .AFULL_OVFL_THD       ( 450                    ),
        .AFULL_UNFL_THD       ( 450                    ),
        .AEMPTY_THD           ( 8                      ) 
        )
U_sel_cfifo  (
        .clk_sys              ( clk_sys                ),
        .reset                ( rst                    ),
        .wen                  ( ddr_cfifo_wr           ),
        .wdata                ( fifo_sel_1dly          ),
        .ren                  ( axi4_s2m_bvalid & axi4_m2s_bready       ),
        .rdata                ( fifo_sel_rdata         ),
        .full                 (                        ),
        .empty                ( fifo_sel_empty         ),
        .usedw                (                        ),
        .afull                ( fifo_sel_ff            ), 
        .aempty               (                        ),
        .parity_err           (                        ),
        .fifo_stat            ( sel_cfifo_stat         ) 
        );

axi4_m512_mmu 
    #(
        .DATA_WIDTH            ( 512    ),
        .AXI_WID               ( AXI_WID),
        .EOP_POS               ( 519    ),
        .ERR_POS               ( 518    ),
        .MOD_POS               ( 512    ),
        .MOD_WIDTH             ( 6      ),
        .WR_ERR_DROP_EN        ( 1      ) 
    )
u_axi4_m512_mmu
       (
        .reset_clkw                       (rst                        ),             
        .reset_clkr                       (rst                        ),                                           
        .clkw                             (clk_sys                    ),                                           
        .clkr                             (clk_sys                    ),

        .fifo2axi_ef                      (pkt_fifo_ef                ),
        .fifo2axi_rd                      (pkt_fifo_rd                ),
        .fifo2axi_rdata                   (pkt_fifo_rdata             ),  
        .fifo2axi_sop                     (pkt_fifo_rdata[520] & (~pkt_fifo_ef)   ),

        .axi4_m2s_awvalid                 (axi4_m2s_awvalid           ),
        .axi4_s2m_awready                 (axi4_s2m_awready           ),
                                                            
        .axi4_m2s_wid                     (axi4_m2s_wid               ),
        .axi4_m2s_wdata                   (axi4_m2s_wdata             ),
        .axi4_m2s_wstrb                   (axi4_m2s_wstrb             ),
        .axi4_m2s_wlast                   (axi4_m2s_wlast             ),
        .axi4_m2s_wvalid                  (axi4_m2s_wvalid            ),
        .axi4_s2m_wready                  (axi4_s2m_wready            ),
                                                            
        .axi4_s2m_bid                     (axi4_s2m_bid               ),
        .axi4_s2m_bresp                   (axi4_s2m_bresp             ),
        .axi4_s2m_bvalid                  (axi4_s2m_bvalid            ),
        .axi4_m2s_bready                  (axi4_m2s_bready            ),
       
        .cfg_bid_id                       (4'd0                       ),
        .axi4_s2m_rsp_ok_cnt_en           (axi4_s2m_rsp_ok_cnt_en     ),
        .axi4_s2m_rsp_exok_cnt_en         (axi4_s2m_rsp_exok_cnt_en   ),
        .axi4_s2m_rsp_slverr_cnt_en       (axi4_s2m_rsp_slverr_cnt_en ),
        .axi4_s2m_rsp_decerr_cnt_en       (axi4_s2m_rsp_decerr_cnt_en )   
       );

endmodule
