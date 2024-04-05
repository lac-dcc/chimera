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
`timescale 1ns / 1ns
module ul_pr_top
#(
  `include "ul_basic_para_defines.h"
  `include "ul_ddr_para_defines.h"
  `include "ul_user_para_defines.h"
)
(
   `include "ul_sh_port_list.h"            
);
//--------------------------------------------
//  unused Interfaces set to 0
//--------------------------------------------
`include "unused_sh_bar5_inst.h"

//-------------------------------------------------
// cpu config signal
//-------------------------------------------------
wire                                cpu_wr                      ;
wire    [ADDR_WIDTH-1:0]            cpu_addr                    ;
reg     [ADDR_WIDTH-1:0]            cpu_addr_1dly               ;
reg     [ADDR_WIDTH-1:0]            cpu_addr_2dly               ;
wire    [DATA_WIDTH-1:0]            cpu_data_in                 ;
reg     [DATA_WIDTH-1:0]            cpu_data_in_1dly            ;
reg     [DATA_WIDTH-1:0]            cpu_data_in_2dly            ;
wire                                cpu_rd                      ;
reg     [DATA_WIDTH-1:0]            cpu_data_out_bar1           ;  
wire    [DATA_WIDTH-1:0]            cpu_data_out_adder          ;  
wire    [DATA_WIDTH-1:0]            cpu_data_out_sa             ;  
wire    [DATA_WIDTH-1:0]            cpu_data_out_ddra_axi       ;  
wire    [DATA_WIDTH-1:0]            cpu_data_out_ddrb_axi       ;  
wire    [DATA_WIDTH-1:0]            cpu_data_out_ddrc_axi       ;  
wire    [DATA_WIDTH-1:0]            cpu_data_out_ddrd_axi       ;  

wire                                stxm2ppm_txffd_rd           ; 
wire    [539:0]                     stxm2ppm_txffd_rdata        ; 
wire                                ppm2stxm_txffd_emp          ; 

wire                                stxqm2inq_fifo_rd           ;
wire    [287:0]                     stxqm2inq_fifo_rdata        ;
wire                                inq2stxqm_fifo_emp          ;

wire                                ppm2stxm_rxffc_wr           ;
wire    [287:0]                     ppm2stxm_rxffc_wdata        ;
wire                                stxm2ppm_rxffc_ff           ;

wire                                sch2rxm_pd_wr               ;
wire    [539:0]                     sch2rxm_pd_wdata            ;
wire                                rxm2sch_pd_ff               ;

//-------------------------------------------------
// DDRA signal
//-------------------------------------------------
wire                                clk_ddra                    ;
wire                                rst_ddra                    ;
wire                                ddra_cal_done               ;
wire                                ddra_init_done              ;
wire    [4:0]                       ddra_mc_rddata_addr         ;
wire    [4:0]                       ddra_mc_wrdata_addr         ;
wire                                ddra_mc_wrdata_en           ;
wire                                ddra_mc_per_rd_done         ;
wire                                ddra_mc_rmw_rd_done         ;
wire                                ddra_mc_rddata_en           ;
wire                                ddra_mc_rddata_end          ;
wire    [DDRA_TOTAL_DQ_WIDTH*8-1:0] ddra_mc_rddata              ;
wire                                ddra_mc_gt_data_ready       ;
wire    [7:0]                       ddra_mc_act_n               ;
wire    [DDRA_ADDR_WIDTH*8-1:0]     ddra_mc_addr                ;
wire    [DDRA_BA_WIDTH*8-1:0]       ddra_mc_ba                  ;
wire    [DDRA_BG_WIDTH*8-1:0]       ddra_mc_bg                  ;
wire    [DDRA_CKE_WIDTH*8-1:0]      ddra_mc_cke                 ;
wire    [DDRA_CS_WIDTH*8-1:0]       ddra_mc_cs_n                ;
wire    [DDRA_ODT_WIDTH*8-1:0]      ddra_mc_odt                 ;
wire    [1:0]                       ddra_mc_cas_slot            ;
wire                                ddra_mc_cas_slot2           ;
wire                                ddra_mc_rdcas               ;
wire                                ddra_mc_wrcas               ;
wire    [1:0]                       ddra_mc_winrank             ;
wire    [7:0]                       ddra_mc_par                 ;
wire                                ddra_mc_wininjtxn           ;
wire                                ddra_mc_winrmw              ;
wire    [4:0]                       ddra_mc_winbuf              ;
wire    [4:0]                       ddra_mc_dbuf_addr           ;
wire    [DDRA_TOTAL_DQ_WIDTH*8-1:0] ddra_mc_wrdata              ;
wire    [DDRA_TOTAL_DM_WIDTH*8-1:0] ddra_mc_wrdata_mask         ;
wire    [5:0]                       ddra_mc_tcwl                ;
wire    [511:0]                     ddra_mc_dbg_bus             ;
wire                                hpi2ddra_wen                ;
reg                                 hpi2ddra_wen_1dly           ;
reg                                 hpi2ddra_wen_2dly           ;
wire                                hpi2ddra_ren                ;
reg                                 hpi2ddra_ren_1dly           ;
reg                                 hpi2ddra_ren_2dly           ;
wire                                ddra2hpi_valid              ;
wire    [DATA_WIDTH -1:0]           hpi_cpu_data_out_ddra       ;
//-------------------------------------------------
// DDRB signal
//-------------------------------------------------
wire                                clk_ddrb                    ;
wire                                rst_ddrb                    ;
wire                                ddrb_cal_done               ;
wire                                ddrb_init_done              ;
wire    [4:0]                       ddrb_mc_rddata_addr         ;
wire    [4:0]                       ddrb_mc_wrdata_addr         ;
wire                                ddrb_mc_wrdata_en           ;
wire                                ddrb_mc_per_rd_done         ;
wire                                ddrb_mc_rmw_rd_done         ;
wire                                ddrb_mc_rddata_en           ;
wire                                ddrb_mc_rddata_end          ;
wire    [DDRB_TOTAL_DQ_WIDTH*8-1:0] ddrb_mc_rddata              ;
wire                                ddrb_mc_gt_data_ready       ;
wire    [7:0]                       ddrb_mc_act_n               ;
wire    [DDRB_ADDR_WIDTH*8-1:0]     ddrb_mc_addr                ;
wire    [DDRB_BA_WIDTH*8-1:0]       ddrb_mc_ba                  ;
wire    [DDRB_BG_WIDTH*8-1:0]       ddrb_mc_bg                  ;
wire    [DDRB_CKE_WIDTH*8-1:0]      ddrb_mc_cke                 ;
wire    [DDRB_CS_WIDTH*8-1:0]       ddrb_mc_cs_n                ;
wire    [DDRB_ODT_WIDTH*8-1:0]      ddrb_mc_odt                 ;
wire    [1:0]                       ddrb_mc_cas_slot            ;
wire                                ddrb_mc_cas_slot2           ;
wire                                ddrb_mc_rdcas               ;
wire                                ddrb_mc_wrcas               ;
wire    [1:0]                       ddrb_mc_winrank             ;
wire    [7:0]                       ddrb_mc_par                 ;
wire                                ddrb_mc_wininjtxn           ;
wire                                ddrb_mc_winrmw              ;
wire    [4:0]                       ddrb_mc_winbuf              ;
wire    [4:0]                       ddrb_mc_dbuf_addr           ;
wire    [DDRB_TOTAL_DQ_WIDTH*8-1:0] ddrb_mc_wrdata              ;
wire    [DDRB_TOTAL_DM_WIDTH*8-1:0] ddrb_mc_wrdata_mask         ;
wire    [5:0]                       ddrb_mc_tcwl                ;
wire    [511:0]                     ddrb_mc_dbg_bus             ;
wire                                hpi2ddrb_wen                ;
reg                                 hpi2ddrb_wen_1dly           ;
reg                                 hpi2ddrb_wen_2dly           ;
wire                                hpi2ddrb_ren                ;
reg                                 hpi2ddrb_ren_1dly           ;
reg                                 hpi2ddrb_ren_2dly           ;
wire                                ddrb2hpi_valid              ;
wire    [DATA_WIDTH -1:0]           hpi_cpu_data_out_ddrb       ;

//-------------------------------------------------
// DDRD signal
//-------------------------------------------------
wire                                clk_ddrd                    ;
wire                                rst_ddrd                    ;
wire                                ddrd_cal_done               ;
wire                                ddrd_init_done              ;
wire    [4:0]                       ddrd_mc_rddata_addr         ;
wire    [4:0]                       ddrd_mc_wrdata_addr         ;
wire                                ddrd_mc_wrdata_en           ;
wire                                ddrd_mc_per_rd_done         ;
wire                                ddrd_mc_rmw_rd_done         ;
wire                                ddrd_mc_rddata_en           ;
wire                                ddrd_mc_rddata_end          ;
wire    [DDRD_TOTAL_DQ_WIDTH*8-1:0] ddrd_mc_rddata              ;
wire                                ddrd_mc_gt_data_ready       ;
wire    [7:0]                       ddrd_mc_act_n               ;
wire    [DDRD_ADDR_WIDTH*8-1:0]     ddrd_mc_addr                ;
wire    [DDRD_BA_WIDTH*8-1:0]       ddrd_mc_ba                  ;
wire    [DDRD_BG_WIDTH*8-1:0]       ddrd_mc_bg                  ;
wire    [DDRD_CKE_WIDTH*8-1:0]      ddrd_mc_cke                 ;
wire    [DDRD_CS_WIDTH*8-1:0]       ddrd_mc_cs_n                ;
wire    [DDRD_ODT_WIDTH*8-1:0]      ddrd_mc_odt                 ;
wire    [1:0]                       ddrd_mc_cas_slot            ;
wire                                ddrd_mc_cas_slot2           ;
wire                                ddrd_mc_rdcas               ;
wire                                ddrd_mc_wrcas               ;
wire    [1:0]                       ddrd_mc_winrank             ;
wire    [7:0]                       ddrd_mc_par                 ;
wire                                ddrd_mc_wininjtxn           ;
wire                                ddrd_mc_winrmw              ;
wire    [4:0]                       ddrd_mc_winbuf              ;
wire    [4:0]                       ddrd_mc_dbuf_addr           ;
wire    [DDRD_TOTAL_DQ_WIDTH*8-1:0] ddrd_mc_wrdata              ;
wire    [DDRD_TOTAL_DM_WIDTH*8-1:0] ddrd_mc_wrdata_mask         ;
wire    [5:0]                       ddrd_mc_tcwl                ;
wire    [511:0]                     ddrd_mc_dbg_bus             ;
wire                                hpi2ddrd_wen                ;
reg                                 hpi2ddrd_wen_1dly           ;
reg                                 hpi2ddrd_wen_2dly           ;
wire                                hpi2ddrd_ren                ;
reg                                 hpi2ddrd_ren_1dly           ;
reg                                 hpi2ddrd_ren_2dly           ;
wire                                ddrd2hpi_valid              ;
wire    [DATA_WIDTH-1:0]            hpi_cpu_data_out_ddrd       ;
wire    [15:0]                      reg_tmout_us_cfg            ;
wire    [1:0]                       reg_tmout_us_err            ;

//-------------------------------------------------
// kernel signal
//-------------------------------------------------
wire    [511:0]                     bd2k_s_axis_rq_tdata        ; 
wire                                bd2k_s_axis_rq_tlast        ;
wire    [63:0]                      bd2k_s_axis_rq_tkeep        ;
wire                                bd2k_s_axis_rq_tvalid       ;
wire                                bd2k_s_axis_rq_tready       ;
                     
wire                                ker2mmu_bd_tlast            ;
wire    [511:0]                     ker2mmu_bd_tdata            ;
wire    [63:0]                      ker2mmu_bd_tkeep            ;
wire                                mmu2ker_bd_tready           ;
wire                                ker2mmu_bd_tvalid           ;

//-------------------------------------------------
// axi-interconnect signal
//-------------------------------------------------
//mmu axi4 interface
wire    [4*DDR_NUM-1:0]            mmu_m2s_awid                 ;  
wire    [64*DDR_NUM-1:0]           mmu_m2s_awaddr               ; 
wire    [8*DDR_NUM-1:0]            mmu_m2s_awlen                ;
wire    [3*DDR_NUM-1:0]            mmu_m2s_awsize               ;
wire    [1*DDR_NUM-1:0]            mmu_m2s_awvalid              ;
wire    [1*DDR_NUM-1:0]            mmu_s2m_awready              ;
                         
wire    [4*DDR_NUM-1:0]            mmu_m2s_wid                  ;
wire    [512*DDR_NUM-1:0]          mmu_m2s_wdata                ;
wire    [64*DDR_NUM-1:0]           mmu_m2s_wstrb                ;
wire    [1*DDR_NUM-1:0]            mmu_m2s_wlast                ;
wire    [1*DDR_NUM-1:0]            mmu_m2s_wvalid               ;
wire    [1*DDR_NUM-1:0]            mmu_s2m_wready               ;
                                 
wire    [4*DDR_NUM-1:0]            mmu_s2m_bid                  ;
wire    [2*DDR_NUM-1:0]            mmu_s2m_bresp                ;
wire    [1*DDR_NUM-1:0]            mmu_s2m_bvalid               ;
wire    [1*DDR_NUM-1:0]            mmu_m2s_bready               ;
                               
wire    [4*DDR_NUM-1:0]            mmu_m2s_arid                 ; 
wire    [64*DDR_NUM-1:0]           mmu_m2s_araddr               ; 
wire    [8*DDR_NUM-1:0]            mmu_m2s_arlen                ; 
wire    [3*DDR_NUM-1:0]            mmu_m2s_arsize               ; 
wire    [DDR_NUM-1:0]              mmu_m2s_arvalid              ; 
wire    [DDR_NUM-1:0]              mmu_s2m_arready              ; 
                                             
wire    [4*DDR_NUM-1:0]            mmu_s2m_rid                  ; 
wire    [512*DDR_NUM-1:0]          mmu_s2m_rdata                ; 
wire    [2*DDR_NUM-1:0]            mmu_s2m_rresp                ; 
wire    [DDR_NUM-1:0]              mmu_s2m_rlast                ; 
wire    [DDR_NUM-1:0]              mmu_s2m_rvalid               ; 
wire    [DDR_NUM-1:0]              mmu_m2s_rready               ;

//knl axi4 interface
wire    [4*DDR_NUM-1:0]            knl_m2s_awid                 ;  
wire    [64*DDR_NUM-1:0]           knl_m2s_awaddr               ; 
wire    [8*DDR_NUM-1:0]            knl_m2s_awlen                ;
wire    [3*DDR_NUM-1:0]            knl_m2s_awsize               ;
wire    [1*DDR_NUM-1:0]            knl_m2s_awvalid              ;
wire    [1*DDR_NUM-1:0]            knl_s2m_awready              ;
                         
wire    [4*DDR_NUM-1:0]            knl_m2s_wid                  ;
wire    [512*DDR_NUM-1:0]          knl_m2s_wdata                ;
wire    [64*DDR_NUM-1:0]           knl_m2s_wstrb                ;
wire    [1*DDR_NUM-1:0]            knl_m2s_wlast                ;
wire    [1*DDR_NUM-1:0]            knl_m2s_wvalid               ;
wire    [1*DDR_NUM-1:0]            knl_s2m_wready               ;
                                 
wire    [4*DDR_NUM-1:0]            knl_s2m_bid                  ;
wire    [2*DDR_NUM-1:0]            knl_s2m_bresp                ;
wire    [1*DDR_NUM-1:0]            knl_s2m_bvalid               ;
wire    [1*DDR_NUM-1:0]            knl_m2s_bready               ;
                               
wire    [4*DDR_NUM-1:0]            knl_m2s_arid                 ; 
wire    [64*DDR_NUM-1:0]           knl_m2s_araddr               ; 
wire    [8*DDR_NUM-1:0]            knl_m2s_arlen                ; 
wire    [3*DDR_NUM-1:0]            knl_m2s_arsize               ; 
wire    [DDR_NUM-1:0]              knl_m2s_arvalid              ; 
wire    [DDR_NUM-1:0]              knl_s2m_arready              ; 
                                    
wire    [4*DDR_NUM-1:0]            knl_s2m_rid                  ; 
wire    [512*DDR_NUM-1:0]          knl_s2m_rdata                ; 
wire    [2*DDR_NUM-1:0]            knl_s2m_rresp                ; 
wire    [DDR_NUM-1:0]              knl_s2m_rlast                ; 
wire    [DDR_NUM-1:0]              knl_s2m_rvalid               ; 
wire    [DDR_NUM-1:0]              knl_m2s_rready               ;

//smart connect ddr axi4 interface
wire    [4*DDR_NUM-1:0]            axi4_m2s_awid                ;  
wire    [64*DDR_NUM-1:0]           axi4_m2s_awaddr              ; 
wire    [8*DDR_NUM-1:0]            axi4_m2s_awlen               ;
wire    [3*DDR_NUM-1:0]            axi4_m2s_awsize              ;
wire    [1*DDR_NUM-1:0]            axi4_m2s_awvalid             ;
wire    [1*DDR_NUM-1:0]            axi4_s2m_awready             ;
                         
wire    [4*DDR_NUM-1:0]            axi4_m2s_wid                 ;
wire    [512*DDR_NUM-1:0]          axi4_m2s_wdata               ;
wire    [64*DDR_NUM-1:0]           axi4_m2s_wstrb               ;
wire    [1*DDR_NUM-1:0]            axi4_m2s_wlast               ;
wire    [1*DDR_NUM-1:0]            axi4_m2s_wvalid              ;
wire    [1*DDR_NUM-1:0]            axi4_s2m_wready              ;
                                 
wire    [4*DDR_NUM-1:0]            axi4_s2m_bid                 ;
wire    [2*DDR_NUM-1:0]            axi4_s2m_bresp               ;
wire    [1*DDR_NUM-1:0]            axi4_s2m_bvalid              ;
wire    [1*DDR_NUM-1:0]            axi4_m2s_bready              ;
                               
wire    [4*DDR_NUM-1:0]            axi4_m2s_arid                ; 
wire    [64*DDR_NUM-1:0]           axi4_m2s_araddr              ; 
wire    [8*DDR_NUM-1:0]            axi4_m2s_arlen               ; 
wire    [3*DDR_NUM-1:0]            axi4_m2s_arsize              ; 
wire    [DDR_NUM-1:0]              axi4_m2s_arvalid             ; 
wire    [DDR_NUM-1:0]              axi4_s2m_arready             ; 
                                                  
wire    [4*DDR_NUM-1:0]            axi4_s2m_rid                 ; 
wire    [512*DDR_NUM-1:0]          axi4_s2m_rdata               ; 
wire    [2*DDR_NUM-1:0]            axi4_s2m_rresp               ; 
wire    [DDR_NUM-1:0]              axi4_s2m_rlast               ; 
wire    [DDR_NUM-1:0]              axi4_s2m_rvalid              ; 
wire    [DDR_NUM-1:0]              axi4_m2s_rready              ;

//ddra signals
wire    [3:0]                      ddra_axi4_m2s_awid           ; 
wire    [63:0]                     ddra_axi4_m2s_awaddr         ; 
wire    [7:0]                      ddra_axi4_m2s_awlen          ; 
wire    [2:0]                      ddra_axi4_m2s_awsize         ; 
wire                               ddra_axi4_m2s_awvalid        ; 
wire                               ddra_axi4_s2m_awready        ; 
wire    [3:0]                      ddra_axi4_m2s_wid            ; 
wire    [511:0]                    ddra_axi4_m2s_wdata          ; 
wire    [63:0]                     ddra_axi4_m2s_wstrb          ; 
wire                               ddra_axi4_m2s_wlast          ; 
wire                               ddra_axi4_m2s_wvalid         ; 
wire                               ddra_axi4_s2m_wready         ; 
wire    [3:0]                      ddra_axi4_s2m_bid            ; 
wire    [1:0]                      ddra_axi4_s2m_bresp          ; 
wire                               ddra_axi4_s2m_bvalid         ; 
wire                               ddra_axi4_m2s_bready         ; 
wire    [3:0]                      ddra_axi4_m2s_arid           ; 
wire    [63:0]                     ddra_axi4_m2s_araddr         ; 
wire    [7:0]                      ddra_axi4_m2s_arlen          ; 
wire    [2:0]                      ddra_axi4_m2s_arsize         ; 
wire                               ddra_axi4_m2s_arvalid        ; 
wire                               ddra_axi4_s2m_arready        ; 
wire    [3:0]                      ddra_axi4_s2m_rid            ; 
wire    [511:0]                    ddra_axi4_s2m_rdata          ; 
wire    [1:0]                      ddra_axi4_s2m_rresp          ; 
wire                               ddra_axi4_s2m_rlast          ; 
wire                               ddra_axi4_s2m_rvalid         ; 
wire                               ddra_axi4_m2s_rready         ; 

//ddrb signals
wire    [3:0]                      ddrb_axi4_m2s_awid           ; 
wire    [63:0]                     ddrb_axi4_m2s_awaddr         ; 
wire    [7:0]                      ddrb_axi4_m2s_awlen          ; 
wire    [2:0]                      ddrb_axi4_m2s_awsize         ; 
wire                               ddrb_axi4_m2s_awvalid        ; 
wire                               ddrb_axi4_s2m_awready        ; 
wire    [3:0]                      ddrb_axi4_m2s_wid            ; 
wire    [511:0]                    ddrb_axi4_m2s_wdata          ; 
wire    [63:0]                     ddrb_axi4_m2s_wstrb          ; 
wire                               ddrb_axi4_m2s_wlast          ; 
wire                               ddrb_axi4_m2s_wvalid         ; 
wire                               ddrb_axi4_s2m_wready         ; 
wire    [3:0]                      ddrb_axi4_s2m_bid            ; 
wire    [1:0]                      ddrb_axi4_s2m_bresp          ; 
wire                               ddrb_axi4_s2m_bvalid         ; 
wire                               ddrb_axi4_m2s_bready         ; 
wire    [3:0]                      ddrb_axi4_m2s_arid           ; 
wire    [63:0]                     ddrb_axi4_m2s_araddr         ; 
wire    [7:0]                      ddrb_axi4_m2s_arlen          ; 
wire    [2:0]                      ddrb_axi4_m2s_arsize         ; 
wire                               ddrb_axi4_m2s_arvalid        ; 
wire                               ddrb_axi4_s2m_arready        ; 
wire    [3:0]                      ddrb_axi4_s2m_rid            ; 
wire    [511:0]                    ddrb_axi4_s2m_rdata          ; 
wire    [1:0]                      ddrb_axi4_s2m_rresp          ; 
wire                               ddrb_axi4_s2m_rlast          ; 
wire                               ddrb_axi4_s2m_rvalid         ; 
wire                               ddrb_axi4_m2s_rready         ;

//ddrd signals
wire    [3:0]                      ddrd_axi4_m2s_awid           ; 
wire    [63:0]                     ddrd_axi4_m2s_awaddr         ; 
wire    [7:0]                      ddrd_axi4_m2s_awlen          ; 
wire    [2:0]                      ddrd_axi4_m2s_awsize         ; 
wire                               ddrd_axi4_m2s_awvalid        ; 
wire                               ddrd_axi4_s2m_awready        ; 
wire    [3:0]                      ddrd_axi4_m2s_wid            ; 
wire    [511:0]                    ddrd_axi4_m2s_wdata          ; 
wire    [63:0]                     ddrd_axi4_m2s_wstrb          ; 
wire                               ddrd_axi4_m2s_wlast          ; 
wire                               ddrd_axi4_m2s_wvalid         ; 
wire                               ddrd_axi4_s2m_wready         ; 
wire    [3:0]                      ddrd_axi4_s2m_bid            ; 
wire    [1:0]                      ddrd_axi4_s2m_bresp          ; 
wire                               ddrd_axi4_s2m_bvalid         ; 
wire                               ddrd_axi4_m2s_bready         ; 
wire    [3:0]                      ddrd_axi4_m2s_arid           ; 
wire    [63:0]                     ddrd_axi4_m2s_araddr         ; 
wire    [7:0]                      ddrd_axi4_m2s_arlen          ; 
wire    [2:0]                      ddrd_axi4_m2s_arsize         ; 
wire                               ddrd_axi4_m2s_arvalid        ; 
wire                               ddrd_axi4_s2m_arready        ; 
wire    [3:0]                      ddrd_axi4_s2m_rid            ; 
wire    [511:0]                    ddrd_axi4_s2m_rdata          ; 
wire    [1:0]                      ddrd_axi4_s2m_rresp          ; 
wire                               ddrd_axi4_s2m_rlast          ; 
wire                               ddrd_axi4_s2m_rvalid         ; 
wire                               ddrd_axi4_m2s_rready         ;

wire    [31:0]                     cpu_data_out_mmu             ; 
wire    [31:0]                     cpu_data_out_connect         ; 
reg                                rst_ul_pre                   ; 
(* max_fanout= 100 *) reg          rst_ul                       ; 

//-------------------------------------------------
// process 
//-------------------------------------------------

//-------------------------------------------------
// axi acess to bar 
//-------------------------------------------------
axi4l2hpis_adp 
    #(	
     .ADDR_WIDTH     (ADDR_WIDTH            ),
     .DATA_WIDTH     (DATA_WIDTH            ),
     .DATA_BYTE_NUM  (DATA_BYTE_NUM         )	
	)
