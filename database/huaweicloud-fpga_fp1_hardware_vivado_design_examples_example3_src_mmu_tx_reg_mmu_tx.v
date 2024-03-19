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

module reg_mmu_tx #
                  (
                  parameter    A_WTH              =     24                    ,
                  parameter    D_WTH              =     32                    ,
                  parameter    MAX_DDR_NUM        =     4                     ,
                  parameter    DDR_NUM            =     4                     ,
                  parameter    MMU_TX_CM_ID       =     12'h001                
                  )
                 (
                 //globe signals
                 input                            clk_sys                     ,
                 input                            rst                         ,

                 //cfg
                 output       [10:0]              reg_mmu_tx_online_beat      ,
                 //sta
                 input  wire  [15:0]              tx_bd_sta                   ,
                 input  wire  [15:0]              tx_bd_err                   ,
                 input  wire  [10:0]              mmu_tx_online_beat          ,
                 input        [31:0]              reg_mmu_tx_pkt_sta          ,
                 //err
                 input        [31:0]              reg_mmu_tx_pkt_err          ,

                 input        [10:0]              reg_hacc_sn                 ,
                 input        [35:0]              reg_hacc_ddr_saddr          ,
                 input        [35:0]              reg_hacc_ddr_daddr          ,
                 input        [64*MAX_DDR_NUM-1:0]reg_ddr_wr_addr             ,
                 input        [8*MAX_DDR_NUM-1:0] reg_ddr_wr_length           ,
                 input        [10:0]              reg_ddr_rsp_sn              ,
                 input        [2:0]               reg_seq_info                ,

                 //cnt
                 input                            reg_mmu_tx_cnt_en           ,
                 input                            wr_ddr_rsp_en               ,
                 input                            stxqm2inq_fifo_rd           ,
                 input                            ppm2stxm_rxffc_wr           ,
                 input                            tx2kernel_bd_wen            ,
                 input                            mmu_tx2rx_bd_wen            ,
                 input                            mmu_tx2rx_wr_bd_wen         ,
                 input                            mmu_tx2rx_rd_bd_wen         ,

                 input                            reg_axis_receive_cnt_en     ,
                 input                            reg_hacc_receive_cnt_en     ,
                 input                            reg_pkt_receive_cnt_en      ,
                 input        [1*MAX_DDR_NUM-1:0] reg_axi4_send_slice_cnt_en  ,
                 input        [1*MAX_DDR_NUM-1:0] reg_axi4_send_ok_cnt_en     ,
                 input        [1*MAX_DDR_NUM-1:0] reg_ddr_rsp_ok_cnt_en       ,
                 input        [1*MAX_DDR_NUM-1:0] reg_axi4_send_wlast_cnt_en  ,

                 //with cpu
                 input                            cnt_reg_clr                 ,
                 input        [A_WTH -1:0]        cpu_addr                    ,
                 input        [D_WTH -1:0]        cpu_data_in                 ,
                 output  reg  [D_WTH -1:0]        cpu_data_out_pf             ,
                 input                            cpu_rd                      ,
                 input                            cpu_wr                       
                 );

/*********************************************************************************************************************\
    signals
\*********************************************************************************************************************/
reg        [31:0]           cpu_data_out_cfg_pf      ;
reg        [31:0]           cpu_data_out_err_pf      ;
reg        [31:0]           cpu_data_out_sts_pf      ;
reg        [31:0]           cpu_data_out_cnt_pf      ; 

//cfg
wire       [31:0]           cpu_data_pf_out000       ;

//err
wire       [31:0]           cpu_data_pf_out080       ;
wire       [31:0]           cpu_data_pf_out081       ;

//sta
wire       [31:0]           cpu_data_pf_out100       ;
wire       [31:0]           cpu_data_pf_out101       ;
wire       [31:0]           cpu_data_pf_out102       ;
wire       [31:0]           cpu_data_pf_out103       ;
wire       [31:0]           cpu_data_pf_out104       ;
wire       [31:0]           cpu_data_pf_out105       ;
wire       [31:0]           cpu_data_pf_out106       ;
wire       [31:0]           cpu_data_pf_out107       ;
wire       [31:0]           cpu_data_pf_out108       ;
wire       [31:0]           cpu_data_pf_out109       ;
wire       [31:0]           cpu_data_pf_out10a       ;
wire       [31:0]           cpu_data_pf_out10b       ;
wire       [31:0]           cpu_data_pf_out10c       ;
wire       [31:0]           cpu_data_pf_out10d       ;
wire       [31:0]           cpu_data_pf_out10e       ;
wire       [31:0]           cpu_data_pf_out10f       ;

