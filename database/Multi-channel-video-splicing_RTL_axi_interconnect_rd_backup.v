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
// 从 ddr 中读数据，并送往 hdmi 时序生成模块
//
module axi_interconnect_rd #(
    parameter MEM_ROW_WIDTH        = 15     ,
    parameter MEM_COLUMN_WIDTH     = 10     ,
    parameter MEM_BANK_WIDTH       = 3      ,
    parameter CTRL_ADDR_WIDTH = MEM_ROW_WIDTH + MEM_BANK_WIDTH + MEM_COLUMN_WIDTH,
    parameter DQ_WIDTH          = 12'd32    ,
    parameter H_HEIGHT = 'd720              ,
    parameter H_WIDTH = 'd1280              ,
    parameter BURST_LEN = 'd10
)(
    input                               clk             ,
    input                               rst             ,

    // hdmi 时序相关信号
    input                               hdmi_vsync      ,
    input                               hdmi_href       ,

    // 输出数据给 buffer
    input                               init_done       ,
    input                               axi_wr_buf_wait ,   // 必须提前拉高并持续一段时间
    input  [1:0]                        channel_sel     ,
    output                              buf_wr_en       /*synthesis PAP_MARK_DEBUG="1"*/,
    output [DQ_WIDTH*8-1:0]             buf_wr_data     /*synthesis PAP_MARK_DEBUG="1"*/,    
    
    // AXI READ INTERFACE
    output                              axi_arvalid     /*synthesis PAP_MARK_DEBUG="1"*/,  
    input                               axi_arready     /*synthesis PAP_MARK_DEBUG="1"*/, 
    output [CTRL_ADDR_WIDTH-1:0]        axi_araddr      ,  
    output [3:0]                        axi_arid        ,  
    output [3:0]                        axi_arlen       ,  
    output [2:0]                        axi_arsize      ,  
    output [1:0]                        axi_arburst     ,  
                                                         
    output                              axi_rready      /*synthesis PAP_MARK_DEBUG="1"*/,  
    input  [DQ_WIDTH*8-1:0]             axi_rdata       ,  
    input                               axi_rvalid      /*synthesis PAP_MARK_DEBUG="1"*/,  
    input                               axi_rlast       /*synthesis PAP_MARK_DEBUG="1"*/,  
    input  [3:0]                        axi_rid         
);

parameter WIDTH_QD = H_WIDTH / 4;
parameter HEIGHT_QD = H_HEIGHT / 4;
parameter WIDTH_TC = H_WIDTH * 3/4;
parameter HEIGHT_TC = H_HEIGHT * 3/4;
parameter   INIT_WAIT = 4'b0000,              // AXI 读状态机
            WR1_WAIT = 4'b0001,
            WR_1 = 4'b0010,
            WR2_WAIT = 4'b0011,
            WR_2 = 4'b0100,
            WR3_WAIT = 4'b0101,
            WR_3 = 4'b0110,
            WR4_WAIT = 4'b0111,
            WR_4 = 4'b1000,
            WR5_WAIT = 4'b1001,
            WR_5 = 4'b1010;
// 地址偏移量
parameter FRAME_ADDR_OFFSET_1 = 'd30_000;
parameter FRAME_ADDR_OFFSET_2 = 'd260_000;
parameter   ADDR_OFFSET_1 = 'd0,                    
            ADDR_OFFSET_2 = FRAME_ADDR_OFFSET_1 * 2,  
            ADDR_OFFSET_3 = ADDR_OFFSET_2 + 2 * (FRAME_ADDR_OFFSET_1),      // 
            ADDR_OFFSET_4 = ADDR_OFFSET_3 + 2 * (FRAME_ADDR_OFFSET_1),
            ADDR_OFFSET_5 = ADDR_OFFSET_4 + 2 * (FRAME_ADDR_OFFSET_1);
parameter ADDR_STEP = BURST_LEN * 8;       // 首地址自增步长，1 个地址 32 位数据，这与芯片的 DQ 宽度有关

wire                            nege_axi_wr_wait;
wire                            nege_vsync      ;
wire                            pose_vsync      ;
wire                            nege_href       ;
wire                            nege_axi_rd_en  ;

