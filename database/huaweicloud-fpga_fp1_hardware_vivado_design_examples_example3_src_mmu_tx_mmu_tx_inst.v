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

module mmu_tx_inst #
    (
        parameter A_WTH         =    24       ,
        parameter D_WTH         =    32       ,
        parameter DDR_NUM       =    4        ,
        parameter MAX_DDR_NUM   =    4        ,
        parameter REG_MMU_TX_ID =    12'd2   

    )
    (
    //globe signals
    input                                    clk_sys                  ,
    input                                    rst                      ,

    //ve to ae bd
    input           [255:0]                  bd_rd_m_axis_rc_tdata    ,
    input           [74:0]                   bd_rd_m_axis_rc_tuser    ,
    input                                    bd_rd_m_axis_rc_tlast    ,
    input           [31:0]                   bd_rd_m_axis_rc_tkeep    ,
    input                                    bd_rd_m_axis_rc_tvalid   ,
    output   wire                            bd_rd_m_axis_rc_tready   ,
    //ae to ve read command
    output                                   rdpkt_s_axis_rq_tlast    ,
    output          [255:0]                  rdpkt_s_axis_rq_tdata    ,
    output          [59:0]                   rdpkt_s_axis_rq_tuser    ,
    output   wire   [31:0]                   rdpkt_s_axis_rq_tkeep    ,
    input                                    rdpkt_s_axis_rq_tready   ,
    output   wire                            rdpkt_s_axis_rq_tvalid   ,
    //with kernel
    output                                   bd2k_s_axis_rq_tlast     ,
    output          [511:0]                  bd2k_s_axis_rq_tdata     ,
    output          [59:0]                   bd2k_s_axis_rq_tuser     ,
    output   wire   [63:0]                   bd2k_s_axis_rq_tkeep     ,
    input                                    bd2k_s_axis_rq_tready    ,
    output   wire                            bd2k_s_axis_rq_tvalid    ,

    //with mmu_rx
    output                                   bd2rx_s_axis_rq_tlast    ,
    output          [511:0]                  bd2rx_s_axis_rq_tdata    ,
    output          [59:0]                   bd2rx_s_axis_rq_tuser    ,
    output   wire   [63:0]                   bd2rx_s_axis_rq_tkeep    ,
    input                                    bd2rx_s_axis_rq_tready   ,
    output   wire                            bd2rx_s_axis_rq_tvalid   ,

    //receive hard acc & pkt : axi stream interface
    input           [511:0]                  sh2ul_dmam1_tdata        , 
    input           [74:0]                   sh2ul_dmam1_tuser        ,
    input                                    sh2ul_dmam1_tlast        ,
    input           [63:0]                   sh2ul_dmam1_tkeep        ,
    input                                    sh2ul_dmam1_tvalid       ,
    output   wire                            ul2sh_dmam1_tready       ,

    //send pkt to ddr : axi 4 interface 
    //master wr ddra
    output   wire   [4*DDR_NUM-1:0]          axi4_m2s_awid            ,
    output   wire   [64*DDR_NUM-1:0]         axi4_m2s_awaddr          ,
    output   wire   [8*DDR_NUM-1:0]          axi4_m2s_awlen           ,
    output   wire   [3*DDR_NUM-1:0]          axi4_m2s_awsize          ,
    output   wire   [8*DDR_NUM-1:0]          axi4_m2s_awuser          ,
                                             
    output   wire   [1*DDR_NUM-1:0]          axi4_m2s_awvalid         ,
    input           [1*DDR_NUM-1:0]          axi4_s2m_awready         ,
                                             
    output   wire   [4*DDR_NUM-1:0]          axi4_m2s_wid             ,
    output   wire   [512*DDR_NUM-1:0]        axi4_m2s_wdata           ,
    output   wire   [64*DDR_NUM-1:0]         axi4_m2s_wstrb           ,
    output   wire   [1*DDR_NUM-1:0]          axi4_m2s_wlast           ,
    output   wire   [1*DDR_NUM-1:0]          axi4_m2s_wvalid          ,
    input           [1*DDR_NUM-1:0]          axi4_s2m_wready          ,
                                             
    input           [4*DDR_NUM-1:0]          axi4_s2m_bid             ,
    input           [2*DDR_NUM-1:0]          axi4_s2m_bresp           ,
    input           [1*DDR_NUM-1:0]          axi4_s2m_bvalid          ,
    output   wire   [1*DDR_NUM-1:0]          axi4_m2s_bready          ,

    //with cpu
    input                                    cnt_reg_clr              ,
    input           [A_WTH -1:0]             cpu_addr                 ,
    input           [D_WTH -1:0]             cpu_data_in              ,
    output   wire   [D_WTH -1:0]             cpu_data_out_tx          ,
    input                                    cpu_rd                   ,
    input                                    cpu_wr                    

);

