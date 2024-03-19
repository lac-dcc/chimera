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

module  kernel #
    (
        parameter A_DTH         =    9        ,
        parameter EOP_POS       =    519      ,
        parameter DDR_NUM       =    4        ,
        parameter ERR_POS       =    518      ,
        parameter FULL_LEVEL    =    9'd400
    )

    (
    //interface with axis_m
    //shell clock and reset
    input                             clk_shell            ,//i 1
    input                             rst_shell            ,//i 1

    //kernel clock and reset
    input                             clk_kernel           ,//i 1
    input                             rst_kernel           ,//i 1

    input        [511:0]              m_axis_rc_tdata      ,//i 512
    input        [74:0]               m_axis_rc_tuser      ,//i 75
    input                             m_axis_rc_tlast      ,//i 1
    input        [63:0]               m_axis_rc_tkeep      ,//i 64
    input                             m_axis_rc_tvalid     ,//i 1
    output  wire                      m_axis_rc_tready     ,//o 1

    //interface with axis_s
    output                            s_axis_rq_tlast      ,//o 1
    output       [511:0]              s_axis_rq_tdata      ,//o 512
    output       [59:0]               s_axis_rq_tuser      ,//o 60
    output  wire [63:0]               s_axis_rq_tkeep      ,//o 64
    input                             s_axis_rq_tready     ,//i 1
    output  wire                      s_axis_rq_tvalid     ,//o 1

    //axi4-write
    output       [4*DDR_NUM-1:0]      axi4_m2s_awid        ,//o 16
    output       [64*DDR_NUM-1:0]     axi4_m2s_awaddr      ,//o 256
    output       [8*DDR_NUM-1:0]      axi4_m2s_awlen       ,//o 32
    output       [3*DDR_NUM-1:0]      axi4_m2s_awsize      ,//o 12
    output       [74*DDR_NUM-1:0]     axi4_m2s_awuser      ,//o 296

    output       [1*DDR_NUM-1:0]      axi4_m2s_awvalid     ,//o 4
    input        [1*DDR_NUM-1:0]      axi4_s2m_awready     ,//i 1

    output       [4*DDR_NUM-1:0]      axi4_m2s_wid         ,//o 16
    output       [512*DDR_NUM-1:0]    axi4_m2s_wdata       ,//o 2048
    output       [64*DDR_NUM-1:0]     axi4_m2s_wstrb       ,//o 256
    output       [1*DDR_NUM-1:0]      axi4_m2s_wlast       ,//o 4
    output       [1*DDR_NUM-1:0]      axi4_m2s_wvalid      ,//o 4
    input        [1*DDR_NUM-1:0]      axi4_s2m_wready      ,//i 4

    input        [4*DDR_NUM-1:0]      axi4_s2m_bid         ,//i 16
    input        [2*DDR_NUM-1:0]      axi4_s2m_bresp       ,//i 8
    input        [1*DDR_NUM-1:0]      axi4_s2m_bvalid      ,//i 4
    output       [1*DDR_NUM-1:0]      axi4_m2s_bready      ,//o 4

    //axi4-write
    output       [4*DDR_NUM-1:0]      axi4m_ddr_arid       ,//o 16
    output       [64*DDR_NUM-1:0]     axi4m_ddr_araddr     ,//o 256
    output       [8*DDR_NUM-1:0]      axi4m_ddr_arlen      ,//o 28
    output       [3*DDR_NUM-1:0]      axi4m_ddr_arsize     ,//o 28
    output       [DDR_NUM-1:0]        axi4m_ddr_arvalid    ,//o 4
    input        [DDR_NUM-1:0]        axi4m_ddr_arready    ,//i 4

    input        [4*DDR_NUM-1:0]      axi4m_ddr_rid        ,//i 16
    input        [512*DDR_NUM-1:0]    axi4m_ddr_rdata      ,//i 2048
    input        [2*DDR_NUM-1:0]      axi4m_ddr_rresp      ,//i 8
    input        [DDR_NUM-1:0]        axi4m_ddr_rlast      ,//i 4
    input        [DDR_NUM-1:0]        axi4m_ddr_rvalid     ,//i 4
    output       [DDR_NUM-1:0]        axi4m_ddr_rready     ,//o 4

    //interface  with axi_interconnect
    //DFX register config
    input        [15:0]               reg_tmout_us_cfg     ,//i 16
    output  wire                      reg_tmout_us_err     ,//o 1

    output  reg  [3:0]                fifo_status          ,//o 4
    output  reg  [1:0]                fifo_err             ,//o 2
    output  wire                      rc_rx_cnt            ,//o 1
    output  wire                      rc_rx_drop_cnt       ,//o 1
    output  wire                      rq_tx_cnt             //o 1

    );

