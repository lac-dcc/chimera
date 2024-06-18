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
// 将 ddr 读出的数据缓存到 buf，并为 hdmi 输出做准备
//
module ddr_rd_buf #(
    parameter DQ_WIDTH  = 12'd32    ,
    parameter H_HEIGHT  = 'd720     ,
    parameter H_WIDTH   = 'd1280              
)(
    input                           clk             ,
    input                           rst             ,

    input                           buf_wr_en       ,
    input       [DQ_WIDTH*8-1:0]    buf_wr_data     ,
    output reg  [1:0]               channel_sel     ,
    output reg                      axi_wr_buf_wait ,

    // hdmi 时序
    input                           hdmi_vsync      ,
    input                           hdmi_href       ,
    input                           rd_clk          ,
    input                           rd_rst          ,
    output reg                      de_o            ,
    output reg  [15:0]              rgb565_out
);

parameter WIDTH_QD = H_WIDTH / 4;
parameter HEIGHT_QD = H_HEIGHT / 4;
parameter WIDTH_TC = (H_WIDTH / 4) * 3;
parameter HEIGHT_TC = (H_HEIGHT / 4) * 3;

wire [15:0]             rd_data         ;
wire                    pose_href       ;
wire                    pose_vsync      ;
wire                    nege_href       ;
wire                    rd_en           ;

reg                     vsync_d1        ;
reg [1:0]               frame_count     ;
reg                     href_d1         ;
reg [10:0]              pix_count       ;
reg [9:0]               row_count       ;
reg [6:0]               wr_addr         ;
reg                     wr_en           ;
reg [DQ_WIDTH*8-1:0]    wr_data         ;
reg [10:0]              rd_addr         ; 
reg                     rd_en_final     ;
reg                     rd_en_final_d1  ;
reg [10:0]              pix_rd_count    ;
reg                     de_temp         ;

assign pose_href = ((hdmi_href)&&(~href_d1)) ? 1'b1 : 1'b0;
assign nege_href = ((~hdmi_href) && (href_d1)) ? 1'b1 : 1'b0;
assign pose_vsync = ((hdmi_vsync) && (~vsync_d1)) ? 1'b1 : 1'b0;
assign rd_en = hdmi_href;

// 对行场同步信号延时
always @(posedge rd_clk or negedge rst) begin
    if(!rst) begin
        vsync_d1 <= 'b0;
        href_d1 <= 'b0;
    end
    else begin
        vsync_d1 <= hdmi_vsync;
        href_d1 <= hdmi_href;
    end
end


// 场同步计数
/*always @(posedge clk or negedge rst) begin
    if(!rst) begin
        frame_count <= 'b0;
    end
    else if(pose_vsync) begin
        if(frame_count == 'd2) begin
            frame_count <= 'b1;
        end
        else begin
            frame_count <= frame_count + 1'b1;
        end
    end
    else begin
        frame_count <= frame_count;
    end
end*/


// 输入的像素数计数（只计一行）
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        pix_count <= 'b0;
    end
    else if(buf_wr_en) begin
        if(pix_count == H_WIDTH - (DQ_WIDTH*8/16)) begin
            pix_count <= 'b0;
        end
        else begin
            pix_count <= pix_count + (DQ_WIDTH*8/16);
        end
    end
    else if(pose_href) begin            // 在行有效信号来之前这一行的数据应当已经传完
        pix_count <= 'b0;
    end
    else begin
        pix_count <= pix_count;
    end
end


// 行数计数
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        row_count <= 'b0;
    end
    else if(pose_href) begin
        if(row_count == H_HEIGHT) begin
            row_count <= 'b1;
        end
        else begin
            row_count <= row_count + 1'b1;
        end
    end
    else begin
        row_count <= row_count;
    end
end


// 拉高 axi 等待信号和信号选通
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        channel_sel <= 'b1;
    end
    else if((row_count == HEIGHT_QD - 1'b1) 
            && (pix_count == H_WIDTH - 2*(DQ_WIDTH*8/16))) begin  // 在 180 行最后两个周期
        channel_sel <= 2'd2;
    end
    else if(pose_vsync) begin
        channel_sel <= 2'd1;
    end
    else begin
        channel_sel <= channel_sel;
    end
end


// 写地址生成
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        wr_addr <= 'b0;
    end
    else if(buf_wr_en) begin
        wr_addr <= wr_addr + 1'b1;
    end
    else if(pose_href) begin
        wr_addr <= 'b0;
    end
    else begin
        wr_addr <= wr_addr;
    end
end


always @(*) begin
    wr_en <= buf_wr_en;
    wr_data <= buf_wr_data;
end


// 连接 buf
axi_rd_buf rd_buf(
    .wr_data    (wr_data),      // input [255:0]
    .wr_addr    (wr_addr),      // input [5:0]
    .wr_en      (wr_en),        // input
    .wr_clk     (clk),          // input
    .wr_rst     (!rst),         // input
    .rd_addr    (rd_addr),      // input [8:0]
    .rd_data    (rd_data),      // output [16:0]
    .rd_clk     (rd_clk),       // input
    .rd_rst     (!rd_rst)        // input
);


// 像素读出计数
always @(posedge rd_clk or negedge rd_rst) begin
    if(!rd_rst) begin
        pix_rd_count <= 'b0;
    end
    else if(rd_en) begin
        if(pix_rd_count == H_WIDTH - 1'b1) begin
            pix_rd_count <= 11'b0;
        end
        else begin
            pix_rd_count <= pix_rd_count + 1'b1;
        end
    end
    else begin
        pix_rd_count <= pix_rd_count;
    end
end


// 生成最终使能信号
always @(*) begin
    if(((pix_rd_count <= (WIDTH_TC - 1'b1)) && (row_count > HEIGHT_QD))
        || (row_count <= HEIGHT_QD)) begin
        rd_en_final <= rd_en;
    end
    else begin
        rd_en_final <= 1'b0;
    end
end

always @(posedge rd_clk or negedge rd_rst) begin
    if(!rd_rst) begin
        rd_en_final_d1 <= 'b0;
    end
    else begin
        rd_en_final_d1 <= rd_en_final;
    end
end


// 利用使能信号控制读地址生成，造成一个时钟周期延迟
always @(posedge rd_clk or negedge rd_rst) begin
    if(!rd_rst) begin
        rd_addr <= 'b0;
    end
    else if(rd_en_final) begin
        rd_addr <= rd_addr + 1'b1;
    end
    else if(nege_href) begin
        rd_addr <= 'b0;
    end
    else begin
        rd_addr <= rd_addr;
    end
end


// 输出数据，有一个周期延迟
always @(posedge rd_clk or negedge rd_rst) begin
    if(!rd_rst) begin
        rgb565_out <= 'b0;
    end
    else if(rd_en_final_d1) begin
        rgb565_out <= rd_data;
    end
    else begin
        rgb565_out <= 16'b0;
    end
end


// 输出实际 de_o 信号
always @(posedge rd_clk or negedge rd_rst) begin
    if(!rd_rst) begin
        de_temp <= 'b0;
        de_o <= 'b0;
    end
    else begin
        de_temp <= rd_en;
        de_o <= de_temp;
    end
end


endmodule