/********************************************************************************************************************\
    parameters
\********************************************************************************************************************/
/********************************************************************************************************************\
    signals
\********************************************************************************************************************/
wire                                         hacc_wr                    ;           
wire  [8:0]                                  hacc_waddr                 ;        
wire  [87:0]                                 hacc_wdata                 ;       
wire                                         online_feedback_en         ;
wire                                         reg_mmu_tx_cnt_en          ;    
wire                                         wr_ddr_rsp_en              ;    
wire  [10:0]                                 wr_ddr_rsp_sn              ; 

wire                                         stxqm2inq_fifo_rd          ;           
wire                                         ppm2stxm_rxffc_wr          ;           
wire                                         tx2kernel_bd_wen           ; 
wire                                         mmu_tx2rx_bd_wen           ; 
wire                                         mmu_tx2rx_wr_bd_wen        ; 
wire                                         mmu_tx2rx_rd_bd_wen        ; 

wire  [15:0]                                 tx_bd_sta                  ;
wire  [15:0]                                 tx_bd_err                  ;
wire  [10:0]                                 mmu_tx_online_beat         ;
wire  [10:0]                                 reg_mmu_tx_online_beat     ;

wire  [31:0]                                 reg_mmu_tx_pkt_sta         ;
wire  [31:0]                                 reg_mmu_tx_pkt_err         ;

wire  [10:0]                                 reg_hacc_sn                ;
wire  [35:0]                                 reg_hacc_ddr_saddr         ;
wire  [35:0]                                 reg_hacc_ddr_daddr         ;
wire  [64*MAX_DDR_NUM-1:0]                   reg_ddr_wr_addr            ;
wire  [8*MAX_DDR_NUM-1:0]                    reg_ddr_wr_length          ;
wire  [10:0]                                 reg_ddr_rsp_sn             ;
wire  [2:0]                                  reg_seq_info               ;

