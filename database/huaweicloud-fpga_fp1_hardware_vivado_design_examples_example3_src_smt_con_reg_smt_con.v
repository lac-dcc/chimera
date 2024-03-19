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

module reg_smt_con #
                  (
                  parameter    A_WTH              =     24                    ,
                  parameter    D_WTH              =     32                    ,
                  parameter    MAX_DDR_NUM        =     4                     ,
                  parameter    DDR_NUM            =     4                     ,
                  parameter    REG_MMU_CONNECT_ID =     12'h001                
                  )
                 (
                 //globe signals
                 input                           clk_sys                     ,
                 input                           rst                         ,
                 //state
                 input wire [31:0]               tx2ddr_cfifo_stat           ,
                 input wire [31:0]               tx2ddr_dfifo_stat           ,
                 input wire [31:0]               kernel2ddr_cfifo_stat       ,
                 input wire [31:0]               kernel2ddr_dfifo_stat       ,
                 input wire [31:0]               ddr_cfifo_stat              ,
                 input wire [31:0]               ddr_dfifo_stat              ,
                 input wire [31:0]               sel_cfifo_stat              ,
                 input wire [55:0]               fifo_state                  ,
                 input wire [32*MAX_DDR_NUM-1:0] reg_cont_rd_sta             ,
                 input wire [32*MAX_DDR_NUM-1:0] reg_cont_rd_err             ,
                 //cnt
                 input wire [3:0]                axi4_s2m_rsp_ok_cnt_en      ,               
                 input wire [3:0]                axi4_s2m_rsp_exok_cnt_en    ,               
                 input wire [3:0]                axi4_s2m_rsp_slverr_cnt_en  ,               
                 input wire [3:0]                axi4_s2m_rsp_decerr_cnt_en  ,               
                 input wire [3:0]                tx2ddr_cfifo_cnt_en         ,               
                 input wire [3:0]                tx2ddr_dfifo_eop_cnt_en     ,               
                 input wire [3:0]                kernel2ddr_cfifo_cnt_en     ,               
                 input wire [3:0]                kernel2ddr_dfifo_eop_cnt_en ,               
                 input wire [3:0]                ddr2tx_bvalid_cnt_en        ,               
                 input wire [3:0]                ddr2kernel_bvalid_cnt_en    ,               
                 input wire [3:0]                pkt_fifo_rdata_sop_cnt_en   ,

                 input wire [MAX_DDR_NUM-1:0]    reg_cont_rcmd_en            , 
                 input wire [MAX_DDR_NUM-1:0]    reg_cont_rpkt_en            ,

                 input wire                      reg_axi4_sl_tran_cnt_en     , 
                 input wire                      reg_axi4_sl_frm_cnt_en      , 
                 input wire                      reg_axi4_sl_wr_cnt_en       , 
                 input wire [7:0]                reg_axi4_sl_fsm_state       , 
                 //err
                 
                 //cfg
                 
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
wire       [31:0]           cpu_data_pf_out082       ;
wire       [31:0]           cpu_data_pf_out083       ;
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
wire       [31:0]           cpu_data_pf_out19b       ;
wire       [31:0]           cpu_data_pf_out19c       ;
wire       [31:0]           cpu_data_pf_out19d       ;
wire       [31:0]           cpu_data_pf_out19e       ;
wire       [31:0]           cpu_data_pf_out19f       ;
wire       [31:0]           cpu_data_pf_out1a0       ;
wire       [31:0]           cpu_data_pf_out1a1       ;
wire       [31:0]           cpu_data_pf_out1a2       ;
wire       [31:0]           cpu_data_pf_out1a3       ;
wire       [31:0]           cpu_data_pf_out1a4       ;
wire       [31:0]           cpu_data_pf_out1a5       ;
wire       [31:0]           cpu_data_pf_out1a6       ;
wire       [31:0]           cpu_data_pf_out1a7       ;
wire       [31:0]           cpu_data_pf_out1a8       ;
wire       [31:0]           cpu_data_pf_out1a9       ;
wire       [31:0]           cpu_data_pf_out1aa       ;
wire       [31:0]           cpu_data_pf_out1ab       ;
wire       [31:0]           cpu_data_pf_out1ac       ;
wire       [31:0]           cpu_data_pf_out1ad       ;
wire       [31:0]           cpu_data_pf_out1ae       ;
wire       [31:0]           cpu_data_pf_out1af       ;
wire       [31:0]           cpu_data_pf_out1b0       ;
wire       [31:0]           cpu_data_pf_out1b1       ;
wire       [31:0]           cpu_data_pf_out1b2       ;
wire       [31:0]           cpu_data_pf_out1b3       ;
wire       [31:0]           cpu_data_pf_out1b4       ;
wire       [31:0]           cpu_data_pf_out1b5       ;
wire       [31:0]           cpu_data_pf_out1b6       ;

//********************************************************************************************************************
//    cfg
//********************************************************************************************************************
rw_reg_inst
    #(
    .ADDR_WIDTH(24),
    .VLD_WIDTH(32 ),                          
    .INIT_DATA(11'h180)                 
    )
    u_reg_bp_mux_cfg                      
    (
    .clks               ( clk_sys                   ),  
    .reset              ( rst                       ),  
    .cpu_data_in        ( cpu_data_in               ),  
    .cpu_data_out       ( cpu_data_pf_out000        ), 
    .cpu_addr           ( cpu_addr                  ),  
    .cpu_wr             ( cpu_wr                    ),  
    .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h000}),  
    .dout               (     )   
    );

