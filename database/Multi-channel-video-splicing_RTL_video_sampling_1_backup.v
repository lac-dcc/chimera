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
* =======================================================================
*/
// 对上 1/4 高度画面进行操作，将画面缩小到 1/16
// 输入规格：1280x720

module video_sampling_1#(
    parameter OUT_OFFSET = 11'd320, // 输出延时，0,320,640,960
    parameter H_WIDTH = 11'd1280,   // 输入视频宽度
    parameter H_HEIGHT = 10'd720,   // 输入视频高度
    parameter DELAY_TIME = 5'd5,    // 输入延迟
    parameter ADDR_OFFSET = 16'd0
)(
    input               clk,
    input               rst,

    input               de_in,
    input               vs_in,
    input       [15:0]  rgb565_in,

    output reg          de_out,
    output reg          vs_out,
    output reg  [15:0]  rgb565_out
);

parameter WIDTH_OFFSET = H_WIDTH / 4;
parameter HEIGHT_OFFSET = H_HEIGHT / 4;

wire        pose_vs_in;
wire        nege_vs_in;
wire        pose_de_in;
wire [15:0] rd_data;
wire        pose_href;

reg         vs_in_1;
reg         frame_valid;
reg [2:0]   frame_wr_flag;
reg [2:0]   frame_rd_flag;
reg         de_in_1;
reg [1:0]   href_count;
reg [15:0]   wr_addr;
reg [15:0]  wr_data;
reg [2:0]   pix_count;
reg         wr_en_tr;

