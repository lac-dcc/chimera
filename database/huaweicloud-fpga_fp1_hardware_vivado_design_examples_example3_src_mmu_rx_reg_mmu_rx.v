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
`timescale 1ns/100ps

module reg_mmu_rx  #
                  (
                  parameter    A_WTH              =     24                    ,
                  parameter    D_WTH              =     32                    ,
                  parameter    REG_MMU_RX_ID      =     12'h001                
                  )
                 (

                 //globe signals
                 input                            clk_sys                     ,
                 input                            rst                         ,

                 input        [31:0]              reg_mmu_rxbd_sta            ,
                 input        [31:0]              reg_mmu_rxpkt_sta           ,
                 input        [31:0]              reg_mmu_rxpkt_sta1          ,
                 
                 input        [31:0]              reg_mmu_rxbd_err            ,
                 input        [31:0]              reg_mmu_rxpkt_err           ,
                 input        [15:0]              reg_axi_tmout_err           ,
                 input        [31:0]              reg_eoc_tag_ff_stat         ,    
                 
                 output       [31:0]              reg_mmu_rx_cfg              ,
                 output       [7:0]               reg_timer_1us_cfg           ,
                 output       [15:0]              reg_tmout_us_cfg            ,
                 
                 input        [3:0]               reg_mmu_rxpkt_en            , 
                 input                            reg_mmu_txpkt_en            , 
                 input                            reg_mmu_rxbd_en             , 
                 input                            reg_mmu_rdcmd_en            , 
                 input                            reg_add_hacc_en             , 
                 input                            reg_write_ddr_bd            , 
                 input                            axis_fifo_rd                , 
                 input                            bd2rx_axis_fifo_rd          , 
                 input                            read_op_vld                 , 
                 input                            write_op_vld                , 
    
                 //with cpu
                 input                            cnt_reg_clr                 ,
                 input        [A_WTH -1:0]        cpu_addr                    ,
                 input        [D_WTH -1:0]        cpu_data_in                 ,
                 output  reg  [D_WTH -1:0]        cpu_data_out_vf             ,
                 input                            cpu_rd                      ,
                 input                            cpu_wr                       

                 );

/*********************************************************************************************************************\
    signals
\*********************************************************************************************************************/
reg        [31:0]           cpu_data_out_cfg      ;
reg        [31:0]           cpu_data_out_err      ;
reg        [31:0]           cpu_data_out_sts      ;
reg        [31:0]           cpu_data_out_cnt      ; 

//cfg
wire       [31:0]           cpu_data_out0         ;
wire       [31:0]           cpu_data_out1         ;
wire       [31:0]           cpu_data_out2         ;

//err
wire       [31:0]           cpu_data_out80        ;
wire       [31:0]           cpu_data_out81        ;
wire       [31:0]           cpu_data_out82        ;

//sta
wire       [31:0]           cpu_data_out100       ;
wire       [31:0]           cpu_data_out101       ;
wire       [31:0]           cpu_data_out102       ;
wire       [31:0]           cpu_data_out103       ;

//cnt
wire       [31:0]           cpu_data_out180       ;
wire       [31:0]           cpu_data_out181       ;
wire       [31:0]           cpu_data_out182       ;
wire       [31:0]           cpu_data_out183       ;
wire       [31:0]           cpu_data_out184       ;
wire       [31:0]           cpu_data_out185       ;
wire       [31:0]           cpu_data_out186       ;
wire       [31:0]           cpu_data_out187       ;
wire       [31:0]           cpu_data_out188       ;
wire       [31:0]           cpu_data_out189       ;
wire       [31:0]           cpu_data_out18a       ;
wire       [31:0]           cpu_data_out18b       ;
wire       [31:0]           cpu_data_out18c       ;

/*********************************************************************************************************************\
    process
\*********************************************************************************************************************/
rw_reg_inst
    #(
    .ADDR_WIDTH(24),
    .VLD_WIDTH(8),                                        
    .INIT_DATA(8'd200)                                      
    )
    inst_reg_timer_1us_cfg                                       
    (
    .clks               ( clk_sys             ),          
    .reset              ( rst                 ),          
    .cpu_data_in        ( cpu_data_in         ),          
    .cpu_data_out       ( cpu_data_out0       ),          
    .cpu_addr           ( cpu_addr            ),          
    .cpu_wr             ( cpu_wr              ),          
    .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h000} ),  
    .dout               ( reg_timer_1us_cfg   )           
    );
 
rw_reg_inst
    #(
    .ADDR_WIDTH(24),
    .VLD_WIDTH(16),                                        
    .INIT_DATA(16'hffff)                                      
    )
    inst_reg_tmout_us_cfg                                       
    (
    .clks               ( clk_sys             ),          
    .reset              ( rst                 ),          
    .cpu_data_in        ( cpu_data_in         ),          
    .cpu_data_out       ( cpu_data_out1       ),          
    .cpu_addr           ( cpu_addr            ),          
    .cpu_wr             ( cpu_wr              ),          
    .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h001} ),  
    .dout               ( reg_tmout_us_cfg    )           
    );
rw_reg_inst
    #(
    .ADDR_WIDTH(24),
    .VLD_WIDTH(32),                                        
    .INIT_DATA(32'h80000012)                                      
    )
    inst_reg_mmu_rx_cfg                                       
    (
    .clks               ( clk_sys             ),          
    .reset              ( rst                 ),          
    .cpu_data_in        ( cpu_data_in         ),          
    .cpu_data_out       ( cpu_data_out2       ),          
    .cpu_addr           ( cpu_addr            ),          
    .cpu_wr             ( cpu_wr              ),          
    .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h002} ),  
    .dout               ( reg_mmu_rx_cfg      )           
    );
 
err_wc_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)
         )
    inst_reg_mmu_rxbd_err                                      
     (
     .clk                ( clk_sys                  ),       
     .reset              ( rst                      ),       
     .cpu_data_out       ( cpu_data_out80           ),       
     .cpu_data_in        ( cpu_data_in              ),       
     .cpu_addr           ( cpu_addr                 ),       
     .cpu_wr             ( cpu_wr                   ),       
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h080}),      
     .err_flag_in        ( reg_mmu_rxbd_err         )        
     );

err_wc_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)
         )
    inst_reg_mmu_rxpkt_err                                      
     (
     .clk                ( clk_sys                  ),       
     .reset              ( rst                      ),       

     .cpu_data_out       ( cpu_data_out81           ),       
     .cpu_data_in        ( cpu_data_in              ),       
     .cpu_addr           ( cpu_addr                 ),       
     .cpu_wr             ( cpu_wr                   ),       
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h081}),      
     .err_flag_in        ( reg_mmu_rxpkt_err        )        
     );

err_wc_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(16)
         )
    inst_reg_axi_tmout_err                                      
     (
     .clk                ( clk_sys                  ),       
     .reset              ( rst                      ),       

     .cpu_data_out       ( cpu_data_out82           ),       
     .cpu_data_in        ( cpu_data_in              ),       
     .cpu_addr           ( cpu_addr                 ),       
     .cpu_wr             ( cpu_wr                   ),       
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h082}),      
     .err_flag_in        ( reg_axi_tmout_err        )        
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_mmu_rxbd_sta                                    
     (
     .cpu_data_out       ( cpu_data_out100          ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h100}),   
     .din                ( reg_mmu_rxbd_sta         )        
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_mmu_rxpkt_sta                                    
     (
     .cpu_data_out       ( cpu_data_out101          ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h101}),   
     .din                ( reg_mmu_rxpkt_sta        )        
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_mmu_rxpkt_sta1                                    
     (
     .cpu_data_out       ( cpu_data_out102          ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h102}),   
     .din                ( reg_mmu_rxpkt_sta1       )        
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(32)                                    
         )
     inst_reg_eoc_tag_ff_stat                                    
     (
     .cpu_data_out       ( cpu_data_out103          ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h103}),   
     .din                ( reg_eoc_tag_ff_stat       )        
     );




cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_mmu_rxbd_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out180          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h180}),     
     .cnt_reg_inc        ( reg_mmu_rxbd_en         ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_mmu_rxcmd_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out181          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h181}),     
     .cnt_reg_inc        ( reg_mmu_rdcmd_en         ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_mmu_rxpkt0_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out182          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h182}),     
     .cnt_reg_inc        ( reg_mmu_rxpkt_en[0]      ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_mmu_rxpkt1_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out183          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h183}),     
     .cnt_reg_inc        ( reg_mmu_rxpkt_en[1]      ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_mmu_rxpkt2_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out184          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h184}),     
     .cnt_reg_inc        ( reg_mmu_rxpkt_en[2]      ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_mmu_rxpkt3_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out185          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h185}),     
     .cnt_reg_inc        ( reg_mmu_rxpkt_en[3]      ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_mmu_txpkt_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out186          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h186}),     
     .cnt_reg_inc        ( reg_mmu_txpkt_en         ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_axis_fifo_rd_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out187          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h187}),     
     .cnt_reg_inc        ( axis_fifo_rd         ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_bd2rx_axis_fifo_rd_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out188          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h188}),     
     .cnt_reg_inc        ( bd2rx_axis_fifo_rd         ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_read_op_vld_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out189          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h189}),     
     .cnt_reg_inc        ( read_op_vld         ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_write_op_vld_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out18a          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h18a}),     
     .cnt_reg_inc        ( write_op_vld         ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_add_hacc_en_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out18b          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h18b}),     
     .cnt_reg_inc        ( reg_add_hacc_en         ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_write_ddr_bd_cnt
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_out18c          ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {REG_MMU_RX_ID,3'd0,9'h18c}),     
     .cnt_reg_inc        ( reg_write_ddr_bd         ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );








always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1)
        cpu_data_out_cfg <=  32'd0;
    else
    begin
        casez (cpu_addr[6:0])
           7'h00: cpu_data_out_cfg <= cpu_data_out0;
           7'h01: cpu_data_out_cfg <= cpu_data_out1;
           7'h02: cpu_data_out_cfg <= cpu_data_out2;
         default: cpu_data_out_cfg <= 32'd0;
        endcase
    end
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        cpu_data_out_err <=  32'd0;
    end
    else begin
        casez(cpu_addr[6:0])
           7'h00: cpu_data_out_err <= cpu_data_out80;
           7'h01: cpu_data_out_err <= cpu_data_out81;
           7'h02: cpu_data_out_err <= cpu_data_out82;
         default: cpu_data_out_err <= 32'd0;
        endcase
    end
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        cpu_data_out_sts <=  32'd0;
    end
    else begin
       casez(cpu_addr[6:0])
           7'h00: cpu_data_out_sts <= cpu_data_out100;
           7'h01: cpu_data_out_sts <= cpu_data_out101;
           7'h02: cpu_data_out_sts <= cpu_data_out102;
           7'h03: cpu_data_out_sts <= cpu_data_out103;

         default: cpu_data_out_sts <= 32'd0;
       endcase
    end
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        cpu_data_out_cnt <=  32'd0;
    end
    else begin
       casez(cpu_addr[6:0])
           7'd0: cpu_data_out_cnt <= cpu_data_out180;
           7'd1: cpu_data_out_cnt <= cpu_data_out181;
           7'd2: cpu_data_out_cnt <= cpu_data_out182;
           7'd3: cpu_data_out_cnt <= cpu_data_out183;
           7'd4: cpu_data_out_cnt <= cpu_data_out184;
           7'd5: cpu_data_out_cnt <= cpu_data_out185;
           7'd6: cpu_data_out_cnt <= cpu_data_out186;
           7'd7: cpu_data_out_cnt <= cpu_data_out187;
           7'd8: cpu_data_out_cnt <= cpu_data_out188;
           7'd9: cpu_data_out_cnt <= cpu_data_out189;
           7'd10: cpu_data_out_cnt <= cpu_data_out18a;
           7'd11: cpu_data_out_cnt <= cpu_data_out18b;
           7'd12: cpu_data_out_cnt <= cpu_data_out18c;
         
         default: cpu_data_out_cnt <= 32'd0;
       endcase
    end
end

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1) begin
        cpu_data_out_vf <=  32'd0;
    end
    else begin
        casez (cpu_addr[9:7])
            3'h0: cpu_data_out_vf <= cpu_data_out_cfg;
            3'h1: cpu_data_out_vf <= cpu_data_out_err;
            3'h2: cpu_data_out_vf <= cpu_data_out_sts;
            3'h3: cpu_data_out_vf <= cpu_data_out_cnt;
         default: cpu_data_out_vf <= 32'd0;
        endcase
    end
end

endmodule
