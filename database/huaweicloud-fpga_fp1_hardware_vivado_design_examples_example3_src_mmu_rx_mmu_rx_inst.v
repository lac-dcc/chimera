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

module  mmu_rx_inst#
                  (
                    parameter    MAX_DDR_NUM           =        3'd4               ,
                    parameter    DDR_NUM               =        3'd1               ,
                    parameter    REG_MMU_RX_ID         =        12'd0              ,
                    parameter    A_WTH                 =        24                 ,
                    parameter    D_WTH                 =        32                
					
                  )

                 (
                 //globe signals
                 input                                  clk_sys                    ,
                 input                                  rst                        ,
                
                 //BD signal with Kernel  
                 input                                  ker2mmu_bd_tlast           ,
                 input   [511:0]                        ker2mmu_bd_tdata           ,
                 input   [74:0]                         ker2mmu_bd_tuser           ,
                 input   [63:0]                         ker2mmu_bd_tkeep           ,
                 input                                  ker2mmu_bd_tvalid          ,
                 output                                 mmu2ker_bd_tready          ,                               
                 //with mmu_tx
                 input                                  bd2rx_s_axis_rq_tlast      ,
                 input   [511:0]                        bd2rx_s_axis_rq_tdata      ,
                 input   [59:0]                         bd2rx_s_axis_rq_tuser      ,
                 input   [63:0]                         bd2rx_s_axis_rq_tkeep      ,
                 output                                 bd2rx_s_axis_rq_tready     ,
                 input                                  bd2rx_s_axis_rq_tvalid     ,

                 //axi4 read addr with DDR CTRL	                                                 
                 output  [4*DDR_NUM-1:0]                axi4m_ddr_arid             ,  
                 output  [64*DDR_NUM-1:0]               axi4m_ddr_araddr           ,
                 output  [8*DDR_NUM-1:0]                axi4m_ddr_arlen            ,
                 output  [3*DDR_NUM-1:0]                axi4m_ddr_arsize           ,
                 output  [DDR_NUM-1:0]                  axi4m_ddr_arvalid          ,
                 input   [DDR_NUM-1:0]                  axi4m_ddr_arready          ,
            
                 //axi4 read data with DDR CTRL 	                                 
                 input   [4*DDR_NUM-1:0]                axi4m_ddr_rid              ,
                 input   [512*DDR_NUM-1:0]              axi4m_ddr_rdata            ,
                 input   [2*DDR_NUM-1:0]                axi4m_ddr_rresp            ,
                 input   [DDR_NUM-1:0]                  axi4m_ddr_rlast            ,
                 input   [DDR_NUM-1:0]                  axi4m_ddr_rvalid           ,
                 output  [DDR_NUM-1:0]                  axi4m_ddr_rready           , 
              
                 //ae to ve pkt signal
                 output                                 ul2sh_pkt_tlast            ,
                 output  [511:0]                        ul2sh_pkt_tdata            ,
                 output  [63:0]                         ul2sh_pkt_tkeep            ,
                 output                                 ul2sh_pkt_tvalid           ,
                 input                                  sh2ul_pkt_tready           ,      
                 
                 //with cpu
                 input                                  cnt_reg_clr                ,
                 input   [A_WTH -1:0]                   cpu_addr                   ,
                 input   [D_WTH -1:0]                   cpu_data_in                ,
                 output  [D_WTH -1:0]                   cpu_data_out_vf            ,
                 input                                  cpu_rd                     ,                     
                 input                                  cpu_wr                     
  
                 );

/******************************************************************************\
                            signal 
\******************************************************************************/
wire      [3:0]                   eoc_tag_ren                ; 
wire      [3:0]                   eoc_tag_rdata              ;
wire      [3:0]                   eoc_tag_empty              ;
wire                              chn_seq_ren                ; 
wire      [1:0]                   chn_seq_rdata              ;
wire                              chn_seq_empty              ;
wire                              ve_ff_rd                   ; 
wire      [1:0]                   ve_ff_rport                ;
wire      [511:0]                 ve_ff_rdata                ;
wire      [3:0]                   ve_ff_empty                ;              

wire                              mmu_tx2rx_bd_wr            ; 
wire      [539:0]                 mmu_tx2rx_bd_wdata         ;
wire                              mmu_tx2rx_bd_afull         ; 

wire      [DDR_NUM-1:0]           rcmd_ff_full               ;       
wire      [DDR_NUM-1:0]           rcmd_ff_wen                ;

wire      [MAX_DDR_NUM-1:0]       rcmd_ff_full_que           ;       
wire      [MAX_DDR_NUM-1:0]       rcmd_ff_wen_que            ;

