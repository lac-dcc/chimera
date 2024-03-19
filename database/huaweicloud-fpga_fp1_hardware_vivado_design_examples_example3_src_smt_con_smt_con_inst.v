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

module smt_con_inst#
    (
    parameter     A_WTH                      = 24    ,
    parameter     D_WTH                      = 32    ,
    parameter     REG_MMU_CONNECT_ID         = 12'd8 ,
    parameter     MAX_DDR_NUM                = 4     ,
    parameter     DDR_NUM                    = 4
    )
    (
     input                                   clk_sys                            ,
     input                                   rst                                , 
    
     //mmu axi4 write addr 	                                           
     input        [4*DDR_NUM-1:0]            mmu_m2s_awid                       ,  
     input        [64*DDR_NUM-1:0]           mmu_m2s_awaddr                     ,
     input        [8*DDR_NUM-1:0]            mmu_m2s_awlen                      ,
     input        [3*DDR_NUM-1:0]            mmu_m2s_awsize                     ,
     input        [1*DDR_NUM-1:0]            mmu_m2s_awvalid                    ,
     output       [1*DDR_NUM-1:0]            mmu_s2m_awready                    ,

     //mmu axi4 write data 	                                          
     input        [4*DDR_NUM-1:0]            mmu_m2s_wid                        ,
     input        [512*DDR_NUM-1:0]          mmu_m2s_wdata                      ,
     input        [64*DDR_NUM-1:0]           mmu_m2s_wstrb                      ,
     input        [1*DDR_NUM-1:0]            mmu_m2s_wlast                      ,
     input        [1*DDR_NUM-1:0]            mmu_m2s_wvalid                     ,
     output       [1*DDR_NUM-1:0]            mmu_s2m_wready                     ,               
    
     //mmu axi4 write rsp
     output       [4*DDR_NUM-1:0]            mmu_s2m_bid                        ,
     output       [2*DDR_NUM-1:0]            mmu_s2m_bresp                      ,
     output       [1*DDR_NUM-1:0]            mmu_s2m_bvalid                     ,
     input        [1*DDR_NUM-1:0]            mmu_m2s_bready                     ,

     //mmu axi4 read addr 	                                           
     input        [4*DDR_NUM-1:0]            mmu_m2s_arid                       ,  
     input        [64*DDR_NUM-1:0]           mmu_m2s_araddr                     ,
     input        [8*DDR_NUM-1:0]            mmu_m2s_arlen                      ,
     input        [3*DDR_NUM-1:0]            mmu_m2s_arsize                     ,
     input        [DDR_NUM-1:0]              mmu_m2s_arvalid                    ,
     output       [DDR_NUM-1:0]              mmu_s2m_arready                    ,

     //mmu axi4 read data 	                                                
     output       [4*DDR_NUM-1:0]            mmu_s2m_rid                        ,
     output       [512*DDR_NUM-1:0]          mmu_s2m_rdata                      ,
     output       [2*DDR_NUM-1:0]            mmu_s2m_rresp                      ,
     output       [DDR_NUM-1:0]              mmu_s2m_rlast                      ,
     output       [DDR_NUM-1:0]              mmu_s2m_rvalid                     ,
     input        [DDR_NUM-1:0]              mmu_m2s_rready                     ,  

     //knl axi4 write addr 	                                          
     input        [4*DDR_NUM-1:0]            knl_m2s_awid                       ,  
     input        [64*DDR_NUM-1:0]           knl_m2s_awaddr                     ,
     input        [8*DDR_NUM-1:0]            knl_m2s_awlen                      ,
     input        [3*DDR_NUM-1:0]            knl_m2s_awsize                     ,
     input        [1*DDR_NUM-1:0]            knl_m2s_awvalid                    ,
     output       [1*DDR_NUM-1:0]            knl_s2m_awready                    ,

     //knl axi4 write data 	                                       
     input        [4*DDR_NUM-1:0]            knl_m2s_wid                        ,
     input        [512*DDR_NUM-1:0]          knl_m2s_wdata                      ,
     input        [64*DDR_NUM-1:0]           knl_m2s_wstrb                      ,
     input        [1*DDR_NUM-1:0]            knl_m2s_wlast                      ,
     input        [1*DDR_NUM-1:0]            knl_m2s_wvalid                     ,
     output       [1*DDR_NUM-1:0]            knl_s2m_wready                     ,

     //knl axi4 write rsp
     output       [4*DDR_NUM-1:0]            knl_s2m_bid                        ,
     output       [2*DDR_NUM-1:0]            knl_s2m_bresp                      ,
     output       [1*DDR_NUM-1:0]            knl_s2m_bvalid                     ,
     input        [1*DDR_NUM-1:0]            knl_m2s_bready                     ,

     //knl axi4 read addr 	                                          
     input        [4*DDR_NUM-1:0]            knl_m2s_arid                       ,  
     input        [64*DDR_NUM-1:0]           knl_m2s_araddr                     ,
     input        [8*DDR_NUM-1:0]            knl_m2s_arlen                      ,
     input        [3*DDR_NUM-1:0]            knl_m2s_arsize                     ,
     input        [DDR_NUM-1:0]              knl_m2s_arvalid                    ,
     output       [DDR_NUM-1:0]              knl_s2m_arready                    ,

     //knl axi4 read data 	                                            
     output       [4*DDR_NUM-1:0]            knl_s2m_rid                        ,
     output       [512*DDR_NUM-1:0]          knl_s2m_rdata                      ,
     output       [2*DDR_NUM-1:0]            knl_s2m_rresp                      ,
     output       [DDR_NUM-1:0]              knl_s2m_rlast                      ,
     output       [DDR_NUM-1:0]              knl_s2m_rvalid                     ,
     input        [DDR_NUM-1:0]              knl_m2s_rready                     ,

     //ddr axi4 write addr 	                                               
     output       [4*DDR_NUM-1:0]            axi4_m2s_awid                      ,  
     output       [64*DDR_NUM-1:0]           axi4_m2s_awaddr                    ,
     output       [8*DDR_NUM-1:0]            axi4_m2s_awlen                     ,
     output       [3*DDR_NUM-1:0]            axi4_m2s_awsize                    ,
     output       [1*DDR_NUM-1:0]            axi4_m2s_awvalid                   ,
     input        [1*DDR_NUM-1:0]            axi4_s2m_awready                   ,

     //ddr axi4 write data 	                                    
     output       [4*DDR_NUM-1:0]            axi4_m2s_wid                       ,
     output       [512*DDR_NUM-1:0]          axi4_m2s_wdata                     ,
     output       [64*DDR_NUM-1:0]           axi4_m2s_wstrb                     ,
     output       [1*DDR_NUM-1:0]            axi4_m2s_wlast                     ,
     output       [1*DDR_NUM-1:0]            axi4_m2s_wvalid                    ,
     input        [1*DDR_NUM-1:0]            axi4_s2m_wready                    ,

     //ddr axi4 write rsp
     input        [4*DDR_NUM-1:0]            axi4_s2m_bid                       ,
     input        [2*DDR_NUM-1:0]            axi4_s2m_bresp                     ,
     input        [1*DDR_NUM-1:0]            axi4_s2m_bvalid                    ,
     output       [1*DDR_NUM-1:0]            axi4_m2s_bready                    ,  
     
     //ddr axi4 read addr 	                                          
     output       [4*DDR_NUM-1:0]            axi4_m2s_arid                      ,  
     output       [64*DDR_NUM-1:0]           axi4_m2s_araddr                    ,
     output       [8*DDR_NUM-1:0]            axi4_m2s_arlen                     ,
     output       [3*DDR_NUM-1:0]            axi4_m2s_arsize                    ,
     output       [DDR_NUM-1:0]              axi4_m2s_arvalid                   ,
     input        [DDR_NUM-1:0]              axi4_s2m_arready                   ,

     //ddr axi4 read data 	                                    
     input        [4*DDR_NUM-1:0]            axi4_s2m_rid                       ,
     input        [512*DDR_NUM-1:0]          axi4_s2m_rdata                     ,
     input        [2*DDR_NUM-1:0]            axi4_s2m_rresp                     ,
     input        [DDR_NUM-1:0]              axi4_s2m_rlast                     ,
     input        [DDR_NUM-1:0]              axi4_s2m_rvalid                    ,
     output       [DDR_NUM-1:0]              axi4_m2s_rready                    ,
     
     //with cpu
     input                                   cnt_reg_clr                        ,
     input        [A_WTH -1:0]               cpu_addr                           ,
     input        [D_WTH -1:0]               cpu_data_in                        ,
     output       [D_WTH -1:0]               cpu_data_out_connect               ,
     input                                   cpu_rd                             ,
     input                                   cpu_wr                    

   );