/********************************************************************************************************************\
    parameters
\********************************************************************************************************************/
/********************************************************************************************************************\
    signals
\********************************************************************************************************************/
wire                rd_en                ;
wire                rc_rx_ef             ;
reg                 rc_rx_rd             ;
reg                 rc_rx_rd_1dly        ;
reg                 rc_rx_rd_2dly        ;
wire     [539:0]    rc_rx_rdata          ;
wire                rq_tx_ff             ;
reg                 rq_tx_wr             ;
reg      [539:0]    rq_tx_wdata          ;

wire      [1:0]     rc_fifo_status       ;
wire                rc_fifo_err          ;
wire      [1:0]     rq_fifo_status       ;
wire                rq_fifo_err          ;

//*********************************************************************************************************************
//    process
//*********************************************************************************************************************
assign  rd_en  =  (~rc_rx_ef) & (~rq_tx_ff) & (~rc_rx_rd) & (~rc_rx_rd_1dly) & (~rc_rx_rd_2dly);

always @ (posedge clk_kernel or posedge rst_kernel)
begin
    if (rst_kernel == 1'b1) begin
        rc_rx_rd <= 1'b0;
    end
    else if (rd_en == 1'b1) begin
        rc_rx_rd <= 1'b1;
    end
    else begin
        rc_rx_rd <= 1'b0;
    end
end

always @ (posedge clk_kernel or posedge rst_kernel)
begin
    if (rst_kernel == 1'b1) begin
        rq_tx_wr <= 1'b0;
    end
    else begin
        rq_tx_wr <= rc_rx_rd;
    end
end

always @ (posedge clk_kernel)
begin
   rq_tx_wdata <= rc_rx_rdata;
end

always @ (posedge clk_kernel or posedge rst_kernel)
begin
    if (rst_kernel == 1'b1) begin
        rc_rx_rd_1dly <= 1'b0;
        rc_rx_rd_2dly <= 1'b0;
    end
    else begin
        rc_rx_rd_1dly <= rc_rx_rd;
        rc_rx_rd_2dly <= rc_rx_rd_1dly;
    end
end

//********************************************************************************************************************
always @ (posedge clk_kernel or posedge rst_kernel)
begin
    if (rst_kernel == 1'b1) begin
        fifo_err <= 2'd0;
    end
    else begin
        fifo_err <= {rc_fifo_err,rq_fifo_err};
    end
end

always @ (posedge clk_kernel or posedge rst_kernel)
begin
    if (rst_kernel == 1'b1) begin
        fifo_status <= 4'd0;
    end
    else begin
        fifo_status <= {rc_fifo_status,rq_fifo_status};
    end
end

/*********************************************************************************************************************\
    instance
\*********************************************************************************************************************/
//|-------------|---------------|
//|bit539~520   |    rsv        |
//|-------------|---------------|
//|bit519       |    eop        |
//|-------------|---------------|
//|bit518       |    err        |
//|-------------|---------------|
//|bit517~512   |    mod        |
//|-------------|---------------|
//|bit511~bit0  |    payload    |
//|-------------|---------------|
raxi_rc512_fifo #
     (
      .A_DTH         (A_DTH     )  ,
      .EOP_POS       (EOP_POS   )  ,
      .ERR_POS       (ERR_POS   )  ,
      .FULL_LEVEL    (FULL_LEVEL)
     )

u_rxadp_axis2fifo

    (

    .pcie_clk                ( clk_shell           ),
    .pcie_rst                ( rst_shell           ),
    .pcie_link_up            ( 1'b1                ),

    .user_clk                ( clk_kernel          ),
    .user_rst                ( rst_kernel          ),

    .m_axis_rc_tdata         ( m_axis_rc_tdata     ),
    .m_axis_rc_tuser         ( m_axis_rc_tuser     ),
    .m_axis_rc_tlast         ( m_axis_rc_tlast     ),
    .m_axis_rc_tkeep         ( m_axis_rc_tkeep     ),
    .m_axis_rc_tvalid        ( m_axis_rc_tvalid    ),
    .m_axis_rc_tready        ( m_axis_rc_tready    ),

    .rc_rx_rd                ( rc_rx_rd            ),
    .rc_rx_ef                ( rc_rx_ef            ),
    .rc_rx_rdata             ( rc_rx_rdata         ),

    .rc_wr_data_cnt          (       ),
    .rc_rd_data_cnt          (       ),

    .fifo_status             ( rc_fifo_status      ),
    .fifo_err                ( rc_fifo_err         ),
    .rc_rx_cnt               ( rc_rx_cnt           ),
    .rc_rx_drop_cnt          ( rc_rx_drop_cnt      )

    );


raxi_rq512_fifo  #
     (
      .A_DTH         (A_DTH     )  ,
      .EOP_POS       (EOP_POS   )  ,
      .ERR_POS       (ERR_POS   )  ,
      .FULL_LEVEL    (FULL_LEVEL)
     )

u_txadp_fifo2axis

    (
    .pcie_clk                ( clk_shell        ),
    .pcie_rst                ( rst_shell        ),
    .pcie_link_up            ( 1'b1             ),

    .user_clk                ( clk_kernel       ),
    .user_rst                ( rst_kernel       ),

    .s_axis_rq_tlast         ( s_axis_rq_tlast  ),
    .s_axis_rq_tdata         ( s_axis_rq_tdata  ),
    .s_axis_rq_tuser         ( s_axis_rq_tuser  ),
    .s_axis_rq_tkeep         ( s_axis_rq_tkeep  ),
    .s_axis_rq_tready        ( s_axis_rq_tready ),
    .s_axis_rq_tvalid        ( s_axis_rq_tvalid ),

    .reg_tmout_us_cfg        ( reg_tmout_us_cfg ),
    .reg_tmout_us_err        ( reg_tmout_us_err ),

    .rq_tx_wr                ( rq_tx_wr         ),
    .rq_tx_wdata             ( rq_tx_wdata      ),
    .rq_tx_ff                ( rq_tx_ff         ),

    .rq_wr_data_cnt          (    ),
    .rq_rd_data_cnt          (    ),

    .fifo_status             ( rq_fifo_status   ),
    .fifo_err                ( rq_fifo_err      ),
    .rq_tx_cnt               ( rq_tx_cnt        )

     );

//********************************************************************************************************************
assign    axi4_m2s_awid        = 16'd0         ;
assign    axi4_m2s_awaddr      = 256'd0        ;
assign    axi4_m2s_awlen       = 32'd0         ;
assign    axi4_m2s_awsize      = 12'd0         ;
assign    axi4_m2s_awuser      = 296'd0        ;

assign    axi4_m2s_awvalid     = 4'd0          ;
//assign    input                             axi4_s2m_awready     =           ;

assign    axi4_m2s_wid         = 16'd0         ;
assign    axi4_m2s_wdata       = 2048'd0       ;
assign    axi4_m2s_wstrb       = 256'd0        ;
assign    axi4_m2s_wlast       = 4'd0          ;
assign    axi4_m2s_wvalid      = 4'd0          ;
//assign    input        [1*DDR_NUM-1:0]      axi4_s2m_wready      =           ;

//assign    input        [4*DDR_NUM-1:0]      axi4_s2m_bid         =           ;
//assign    input        [2*DDR_NUM-1:0]      axi4_s2m_bresp       =           ;
//assign    input        [1*DDR_NUM-1:0]      axi4_s2m_bvalid      =           ;
assign    axi4_m2s_bready      = 4'd0          ;

assign    axi4m_ddr_arid       = 16'd0         ;
assign    axi4m_ddr_araddr     = 256'd0        ;
assign    axi4m_ddr_arlen      = 32'd0         ;
assign    axi4m_ddr_arsize     = 12'd0         ;
assign    axi4m_ddr_arvalid    = 4'd0          ;
//assign    input        [DDR_NUM-1:0]        axi4m_ddr_arready    = 4'd0      ;

//assign    input        [4*DDR_NUM-1:0]      axi4m_ddr_rid        = 16'd0     ;
//assign    input        [512*DDR_NUM-1:0]    axi4m_ddr_rdata      = 2048'd0   ;
//assign    input        [2*DDR_NUM-1:0]      axi4m_ddr_rresp      = 8'd0      ;
//assign    input        [DDR_NUM-1:0]        axi4m_ddr_rlast      = 4'd0      ;
//assign    input        [DDR_NUM-1:0]        axi4m_ddr_rvalid     = 4'd0      ;
assign    axi4m_ddr_rready     = 4'd0          ;


endmodule