wire                                         reg_axis_receive_cnt_en    ;
wire                                         reg_hacc_receive_cnt_en    ;
wire                                         reg_pkt_receive_cnt_en     ;
wire  [1*MAX_DDR_NUM-1:0]                    reg_axi4_send_slice_cnt_en ;
wire  [1*MAX_DDR_NUM-1:0]                    reg_axi4_send_ok_cnt_en    ;
wire  [1*MAX_DDR_NUM-1:0]                    reg_ddr_rsp_ok_cnt_en      ;
wire  [1*MAX_DDR_NUM-1:0]                    reg_axi4_send_wlast_cnt_en ;
//*********************************************************************************************************************
//    process
//*********************************************************************************************************************
mmu_tx_bd u_mmu_tx_bd
    (
    //globe signals
    .clk_sys                        ( clk_sys                   ),
    .rst                            ( rst                       ),
    
    //ve to ae bd
    .bd_rd_m_axis_rc_tdata          ( bd_rd_m_axis_rc_tdata     ),
    .bd_rd_m_axis_rc_tuser          ( bd_rd_m_axis_rc_tuser     ),
    .bd_rd_m_axis_rc_tlast          ( bd_rd_m_axis_rc_tlast     ),
    .bd_rd_m_axis_rc_tkeep          ( bd_rd_m_axis_rc_tkeep     ),
    .bd_rd_m_axis_rc_tvalid         ( bd_rd_m_axis_rc_tvalid    ),
    .bd_rd_m_axis_rc_tready         ( bd_rd_m_axis_rc_tready    ), 
    
    //ae to ve read command
    .rdpkt_s_axis_rq_tlast          ( rdpkt_s_axis_rq_tlast     ),
    .rdpkt_s_axis_rq_tdata          ( rdpkt_s_axis_rq_tdata     ),
    .rdpkt_s_axis_rq_tuser          ( rdpkt_s_axis_rq_tuser     ),
    .rdpkt_s_axis_rq_tkeep          ( rdpkt_s_axis_rq_tkeep     ),
    .rdpkt_s_axis_rq_tready         ( rdpkt_s_axis_rq_tready    ),
    .rdpkt_s_axis_rq_tvalid         ( rdpkt_s_axis_rq_tvalid    ),
    
    //with kernel
    .bd2k_s_axis_rq_tlast           ( bd2k_s_axis_rq_tlast      ),
    .bd2k_s_axis_rq_tdata           ( bd2k_s_axis_rq_tdata      ),
    .bd2k_s_axis_rq_tuser           ( bd2k_s_axis_rq_tuser      ),
    .bd2k_s_axis_rq_tkeep           ( bd2k_s_axis_rq_tkeep      ),
    .bd2k_s_axis_rq_tready          ( bd2k_s_axis_rq_tready     ),
    .bd2k_s_axis_rq_tvalid          ( bd2k_s_axis_rq_tvalid     ),

    //with mmu_rx
    .bd2rx_s_axis_rq_tlast          ( bd2rx_s_axis_rq_tlast     ),
    .bd2rx_s_axis_rq_tdata          ( bd2rx_s_axis_rq_tdata     ),
    .bd2rx_s_axis_rq_tuser          ( bd2rx_s_axis_rq_tuser     ),
    .bd2rx_s_axis_rq_tkeep          ( bd2rx_s_axis_rq_tkeep     ),
    .bd2rx_s_axis_rq_tready         ( bd2rx_s_axis_rq_tready    ),
    .bd2rx_s_axis_rq_tvalid         ( bd2rx_s_axis_rq_tvalid    ),

    //with mmu_tx_pkt 
    .hacc_wr                        ( hacc_wr                   ),     
    .hacc_waddr                     ( hacc_waddr                ),
    .hacc_wdata                     ( hacc_wdata                ),
    .online_feedback_en             ( online_feedback_en        ),     
    .wr_ddr_rsp_en                  ( wr_ddr_rsp_en             ),     
    .reg_mmu_tx_cnt_en              ( reg_mmu_tx_cnt_en         ),     
    .wr_ddr_rsp_sn                  ( wr_ddr_rsp_sn             ),
    
    //dfx 
    .stxqm2inq_fifo_rd              ( stxqm2inq_fifo_rd         ),
    .ppm2stxm_rxffc_wr              ( ppm2stxm_rxffc_wr         ),
    .tx2kernel_bd_wen               ( tx2kernel_bd_wen          ),
    .mmu_tx2rx_bd_wen               ( mmu_tx2rx_bd_wen          ),
    .mmu_tx2rx_wr_bd_wen            ( mmu_tx2rx_wr_bd_wen       ),
    .mmu_tx2rx_rd_bd_wen            ( mmu_tx2rx_rd_bd_wen       ),
    .tx_bd_sta                      ( tx_bd_sta                 ),
    .tx_bd_err                      ( tx_bd_err                 ),
    .mmu_tx_online_beat             ( mmu_tx_online_beat        ),
    .reg_mmu_tx_online_beat         ( reg_mmu_tx_online_beat    )        
        
    );