/******************************************************************************\
                            signal 
\******************************************************************************/

wire [31:0]               tx2ddr_cfifo_stat                   ;
wire [31:0]               tx2ddr_dfifo_stat                   ;
wire [31:0]               kernel2ddr_cfifo_stat               ;
wire [31:0]               kernel2ddr_dfifo_stat               ;
wire [31:0]               ddr_cfifo_stat                      ;
wire [31:0]               ddr_dfifo_stat                      ;
wire [31:0]               sel_cfifo_stat                      ;
wire [55:0]               fifo_state                          ;
wire [3:0]                axi4_s2m_rsp_ok_cnt_en              ;               
wire [3:0]                axi4_s2m_rsp_exok_cnt_en            ;               
wire [3:0]                axi4_s2m_rsp_slverr_cnt_en          ;               
wire [3:0]                axi4_s2m_rsp_decerr_cnt_en          ;               
wire [3:0]                tx2ddr_cfifo_cnt_en                 ;               
wire [3:0]                tx2ddr_dfifo_eop_cnt_en             ;               
wire [3:0]                kernel2ddr_cfifo_cnt_en             ;               
wire [3:0]                kernel2ddr_dfifo_eop_cnt_en         ;               
wire [3:0]                ddr2tx_bvalid_cnt_en                ;               
wire [3:0]                ddr2kernel_bvalid_cnt_en            ;               
wire [3:0]                pkt_fifo_rdata_sop_cnt_en           ; 
wire [32*DDR_NUM-1:0]     reg_cont_rd_err                     ; 
wire [32*DDR_NUM-1:0]     reg_cont_rd_sta                     ; 
wire [DDR_NUM-1:0]        reg_cont_rcmd_en                    ; 
wire [DDR_NUM-1:0]        reg_cont_rpkt_en                    ;

