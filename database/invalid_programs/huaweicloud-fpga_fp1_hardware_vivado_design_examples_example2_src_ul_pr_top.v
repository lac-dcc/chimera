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


wire    [3:0]                       ddra_awid                   ; 
wire    [63:0]                      ddra_awaddr                 ;
wire    [7:0]                       ddra_awlen                  ;
wire    [2:0]                       ddra_awsize                 ;
wire                                ddra_awvalid                ;
wire                                ddra_awready                ;

wire    [3:0]                       ddra_wid                    ;
wire    [511:0]                     ddra_wdata                  ;
wire    [63:0]                      ddra_wstrb                  ;
wire                                ddra_wlast                  ;
wire                                ddra_wvalid                 ;
wire                                ddra_wready                 ;

wire    [3:0]                       ddra_bid                    ;
wire    [1:0]                       ddra_bresp                  ;
wire                                ddra_bvalid                 ;
wire                                ddra_bready                 ;

wire    [3:0]                       ddra_arid                   ; 
wire    [63:0]                      ddra_araddr                 ;
wire    [7:0]                       ddra_arlen                  ;
wire    [2:0]                       ddra_arsize                 ;
wire                                ddra_arvalid                ;
wire                                ddra_arready                ;
wire    [3:0]                       ddra_rid                    ;
wire    [511:0]                     ddra_rdata                  ;
wire    [1:0]                       ddra_rresp                  ;
wire                                ddra_rlast                  ;
wire                                ddra_rvalid                 ;
wire                                ddra_rready                 ;

wire    [3:0]                       ddrb_awid                   ; 
wire    [63:0]                      ddrb_awaddr                 ;
wire    [7:0]                       ddrb_awlen                  ;
wire    [2:0]                       ddrb_awsize                 ;
wire                                ddrb_awvalid                ;
wire                                ddrb_awready                ;

wire    [3:0]                       ddrb_wid                    ;
wire    [511:0]                     ddrb_wdata                  ;
wire    [63:0]                      ddrb_wstrb                  ;
wire                                ddrb_wlast                  ;
wire                                ddrb_wvalid                 ;
wire                                ddrb_wready                 ;

wire    [3:0]                       ddrb_bid                    ;
wire    [1:0]                       ddrb_bresp                  ;
wire                                ddrb_bvalid                 ;
wire                                ddrb_bready                 ;

wire    [3:0]                       ddrb_arid                   ; 
wire    [63:0]                      ddrb_araddr                 ;
wire    [7:0]                       ddrb_arlen                  ;
wire    [2:0]                       ddrb_arsize                 ;
wire                                ddrb_arvalid                ;
wire                                ddrb_arready                ;
wire    [3:0]                       ddrb_rid                    ;
wire    [511:0]                     ddrb_rdata                  ;
wire    [1:0]                       ddrb_rresp                  ;
wire                                ddrb_rlast                  ;
wire                                ddrb_rvalid                 ;
wire                                ddrb_rready                 ;

wire    [3:0]                       ddrd_awid                   ; 
wire    [63:0]                      ddrd_awaddr                 ;
wire    [7:0]                       ddrd_awlen                  ;
wire    [2:0]                       ddrd_awsize                 ;
wire                                ddrd_awvalid                ;
wire                                ddrd_awready                ;

wire    [3:0]                       ddrd_wid                    ;
wire    [511:0]                     ddrd_wdata                  ;
wire    [63:0]                      ddrd_wstrb                  ;
wire                                ddrd_wlast                  ;
wire                                ddrd_wvalid                 ;
wire                                ddrd_wready                 ;

wire    [3:0]                       ddrd_bid                    ;
wire    [1:0]                       ddrd_bresp                  ;
wire                                ddrd_bvalid                 ;
wire                                ddrd_bready                 ;

wire    [3:0]                       ddrd_arid                   ; 
wire    [63:0]                      ddrd_araddr                 ;
wire    [7:0]                       ddrd_arlen                  ;
wire    [2:0]                       ddrd_arsize                 ;
wire                                ddrd_arvalid                ;
wire                                ddrd_arready                ;
wire    [3:0]                       ddrd_rid                    ;
wire    [511:0]                     ddrd_rdata                  ;
wire    [1:0]                       ddrd_rresp                  ;
wire                                ddrd_rlast                  ;
wire                                ddrd_rvalid                 ;
wire                                ddrd_rready                 ;

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
    .areset          ( rst_200m             ),   
                           
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