//cnt
wire       [31:0]           cpu_data_pf_out180       ;
wire       [31:0]           cpu_data_pf_out181       ;
wire       [31:0]           cpu_data_pf_out182       ;
wire       [31:0]           cpu_data_pf_out183       ;
wire       [31:0]           cpu_data_pf_out184       ;
wire       [31:0]           cpu_data_pf_out185       ;
wire       [31:0]           cpu_data_pf_out186       ;
wire       [31:0]           cpu_data_pf_out187       ;
wire       [31:0]           cpu_data_pf_out188       ;
wire       [31:0]           cpu_data_pf_out189       ;
wire       [31:0]           cpu_data_pf_out18a       ;
wire       [31:0]           cpu_data_pf_out18b       ;
wire       [31:0]           cpu_data_pf_out18c       ;
wire       [31:0]           cpu_data_pf_out18d       ;
wire       [31:0]           cpu_data_pf_out18e       ;
wire       [31:0]           cpu_data_pf_out18f       ;
wire       [31:0]           cpu_data_pf_out190       ;
wire       [31:0]           cpu_data_pf_out191       ;
wire       [31:0]           cpu_data_pf_out192       ;
wire       [31:0]           cpu_data_pf_out193       ;
wire       [31:0]           cpu_data_pf_out194       ;
wire       [31:0]           cpu_data_pf_out195       ;
wire       [31:0]           cpu_data_pf_out196       ;
wire       [31:0]           cpu_data_pf_out197       ;
wire       [31:0]           cpu_data_pf_out198       ;
wire       [31:0]           cpu_data_pf_out199       ;
wire       [31:0]           cpu_data_pf_out19a       ;

//********************************************************************************************************************
//    cfg
//********************************************************************************************************************
rw_reg_inst
    #(
    .ADDR_WIDTH(24),
    .VLD_WIDTH(11 ),                          
    .INIT_DATA(11'h350)                 
    )
    u_reg_bp_mux_cfg                      
    (
    .clks               ( clk_sys                   ),  
    .reset              ( rst                       ),  
    .cpu_data_in        ( cpu_data_in               ),  
    .cpu_data_out       ( cpu_data_pf_out000        ), 
    .cpu_addr           ( cpu_addr                  ),  
    .cpu_wr             ( cpu_wr                    ),  
    .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h000}),  
    .dout               ( reg_mmu_tx_online_beat    )   
    );

//********************************************************************************************************************
//    err
//********************************************************************************************************************
err_wc_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)
         )
    inst_reg_pkt_err                                      
     (
     .clk                ( clk_sys                  ),       
     .reset              ( rst                      ),       

     .cpu_data_out       ( cpu_data_pf_out080       ),       
     .cpu_data_in        ( cpu_data_in              ),       
     .cpu_addr           ( cpu_addr                 ),       
     .cpu_wr             ( cpu_wr                   ),       
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h080}),      
     .err_flag_in        ( reg_mmu_tx_pkt_err       )        
     );