reg [(DELAY_TIME - 1'b1):0]   delay_de_in;
reg [(DELAY_TIME - 1'b1):0]   delay_vs_in;
reg [15:0]   rd_addr = ADDR_OFFSET;
reg [10:0]  pix_full_count;
reg [9:0]   href_full_count;
reg         rd_en;
reg         rd_en_d1;


// 帧有效信号，确保数据按帧顺序存储
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        vs_in_1 <= 'b0;
    end
    else begin
        vs_in_1 <= vs_in;
    end
end
assign pose_vs_in = ((vs_in) && (~vs_in_1)) ? 1'b1 : 1'b0;
assign nege_vs_in = ((~vs_in) && (vs_in_1)) ? 1'b1 : 1'b0;


always @(posedge clk or negedge rst) begin
    if(!rst) begin
        frame_valid <= 'b0;
    end
    else if(nege_vs_in) begin
        frame_valid <= 1'b1;
    end
    else if(pose_vs_in) begin
        frame_valid <= 1'b0;
    end
    else begin
        frame_valid <= frame_valid;
    end
end


// 写从第二帧开始写，读从第三帧开始读, disabled
/*always @(posedge clk or negedge rst) begin
    if(!rst) begin
        frame_wr_flag <= 'b0;
    end
    else if((pose_vs_in) && (frame_wr_flag < 3'd2)) begin
        frame_wr_flag <= frame_wr_flag + 1'b1;
    end
    else begin
        frame_wr_flag <= frame_wr_flag;
    end
end*/



// 行计数和抽样，间隔 3 行
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        de_in_1 <= 'b0;
    end
    else begin
        de_in_1 <= de_in;
    end
end
assign pose_de_in = ((de_in) && (~de_in_1)) ? 1'b1 : 1'b0;
assign nege_de_in = ((~de_in) && (de_in_1)) ? 1'b1 : 1'b0;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        href_count <= 'b0;
    end
    else if(frame_valid) begin
        if((pose_de_in == 1'b1) && (href_count < 4'd4)) begin
            href_count <= href_count + 1'b1;
        end
        else if((pose_de_in == 1'b1) && (href_count == 4'd4)) begin
            href_count <= 4'b1;
        end
        else begin
            href_count <= href_count;
        end
    end
    else begin
        href_count <= 2'b0;
    end
end


// 写使能信号
/*always @(posedge clk or negedge rst) begin
    if(!rst) begin
        wr_en <= 'b0;
    end
    else if((href_count == 4'd1) && (de_in == 1'b1)) begin
        wr_en <= 1'b1;
    end
    else begin
        wr_en <= 1'b0;
    end
end*/
assign wr_en = ((href_count == 4'd1) && (de_in_1 == 1'b1)) ? 1'b1 : 1'b0;


// 每五个像素丢中间三个像素数据
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        pix_count <= 'b0;
    end
    else if(wr_en) begin
        if(pix_count == 2'd3) begin
            pix_count <= 2'd0;
        end
        else begin
            pix_count <= pix_count + 1'b1;
        end
    end
    else begin
        pix_count <= 2'b0;
    end
end

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        wr_en_tr <= 'b0;
    end
    else if((wr_en == 1'b1) && (pix_count == 2'd0)) begin
        wr_en_tr <= 1'b1;
    end
    else begin
        wr_en_tr <= 1'b0;
    end
end


// 共对数据信号引入了 1 个时间单位的延迟
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        wr_data <= 'b0;
    end
    else begin
        wr_data <= rgb565_in;
    end
end


// 写地址信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        wr_addr <= 'b0;
    end
    else if(wr_en_tr) begin
        wr_addr <= wr_addr + 1'b1;
    end
    else begin
        wr_addr <= wr_addr;
    end
end


sdram_sampling u_sdram_sampling(
    .wr_data    (wr_data),      // input [15:0]
    .wr_addr    (wr_addr),      // input [5:0]
    .wr_en      (wr_en_tr),        // input
    .wr_clk     (clk),          // input
    .wr_rst     (!rst),         // input
    .rd_addr    (rd_addr),      // input [7:0]
    .rd_data    (rd_data),      // output [15:0]
    .rd_clk     (clk),       // input
    .rd_rst     (!rst)        // input
);

// 写从第二帧开始写，读从第三帧开始读
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        frame_rd_flag <= 'b0;
    end
    else if((pose_vs_in) && (frame_rd_flag < 3'd2)) begin
        frame_rd_flag <= frame_rd_flag + 1'b1;
    end
    else begin
        frame_rd_flag <= frame_rd_flag;
    end
end


// 读使能，会引入对数据信号的延迟
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        delay_de_in <= 'b0;
    end
    else begin
        delay_de_in <= {delay_de_in[(DELAY_TIME - 2'd2):0], de_in};
    end
end

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        de_out <= 'b0;
    end
    else begin
        de_out <= delay_de_in[DELAY_TIME - 1'b1];
    end
end


// 读地址
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        rd_addr <= 'b0;
    end
    else if(rd_en) begin
        rd_addr <= rd_addr + 1'b1;
    end
    else begin
        rd_addr <= rd_addr;
    end
end

// 横向空数据填充
// 行像素计数，320pixels
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        pix_full_count <= 'b0;
    end
    else if(delay_de_in[DELAY_TIME - 2'd2]) begin
        if(pix_full_count == H_WIDTH) begin
            pix_full_count <= 11'd0;
        end
        else begin
            pix_full_count <= pix_full_count + 1'b1;
        end
    end
    else begin
        pix_full_count <= 1'b0;
    end
end

// 纵向计数，180pixel
assign pose_href = ((delay_de_in[DELAY_TIME - 2'd3]) && (~delay_de_in[DELAY_TIME - 2'd2])) ? 1'b1 : 1'b0;
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        href_full_count <= 'b0;
    end
    else if(frame_valid) begin
        if((pose_href == 1'b1) && (href_full_count == H_HEIGHT)) begin
            href_full_count <= 10'd1;
        end
        else if((pose_href == 1'b1) && (href_full_count < H_HEIGHT)) begin
            href_full_count <= href_full_count + 1'b1;
        end
        else begin
            href_full_count <= href_full_count;
        end
    end
    else begin
        href_full_count <= 10'b0;
    end
end

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        rd_en <= 'b0;
    end
    else if((delay_de_in[DELAY_TIME - 2'd2]) && (frame_rd_flag == 3'd2)) begin
        if((pix_full_count >= OUT_OFFSET) && (pix_full_count < OUT_OFFSET + WIDTH_OFFSET) 
        && (href_full_count >= 10'd1) && (href_full_count <= HEIGHT_OFFSET)) begin
            rd_en <= 1'b1;
        end
        else if((pix_full_count < OUT_OFFSET) || (pix_full_count >= OUT_OFFSET + WIDTH_OFFSET) 
        || (href_full_count > HEIGHT_OFFSET)) begin
            rd_en <= 1'b0;
        end
        else begin
            rd_en <= rd_en;
        end
    end
    else begin
        rd_en <= 1'b0;
    end
end


// 输出像素数据
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        rgb565_out <= 'b0;
    end
    else if(delay_de_in[DELAY_TIME - 2'd1]) begin
        if(rd_en) begin
            rgb565_out <= rd_data;
        end
        else begin
            rgb565_out <= 16'b0;
        end
    end
    else begin
        rgb565_out <= 16'b0;
    end
end


// 场同步信号延迟
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        delay_vs_in <= 'b0;
    end
    else begin
        delay_vs_in <= {delay_vs_in[(DELAY_TIME - 2'd2):0], vs_in};
    end
end

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        vs_out <= 'b0;
    end
    else begin
        vs_out <= delay_vs_in[DELAY_TIME - 2'd1];
    end
end


endmodule