hpi2axi4m_adp
  #(
     .A_WTH          (A_WTH                 ), 
     .DATA_WIDTH     (DATA_WIDTH            ), 
     .AXI4_ID        (DDRC_AXI4_ID          ) 
    )
u0_hpi2axi4m_adp
   (
  .aclk              (clk_200m              ),
  .areset            (rst_200m              ),
  .awid              (ul2sh_ddr_awid        ),  
  .awaddr            (ul2sh_ddr_awaddr      ),
  .awlen             (ul2sh_ddr_awlen       ),
  .awsize            (ul2sh_ddr_awsize      ),
  .awvalid           (ul2sh_ddr_awvalid     ),
  .awready           (sh2ul_ddr_awready     ),
  .wid               (ul2sh_ddr_wid         ),
  .wdata             (ul2sh_ddr_wdata       ),
  .wstrb             (ul2sh_ddr_wstrb       ),
  .wlast             (ul2sh_ddr_wlast       ),
  .wvalid            (ul2sh_ddr_wvalid      ),
  .wready            (sh2ul_ddr_wready      ),
  .bid               (sh2ul_ddr_bid         ),
  .bresp             (sh2ul_ddr_bresp       ),
  .bvalid            (sh2ul_ddr_bvalid      ),
  .bready            (ul2sh_ddr_bready      ),
  .arid              (ul2sh_ddr_arid        ),  
  .araddr            (ul2sh_ddr_araddr      ),
  .arlen             (ul2sh_ddr_arlen       ),
  .arsize            (ul2sh_ddr_arsize      ),
  .arvalid           (ul2sh_ddr_arvalid     ),
  .arready           (sh2ul_ddr_arready     ),
  .rid               (sh2ul_ddr_rid         ),
  .rdata             (sh2ul_ddr_rdata       ),
  .rresp             (sh2ul_ddr_rresp       ),
  .rlast             (sh2ul_ddr_rlast       ),
  .rvalid            (sh2ul_ddr_rvalid      ),
  .rready            (ul2sh_ddr_rready      ),
  .cpu_wr            (cpu_wr                ),
  .cpu_addr          (cpu_addr[A_WTH+1:2]   ),
  .cpu_wr_strb       (4'hf                  ),
  .cpu_data_in       (cpu_data_in           ),
  .cpu_rd            (cpu_rd                ),
  .cpu_rd_addr       (cpu_addr[A_WTH+1:2]   ),
  .cpu_data_out      (cpu_data_out_ddrc_axi )
   );

hpi2axi4m_adp
  #(
     .A_WTH          (A_WTH                 ), 
     .DATA_WIDTH     (DATA_WIDTH            ), 
     .AXI4_ID        (DDRA_AXI4_ID          ) 
    )
u1_hpi2axi4m_adp
   (
  .aclk              (clk_200m              ),
  .areset            (rst_200m              ),
  .awid              (ddra_awid             ),  
  .awaddr            (ddra_awaddr           ),
  .awlen             (ddra_awlen            ),
  .awsize            (ddra_awsize           ),
  .awvalid           (ddra_awvalid          ),
  .awready           (ddra_awready          ),
  .wid               (ddra_wid              ),
  .wdata             (ddra_wdata            ),
  .wstrb             (ddra_wstrb            ),
  .wlast             (ddra_wlast            ),
  .wvalid            (ddra_wvalid           ),
  .wready            (ddra_wready           ),
  .bid               (ddra_bid              ),
  .bresp             (ddra_bresp            ),
  .bvalid            (ddra_bvalid           ),
  .bready            (ddra_bready           ),
  .arid              (ddra_arid             ),  
  .araddr            (ddra_araddr           ),
  .arlen             (ddra_arlen            ),
  .arsize            (ddra_arsize           ),
  .arvalid           (ddra_arvalid          ),
  .arready           (ddra_arready          ),
  .rid               (ddra_rid              ),
  .rdata             (ddra_rdata            ),
  .rresp             (ddra_rresp            ),
  .rlast             (ddra_rlast            ),
  .rvalid            (ddra_rvalid           ),
  .rready            (ddra_rready           ),
  .cpu_wr            (cpu_wr                ),
  .cpu_addr          (cpu_addr[A_WTH+1:2]   ),
  .cpu_wr_strb       (4'hf                  ),
  .cpu_data_in       (cpu_data_in           ),
  .cpu_rd            (cpu_rd                ),
  .cpu_rd_addr       (cpu_addr[A_WTH+1:2]   ),
  .cpu_data_out      (cpu_data_out_ddra_axi )
   );
hpi2axi4m_adp
  #(
     .A_WTH          (A_WTH                 ), 
     .DATA_WIDTH     (DATA_WIDTH            ), 
     .AXI4_ID        (DDRB_AXI4_ID          ) 
    )