//********************************************************************************************************************
//    err
//********************************************************************************************************************
err_wc_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)
         )
    inst_reg_bd0_sta_err                                      
     (
     .clk                ( clk_sys                  ),       
     .reset              ( rst                      ),       

     .cpu_data_out       ( cpu_data_pf_out080       ),       
     .cpu_data_in        ( cpu_data_in              ),       
     .cpu_addr           ( cpu_addr                 ),       
     .cpu_wr             ( cpu_wr                   ),       
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h080}),      
     .err_flag_in        ( reg_cont_rd_err[32*1-1:0])        
     );

err_wc_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)
         )
    inst_reg_bd1_sta_err                                      
     (
     .clk                ( clk_sys                  ),       
     .reset              ( rst                      ),       

     .cpu_data_out       ( cpu_data_pf_out081       ),       
     .cpu_data_in        ( cpu_data_in              ),       
     .cpu_addr           ( cpu_addr                 ),       
     .cpu_wr             ( cpu_wr                   ),       
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h081}),      
     .err_flag_in        ( reg_cont_rd_err[32*2-1:32*1])        
     );

err_wc_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)
         )
    inst_reg_bd2_sta_err                                      
     (
     .clk                ( clk_sys                  ),       
     .reset              ( rst                      ),       

     .cpu_data_out       ( cpu_data_pf_out082       ),       
     .cpu_data_in        ( cpu_data_in              ),       
     .cpu_addr           ( cpu_addr                 ),       
     .cpu_wr             ( cpu_wr                   ),       
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h082}),      
     .err_flag_in        ( reg_cont_rd_err[32*3-1:32*2])    
     );

err_wc_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)
         )
    inst_reg_bd3_sta_err                                      
     (
     .clk                ( clk_sys                  ),       
     .reset              ( rst                      ),       

     .cpu_data_out       ( cpu_data_pf_out083       ),       
     .cpu_data_in        ( cpu_data_in              ),       
     .cpu_addr           ( cpu_addr                 ),       
     .cpu_wr             ( cpu_wr                   ),       
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h083}),      
     .err_flag_in        ( reg_cont_rd_err[32*4-1:32*3])        
     );