wire      [71:0]                  rcmd_ff_wdata              ; 

wire      [DDR_NUM-1:0]           pkt_back_full              ;       
wire      [DDR_NUM-1:0]           pkt_back_wen               ;
wire      [540*DDR_NUM-1:0]       pkt_back_wdata             ; 

wire      [MAX_DDR_NUM-1:0]       pkt_back_full_que          ;       
wire      [MAX_DDR_NUM-1:0]       pkt_back_wen_que           ;
wire      [540*MAX_DDR_NUM-1:0]   pkt_back_wdata_que         ; 

wire      [31:0]                  reg_mmu_rxbd_sta           ; 
wire      [31:0]                  reg_mmu_rxbd_err           ; 
wire                              reg_mmu_rxbd_en            ; 
wire                              reg_mmu_rdcmd_en           ; 
wire                              axis_fifo_rd               ; 
wire                              bd2rx_axis_fifo_rd         ; 
wire                              read_op_vld                ; 
wire                              write_op_vld               ; 

wire      [3:0]                   reg_mmu_rxpkt_en           ; 
wire                              reg_mmu_txpkt_en           ; 
wire                              reg_add_hacc_en            ; 
wire                              reg_write_ddr_bd           ; 
wire      [31:0]                  reg_mmu_rxpkt_sta          ; 
wire      [31:0]                  reg_mmu_rxpkt_sta1         ; 
wire      [31:0]                  reg_mmu_rxpkt_err          ; 
                 