u2_hpi2axi4m_adp
   (
  .aclk              (clk_200m              ),
  .areset            (rst_200m              ),
  .awid              (ddrb_awid             ),  
  .awaddr            (ddrb_awaddr           ),
  .awlen             (ddrb_awlen            ),
  .awsize            (ddrb_awsize           ),
  .awvalid           (ddrb_awvalid          ),
  .awready           (ddrb_awready          ),
  .wid               (ddrb_wid              ),
  .wdata             (ddrb_wdata            ),
  .wstrb             (ddrb_wstrb            ),
  .wlast             (ddrb_wlast            ),
  .wvalid            (ddrb_wvalid           ),
  .wready            (ddrb_wready           ),
  .bid               (ddrb_bid              ),
  .bresp             (ddrb_bresp            ),
  .bvalid            (ddrb_bvalid           ),
  .bready            (ddrb_bready           ),
  .arid              (ddrb_arid             ),  
  .araddr            (ddrb_araddr           ),
  .arlen             (ddrb_arlen            ),
  .arsize            (ddrb_arsize           ),
  .arvalid           (ddrb_arvalid          ),
  .arready           (ddrb_arready          ),
  .rid               (ddrb_rid              ),
  .rdata             (ddrb_rdata            ),
  .rresp             (ddrb_rresp            ),
  .rlast             (ddrb_rlast            ),
  .rvalid            (ddrb_rvalid           ),
  .rready            (ddrb_rready           ),
  .cpu_wr            (cpu_wr                ),
  .cpu_addr          (cpu_addr[A_WTH+1:2]   ),
  .cpu_wr_strb       (4'hf                  ),
  .cpu_data_in       (cpu_data_in           ),
  .cpu_rd            (cpu_rd                ),
  .cpu_rd_addr       (cpu_addr[A_WTH+1:2]   ),
  .cpu_data_out      (cpu_data_out_ddrb_axi )
   );
hpi2axi4m_adp
  #(
     .A_WTH          (A_WTH                 ), 
     .DATA_WIDTH     (DATA_WIDTH            ), 
     .AXI4_ID        (DDRD_AXI4_ID          ) 
    )