reg [CTRL_ADDR_WIDTH-1:0]       reg_axi_araddr  /*synthesis PAP_MARK_DEBUG="1"*/;
reg                             reg_axi_arvalid ;
reg                             reg_axi_rready  ;
reg [DQ_WIDTH*8-1:0]            reg_axi_rdata   ;

reg                             reg_vsync_d1    ;
reg                             reg_vsync_d2    ;
reg                             reg_href_d1     ;
reg                             reg_href_d2     ;
reg                             row_end_flag_1  ;
reg                             row_end_flag_2  ;
reg                             axi_rd_en       ;
reg                             axi_rd_en_d1    ;
reg                             frame_en        ;
reg [9:0]                       vsync_count     ;
reg [9:0]                       pix_count_qd    ;
reg [9:0]                       pix_count_tc    ;
reg                             sel2_en         ;
reg [3:0]                       buf_wr_state    ;
reg [CTRL_ADDR_WIDTH-1:0]       reg_axi_araddr_1;
reg [CTRL_ADDR_WIDTH-1:0]       reg_axi_araddr_2;
reg [CTRL_ADDR_WIDTH-1:0]       reg_axi_araddr_3;
reg [CTRL_ADDR_WIDTH-1:0]       reg_axi_araddr_4;
reg [CTRL_ADDR_WIDTH-1:0]       reg_axi_araddr_5;
reg [1:0]                       frame_count_1   ;
reg [1:0]                       frame_count_2   ;
reg [1:0]                       frame_count_3   ;
reg [1:0]                       frame_count_4   ;
reg [1:0]                       frame_count_5   ;

assign axi_arvalid  = reg_axi_arvalid       ;
assign axi_araddr   = reg_axi_araddr        ;
assign axi_arlen    = BURST_LEN - 1'b1      ;   // 突发长度
assign axi_arsize   = DQ_WIDTH*8/8          ;   // DATA_LEN = 256
assign axi_arburst  = 2'b01                 ;
assign axi_rready   = 1'b1                  ;

assign buf_wr_en    = ((axi_rvalid == 1'b1) && (axi_rready == 1'b1)) ? 1'b1 : 1'b0;
assign buf_wr_data  = axi_rdata;
assign pose_vsync = ((reg_vsync_d1) && (~reg_vsync_d2)) ? 1'b1 : 1'b0;
assign nege_vsync = ((~reg_vsync_d1) && (reg_vsync_d2)) ? 1'b1 : 1'b0;
assign nege_href = ((~reg_href_d1) && (reg_href_d2)) ? 1'b1 : 1'b0;


// 延迟时钟周期，跨时钟信号应延迟两个周期，确保基于它们创建的任何信号符合时序要求
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_vsync_d1 <= 'b0;
        reg_vsync_d2 <= 'b0;
        reg_href_d1 <= 'b0;
        reg_href_d2 <= 'b0;
    end
    else begin
        reg_vsync_d1 <= hdmi_vsync;
        reg_vsync_d2 <= reg_vsync_d1;
        reg_href_d1 <= hdmi_href;
        reg_href_d2 <= reg_href_d1;
    end
end


