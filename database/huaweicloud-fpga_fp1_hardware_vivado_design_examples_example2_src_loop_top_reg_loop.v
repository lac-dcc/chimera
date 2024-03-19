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

`timescale 1ns/100ps
module reg_loop  #
                  (
                  parameter    A_WTH              =     24                    ,
                  parameter    D_WTH              =     32                    ,
                  parameter    LOOP_IP_CM_ID      =     12'h001                
                  )
                 (

                 //globe signals
                 input                            clk_sys                     ,
                 input                            rst                         ,

                 input                            reg_txqm_bd_cnt_en          ,
                 input                            reg_txm_rcmd_cnt_en         ,
                 input                            reg_rlt_head_cnt_en         ,
        
                 input                            reg_ve2ae_reop              ,
                 input                            reg_ae2ve_weop              ,

                 input        [5:0]               reg_bd_sta                  ,
                 input        [3:0]               reg_pkt_sta                 ,
                 input        [5:0]               reg_bd_err                  ,
                 input        [3:0]               reg_pkt_err                 ,
                 
                 output       [31:0]              reg_bp_mux_cfg              ,
                 output       [31:0]              reg_loop_port_cfg           ,
                 output       [31:0]              reg_loop_cfg                , 
    
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
wire       [31:0]           cpu_data_pf_out0         ;
wire       [31:0]           cpu_data_pf_out1         ;
wire       [31:0]           cpu_data_pf_out2         ;

//err
wire       [31:0]           cpu_data_pf_out128       ;
wire       [31:0]           cpu_data_pf_out129       ;

//sta
wire       [31:0]           cpu_data_pf_out256       ;
wire       [31:0]           cpu_data_pf_out257       ;

//cnt
wire       [31:0]           cpu_data_pf_out384       ;
wire       [31:0]           cpu_data_pf_out385       ;
wire       [31:0]           cpu_data_pf_out386       ;
wire       [31:0]           cpu_data_pf_out387       ;
wire       [31:0]           cpu_data_pf_out388       ;


/*********************************************************************************************************************\
    process
\*********************************************************************************************************************/
rw_reg_inst
    #(
    .ADDR_WIDTH(24),
    .VLD_WIDTH(32 ),                          
    .INIT_DATA( 32'h190)                 
    )
    u_reg_bp_mux_cfg                      
    (
    .clks               ( clk_sys                   ),  
    .reset              ( rst                       ),  
    .cpu_data_in        ( cpu_data_in               ),  
    .cpu_data_out       ( cpu_data_pf_out0          ), 
    .cpu_addr           ( cpu_addr                  ),  
    .cpu_wr             ( cpu_wr                    ),  
    .its_addr           ( {LOOP_IP_CM_ID,3'd0,9'h000} ),  
    .dout               ( reg_bp_mux_cfg            )   
    );

rw_reg_inst
    #(
    .ADDR_WIDTH(24),
    .VLD_WIDTH(32 ),                      
    .INIT_DATA(32'd0 )                    
    )
    u_reg_loop_port__cfg                             
    (
    .clks               ( clk_sys                  ),
    .reset              ( rst                      ),
    .cpu_data_in        ( cpu_data_in              ),
    .cpu_data_out       ( cpu_data_pf_out1         ),
    .cpu_addr           ( cpu_addr                 ),
    .cpu_wr             ( cpu_wr                   ),
    .its_addr           ( {LOOP_IP_CM_ID,3'd0,9'h001}),
    .dout               ( reg_loop_port_cfg        ) 
    );
rw_reg_inst
    #(
    .ADDR_WIDTH(24),
    .VLD_WIDTH(32 ),                   
    .INIT_DATA(32'd0)                    
    )
    u_reg_loop_cfg                             
    (
    .clks               ( clk_sys                  ),
    .reset              ( rst                      ),
    .cpu_data_in        ( cpu_data_in              ),
    .cpu_data_out       ( cpu_data_pf_out2         ),
    .cpu_addr           ( cpu_addr                 ),
    .cpu_wr             ( cpu_wr                   ),
    .its_addr           ( {LOOP_IP_CM_ID,3'd0,9'h002}),        
    .dout               ( reg_loop_cfg             )         
    );

err_wc_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(6)
         )
    inst_reg_bd_sta_err                                      
     (
     .clk                ( clk_sys                  ),       
     .reset              ( rst                      ),       

     .cpu_data_out       ( cpu_data_pf_out128       ),       
     .cpu_data_in        ( cpu_data_in              ),       
     .cpu_addr           ( cpu_addr                 ),       
     .cpu_wr             ( cpu_wr                   ),       
     .its_addr           ( {LOOP_IP_CM_ID,3'd0,9'h080}),      
     .err_flag_in        ( reg_bd_err               )        
     );

err_wc_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(4)
         )
    inst_reg_pkt_sta_err                                     
     (
     .clk                ( clk_sys                  ),       
     .reset              ( rst                      ),       

     .cpu_data_out       ( cpu_data_pf_out129       ),       
     .cpu_data_in        ( cpu_data_in              ),       
     .cpu_addr           ( cpu_addr                 ),       
     .cpu_wr             ( cpu_wr                   ),       
     .its_addr           ( {LOOP_IP_CM_ID,3'd0,9'h081}),      
     .err_flag_in        ( reg_pkt_err              )        
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(6)                                    
         )
     inst_reg_bd_sta                                     
     (
     .cpu_data_out       ( cpu_data_pf_out256       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {LOOP_IP_CM_ID,3'd0,9'h100}),   
     .din                ( reg_bd_sta               )    
     );

ro_reg_inst
        #(
        .ADDR_WIDTH(24),
        .VLD_WIDTH(4)                                    
         )
     inst_reg_pkt_sta                                    
     (
     .cpu_data_out       ( cpu_data_pf_out257       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {LOOP_IP_CM_ID,3'd0,9'h101}),   
     .din                ( reg_pkt_sta              )        
     );


cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                        
          )
inst_reg_txqm_bd_cnt_en
     (
     .clks               ( clk_sys                  ),     
     .reset              ( rst                      ),     
     .cpu_data_out       ( cpu_data_pf_out384       ),     
     .cpu_addr           ( cpu_addr                 ),     
     .its_addr           ( {LOOP_IP_CM_ID,3'd0,9'h180}),     
     .cnt_reg_inc        ( reg_txqm_bd_cnt_en       ),     
     .cnt_reg_clr        ( cnt_reg_clr              )      
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                   
          )
inst_reg_txm_rcmd_cnt_en
     (
     .clks               ( clk_sys                  ),    
     .reset              ( rst                      ),    
     .cpu_data_out       ( cpu_data_pf_out385       ),   
     .cpu_addr           ( cpu_addr                 ),   
     .its_addr           ( {LOOP_IP_CM_ID,3'd0,9'h181}),    
     .cnt_reg_inc        ( reg_txm_rcmd_cnt_en      ),     
     .cnt_reg_clr        ( cnt_reg_clr              )     
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                      
          )
inst_reg_rlt_head_cnt_en
     (
     .clks               ( clk_sys                  ),    
     .reset              ( rst                      ),    
     .cpu_data_out       ( cpu_data_pf_out386       ),    
     .cpu_addr           ( cpu_addr                 ),    
     .its_addr           ( {LOOP_IP_CM_ID,3'd0,9'h182}),    
     .cnt_reg_inc        ( reg_rlt_head_cnt_en      ),    
     .cnt_reg_clr        ( cnt_reg_clr              )     
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                      
          )
inst_reg_ve2ae_reop 
     (
     .clks               ( clk_sys                  ),    
     .reset              ( rst                      ),    
     .cpu_data_out       ( cpu_data_pf_out387       ),    
     .cpu_addr           ( cpu_addr                 ),    
     .its_addr           ( {LOOP_IP_CM_ID,3'd0,9'h183}),   
     .cnt_reg_inc        ( reg_ve2ae_reop           ),    
     .cnt_reg_clr        ( cnt_reg_clr              )     
     );

cnt32_reg_inst
         #(
         .ADDR_WIDTH(24)                                      
          )
inst_reg_ae2ve_weop 
     (
     .clks               ( clk_sys                  ),    
     .reset              ( rst                      ),    
     .cpu_data_out       ( cpu_data_pf_out388       ),    
     .cpu_addr           ( cpu_addr                 ),    
     .its_addr           ( {LOOP_IP_CM_ID,3'd0,9'h184}),    
     .cnt_reg_inc        ( reg_ae2ve_weop           ),    
     .cnt_reg_clr        ( cnt_reg_clr              )     
     ); 

always @ (posedge clk_sys or posedge rst)
begin
    if (rst == 1'b1)
        cpu_data_out_cfg_pf <=  32'd0;
    else
    begin
        casez (cpu_addr[6:0])
           7'h00: cpu_data_out_cfg_pf <= cpu_data_pf_out0;
           7'h01: cpu_data_out_cfg_pf <= cpu_data_pf_out1;
           7'h02: cpu_data_out_cfg_pf <= cpu_data_pf_out2;
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
           7'h00: cpu_data_out_err_pf <= cpu_data_pf_out128;
           7'h01: cpu_data_out_err_pf <= cpu_data_pf_out129;
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
           7'h00: cpu_data_out_sts_pf <= cpu_data_pf_out256;
           7'h01: cpu_data_out_sts_pf <= cpu_data_pf_out257;

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
           7'h00: cpu_data_out_cnt_pf <= cpu_data_pf_out384;
           7'h01: cpu_data_out_cnt_pf <= cpu_data_pf_out385;
           7'h02: cpu_data_out_cnt_pf <= cpu_data_pf_out386;
           7'h03: cpu_data_out_cnt_pf <= cpu_data_pf_out387;
           7'h04: cpu_data_out_cnt_pf <= cpu_data_pf_out388;
        
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