u3_hpi2axi4m_adp
   (
  .aclk              (clk_200m              ),
  .areset            (rst_200m              ), 
  .awid              (ddrd_awid             ),  
  .awaddr            (ddrd_awaddr           ),
  .awlen             (ddrd_awlen            ),
  .awsize            (ddrd_awsize           ),
  .awvalid           (ddrd_awvalid          ),
  .awready           (ddrd_awready          ),
  .wid               (ddrd_wid              ),
  .wdata             (ddrd_wdata            ),
  .wstrb             (ddrd_wstrb            ),
  .wlast             (ddrd_wlast            ),
  .wvalid            (ddrd_wvalid           ),
  .wready            (ddrd_wready           ),
  .bid               (ddrd_bid              ),
  .bresp             (ddrd_bresp            ),
  .bvalid            (ddrd_bvalid           ),
  .bready            (ddrd_bready           ),
  .arid              (ddrd_arid             ),  
  .araddr            (ddrd_araddr           ),
  .arlen             (ddrd_arlen            ),
  .arsize            (ddrd_arsize           ),
  .arvalid           (ddrd_arvalid          ),
  .arready           (ddrd_arready          ),
  .rid               (ddrd_rid              ),
  .rdata             (ddrd_rdata            ),
  .rresp             (ddrd_rresp            ),
  .rlast             (ddrd_rlast            ),
  .rvalid            (ddrd_rvalid           ),
  .rready            (ddrd_rready           ),
  .cpu_wr            (cpu_wr                ),
  .cpu_addr          (cpu_addr[A_WTH+1:2]   ),
  .cpu_wr_strb       (4'hf                  ),
  .cpu_data_in       (cpu_data_in           ),
  .cpu_rd            (cpu_rd                ),
  .cpu_rd_addr       (cpu_addr[A_WTH+1:2]   ),
  .cpu_data_out      (cpu_data_out_ddrd_axi )
   );

reg_ul_access
    #(	
     .CPU_ADDR_WIDTH  (12                    ),
     .CPU_DATA_WIDTH  (DATA_WIDTH            )	
	)
u_reg_ul_access	
    (
     .clks           (clk_200m               ),  
     .reset          (rst_200m               ),
     .ul2sh_vled     (ul2sh_vled             ),
     .reg_tmout_us_cfg(reg_tmout_us_cfg      ),
     .reg_tmout_us_err(reg_tmout_us_err      ),
     .cpu_wr         (cpu_wr                 ),
     .cpu_wr_addr    (cpu_addr[13:2]         ),
     .cpu_data_in    (cpu_data_in            ),
     .cpu_rd         (cpu_rd                 ),
     .cpu_data_out   (cpu_data_out_adder     )
	                 
   );   


