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
`timescale      1ns/1ns

module bucket_proc #
    (
      parameter       FIFO_DEPTH         = 9'h1ff  ,
      parameter       DEPTH_WIDTH        = 9       ,
      parameter       LEN_WIDTH          = 11      ,
      parameter       DATA_BWIDTH        = 5       ,
      parameter       MAX_FRM_CNT        = 9'd62   ,
      parameter       REV_LEN            = 9'd128
     )
    (
    // global interface
    input  wire                       clk                   ,//i  1   
    input  wire                       reset                 ,//i  1  

    // bk_int interface
    input  wire  [(DEPTH_WIDTH-1):0]  data_ff_waterline     ,//i  10 
    input  wire                       bucket_inc_wr         ,//i  1 
    input  wire  [(LEN_WIDTH-1):0]    bucket_inc_wdata      ,//i  11
    input  wire                       bucket_dec_wr         ,//i  1 
    input  wire  [(DEPTH_WIDTH-1):0]  bucket_dec_data       ,//i  9
    input  wire                       bucket_dec_wend       ,//i  1 
    input  wire                       pulse_1ms             ,//i  1 
    output reg   [(DEPTH_WIDTH-1):0]  bucket_inc_cnt        ,//o  9 
    output reg                        bucket_af             ,//o  1 
    // others
    output reg                        bucket_err            ,//o  1   
    output reg                        bucket_full_time_over  //o  1   
    );

/******************************************************************************\
    parameters
\******************************************************************************/
localparam      COM_WIDTH          = DEPTH_WIDTH + DATA_BWIDTH - LEN_WIDTH;
localparam      AFF_WL             = FIFO_DEPTH - MAX_FRM_CNT;
/******************************************************************************\
    signal
\******************************************************************************/

reg  [10:0]                 bucket_time_over_cnt;
wire [(DEPTH_WIDTH-1):0]    bucket_inc_pre;
reg  [(DEPTH_WIDTH-1):0]    bucket_dec_cnt;
wire [(DEPTH_WIDTH-1):0]    fifo_size;
wire [(DEPTH_WIDTH-1):0]    fifo_used;
wire [(DEPTH_WIDTH-1):0]    allow_bucket_len;
wire [(DEPTH_WIDTH-1):0]    onway_bucket_len;
wire                        bucket_cnt_err;
/******************************************************************************\
    processes
\******************************************************************************/

//=============================Token bucket Mannger=============================
////////////////////////////////////////////////////////////////////////////////
//clk               |   |   |   |   |   |   |   |   |   |   |
//                  ________________________________ ___________
//port              ________|_0_____________________|_1_________
//                               _______________
//port0_rxff_rd     ____________|               |_______________
//                  ____ ___ ___ ___________ ___ ___ ___ _______
//port0_rdata       _x__|_x_|_x_|_x_|_x_|_0_|_1_|_2_|_3_|_______
//                  ____ ___ ___ ___________ ___ ___ ___ _______
//bucket_inc_pre   _x__|_x_|_x_|_x_|_x_|_a_|_b_|_c_|_d_|_______
//                  ____ ___ ___ ___ ___________ ___ ___ ___ __
//bucket_inc       _x__|_x_|_x_|_x_|_x_|_x_|_a_|_b_|_c_|_d_|__
//                                           _______
//port0_rd_unallow  ________________________|       |___________
//                                               ___
//sch_end           ____________________________|   |___________
//                               _______________
//sch_rd            ____________|               |_______________
//                                   _______________
//sch_rd_d1         ________________|               |___________
//                                       _______________
//sch_rd_vld        ____________________|               |_______

//bucket

assign  bucket_inc_pre     = {{(COM_WIDTH){1'b0}},bucket_inc_wdata[(LEN_WIDTH-1):DATA_BWIDTH]}
                             + {{(DEPTH_WIDTH - 1){1'b0}},(|bucket_inc_wdata[(DATA_BWIDTH-1):0])};

assign  fifo_size          = FIFO_DEPTH - MAX_FRM_CNT - REV_LEN;
assign  fifo_used          = (data_ff_waterline < AFF_WL) ? (data_ff_waterline + MAX_FRM_CNT) : {(DEPTH_WIDTH-1){1'b1}};


assign  allow_bucket_len   = (fifo_size > fifo_used) 
                             ? (fifo_size - fifo_used) : {(DEPTH_WIDTH-1){1'b0}};


assign  onway_bucket_len    =  bucket_inc_cnt - bucket_dec_cnt;

always @ (posedge clk or posedge reset)
    if (reset == 1'b1)
        bucket_af <=  1'b0;
    else
        bucket_af <=  (onway_bucket_len >= allow_bucket_len);

always @ (posedge clk or posedge reset)
    if (reset == 1'b1)
        bucket_inc_cnt <=   {(DEPTH_WIDTH){1'b0}};
    else if ( bucket_inc_wr == 1'b1)
        bucket_inc_cnt <=   bucket_inc_cnt
                                 + bucket_inc_pre;


always @ (posedge clk or posedge reset)
    if (reset == 1'b1)
        bucket_dec_cnt <=  {(DEPTH_WIDTH){1'b0}};
    else if (bucket_dec_wr == 1'b1)
        bucket_dec_cnt <=   bucket_dec_cnt
                                 + {{(DEPTH_WIDTH-1){1'b0}},1'b1};

assign bucket_cnt_err  =  (bucket_dec_data
                           != (bucket_dec_cnt  + {{(DEPTH_WIDTH-1){1'b0}},1'b1}))
                          & bucket_dec_wr & bucket_dec_wend;

//bucket full overtime
always @ (posedge clk or posedge reset)
    if (reset == 1'b1)
       bucket_time_over_cnt <=  11'd0;
    else if(bucket_dec_wr | bucket_time_over_cnt[10])
       bucket_time_over_cnt <=  11'd0;
    else if(bucket_af & pulse_1ms &(bucket_time_over_cnt[10] == 1'b0))
       bucket_time_over_cnt <=  bucket_time_over_cnt + 11'd1;


always @ (posedge clk or posedge reset)
    if (reset == 1'b1)
       bucket_full_time_over <=  1'b0;
    else
       bucket_full_time_over <=  bucket_time_over_cnt[10];

//******************************************************************************
//                                  error and warning
//******************************************************************************
always @ (posedge clk or posedge reset)
    if (reset == 1'b1)
       bucket_err          <=   1'd0;
    else
       bucket_err          <=   bucket_cnt_err;

endmodule
