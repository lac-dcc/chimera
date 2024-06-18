// This program was cloned from: https://github.com/MongooseOrion/Multi-channel-video-splicing
// License: GNU General Public License v3.0

/* =======================================================================
* Copyright (c) 2023, MongooseOrion.
* All rights reserved.
*
* The following code snippet may contain portions that are derived from
* OPEN-SOURCE communities, and these portions will be licensed with: 
*
* <NULL>
*
* If there is no OPEN-SOURCE licenses are listed, it indicates none of
* content in this Code document is sourced from OPEN-SOURCE communities. 
*
* In this case, the document is protected by copyright, and any use of
* all or part of its content by individuals, organizations, or companies
* without authorization is prohibited, unless the project repository
* associated with this document has added relevant OPEN-SOURCE licenses
* by github.com/MongooseOrion. 
*
* Please make sure using the content of this document in accordance with 
* the respective OPEN-SOURCE licenses. 
* 
* THIS CODE IS PROVIDED BY https://github.com/MongooseOrion. 
* FILE ENCODER TYPE: GBK
* ========================================================================
*/
// 将 buf 数据通过 axi 写入 ddr（可基于乱序和 outstanding）
//
module axi_interconnect_wr #(
    parameter MEM_ROW_WIDTH        = 15     ,
    parameter MEM_COLUMN_WIDTH     = 10     ,
    parameter MEM_BANK_WIDTH       = 3      ,
    parameter CTRL_ADDR_WIDTH = MEM_ROW_WIDTH + MEM_BANK_WIDTH + MEM_COLUMN_WIDTH,
    parameter DQ_WIDTH          = 12'd32    ,
    parameter BURST_LEN         = 12'd16    ,
    parameter H_HEIGHT = 'd720              ,
    parameter H_WIDTH = 'd1280              
)(
    input                               clk,                // ddr core clk
    input                               rst,
    // 通道 1
    input                               channel1_rready /*synthesis PAP_MARK_DEBUG="1"*/,
    input       [DQ_WIDTH*8-1'b1:0]     channel1_data   ,
    input                               channel1_vsync  ,
    output reg                          channel1_rd_en  /*synthesis PAP_MARK_DEBUG="1"*/,
    // 通道 2
    input                               channel2_rready /*synthesis PAP_MARK_DEBUG="1"*/,
    input       [DQ_WIDTH*8-1'b1:0]     channel2_data   ,
    input                               channel2_vsync  ,
    output reg                          channel2_rd_en  /*synthesis PAP_MARK_DEBUG="1"*/,
    // 通道 3
    input                               channel3_rready /*synthesis PAP_MARK_DEBUG="1"*/,
    input       [DQ_WIDTH*8-1'b1:0]     channel3_data   ,
    input                               channel3_vsync  ,
    output reg                          channel3_rd_en  /*synthesis PAP_MARK_DEBUG="1"*/,
    // 通道 4
    input                               channel4_rready /*synthesis PAP_MARK_DEBUG="1"*/,
    input       [DQ_WIDTH*8-1'b1:0]     channel4_data   ,
    input                               channel4_vsync  ,
    output reg                          channel4_rd_en  /*synthesis PAP_MARK_DEBUG="1"*/,
    // 通道 5
    input                               channel5_rready /*synthesis PAP_MARK_DEBUG="1"*/,
    input       [DQ_WIDTH*8-1'b1:0]     channel5_data   ,
    input                               channel5_vsync  ,
    output reg                          channel5_rd_en  /*synthesis PAP_MARK_DEBUG="1"*/,

    // 写完成，用于其他模块初始化
    output reg                          init_qd_done    ,
    output reg                          init_tc_done    ,
    output reg                          init_done       /*synthesis PAP_MARK_DEBUG="1"*/,

    // AXI WRITE INTERFACE
    output [CTRL_ADDR_WIDTH-1:0]        axi_awaddr      ,
    output [3:0]                        axi_awid        ,
    output [3:0]                        axi_awlen       ,
    output [2:0]                        axi_awsize      ,
    output [1:0]                        axi_awburst     ,
    input                               axi_awready     ,
    output                              axi_awvalid     ,

    output [DQ_WIDTH*8-1'b1:0]          axi_wdata       ,
    output [DQ_WIDTH -1'b1 :0]          axi_wstrb       ,
    input                               axi_wlast       ,
    output                              axi_wvalid      ,
    input                               axi_wready      ,

    input  [3:0]                        axi_bid         ,
    input                               axi_bvalid      ,
    output                              axi_bready      
);


// 地址偏移量
parameter FRAME_ADDR_OFFSET_1 = 'd30_000;
parameter FRAME_ADDR_OFFSET_2 = 'd260_000;
parameter   ADDR_OFFSET_1 = 'd0,                    
            ADDR_OFFSET_2 = FRAME_ADDR_OFFSET_1 * 2,  
            ADDR_OFFSET_3 = ADDR_OFFSET_2 + 2 * (FRAME_ADDR_OFFSET_1),
            ADDR_OFFSET_4 = ADDR_OFFSET_3 + 2 * (FRAME_ADDR_OFFSET_1),
            ADDR_OFFSET_5 = ADDR_OFFSET_4 + 2 * (FRAME_ADDR_OFFSET_1);
parameter ADDR_STEP = BURST_LEN * 8;       // 首地址自增步长，1 个地址 32 位数据，这与芯片的 DQ 宽度有关
// 状态机轮询
parameter   INIT_WAIT = 4'd0,
            CH1_WAIT = 4'd1,
            CH1_ADDR = 4'd2,
            CH1_DATA = 4'd3,
            CH2_WAIT = 4'd4,
            CH2_ADDR = 4'd5,
            CH2_DATA = 4'd6,
            CH3_WAIT = 4'd7,
            CH3_ADDR = 4'd8,
            CH3_DATA = 4'd9,
            CH4_WAIT = 4'd10,
            CH4_ADDR = 4'd11,
            CH4_DATA = 4'd12,
            CH5_WAIT = 4'd13,
            CH5_ADDR = 4'd14,
            CH5_DATA = 4'd15;
parameter WIDTH_QD = H_WIDTH / 4;
parameter HEIGHT_QD = H_HEIGHT / 4;
parameter WIDTH_TC = H_WIDTH * 3/4;
parameter HEIGHT_TC = H_HEIGHT * 3/4;

wire                            pose_vs_1;
wire                            pose_vs_2;
wire                            pose_vs_3;
wire                            pose_vs_4;
wire                            pose_vs_5;
wire                            pose_awvalid;
wire  [15:0]                     axi_wdata_reg/*synthesis PAP_MARK_DEBUG="1"*/;

reg [CTRL_ADDR_WIDTH-1:0]       reg_axi_awaddr  ;
reg                             reg_axi_awvalid ;
reg [DQ_WIDTH*8-1'b1:0]         reg_axi_wdata   ;
reg                             reg_axi_wvalid  ;
reg                             reg_axi_bready  ;
reg                             reg_axi_rready  ;

reg                             processing_wait     ;
reg [3:0]                       buf_rd_state        /*synthesis PAP_MARK_DEBUG="1"*/;
reg                             channel1_vs         ;
reg                             channel1_vs_d1      ;
reg                             channel2_vs         ;
reg                             channel2_vs_d1      ;
reg                             channel3_vs         ;
reg                             channel3_vs_d1      ;
reg                             channel4_vs         ;
reg                             channel4_vs_d1      ;
reg                             channel5_vs         ;
reg                             channel5_vs_d1      ;
reg [1:0]                       frame_count_1       ;
reg [1:0]                       frame_count_2       ;
reg [1:0]                       frame_count_3       ;
reg [1:0]                       frame_count_4       ;
reg [1:0]                       frame_count_5       ;
reg                             awvalid_temp        ;
reg [15:0]                      reg_axi_awaddr_1    /*synthesis PAP_MARK_DEBUG="1"*/;
reg [15:0]                      reg_axi_awaddr_2    /*synthesis PAP_MARK_DEBUG="1"*/;
reg [15:0]                      reg_axi_awaddr_3   /*synthesis PAP_MARK_DEBUG="1"*/ ;
reg [15:0]                      reg_axi_awaddr_4   /*synthesis PAP_MARK_DEBUG="1"*/ ;
reg [19:0]                      reg_axi_awaddr_5   /*synthesis PAP_MARK_DEBUG="1"*/ ;

assign axi_wdata_reg = axi_wdata;

assign axi_awaddr   = reg_axi_awaddr        ;
assign axi_awvalid  = reg_axi_awvalid       ;
assign axi_awlen    = BURST_LEN - 1'b1      ;   // 突发长度：16
assign axi_awsize   = DQ_WIDTH              ;   // DATA_LEN = 256
assign axi_awburst  = 2'b01                 ;
assign axi_wdata    = reg_axi_wdata         ;
assign axi_wvalid   = reg_axi_wvalid        ;
assign axi_wstrb    = {DQ_WIDTH{1'b1}}      ;
assign axi_bready   = reg_axi_bready        ;

assign pose_awvalid = ((awvalid_temp) && (~reg_axi_awvalid)) ? 1'b1 : 1'b0;


// 状态机跳转
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        buf_rd_state <= 'b0;
    end
    else begin
        case(buf_rd_state)
            INIT_WAIT: begin
                if(processing_wait == 1'b1) begin
                    buf_rd_state <= INIT_WAIT;
                end
                else begin
                    buf_rd_state <= CH1_WAIT;
                end
            end
            CH1_WAIT: begin
                if(channel1_rready == 1'b0) begin
                    buf_rd_state <= CH2_WAIT;
                end
                else begin
                    buf_rd_state <= CH1_ADDR;
                end
            end
            CH1_ADDR: begin
                if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                    buf_rd_state <= CH1_DATA;
                end
                else begin
                    buf_rd_state <= buf_rd_state;
                end
            end
            CH1_DATA: begin
                if(axi_wlast) begin
                    buf_rd_state <= CH2_WAIT;
                end
                else begin
                    buf_rd_state <= buf_rd_state;
                end
            end
            CH2_WAIT: begin
                if(channel2_rready == 1'b0) begin
                    buf_rd_state <= CH3_WAIT;
                end
                else begin
                    buf_rd_state <= CH2_ADDR;
                end
            end
            CH2_ADDR: begin
                if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                    buf_rd_state <= CH2_DATA;
                end
                else begin
                    buf_rd_state <= buf_rd_state;
                end
            end
            CH2_DATA: begin
                if(axi_wlast) begin
                    buf_rd_state <= CH3_WAIT;
                end
                else begin
                    buf_rd_state <= buf_rd_state;
                end
            end
            CH3_WAIT: begin
                if(channel3_rready == 1'b0) begin
                    buf_rd_state <= CH4_WAIT;
                end
                else begin
                    buf_rd_state <= CH3_ADDR;
                end
            end
            CH3_ADDR: begin
                if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                    buf_rd_state <= CH3_DATA;
                end
                else begin
                    buf_rd_state <= buf_rd_state;
                end
            end
            CH3_DATA: begin
                if(axi_wlast) begin
                    buf_rd_state <= CH4_WAIT;
                end
                else begin
                    buf_rd_state <= buf_rd_state;
                end
            end
            CH4_WAIT: begin
                if(channel4_rready == 1'b0) begin
                    buf_rd_state <= CH5_WAIT;
                end
                else begin
                    buf_rd_state <= CH4_ADDR;
                end
            end
            CH4_ADDR: begin
                if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                    buf_rd_state <= CH4_DATA;
                end
                else begin
                    buf_rd_state <= buf_rd_state;
                end
            end
            CH4_DATA: begin
                if(axi_wlast) begin
                    buf_rd_state <= CH5_WAIT;
                end
                else begin
                    buf_rd_state <= buf_rd_state;
                end
            end
            CH5_WAIT: begin
                if(channel5_rready == 1'b0) begin
                    buf_rd_state <= CH1_WAIT;
                end
                else begin
                    buf_rd_state <= CH5_ADDR;
                end
            end
            CH5_ADDR: begin
                if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                    buf_rd_state <= CH5_DATA;
                end
                else begin
                    buf_rd_state <= buf_rd_state;
                end
            end
            CH5_DATA: begin
                if((axi_wlast === 1'b1) && (processing_wait == 1'b0)) begin
                    buf_rd_state <= CH1_WAIT;
                end
                else if((axi_wlast == 1'b1) && (processing_wait == 1'b1)) begin
                    buf_rd_state <= INIT_WAIT;
                end
                else begin
                    buf_rd_state <= buf_rd_state;
                end
            end
            default: buf_rd_state <= INIT_WAIT;
        endcase
    end
end


// 根据场同步信号生成帧索引
// 先进行重采样，确保所有的场同步信号只拉高一个周期
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        channel1_vs <= 'b0;
        channel1_vs_d1 <= 'b0;
        channel2_vs <= 'b0;
        channel2_vs_d1 <= 'b0;
        channel3_vs <= 'b0;
        channel3_vs_d1 <= 'b0;
        channel4_vs <= 'b0;
        channel4_vs_d1 <= 'b0;
        channel5_vs <= 'b0;
        channel5_vs_d1 <= 'b0;
    end
    else begin
        channel1_vs <= channel1_vsync;
        channel1_vs_d1 <= channel1_vs;
        channel2_vs <= channel2_vsync;
        channel2_vs_d1 <= channel2_vs;
        channel3_vs <= channel3_vsync;
        channel3_vs_d1 <= channel3_vs;
        channel4_vs <= channel4_vsync;
        channel4_vs_d1 <= channel4_vs;
        channel5_vs <= channel5_vsync;
        channel5_vs_d1 <= channel5_vs;
    end
end

assign pose_vs_1 = ((channel1_vs) && (~channel1_vs_d1)) ? 1'b1 : 1'b0;
assign pose_vs_2 = ((channel2_vs) && (~channel2_vs_d1)) ? 1'b1 : 1'b0;
assign pose_vs_3 = ((channel3_vs) && (~channel3_vs_d1)) ? 1'b1 : 1'b0;
assign pose_vs_4 = ((channel4_vs) && (~channel4_vs_d1)) ? 1'b1 : 1'b0;
assign pose_vs_5 = ((channel5_vs) && (~channel5_vs_d1)) ? 1'b1 : 1'b0;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        frame_count_1 <= 'b0;
        frame_count_2 <= 'b0;
        frame_count_3 <= 'b0;
        frame_count_4 <= 'b0;
        frame_count_5 <= 'b0;
    end
    else begin
        if(pose_vs_1) begin
            if(frame_count_1 == 2'd2) begin
                frame_count_1 <= 2'd1;
            end
            else begin
                frame_count_1 <= frame_count_1 + 1'b1;
            end
        end
        else begin
            frame_count_1 <= frame_count_1;
        end
        if(pose_vs_2) begin
            if(frame_count_2 == 2'd2) begin
                frame_count_2 <= 2'd1;
            end
            else begin
                frame_count_2 <= frame_count_2 + 1'b1;
            end
        end
        else begin
            frame_count_2 <= frame_count_2;
        end
        if(pose_vs_3) begin
            if(frame_count_3 == 2'd2) begin
                frame_count_3 <= 2'd1;
            end
            else begin
                frame_count_3 <= frame_count_3 + 1'b1;
            end
        end
        else begin
            frame_count_3 <= frame_count_3;
        end
        if(pose_vs_4) begin
            if(frame_count_4 == 2'd2) begin
                frame_count_4 <= 2'd1;
            end
            else begin
                frame_count_4 <= frame_count_4 + 1'b1;
            end
        end
        else begin
            frame_count_4 <= frame_count_4;
        end
        if(pose_vs_5) begin
            if(frame_count_5 == 2'd2) begin
                frame_count_5 <= 2'd1;
            end
            else begin
                frame_count_5 <= frame_count_5 + 1'b1;
            end
        end
        else begin
            frame_count_5 <= frame_count_5;
        end
    end
end


// 状态机的内部信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        awvalid_temp <= 'b0;
        reg_axi_awvalid <= 'b0;
        reg_axi_awaddr_1 <= 'b0;
        reg_axi_awaddr_2 <= 'b0;
        reg_axi_awaddr_3 <= 'b0;
        reg_axi_awaddr_4 <= 'b0;
        reg_axi_awaddr_5 <= 'b0;
        reg_axi_awaddr <= 'b0;
    end
    else begin
        case(buf_rd_state)
            CH1_ADDR: begin
                // 握手设置
                if(axi_awready) begin
                    awvalid_temp <= 1'b0;
                    reg_axi_awvalid <= 1'b0;
                end
                else begin
                    awvalid_temp <= 1'b1;
                    reg_axi_awvalid <= awvalid_temp;
                end
                // 地址设置
                if(frame_count_1 == 2'd1) begin                         // 帧 1 使用基地址 1
                    if(pose_awvalid) begin                              // 没握手之前生成首地址
                        reg_axi_awaddr <= ADDR_OFFSET_1 + reg_axi_awaddr_1;
                    end
                    else if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                        reg_axi_awaddr_1 <= reg_axi_awaddr_1 + ADDR_STEP;
                    end
                    else begin
                        reg_axi_awaddr <= reg_axi_awaddr;
                        reg_axi_awaddr_1 <= reg_axi_awaddr_1;
                    end
                end
                else if(frame_count_1 == 2'd2) begin                    // 帧 2 使用基地址 2
                    if(pose_awvalid) begin                              // 没握手之前生成首地址
                        reg_axi_awaddr <= ADDR_OFFSET_1 + FRAME_ADDR_OFFSET_1 + reg_axi_awaddr_1;
                    end
                    else if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                        reg_axi_awaddr_1 <= reg_axi_awaddr_1 + ADDR_STEP;
                    end
                    else begin
                        reg_axi_awaddr <= reg_axi_awaddr;
                        reg_axi_awaddr_1 <= reg_axi_awaddr_1;
                    end
                end
            end
            CH2_ADDR: begin
                // 握手设置
                if(axi_awready) begin
                    awvalid_temp <= 1'b0;
                    reg_axi_awvalid <= 1'b0;
                end
                else begin
                    awvalid_temp <= 1'b1;
                    reg_axi_awvalid <= awvalid_temp;
                end
                // 地址设置
                if(frame_count_2 == 2'd1) begin                         // 帧 1 使用基地址 1
                    if(pose_awvalid) begin                              // 没握手之前生成首地址
                        reg_axi_awaddr <= ADDR_OFFSET_2 + reg_axi_awaddr_2;
                    end
                    else if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                        reg_axi_awaddr_2 <= reg_axi_awaddr_2 + ADDR_STEP;
                    end
                    else begin
                        reg_axi_awaddr <= reg_axi_awaddr;
                        reg_axi_awaddr_2 <= reg_axi_awaddr_2;
                    end
                end
                else if(frame_count_2 == 2'd2) begin                    // 帧 2 使用基地址 2
                    if(pose_awvalid) begin                              // 没握手之前生成首地址
                        reg_axi_awaddr <= ADDR_OFFSET_2 + FRAME_ADDR_OFFSET_1 + reg_axi_awaddr_2;
                    end
                    else if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                        reg_axi_awaddr_2 <= reg_axi_awaddr_2 + ADDR_STEP;
                    end
                    else begin
                        reg_axi_awaddr <= reg_axi_awaddr;
                        reg_axi_awaddr_2 <= reg_axi_awaddr_2;
                    end
                end 
            end
            CH3_ADDR: begin
                // 握手设置
                if(axi_awready) begin
                    awvalid_temp <= 1'b0;
                    reg_axi_awvalid <= 1'b0;
                end
                else begin
                    awvalid_temp <= 1'b1;
                    reg_axi_awvalid <= awvalid_temp;
                end
                // 地址设置
                if(frame_count_3 == 2'd1) begin                         // 帧 1 使用基地址 1
                    if(pose_awvalid) begin                              // 没握手之前生成首地址
                        reg_axi_awaddr <= ADDR_OFFSET_3 + reg_axi_awaddr_3;
                    end
                    else if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                        reg_axi_awaddr_3 <= reg_axi_awaddr_3 + ADDR_STEP;
                    end
                    else begin
                        reg_axi_awaddr <= reg_axi_awaddr;
                        reg_axi_awaddr_3 <= reg_axi_awaddr_3;
                    end
                end
                else if(frame_count_3 == 2'd2) begin                    // 帧 2 使用基地址 2
                    if(pose_awvalid) begin                              // 没握手之前生成首地址
                        reg_axi_awaddr <= ADDR_OFFSET_3 + FRAME_ADDR_OFFSET_1 + reg_axi_awaddr_3;
                    end
                    else if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                        reg_axi_awaddr_3 <= reg_axi_awaddr_3 + ADDR_STEP;
                    end
                    else begin
                        reg_axi_awaddr <= reg_axi_awaddr;
                        reg_axi_awaddr_3 <= reg_axi_awaddr_3;
                    end
                end
            end
            CH4_ADDR: begin
                // 握手设置
                if(axi_awready) begin
                    awvalid_temp <= 1'b0;
                    reg_axi_awvalid <= 1'b0;
                end
                else begin
                    awvalid_temp <= 1'b1;
                    reg_axi_awvalid <= awvalid_temp;
                end
                // 地址设置
                if(frame_count_4 == 2'd1) begin                         // 帧 1 使用基地址 1
                    if(pose_awvalid) begin                              // 没握手之前生成首地址
                        reg_axi_awaddr <= ADDR_OFFSET_4 + reg_axi_awaddr_4;
                    end
                    else if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                        reg_axi_awaddr_4 <= reg_axi_awaddr_4 + ADDR_STEP;
                    end
                    else begin
                        reg_axi_awaddr <= reg_axi_awaddr;
                        reg_axi_awaddr_4 <= reg_axi_awaddr_4;
                    end
                end
                else if(frame_count_4 == 2'd2) begin                    // 帧 2 使用基地址 2
                    if(pose_awvalid) begin                              // 没握手之前生成首地址
                        reg_axi_awaddr <= ADDR_OFFSET_4 + FRAME_ADDR_OFFSET_1 + reg_axi_awaddr_4;
                    end
                    else if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                        reg_axi_awaddr_4 <= reg_axi_awaddr_4 + ADDR_STEP;
                    end
                    else begin
                        reg_axi_awaddr <= reg_axi_awaddr;
                        reg_axi_awaddr_4 <= reg_axi_awaddr_4;
                    end
                end
            end
            CH5_ADDR: begin
                // 握手设置
                if(axi_awready) begin
                    awvalid_temp <= 1'b0;
                    reg_axi_awvalid <= 1'b0;
                end
                else begin
                    awvalid_temp <= 1'b1;
                    reg_axi_awvalid <= awvalid_temp;
                end
                // 地址设置
                if(frame_count_5 == 2'd1) begin                         // 帧 1 使用基地址 1
                    if(pose_awvalid) begin                              // 没握手之前生成首地址
                        reg_axi_awaddr <= ADDR_OFFSET_5 + reg_axi_awaddr_5;
                    end
                    else if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                        reg_axi_awaddr_5 <= reg_axi_awaddr_5 + ADDR_STEP;
                    end
                    else begin
                        reg_axi_awaddr <= reg_axi_awaddr;
                        reg_axi_awaddr_5 <= reg_axi_awaddr_5;
                    end
                end
                else if(frame_count_5 == 2'd2) begin                    // 帧 2 使用基地址 2
                    if(pose_awvalid) begin                              // 没握手之前生成首地址
                        reg_axi_awaddr <= ADDR_OFFSET_5 + FRAME_ADDR_OFFSET_2 + reg_axi_awaddr_5;
                    end
                    else if((axi_awvalid == 1'b1) && (axi_awready == 1'b1)) begin
                        reg_axi_awaddr_5 <= reg_axi_awaddr_5 + ADDR_STEP;
                    end
                    else begin
                        reg_axi_awaddr <= reg_axi_awaddr;
                        reg_axi_awaddr_5 <= reg_axi_awaddr_5;
                    end
                end
            end
            default: begin
                awvalid_temp <= awvalid_temp;
                reg_axi_awvalid <= reg_axi_awvalid;
                reg_axi_awaddr_1 <= reg_axi_awaddr_1;
                reg_axi_awaddr_2 <= reg_axi_awaddr_2;
                reg_axi_awaddr_3 <= reg_axi_awaddr_3;
                reg_axi_awaddr_4 <= reg_axi_awaddr_4;
                reg_axi_awaddr_5 <= reg_axi_awaddr_5;
                reg_axi_awaddr <= reg_axi_awaddr;
            end
        endcase
    end
    if(pose_vs_1) begin
        reg_axi_awaddr_1 <= 'b0;
    end
    if(pose_vs_2) begin
        reg_axi_awaddr_2 <= 'b0;
    end
    if(pose_vs_3) begin
        reg_axi_awaddr_3 <= 'b0;
    end
    if(pose_vs_4) begin
        reg_axi_awaddr_4 <= 'b0;
    end
    if(pose_vs_5) begin
        reg_axi_awaddr_5 <= 'b0;
    end
end 


always @(*) begin
    case(buf_rd_state)
        CH1_DATA: begin
            channel1_rd_en <=  axi_wready;
            reg_axi_wdata <= channel1_data;
        end
        CH2_DATA: begin
            channel2_rd_en <=  axi_wready;
            reg_axi_wdata <= channel2_data;
        end
        CH3_DATA: begin
            channel3_rd_en <=  axi_wready;
            reg_axi_wdata <= channel3_data;
        end
        CH4_DATA: begin
            channel4_rd_en <=  axi_wready;
            reg_axi_wdata <= channel4_data;
        end
        CH5_DATA: begin
            channel5_rd_en <=  axi_wready;
            reg_axi_wdata <= channel5_data;
        end
        default:begin
            channel1_rd_en <= 1'b0;
            channel2_rd_en <= 1'b0;
            channel3_rd_en <= 1'b0;
            channel4_rd_en <= 1'b0;
            channel5_rd_en <= 1'b0;
            reg_axi_wdata <= 'd0;
        end
    endcase
end


// 已经写入足够的数据，可用于其他模块初始化
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        init_qd_done <= 'b0;            // 上部分
        init_tc_done <= 'b0;            // 下部分
        init_done <= 'b0;               // 全局
    end
    else if((reg_axi_awaddr_1 >= WIDTH_QD * HEIGHT_QD * 16 / 64)
            && (reg_axi_awaddr_2 >= WIDTH_QD * HEIGHT_QD * 16 / 64)
            && (reg_axi_awaddr_3 >= WIDTH_QD * HEIGHT_QD * 16 / 64)
            && (reg_axi_awaddr_4 >= WIDTH_QD * HEIGHT_QD * 16 / 64)) begin
        init_qd_done <= 1'b1;
    end
    else if(reg_axi_awaddr_5 >= WIDTH_TC * HEIGHT_TC * 16 / 64) begin
        init_tc_done <= 1'b1;
    end
    else if((init_qd_done == 1'b1) || (init_tc_done == 1'b1)) begin
        init_done <= 1'b1;
    end
    else begin
        init_qd_done <= init_qd_done;
        init_tc_done <= init_tc_done;
        init_done <= init_done;
    end
end

endmodule