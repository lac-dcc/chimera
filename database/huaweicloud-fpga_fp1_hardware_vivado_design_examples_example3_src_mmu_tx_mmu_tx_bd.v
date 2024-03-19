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

module  mmu_tx_bd
                (
                 //globe signals
                 input                            clk_sys                  ,
                 input                            rst                      ,

                 //ve to ae bd
                 input           [255:0]          bd_rd_m_axis_rc_tdata    ,
                 input           [74:0]           bd_rd_m_axis_rc_tuser    ,
                 input                            bd_rd_m_axis_rc_tlast    ,
                 input           [31:0]           bd_rd_m_axis_rc_tkeep    ,
                 input                            bd_rd_m_axis_rc_tvalid   ,
                 output  wire                     bd_rd_m_axis_rc_tready   ,
                 //ae to ve read command
                 output                           rdpkt_s_axis_rq_tlast    ,
                 output          [255:0]          rdpkt_s_axis_rq_tdata    ,
                 output          [59:0]           rdpkt_s_axis_rq_tuser    ,
                 output  wire    [31:0]           rdpkt_s_axis_rq_tkeep    ,
                 input                            rdpkt_s_axis_rq_tready   ,
                 output  wire                     rdpkt_s_axis_rq_tvalid   ,
                 //with kernel
                 output                           bd2k_s_axis_rq_tlast     ,
                 output          [511:0]          bd2k_s_axis_rq_tdata     ,
                 output          [59:0]           bd2k_s_axis_rq_tuser     ,
                 output  wire    [63:0]           bd2k_s_axis_rq_tkeep     ,
                 input                            bd2k_s_axis_rq_tready    ,
                 output  wire                     bd2k_s_axis_rq_tvalid    ,
                 //with mmu_rx
                 output                           bd2rx_s_axis_rq_tlast    ,
                 output          [511:0]          bd2rx_s_axis_rq_tdata    ,
                 output          [59:0]           bd2rx_s_axis_rq_tuser    ,
                 output  wire    [63:0]           bd2rx_s_axis_rq_tkeep    ,
                 input                            bd2rx_s_axis_rq_tready   ,
                 output  wire                     bd2rx_s_axis_rq_tvalid   ,

                 //with mmu_tx_pkt 
                 input   wire                     hacc_wr                  ,     
                 input           [8:0]            hacc_waddr               ,
                 input           [87:0]           hacc_wdata               ,
                 input   wire                     online_feedback_en       ,     
                 input   wire                     wr_ddr_rsp_en            ,     
                 input           [10:0]           wr_ddr_rsp_sn            ,

                 //dfx 
                 output  wire                     reg_mmu_tx_cnt_en        ,
                 output  wire                     stxqm2inq_fifo_rd        ,
                 output  wire                     ppm2stxm_rxffc_wr        ,
                 output  wire                     tx2kernel_bd_wen         ,
                 output  wire                     mmu_tx2rx_bd_wen         ,
                 output  wire                     mmu_tx2rx_wr_bd_wen      ,
                 output  wire                     mmu_tx2rx_rd_bd_wen      ,
                 output  wire    [15:0]           tx_bd_sta                ,
                 output  wire    [15:0]           tx_bd_err                ,
                 output  wire    [10:0]           mmu_tx_online_beat       ,
                 input   wire    [10:0]           reg_mmu_tx_online_beat           
                  );

//********************************************************************************************************************
//wire                     stxqm2inq_fifo_rd        ;
wire    [287:0]          stxqm2inq_fifo_rdata     ;
wire                     inq2stxqm_fifo_emp       ;
//wire                     ppm2stxm_rxffc_wr        ;
wire    [255:0]          ppm2stxm_rxffc_wdata     ;
wire                     stxm2ppm_rxffc_ff        ;
wire                     kernel2tx_afull          ;
//wire                     tx2kernel_bd_wen         ;
wire    [511:0]          tx2kernel_bd_wdata       ;
wire                     mmu_rx2tx_afull          ;
wire    [511:0]          mmu_tx2rx_bd_wdata       ;
//********************************************************************************************************************
assign reg_mmu_tx_cnt_en = mmu_tx2rx_bd_wen | tx2kernel_bd_wen;

