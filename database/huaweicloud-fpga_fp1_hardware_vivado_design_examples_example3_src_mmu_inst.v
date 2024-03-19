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

module mmu_inst #
    (
        parameter A_WTH         =    24       ,
        parameter D_WTH         =    32       ,
        parameter DDR_NUM       =    4        , 
        parameter REG_MMU_TX_ID =    12'd1    ,
        parameter REG_MMU_RX_ID =    12'd2       
    )
    (
    //globe signals
    input                           clk_sys                  ,
    input                           rst                      ,

    //mmu_tx interface
    //ve to ae bd
    input   [255:0]                 bd_rd_m_axis_rc_tdata    ,
    input   [74:0]                  bd_rd_m_axis_rc_tuser    ,
    input                           bd_rd_m_axis_rc_tlast    ,
    input   [31:0]                  bd_rd_m_axis_rc_tkeep    ,
    input                           bd_rd_m_axis_rc_tvalid   ,
    output                          bd_rd_m_axis_rc_tready   ,
    //ae to ve read command
    output                          rdpkt_s_axis_rq_tlast    ,
    output  [255:0]                 rdpkt_s_axis_rq_tdata    ,
    output  [59:0]                  rdpkt_s_axis_rq_tuser    ,
    output  [31:0]                  rdpkt_s_axis_rq_tkeep    ,
    input                           rdpkt_s_axis_rq_tready   ,
    output                          rdpkt_s_axis_rq_tvalid   ,
    //with kernel
    output                          bd2k_s_axis_rq_tlast     ,
    output  [511:0]                 bd2k_s_axis_rq_tdata     ,
    output  [59:0]                  bd2k_s_axis_rq_tuser     ,
    output  [63:0]                  bd2k_s_axis_rq_tkeep     ,
    input                           bd2k_s_axis_rq_tready    ,
    output                          bd2k_s_axis_rq_tvalid    ,

    //receive hard acc & pkt : axi stream interface
    input   [511:0]                 sh2ul_dmam1_tdata        , 
    input   [74:0]                  sh2ul_dmam1_tuser        ,
    input                           sh2ul_dmam1_tlast        ,
    input   [63:0]                  sh2ul_dmam1_tkeep        ,
    input                           sh2ul_dmam1_tvalid       ,
    output                          ul2sh_dmam1_tready       ,

    //send pkt to ddr : axi 4 interface
    output  [4*DDR_NUM-1:0]         axi4_m2s_awid            ,
    output  [64*DDR_NUM-1:0]        axi4_m2s_awaddr          ,
    output  [8*DDR_NUM-1:0]         axi4_m2s_awlen           ,
    output  [3*DDR_NUM-1:0]         axi4_m2s_awsize          ,
    output  [8*DDR_NUM-1:0]         axi4_m2s_awuser          ,
                                      
    output  [1*DDR_NUM-1:0]         axi4_m2s_awvalid         ,
    input   [1*DDR_NUM-1:0]         axi4_s2m_awready         ,
                             
    output  [4*DDR_NUM-1:0]         axi4_m2s_wid             ,
    output  [512*DDR_NUM-1:0]       axi4_m2s_wdata           ,
    output  [64*DDR_NUM-1:0]        axi4_m2s_wstrb           ,
    output  [1*DDR_NUM-1:0]         axi4_m2s_wlast           ,
    output  [1*DDR_NUM-1:0]         axi4_m2s_wvalid          ,
    input   [1*DDR_NUM-1:0]         axi4_s2m_wready          ,
                                       
    input   [4*DDR_NUM-1:0]         axi4_s2m_bid             ,
    input   [2*DDR_NUM-1:0]         axi4_s2m_bresp           ,
    input   [1*DDR_NUM-1:0]         axi4_s2m_bvalid          ,
    output  [1*DDR_NUM-1:0]         axi4_m2s_bready          ,

    //mmu_rx interface
    //BD signal with Kernel  
    input                           ker2mmu_bd_tlast         ,
    input   [511:0]                 ker2mmu_bd_tdata         ,
    input   [74:0]                  ker2mmu_bd_tuser         ,
    input   [63:0]                  ker2mmu_bd_tkeep         ,
    input                           ker2mmu_bd_tvalid        ,
    output                          mmu2ker_bd_tready        ,                               

    //axi4 read addr with DDR CTRL	                                        
    output  [4*DDR_NUM-1:0]         axi4m_ddr_arid           ,  
    output  [64*DDR_NUM-1:0]        axi4m_ddr_araddr         ,
    output  [8*DDR_NUM-1:0]         axi4m_ddr_arlen          ,
    output  [3*DDR_NUM-1:0]         axi4m_ddr_arsize         ,
    output  [DDR_NUM-1:0]           axi4m_ddr_arvalid        ,
    input   [DDR_NUM-1:0]           axi4m_ddr_arready        ,
    
    //axi4 read data with DDR CTRL 	                               
    input   [4*DDR_NUM-1:0]         axi4m_ddr_rid            ,
    input   [512*DDR_NUM-1:0]       axi4m_ddr_rdata          ,
    input   [2*DDR_NUM-1:0]         axi4m_ddr_rresp          ,
    input   [DDR_NUM-1:0]           axi4m_ddr_rlast          ,
    input   [DDR_NUM-1:0]           axi4m_ddr_rvalid         ,
    output  [DDR_NUM-1:0]           axi4m_ddr_rready         , 
    //ae to ve pkt signal
    output                          ul2sh_pkt_tlast          ,
    output  [511:0]                 ul2sh_pkt_tdata          ,
    output  [63:0]                  ul2sh_pkt_tkeep          ,
    output                          ul2sh_pkt_tvalid         ,
    input                           sh2ul_pkt_tready         ,


    //with cpu
    input                           cnt_reg_clr              ,
    input           [A_WTH -1:0]    cpu_addr                 ,
    input           [D_WTH -1:0]    cpu_data_in              ,
    output   reg    [D_WTH -1:0]    cpu_data_out_mmu         ,
    input                           cpu_rd                   ,
    input                           cpu_wr                    

);