wire [DDR_NUM-1:0]        axi4_sl_tran_cnt_en                 ;
wire [DDR_NUM-1:0]        axi4_sl_frm_cnt_en                  ;
wire [DDR_NUM-1:0]        axi4_sl_wr_cnt_en                   ;
wire [8*DDR_NUM-1:0]      axi4_sl_fsm_state                   ;
/******************************************************************************\
                            process
\******************************************************************************/
genvar r;
generate
for (r = 0;r < DDR_NUM;r = r + 1 )
    begin : CONNECT_TX_RX

        smt_con_tx u_smt_con_tx
        (

             .clk_sys                            ( clk_sys                                   ),
             .rst                                ( rst                                       ), 
            
             //mmu axi4 write addr 	                                        
             .mmu_m_awid                         ( mmu_m2s_awid[4*(r+1)-1:4*r]               ),  
             .mmu_m_awaddr                       ( mmu_m2s_awaddr[64*(r+1)-1:64*r]           ),
             .mmu_m_awlen                        ( mmu_m2s_awlen[8*(r+1)-1:8*r]              ),
             .mmu_m_awsize                       ( mmu_m2s_awsize[3*(r+1)-1:3*r]             ),
             .mmu_m_awvalid                      ( mmu_m2s_awvalid[r]                        ),
             .mmu_s_awready                      ( mmu_s2m_awready[r]                        ),
        
             //mmu axi4 write data 	                            
             .mmu_m_wid                          ( mmu_m2s_wid[4*(r+1)-1:4*r]                ),
             .mmu_m_wdata                        ( mmu_m2s_wdata[512*(r+1)-1:512*r]          ),
             .mmu_m_wstrb                        ( mmu_m2s_wstrb[64*(r+1)-1:64*r]            ),
             .mmu_m_wlast                        ( mmu_m2s_wlast[r]                          ),
             .mmu_m_wvalid                       ( mmu_m2s_wvalid[r]                         ),
             .mmu_s_wready                       ( mmu_s2m_wready[r]                         ),               
            
             //mmu axi4 write rsp            
             .mmu_s_bid                          ( mmu_s2m_bid[4*(r+1)-1:4*r]                ),
             .mmu_s_bresp                        ( mmu_s2m_bresp[2*(r+1)-1:2*r]              ),
             .mmu_s_bvalid                       ( mmu_s2m_bvalid[r]                         ),
             .mmu_m_bready                       ( mmu_m2s_bready[r]                         ),
        
             //knl axi4 write addr                                    
             .knl_m_awid                         ( knl_m2s_awid[4*(r+1)-1:4*r]               ),  
             .knl_m_awaddr                       ( knl_m2s_awaddr[64*(r+1)-1:64*r]           ),
             .knl_m_awlen                        ( knl_m2s_awlen[8*(r+1)-1:8*r]              ),
             .knl_m_awsize                       ( knl_m2s_awsize[3*(r+1)-1:3*r]             ),
             .knl_m_awvalid                      ( knl_m2s_awvalid[r]                        ),
             .knl_s_awready                      ( knl_s2m_awready[r]                        ),
        
             //knl axi4 write data                                    
             .knl_m_wid                          ( knl_m2s_wid[4*(r+1)-1:4*r]                ),
             .knl_m_wdata                        ( knl_m2s_wdata[512*(r+1)-1:512*r]          ),
             .knl_m_wstrb                        ( knl_m2s_wstrb[64*(r+1)-1:64*r]            ),
             .knl_m_wlast                        ( knl_m2s_wlast[r]                          ),
             .knl_m_wvalid                       ( knl_m2s_wvalid[r]                         ),
             .knl_s_wready                       ( knl_s2m_wready[r]                         ),
        
             //knl axi4 write rsp 	            
             .knl_s_bid                          ( knl_s2m_bid[4*(r+1)-1:4*r]                ),
             .knl_s_bresp                        ( knl_s2m_bresp[2*(r+1)-1:2*r]              ),
             .knl_s_bvalid                       ( knl_s2m_bvalid[r]                         ),
             .knl_m_bready                       ( knl_m2s_bready[r]                         ), 
        
             //ddr axi4 write addr interface                          
             .axi4_m2s_awid                      ( axi4_m2s_awid[4*(r+1)-1:4*r]              ),  
             .axi4_m2s_awaddr                    ( axi4_m2s_awaddr[64*(r+1)-1:64*r]          ),
             .axi4_m2s_awlen                     ( axi4_m2s_awlen[8*(r+1)-1:8*r]             ),
             .axi4_m2s_awsize                    ( axi4_m2s_awsize[3*(r+1)-1:3*r]            ),
             .axi4_m2s_awvalid                   ( axi4_m2s_awvalid[r]                       ),
             .axi4_s2m_awready                   ( axi4_s2m_awready[r]                       ),
        
             //ddr axi4 write addr interface                                 
             .axi4_m2s_wid                       ( axi4_m2s_wid[4*(r+1)-1:4*r]               ),
             .axi4_m2s_wdata                     ( axi4_m2s_wdata[512*(r+1)-1:512*r]         ),
             .axi4_m2s_wstrb                     ( axi4_m2s_wstrb[64*(r+1)-1:64*r]           ),
             .axi4_m2s_wlast                     ( axi4_m2s_wlast[r]                         ),
             .axi4_m2s_wvalid                    ( axi4_m2s_wvalid[r]                        ),
             .axi4_s2m_wready                    ( axi4_s2m_wready[r]                        ),
        
             //ddr axi4 write rsp interface        
             .axi4_s2m_bid                       ( axi4_s2m_bid[4*(r+1)-1:4*r]               ),
             .axi4_s2m_bresp                     ( axi4_s2m_bresp[2*(r+1)-1:2*r]             ),
             .axi4_s2m_bvalid                    ( axi4_s2m_bvalid[r]                        ),
             .axi4_m2s_bready                    ( axi4_m2s_bready[r]                        ),
             
             //dfx
             .tx2ddr_cfifo_stat                  ( tx2ddr_cfifo_stat[8*(r+1)-1:8*r]          ),    
             .tx2ddr_dfifo_stat                  ( tx2ddr_dfifo_stat[8*(r+1)-1:8*r]          ),
             .kernel2ddr_cfifo_stat              ( kernel2ddr_cfifo_stat[8*(r+1)-1:8*r]      ),
             .kernel2ddr_dfifo_stat              ( kernel2ddr_dfifo_stat[8*(r+1)-1:8*r]      ),
             .ddr_cfifo_stat                     ( ddr_cfifo_stat[8*(r+1)-1:8*r]             ),
             .ddr_dfifo_stat                     ( ddr_dfifo_stat[8*(r+1)-1:8*r]             ),
             .sel_cfifo_stat                     ( sel_cfifo_stat[8*(r+1)-1:8*r]             ),
             .fifo_state                         ( fifo_state[14*(r+1)-1:14*r]               ),
             .axi4_s2m_rsp_ok_cnt_en             ( axi4_s2m_rsp_ok_cnt_en[r]                 ),               
             .axi4_s2m_rsp_exok_cnt_en           ( axi4_s2m_rsp_exok_cnt_en[r]               ),               
             .axi4_s2m_rsp_slverr_cnt_en         ( axi4_s2m_rsp_slverr_cnt_en[r]             ),               
             .axi4_s2m_rsp_decerr_cnt_en         ( axi4_s2m_rsp_decerr_cnt_en[r]             ),               
             .tx2ddr_cfifo_cnt_en                ( tx2ddr_cfifo_cnt_en[r]                    ),               
             .tx2ddr_dfifo_eop_cnt_en            ( tx2ddr_dfifo_eop_cnt_en[r]                ),               
             .kernel2ddr_cfifo_cnt_en            ( kernel2ddr_cfifo_cnt_en[r]                ),               
             .kernel2ddr_dfifo_eop_cnt_en        ( kernel2ddr_dfifo_eop_cnt_en[r]            ),               
             .ddr2tx_bvalid_cnt_en               ( ddr2tx_bvalid_cnt_en[r]                   ),               
             .ddr2kernel_bvalid_cnt_en           ( ddr2kernel_bvalid_cnt_en[r]               ),               
             .pkt_fifo_rdata_sop_cnt_en          ( pkt_fifo_rdata_sop_cnt_en[r]              ),
             .axi4_sl_tran_cnt_en                ( axi4_sl_tran_cnt_en[r]                    ), 
             .axi4_sl_frm_cnt_en                 ( axi4_sl_frm_cnt_en[r]                     ), 
             .axi4_sl_wr_cnt_en                  ( axi4_sl_wr_cnt_en[r]                      ), 
             .axi4_sl_fsm_state                  ( axi4_sl_fsm_state[8*(r+1)-1:8*r]          )

            );
    

        smt_con_rx u_smt_con_rx
        (
             .aclk                               ( clk_sys                                   ),
             .areset                             ( rst                                       ), 
                                            
             //mmu axi4 read addr 	                                        
             .mmu_arid                           ( mmu_m2s_arid[4*(r+1)-1:4*r]               ),  
             .mmu_araddr                         ( mmu_m2s_araddr[64*(r+1)-1:64*r]           ),
             .mmu_arlen                          ( mmu_m2s_arlen[8*(r+1)-1:8*r]              ),
             .mmu_arsize                         ( mmu_m2s_arsize[3*(r+1)-1:3*r]             ),
             .mmu_arvalid                        ( mmu_m2s_arvalid[r]                        ),
             .mmu_arready                        ( mmu_s2m_arready[r]                        ),
          
             //mmu axi4 read data 	                            
             .mmu_rid                            ( mmu_s2m_rid[4*(r+1)-1:4*r]                ),
             .mmu_rdata                          ( mmu_s2m_rdata[512*(r+1)-1:512*r]          ),
             .mmu_rresp                          ( mmu_s2m_rresp[2*(r+1)-1:2*r]              ),
             .mmu_rlast                          ( mmu_s2m_rlast[r]                          ),
             .mmu_rvalid                         ( mmu_s2m_rvalid[r]                         ),
             .mmu_rready                         ( mmu_m2s_rready[r]                         ),               
         
             //knl axi4 read addr                                    
             .knl_arid                           ( knl_m2s_arid[4*(r+1)-1:4*r]               ),  
             .knl_araddr                         ( knl_m2s_araddr[64*(r+1)-1:64*r]           ),
             .knl_arlen                          ( knl_m2s_arlen[8*(r+1)-1:8*r]              ),
             .knl_arsize                         ( knl_m2s_arsize[3*(r+1)-1:3*r]             ),
             .knl_arvalid                        ( knl_m2s_arvalid[r]                        ),
             .knl_arready                        ( knl_s2m_arready[r]                        ),
        
             //knl axi4 read data                                    
             .knl_rid                            ( knl_s2m_rid[4*(r+1)-1:4*r]                ),
             .knl_rdata                          ( knl_s2m_rdata[512*(r+1)-1:512*r]          ),
             .knl_rresp                          ( knl_s2m_rresp[2*(r+1)-1:2*r]              ),
             .knl_rlast                          ( knl_s2m_rlast[r]                          ),
             .knl_rvalid                         ( knl_s2m_rvalid[r]                         ),
             .knl_rready                         ( knl_m2s_rready[r]                         ),               
                                            
             //ddr axi4 read addr interface                                 
             .ddr_arid                           ( axi4_m2s_arid[4*(r+1)-1:4*r]              ),  
             .ddr_araddr                         ( axi4_m2s_araddr[64*(r+1)-1:64*r]          ),
             .ddr_arlen                          ( axi4_m2s_arlen[8*(r+1)-1:8*r]             ),
             .ddr_arsize                         ( axi4_m2s_arsize[3*(r+1)-1:3*r]            ),
             .ddr_arvalid                        ( axi4_m2s_arvalid[r]                       ),
             .ddr_arready                        ( axi4_s2m_arready[r]                       ),
          
             //ddr axi4 read data interface                                
             .ddr_rid                            ( axi4_s2m_rid[4*(r+1)-1:4*r]               ),
             .ddr_rdata                          ( axi4_s2m_rdata[512*(r+1)-1:512*r]         ),
             .ddr_rresp                          ( axi4_s2m_rresp[2*(r+1)-1:2*r]             ),
             .ddr_rlast                          ( axi4_s2m_rlast[r]                         ),
             .ddr_rvalid                         ( axi4_s2m_rvalid[r]                        ),
             .ddr_rready                         ( axi4_m2s_rready[r]                        ),
             
             //dfx 
             .reg_cont_rd_cfg                    ( 32'hffffffff                              ),
             .reg_cont_rd_err                    ( reg_cont_rd_err[r]                        ),
             .reg_cont_rd_sta                    ( reg_cont_rd_sta[r]                        ),
             .reg_cont_rcmd_en                   ( reg_cont_rcmd_en[r]                       ),
             .reg_cont_rpkt_en                   ( reg_cont_rpkt_en[r]                       )
     
        );
    end 

endgenerate

reg_smt_con #
    (
    .A_WTH                          ( A_WTH                        ),
    .D_WTH                          ( D_WTH                        ),
    .REG_MMU_CONNECT_ID             ( REG_MMU_CONNECT_ID           ) 
    )
u_reg_smt_con
    (
    //globe signals
    .clk_sys                        ( clk_sys                      ),
    .rst                            ( rst                          ),

    //cnt
    .axi4_s2m_rsp_ok_cnt_en         ( axi4_s2m_rsp_ok_cnt_en       ),
    .axi4_s2m_rsp_exok_cnt_en       ( axi4_s2m_rsp_exok_cnt_en     ),
    .axi4_s2m_rsp_slverr_cnt_en     ( axi4_s2m_rsp_slverr_cnt_en   ),
    .axi4_s2m_rsp_decerr_cnt_en     ( axi4_s2m_rsp_decerr_cnt_en   ),
    .tx2ddr_cfifo_cnt_en            ( tx2ddr_cfifo_cnt_en          ),
    .tx2ddr_dfifo_eop_cnt_en        ( tx2ddr_dfifo_eop_cnt_en      ),
    .kernel2ddr_cfifo_cnt_en        ( kernel2ddr_cfifo_cnt_en      ),
    .kernel2ddr_dfifo_eop_cnt_en    ( kernel2ddr_dfifo_eop_cnt_en  ),
    .ddr2tx_bvalid_cnt_en           ( ddr2tx_bvalid_cnt_en         ),
    .ddr2kernel_bvalid_cnt_en       ( ddr2kernel_bvalid_cnt_en     ),
    .pkt_fifo_rdata_sop_cnt_en      ( pkt_fifo_rdata_sop_cnt_en    ),
    .reg_cont_rcmd_en               ( reg_cont_rcmd_en             ),
    .reg_cont_rpkt_en               ( reg_cont_rpkt_en             ),

    .reg_axi4_sl_tran_cnt_en        ( axi4_sl_tran_cnt_en[0]       ),
    .reg_axi4_sl_frm_cnt_en         ( axi4_sl_frm_cnt_en[0]        ),
    .reg_axi4_sl_wr_cnt_en          ( axi4_sl_wr_cnt_en[0]         ),
    .reg_axi4_sl_fsm_state          ( axi4_sl_fsm_state[7:0]       ),

    //status
    .tx2ddr_cfifo_stat              ( tx2ddr_cfifo_stat            ),    
    .tx2ddr_dfifo_stat              ( tx2ddr_dfifo_stat            ),
    .kernel2ddr_cfifo_stat          ( kernel2ddr_cfifo_stat        ),
    .kernel2ddr_dfifo_stat          ( kernel2ddr_dfifo_stat        ),
    .ddr_cfifo_stat                 ( ddr_cfifo_stat               ),
    .ddr_dfifo_stat                 ( ddr_dfifo_stat               ),
    .sel_cfifo_stat                 ( sel_cfifo_stat               ),
    .fifo_state                     ( fifo_state                   ),
    .reg_cont_rd_sta                ( reg_cont_rd_sta              ),

    //err 
    .reg_cont_rd_err                ( reg_cont_rd_err              ),

    //with cpu
    .cnt_reg_clr                    ( cnt_reg_clr                  ),
    .cpu_addr                       ( cpu_addr                     ),
    .cpu_data_in                    ( cpu_data_in                  ),
    .cpu_data_out_pf                ( cpu_data_out_connect         ),
    .cpu_rd                         ( cpu_rd                       ),
    .cpu_wr                         ( cpu_wr                       )

    );

endmodule        