tx_bd      u_tx_bd
                (
                 .clk_sys                  (clk_sys               ),
                 .rst                      (rst                   ),

                 .stxqm2inq_fifo_rd        (stxqm2inq_fifo_rd     ),
                 .stxqm2inq_fifo_rdata     (stxqm2inq_fifo_rdata  ),
                 .inq2stxqm_fifo_emp       (inq2stxqm_fifo_emp    ),
                 .ppm2stxm_rxffc_wr        (ppm2stxm_rxffc_wr     ),
                 .ppm2stxm_rxffc_wdata     (ppm2stxm_rxffc_wdata  ),
                 .stxm2ppm_rxffc_ff        (stxm2ppm_rxffc_ff     ),

                 .kernel2tx_afull          (kernel2tx_afull       ),
                 .tx2kernel_bd_wen         (tx2kernel_bd_wen      ),
                 .tx2kernel_bd_wdata       (tx2kernel_bd_wdata    ),

                 .mmu_rx2tx_afull          (mmu_rx2tx_afull       ),
                 .mmu_tx2rx_bd_wen         (mmu_tx2rx_bd_wen      ),
                 .mmu_tx2rx_bd_wdata       (mmu_tx2rx_bd_wdata    ),
                 .mmu_tx2rx_wr_bd_wen      (mmu_tx2rx_wr_bd_wen   ),
                 .mmu_tx2rx_rd_bd_wen      (mmu_tx2rx_rd_bd_wen   ),

                 .hacc_wr                  (hacc_wr               ),     
                 .hacc_waddr               (hacc_waddr            ),
                 .hacc_wdata               (hacc_wdata            ),
                 .online_feedback_en       (online_feedback_en    ),     
                 .wr_ddr_rsp_en            (wr_ddr_rsp_en         ),     
                 .wr_ddr_rsp_sn            (wr_ddr_rsp_sn         ),
                 .tx_bd_sta                (tx_bd_sta             ),
                 .tx_bd_err                (tx_bd_err             ),
                 .mmu_tx_online_beat       (mmu_tx_online_beat    ),
                 .reg_mmu_tx_online_beat   (reg_mmu_tx_online_beat)        
                  );