// axi 读使能信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        axi_rd_en <= 'b0;
    end
    else if((init_done == 1'b1) && 
            (nege_vsync == 1'b1) || (nege_href == 1'b1)) begin      // 场同步下升沿（首次）或行有效下降沿可读
        axi_rd_en <= 1'b1;
    end
    else if((row_end_flag_1 == 1'b1) || (row_end_flag_2 == 1'b1)) begin // 读完一行就停
        axi_rd_en <= 1'b0;
    end
    else begin
        axi_rd_en <= axi_rd_en;
    end
end

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        axi_rd_en_d1 <= 'b0;
    end
    else begin
        axi_rd_en_d1 <= axi_rd_en;
    end
end
assign nege_axi_rd_en = ((~axi_rd_en) && (axi_rd_en_d1)) ? 1'b1 : 1'b0;


// 一行读完标志信号
always @(*) begin
    if((buf_wr_state == WR_4) && (pix_count_qd == WIDTH_QD - DQ_WIDTH*8/16) 
            && (axi_rlast == 1'b1)) begin
        row_end_flag_1 <= 1'b1;
    end
    else if((buf_wr_state == WR_5) && (pix_count_tc == WIDTH_TC - DQ_WIDTH*8/16) 
            && (axi_rlast == 1'b1)) begin
        row_end_flag_2 <= 1'b1;
    end
    else if(nege_axi_rd_en) begin           // 不用本身，为了避免只持续一瞬间的高电平
        row_end_flag_1 <= 1'b0;
        row_end_flag_2 <= 1'b0;
    end
    else begin
        row_end_flag_1 <= row_end_flag_1;
        row_end_flag_2 <= row_end_flag_2;
    end
end


// 读出数据计数
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        pix_count_qd <= 'b0;
        pix_count_tc <= 'b0;
    end
    else if(sel2_en == 1'd1) begin                          // 当要取下半部分数据时
        if((axi_rready == 1'b1) && (axi_rvalid == 1'b1)) begin
            if(pix_count_tc >= WIDTH_TC - DQ_WIDTH*8/16) begin
                pix_count_tc <= 10'd0;
            end
            else begin
                pix_count_tc <= pix_count_tc + (DQ_WIDTH*8/16);
            end
        end
        else begin
            pix_count_tc <= pix_count_tc;
        end
    end
    else begin                                              // 取上半部分
        if((axi_rready == 1'b1) && (axi_rvalid == 1'b1)) begin
            if(pix_count_qd >= WIDTH_QD - DQ_WIDTH*8/16) begin
                pix_count_qd <= 10'd0;
            end
            else begin
                pix_count_qd <= pix_count_qd + (DQ_WIDTH*8/16);
            end
        end
        else begin
            pix_count_qd <= pix_count_qd;
        end
    end
end


// 进入下半部分的使能信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        sel2_en <= 'b0;
    end
    else if((channel_sel == 'd2) && (pix_count_qd == WIDTH_QD - DQ_WIDTH*8/16) 
            && (buf_wr_state == WR_4)) begin
        sel2_en <= 1'b1;
    end
    else if(channel_sel == 'd1) begin
        sel2_en <= 1'b0;
    end
    else begin
        sel2_en <= sel2_en;
    end
end


// 状态跳转
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        buf_wr_state <= 'b0;
    end
    else if(pose_vsync) begin
        buf_wr_state <= 'b0;
    end
    else if(axi_rd_en) begin
        if(sel2_en) begin                    // 如果到了下边的图像
            case(buf_wr_state)
                INIT_WAIT: begin
                    buf_wr_state <= WR5_WAIT;
                end
                WR5_WAIT: begin
                    if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                        buf_wr_state <= WR_5;
                    end
                    else begin
                        buf_wr_state <= WR5_WAIT;
                    end
                end
                WR_5: begin
                    if((pix_count_tc == WIDTH_TC - DQ_WIDTH*8/16) && (axi_rlast == 1'b1)) begin
                        buf_wr_state <= INIT_WAIT;
                    end
                    else if((pix_count_tc < WIDTH_TC - DQ_WIDTH*8/16) && (axi_rlast == 1'b1)) begin
                        buf_wr_state <= WR5_WAIT;
                    end
                    else begin
                        buf_wr_state <= buf_wr_state;
                    end
                end
                default: buf_wr_state <= buf_wr_state;
            endcase
        end
        else begin                                      // 默认，上边的图像
            case(buf_wr_state)
                INIT_WAIT: begin
                    buf_wr_state <= WR1_WAIT;
                end
                WR1_WAIT: begin
                    if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                        buf_wr_state <= WR_1;
                    end
                    else begin
                        buf_wr_state <= WR1_WAIT;
                    end
                end
                WR_1: begin
                    if((pix_count_qd == WIDTH_QD - DQ_WIDTH*8/16) && (axi_rlast == 1'b1)) begin
                        buf_wr_state <= WR2_WAIT;
                    end
                    else if((pix_count_qd < WIDTH_QD - DQ_WIDTH*8/16) && (axi_rlast == 1'b1)) begin
                        buf_wr_state <= WR1_WAIT;
                    end
                    else begin
                        buf_wr_state <= buf_wr_state;
                    end
                end
                WR2_WAIT: begin
                    if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                        buf_wr_state <= WR_2;
                    end
                    else begin
                        buf_wr_state <= WR2_WAIT;
                    end
                end
                WR_2: begin
                    if((pix_count_qd == WIDTH_QD - DQ_WIDTH*8/16) && (axi_rlast == 1'b1)) begin
                        buf_wr_state <= WR3_WAIT;
                    end
                    else if((pix_count_qd < WIDTH_QD - DQ_WIDTH*8/16) && (axi_rlast == 1'b1)) begin
                        buf_wr_state <= WR2_WAIT;
                    end
                    else begin
                        buf_wr_state <= buf_wr_state;
                    end
                end
                WR3_WAIT: begin
                    if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                        buf_wr_state <= WR_3;
                    end
                    else begin
                        buf_wr_state <= WR3_WAIT;
                    end
                end
                WR_3: begin
                    if((pix_count_qd == WIDTH_QD - DQ_WIDTH*8/16) && (axi_rlast == 1'b1)) begin
                        buf_wr_state <= WR4_WAIT;
                    end
                    else if((pix_count_qd < WIDTH_QD - DQ_WIDTH*8/16) && (axi_rlast == 1'b1)) begin
                        buf_wr_state <= WR3_WAIT;
                    end
                    else begin
                        buf_wr_state <= buf_wr_state;
                    end
                end
                WR4_WAIT: begin
                    if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                        buf_wr_state <= WR_4;
                    end
                    else begin
                        buf_wr_state <= WR4_WAIT;
                    end
                end
                WR_4: begin
                    if((pix_count_qd == WIDTH_QD - DQ_WIDTH*8/16) && (axi_rlast == 1'b1)) begin
                        buf_wr_state <= INIT_WAIT;
                    end
                    else if((pix_count_qd < WIDTH_QD - DQ_WIDTH*8/16) && (axi_rlast == 1'b1)) begin
                        buf_wr_state <= WR4_WAIT;
                    end
                end
                default: buf_wr_state <= INIT_WAIT;
            endcase
        end
    end
    else begin
        buf_wr_state <= 'b0;
    end
end


// 状态机关于握手的相关内部信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_axi_arvalid <= 'b0;
    end
    else if(axi_rd_en) begin
        case(buf_wr_state)
            WR1_WAIT: begin
                if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                    reg_axi_arvalid <= 1'b0;
                end
                else begin
                    reg_axi_arvalid <= 1'b1;
                end
            end
            WR_1: begin
                if(axi_rlast) begin
                    reg_axi_rready <= 1'b0;
                end
                else begin
                    reg_axi_rready <= 1'b1;
                end
            end
            WR2_WAIT: begin
                if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                    reg_axi_arvalid <= 1'b0;
                end
                else begin
                    reg_axi_arvalid <= 1'b1;
                end
            end
            WR_2: begin
                if(axi_rlast) begin
                    reg_axi_rready <= 1'b0;
                end
                else begin
                    reg_axi_rready <= 1'b1;
                end
            end
            WR3_WAIT: begin
                if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                    reg_axi_arvalid <= 1'b0;
                end
                else begin
                    reg_axi_arvalid <= 1'b1;
                end
            end
            WR_3: begin
                if(axi_rlast) begin
                    reg_axi_rready <= 1'b0;
                end
                else begin
                    reg_axi_rready <= 1'b1;
                end
            end
            WR4_WAIT: begin
                if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                    reg_axi_arvalid <= 1'b0;
                end
                else begin
                    reg_axi_arvalid <= 1'b1;
                end
            end
            WR_4: begin
                if(axi_rlast) begin
                    reg_axi_rready <= 1'b0;
                end
                else begin
                    reg_axi_rready <= 1'b1;
                end
            end
            WR5_WAIT: begin
                if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                    reg_axi_arvalid <= 1'b0;
                end
                else begin
                    reg_axi_arvalid <= 1'b1;
                end
            end
            WR_5: begin
                if(axi_rlast) begin
                    reg_axi_rready <= 1'b0;
                end
                else begin
                    reg_axi_rready <= 1'b1;
                end
            end
            default: begin
                reg_axi_arvalid <= 1'b1;
                reg_axi_rready <= 1'b1;
            end
        endcase
    end
    else begin
        reg_axi_arvalid <= 1'b0;
        reg_axi_rready <= 1'b0;
    end
end


// 状态机内部信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        reg_axi_araddr_1 <= 'b0;
        reg_axi_araddr_2 <= 'b0;
        reg_axi_araddr_3 <= 'b0;
        reg_axi_araddr_4 <= 'b0;
        reg_axi_araddr_5 <= 'b0;
        reg_axi_araddr <= 'b0;
        frame_count_1 <= 'b0;
        frame_count_2 <= 'b0;
        frame_count_3 <= 'b0;
        frame_count_4 <= 'b0;
        frame_count_5 <= 'b0;
    end
    else if(pose_vsync) begin
        reg_axi_araddr_1 <= 'b0;
        reg_axi_araddr_2 <= 'b0;
        reg_axi_araddr_3 <= 'b0;
        reg_axi_araddr_4 <= 'b0;
        reg_axi_araddr_5 <= 'b0;
        reg_axi_araddr <= 'b0;
    end
    else begin
        case(buf_wr_state)
            WR1_WAIT: begin
                if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                    if(reg_axi_araddr_1 < (WIDTH_QD*HEIGHT_QD*16)/256 - ADDR_STEP) begin   // 通过地址判断当前像素数量
                        reg_axi_araddr_1 <= reg_axi_araddr_1 + ADDR_STEP;
                    end
                    else begin
                        if(frame_count_1 == 2'd3) begin                         // 帧计数
                            frame_count_1 <= 2'b0;
                        end
                        else begin
                            frame_count_1 <= frame_count_1 + 1'b1;
                        end
                        reg_axi_araddr_1 <= 'b0;
                    end
                end
                else begin
                    reg_axi_araddr_1 <= reg_axi_araddr_1;
                end
                if((frame_count_1 == 2'd0) || (frame_count_1 == 2'd1)) begin                // 帧 1 使用基地址 1
                    reg_axi_araddr <= ADDR_OFFSET_1 + reg_axi_araddr_1;
                end
                else if((frame_count_1 == 2'd3) || (frame_count_1 == 2'd2)) begin           // 帧 2 使用基地址 2
                    reg_axi_araddr <= ADDR_OFFSET_1 + FRAME_ADDR_OFFSET_1 + reg_axi_araddr_1;
                end
                else begin
                    reg_axi_araddr <= reg_axi_araddr_1;
                end
            end
            WR2_WAIT: begin
                if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                    if(reg_axi_araddr_2 < (WIDTH_QD*HEIGHT_QD*16)/256 - ADDR_STEP) begin   // 通过地址判断当前像素数量
                        reg_axi_araddr_2 <= reg_axi_araddr_2 + ADDR_STEP;
                    end
                    else begin
                        if(frame_count_2 == 2'd3) begin                         // 帧计数
                            frame_count_2 <= 2'b0;
                        end
                        else begin
                            frame_count_2 <= frame_count_2 + 1'b1;
                        end
                        reg_axi_araddr_2 <= 'b0;
                    end
                end
                else begin
                    reg_axi_araddr_2 <= reg_axi_araddr_2;
                end
                if((frame_count_2 == 2'b0) || (frame_count_2 == 2'd1)) begin                    // 帧 1 使用基地址 1
                    reg_axi_araddr <= ADDR_OFFSET_2 + reg_axi_araddr_2;
                end
                else if((frame_count_2 == 2'd2) || (frame_count_2 == 2'd3)) begin               // 帧 2 使用基地址 2
                    reg_axi_araddr <= ADDR_OFFSET_2 + FRAME_ADDR_OFFSET_1 + reg_axi_araddr_2;
                end
                else begin
                    reg_axi_araddr <= reg_axi_araddr_2;
                end
            end
            WR3_WAIT: begin
                if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                    if(reg_axi_araddr_3 < (WIDTH_QD*HEIGHT_QD*16)/256 - ADDR_STEP) begin   // 通过地址判断当前像素数量
                        reg_axi_araddr_3 <= reg_axi_araddr_3 + ADDR_STEP;
                    end
                    else begin
                        if(frame_count_3 == 2'd3) begin                         // 帧计数
                            frame_count_3 <= 2'b0;
                        end
                        else begin
                            frame_count_3 <= frame_count_3 + 1'b1;
                        end
                        reg_axi_araddr_3 <= 'b0;
                    end
                end
                else begin
                    reg_axi_araddr_3 <= reg_axi_araddr_3;
                end
                if((frame_count_3 == 2'd0) || (frame_count_3 == 2'd1)) begin                     // 帧 1 使用基地址 1
                    reg_axi_araddr <= ADDR_OFFSET_3 + reg_axi_araddr_3;
                end
                else if((frame_count_3 == 2'd2) || (frame_count_3 == 2'd3)) begin                // 帧 2 使用基地址 2
                    reg_axi_araddr <= ADDR_OFFSET_3 + FRAME_ADDR_OFFSET_1 + reg_axi_araddr_3;
                end
                else begin
                    reg_axi_araddr <= reg_axi_araddr_3;
                end
            end
            WR4_WAIT: begin
                if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                    if(reg_axi_araddr_4 < (WIDTH_QD*HEIGHT_QD*16)/256 - ADDR_STEP) begin   // 通过地址判断当前像素数量
                        reg_axi_araddr_4 <= reg_axi_araddr_4 + ADDR_STEP;
                    end
                    else begin
                        if(frame_count_4 == 2'd3) begin                         // 帧计数
                            frame_count_4 <= 2'b0;
                        end
                        else begin
                            frame_count_4 <= frame_count_4 + 1'b1;
                        end
                        reg_axi_araddr_4 <= 'b0;
                    end
                end
                else begin
                    reg_axi_araddr_4 <= reg_axi_araddr_4;
                end
                if((frame_count_4 == 2'd0) || (frame_count_4 == 2'd1)) begin                    // 帧 1 使用基地址 1
                    reg_axi_araddr <= ADDR_OFFSET_4 + reg_axi_araddr_4;
                end
                else if((frame_count_4 == 2'd2) || (frame_count_4 == 2'd3)) begin               // 帧 2 使用基地址 2
                    reg_axi_araddr <= ADDR_OFFSET_4 + FRAME_ADDR_OFFSET_1 + reg_axi_araddr_4;
                end
                else begin
                    reg_axi_araddr <= reg_axi_araddr_4;
                end
            end
            WR5_WAIT: begin
                if((axi_arready == 1'b1) && (axi_arvalid == 1'b1)) begin
                    if(reg_axi_araddr_5 < (WIDTH_TC*HEIGHT_TC*16)/256 - ADDR_STEP) begin   // 通过地址判断当前像素数量
                        reg_axi_araddr_5 <= reg_axi_araddr_5 + ADDR_STEP;
                    end
                    else begin
                        if(frame_count_5 == 2'd3) begin                         // 帧计数
                            frame_count_5 <= 2'b0;
                        end
                        else begin
                            frame_count_5 <= frame_count_5 + 1'b1;
                        end
                        reg_axi_araddr_5 <= 'b0;
                    end
                end
                else begin
                    reg_axi_araddr_5 <= reg_axi_araddr_5;
                end
                if((frame_count_5 == 2'd0) || (frame_count_5 == 2'd1))begin                     // 帧 1 使用基地址 1
                    reg_axi_araddr <= ADDR_OFFSET_5 + reg_axi_araddr_5;
                end
                else if((frame_count_5 == 2'd2) || (frame_count_5 == 2'd3)) begin               // 帧 2 使用基地址 2
                    reg_axi_araddr <= ADDR_OFFSET_5 + FRAME_ADDR_OFFSET_2 + reg_axi_araddr_5;
                end
                else begin
                    reg_axi_araddr <= reg_axi_araddr_5;
                end
            end
            default: begin
                reg_axi_araddr_1 <= reg_axi_araddr_1;
                reg_axi_araddr_2 <= reg_axi_araddr_2;
                reg_axi_araddr_3 <= reg_axi_araddr_3;
                reg_axi_araddr_4 <= reg_axi_araddr_4;
                reg_axi_araddr_5 <= reg_axi_araddr_5;
                reg_axi_araddr <= reg_axi_araddr;
                frame_count_1 <= frame_count_1;
                frame_count_2 <= frame_count_2;
                frame_count_3 <= frame_count_3;
                frame_count_4 <= frame_count_4;
                frame_count_5 <= frame_count_5;
            end
        endcase
    end
end


endmodule