wire      [3:0]                   bucket_inc_wr              ; 
wire      [13:0]                  bucket_inc_wdata           ; 
wire      [3:0]                   bucket_af                  ;                
wire      [7:0]                   reg_timer_1us_cfg          ;
wire      [15:0]                  reg_tmout_us_cfg           ;
wire      [4*MAX_DDR_NUM-1:0]     reg_axi_tmout_err          ; 
wire      [4*DDR_NUM-1:0]         reg_axi_tmout_err_tmp      ; 
wire      [31:0]                  reg_mmu_rx_cfg             ;
wire      [31:0]                  reg_eoc_tag_ff_stat        ; 

  
genvar i ;
/******************************************************************************\
                            process
\******************************************************************************/
assign pkt_back_wen_que    = {{(MAX_DDR_NUM-DDR_NUM){1'b0}},pkt_back_wen}; 
assign pkt_back_full       = pkt_back_full_que[DDR_NUM-1:0]; 
assign pkt_back_wdata_que  = {{(MAX_DDR_NUM-DDR_NUM){540'd0}},pkt_back_wdata}; 

assign rcmd_ff_wen         = rcmd_ff_wen_que[DDR_NUM-1:0]; 
assign rcmd_ff_full_que    = {{(MAX_DDR_NUM-DDR_NUM){1'b0}},rcmd_ff_full};

assign reg_axi_tmout_err   = {{(MAX_DDR_NUM-DDR_NUM){4'd0}},reg_axi_tmout_err_tmp}; 

/******************************************************************************\
                            instance
\******************************************************************************/
generate
    for (i = 0; i<DDR_NUM; i=i+1 ) begin : GEN_AXI4M_READ_ADP
    
       axi4m_rd_adp u_axi4m_rd_adp
          (
           .aclk                    (clk_sys                                ),
           .areset                  (rst                                    ), 
                                    
           .rcmd_ff_full            (rcmd_ff_full[i]                        ),       
           .rcmd_ff_wen             (rcmd_ff_wen[i]                         ),
           .rcmd_ff_wdata           (rcmd_ff_wdata                          ), 
                                                           
           .pkt_back_full           (pkt_back_full[i]                       ),       
           .pkt_back_wen            (pkt_back_wen[i]                        ),
           .pkt_back_wdata          (pkt_back_wdata[540*(i+1)-1:540*i]      ), 
                                                           
           .arid                    (axi4m_ddr_arid[4*(i+1)-1:4*i]          ),  
           .araddr                  (axi4m_ddr_araddr[64*(i+1)-1:64*i]      ),
           .arlen                   (axi4m_ddr_arlen[8*(i+1)-1:8*i]         ),
           .arsize                  (axi4m_ddr_arsize[3*(i+1)-1:3*i]        ),
           .arvalid                 (axi4m_ddr_arvalid[i]                   ),
           .arready                 (axi4m_ddr_arready[i]                   ),
           .reg_tmout_us_cfg        (reg_tmout_us_cfg                       ), 
           .reg_axi_tmout_err       (reg_axi_tmout_err_tmp[4*(i+1)-1:4*i]   ), 
           .rid                     (axi4m_ddr_rid[4*(i+1)-1:4*i]           ),
           .rdata                   (axi4m_ddr_rdata[512*(i+1)-1:512*i]     ),
           .rresp                   (axi4m_ddr_rresp[2*(i+1)-1:2*i]         ),
           .rlast                   (axi4m_ddr_rlast[i]                     ),
           .rvalid                  (axi4m_ddr_rvalid[i]                    ),
           .rready                  (axi4m_ddr_rready[i]                    )
          );
    
    end
endgenerate

mmu_rx_pkt u_mmu_rx_pkt
(
   .clk_sys                  (clk_sys                ),
   .rst                      (rst                    ),
                                                     
   .eoc_tag_ren              (eoc_tag_ren            ), 
   .eoc_tag_rdata            (eoc_tag_rdata          ),
   .eoc_tag_empty            (eoc_tag_empty          ),
                                                     
   .chn_seq_ren              (chn_seq_ren            ), 
   .chn_seq_rdata            (chn_seq_rdata          ),
   .chn_seq_empty            (chn_seq_empty          ),
                                                     
   .ve_ff_rd                 (ve_ff_rd               ), 
   .ve_ff_rport              (ve_ff_rport            ),
   .ve_ff_rdata              (ve_ff_rdata            ),
   .ve_ff_empty              (ve_ff_empty            ),     
                                                     
   .pkt_back_full_que        (pkt_back_full_que      ),       
   .pkt_back_wen_que         (pkt_back_wen_que       ),
   .pkt_back_wdata_que       (pkt_back_wdata_que     ), 
 
   .bucket_inc_wr            (bucket_inc_wr          ),                                                  
   .bucket_inc_wdata         (bucket_inc_wdata       ),                                                 
   .bucket_af                (bucket_af              ),                                                  
   .mmu_tx2rx_bd_wr          (mmu_tx2rx_bd_wr        ),                                                  
   .mmu_tx2rx_bd_wdata       (mmu_tx2rx_bd_wdata     ),                                                  
   .mmu_tx2rx_bd_afull       (mmu_tx2rx_bd_afull     ),                                                  

   .reg_tmout_us_cfg         (reg_tmout_us_cfg       ), 
   .reg_mmu_rx_cfg           (reg_mmu_rx_cfg         ),
   .reg_timer_1us_cfg        (reg_timer_1us_cfg      ),
   .reg_mmu_rxpkt_en         (reg_mmu_rxpkt_en       ),        
   .reg_mmu_txpkt_en         (reg_mmu_txpkt_en       ),     
   .add_hacc_en_5dly         (reg_add_hacc_en        ),     
   .write_ddr_rd_bd_4dly     (reg_write_ddr_bd       ),     
   .reg_mmu_rxpkt_sta        (reg_mmu_rxpkt_sta      ),
   .reg_mmu_rxpkt_sta1       (reg_mmu_rxpkt_sta1     ),
   .reg_mmu_rxpkt_err        (reg_mmu_rxpkt_err      ),
        
   .ul2sh_pkt_tlast          (ul2sh_pkt_tlast        ),
   .ul2sh_pkt_tdata          (ul2sh_pkt_tdata        ),
   .ul2sh_pkt_tkeep          (ul2sh_pkt_tkeep        ),
   .ul2sh_pkt_tvalid         (ul2sh_pkt_tvalid       ),
   .sh2ul_pkt_tready         (sh2ul_pkt_tready       )     
);

mmu_rx_bd u_mmu_rx_bd
    (
    .clk_sys                 (clk_sys               ),
    .rst                     (rst                   ),
                                                    
    .ker2mmu_bd_tlast        (ker2mmu_bd_tlast      ),
    .ker2mmu_bd_tdata        (ker2mmu_bd_tdata      ),
    .ker2mmu_bd_tuser        (ker2mmu_bd_tuser      ),
    .ker2mmu_bd_tkeep        (ker2mmu_bd_tkeep      ),
    .ker2mmu_bd_tvalid       (ker2mmu_bd_tvalid     ),
    .mmu2ker_bd_tready       (mmu2ker_bd_tready     ),                               

    //BD signal with mmu_tx
    .bd2rx_s_axis_rq_tlast   (bd2rx_s_axis_rq_tlast ),
    .bd2rx_s_axis_rq_tdata   (bd2rx_s_axis_rq_tdata ),
    .bd2rx_s_axis_rq_tuser   (bd2rx_s_axis_rq_tuser ),
    .bd2rx_s_axis_rq_tkeep   (bd2rx_s_axis_rq_tkeep ),
    .bd2rx_s_axis_rq_tready  (bd2rx_s_axis_rq_tready),
    .bd2rx_s_axis_rq_tvalid  (bd2rx_s_axis_rq_tvalid),
                              
    .eoc_tag_ren             (eoc_tag_ren           ), 
    .eoc_tag_rdata           (eoc_tag_rdata         ),
    .eoc_tag_empty           (eoc_tag_empty         ),
                              
    .chn_seq_ren             (chn_seq_ren           ), 
    .chn_seq_rdata           (chn_seq_rdata         ),
    .chn_seq_empty           (chn_seq_empty         ),
                              
    .ve_ff_rd                (ve_ff_rd              ), 
    .ve_ff_rport             (ve_ff_rport           ),
    .ve_ff_rdata             (ve_ff_rdata           ),
    .ve_ff_empty             (ve_ff_empty           ),              
   
    .bucket_inc_wr           (bucket_inc_wr         ),                                                  
    .bucket_inc_wdata        (bucket_inc_wdata      ),                                                 
    .bucket_af               (bucket_af             ),                                                  
    .mmu_tx2rx_bd_wr         (mmu_tx2rx_bd_wr       ),                                                  
    .mmu_tx2rx_bd_wdata      (mmu_tx2rx_bd_wdata    ),                                                  
    .mmu_tx2rx_bd_afull      (mmu_tx2rx_bd_afull     ),                                                  
    .axis_fifo_rd            (axis_fifo_rd           ),                                                  
    .bd2rx_axis_fifo_rd      (bd2rx_axis_fifo_rd     ),                                                  
    .read_op_vld_dly         (read_op_vld            ),                                                  
    .write_op_vld_dly        (write_op_vld           ),                                                  
 
    .reg_mmu_rxbd_sta        (reg_mmu_rxbd_sta      ), 
    .reg_mmu_rxbd_err        (reg_mmu_rxbd_err      ),  
    .reg_mmu_rxbd_en         (reg_mmu_rxbd_en       ),   
    .reg_mmu_rdcmd_en        (reg_mmu_rdcmd_en      ),   
    .reg_eoc_tag_ff_stat     (reg_eoc_tag_ff_stat   ),                          
    .rcmd_ff_full_que        (rcmd_ff_full_que      ),       
    .rcmd_ff_wen_que         (rcmd_ff_wen_que       ),
    .rcmd_ff_wdata           (rcmd_ff_wdata         )

);

reg_mmu_rx #(
             .A_WTH         (A_WTH             ),
             .D_WTH         (D_WTH             ),
             .REG_MMU_RX_ID (REG_MMU_RX_ID     ) 
             )
u_reg_mmu_rx
            (
             .clk_sys                  (clk_sys                ),
             .rst                      (rst                    ),
             .reg_mmu_txpkt_en         (reg_mmu_txpkt_en       ),     
             .reg_add_hacc_en          (reg_add_hacc_en        ),     
             .reg_write_ddr_bd         (reg_write_ddr_bd       ),     
             .axis_fifo_rd             (axis_fifo_rd           ),                                                  
             .bd2rx_axis_fifo_rd       (bd2rx_axis_fifo_rd     ),                                                  
             .read_op_vld              (read_op_vld            ),                                                  
             .write_op_vld             (write_op_vld           ),                                                  
             .reg_mmu_rxbd_en          (reg_mmu_rxbd_en        ),
             .reg_mmu_rdcmd_en         (reg_mmu_rdcmd_en       ),   
             .reg_mmu_rxpkt_en         (reg_mmu_rxpkt_en       ),
             .reg_mmu_rxbd_sta         (reg_mmu_rxbd_sta       ),
             .reg_mmu_rxpkt_sta        (reg_mmu_rxpkt_sta      ),
             .reg_mmu_rxpkt_sta1       (reg_mmu_rxpkt_sta1     ),
             .reg_mmu_rxbd_err         (reg_mmu_rxbd_err       ),
             .reg_eoc_tag_ff_stat      (reg_eoc_tag_ff_stat    ),                          
             .reg_mmu_rxpkt_err        (reg_mmu_rxpkt_err      ),
             .reg_axi_tmout_err        (reg_axi_tmout_err      ),
             .reg_timer_1us_cfg        (reg_timer_1us_cfg      ),
             .reg_mmu_rx_cfg           (reg_mmu_rx_cfg         ),
             .reg_tmout_us_cfg         (reg_tmout_us_cfg       ), 
             .cnt_reg_clr              (cnt_reg_clr            ),
             .cpu_addr                 (cpu_addr               ),
             .cpu_data_in              (cpu_data_in            ),
             .cpu_data_out_vf          (cpu_data_out_vf        ),
             .cpu_rd                   (cpu_rd                 ),
             .cpu_wr                   (cpu_wr                 ) 
            );
endmodule