/********************************************************************************************************************\
    parameters
\********************************************************************************************************************/
localparam  U_DLY       = 0             ;
/********************************************************************************************************************\
    signals
\********************************************************************************************************************/
wire  [31:0]                                 cpu_data_out_tx            ;
wire  [31:0]                                 cpu_data_out_rx            ;

    //with mmu_rx
wire                                         bd2rx_s_axis_rq_tlast      ;
wire  [511:0]                                bd2rx_s_axis_rq_tdata      ;
wire  [59:0]                                 bd2rx_s_axis_rq_tuser      ;
wire  [63:0]                                 bd2rx_s_axis_rq_tkeep      ;
wire                                         bd2rx_s_axis_rq_tready     ;
wire                                         bd2rx_s_axis_rq_tvalid     ;


//*********************************************************************************************************************
//    process
//*********************************************************************************************************************   
mmu_tx_inst #
    (
    .A_WTH                 ( 24         ),
    .D_WTH                 ( 32         ),
    .REG_MMU_TX_ID         ( REG_MMU_TX_ID   )

    )
u_mmu_tx_inst
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

    //with cpu
    .cnt_reg_clr                    ( cnt_reg_clr               ),
    .cpu_addr                       ( cpu_addr                  ),
    .cpu_data_in                    ( cpu_data_in               ),
    .cpu_data_out_tx                ( cpu_data_out_tx           ),
    .cpu_rd                         ( cpu_rd                    ),
    .cpu_wr                         ( cpu_wr                    )
    
);


mmu_rx_inst#
        (
         .REG_MMU_RX_ID         (   REG_MMU_RX_ID      ),
         .DDR_NUM               (   3'd4       ),
         .A_WTH                 (   24         ),
         .D_WTH                 (   32         )
         )
u_mmu_rx_inst
(
    //globe signals
    .clk_sys                        (clk_sys                    ),
    .rst                            (rst                        ),
                
    //BD signal with Kernel  
    .ker2mmu_bd_tlast               (ker2mmu_bd_tlast           ),
    .ker2mmu_bd_tdata               (ker2mmu_bd_tdata           ),
    .ker2mmu_bd_tuser               (ker2mmu_bd_tuser           ),
    .ker2mmu_bd_tkeep               (ker2mmu_bd_tkeep           ),
    .ker2mmu_bd_tvalid              (ker2mmu_bd_tvalid          ),
    .mmu2ker_bd_tready              (mmu2ker_bd_tready          ),                              
    //BD signal with mmu_tx
    .bd2rx_s_axis_rq_tlast          ( bd2rx_s_axis_rq_tlast     ),
    .bd2rx_s_axis_rq_tdata          ( bd2rx_s_axis_rq_tdata     ),
    .bd2rx_s_axis_rq_tuser          ( bd2rx_s_axis_rq_tuser     ),
    .bd2rx_s_axis_rq_tkeep          ( bd2rx_s_axis_rq_tkeep     ),
    .bd2rx_s_axis_rq_tready         ( bd2rx_s_axis_rq_tready    ),
    .bd2rx_s_axis_rq_tvalid         ( bd2rx_s_axis_rq_tvalid    ),

    //axi4 read addr with DDR CTRL	                                          
    .axi4m_ddr_arid                 (axi4m_ddr_arid             ),  
    .axi4m_ddr_araddr               (axi4m_ddr_araddr           ),
    .axi4m_ddr_arlen                (axi4m_ddr_arlen            ),
    .axi4m_ddr_arsize               (axi4m_ddr_arsize           ),
    .axi4m_ddr_arvalid              (axi4m_ddr_arvalid          ),
    .axi4m_ddr_arready              (axi4m_ddr_arready          ),
    
    .axi4m_ddr_rid                  (axi4m_ddr_rid              ),
    .axi4m_ddr_rdata                (axi4m_ddr_rdata            ),
    .axi4m_ddr_rresp                (axi4m_ddr_rresp            ),
    .axi4m_ddr_rlast                (axi4m_ddr_rlast            ),
    .axi4m_ddr_rvalid               (axi4m_ddr_rvalid           ),
    .axi4m_ddr_rready               (axi4m_ddr_rready           ), 

    //ae to ve pkt signal
    .ul2sh_pkt_tlast                (ul2sh_pkt_tlast            ),
    .ul2sh_pkt_tdata                (ul2sh_pkt_tdata            ),
    .ul2sh_pkt_tkeep                (ul2sh_pkt_tkeep            ),
    .ul2sh_pkt_tvalid               (ul2sh_pkt_tvalid           ),
    .sh2ul_pkt_tready               (sh2ul_pkt_tready           ), 

    //with cpu
    .cnt_reg_clr                    (cnt_reg_clr                ),
    .cpu_addr                       (cpu_addr                   ),
    .cpu_data_in                    (cpu_data_in                ),
    .cpu_data_out_vf                (cpu_data_out_rx            ),
    .cpu_rd                         (cpu_rd                     ),
    .cpu_wr                         (cpu_wr                     )   

);

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        cpu_data_out_mmu <= {D_WTH{1'b0}};
    end
    else begin
        case (cpu_addr[A_WTH-1:12])
            REG_MMU_TX_ID:            cpu_data_out_mmu <= cpu_data_out_tx;
            REG_MMU_RX_ID:            cpu_data_out_mmu <= cpu_data_out_rx;
            default: ;
        endcase
    end
end
        
endmodule
