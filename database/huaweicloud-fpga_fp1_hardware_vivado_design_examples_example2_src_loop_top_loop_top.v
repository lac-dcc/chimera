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


module  loop_top 
            #(
                 parameter   A_WTH             =  24           ,
                 parameter   D_WTH             =  32           ,
                 parameter   LOOP_IP_CM_ID     =  12'h001
            )

            (
                 //globe signals
                 input                            clk_sys                  ,
                 input                            rst                      ,

                 //ve to ae bd
                 output                           stxqm2inq_fifo_rd        ,
                 input       [287:0]              stxqm2inq_fifo_rdata     ,
                 input                            inq2stxqm_fifo_emp       ,

                 //ae to ve read command
                 output                           ppm2stxm_rxffc_wr        ,
                 output      [287:0]              ppm2stxm_rxffc_wdata     ,
                 input                            stxm2ppm_rxffc_ff        ,

                 //ve to ae pkt
                 output                           stxm2ppm_txffd_rd        ,
                 input       [539:0]              stxm2ppm_txffd_rdata     ,
                 input                            ppm2stxm_txffd_emp       ,

                 //ae to ve pkt
                 output                           sch2rxm_pd_wr            ,
                 output      [539:0]              sch2rxm_pd_wdata         ,
                 input                            rxm2sch_pd_ff            ,
   
                 //cpu signal
                 input                            cnt_reg_clr              ,
                 input       [A_WTH -1:0]         cpu_addr                 ,
                 input       [D_WTH -1:0]         cpu_data_in              ,
                 output      [D_WTH -1:0]         cpu_data_out_pf          ,
                 input                            cpu_rd                   ,
                 input                            cpu_wr                    
                 );
/**********************************************************************************\
    signals
\**********************************************************************************/
wire    [31:0]           reg_bp_mux_cfg           ;    

wire    [31:0]           reg_loop_port_cfg        ;    
wire    [31:0]           reg_loop_cfg             ;    
wire                     rltpkt_hd_wen            ; 
wire    [255:0]          rltpkt_hd_wdata          ;
wire                     rltpkt_hd_full           ;     
wire                     ve2ae_txffd_reop         ;
wire                     reg_ae2ve_weop           ;
wire    [5:0]            reg_bd_sta               ;
wire    [5:0]            reg_bd_err               ;
wire    [3:0]            reg_pkt_sta              ;
wire    [3:0]            reg_pkt_err              ;
/**********************************************************************************\
   instance
\**********************************************************************************/
loop_bd_proc  u_loop_bd_proc(
                 .clk_sys                    (clk_sys                     ),
                 .rst                        (rst                         ),

                 .stxqm2inq_fifo_rd          (stxqm2inq_fifo_rd           ),
                 .stxqm2inq_fifo_rdata       (stxqm2inq_fifo_rdata        ),
                 .inq2stxqm_fifo_emp         (inq2stxqm_fifo_emp          ),

                 .ppm2stxm_rxffc_wr          (ppm2stxm_rxffc_wr           ),
                 .ppm2stxm_rxffc_wdata       (ppm2stxm_rxffc_wdata        ),
                 .stxm2ppm_rxffc_ff          (stxm2ppm_rxffc_ff           ),

                 .rltpkt_hd_wen              (rltpkt_hd_wen               ),
                 .rltpkt_hd_wdata            (rltpkt_hd_wdata             ),
                 .rltpkt_hd_full             (rltpkt_hd_full              ),
                 .tx_pkt_wend                (ve2ae_txffd_reop            ),
                 .reg_bd_sta                 (reg_bd_sta                  ),       
                 .reg_bd_err                 (reg_bd_err                  ),       
                 .reg_loop_cfg               (reg_loop_cfg                ),
                 .reg_bp_mux_cfg             (reg_bp_mux_cfg              )
                 );

loop_pkt_sch  u_loop_pkt_sch(
                 .clk_sys                    (clk_sys                     ),
                 .rst                        (rst                         ),

                 .rltpkt_hd_wen              (rltpkt_hd_wen               ), 
                 .rltpkt_hd_wdata            (rltpkt_hd_wdata             ), 
                 .rltpkt_hd_full             (rltpkt_hd_full              ), 
                 .ve2ae_txffd_rd             (stxm2ppm_txffd_rd           ), 
                 .ve2ae_txffd_rdata          (stxm2ppm_txffd_rdata        ), 
                 .ve2ae_txffd_ef             (ppm2stxm_txffd_emp          ), 
                 .mac_dfifo_wen              (                            ), 
                 .mac_dfifo_wdata            (                            ), 
                 .mac_dfifo_wend             (                            ), 
                 .mac_dfifo_aff              (1'd0                        ), 
                 .mac_dfifo_ren              (                            ), 
                 .mac_dfifo_rdata            (                            ), 
                 .mac_dfifo_reop             (                            ), 
                 .mac_dfifo_rend             (                            ), 
                 .mac_dfifo_ef               (1'd0                        ), 
                 .mac_dfifo_aef              (1'd0                        ), 
                 .ve2ae_txffd_reop           (ve2ae_txffd_reop            ),
                 .reg_pkt_sta                (reg_pkt_sta                 ),
                 .reg_pkt_err                (reg_pkt_err                 ),
                 .reg_ae2ve_weop             (reg_ae2ve_weop              ),                   
                 .ae2ve_rxffd_wen            (sch2rxm_pd_wr               ), 
                 .ae2ve_rxffd_wdata          (sch2rxm_pd_wdata            ), 
                 .ae2ve_rxffd_ff             (rxm2sch_pd_ff               ), 
                 .reg_loop_port_cfg          (reg_loop_port_cfg[0]        ), 
                 .reg_loop_cfg               (reg_loop_cfg                )
                 
                 );

reg_loop  #(
             .A_WTH           (A_WTH           ),
             .D_WTH           (D_WTH           ),
             .LOOP_IP_CM_ID   (LOOP_IP_CM_ID   )
            )
u_reg_loop  
             (
                 .clk_sys                    (clk_sys                     ),
                 .rst                        (rst                         ),
                 // interface with adp_sch
                 .reg_bp_mux_cfg             (reg_bp_mux_cfg              ),
                 .reg_loop_port_cfg          (reg_loop_port_cfg           ),
                 .reg_loop_cfg               (reg_loop_cfg                ),
                 // interface with adp_sch
                 .reg_txqm_bd_cnt_en         (stxqm2inq_fifo_rd           ),
                 .reg_txm_rcmd_cnt_en        (ppm2stxm_rxffc_wr           ),
                 .reg_rlt_head_cnt_en        (rltpkt_hd_wen               ),
                 .reg_ve2ae_reop             (ve2ae_txffd_reop            ),
                 .reg_ae2ve_weop             (reg_ae2ve_weop              ),             
                 .reg_bd_sta                 (reg_bd_sta                  ), 
                 .reg_bd_err                 (reg_bd_err                  ), 
                 .reg_pkt_sta                (reg_pkt_sta                 ),
                 .reg_pkt_err                (reg_pkt_err                 ),
                 //interface with cpu
                 .cnt_reg_clr                (cnt_reg_clr                 ),
                 .cpu_addr                   (cpu_addr                    ),
                 .cpu_data_in                (cpu_data_in                 ),
                 .cpu_data_out_pf            (cpu_data_out_pf             ),
                 .cpu_rd                     (cpu_rd                      ),
                 .cpu_wr                     (cpu_wr                      ) 

                 );                 
endmodule