mmu_tx_pkt#
(
    .A_WTH                          ( A_WTH                     ),
    .D_WTH                          ( D_WTH                     ),
    .MAX_DDR_NUM                    ( MAX_DDR_NUM               ),
    .DDR_NUM                        ( DDR_NUM                   )

)
u_mmu_tx_pkt
    (
    //globle signal                      
    .clk_sys                        ( clk_sys                   ),
    .rst                            ( rst                       ),
    //receive hard acc & pkt : axi stream interface
    .sh2ul_dmam1_tdata              ( sh2ul_dmam1_tdata         ),
    .sh2ul_dmam1_tuser              ( sh2ul_dmam1_tuser         ),
    .sh2ul_dmam1_tlast              ( sh2ul_dmam1_tlast         ),
    .sh2ul_dmam1_tkeep              ( sh2ul_dmam1_tkeep         ),
    .sh2ul_dmam1_tvalid             ( sh2ul_dmam1_tvalid        ),
    .ul2sh_dmam1_tready             ( ul2sh_dmam1_tready        ),
    
    //send pkt to ddr : axi 4 interface
    .axi4_m2s_awid                  ( axi4_m2s_awid             ),
    .axi4_m2s_awaddr                ( axi4_m2s_awaddr           ),
    .axi4_m2s_awlen                 ( axi4_m2s_awlen            ),
    .axi4_m2s_awsize                ( axi4_m2s_awsize           ),
    .axi4_m2s_awuser                ( axi4_m2s_awuser           ),
                                                      
    .axi4_m2s_awvalid               ( axi4_m2s_awvalid          ),
    .axi4_s2m_awready               ( axi4_s2m_awready          ),
    
    .axi4_m2s_wid                   ( axi4_m2s_wid              ),
    .axi4_m2s_wdata                 ( axi4_m2s_wdata            ),
    .axi4_m2s_wstrb                 ( axi4_m2s_wstrb            ),
    .axi4_m2s_wlast                 ( axi4_m2s_wlast            ),
    .axi4_m2s_wvalid                ( axi4_m2s_wvalid           ),
    .axi4_s2m_wready                ( axi4_s2m_wready           ),
                                      
    .axi4_s2m_bid                   ( axi4_s2m_bid              ),
    .axi4_s2m_bresp                 ( axi4_s2m_bresp            ),
    .axi4_s2m_bvalid                ( axi4_s2m_bvalid           ),
    .axi4_m2s_bready                ( axi4_m2s_bready           ),
    
    //interface with mmu_tx_bd
    //fpga ddr sa, da 
    .hacc_wr                        ( hacc_wr                   ),
    .hacc_waddr                     ( hacc_waddr                ),
    .hacc_wdata                     ( hacc_wdata                ),
    
    //online cnt feedback
    .online_feedback_en             ( online_feedback_en        ),
    
    //wr ddr response
    .wr_ddr_rsp_en                  ( wr_ddr_rsp_en             ),
    .wr_ddr_rsp_sn                  ( wr_ddr_rsp_sn             ),
    
    //err, status, cnt 
    .reg_cfg_bid_id                 (                           ),

    .reg_hacc_sn                    ( reg_hacc_sn               ),
    .reg_hacc_ddr_saddr             ( reg_hacc_ddr_saddr        ),
    .reg_hacc_ddr_daddr             ( reg_hacc_ddr_daddr        ),
    .reg_ddr_wr_addr                ( reg_ddr_wr_addr           ),
    .reg_ddr_wr_length              ( reg_ddr_wr_length         ),
    .reg_ddr_rsp_sn                 ( reg_ddr_rsp_sn            ),
    .reg_seq_info                   ( reg_seq_info              ),
                                                                
    .reg_axis_receive_cnt_en        ( reg_axis_receive_cnt_en   ),
    .reg_hacc_receive_cnt_en        ( reg_hacc_receive_cnt_en   ),
    .reg_pkt_receive_cnt_en         ( reg_pkt_receive_cnt_en    ),
    .reg_axi4_send_slice_cnt_en     ( reg_axi4_send_slice_cnt_en),
    .reg_axi4_send_ok_cnt_en        ( reg_axi4_send_ok_cnt_en   ),
    .reg_ddr_rsp_ok_cnt_en          ( reg_ddr_rsp_ok_cnt_en     ), 
    .reg_axi4_send_wlast_cnt_en     ( reg_axi4_send_wlast_cnt_en), 
    
    .reg_mmu_tx_pkt_sta             ( reg_mmu_tx_pkt_sta        ),                                                 
    .reg_mmu_tx_pkt_err             ( reg_mmu_tx_pkt_err        )                                                 
                                               
   );