u_bar1_axi4l2hpi
   (
    
    .aclk            ( clk_200m             ),   
    .areset          ( rst_ul             ),   
                           
    .awvalid         ( sh2bar1_awvalid      ),   
    .awaddr          ( sh2bar1_awaddr       ),   
    .awready         ( bar12sh_awready      ),   
                              
    .wvalid          ( sh2bar1_wvalid       ),   
    .wdata           ( sh2bar1_wdata        ),   
    .wstrb           ( sh2bar1_wstrb        ),
    .wready          ( bar12sh_wready       ),
                              
    .bvalid          ( bar12sh_bvalid       ),
    .bresp           ( bar12sh_bresp        ),
    .bready          ( sh2bar1_bready       ),
                              
    .arvalid         ( sh2bar1_arvalid      ),
    .araddr          ( sh2bar1_araddr       ),
    .arready         ( bar12sh_arready      ),
                                            
    .rvalid          ( bar12sh_rvalid       ),
    .rdata           ( bar12sh_rdata        ),
    .rresp           ( bar12sh_rresp        ),
    .rready          ( sh2bar1_rready       ),

    .cpu_wr          ( cpu_wr               ),
    .cpu_wr_addr     ( cpu_addr             ),
    .cpu_wr_strb     (                      ),
    .cpu_data_in     ( cpu_data_in          ),
    .cpu_rd          ( cpu_rd               ),   
    .cpu_data_out    ( cpu_data_out_bar1    ) 
);