raxi_rq512_fifo #
                (
                    //parameter A_DTH         =    9        ,
                    //parameter EOP_POS       =    519      ,
                    //parameter ERR_POS       =    518      ,
                    //parameter FULL_LEVEL    =    9'd400
                .A_DTH            (9              ),
                .EOP_POS          (519            ),
                .ERR_POS          (518            ),
                .FULL_LEVEL       (9'd400         )
                )
u_bd2kernel_fifo
                (
                .pcie_clk                (clk_sys              ),
                .pcie_rst                (rst                  ),
                .pcie_link_up            (1'd1                 ),
                .user_clk                (clk_sys              ),
                .user_rst                (rst                  ),

                .rq_tx_wr                (tx2kernel_bd_wen     ),
                .rq_tx_wdata             ({20'd0,1'd1,1'd0,6'd0,tx2kernel_bd_wdata}   ),
                .rq_tx_ff                (kernel2tx_afull      ),

                .s_axis_rq_tlast         (bd2k_s_axis_rq_tlast ),
                .s_axis_rq_tdata         (bd2k_s_axis_rq_tdata ),
                .s_axis_rq_tuser         (bd2k_s_axis_rq_tuser ),
                .s_axis_rq_tkeep         (bd2k_s_axis_rq_tkeep ),
                .s_axis_rq_tready        (bd2k_s_axis_rq_tready),
                .s_axis_rq_tvalid        (bd2k_s_axis_rq_tvalid),
                //hpi
                .reg_tmout_us_cfg        (16'hffff             ),
                .reg_tmout_us_err        (),
                .rq_wr_data_cnt          (),
                .rq_rd_data_cnt          (),
                .fifo_status             (),
                .fifo_err                (),
                .rq_tx_cnt               ()
                );

raxi_rq512_fifo #
                (
                    //parameter A_DTH         =    9        ,
                    //parameter EOP_POS       =    519      ,
                    //parameter ERR_POS       =    518      ,
                    //parameter FULL_LEVEL    =    9'd400
                .A_DTH            (9              ),
                .EOP_POS          (519            ),
                .ERR_POS          (518            ),
                .FULL_LEVEL       (9'd400         )
                )
u_bd2mmu_rx_fifo
                (
                .pcie_clk                (clk_sys              ),
                .pcie_rst                (rst                  ),
                .pcie_link_up            (1'd1                 ),
                .user_clk                (clk_sys              ),
                .user_rst                (rst                  ),

                .rq_tx_wr                (mmu_tx2rx_bd_wen     ),
                .rq_tx_wdata             ({20'd0,1'd1,1'd0,6'd0,mmu_tx2rx_bd_wdata}   ),
                .rq_tx_ff                (mmu_rx2tx_afull      ),

                .s_axis_rq_tlast         (bd2rx_s_axis_rq_tlast ),
                .s_axis_rq_tdata         (bd2rx_s_axis_rq_tdata ),
                .s_axis_rq_tuser         (bd2rx_s_axis_rq_tuser ),
                .s_axis_rq_tkeep         (bd2rx_s_axis_rq_tkeep ),
                .s_axis_rq_tready        (bd2rx_s_axis_rq_tready),
                .s_axis_rq_tvalid        (bd2rx_s_axis_rq_tvalid),
                //hpi
                .reg_tmout_us_cfg        (16'hffff             ),
                .reg_tmout_us_err        (),
                .rq_wr_data_cnt          (),
                .rq_rd_data_cnt          (),
                .fifo_status             (),
                .fifo_err                (),
                .rq_tx_cnt               ()
                );

raxi_rq256_fifo #
               (
                //   parameter A_DTH         =    9        ,
                //   parameter EOP_POS       =    262      ,
                //   parameter ERR_POS       =    261      ,
                //   parameter FULL_LEVEL    =    9'd400
                .A_DTH            (9              ),
                .EOP_POS          (262            ),
                .ERR_POS          (261            ),
                .FULL_LEVEL       (9'd400         )
               )
u_rd_pkt_fifo
                (
                .pcie_clk                (clk_sys                ),
                .pcie_rst                (rst                    ),
                .pcie_link_up            (1'd1                   ),
                .user_clk                (clk_sys                ),
                .user_rst                (rst                    ),
                
                .rq_tx_wr                (ppm2stxm_rxffc_wr      ),
                .rq_tx_wdata             ({25'd0,1'd1,1'd0,5'd0,ppm2stxm_rxffc_wdata}   ),
                .rq_tx_ff                (stxm2ppm_rxffc_ff      ),

                .s_axis_rq_tlast         (rdpkt_s_axis_rq_tlast  ),
                .s_axis_rq_tdata         (rdpkt_s_axis_rq_tdata  ),
                .s_axis_rq_tuser         (rdpkt_s_axis_rq_tuser  ),
                .s_axis_rq_tkeep         (rdpkt_s_axis_rq_tkeep  ),
                .s_axis_rq_tready        (rdpkt_s_axis_rq_tready ),
                .s_axis_rq_tvalid        (rdpkt_s_axis_rq_tvalid ),

                .reg_tmout_us_cfg        (16'hffff               ),
                .reg_tmout_us_err        (),
                .rq_wr_data_cnt          (),
                .rq_rd_data_cnt          (),
                .fifo_status             (),
                .fifo_err                (),
                .rq_tx_cnt               ()
                );

raxi_rc256_fifo #
                 (
                //    parameter A_DTH         =    9        ,
                //    parameter EOP_POS       =    262      ,
                //    parameter ERR_POS       =    261      ,
                //    parameter FULL_LEVEL    =    9'd400
                .A_DTH            (9              ),
                .EOP_POS          (262            ),
                .ERR_POS          (261            ),
                .FULL_LEVEL       (9'd400         )
                 )
u_bd_rd_fifo 
                 (
                 .pcie_clk                (clk_sys               ),
                 .pcie_rst                (rst                   ),
                 .pcie_link_up            (1'd1                  ),
                 .user_clk                (clk_sys               ),
                 .user_rst                (rst                   ),

                 .rc_rx_rd                (stxqm2inq_fifo_rd     ),
                 .rc_rx_ef                (inq2stxqm_fifo_emp    ),
                 .rc_rx_rdata             (stxqm2inq_fifo_rdata  ),

                 .m_axis_rc_tdata         (bd_rd_m_axis_rc_tdata ),
                 .m_axis_rc_tuser         (bd_rd_m_axis_rc_tuser ),
                 .m_axis_rc_tlast         (bd_rd_m_axis_rc_tlast ),
                 .m_axis_rc_tkeep         (bd_rd_m_axis_rc_tkeep ),
                 .m_axis_rc_tvalid        (bd_rd_m_axis_rc_tvalid),
                 .m_axis_rc_tready        (bd_rd_m_axis_rc_tready),

                 .rc_wr_data_cnt          (),
                 .rc_rd_data_cnt          (),
                 .fifo_status             (),
                 .fifo_err                (),
                 .rc_rx_cnt               (),
                 .rc_rx_drop_cnt          ()
                 );

endmodule
