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

module  mmu_bucket
                 (
                 //globe signals
                 input                           clk_sys                    ,
                 input                           reset                      ,
                 
                 //with bucket add 
                 input               [9:0]       bucket_wline               ,
                 input                           bucket_inc_wr              ,
                 input               [13:0]      bucket_inc_wdata           ,
               
                 //with bucket dec 
                 input                           bucket_dec_wr              ,
                 input               [9:0]       bucket_dec_wdata           ,
                 input                           bucket_dec_wend            ,
                
                 //with rx_bd   
                 output                          bucket_af                  ,                  
                 
                 //with cpu     
                 output              [9:0]       reg_bucket_inc_cnt         ,
                 input               [7:0]       reg_timer_1us_cfg          ,
                 output  reg         [1:0]       reg_bucket_err                     
                 );

/******************************************************************************\
                            signal 
\******************************************************************************/
reg      [7:0]       timer_1us_cnt           ;
reg      [9:0]       timer_1ms_cnt           ;
reg                  timer_1ms_plus          ;
reg                  time_1us_tmout_en        ; 

wire                 bucket_full_time_over   ;
wire                 bucket_err              ;
reg     [7:0]        reg_time_cfg_cnt   ;              

/******************************************************************************\
                            process 
\******************************************************************************/
always @(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1)begin
        reg_time_cfg_cnt <= 8'd0;
    end
    else begin
        reg_time_cfg_cnt <= reg_timer_1us_cfg - 8'd2;
    end
end

always @(posedge clk_sys or posedge reset)
begin
    if(reset == 1'b1)begin
        time_1us_tmout_en <= 1'b0;
    end
    else if ( timer_1us_cnt >= reg_time_cfg_cnt)begin
        time_1us_tmout_en <= 1'b1;
    end
    else begin
        time_1us_tmout_en <= 1'b0;
    end
end

always @ (posedge clk_sys or posedge reset)
begin
    if (reset == 1'b1) begin
        timer_1us_cnt <= 8'd0;
    end
    else if (time_1us_tmout_en == 1'b1) begin
        timer_1us_cnt <= 8'd0;
    end
    else begin
        timer_1us_cnt <= timer_1us_cnt  +  8'd1;
    end
end

always @ (posedge clk_sys or posedge reset)
begin
    if (reset == 1'b1) begin
        timer_1ms_cnt <= 10'd0;
    end
    else if (timer_1ms_cnt >= 10'd999) begin
        timer_1ms_cnt <= 10'd0;
    end
    else if(time_1us_tmout_en == 1'b1) begin
        timer_1ms_cnt <= timer_1ms_cnt +  10'd1;
    end
    else ;
end


always @ (posedge clk_sys or posedge reset)
begin
    if (reset == 1'b1) begin
        timer_1ms_plus <= 1'b0;
    end
    else begin
        timer_1ms_plus <= (timer_1ms_cnt >= 10'd999);
    end
end

//error
always @ (posedge clk_sys or posedge reset)
begin
    if (reset == 1'b1) begin
        reg_bucket_err <= 2'd0;
    end
    else begin
        reg_bucket_err <= {bucket_err,bucket_full_time_over} ;
    end
end

/******************************************************************************\
                            instance 
\******************************************************************************/

bucket_proc #
(
 .FIFO_DEPTH                 ( 10'h3ff                   ),
 .DEPTH_WIDTH                ( 10                        ),
 .LEN_WIDTH                  ( 14                       ),
 .DATA_BWIDTH                ( 6                         ),
 .MAX_FRM_CNT                ( 10'd64                    ),
 .REV_LEN                    ( 10'd128                   )
) 
u_bucket_proc
(
    .clk                     ( clk_sys                   ), 
    .reset                   ( reset                       ), 
    
    .data_ff_waterline       ( bucket_wline[9:0]         ), 
    .bucket_inc_wr           ( bucket_inc_wr             ), 
    .bucket_inc_wdata        ( bucket_inc_wdata          ), 
    .bucket_dec_wr           ( bucket_dec_wr             ), 
    .bucket_dec_data         ( bucket_dec_wdata[9:0]     ), 
    .bucket_dec_wend         ( bucket_dec_wend           ), 
    .pulse_1ms               ( timer_1ms_plus            ), 
    .bucket_inc_cnt          ( reg_bucket_inc_cnt        ), 
    .bucket_af               ( bucket_af                 ), 
                         
    .bucket_err              ( bucket_err                ), 
    .bucket_full_time_over   ( bucket_full_time_over     )
);

endmodule