loop_top  #(
    .A_WTH                  ( A_WTH                 ),
    .D_WTH                  ( DATA_WIDTH            ),
    .LOOP_IP_CM_ID          ( SA_ID                 )
    ) u_sa_top (
    //global single
    .clk_sys                ( clk_200m              ),
    .rst                    ( rst_200m              ),
    
     //interface with sawrp_top
    .stxqm2inq_fifo_rd      ( stxqm2inq_fifo_rd     ),
    .stxqm2inq_fifo_rdata   ( stxqm2inq_fifo_rdata  ),
    .inq2stxqm_fifo_emp     ( inq2stxqm_fifo_emp    ),
                                                    
    .stxm2ppm_rxffc_ff      ( stxm2ppm_rxffc_ff     ),
    .ppm2stxm_rxffc_wr      ( ppm2stxm_rxffc_wr     ),
    .ppm2stxm_rxffc_wdata   ( ppm2stxm_rxffc_wdata  ),
                                                    
    .stxm2ppm_txffd_rd      ( stxm2ppm_txffd_rd     ),
    .stxm2ppm_txffd_rdata   ( stxm2ppm_txffd_rdata  ),
    .ppm2stxm_txffd_emp     ( ppm2stxm_txffd_emp    ),
                                                    
                                                    
    .rxm2sch_pd_ff          ( rxm2sch_pd_ff         ),
    .sch2rxm_pd_wr          ( sch2rxm_pd_wr         ),
    .sch2rxm_pd_wdata       ( sch2rxm_pd_wdata      ),
    
    //interface with cpu
    .cnt_reg_clr            ( 1'd0                  ),
    .cpu_addr               ( cpu_addr[A_WTH+1:2]   ),
    .cpu_data_in            ( cpu_data_in           ),
    .cpu_data_out_pf        ( cpu_data_out_sa       ),
    .cpu_rd                 ( cpu_rd                ),
    .cpu_wr                 ( cpu_wr                ) 
);

raxi_rq256_fifo  u_ppm_rd
   (
    .pcie_clk               (clk_200m               ),
    .pcie_rst               (rst_200m               ),
    .pcie_link_up           (1'd1                   ),
    .user_clk               (clk_200m               ),
    .user_rst               (rst_200m               ),

    .s_axis_rq_tlast        (ul2sh_dmas2_tlast      ),
    .s_axis_rq_tdata        (ul2sh_dmas2_tdata      ),
    .s_axis_rq_tuser        (                       ),
    .s_axis_rq_tkeep        (ul2sh_dmas2_tkeep      ),
    .s_axis_rq_tready       (sh2ul_dmas2_tready     ),
    .s_axis_rq_tvalid       (ul2sh_dmas2_tvalid     ),

    .reg_tmout_us_cfg       (reg_tmout_us_cfg       ),
    .reg_tmout_us_err       (reg_tmout_us_err[0]    ),

    .rq_tx_wr               (ppm2stxm_rxffc_wr      ),
    .rq_tx_wdata            (ppm2stxm_rxffc_wdata   ),
    .rq_tx_ff               (stxm2ppm_rxffc_ff      ),
    
    .rq_wr_data_cnt         (                       ),
    .rq_rd_data_cnt         (                       ),
    .fifo_status            (                       ),
    .fifo_err               (                       ),
    .rq_tx_cnt              (                       )
    );

raxi_rq512_fifo u_parse_rslt
   (
    .pcie_clk               (clk_200m               ),
    .pcie_rst               (rst_200m               ),
    .pcie_link_up           (1'd1                   ),
    .user_clk               (clk_200m               ),
    .user_rst               (rst_200m               ),

    .s_axis_rq_tlast        (ul2sh_dmas3_tlast      ),
    .s_axis_rq_tdata        (ul2sh_dmas3_tdata      ),
    .s_axis_rq_tuser        (                       ),
    .s_axis_rq_tkeep        (ul2sh_dmas3_tkeep      ),
    .s_axis_rq_tready       (sh2ul_dmas3_tready     ),
    .s_axis_rq_tvalid       (ul2sh_dmas3_tvalid     ),

    .reg_tmout_us_cfg       (reg_tmout_us_cfg       ),
    .reg_tmout_us_err       (reg_tmout_us_err[1]    ),

    .rq_tx_wr               (sch2rxm_pd_wr          ),
    .rq_tx_wdata            (sch2rxm_pd_wdata       ),
    .rq_tx_ff               (rxm2sch_pd_ff          ),
    
    .rq_wr_data_cnt         (                       ),
    .rq_rd_data_cnt         (                       ),
    .fifo_status            (                       ),
    .fifo_err               (                       ),
    .rq_tx_cnt              (                       )
    );

raxi_rc256_fifo sw2inq_bd
    (
    .pcie_clk               (clk_200m               ),
    .pcie_rst               (rst_200m               ),
    .pcie_link_up           (1'd1                   ),
    .user_clk               (clk_200m               ),
    .user_rst               (rst_200m               ),
    
    .m_axis_rc_tdata        (sh2ul_dmam0_tdata      ),
    .m_axis_rc_tuser        (75'd0                  ),
    .m_axis_rc_tlast        (sh2ul_dmam0_tlast      ),
    .m_axis_rc_tkeep        (sh2ul_dmam0_tkeep      ),
    .m_axis_rc_tvalid       (sh2ul_dmam0_tvalid     ),
    .m_axis_rc_tready       (ul2sh_dmam0_tready     ),


    .rc_rx_ef               (inq2stxqm_fifo_emp     ),
    .rc_rx_rd               (stxqm2inq_fifo_rd      ),
    .rc_rx_rdata            (stxqm2inq_fifo_rdata   ),
    
    .rc_wr_data_cnt         (                       ),
    .rc_rd_data_cnt         (                       ),
    .fifo_status            (                       ),
    .fifo_err               (                       ),
    .rc_rx_cnt              (                       ),
    .rc_rx_drop_cnt         (                       )
    );


raxi_rc512_fifo sw2ppm_pkt
    (
    .pcie_clk                 (clk_200m              ),
    .pcie_rst                 (rst_200m              ),
    .pcie_link_up             (1'd1                  ),
    .user_clk                 (clk_200m              ),
    .user_rst                 (rst_200m              ),
    
    .m_axis_rc_tdata          (sh2ul_dmam1_tdata     ),
    .m_axis_rc_tuser          (75'd0                 ),
    .m_axis_rc_tlast          (sh2ul_dmam1_tlast     ),
    .m_axis_rc_tkeep          (sh2ul_dmam1_tkeep     ),
    .m_axis_rc_tvalid         (sh2ul_dmam1_tvalid    ),
    .m_axis_rc_tready         (ul2sh_dmam1_tready    ),

    .rc_rx_ef                 (ppm2stxm_txffd_emp    ),
    .rc_rx_rd                 (stxm2ppm_txffd_rd     ),
    .rc_rx_rdata              (stxm2ppm_txffd_rdata  ),
    
    .rc_wr_data_cnt           (                      ),
    .rc_rd_data_cnt           (                      ),
    .fifo_status              (                      ),
    .fifo_err                 (                      ),
    .rc_rx_cnt                (                      ),
    .rc_rx_drop_cnt           (                      )
    );

//**********************************************************************
// ddra_ctrl
//**********************************************************************
ddra_72b_top    u_ddra_72b_top (
    .ddr_cal_done                   (ddra_cal_done                  ),   
    .ddr_init_done                  (ddra_init_done                 ),   
    .ddr_resumable_int              (                               ),   
    .ddr_unresumable_int            (                               ),   
    .aclk                           (clk_200m                       ),
    .areset                         (rst_200m                       ),
        
    .awid                           (ddra_awid                      ),    
    .awaddr                         (ddra_awaddr                    ),    
    .awlen                          (ddra_awlen                     ),    
    .awsize                         (ddra_awsize                    ),    
    .awvalid                        (ddra_awvalid                   ),    
    .awready                        (ddra_awready                   ),   
    .wid                            (ddra_wid                       ),    
    .wdata                          (ddra_wdata                     ),    
    .wstrb                          (ddra_wstrb                     ),    
    .wlast                          (ddra_wlast                     ),    
    .wvalid                         (ddra_wvalid                    ),    
    .wready                         (ddra_wready                    ),    
    .bid                            (ddra_bid                       ),    
    .bresp                          (ddra_bresp                     ),    
    .bvalid                         (ddra_bvalid                    ),    
    .bready                         (ddra_bready                    ),    
    .arid                           (ddra_arid                      ),    
    .araddr                         (ddra_araddr                    ),    
    .arlen                          (ddra_arlen                     ),    
    .arsize                         (ddra_arsize                    ),    
    .arvalid                        (ddra_arvalid                   ),    
    .arready                        (ddra_arready                   ),
    .rid                            (ddra_rid                       ),  
    .rdata                          (ddra_rdata                     ),  
    .rresp                          (ddra_rresp                     ),  
    .rlast                          (ddra_rlast                     ),  
    .rvalid                         (ddra_rvalid                    ),  
    .rready                         (ddra_rready                    ),  

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
    .hpi_reset                      (rst_200m                       ), 
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
    .sys_rst                    (rst_200m                       ), 
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
    //user interface
    .aclk                           (clk_200m                       ),
    .areset                         (rst_200m                       ),
    .awid                           (ddrb_awid                      ),    
    .awaddr                         (ddrb_awaddr                    ),    
    .awlen                          (ddrb_awlen                     ),    
    .awsize                         (ddrb_awsize                    ),    
    .awvalid                        (ddrb_awvalid                   ),    
    .awready                        (ddrb_awready                   ),   
    .wid                            (ddrb_wid                       ),    
    .wdata                          (ddrb_wdata                     ),    
    .wstrb                          (ddrb_wstrb                     ),    
    .wlast                          (ddrb_wlast                     ),    
    .wvalid                         (ddrb_wvalid                    ),    
    .wready                         (ddrb_wready                    ),    
    .bid                            (ddrb_bid                       ),    
    .bresp                          (ddrb_bresp                     ),    
    .bvalid                         (ddrb_bvalid                    ),    
    .bready                         (ddrb_bready                    ),    
    .arid                           (ddrb_arid                      ),    
    .araddr                         (ddrb_araddr                    ),    
    .arlen                          (ddrb_arlen                     ),    
    .arsize                         (ddrb_arsize                    ),    
    .arvalid                        (ddrb_arvalid                   ),    
    .arready                        (ddrb_arready                   ),
    .rid                            (ddrb_rid                       ),  
    .rdata                          (ddrb_rdata                     ),  
    .rresp                          (ddrb_rresp                     ),  
    .rlast                          (ddrb_rlast                     ),  
    .rvalid                         (ddrb_rvalid                    ),  
    .rready                         (ddrb_rready                    ),  

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
    .hpi_reset                      (rst_200m                       ), 
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
    .sys_rst                    (rst_200m                       ),
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
    .areset                         (rst_200m                       ),
    .awid                           (ddrd_awid                      ),    
    .awaddr                         (ddrd_awaddr                    ),    
    .awlen                          (ddrd_awlen                     ),    
    .awsize                         (ddrd_awsize                    ),    
    .awvalid                        (ddrd_awvalid                   ),    
    .awready                        (ddrd_awready                   ),   
    .wid                            (ddrd_wid                       ),    
    .wdata                          (ddrd_wdata                     ),    
    .wstrb                          (ddrd_wstrb                     ),    
    .wlast                          (ddrd_wlast                     ),    
    .wvalid                         (ddrd_wvalid                    ),    
    .wready                         (ddrd_wready                    ),    
    .bid                            (ddrd_bid                       ),    
    .bresp                          (ddrd_bresp                     ),    
    .bvalid                         (ddrd_bvalid                    ),    
    .bready                         (ddrd_bready                    ),    
    .arid                           (ddrd_arid                      ),    
    .araddr                         (ddrd_araddr                    ),    
    .arlen                          (ddrd_arlen                     ),    
    .arsize                         (ddrd_arsize                    ),    
    .arvalid                        (ddrd_arvalid                   ),    
    .arready                        (ddrd_arready                   ),
    .rid                            (ddrd_rid                       ),  
    .rdata                          (ddrd_rdata                     ),  
    .rresp                          (ddrd_rresp                     ),  
    .rlast                          (ddrd_rlast                     ),  
    .rvalid                         (ddrd_rvalid                    ),  
    .rready                         (ddrd_rready                    ),  

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
    .hpi_reset                      (rst_200m                       ), 
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
    .sys_rst                    (rst_200m                       ), 
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
    
always @ (posedge clk_200m or posedge rst_200m)
begin
    if(rst_200m == 1'b1) begin
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

always @ (posedge clk_200m or posedge rst_200m)
begin
    if(rst_200m == 1'b1) begin
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

always @ (posedge clk_200m or posedge rst_200m)
begin
    if(rst_200m == 1'b1) begin
        cpu_data_in_1dly <=  {DATA_WIDTH{1'b0}};
        cpu_data_in_2dly <=  {DATA_WIDTH{1'b0}};
    end 
    else begin
        cpu_data_in_1dly <=  cpu_data_in;
        cpu_data_in_2dly <=  cpu_data_in_1dly;
    end
end    

always @ (posedge clk_200m or posedge rst_200m)
begin
    if(rst_200m == 1'b1) begin
        cpu_addr_1dly <=  {ADDR_WIDTH{1'b0}};
        cpu_addr_2dly <=  {ADDR_WIDTH{1'b0}};
    end 
    else begin
        cpu_addr_1dly <=  cpu_addr;
        cpu_addr_2dly <=  cpu_addr_1dly;
    end
end

always @ (posedge clk_200m or posedge rst_200m)
begin
    if(rst_200m == 1'b1) begin
        cpu_data_out_bar1 <=  {DATA_WIDTH{1'b0}};
    end
    else begin
        casez (cpu_addr_2dly[A_WTH+1:14])
               SA_ID        :  cpu_data_out_bar1 <= cpu_data_out_sa;  
               DDRA_AXI4_ID :  cpu_data_out_bar1 <= cpu_data_out_ddra_axi; 
               DDRB_AXI4_ID :  cpu_data_out_bar1 <= cpu_data_out_ddrb_axi;  
               DDRC_AXI4_ID :  cpu_data_out_bar1 <= cpu_data_out_ddrc_axi;  
               DDRD_AXI4_ID :  cpu_data_out_bar1 <= cpu_data_out_ddrd_axi;  
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