err_wc_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)
         )
    inst_reg_bd_err                                      
     (
     .clk                ( clk_sys                  ),       
     .reset              ( rst                      ),       

     .cpu_data_out       ( cpu_data_pf_out081       ),       
     .cpu_data_in        ( cpu_data_in              ),       
     .cpu_addr           ( cpu_addr                 ),       
     .cpu_wr             ( cpu_wr                   ),       
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h081}),      
     .err_flag_in        ( {16'd0,tx_bd_err}       )        
     );


//********************************************************************************************************************
//    sta
//********************************************************************************************************************
ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_tx_pkt_sta                                     
     (
     .cpu_data_out       ( cpu_data_pf_out100       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h100}),   
     .din                ( reg_mmu_tx_pkt_sta       )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_bd_sta                                     
     (
     .cpu_data_out       ( cpu_data_pf_out101       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h101}),   
     .din                ( {16'd0,tx_bd_sta}         )    
     );



ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_hacc_ddr_saddr                                     
     (
     .cpu_data_out       ( cpu_data_pf_out102       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h102}),   
     .din                ( reg_hacc_ddr_saddr[31:0] )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_hacc_ddr_daddr                                     
     (
     .cpu_data_out       ( cpu_data_pf_out103       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h103}),   
     .din                ( reg_hacc_ddr_daddr[31:0] )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_ddr_wr_addr0                                     
     (
     .cpu_data_out       ( cpu_data_pf_out104       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h104}),   
     .din                ( reg_ddr_wr_addr[31:0]    )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_ddr_wr_addr1                                     
     (
     .cpu_data_out       ( cpu_data_pf_out105       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h105}),   
     .din                ( reg_ddr_wr_addr[95:64]   )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_ddr_wr_addr2                                     
     (
     .cpu_data_out       ( cpu_data_pf_out106       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h106}),   
     .din                ( reg_ddr_wr_addr[159:128] )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_ddr_wr_addr3                                     
     (
     .cpu_data_out       ( cpu_data_pf_out107       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h107}),   
     .din                ( reg_ddr_wr_addr[223:192] )    
     );


ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(8)                                    
         )
     inst_reg_ddr_wr_length0                                     
     (
     .cpu_data_out       ( cpu_data_pf_out108       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h108}),   
     .din                ( reg_ddr_wr_length[7:0]   )    
     );  

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(8)                                    
         )
     inst_reg_ddr_wr_length1                                     
     (
     .cpu_data_out       ( cpu_data_pf_out109       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h109}),   
     .din                ( reg_ddr_wr_length[15:8]  )    
     );  

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(8)                                    
         )
     inst_reg_ddr_wr_length2                                     
     (
     .cpu_data_out       ( cpu_data_pf_out10a       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h10a}),   
     .din                ( reg_ddr_wr_length[23:16] )    
     );  

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(8)                                    
         )
     inst_reg_ddr_wr_length3                                     
     (
     .cpu_data_out       ( cpu_data_pf_out10b       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h10b}),   
     .din                ( reg_ddr_wr_length[31:24] )    
     );  


ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(11)                                    
         )
     inst_reg_ddr_rsp_sn                                     
     (
     .cpu_data_out       ( cpu_data_pf_out10c       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h10c}),   
     .din                ( reg_ddr_rsp_sn           )    
     );    

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(3)                                    
         )
     inst_reg_seq_info                                     
     (
     .cpu_data_out       ( cpu_data_pf_out10d       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h10d}),   
     .din                ( reg_seq_info             )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(16)                                    
         )
     u_mmu_tx_online_beat                                     
     (
     .cpu_data_out       ( cpu_data_pf_out10e       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h10e}),   
     .din                ( {5'd0,mmu_tx_online_beat})    
     ); 

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(11)                                    
         )
     inst_reg_hacc_sn                                     
     (
     .cpu_data_out       ( cpu_data_pf_out10f       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h10f}),   
     .din                ( reg_hacc_sn              )    
     );


//********************************************************************************************************************
//    cnt
//********************************************************************************************************************
cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_txqm_bd_cnt_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out180       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h180}),     
     .cnt_reg_inc        ( reg_mmu_tx_cnt_en        ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_stxqm2inq_fifo_rd
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out181       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h181}),     
     .cnt_reg_inc        ( stxqm2inq_fifo_rd        ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_ppm2stxm_rxffc_wr
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out182       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h182}),     
     .cnt_reg_inc        ( ppm2stxm_rxffc_wr        ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_wr_ddr_rsp_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out183       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h183}),     
     .cnt_reg_inc        ( wr_ddr_rsp_en            ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_tx2kernel_bd_wen
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out184       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h184}),     
     .cnt_reg_inc        ( tx2kernel_bd_wen         ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );
cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axis_receive_cnt_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out185       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h185}),     
     .cnt_reg_inc        ( reg_axis_receive_cnt_en  ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_hacc_receive_cnt_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out186       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h186}),     
     .cnt_reg_inc        ( reg_hacc_receive_cnt_en  ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_pkt_receive_cnt_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out187       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h187}),     
     .cnt_reg_inc        ( reg_pkt_receive_cnt_en   ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_send_slice_cnt_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out188       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h188}),     
     .cnt_reg_inc        ( reg_axi4_send_slice_cnt_en[0]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_send_slice_cnt_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out189       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h189}),     
     .cnt_reg_inc        ( reg_axi4_send_slice_cnt_en[1]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_send_slice_cnt_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out18a       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h18a}),     
     .cnt_reg_inc        ( reg_axi4_send_slice_cnt_en[2]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );


cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_send_slice_cnt_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out18b       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h18b}),     
     .cnt_reg_inc        ( reg_axi4_send_slice_cnt_en[3]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );


cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_send_ok_cnt_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out18c       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h18c}),     
     .cnt_reg_inc        ( reg_axi4_send_ok_cnt_en[0]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_send_ok_cnt_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out18d       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h18d}),     
     .cnt_reg_inc        ( reg_axi4_send_ok_cnt_en[1]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_send_ok_cnt_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out18e       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h18e}),     
     .cnt_reg_inc        ( reg_axi4_send_ok_cnt_en[2]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );


cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_send_ok_cnt_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out18f       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h18f}),     
     .cnt_reg_inc        ( reg_axi4_send_ok_cnt_en[3]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );


cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_ddr_rsp_ok_cnt_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out190       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h190}),     
     .cnt_reg_inc        ( reg_ddr_rsp_ok_cnt_en[0]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_ddr_rsp_ok_cnt_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out191       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h191}),     
     .cnt_reg_inc        ( reg_ddr_rsp_ok_cnt_en[1]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_ddr_rsp_ok_cnt_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out192       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h192}),     
     .cnt_reg_inc        ( reg_ddr_rsp_ok_cnt_en[2]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );


cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_ddr_rsp_ok_cnt_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out193       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h193}),     
     .cnt_reg_inc        ( reg_ddr_rsp_ok_cnt_en[3]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_send_wlast_cnt_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out194       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h194}),     
     .cnt_reg_inc        ( reg_axi4_send_wlast_cnt_en[0]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_send_wlast_cnt_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out195       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h195}),     
     .cnt_reg_inc        ( reg_axi4_send_wlast_cnt_en[1]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_send_wlast_cnt_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out196       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h196}),     
     .cnt_reg_inc        ( reg_axi4_send_wlast_cnt_en[2]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_send_wlast_cnt_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out197       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h197}),     
     .cnt_reg_inc        ( reg_axi4_send_wlast_cnt_en[3]),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );     

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_mmu_tx2rx_bd_wen
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out198       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h198}),     
     .cnt_reg_inc        ( mmu_tx2rx_bd_wen         ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_mmu_tx2rx_wr_bd_wen
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out199       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h199}),     
     .cnt_reg_inc        ( mmu_tx2rx_wr_bd_wen      ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_mmu_tx2rx_rd_bd_wen
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out19a       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {MMU_TX_CM_ID,3'd0,9'h19a}),     
     .cnt_reg_inc        ( mmu_tx2rx_rd_bd_wen      ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );



//********************************************************************************************************************
always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1)
        cpu_data_out_cfg_pf <=  32'd0;
    else
    begin
        casez (cpu_addr[6:0])
           7'h00: cpu_data_out_cfg_pf <= cpu_data_pf_out000;
         default: cpu_data_out_cfg_pf <= 32'd0;
        endcase
    end
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        cpu_data_out_err_pf <=  32'd0;
    end
    else begin
        casez(cpu_addr[6:0])
           7'h00: cpu_data_out_err_pf <= cpu_data_pf_out080;
           7'h01: cpu_data_out_err_pf <= cpu_data_pf_out081;
         default: cpu_data_out_err_pf <= 32'd0;
        endcase
    end
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        cpu_data_out_sts_pf <=  32'd0;
    end
    else begin
       casez(cpu_addr[6:0])
           7'h00: cpu_data_out_sts_pf <= cpu_data_pf_out100;
           7'h01: cpu_data_out_sts_pf <= cpu_data_pf_out101;
           7'h02: cpu_data_out_sts_pf <= cpu_data_pf_out102;
           7'h03: cpu_data_out_sts_pf <= cpu_data_pf_out103;
           7'h04: cpu_data_out_sts_pf <= cpu_data_pf_out104;
           7'h05: cpu_data_out_sts_pf <= cpu_data_pf_out105;
           7'h06: cpu_data_out_sts_pf <= cpu_data_pf_out106;           
           7'h07: cpu_data_out_sts_pf <= cpu_data_pf_out107;           
           7'h08: cpu_data_out_sts_pf <= cpu_data_pf_out108;           
           7'h09: cpu_data_out_sts_pf <= cpu_data_pf_out109;           
           7'h0a: cpu_data_out_sts_pf <= cpu_data_pf_out10a;           
           7'h0b: cpu_data_out_sts_pf <= cpu_data_pf_out10b;           
           7'h0c: cpu_data_out_sts_pf <= cpu_data_pf_out10c;           
           7'h0d: cpu_data_out_sts_pf <= cpu_data_pf_out10d;           
           7'h0e: cpu_data_out_sts_pf <= cpu_data_pf_out10e;           
           7'h0f: cpu_data_out_sts_pf <= cpu_data_pf_out10f;           
         default: cpu_data_out_sts_pf <= 32'd0;
       endcase
    end
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        cpu_data_out_cnt_pf <=  32'd0;
    end
    else begin
       casez(cpu_addr[6:0])
           7'h00: cpu_data_out_cnt_pf <= cpu_data_pf_out180;
           7'h01: cpu_data_out_cnt_pf <= cpu_data_pf_out181;
           7'h02: cpu_data_out_cnt_pf <= cpu_data_pf_out182;
           7'h03: cpu_data_out_cnt_pf <= cpu_data_pf_out183;
           7'h04: cpu_data_out_cnt_pf <= cpu_data_pf_out184;
           7'h05: cpu_data_out_cnt_pf <= cpu_data_pf_out185;
           7'h06: cpu_data_out_cnt_pf <= cpu_data_pf_out186;
           7'h07: cpu_data_out_cnt_pf <= cpu_data_pf_out187;
           7'h08: cpu_data_out_cnt_pf <= cpu_data_pf_out188;
           7'h09: cpu_data_out_cnt_pf <= cpu_data_pf_out189;
           7'h0a: cpu_data_out_cnt_pf <= cpu_data_pf_out18a;
           7'h0b: cpu_data_out_cnt_pf <= cpu_data_pf_out18b;
           7'h0c: cpu_data_out_cnt_pf <= cpu_data_pf_out18c;
           7'h0d: cpu_data_out_cnt_pf <= cpu_data_pf_out18d;
           7'h0e: cpu_data_out_cnt_pf <= cpu_data_pf_out18e;
           7'h0f: cpu_data_out_cnt_pf <= cpu_data_pf_out18f;
           7'h10: cpu_data_out_cnt_pf <= cpu_data_pf_out190;
           7'h11: cpu_data_out_cnt_pf <= cpu_data_pf_out191;
           7'h12: cpu_data_out_cnt_pf <= cpu_data_pf_out192;
           7'h13: cpu_data_out_cnt_pf <= cpu_data_pf_out193;           
           7'h14: cpu_data_out_cnt_pf <= cpu_data_pf_out194;           
           7'h15: cpu_data_out_cnt_pf <= cpu_data_pf_out195;           
           7'h16: cpu_data_out_cnt_pf <= cpu_data_pf_out196;           
           7'h17: cpu_data_out_cnt_pf <= cpu_data_pf_out197;           
           7'h18: cpu_data_out_cnt_pf <= cpu_data_pf_out198;           
           7'h19: cpu_data_out_cnt_pf <= cpu_data_pf_out199;           
           7'h1a: cpu_data_out_cnt_pf <= cpu_data_pf_out19a;           
         default: cpu_data_out_cnt_pf <= 32'd0;
       endcase
    end
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        cpu_data_out_pf <=  32'd0;
    end
    else begin
        casez (cpu_addr[9:7])
            3'h0: cpu_data_out_pf <= cpu_data_out_cfg_pf;
            3'h1: cpu_data_out_pf <= cpu_data_out_err_pf;
            3'h2: cpu_data_out_pf <= cpu_data_out_sts_pf;
            3'h3: cpu_data_out_pf <= cpu_data_out_cnt_pf;
         default: cpu_data_out_pf <= 32'd0;
        endcase
    end
end

endmodule
