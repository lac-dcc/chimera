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
`timescale 1ns / 100ps

module smt_con_tx
   (
     input                            clk_sys                            ,
     input                            rst                                , 
    
     //mmu axi4 write addr 	                                           
     input        [3:0]               mmu_m_awid                         ,  
     input        [63:0]              mmu_m_awaddr                       ,
     input        [7:0]               mmu_m_awlen                        ,
     input        [2:0]               mmu_m_awsize                       ,
     input                            mmu_m_awvalid                      ,
     output                           mmu_s_awready                      ,

     //mmu axi4 write data 	                                          
     input        [3:0]               mmu_m_wid                          ,
     input        [511:0]             mmu_m_wdata                        ,
     input        [63:0]              mmu_m_wstrb                        ,
     input                            mmu_m_wlast                        ,
     input                            mmu_m_wvalid                       ,
     output                           mmu_s_wready                       ,               
    
     //mmu axi4 write rsp
     output       [3:0]               mmu_s_bid                          ,
     output       [1:0]               mmu_s_bresp                        ,
     output                           mmu_s_bvalid                       ,
     input                            mmu_m_bready                       ,

     //knl axi4 write addr 	                                          
     input        [3:0]               knl_m_awid                         ,  
     input        [63:0]              knl_m_awaddr                       ,
     input        [7:0]               knl_m_awlen                        ,
     input        [2:0]               knl_m_awsize                       ,
     input                            knl_m_awvalid                      ,
     output                           knl_s_awready                      ,

     //mmu axi4 write data 	                                       
     input        [3:0]               knl_m_wid                          ,
     input        [511:0]             knl_m_wdata                        ,
     input        [63:0]              knl_m_wstrb                        ,
     input                            knl_m_wlast                        ,
     input                            knl_m_wvalid                       ,
     output                           knl_s_wready                       ,

     //mmu axi4 write rsp
     output       [3:0]               knl_s_bid                          ,
     output       [1:0]               knl_s_bresp                        ,
     output                           knl_s_bvalid                       ,
     input                            knl_m_bready                       , 

     //ddr axi4 write addr 	                                          
     output       [3:0]               axi4_m2s_awid                      ,  
     output       [63:0]              axi4_m2s_awaddr                    ,
     output       [7:0]               axi4_m2s_awlen                     ,
     output       [2:0]               axi4_m2s_awsize                    ,
     output       [74:0]              axi4_m2s_awuser                    ,

     output                           axi4_m2s_awvalid                   ,
     input                            axi4_s2m_awready                   ,

     //ddr axi4 write data 	                                    
     output       [3:0]               axi4_m2s_wid                       ,
     output       [511:0]             axi4_m2s_wdata                     ,
     output       [63:0]              axi4_m2s_wstrb                     ,
     output                           axi4_m2s_wlast                     ,
     output                           axi4_m2s_wvalid                    ,
     input                            axi4_s2m_wready                    ,

     //ddr axi4 write rsp
     input        [3:0]               axi4_s2m_bid                       ,
     input        [1:0]               axi4_s2m_bresp                     ,
     input                            axi4_s2m_bvalid                    ,
     output                           axi4_m2s_bready                    , 

     //with cpu
     output   wire    [7:0]           tx2ddr_cfifo_stat                  ,
     output   wire    [7:0]           tx2ddr_dfifo_stat                  ,
     output   wire    [7:0]           kernel2ddr_cfifo_stat              ,
     output   wire    [7:0]           kernel2ddr_dfifo_stat              ,
     output   wire    [7:0]           ddr_cfifo_stat                     ,
     output   wire    [7:0]           ddr_dfifo_stat                     ,
     output   wire    [7:0]           sel_cfifo_stat                     ,
     output   wire    [13:0]          fifo_state                         ,
     output   wire                    axi4_s2m_rsp_ok_cnt_en             ,               
     output   wire                    axi4_s2m_rsp_exok_cnt_en           ,               
     output   wire                    axi4_s2m_rsp_slverr_cnt_en         ,               
     output   wire                    axi4_s2m_rsp_decerr_cnt_en         ,               
     output   wire                    tx2ddr_cfifo_cnt_en                ,               
     output   wire                    tx2ddr_dfifo_eop_cnt_en            ,               
     output   wire                    kernel2ddr_cfifo_cnt_en            ,               
     output   wire                    kernel2ddr_dfifo_eop_cnt_en        ,               
     output   wire                    ddr2tx_bvalid_cnt_en               ,               
     output   wire                    ddr2kernel_bvalid_cnt_en           ,               
     output   wire                    pkt_fifo_rdata_sop_cnt_en          ,  

     output   wire                    axi4_sl_tran_cnt_en                ,   
     output   wire                    axi4_sl_frm_cnt_en                 ,   
     output   wire                    axi4_sl_wr_cnt_en                  ,   
     output   wire    [7:0]           axi4_sl_fsm_state                     
     
   );
/******************************************************************************\
                            signal 
\******************************************************************************/
wire                              mmu_axi2fifo_wr         ;
wire      [539:0]                 mmu_axi2fifo_wdata      ;
wire                              mmu_fifo2axi_ff         ;

wire                              mmu_axi2fifo_cmd_wr     ;
wire      [53:0]                  mmu_axi2fifo_cmd_wdata  ;
wire                              mmu_fifo2axi_cmd_ff     ;

wire                              knl_axi2fifo_wr         ;
wire      [539:0]                 knl_axi2fifo_wdata      ;
wire                              knl_fifo2axi_ff         ;

wire                              knl_axi2fifo_cmd_wr     ;
wire      [53:0]                  knl_axi2fifo_cmd_wdata  ;
wire                              knl_fifo2axi_cmd_ff     ;


/******************************************************************************\
                            process
\******************************************************************************/

axi4_s512_mmu #
       (
        .AXI_ADDR_WIDTH                             ( 64  ),
    	.DATA_WIDTH                                 ( 512 ),
    	.FIFO_DATA_WIDTH                            ( 540 ),
    	.SOP_POS                                    ( 520 ),
    	.EOP_POS                                    ( 519 ),
    	.ERR_POS                                    ( 518 ),
    	.MOD_POS                                    ( 512 ),
    	.MOD_WIDTH                                  ( 6   ),
    	.PKT_TYPE_POS                               ( 537 ), 
    	.PKT_TYPE_WIDTH                             ( 4   ) 
       )
u_axi4_mmu
(
        //globe signals
        .clk_sys                                    ( clk_sys                ),//i 1  
        .rst                                        ( rst                    ),//i 1  
          
        //interface with axi4 master          
        .m_awid 						            ( mmu_m_awid 	         ),
        .m_awaddr 					                ( mmu_m_awaddr           ),
        .m_awlen 					                ( mmu_m_awlen 	         ),
        .m_awsize 					                ( mmu_m_awsize 	         ),
        .m_awvalid 				                    ( mmu_m_awvalid    	     ),
        .s_awready 				                    ( mmu_s_awready  	     ),
        
        .m_wid                                      ( mmu_m_wid              ),
        .m_wdata 					                ( mmu_m_wdata            ),
        .m_wstrb 					                ( mmu_m_wstrb            ),
        .m_wlast 					                ( mmu_m_wlast            ),
        .m_wvalid 					                ( mmu_m_wvalid 	         ),
        .s_wready 					                ( mmu_s_wready	         ),
                        
        .s_bid 					                    (                        ),
        .s_bresp 					                (                        ),
        .s_bvalid 					                (                        ),
        .m_bready 					                ( mmu_m_bready           ),
                        
        //interface with data fifo                                           
        .axi2fifo_wr 			                    ( mmu_axi2fifo_wr 	     ),
        .axi2fifo_wdata 		                    ( mmu_axi2fifo_wdata     ),
        .fifo2axi_ff 			                    ( mmu_fifo2axi_ff   	 ),
                 
        //interface with cmd fifo
        .axi2fifo_cmd_wr 			                ( mmu_axi2fifo_cmd_wr 	 ),
        .axi2fifo_cmd_wdata 		                ( mmu_axi2fifo_cmd_wdata ),
        .fifo2axi_cmd_ff 			                ( mmu_fifo2axi_cmd_ff 	 ),    

        //sta, cnt, err              
        .axi2fifo_len              	                (                        ),
        .axi4_sl_tran_cnt_en       	                ( axi4_sl_tran_cnt_en    ),
        .axi4_sl_tranok_cnt_en     	                (                        ),
        .axi4_sl_frm_cnt_en        	                ( axi4_sl_frm_cnt_en     ),
        .axi4_sl_wr_cnt_en                          ( axi4_sl_wr_cnt_en      ),
        .axi4_sl_fsm_state                          ( axi4_sl_fsm_state      ),

        .reg_axi4_sl_sta           	                (                        ),
        .reg_axi4_sl_err                            (                        )       

);

axi4_s512_mmu #
        (
        .AXI_ADDR_WIDTH                             ( 64  ),
        .DATA_WIDTH                                 ( 512 ),
        .FIFO_DATA_WIDTH                            ( 540 ),
        .SOP_POS                                    ( 520 ),
        .EOP_POS                                    ( 519 ),
        .ERR_POS                                    ( 518 ),
        .MOD_POS                                    ( 512 ),
        .MOD_WIDTH                                  ( 6   ),
        .PKT_TYPE_POS                               ( 537 ), 
        .PKT_TYPE_WIDTH                             ( 4   ) 
        )
u_axi4_knl
(
        //globe signals
        .clk_sys                                    ( clk_sys                ),//i 1  
        .rst                                        ( rst                    ),//i 1  

        //interface with axi4 master          
        .m_awid 						            ( knl_m_awid 	         ),
        .m_awaddr 					                ( knl_m_awaddr           ),
        .m_awlen 					                ( knl_m_awlen 	         ),
        .m_awsize 					                ( knl_m_awsize 	         ),
        .m_awvalid 				                    ( knl_m_awvalid    	     ),
        .s_awready 				                    ( knl_s_awready  	     ),
        
        .m_wid                                      ( knl_m_wid              ),
        .m_wdata 					                ( knl_m_wdata            ),
        .m_wstrb 					                ( knl_m_wstrb 	         ),
        .m_wlast 					                ( knl_m_wlast 	         ),
        .m_wvalid 					                ( knl_m_wvalid 	         ),
        .s_wready 					                ( knl_s_wready 	         ),
                        
        .s_bid 					                    (                        ),
        .s_bresp 					                (                        ),
        .s_bvalid 					                (                        ),
        .m_bready 					                ( knl_m_bready           ),
                        
        //interface with data fifo                                        
        .axi2fifo_wr 			                    ( knl_axi2fifo_wr 	     ),
        .axi2fifo_wdata 		                    ( knl_axi2fifo_wdata     ),
        .fifo2axi_ff 			                    ( knl_fifo2axi_ff    	 ),
                 
        //interface with cmd fifo
        .axi2fifo_cmd_wr 			                ( knl_axi2fifo_cmd_wr 	 ),
        .axi2fifo_cmd_wdata 		                ( knl_axi2fifo_cmd_wdata ),
        .fifo2axi_cmd_ff 			                ( knl_fifo2axi_cmd_ff 	 ),    

        //sta, cnt, err              
        .axi2fifo_len              	                (                        ),
        .axi4_sl_tran_cnt_en       	                (                        ),
        .axi4_sl_tranok_cnt_en     	                (                        ),
        .axi4_sl_frm_cnt_en        	                (                        ),
        
        .reg_axi4_sl_sta           	                (                        ),
        .reg_axi4_sl_err                            (                        )       

);

smt_con u_smt_con
(
       //globe signals
       .clk_sys                                    ( clk_sys                 ),
       .rst                                        ( rst                     ),

       //tx to ddr pkt
       .tx2ddr_cfifo_wr                            ( mmu_axi2fifo_cmd_wr     ),
       .tx2ddr_cfifo_wdata                         ( {18'd0,mmu_axi2fifo_cmd_wdata}),
       .ddr2tx_cfifo_ff                            ( mmu_fifo2axi_cmd_ff     ),
       .tx2ddr_dfifo_wr                            ( mmu_axi2fifo_wr 	     ),
       .tx2ddr_dfifo_wdata                         ( mmu_axi2fifo_wdata      ),
       .ddr2tx_dfifo_ff                            ( mmu_fifo2axi_ff    	 ),

       .ddr2tx_bid                                 ( mmu_s_bid               ),
       .ddr2tx_bresp                               ( mmu_s_bresp             ),
       .ddr2tx_bvalid                              ( mmu_s_bvalid            ),

       //kernel to ddr pkt
       .kernel2ddr_cfifo_wr                        ( knl_axi2fifo_cmd_wr 	 ),
       .kernel2ddr_cfifo_wdata                     ( {18'd0,knl_axi2fifo_cmd_wdata}),
       .ddr2kernel_cfifo_ff                        ( knl_fifo2axi_cmd_ff     ),
       .kernel2ddr_dfifo_wr                        ( knl_axi2fifo_wr 	     ),
       .kernel2ddr_dfifo_wdata                     ( knl_axi2fifo_wdata      ),
       .ddr2kernel_dfifo_ff                        ( knl_fifo2axi_ff    	 ),
       
       .ddr2kernel_bid                             ( knl_s_bid               ),
       .ddr2kernel_bresp                           ( knl_s_bresp             ),
       .ddr2kernel_bvalid                          ( knl_s_bvalid            ),

       //send pkt to ddr : axi 4 interface
       .axi4_m2s_awid                              ( axi4_m2s_awid           ),
       .axi4_m2s_awaddr                            ( axi4_m2s_awaddr         ),
       .axi4_m2s_awlen                             ( axi4_m2s_awlen          ),
       .axi4_m2s_awsize                            ( axi4_m2s_awsize         ),
       .axi4_m2s_awuser                            ( axi4_m2s_awuser         ),
                                                       
       .axi4_m2s_awvalid                           ( axi4_m2s_awvalid        ),
       .axi4_s2m_awready                           ( axi4_s2m_awready        ),
       
       .axi4_m2s_wid                               ( axi4_m2s_wid            ),
       .axi4_m2s_wdata                             ( axi4_m2s_wdata          ),
       .axi4_m2s_wstrb                             ( axi4_m2s_wstrb          ),
       .axi4_m2s_wlast                             ( axi4_m2s_wlast          ),
       .axi4_m2s_wvalid                            ( axi4_m2s_wvalid         ),
       .axi4_s2m_wready                            ( axi4_s2m_wready         ),
                                                       
       .axi4_s2m_bid                               ( axi4_s2m_bid            ),
       .axi4_s2m_bresp                             ( axi4_s2m_bresp          ),
       .axi4_s2m_bvalid                            ( axi4_s2m_bvalid         ),
       .axi4_m2s_bready                            ( axi4_m2s_bready         ), 

       .tx2ddr_cfifo_stat                          (tx2ddr_cfifo_stat          ),    
       .tx2ddr_dfifo_stat                          (tx2ddr_dfifo_stat          ),
       .kernel2ddr_cfifo_stat                      (kernel2ddr_cfifo_stat      ),
       .kernel2ddr_dfifo_stat                      (kernel2ddr_dfifo_stat      ),
       .ddr_cfifo_stat                             (ddr_cfifo_stat             ),
       .ddr_dfifo_stat                             (ddr_dfifo_stat             ),
       .sel_cfifo_stat                             (sel_cfifo_stat             ),
       .fifo_state                                 (fifo_state                 ),
       .axi4_s2m_rsp_ok_cnt_en                     (axi4_s2m_rsp_ok_cnt_en     ),               
       .axi4_s2m_rsp_exok_cnt_en                   (axi4_s2m_rsp_exok_cnt_en   ),               
       .axi4_s2m_rsp_slverr_cnt_en                 (axi4_s2m_rsp_slverr_cnt_en ),               
       .axi4_s2m_rsp_decerr_cnt_en                 (axi4_s2m_rsp_decerr_cnt_en ),               
       .tx2ddr_cfifo_cnt_en                        (tx2ddr_cfifo_cnt_en        ),               
       .tx2ddr_dfifo_eop_cnt_en                    (tx2ddr_dfifo_eop_cnt_en    ),               
       .kernel2ddr_cfifo_cnt_en                    (kernel2ddr_cfifo_cnt_en    ),               
       .kernel2ddr_dfifo_eop_cnt_en                (kernel2ddr_dfifo_eop_cnt_en),               
       .ddr2tx_bvalid_cnt_en                       (ddr2tx_bvalid_cnt_en       ),               
       .ddr2kernel_bvalid_cnt_en                   (ddr2kernel_bvalid_cnt_en   ),               
       .pkt_fifo_rdata_sop_cnt_en                  (pkt_fifo_rdata_sop_cnt_en  )  
  
);

endmodule        