reg_ul_access
    #(	
     .CPU_ADDR_WIDTH  (12                    ),
     .CPU_DATA_WIDTH  (DATA_WIDTH            )	
	)
u_reg_ul_access	
    (
     .clks           (clk_200m               ),  
     .reset          (rst_ul               ),
     .ul2sh_vled     (ul2sh_vled             ),
     .reg_tmout_us_cfg(reg_tmout_us_cfg      ),
     .reg_tmout_us_err(reg_tmout_us_err      ),
     .cpu_wr         (cpu_wr                 ),
     .cpu_wr_addr    (cpu_addr[13:2]         ),
     .cpu_data_in    (cpu_data_in            ),
     .cpu_rd         (cpu_rd                 ),
     .cpu_data_out   (cpu_data_out_adder     )
	                 
   );  

//*********************************************************************************************************************
mmu_inst #
    (
    .A_WTH                 ( 24                   ),
    .D_WTH                 ( 32                   ),
    .REG_MMU_TX_ID         ( REG_MMU_TX_ID        ),
    .REG_MMU_RX_ID         ( REG_MMU_RX_ID        ) 

    )
u_mmu_inst
    (
    //globe signals
    .clk_sys                        ( clk_200m                  ),
    .rst                            ( rst_ul                  ),

    //ve to ae bd
    .bd_rd_m_axis_rc_tdata          ( sh2ul_dmam0_tdata         ),
    .bd_rd_m_axis_rc_tuser          ( 75'd0                     ),
    .bd_rd_m_axis_rc_tlast          ( sh2ul_dmam0_tlast         ),
    .bd_rd_m_axis_rc_tkeep          ( sh2ul_dmam0_tkeep         ),
    .bd_rd_m_axis_rc_tvalid         ( sh2ul_dmam0_tvalid        ),
    .bd_rd_m_axis_rc_tready         ( ul2sh_dmam0_tready        ), 
    
    //ae to ve read command
    .rdpkt_s_axis_rq_tlast          ( ul2sh_dmas2_tlast         ),
    .rdpkt_s_axis_rq_tdata          ( ul2sh_dmas2_tdata         ),
    .rdpkt_s_axis_rq_tuser          (                           ),
    .rdpkt_s_axis_rq_tkeep          ( ul2sh_dmas2_tkeep         ),
    .rdpkt_s_axis_rq_tready         ( sh2ul_dmas2_tready        ),
    .rdpkt_s_axis_rq_tvalid         ( ul2sh_dmas2_tvalid        ),
    
    //with kernel
    .bd2k_s_axis_rq_tlast           ( bd2k_s_axis_rq_tlast      ),
    .bd2k_s_axis_rq_tdata           ( bd2k_s_axis_rq_tdata      ),
    .bd2k_s_axis_rq_tuser           (                           ),
    .bd2k_s_axis_rq_tkeep           ( bd2k_s_axis_rq_tkeep      ),
    .bd2k_s_axis_rq_tready          ( bd2k_s_axis_rq_tready     ),
    .bd2k_s_axis_rq_tvalid          ( bd2k_s_axis_rq_tvalid     ),

    //receive hard acc & pkt : axi stream interface
    .sh2ul_dmam1_tdata              ( sh2ul_dmam1_tdata         ),
    .sh2ul_dmam1_tuser              ( 75'd0                     ),
    .sh2ul_dmam1_tlast              ( sh2ul_dmam1_tlast         ),
    .sh2ul_dmam1_tkeep              ( sh2ul_dmam1_tkeep         ),
    .sh2ul_dmam1_tvalid             ( sh2ul_dmam1_tvalid        ),
    .ul2sh_dmam1_tready             ( ul2sh_dmam1_tready        ),
    
    //write pkt into ddr : axi 4 interface
    .axi4_m2s_awid                  ( mmu_m2s_awid             ),
    .axi4_m2s_awaddr                ( mmu_m2s_awaddr           ),
    .axi4_m2s_awlen                 ( mmu_m2s_awlen            ),
    .axi4_m2s_awsize                ( mmu_m2s_awsize           ),
    .axi4_m2s_awuser                (                          ),
                                                
    .axi4_m2s_awvalid               ( mmu_m2s_awvalid          ),
    .axi4_s2m_awready               ( mmu_s2m_awready          ),
    
    .axi4_m2s_wid                   ( mmu_m2s_wid              ),
    .axi4_m2s_wdata                 ( mmu_m2s_wdata            ),
    .axi4_m2s_wstrb                 ( mmu_m2s_wstrb            ),
    .axi4_m2s_wlast                 ( mmu_m2s_wlast            ),
    .axi4_m2s_wvalid                ( mmu_m2s_wvalid           ),
    .axi4_s2m_wready                ( mmu_s2m_wready           ),
                                   
    .axi4_s2m_bid                   ( mmu_s2m_bid              ),
    .axi4_s2m_bresp                 ( mmu_s2m_bresp            ),
    .axi4_s2m_bvalid                ( mmu_s2m_bvalid           ),
    .axi4_m2s_bready                ( mmu_m2s_bready           ),
                
    //axi4 read addr with DDR CTRL	                                               
    .axi4m_ddr_arid                 ( mmu_m2s_arid            ),  
    .axi4m_ddr_araddr               ( mmu_m2s_araddr          ),
    .axi4m_ddr_arlen                ( mmu_m2s_arlen           ),
    .axi4m_ddr_arsize               ( mmu_m2s_arsize          ),
    .axi4m_ddr_arvalid              ( mmu_m2s_arvalid         ),
    .axi4m_ddr_arready              ( mmu_s2m_arready         ),
    
    .axi4m_ddr_rid                  ( mmu_s2m_rid             ),
    .axi4m_ddr_rdata                ( mmu_s2m_rdata           ),
    .axi4m_ddr_rresp                ( mmu_s2m_rresp           ),
    .axi4m_ddr_rlast                ( mmu_s2m_rlast           ),
    .axi4m_ddr_rvalid               ( mmu_s2m_rvalid          ),
    .axi4m_ddr_rready               ( mmu_m2s_rready          ),

    //BD signal with Kernel  
    .ker2mmu_bd_tlast               ( ker2mmu_bd_tlast         ),
    .ker2mmu_bd_tdata               ( ker2mmu_bd_tdata         ),
    .ker2mmu_bd_tuser               ( 75'd0                    ),
    .ker2mmu_bd_tkeep               ( ker2mmu_bd_tkeep         ),
    .ker2mmu_bd_tvalid              ( ker2mmu_bd_tvalid        ),
    .mmu2ker_bd_tready              ( mmu2ker_bd_tready        ),   

    //ae to ve pkt signal
    .ul2sh_pkt_tlast                ( ul2sh_dmas3_tlast        ),
    .ul2sh_pkt_tdata                ( ul2sh_dmas3_tdata        ),
    .ul2sh_pkt_tkeep                ( ul2sh_dmas3_tkeep        ),
    .ul2sh_pkt_tvalid               ( ul2sh_dmas3_tvalid       ),
    .sh2ul_pkt_tready               ( sh2ul_dmas3_tready       ), 

    //with cpu
    .cnt_reg_clr                    (1'b0                       ),
    .cpu_addr                       (cpu_addr[A_WTH+1:2]        ),
    .cpu_data_in                    (cpu_data_in                ),
    .cpu_data_out_mmu               (cpu_data_out_mmu           ),
    .cpu_rd                         (cpu_rd                     ),
    .cpu_wr                         (cpu_wr                     )   

);

smt_con_inst #
    (
    .A_WTH                 ( 24                   ),
    .D_WTH                 ( 32                   ),
    .MAX_DDR_NUM           ( 4                    ),
    .DDR_NUM               ( 4                    ),
    .REG_MMU_CONNECT_ID    ( REG_MMU_CONNECT_ID   )

    )
u_smt_con_inst
            (
             .clk_sys                            ( clk_200m                         ),
             .rst                                ( rst_ul                         ), 
            
     //mmu axi4 write addr 	                                        
             .mmu_m2s_awid                       ( mmu_m2s_awid                     ),  
             .mmu_m2s_awaddr                     ( mmu_m2s_awaddr                   ),
             .mmu_m2s_awlen                      ( mmu_m2s_awlen                    ),
             .mmu_m2s_awsize                     ( mmu_m2s_awsize                   ),
             .mmu_m2s_awvalid                    ( mmu_m2s_awvalid                  ),
             .mmu_s2m_awready                    ( mmu_s2m_awready                  ),
        
     //mmu axi4 write data 	                            
             .mmu_m2s_wid                        ( mmu_m2s_wid                      ),
             .mmu_m2s_wdata                      ( mmu_m2s_wdata                    ),
             .mmu_m2s_wstrb                      ( mmu_m2s_wstrb                    ),
             .mmu_m2s_wlast                      ( mmu_m2s_wlast                    ),
             .mmu_m2s_wvalid                     ( mmu_m2s_wvalid                   ),
             .mmu_s2m_wready                     ( mmu_s2m_wready                   ),               
            
     //mmu axi4 write rsp            
             .mmu_s2m_bid                        ( mmu_s2m_bid                      ),
             .mmu_s2m_bresp                      ( mmu_s2m_bresp                    ),
             .mmu_s2m_bvalid                     ( mmu_s2m_bvalid                   ),
             .mmu_m2s_bready                     ( mmu_m2s_bready                   ),

     //mmu axi4 read addr            
             .mmu_m2s_arid                       ( mmu_m2s_arid                     ),  
             .mmu_m2s_araddr                     ( mmu_m2s_araddr                   ),
             .mmu_m2s_arlen                      ( mmu_m2s_arlen                    ),
             .mmu_m2s_arsize                     ( mmu_m2s_arsize                   ),
             .mmu_m2s_arvalid                    ( mmu_m2s_arvalid                  ),
             .mmu_s2m_arready                    ( mmu_s2m_arready                  ),
          
     //mmu axi4 read data           
             .mmu_s2m_rid                        ( mmu_s2m_rid                      ),
             .mmu_s2m_rdata                      ( mmu_s2m_rdata                    ),
             .mmu_s2m_rresp                      ( mmu_s2m_rresp                    ),
             .mmu_s2m_rlast                      ( mmu_s2m_rlast                    ),
             .mmu_s2m_rvalid                     ( mmu_s2m_rvalid                   ),
             .mmu_m2s_rready                     ( mmu_m2s_rready                   ),      

     //knl axi4 write addr                                    
             .knl_m2s_awid                       ( knl_m2s_awid                     ),  
             .knl_m2s_awaddr                     ( knl_m2s_awaddr                   ),
             .knl_m2s_awlen                      ( knl_m2s_awlen                    ),
             .knl_m2s_awsize                     ( knl_m2s_awsize                   ),
             .knl_m2s_awvalid                    ( knl_m2s_awvalid                  ),
             .knl_s2m_awready                    ( knl_s2m_awready                  ),
        
     //knl axi4 write data                                    
             .knl_m2s_wid                        ( knl_m2s_wid                      ), 
             .knl_m2s_wdata                      ( knl_m2s_wdata                    ),
             .knl_m2s_wstrb                      ( knl_m2s_wstrb                    ),
             .knl_m2s_wlast                      ( knl_m2s_wlast                    ),
             .knl_m2s_wvalid                     ( knl_m2s_wvalid                   ),
             .knl_s2m_wready                     ( knl_s2m_wready                   ),
        
     //knl axi4 write rsp 	            
             .knl_s2m_bid                        ( knl_s2m_bid                      ),
             .knl_s2m_bresp                      ( knl_s2m_bresp                    ),
             .knl_s2m_bvalid                     ( knl_s2m_bvalid                   ),
             .knl_m2s_bready                     ( knl_m2s_bready                   ),

     //knl axi4 read addr 	            
             .knl_m2s_arid                       ( knl_m2s_arid                     ),  
             .knl_m2s_araddr                     ( knl_m2s_araddr                   ),
             .knl_m2s_arlen                      ( knl_m2s_arlen                    ),
             .knl_m2s_arsize                     ( knl_m2s_arsize                   ),
             .knl_m2s_arvalid                    ( knl_m2s_arvalid                  ),
             .knl_s2m_arready                    ( knl_s2m_arready                  ),
        
     //knl axi4 read data 	            
             .knl_s2m_rid                        ( knl_s2m_rid                      ),
             .knl_s2m_rdata                      ( knl_s2m_rdata                    ),
             .knl_s2m_rresp                      ( knl_s2m_rresp                    ),
             .knl_s2m_rlast                      ( knl_s2m_rlast                    ),
             .knl_s2m_rvalid                     ( knl_s2m_rvalid                   ),
             .knl_m2s_rready                     ( knl_m2s_rready                   ),   

     //ddr axi4 write addr                                 
             .axi4_m2s_awid                      ( axi4_m2s_awid                    ),  
             .axi4_m2s_awaddr                    ( axi4_m2s_awaddr                  ),
             .axi4_m2s_awlen                     ( axi4_m2s_awlen                   ),
             .axi4_m2s_awsize                    ( axi4_m2s_awsize                  ),
        
             .axi4_m2s_awvalid                   ( axi4_m2s_awvalid                 ),
             .axi4_s2m_awready                   ( axi4_s2m_awready                 ),
        
     //ddr axi4 write wdata                                 
             .axi4_m2s_wid                       ( axi4_m2s_wid                     ),
             .axi4_m2s_wdata                     ( axi4_m2s_wdata                   ),
             .axi4_m2s_wstrb                     ( axi4_m2s_wstrb                   ),
             .axi4_m2s_wlast                     ( axi4_m2s_wlast                   ),
             .axi4_m2s_wvalid                    ( axi4_m2s_wvalid                  ),
             .axi4_s2m_wready                    ( axi4_s2m_wready                  ),
        
     //ddr axi4 write rsp        
             .axi4_s2m_bid                       ( axi4_s2m_bid                     ),
             .axi4_s2m_bresp                     ( axi4_s2m_bresp                   ),
             .axi4_s2m_bvalid                    ( axi4_s2m_bvalid                  ),
             .axi4_m2s_bready                    ( axi4_m2s_bready                  ), 
                                           
     //ddr axi4 read addr        
             .axi4_m2s_arid                      ( axi4_m2s_arid                    ),  
             .axi4_m2s_araddr                    ( axi4_m2s_araddr                  ),
             .axi4_m2s_arlen                     ( axi4_m2s_arlen                   ),
             .axi4_m2s_arsize                    ( axi4_m2s_arsize                  ),
             .axi4_m2s_arvalid                   ( axi4_m2s_arvalid                 ),
             .axi4_s2m_arready                   ( axi4_s2m_arready                 ),
          
     //ddr axi4 read data        
             .axi4_s2m_rid                       ( axi4_s2m_rid                     ),
             .axi4_s2m_rdata                     ( axi4_s2m_rdata                   ),
             .axi4_s2m_rresp                     ( axi4_s2m_rresp                   ),
             .axi4_s2m_rlast                     ( axi4_s2m_rlast                   ),
             .axi4_s2m_rvalid                    ( axi4_s2m_rvalid                  ),
             .axi4_m2s_rready                    ( axi4_m2s_rready                  ),
    //with cpu
             .cnt_reg_clr                        ( 1'b0                             ),
             .cpu_addr                           ( cpu_addr[A_WTH+1:2]              ),
             .cpu_data_in                        ( cpu_data_in                      ),
             .cpu_data_out_connect               ( cpu_data_out_connect             ),
             .cpu_rd                             ( cpu_rd                           ),
             .cpu_wr                             ( cpu_wr                           )   

            
        );

kernel #
    (
        .A_DTH                           (    9                ),
        .EOP_POS                         (    519              ),
        .DDR_NUM                         (    4                ),
        .ERR_POS                         (    518              ),
        .FULL_LEVEL                      (    9'd400           )
    )
u_kernel
    (
    .clk_shell                           ( clk_200m                        ),//i 1
    .rst_shell                           ( rst_ul                        ),//i 1

    .clk_kernel                          ( clk_200m                        ),//i 1
    .rst_kernel                          ( rst_ul                        ),//i 1

    .m_axis_rc_tdata                     ( bd2k_s_axis_rq_tdata            ),//i 512
    .m_axis_rc_tuser                     ( 75'd0                           ),//i 75
    .m_axis_rc_tlast                     ( bd2k_s_axis_rq_tlast            ),//i 1
    .m_axis_rc_tkeep                     ( bd2k_s_axis_rq_tkeep            ),//i 64
    .m_axis_rc_tvalid                    ( bd2k_s_axis_rq_tvalid           ),//i 1
    .m_axis_rc_tready                    ( bd2k_s_axis_rq_tready           ),//o 1

    .s_axis_rq_tlast                     ( ker2mmu_bd_tlast                ),//o 1
    .s_axis_rq_tdata                     ( ker2mmu_bd_tdata                ),//o 512
    .s_axis_rq_tuser                     (                                 ),//o 60
    .s_axis_rq_tkeep                     ( ker2mmu_bd_tkeep                ),//o 64
    .s_axis_rq_tready                    ( mmu2ker_bd_tready               ),//i 1
    .s_axis_rq_tvalid                    ( ker2mmu_bd_tvalid               ),//o 1

    .axi4_m2s_awid                       ( knl_m2s_awid                    ),//o 16
    .axi4_m2s_awaddr                     ( knl_m2s_awaddr                  ),//o 256
    .axi4_m2s_awlen                      ( knl_m2s_awlen                   ),//o 32
    .axi4_m2s_awsize                     ( knl_m2s_awsize                  ),//o 12
    .axi4_m2s_awuser                     (                                 ),//o 296

    .axi4_m2s_awvalid                    ( knl_m2s_awvalid                 ),//o 4
    .axi4_s2m_awready                    ( knl_s2m_awready                 ),//i 1

    .axi4_m2s_wid                        ( knl_m2s_wid                     ),//o 16
    .axi4_m2s_wdata                      ( knl_m2s_wdata                   ),//o 2048
    .axi4_m2s_wstrb                      ( knl_m2s_wstrb                   ),//o 256
    .axi4_m2s_wlast                      ( knl_m2s_wlast                   ),//o 4
    .axi4_m2s_wvalid                     ( knl_m2s_wvalid                  ),//o 4
    .axi4_s2m_wready                     ( knl_s2m_wready                  ),//i 4

    .axi4_s2m_bid                        ( knl_s2m_bid                     ),//i 16
    .axi4_s2m_bresp                      ( knl_s2m_bresp                   ),//i 8
    .axi4_s2m_bvalid                     ( knl_s2m_bvalid                  ),//i 4
    .axi4_m2s_bready                     ( knl_m2s_bready                  ),//o 4

    .axi4m_ddr_arid                      ( knl_m2s_arid                    ),//o 16
    .axi4m_ddr_araddr                    ( knl_m2s_araddr                  ),//o 256
    .axi4m_ddr_arlen                     ( knl_m2s_arlen                   ),//o 28
    .axi4m_ddr_arsize                    ( knl_m2s_arsize                  ),//o 28
    .axi4m_ddr_arvalid                   ( knl_m2s_arvalid                 ),//o 4
    .axi4m_ddr_arready                   ( knl_s2m_arready                 ),//i 4

    .axi4m_ddr_rid                       ( knl_s2m_rid                     ),//i 16
    .axi4m_ddr_rdata                     ( knl_s2m_rdata                   ),//i 2048
    .axi4m_ddr_rresp                     ( knl_s2m_rresp                   ),//i 8
    .axi4m_ddr_rlast                     ( knl_s2m_rlast                   ),//i 4
    .axi4m_ddr_rvalid                    ( knl_s2m_rvalid                  ),//i 4
    .axi4m_ddr_rready                    ( knl_m2s_rready                  ),//o 4

    .reg_tmout_us_cfg                    ( 16'hffff                        ),//i 16
    .reg_tmout_us_err                    (                                 ),//o 1

    .fifo_status                         (                                 ),//o 4
    .fifo_err                            (                                 ),//o 2
    .rc_rx_cnt                           (                                 ),//o 1
    .rc_rx_drop_cnt                      (                                 ),//o 1
    .rq_tx_cnt                           (                                 ) //o 1

    );


//ddr write signal process
assign ddra_axi4_m2s_awid   = axi4_m2s_awid[4*(0+1)-1:4*0];
assign ddrb_axi4_m2s_awid   = axi4_m2s_awid[4*(1+1)-1:4*1];
assign ul2sh_ddr_awid       = axi4_m2s_awid[4*(2+1)-1:4*2];
assign ddrd_axi4_m2s_awid   = axi4_m2s_awid[4*(3+1)-1:4*3];

assign ddra_axi4_m2s_awaddr = axi4_m2s_awaddr[64*(0+1)-1:64*0];
assign ddrb_axi4_m2s_awaddr = axi4_m2s_awaddr[64*(1+1)-1:64*1];
assign ul2sh_ddr_awaddr     = axi4_m2s_awaddr[64*(2+1)-1:64*2];
assign ddrd_axi4_m2s_awaddr = axi4_m2s_awaddr[64*(3+1)-1:64*3];

assign ddra_axi4_m2s_awlen  = axi4_m2s_awlen[8*(0+1)-1:8*0];
assign ddrb_axi4_m2s_awlen  = axi4_m2s_awlen[8*(1+1)-1:8*1];
assign ul2sh_ddr_awlen      = axi4_m2s_awlen[8*(2+1)-1:8*2];
assign ddrd_axi4_m2s_awlen  = axi4_m2s_awlen[8*(3+1)-1:8*3];

assign ddra_axi4_m2s_awsize = axi4_m2s_awsize[3*(0+1)-1:3*0];
assign ddrb_axi4_m2s_awsize = axi4_m2s_awsize[3*(1+1)-1:3*1];
assign ul2sh_ddr_awsize     = axi4_m2s_awsize[3*(2+1)-1:3*2];
assign ddrd_axi4_m2s_awsize = axi4_m2s_awsize[3*(3+1)-1:3*3];

assign ddra_axi4_m2s_awvalid = axi4_m2s_awvalid[1*(0+1)-1:1*0];
assign ddrb_axi4_m2s_awvalid = axi4_m2s_awvalid[1*(1+1)-1:1*1];
assign ul2sh_ddr_awvalid     = axi4_m2s_awvalid[1*(2+1)-1:1*2];
assign ddrd_axi4_m2s_awvalid = axi4_m2s_awvalid[1*(3+1)-1:1*3];

assign ddra_axi4_m2s_wid     = axi4_m2s_wid[4*(0+1)-1:4*0];
assign ddrb_axi4_m2s_wid     = axi4_m2s_wid[4*(1+1)-1:4*1];
assign ul2sh_ddr_wid         = axi4_m2s_wid[4*(2+1)-1:4*2];
assign ddrd_axi4_m2s_wid     = axi4_m2s_wid[4*(3+1)-1:4*3];

assign ddra_axi4_m2s_wdata   = axi4_m2s_wdata[512*(0+1)-1:512*0];
assign ddrb_axi4_m2s_wdata   = axi4_m2s_wdata[512*(1+1)-1:512*1];
assign ul2sh_ddr_wdata       = axi4_m2s_wdata[512*(2+1)-1:512*2];
assign ddrd_axi4_m2s_wdata   = axi4_m2s_wdata[512*(3+1)-1:512*3];

assign ddra_axi4_m2s_wstrb   = axi4_m2s_wstrb[64*(0+1)-1:64*0];
assign ddrb_axi4_m2s_wstrb   = axi4_m2s_wstrb[64*(1+1)-1:64*1];
assign ul2sh_ddr_wstrb       = axi4_m2s_wstrb[64*(2+1)-1:64*2];
assign ddrd_axi4_m2s_wstrb   = axi4_m2s_wstrb[64*(3+1)-1:64*3];

assign ddra_axi4_m2s_wlast   = axi4_m2s_wlast[1*(0+1)-1:1*0];
assign ddrb_axi4_m2s_wlast   = axi4_m2s_wlast[1*(1+1)-1:1*1];
assign ul2sh_ddr_wlast       = axi4_m2s_wlast[1*(2+1)-1:1*2];
assign ddrd_axi4_m2s_wlast   = axi4_m2s_wlast[1*(3+1)-1:1*3];

assign ddra_axi4_m2s_wvalid  = axi4_m2s_wvalid[1*(0+1)-1:1*0];
assign ddrb_axi4_m2s_wvalid  = axi4_m2s_wvalid[1*(1+1)-1:1*1];
assign ul2sh_ddr_wvalid      = axi4_m2s_wvalid[1*(2+1)-1:1*2];
assign ddrd_axi4_m2s_wvalid  = axi4_m2s_wvalid[1*(3+1)-1:1*3];

assign ddra_axi4_m2s_bready  = axi4_m2s_bready[1*(0+1)-1:1*0];
assign ddrb_axi4_m2s_bready  = axi4_m2s_bready[1*(1+1)-1:1*1];
assign ul2sh_ddr_bready      = axi4_m2s_bready[1*(2+1)-1:1*2];
assign ddrd_axi4_m2s_bready  = axi4_m2s_bready[1*(3+1)-1:1*3];

assign axi4_s2m_awready = {
                            ddrd_axi4_s2m_awready,
                            sh2ul_ddr_awready,
                            ddrb_axi4_s2m_awready,
                            ddra_axi4_s2m_awready
                           };

assign axi4_s2m_wready = {
                            ddrd_axi4_s2m_wready,
                            sh2ul_ddr_wready,
                            ddrb_axi4_s2m_wready,
                            ddra_axi4_s2m_wready
                         };

assign axi4_s2m_bid =   {
                            ddrd_axi4_s2m_bid,
                            sh2ul_ddr_bid,
                            ddrb_axi4_s2m_bid,
                            ddra_axi4_s2m_bid
                         };

assign axi4_s2m_bresp = {
                            ddrd_axi4_s2m_bresp,
                            sh2ul_ddr_bresp,
                            ddrb_axi4_s2m_bresp,
                            ddra_axi4_s2m_bresp
                         };

assign axi4_s2m_bvalid = {
                            ddrd_axi4_s2m_bvalid,
                            sh2ul_ddr_bvalid,
                            ddrb_axi4_s2m_bvalid,
                            ddra_axi4_s2m_bvalid
                         };


//ddr read signals process
assign ddra_axi4_m2s_arid    = axi4_m2s_arid[4*(0+1)-1:4*0];
assign ddrb_axi4_m2s_arid    = axi4_m2s_arid[4*(1+1)-1:4*1];
assign ul2sh_ddr_arid        = axi4_m2s_arid[4*(2+1)-1:4*2];
assign ddrd_axi4_m2s_arid    = axi4_m2s_arid[4*(3+1)-1:4*3];

assign ddra_axi4_m2s_araddr  = axi4_m2s_araddr[64*(0+1)-1:64*0];
assign ddrb_axi4_m2s_araddr  = axi4_m2s_araddr[64*(1+1)-1:64*1];
assign ul2sh_ddr_araddr      = axi4_m2s_araddr[64*(2+1)-1:64*2];
assign ddrd_axi4_m2s_araddr  = axi4_m2s_araddr[64*(3+1)-1:64*3];

assign ddra_axi4_m2s_arlen   = axi4_m2s_arlen[8*(0+1)-1:8*0];
assign ddrb_axi4_m2s_arlen   = axi4_m2s_arlen[8*(1+1)-1:8*1];
assign ul2sh_ddr_arlen       = axi4_m2s_arlen[8*(2+1)-1:8*2];
assign ddrd_axi4_m2s_arlen   = axi4_m2s_arlen[8*(3+1)-1:8*3];

assign ddra_axi4_m2s_arsize  = axi4_m2s_arsize[3*(0+1)-1:3*0];
assign ddrb_axi4_m2s_arsize  = axi4_m2s_arsize[3*(1+1)-1:3*1];
assign ul2sh_ddr_arsize      = axi4_m2s_arsize[3*(2+1)-1:3*2];
assign ddrd_axi4_m2s_arsize  = axi4_m2s_arsize[3*(3+1)-1:3*3];

assign ddra_axi4_m2s_arvalid = axi4_m2s_arvalid[1*(0+1)-1:1*0];
assign ddrb_axi4_m2s_arvalid = axi4_m2s_arvalid[1*(1+1)-1:1*1];
assign ul2sh_ddr_arvalid     = axi4_m2s_arvalid[1*(2+1)-1:1*2];
assign ddrd_axi4_m2s_arvalid = axi4_m2s_arvalid[1*(3+1)-1:1*3];

assign ddra_axi4_m2s_rready  = axi4_m2s_rready[1*(0+1)-1:1*0];
assign ddrb_axi4_m2s_rready  = axi4_m2s_rready[1*(1+1)-1:1*1];
assign ul2sh_ddr_rready      = axi4_m2s_rready[1*(2+1)-1:1*2];
assign ddrd_axi4_m2s_rready  = axi4_m2s_rready[1*(3+1)-1:1*3];

assign axi4_s2m_arready = {
                            ddrd_axi4_s2m_arready,
                            sh2ul_ddr_arready,
                            ddrb_axi4_s2m_arready,
                            ddra_axi4_s2m_arready
                           };

assign axi4_s2m_rid = {
                            ddrd_axi4_s2m_rid,
                            sh2ul_ddr_rid,
                            ddrb_axi4_s2m_rid,
                            ddra_axi4_s2m_rid
                           };

assign axi4_s2m_rdata = {
                            ddrd_axi4_s2m_rdata,
                            sh2ul_ddr_rdata,
                            ddrb_axi4_s2m_rdata,
                            ddra_axi4_s2m_rdata
                           };

assign axi4_s2m_rlast = {
                            ddrd_axi4_s2m_rlast,
                            sh2ul_ddr_rlast,
                            ddrb_axi4_s2m_rlast,
                            ddra_axi4_s2m_rlast
                           };

assign axi4_s2m_rvalid = {
                            ddrd_axi4_s2m_rvalid,
                            sh2ul_ddr_rvalid,
                            ddrb_axi4_s2m_rvalid,
                            ddra_axi4_s2m_rvalid
                         };

assign axi4_s2m_rresp = {
                            ddrd_axi4_s2m_rresp,
                            sh2ul_ddr_rresp,
                            ddrb_axi4_s2m_rresp,
                            ddra_axi4_s2m_rresp
                         };

//**********************************************************************
// ddra_ctrl
//**********************************************************************
ddra_72b_top    u_ddra_72b_top (
    .ddr_cal_done                   (ddra_cal_done                  ),   
    .ddr_init_done                  (ddra_init_done                 ),   
    .ddr_resumable_int              (                               ),   
    .ddr_unresumable_int            (                               ),   
    .aclk                           (clk_200m                       ),
    .areset                         (rst_ul                       ),
        
    .awid                           (ddra_axi4_m2s_awid             ),    
    .awaddr                         (ddra_axi4_m2s_awaddr           ),    
    .awlen                          (ddra_axi4_m2s_awlen            ),    
    .awsize                         (ddra_axi4_m2s_awsize           ),    
    .awvalid                        (ddra_axi4_m2s_awvalid          ),    
    .awready                        (ddra_axi4_s2m_awready          ),   
    .wid                            (ddra_axi4_m2s_wid              ),    
    .wdata                          (ddra_axi4_m2s_wdata            ),    
    .wstrb                          (ddra_axi4_m2s_wstrb            ),    
    .wlast                          (ddra_axi4_m2s_wlast            ),    
    .wvalid                         (ddra_axi4_m2s_wvalid           ),    
    .wready                         (ddra_axi4_s2m_wready           ),    
    .bid                            (ddra_axi4_s2m_bid              ),    
    .bresp                          (ddra_axi4_s2m_bresp            ),    
    .bvalid                         (ddra_axi4_s2m_bvalid           ),    
    .bready                         (ddra_axi4_m2s_bready           ),    
    .arid                           (ddra_axi4_m2s_arid             ),    
    .araddr                         (ddra_axi4_m2s_araddr           ),    
    .arlen                          (ddra_axi4_m2s_arlen            ),    
    .arsize                         (ddra_axi4_m2s_arsize           ),    
    .arvalid                        (ddra_axi4_m2s_arvalid          ),    
    .arready                        (ddra_axi4_s2m_arready          ),
    .rid                            (ddra_axi4_s2m_rid              ),  
    .rdata                          (ddra_axi4_s2m_rdata            ),  
    .rresp                          (ddra_axi4_s2m_rresp            ),  
    .rlast                          (ddra_axi4_s2m_rlast            ),  
    .rvalid                         (ddra_axi4_s2m_rvalid           ),  
    .rready                         (ddra_axi4_m2s_rready           ),  

    .ra_order                       (4'd0                           ),
    .rdata_ecc_err                  (                               ),    
    .rd_order                       (                               ),    

    .clk_core                       (clk_ddra                       ),    
    .ddr_reset                      (rst_ddra                       ),    
    //phy interface
    .mc_rddata_addr                 (ddra_mc_rddata_addr            ),  
    .mc_wrdata_addr                 (ddra_mc_wrdata_addr            ),  
    .mc_wrdata_en                   (ddra_mc_wrdata_en              ),  
    .mc_per_rd_done                 (ddra_mc_per_rd_done            ),  
    .mc_rmw_rd_done                 (ddra_mc_rmw_rd_done            ),  
    .mc_rddata_en                   (ddra_mc_rddata_en              ),  
    .mc_rddata_end                  (ddra_mc_rddata_end             ),  
    .mc_rddata                      (ddra_mc_rddata                 ),  
    .mc_gt_data_ready               (ddra_mc_gt_data_ready          ),  
    .mc_act_n                       (ddra_mc_act_n                  ),  
    .mc_addr                        (ddra_mc_addr                   ),  
    .mc_ba                          (ddra_mc_ba                     ),  
    .mc_bg                          (ddra_mc_bg                     ),  
    .mc_cke                         (ddra_mc_cke                    ),  
    .mc_cs_n                        (ddra_mc_cs_n                   ),  
    .mc_odt                         (ddra_mc_odt                    ),  
    .mc_cas_slot                    (ddra_mc_cas_slot               ),  
    .mc_cas_slot2                   (ddra_mc_cas_slot2              ),  
    .mc_rdcas                       (ddra_mc_rdcas                  ),  
    .mc_wrcas                       (ddra_mc_wrcas                  ),  
    .mc_winrank                     (ddra_mc_winrank                ),  
    .mc_par                         (ddra_mc_par                    ),  
    .mc_wininjtxn                   (ddra_mc_wininjtxn              ),  
    .mc_winrmw                      (ddra_mc_winrmw                 ),  
    .mc_winbuf                      (ddra_mc_winbuf                 ),  
    .mc_dbuf_addr                   (ddra_mc_dbuf_addr              ),  
    .mc_wrdata                      (ddra_mc_wrdata                 ),  
    .mc_wrdata_mask                 (ddra_mc_wrdata_mask            ),  
    .mc_tcwl                        (ddra_mc_tcwl                   ),  
    .mc_dbg_bus                     (ddra_mc_dbg_bus                ),  
    //sim model intreface
    .sim_md_en                      (1'b0                           ),  
    .sim_md_full                    (1'b0                           ), 
    .sim_md_rank                    (                               ),   
    .sim_md_slot                    (                               ), 
    .sim_md_0cmd                    (                               ), 
    .sim_md_1cmd                    (                               ), 
    .sim_md_2cmd                    (                               ), 
    .sim_md_3cmd                    (                               ), 
    .sim_md_wdata_afull             (1'b0                           ),  
    .sim_md_wen                     (                               ), 
    .sim_md_wdata                   (                               ), 
    .sim_md_rdata_vld               (1'b0                           ), 
    .sim_md_rdata                   (576'd0                         ), 
    //clear interface
    .clk_hpi                        (clk_200m                       ), 
    .hpi_reset                      (rst_ul                       ), 
    .hpi_stat_clr                   (1'b0                           ), 
    //hpi interface
    .hpi2ddr_wen                    (hpi2ddra_wen_2dly              ),  
    .hpi2ddr_ren                    (hpi2ddra_ren_2dly              ),  
    .hpi2ddr_addr                   (cpu_addr_2dly[13:0]            ),  
    .hpi2ddr_wdata                  (cpu_data_in_2dly               ),  
    .ddr2hpi_valid                  (ddra2hpi_valid                 ),  
    .ddr2hpi_rdata                  (hpi_cpu_data_out_ddra          ),  
    .spd_i2c_scl_i                  (1'b1                           ),    
    .spd_i2c_sda_i                  (1'b1                           ),   
    .spd_i2c_scl_o                  (                               ),    
    .spd_i2c_sda_o                  (                               )    
    );

assign  hpi2ddra_wen  = cpu_wr & (cpu_addr[A_WTH+1:14] == DDRA_ID);
assign  hpi2ddra_ren  = cpu_rd & (cpu_addr[A_WTH+1:14] == DDRA_ID);

//**********************************************************************
// ddra phy
//**********************************************************************
rdimma_x8_16GB_2133Mbps   u_phy_ddra_72b (
    //rcm
    .sys_rst                    (rst_ul                       ), 
    .c0_sys_clk_p               (ddra_100m_ref_clk_p            ), 
    .c0_sys_clk_n               (ddra_100m_ref_clk_n            ), 
    .c0_ddr4_ui_clk             (clk_ddra                       ), 
    .c0_ddr4_ui_clk_sync_rst    (rst_ddra                       ), 
    .dbg_clk                    (                               ), 
    //model
    .c0_ddr4_act_n              (ddra_72b_act_n                 ), 
    .c0_ddr4_adr                (ddra_72b_addr                  ), 
    .c0_ddr4_ba                 (ddra_72b_ba                    ), 
    .c0_ddr4_bg                 (ddra_72b_bg                    ), 
    .c0_ddr4_cke                (ddra_72b_cke                   ), 
    .c0_ddr4_odt                (ddra_72b_odt                   ), 
    .c0_ddr4_cs_n               (ddra_72b_cs_n                  ), 
    .c0_ddr4_ck_t               (ddra_72b_ck_t                  ), 
    .c0_ddr4_ck_c               (ddra_72b_ck_c                  ), 
    .c0_ddr4_reset_n            (ddra_72b_rst_n                 ), 
    .c0_ddr4_parity             (ddra_72b_par                   ), 
    .c0_ddr4_dq                 (ddra_72b_dq                    ),
    .c0_ddr4_dqs_c              (ddra_72b_dqs_c                 ),
    .c0_ddr4_dqs_t              (ddra_72b_dqs_t                 ),
    .c0_ddr4_dm_dbi_n           (ddra_72b_dm_dbi_n              ),
    //common
    .c0_init_calib_complete     (ddra_cal_done                  ),
    //mc
    .dBufAdr                    (ddra_mc_dbuf_addr              ),
    .wrData                     (ddra_mc_wrdata                 ),
    .wrDataMask                 (ddra_mc_wrdata_mask            ),
    .rdData                     (ddra_mc_rddata                 ),
    .rdDataAddr                 (ddra_mc_rddata_addr            ),
    .rdDataEn                   (ddra_mc_rddata_en              ),
    .rdDataEnd                  (ddra_mc_rddata_end             ),
    .per_rd_done                (ddra_mc_per_rd_done            ),
    .rmw_rd_done                (ddra_mc_rmw_rd_done            ),
    .wrDataAddr                 (ddra_mc_wrdata_addr            ),
    .wrDataEn                   (ddra_mc_wrdata_en              ),

    .mc_ACT_n                   (ddra_mc_act_n                  ),
    .mc_ADR                     (ddra_mc_addr                   ),
    .mc_BA                      (ddra_mc_ba                     ),
    .mc_BG                      (ddra_mc_bg                     ),
    .mc_CKE                     (ddra_mc_cke                    ),
    .mc_CS_n                    (ddra_mc_cs_n                   ),
    .mc_ODT                     (ddra_mc_odt                    ),
    .mcCasSlot                  (ddra_mc_cas_slot               ), 
    .mcCasSlot2                 (ddra_mc_cas_slot2              ), 
    .mcRdCAS                    (ddra_mc_rdcas                  ), 
    .mcWrCAS                    (ddra_mc_wrcas                  ), 
    .winInjTxn                  (ddra_mc_wininjtxn              ), 
    .winRmw                     (ddra_mc_winrmw                 ), 
    .gt_data_ready              (ddra_mc_gt_data_ready          ), 
    .winBuf                     (ddra_mc_winbuf                 ), 
    .winRank                    (ddra_mc_winrank                ), 
    .tCWL                       (ddra_mc_tcwl                   ), 
    .dbg_bus                    (ddra_mc_dbg_bus                )  
    );


//**********************************************************************
// ddrb ctrl
//**********************************************************************

ddrb_72b_top    u_ddrb_72b_top (
    .ddr_cal_done                   (ddrb_cal_done                  ),  
    .ddr_init_done                  (ddrb_init_done                 ),  
    .ddr_resumable_int              (                               ),  
    .ddr_unresumable_int            (                               ),  
    //user interface
    .aclk                           (clk_200m                       ),
    .areset                         (rst_ul                       ),
    .awid                           (ddrb_axi4_m2s_awid             ),    
    .awaddr                         (ddrb_axi4_m2s_awaddr           ),    
    .awlen                          (ddrb_axi4_m2s_awlen            ),    
    .awsize                         (ddrb_axi4_m2s_awsize           ),    
    .awvalid                        (ddrb_axi4_m2s_awvalid          ),    
    .awready                        (ddrb_axi4_s2m_awready          ),   
    .wid                            (ddrb_axi4_m2s_wid              ),    
    .wdata                          (ddrb_axi4_m2s_wdata            ),    
    .wstrb                          (ddrb_axi4_m2s_wstrb            ),    
    .wlast                          (ddrb_axi4_m2s_wlast            ),    
    .wvalid                         (ddrb_axi4_m2s_wvalid           ),    
    .wready                         (ddrb_axi4_s2m_wready           ),    
    .bid                            (ddrb_axi4_s2m_bid              ),    
    .bresp                          (ddrb_axi4_s2m_bresp            ),    
    .bvalid                         (ddrb_axi4_s2m_bvalid           ),    
    .bready                         (ddrb_axi4_m2s_bready           ),    
    .arid                           (ddrb_axi4_m2s_arid            ),    
    .araddr                         (ddrb_axi4_m2s_araddr          ),    
    .arlen                          (ddrb_axi4_m2s_arlen           ),    
    .arsize                         (ddrb_axi4_m2s_arsize          ),    
    .arvalid                        (ddrb_axi4_m2s_arvalid         ),    
    .arready                        (ddrb_axi4_s2m_arready         ),
    .rid                            (ddrb_axi4_s2m_rid             ),  
    .rdata                          (ddrb_axi4_s2m_rdata           ),  
    .rresp                          (ddrb_axi4_s2m_rresp           ),  
    .rlast                          (ddrb_axi4_s2m_rlast           ),  
    .rvalid                         (ddrb_axi4_s2m_rvalid          ),  
    .rready                         (ddrb_axi4_m2s_rready          ),  

    .ra_order                       (4'd0                           ),
    .rdata_ecc_err                  (                               ),    
    .rd_order                       (                               ),   
    .clk_core                       (clk_ddrb                       ),    
    .ddr_reset                      (rst_ddrb                       ),    
    //phy interface
    .mc_rddata_addr                 (ddrb_mc_rddata_addr            ),  
    .mc_wrdata_addr                 (ddrb_mc_wrdata_addr            ),  
    .mc_wrdata_en                   (ddrb_mc_wrdata_en              ),  
    .mc_per_rd_done                 (ddrb_mc_per_rd_done            ),  
    .mc_rmw_rd_done                 (ddrb_mc_rmw_rd_done            ),  
    .mc_rddata_en                   (ddrb_mc_rddata_en              ),  
    .mc_rddata_end                  (ddrb_mc_rddata_end             ),  
    .mc_rddata                      (ddrb_mc_rddata                 ),  
    .mc_gt_data_ready               (ddrb_mc_gt_data_ready          ),  
    .mc_act_n                       (ddrb_mc_act_n                  ),  
    .mc_addr                        (ddrb_mc_addr                   ),  
    .mc_ba                          (ddrb_mc_ba                     ),  
    .mc_bg                          (ddrb_mc_bg                     ),  
    .mc_cke                         (ddrb_mc_cke                    ),  
    .mc_cs_n                        (ddrb_mc_cs_n                   ),  
    .mc_odt                         (ddrb_mc_odt                    ),  
    .mc_cas_slot                    (ddrb_mc_cas_slot               ),  
    .mc_cas_slot2                   (ddrb_mc_cas_slot2              ),  
    .mc_rdcas                       (ddrb_mc_rdcas                  ),  
    .mc_wrcas                       (ddrb_mc_wrcas                  ),  
    .mc_winrank                     (ddrb_mc_winrank                ),  
    .mc_par                         (ddrb_mc_par                    ),  
    .mc_wininjtxn                   (ddrb_mc_wininjtxn              ),  
    .mc_winrmw                      (ddrb_mc_winrmw                 ),  
    .mc_winbuf                      (ddrb_mc_winbuf                 ),  
    .mc_dbuf_addr                   (ddrb_mc_dbuf_addr              ),  
    .mc_wrdata                      (ddrb_mc_wrdata                 ),  
    .mc_wrdata_mask                 (ddrb_mc_wrdata_mask            ),  
    .mc_tcwl                        (ddrb_mc_tcwl                   ),  
    .mc_dbg_bus                     (ddrb_mc_dbg_bus                ),  
    //sim model intreface
    .sim_md_en                      (1'b0                           ),  
    .sim_md_full                    (1'b0                           ),  
    .sim_md_rank                    (                               ),   
    .sim_md_slot                    (                               ),  
    .sim_md_0cmd                    (                               ),  
    .sim_md_1cmd                    (                               ),  
    .sim_md_2cmd                    (                               ),  
    .sim_md_3cmd                    (                               ),  
    .sim_md_wdata_afull             (1'b0                           ),  
    .sim_md_wen                     (                               ), 
    .sim_md_wdata                   (                               ), 
    .sim_md_rdata_vld               (1'b0                           ), 
    .sim_md_rdata                   (576'd0                         ), 
    //clear interface
    .clk_hpi                        (clk_200m                       ), 
    .hpi_reset                      (rst_ul                       ), 
    .hpi_stat_clr                   (1'b0                           ), 
    //hpi interface
    .hpi2ddr_wen                    (hpi2ddrb_wen_2dly              ),  
    .hpi2ddr_ren                    (hpi2ddrb_ren_2dly              ),  
    .hpi2ddr_addr                   (cpu_addr_2dly[13:0]            ),  
    .hpi2ddr_wdata                  (cpu_data_in_2dly               ),  
    .ddr2hpi_valid                  (ddrb2hpi_valid                 ),  
    .ddr2hpi_rdata                  (hpi_cpu_data_out_ddrb          ),  
    .spd_i2c_scl_i                  (1'b1                           ),    
    .spd_i2c_sda_i                  (1'b1                           ),   
    .spd_i2c_scl_o                  (                               ),    
    .spd_i2c_sda_o                  (                               )    
    );

assign  hpi2ddrb_wen  = cpu_wr & (cpu_addr[A_WTH+1:14] == DDRB_ID);
assign  hpi2ddrb_ren  = cpu_rd & (cpu_addr[A_WTH+1:14] == DDRB_ID);

//*****************************************************************
// ddrd phy 
//*****************************************************************

rdimmb_x8_16GB_2133Mbps   u_phy_ddrb_72b (
    //rcm
    .sys_rst                    (rst_ul                       ),
    .c0_sys_clk_p               (ddrb_100m_ref_clk_p            ),
    .c0_sys_clk_n               (ddrb_100m_ref_clk_n            ),
    .c0_ddr4_ui_clk             (clk_ddrb                       ),
    .c0_ddr4_ui_clk_sync_rst    (rst_ddrb                       ),
    .dbg_clk                    (                               ),
    //model
    .c0_ddr4_act_n              (ddrb_72b_act_n                 ),
    .c0_ddr4_adr                (ddrb_72b_addr                  ),
    .c0_ddr4_ba                 (ddrb_72b_ba                    ),
    .c0_ddr4_bg                 (ddrb_72b_bg                    ),
    .c0_ddr4_cke                (ddrb_72b_cke                   ),
    .c0_ddr4_odt                (ddrb_72b_odt                   ),
    .c0_ddr4_cs_n               (ddrb_72b_cs_n                  ),
    .c0_ddr4_ck_t               (ddrb_72b_ck_t                  ),
    .c0_ddr4_ck_c               (ddrb_72b_ck_c                  ),
    .c0_ddr4_reset_n            (ddrb_72b_rst_n                 ),
    .c0_ddr4_parity             (ddrb_72b_par                   ),
    .c0_ddr4_dq                 (ddrb_72b_dq                    ), 
    .c0_ddr4_dqs_c              (ddrb_72b_dqs_c                 ), 
    .c0_ddr4_dqs_t              (ddrb_72b_dqs_t                 ), 
    .c0_ddr4_dm_dbi_n           (ddrb_72b_dm_dbi_n              ), 
    //common
    .c0_init_calib_complete     (ddrb_cal_done                  ), 
    //mc
    .dBufAdr                    (ddrb_mc_dbuf_addr              ), 
    .wrData                     (ddrb_mc_wrdata                 ), 
    .wrDataMask                 (ddrb_mc_wrdata_mask            ),
    .rdData                     (ddrb_mc_rddata                 ), 
    .rdDataAddr                 (ddrb_mc_rddata_addr            ), 
    .rdDataEn                   (ddrb_mc_rddata_en              ), 
    .rdDataEnd                  (ddrb_mc_rddata_end             ), 
    .per_rd_done                (ddrb_mc_per_rd_done            ), 
    .rmw_rd_done                (ddrb_mc_rmw_rd_done            ), 
    .wrDataAddr                 (ddrb_mc_wrdata_addr            ), 
    .wrDataEn                   (ddrb_mc_wrdata_en              ), 

    .mc_ACT_n                   (ddrb_mc_act_n                  ), 
    .mc_ADR                     (ddrb_mc_addr                   ), 
    .mc_BA                      (ddrb_mc_ba                     ), 
    .mc_BG                      (ddrb_mc_bg                     ), 
    .mc_CKE                     (ddrb_mc_cke                    ), 
    .mc_CS_n                    (ddrb_mc_cs_n                   ), 
    .mc_ODT                     (ddrb_mc_odt                    ),
    .mcCasSlot                  (ddrb_mc_cas_slot               ), 
    .mcCasSlot2                 (ddrb_mc_cas_slot2              ), 
    .mcRdCAS                    (ddrb_mc_rdcas                  ), 
    .mcWrCAS                    (ddrb_mc_wrcas                  ), 
    .winInjTxn                  (ddrb_mc_wininjtxn              ), 
    .winRmw                     (ddrb_mc_winrmw                 ), 
    .gt_data_ready              (ddrb_mc_gt_data_ready          ), 
    .winBuf                     (ddrb_mc_winbuf                 ), 
    .winRank                    (ddrb_mc_winrank                ), 
    .tCWL                       (ddrb_mc_tcwl                   ), 
    .dbg_bus                    (ddrb_mc_dbg_bus                )  
    );


//*****************************************************************
// ddrd ctrl
//*****************************************************************

ddrd_72b_top    u_ddrd_72b_top (
    //common
    .ddr_cal_done                   (ddrd_cal_done                  ),  
    .ddr_init_done                  (ddrd_init_done                 ),  
    .ddr_resumable_int              (                               ),  
    .ddr_unresumable_int            (                               ),  
    //user interface
    .aclk                           (clk_200m                       ),
    .areset                         (rst_ul                       ),
    .awid                           (ddrd_axi4_m2s_awid             ),    
    .awaddr                         (ddrd_axi4_m2s_awaddr           ),    
    .awlen                          (ddrd_axi4_m2s_awlen            ),    
    .awsize                         (ddrd_axi4_m2s_awsize           ),    
    .awvalid                        (ddrd_axi4_m2s_awvalid          ),    
    .awready                        (ddrd_axi4_s2m_awready          ),   
    .wid                            (ddrd_axi4_m2s_wid              ),    
    .wdata                          (ddrd_axi4_m2s_wdata            ),    
    .wstrb                          (ddrd_axi4_m2s_wstrb            ),    
    .wlast                          (ddrd_axi4_m2s_wlast            ),    
    .wvalid                         (ddrd_axi4_m2s_wvalid           ),    
    .wready                         (ddrd_axi4_s2m_wready           ),    
    .bid                            (ddrd_axi4_s2m_bid              ),    
    .bresp                          (ddrd_axi4_s2m_bresp            ),    
    .bvalid                         (ddrd_axi4_s2m_bvalid           ),    
    .bready                         (ddrd_axi4_m2s_bready           ),    
    .arid                           (ddrd_axi4_m2s_arid             ),    
    .araddr                         (ddrd_axi4_m2s_araddr           ),    
    .arlen                          (ddrd_axi4_m2s_arlen            ),    
    .arsize                         (ddrd_axi4_m2s_arsize           ),    
    .arvalid                        (ddrd_axi4_m2s_arvalid          ),    
    .arready                        (ddrd_axi4_s2m_arready          ),
    .rid                            (ddrd_axi4_s2m_rid              ),  
    .rdata                          (ddrd_axi4_s2m_rdata            ),  
    .rresp                          (ddrd_axi4_s2m_rresp            ),  
    .rlast                          (ddrd_axi4_s2m_rlast            ),  
    .rvalid                         (ddrd_axi4_s2m_rvalid           ),  
    .rready                         (ddrd_axi4_m2s_rready           ),  

    .ra_order                       (4'd0                           ),
    .rdata_ecc_err                  (                               ),    
    .rd_order                       (                               ),   
    .clk_core                       (clk_ddrd                       ),    
    .ddr_reset                      (rst_ddrd                       ),    
    //phy interface
    .mc_rddata_addr                 (ddrd_mc_rddata_addr            ),   
    .mc_wrdata_addr                 (ddrd_mc_wrdata_addr            ),   
    .mc_wrdata_en                   (ddrd_mc_wrdata_en              ),   
    .mc_per_rd_done                 (ddrd_mc_per_rd_done            ),   
    .mc_rmw_rd_done                 (ddrd_mc_rmw_rd_done            ),   
    .mc_rddata_en                   (ddrd_mc_rddata_en              ),   
    .mc_rddata_end                  (ddrd_mc_rddata_end             ),   
    .mc_rddata                      (ddrd_mc_rddata                 ),   
    .mc_gt_data_ready               (ddrd_mc_gt_data_ready          ),   
    .mc_act_n                       (ddrd_mc_act_n                  ),   
    .mc_addr                        (ddrd_mc_addr                   ),   
    .mc_ba                          (ddrd_mc_ba                     ),   
    .mc_bg                          (ddrd_mc_bg                     ),   
    .mc_cke                         (ddrd_mc_cke                    ),   
    .mc_cs_n                        (ddrd_mc_cs_n                   ),   
    .mc_odt                         (ddrd_mc_odt                    ),   
    .mc_cas_slot                    (ddrd_mc_cas_slot               ),   
    .mc_cas_slot2                   (ddrd_mc_cas_slot2              ),   
    .mc_rdcas                       (ddrd_mc_rdcas                  ),   
    .mc_wrcas                       (ddrd_mc_wrcas                  ),   
    .mc_winrank                     (ddrd_mc_winrank                ),   
    .mc_par                         (ddrd_mc_par                    ),   
    .mc_wininjtxn                   (ddrd_mc_wininjtxn              ),   
    .mc_winrmw                      (ddrd_mc_winrmw                 ),   
    .mc_winbuf                      (ddrd_mc_winbuf                 ),   
    .mc_dbuf_addr                   (ddrd_mc_dbuf_addr              ),   
    .mc_wrdata                      (ddrd_mc_wrdata                 ),   
    .mc_wrdata_mask                 (ddrd_mc_wrdata_mask            ),   
    .mc_tcwl                        (ddrd_mc_tcwl                   ),   
    .mc_dbg_bus                     (ddrd_mc_dbg_bus                ),   
    //sim model intreface
    .sim_md_en                      (1'b0                           ),   
    .sim_md_full                    (1'b0                           ),   
    .sim_md_rank                    (                               ),   
    .sim_md_slot                    (                               ),   
    .sim_md_0cmd                    (                               ),   
    .sim_md_1cmd                    (                               ),   
    .sim_md_2cmd                    (                               ),   
    .sim_md_3cmd                    (                               ),   
    .sim_md_wdata_afull             (1'b0                           ),  
    .sim_md_wen                     (                               ),  
    .sim_md_wdata                   (                               ),  
    .sim_md_rdata_vld               (1'b0                           ),  
    .sim_md_rdata                   (576'd0                         ),  
    //clear interface
    .clk_hpi                        (clk_200m                       ), 
    .hpi_reset                      (rst_ul                       ), 
    .hpi_stat_clr                   (1'b0                           ),  
    //hpi interface
    .hpi2ddr_wen                    (hpi2ddrd_wen_2dly              ),  
    .hpi2ddr_ren                    (hpi2ddrd_ren_2dly              ),  
    .hpi2ddr_addr                   (cpu_addr_2dly[13:0]            ),  
    .hpi2ddr_wdata                  (cpu_data_in_2dly               ),  
    .ddr2hpi_valid                  (ddrd2hpi_valid                 ),  
    .ddr2hpi_rdata                  (hpi_cpu_data_out_ddrd          ),  
    .spd_i2c_scl_i                  (1'b1                           ),    
    .spd_i2c_sda_i                  (1'b1                           ),   
    .spd_i2c_scl_o                  (                               ),    
    .spd_i2c_sda_o                  (                               )    
    );

assign  hpi2ddrd_wen  = cpu_wr & (cpu_addr[A_WTH+1:14] == DDRD_ID);
assign  hpi2ddrd_ren  = cpu_rd & (cpu_addr[A_WTH+1:14] == DDRD_ID);

//*****************************************************************
// ddrd phy 
//*****************************************************************
rdimmd_x8_16GB_2133Mbps   u_phy_ddrd_72b (
    //rcm
    .sys_rst                    (rst_ul                       ), 
    .c0_sys_clk_p               (ddrd_100m_ref_clk_p            ), 
    .c0_sys_clk_n               (ddrd_100m_ref_clk_n            ), 
    .c0_ddr4_ui_clk             (clk_ddrd                       ), 
    .c0_ddr4_ui_clk_sync_rst    (rst_ddrd                       ), 
    .dbg_clk                    (                               ), 
    //model
    .c0_ddr4_act_n              (ddrd_72b_act_n                 ), 
    .c0_ddr4_adr                (ddrd_72b_addr                  ), 
    .c0_ddr4_ba                 (ddrd_72b_ba                    ), 
    .c0_ddr4_bg                 (ddrd_72b_bg                    ), 
    .c0_ddr4_cke                (ddrd_72b_cke                   ), 
    .c0_ddr4_odt                (ddrd_72b_odt                   ), 
    .c0_ddr4_cs_n               (ddrd_72b_cs_n                  ), 
    .c0_ddr4_ck_t               (ddrd_72b_ck_t                  ), 
    .c0_ddr4_ck_c               (ddrd_72b_ck_c                  ), 
    .c0_ddr4_reset_n            (ddrd_72b_rst_n                 ), 
    .c0_ddr4_parity             (ddrd_72b_par                   ), 
    .c0_ddr4_dq                 (ddrd_72b_dq                    ), 
    .c0_ddr4_dqs_c              (ddrd_72b_dqs_c                 ), 
    .c0_ddr4_dqs_t              (ddrd_72b_dqs_t                 ), 
    .c0_ddr4_dm_dbi_n           (ddrd_72b_dm_dbi_n              ), 
    //common
    .c0_init_calib_complete     (ddrd_cal_done                  ), 
    //mc
    .dBufAdr                    (ddrd_mc_dbuf_addr              ), 
    .wrData                     (ddrd_mc_wrdata                 ), 
    .wrDataMask                 (ddrd_mc_wrdata_mask            ),
    .rdData                     (ddrd_mc_rddata                 ), 
    .rdDataAddr                 (ddrd_mc_rddata_addr            ), 
    .rdDataEn                   (ddrd_mc_rddata_en              ), 
    .rdDataEnd                  (ddrd_mc_rddata_end             ), 
    .per_rd_done                (ddrd_mc_per_rd_done            ), 
    .rmw_rd_done                (ddrd_mc_rmw_rd_done            ), 
    .wrDataAddr                 (ddrd_mc_wrdata_addr            ), 
    .wrDataEn                   (ddrd_mc_wrdata_en              ), 

    .mc_ACT_n                   (ddrd_mc_act_n                  ), 
    .mc_ADR                     (ddrd_mc_addr                   ), 
    .mc_BA                      (ddrd_mc_ba                     ), 
    .mc_BG                      (ddrd_mc_bg                     ), 
    .mc_CKE                     (ddrd_mc_cke                    ), 
    .mc_CS_n                    (ddrd_mc_cs_n                   ), 
    .mc_ODT                     (ddrd_mc_odt                    ),
    .mcCasSlot                  (ddrd_mc_cas_slot               ), 
    .mcCasSlot2                 (ddrd_mc_cas_slot2              ), 
    .mcRdCAS                    (ddrd_mc_rdcas                  ), 
    .mcWrCAS                    (ddrd_mc_wrcas                  ), 
    .winInjTxn                  (ddrd_mc_wininjtxn              ), 
    .winRmw                     (ddrd_mc_winrmw                 ), 
    .gt_data_ready              (ddrd_mc_gt_data_ready          ), 
    .winBuf                     (ddrd_mc_winbuf                 ), 
    .winRank                    (ddrd_mc_winrank                ), 
    .tCWL                       (ddrd_mc_tcwl                   ), 
    .dbg_bus                    (ddrd_mc_dbg_bus                )  
    );

always @ (posedge clk_200m or posedge rst_200m)
begin
    if(rst_200m == 1'b1) begin
        rst_ul_pre <= 1'b1;
        rst_ul     <= 1'b1;
    end
    else begin
        rst_ul_pre <= 1'b0;
        rst_ul     <= rst_ul_pre;
    end
end


always @ (posedge clk_200m or posedge rst_ul)
begin
    if(rst_ul == 1'b1) begin
        hpi2ddra_wen_1dly <=1'b0;
        hpi2ddra_wen_2dly <=1'b0;
        hpi2ddra_ren_1dly <=1'b0;
        hpi2ddra_ren_2dly <=1'b0;
    end 
    else begin
        hpi2ddra_wen_1dly <= hpi2ddra_wen;
        hpi2ddra_wen_2dly <= hpi2ddra_wen_1dly;
        hpi2ddra_ren_1dly <= hpi2ddra_ren;
        hpi2ddra_ren_2dly <= hpi2ddra_ren_1dly;
    end
end
    
always @ (posedge clk_200m or posedge rst_ul)
begin
    if(rst_ul == 1'b1) begin
        hpi2ddrb_wen_1dly <={1'b0};
        hpi2ddrb_wen_2dly <={1'b0};
        hpi2ddrb_ren_1dly <={1'b0};
        hpi2ddrb_ren_2dly <={1'b0};
    end 
    else begin
        hpi2ddrb_wen_1dly <= hpi2ddrb_wen;
        hpi2ddrb_wen_2dly <= hpi2ddrb_wen_1dly;
        hpi2ddrb_ren_1dly <= hpi2ddrb_ren;
        hpi2ddrb_ren_2dly <= hpi2ddrb_ren_1dly;
    end
end

always @ (posedge clk_200m or posedge rst_ul)
begin
    if(rst_ul == 1'b1) begin
        hpi2ddrd_wen_1dly <={1'b0};
        hpi2ddrd_wen_2dly <={1'b0};
        hpi2ddrd_ren_1dly <={1'b0};
        hpi2ddrd_ren_2dly <={1'b0};
    end 
    else begin
        hpi2ddrd_wen_1dly <= hpi2ddrd_wen;
        hpi2ddrd_wen_2dly <= hpi2ddrd_wen_1dly;
        hpi2ddrd_ren_1dly <= hpi2ddrd_ren;
        hpi2ddrd_ren_2dly <= hpi2ddrd_ren_1dly;
    end
end

always @ (posedge clk_200m or posedge rst_ul)
begin
    if(rst_ul == 1'b1) begin
        cpu_data_in_1dly <=  {DATA_WIDTH{1'b0}};
        cpu_data_in_2dly <=  {DATA_WIDTH{1'b0}};
    end 
    else begin
        cpu_data_in_1dly <=  cpu_data_in;
        cpu_data_in_2dly <=  cpu_data_in_1dly;
    end
end    

always @ (posedge clk_200m or posedge rst_ul)
begin
    if(rst_ul == 1'b1) begin
        cpu_addr_1dly <=  {ADDR_WIDTH{1'b0}};
        cpu_addr_2dly <=  {ADDR_WIDTH{1'b0}};
    end 
    else begin
        cpu_addr_1dly <=  cpu_addr;
        cpu_addr_2dly <=  cpu_addr_1dly;
    end
end

always @ (posedge clk_200m or posedge rst_ul)
begin
    if(rst_ul == 1'b1) begin
        cpu_data_out_bar1 <=  {DATA_WIDTH{1'b0}};
    end
    else begin
        casez (cpu_addr_2dly[A_WTH+1:14])
               REG_MMU_TX_ID,REG_MMU_RX_ID:  cpu_data_out_bar1 <= cpu_data_out_mmu;
               REG_MMU_CONNECT_ID:  cpu_data_out_bar1 <= cpu_data_out_connect;
//               DDRA_AXI4_ID :  cpu_data_out_bar1 <= cpu_data_out_ddra_axi; 
//               DDRB_AXI4_ID :  cpu_data_out_bar1 <= cpu_data_out_ddrb_axi;  
//               DDRC_AXI4_ID :  cpu_data_out_bar1 <= cpu_data_out_ddrc_axi;  
//               DDRD_AXI4_ID :  cpu_data_out_bar1 <= cpu_data_out_ddrd_axi;  
               DDRA_ID      :  cpu_data_out_bar1 <= hpi_cpu_data_out_ddra;  
               DDRB_ID      :  cpu_data_out_bar1 <= hpi_cpu_data_out_ddrb;  
               DDRD_ID      :  cpu_data_out_bar1 <= hpi_cpu_data_out_ddrd;  
               default      :  cpu_data_out_bar1 <= cpu_data_out_adder;  
        endcase
    end
end

//-----------------------------------------------
// ILA
//-----------------------------------------------
ila_0 u_ul_ila_0 (
    .clk                  ( clk_200m            ),
    .probe0               ( cpu_wr              ),
    .probe1               ( cpu_data_in[0]      ),
    .probe2               ( 1'b0                ),
    .probe3               ( 1'b0                ),
    .probe4               ( cpu_data_out_bar1[0]),
    .probe5               ( cpu_rd              )
);

//-----------------------------------------------
// bridge for XVC.
//-----------------------------------------------
debug_bridge_0 u_debug_bridge_0(
    .clk                  (clk_200m) ,
    .S_BSCAN_bscanid_en   (S_BSCAN_bscanid_en  ) ,
    .S_BSCAN_capture      (S_BSCAN_capture     ) , 
    .S_BSCAN_drck         (S_BSCAN_drck        ) ,
    .S_BSCAN_reset        (S_BSCAN_reset       ) ,
    .S_BSCAN_runtest      (S_BSCAN_runtest     ) ,
    .S_BSCAN_sel          (S_BSCAN_sel         ) ,
    .S_BSCAN_shift        (S_BSCAN_shift       ) ,
    .S_BSCAN_tck          (S_BSCAN_tck         ) ,
    .S_BSCAN_tdi          (S_BSCAN_tdi         ) ,
    .S_BSCAN_tdo          (S_BSCAN_tdo         ) ,
    .S_BSCAN_tms          (S_BSCAN_tms         ) ,
    .S_BSCAN_update       (S_BSCAN_update      ) 
);

endmodule