reg_mmu_tx #
    (
    .A_WTH                          ( A_WTH                     ),
    .D_WTH                          ( D_WTH                     ),
    .MAX_DDR_NUM                    ( MAX_DDR_NUM               ),
    .DDR_NUM                        ( DDR_NUM                   ),
    .MMU_TX_CM_ID                   ( REG_MMU_TX_ID             ) 
    )
u_reg_mmu_tx
    (
    //globe signals
    .clk_sys                        ( clk_sys                   ),
    .rst                            ( rst                       ),

    //sta
    .reg_mmu_tx_pkt_sta             ( reg_mmu_tx_pkt_sta        ),                                                 
    .reg_hacc_sn                    ( reg_hacc_sn               ),
    .reg_hacc_ddr_saddr             ( reg_hacc_ddr_saddr        ),
    .reg_hacc_ddr_daddr             ( reg_hacc_ddr_daddr        ),
    .reg_ddr_wr_addr                ( reg_ddr_wr_addr           ),
    .reg_ddr_wr_length              ( reg_ddr_wr_length         ),
    .reg_ddr_rsp_sn                 ( reg_ddr_rsp_sn            ),
    .reg_seq_info                   ( reg_seq_info              ),
    .tx_bd_sta                      ( tx_bd_sta                 ),
    .tx_bd_err                      ( tx_bd_err                 ),
    .mmu_tx_online_beat             ( mmu_tx_online_beat        ),

    //err
    .reg_mmu_tx_pkt_err             ( reg_mmu_tx_pkt_err        ),                                                 

    //cfg
    .reg_mmu_tx_online_beat         ( reg_mmu_tx_online_beat    ),

    //cnt
    .reg_mmu_tx_cnt_en              ( reg_mmu_tx_cnt_en         ),
    .wr_ddr_rsp_en                  ( wr_ddr_rsp_en             ),
    .stxqm2inq_fifo_rd              ( stxqm2inq_fifo_rd         ),
    .ppm2stxm_rxffc_wr              ( ppm2stxm_rxffc_wr         ),
    .tx2kernel_bd_wen               ( tx2kernel_bd_wen          ),
    .mmu_tx2rx_bd_wen               ( mmu_tx2rx_bd_wen          ),
    .mmu_tx2rx_wr_bd_wen            ( mmu_tx2rx_wr_bd_wen       ),
    .mmu_tx2rx_rd_bd_wen            ( mmu_tx2rx_rd_bd_wen       ),

    .reg_axis_receive_cnt_en        ( reg_axis_receive_cnt_en   ),
    .reg_hacc_receive_cnt_en        ( reg_hacc_receive_cnt_en   ),
    .reg_pkt_receive_cnt_en         ( reg_pkt_receive_cnt_en    ),
    .reg_axi4_send_slice_cnt_en     ( reg_axi4_send_slice_cnt_en),
    .reg_axi4_send_ok_cnt_en        ( reg_axi4_send_ok_cnt_en   ),
    .reg_ddr_rsp_ok_cnt_en          ( reg_ddr_rsp_ok_cnt_en     ), 
    .reg_axi4_send_wlast_cnt_en     ( reg_axi4_send_wlast_cnt_en), 

    //with cpu
    .cnt_reg_clr                    ( cnt_reg_clr               ),
    .cpu_addr                       ( cpu_addr                  ),
    .cpu_data_in                    ( cpu_data_in               ),
    .cpu_data_out_pf                ( cpu_data_out_tx           ),
    .cpu_rd                         ( cpu_rd                    ),
    .cpu_wr                         ( cpu_wr                    )
    );

endmodule