//********************************************************************************************************************
//    sta
//********************************************************************************************************************
ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_bd_sta                                     
     (
     .cpu_data_out       ( cpu_data_pf_out100       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h100}),   
     .din                ( {2'd0,fifo_state[27:14],2'd0,fifo_state[13:0]}           )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_bd_sta1                                     
     (
     .cpu_data_out       ( cpu_data_pf_out101       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h101}),   
     .din                ( {2'd0,fifo_state[55:42],2'd0,fifo_state[41:28]}           )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_cont_rd_sta3                                    
     (
     .cpu_data_out       ( cpu_data_pf_out102       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h102}),   
     .din                ( tx2ddr_cfifo_stat           )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_cont_rd_sta4                                    
     (
     .cpu_data_out       ( cpu_data_pf_out103      ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h103}),   
     .din                ( tx2ddr_dfifo_stat           )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_cont_rd_sta5                                    
     (
     .cpu_data_out       ( cpu_data_pf_out104       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h104}),   
     .din                ( kernel2ddr_cfifo_stat           )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_cont_rd_sta6                                    
     (
     .cpu_data_out       ( cpu_data_pf_out105      ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h105}),   
     .din                ( kernel2ddr_dfifo_stat           )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_cont_rd_sta7                                    
     (
     .cpu_data_out       ( cpu_data_pf_out106       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h106}),   
     .din                ( ddr_cfifo_stat           )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_cont_rd_sta8                                     
     (
     .cpu_data_out       ( cpu_data_pf_out107      ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h107}),   
     .din                ( ddr_dfifo_stat           )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_cont_rd_sta9                                     
     (
     .cpu_data_out       ( cpu_data_pf_out108       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h108}),   
     .din                ( sel_cfifo_stat           )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(8)                                    
         )
     inst_reg_axi4_sl_fsm_state                                     
     (
     .cpu_data_out       ( cpu_data_pf_out109      ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h109}),   
     .din                ( reg_axi4_sl_fsm_state           )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_cont0_rd_sta                                     
     (
     .cpu_data_out       ( cpu_data_pf_out10a       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h10a}),   
     .din                ( reg_cont_rd_sta[32*1-1:32*0]  )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_cont1_rd_sta                                     
     (
     .cpu_data_out       ( cpu_data_pf_out10b      ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h10b}),   
     .din                ( reg_cont_rd_sta[32*2-1:32*1]  )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_cont2_rd_sta                                     
     (
     .cpu_data_out       ( cpu_data_pf_out10c       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h10c}),   
     .din                ( reg_cont_rd_sta[32*3-1:32*2]  )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_cont3_rd_sta                                     
     (
     .cpu_data_out       ( cpu_data_pf_out10d      ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h10d}),   
     .din                ( reg_cont_rd_sta[32*4-1:32*3]  )    
     );

//********************************************************************************************************************
//    cnt
//********************************************************************************************************************
cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_ok_cnt_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out180       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h180}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_ok_cnt_en[0]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_ok_cnt_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out181       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h181}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_ok_cnt_en[1]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_ok_cnt_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out182       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h182}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_ok_cnt_en[2]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_ok_cnt_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out183       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h183}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_ok_cnt_en[3]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_exok_cnt_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out184       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h184}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_exok_cnt_en[0]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_exok_cnt_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out185       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h185}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_exok_cnt_en[1]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_exok_cnt_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out186       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h186}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_exok_cnt_en[2]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_exok_cnt_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out187       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h187}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_exok_cnt_en[3]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_slverr_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out188       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h188}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_slverr_cnt_en[0]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_slverr_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out189       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h189}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_slverr_cnt_en[1]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_slverr_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out18a       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h18a}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_slverr_cnt_en[2]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_slverr_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out18b       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h18b}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_slverr_cnt_en[3]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_decerr_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out18c       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h18c}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_decerr_cnt_en[0]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_decerr_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out18d       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h18d}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_decerr_cnt_en[1]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_decerr_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out18e       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h18e}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_decerr_cnt_en[2]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
axi4_s2m_rsp_decerr_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out18f       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h18f}),     
     .cnt_reg_inc        (  axi4_s2m_rsp_decerr_cnt_en[3]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
tx2ddr_cfifo0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out190       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h190}),     
     .cnt_reg_inc        (  tx2ddr_cfifo_cnt_en[0]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
tx2ddr_cfifo_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out191       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h191}),     
     .cnt_reg_inc        (  tx2ddr_cfifo_cnt_en[1]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
tx2ddr_cfifo_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out192       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h192}),     
     .cnt_reg_inc        (  tx2ddr_cfifo_cnt_en[2]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
tx2ddr_cfifo_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out193       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h193}),     
     .cnt_reg_inc        (  tx2ddr_cfifo_cnt_en[3]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
tx2ddr_dfifo_eop_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out194       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h194}),     
     .cnt_reg_inc        (  tx2ddr_dfifo_eop_cnt_en[0]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
tx2ddr_dfifo_eop_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out195       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h195}),     
     .cnt_reg_inc        (  tx2ddr_dfifo_eop_cnt_en[1]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
tx2ddr_dfifo_eop_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out196       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h196}),     
     .cnt_reg_inc        (  tx2ddr_dfifo_eop_cnt_en[2]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
tx2ddr_dfifo_eop_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out197       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h197}),     
     .cnt_reg_inc        (  tx2ddr_dfifo_eop_cnt_en[3]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
kernel2ddr_cfifo_cnt_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out198       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h198}),     
     .cnt_reg_inc        (  kernel2ddr_cfifo_cnt_en[0]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
kernel2ddr_cfifo_cnt_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out199       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h199}),     
     .cnt_reg_inc        (  kernel2ddr_cfifo_cnt_en[1]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
kernel2ddr_cfifo_cnt_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out19a       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h19a}),     
     .cnt_reg_inc        (  kernel2ddr_cfifo_cnt_en[2]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
kernel2ddr_cfifo_cnt_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out19b       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h19b}),     
     .cnt_reg_inc        (  kernel2ddr_cfifo_cnt_en[3]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
kernel2ddr_dfifo_eop_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out19c       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h19c}),     
     .cnt_reg_inc        (  kernel2ddr_dfifo_eop_cnt_en[0]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
kernel2ddr_dfifo_eop_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out19d       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h19d}),     
     .cnt_reg_inc        (  kernel2ddr_dfifo_eop_cnt_en[1]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
kernel2ddr_dfifo_eop_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out19e       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h19e}),     
     .cnt_reg_inc        (  kernel2ddr_dfifo_eop_cnt_en[2]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
kernel2ddr_dfifo_eop_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out19f       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h19f}),     
     .cnt_reg_inc        (  kernel2ddr_dfifo_eop_cnt_en[3]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
ddr2tx_bvalid_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1a0       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1a0}),     
     .cnt_reg_inc        (  ddr2tx_bvalid_cnt_en[0]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
ddr2tx_bvalid_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1a1       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1a1}),     
     .cnt_reg_inc        (  ddr2tx_bvalid_cnt_en[1]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
ddr2tx_bvalid_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1a2       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1a2}),     
     .cnt_reg_inc        (  ddr2tx_bvalid_cnt_en[2]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
ddr2tx_bvalid_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1a3       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1a3}),     
     .cnt_reg_inc        (  ddr2tx_bvalid_cnt_en[3]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
ddr2kernel_bvalid_cnt_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1a4       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1a4}),     
     .cnt_reg_inc        (  ddr2kernel_bvalid_cnt_en[0]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
ddr2kernel_bvalid_cnt_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1a5       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1a5}),     
     .cnt_reg_inc        (  ddr2kernel_bvalid_cnt_en[1]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
ddr2kernel_bvalid_cnt_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1a6       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1a6}),     
     .cnt_reg_inc        (  ddr2kernel_bvalid_cnt_en[2]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
ddr2kernel_bvalid_cnt_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1a7       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1a7}),     
     .cnt_reg_inc        (  ddr2kernel_bvalid_cnt_en[3]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
pkt_fifo_rdata_sop_cnt_en0
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1a8       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1a8}),     
     .cnt_reg_inc        (  pkt_fifo_rdata_sop_cnt_en[0]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );
//del
cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
pkt_fifo_rdata_sop_cnt_en1
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1a9       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1a9}),     
     .cnt_reg_inc        (  pkt_fifo_rdata_sop_cnt_en[1]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
pkt_fifo_rdata_sop_cnt_en2
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1aa       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1aa}),     
     .cnt_reg_inc        (  pkt_fifo_rdata_sop_cnt_en[2]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
pkt_fifo_rdata_sop_cnt_en3
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1ab       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1ab}),     
     .cnt_reg_inc        (  pkt_fifo_rdata_sop_cnt_en[3]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_cont0_rcmd_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1ac       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1ac}),     
     .cnt_reg_inc        (  reg_cont_rcmd_en[0]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_cont1_rcmd_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1ad       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1ad}),     
     .cnt_reg_inc        (  reg_cont_rcmd_en[1]     ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_cont2_rcmd_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1ae       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1ae}),     
     .cnt_reg_inc        (  reg_cont_rcmd_en[2]       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_cont3_rcmd_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1af       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1af}),     
     .cnt_reg_inc        (  reg_cont_rcmd_en[3]     ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_cont0_rpkt_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1b0       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1b0}),     
     .cnt_reg_inc        (  reg_cont_rpkt_en[0]     ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_cont1_rpkt_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1b1       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1b1}),     
     .cnt_reg_inc        (  reg_cont_rpkt_en[1]     ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_cont2_rpkt_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1b2       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1b2}),     
     .cnt_reg_inc        (  reg_cont_rpkt_en[2]     ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_cont3_rpkt_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1b3       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1b3}),     
     .cnt_reg_inc        (  reg_cont_rpkt_en[3]     ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_axi4_sl_tran_cnt_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1b4       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1b4}),     
     .cnt_reg_inc        (  reg_axi4_sl_tran_cnt_en       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );
cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_axi4_sl_frm_cnt_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1b5       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1b5}),     
     .cnt_reg_inc        (  reg_axi4_sl_frm_cnt_en       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axi4_sl_wr_cnt_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out1b6       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_CONNECT_ID,3'd0,9'h1b6}),     
     .cnt_reg_inc        (  reg_axi4_sl_wr_cnt_en       ),     
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
           7'h02: cpu_data_out_err_pf <= cpu_data_pf_out082;
           7'h03: cpu_data_out_err_pf <= cpu_data_pf_out083;
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
           7'h1b: cpu_data_out_cnt_pf <= cpu_data_pf_out19b;
           7'h1c: cpu_data_out_cnt_pf <= cpu_data_pf_out19c;
           7'h1d: cpu_data_out_cnt_pf <= cpu_data_pf_out19d;
           7'h1e: cpu_data_out_cnt_pf <= cpu_data_pf_out19e;
           7'h1f: cpu_data_out_cnt_pf <= cpu_data_pf_out19f;
           7'h20: cpu_data_out_cnt_pf <= cpu_data_pf_out1a0;
           7'h21: cpu_data_out_cnt_pf <= cpu_data_pf_out1a1;
           7'h22: cpu_data_out_cnt_pf <= cpu_data_pf_out1a2;
           7'h23: cpu_data_out_cnt_pf <= cpu_data_pf_out1a3;
           7'h24: cpu_data_out_cnt_pf <= cpu_data_pf_out1a4;
           7'h25: cpu_data_out_cnt_pf <= cpu_data_pf_out1a5;
           7'h26: cpu_data_out_cnt_pf <= cpu_data_pf_out1a6;
           7'h27: cpu_data_out_cnt_pf <= cpu_data_pf_out1a7;
           7'h28: cpu_data_out_cnt_pf <= cpu_data_pf_out1a8;
           7'h29: cpu_data_out_cnt_pf <= cpu_data_pf_out1a9;
           7'h2a: cpu_data_out_cnt_pf <= cpu_data_pf_out1aa;
           7'h2b: cpu_data_out_cnt_pf <= cpu_data_pf_out1ab;
           7'h2c: cpu_data_out_cnt_pf <= cpu_data_pf_out1ac;
           7'h2d: cpu_data_out_cnt_pf <= cpu_data_pf_out1ad;
           7'h2e: cpu_data_out_cnt_pf <= cpu_data_pf_out1ae;
           7'h2f: cpu_data_out_cnt_pf <= cpu_data_pf_out1af;
           7'h30: cpu_data_out_cnt_pf <= cpu_data_pf_out1b0;
           7'h31: cpu_data_out_cnt_pf <= cpu_data_pf_out1b1;
           7'h32: cpu_data_out_cnt_pf <= cpu_data_pf_out1b2;
           7'h33: cpu_data_out_cnt_pf <= cpu_data_pf_out1b3;
           7'h34: cpu_data_out_cnt_pf <= cpu_data_pf_out1b4;
           7'h35: cpu_data_out_cnt_pf <= cpu_data_pf_out1b5;
           7'h36: cpu_data_out_cnt_pf <= cpu_data_pf_out1b6;
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
