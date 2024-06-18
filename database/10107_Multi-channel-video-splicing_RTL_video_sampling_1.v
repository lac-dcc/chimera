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
// 对上 1/4 高度画面进行操作，将画面缩小到 1/16
// 输入规格：1280x720
module video_sampling_1 #(
    parameter WR_ADDR_LEN = 'd8, 
    parameter RD_ADDR_LEN = 'd5,
    parameter IMAGE_TAG = 4'd1,
    parameter DQ_WIDTH = 12'd32,
    parameter VIDEO_WIDTH = 'd1280,
    parameter VIDEO_HEIGHT = 'd720,
    parameter SEL_MODE = 'd1            // 1:四抽三（1/16），2:四抽一(9/16)
)(
    input               clk,
    input               rst,
    // 信号输入
    input               de_in       /*synthesis PAP_MARK_DEBUG="1"*/ ,
    input               vs_in        /*synthesis PAP_MARK_DEBUG="1"*/,
    input       [15:0]  rgb565_in   ,
    // 发往 DDR 存储
    input                                   rd_clk          ,
    output      [DQ_WIDTH*8-1'b1:0]         rd_data         ,
    input                                   rd_en           ,
    output                                  burst_emergency ,
    output reg                              data_out_ready  ,
    output reg  [3:0]                       trans_id
);

parameter WIDTH_QD = VIDEO_WIDTH / 'd4;
parameter HEIGHT_QD = VIDEO_HEIGHT / 'd4;
parameter WIDTH_TC = (VIDEO_WIDTH / 4) * 3;
parameter HEIGHT_TC = (VIDEO_HEIGHT / 4) * 3;

wire        pose_vs_in;
wire        nege_vs_in;
wire        wr_en_1/*synthesis PAP_MARK_DEBUG="1"*/;
wire        wr_en_2/*synthesis PAP_MARK_DEBUG="1"*/;
wire        almost_full;

reg                             vs_in_d1        ; 
reg                             de_in_d1        ; 
reg [3:0]                       href_count       /*synthesis PAP_MARK_DEBUG="1"*/; 
reg [3:0]                       pix_count        /*synthesis PAP_MARK_DEBUG="1"*/;
reg                             wr_en_tr       /*synthesis PAP_MARK_DEBUG="1"*/ ;     
reg                             frame_valid     ;
reg [15:0]                      wr_data_temp    ;
reg [15:0]                      wr_data         /*synthesis PAP_MARK_DEBUG="1"*/;
reg [10:0]                      row_count /*synthesis PAP_MARK_DEBUG="1"*/;
reg [10:0]                      row_pix_count;
reg                             pre_en /*synthesis PAP_MARK_DEBUG="1"*/;

// 行计数
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        row_count <= 'b0;
    end
    else if(pose_vs_in) begin
        row_count <= 'd0;
    end
    else if (nege_de_in) begin
        row_count <= row_count + 1'b1;
    end
    else begin
        row_count <= row_count;
    end
end


// 写入有效的像素个数计数
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        row_pix_count <= 'b0;
    end
    else if(pose_vs_in) begin
        row_pix_count <= 'd0;
    end
    else if (wr_en_tr == 1'b1 && row_pix_count < 'd30) begin
        row_pix_count <= row_pix_count + 1'b1;
    end
    else if (row_pix_count >= 'd30)begin
        row_pix_count <= row_pix_count;
    end
end


// 每帧图像预读一个256位的数据使能，在读时钟下
always @(posedge rd_clk or negedge rst) begin
    if(!rst) begin
        pre_en <= 'b0;
    end
    else if (row_pix_count == 'd20) begin
        pre_en <= 1'b1;
    end
    else begin
        pre_en <= 1'b0;
    end
end
// 帧有效信号，确保数据按帧顺序存储
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        vs_in_d1 <= 'b0;
    end
    else begin
        vs_in_d1 <= vs_in;
    end
end
assign pose_vs_in = ((vs_in) && (~vs_in_d1)) ? 1'b1 : 1'b0;
assign nege_vs_in = ((~vs_in) && (vs_in_d1)) ? 1'b1 : 1'b0;

//assign data_out_ready = almost_full;

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


// 行计数和抽样，间隔 3 行
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        de_in_d1 <= 'b0;
    end
    else begin
        de_in_d1 <= de_in;
    end
end
assign pose_de_in = ((de_in) && (~de_in_d1)) ? 1'b1 : 1'b0;
assign nege_de_in = ((~de_in) && (de_in_d1)) ? 1'b1 : 1'b0;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        href_count <= 'b0;
    end
    else if(frame_valid) begin
        if((nege_de_in == 1'b1) && (href_count < 4'd3)) begin
            href_count <= href_count + 1'b1;
        end
        else if((nege_de_in == 1'b1) && (href_count == 4'd3)) begin
            href_count <= 4'b0;
        end
        else begin
            href_count <= href_count;
        end
    end
    else begin
        href_count <= 4'b0;
    end
end


// 满足行抽取要求的使能信号
assign wr_en_1 = ((href_count == 4'd1) && (de_in_d1 == 1'b1)) ? 1'b1 : 1'b0;
assign wr_en_2 = ((href_count < 4'd3) && (de_in_d1 == 1'b1)) ? 1'b1 : 1'b0;


// 每四个像素丢三个像素数据，或者每四个丢一个
generate
    if(SEL_MODE == 2'd1) begin
        always @(posedge clk or negedge rst) begin
            if(!rst) begin
                pix_count <= 'b0;
            end
            else if (pose_vs_in == 1'b1) begin
                pix_count <= 'b0;
            end
            else if(wr_en_1) begin
                if(pix_count == 4'd3) begin
                    pix_count <= 4'd0;
                end
                else begin
                    pix_count <= pix_count + 1'b1;
                end
            end
            else begin
                pix_count <= 4'b0;
            end
        end
    end
    else if(SEL_MODE == 2'd2) begin
        always @(posedge clk or negedge rst) begin
            if(!rst) begin
                pix_count <= 'b0;
            end
            else if (pose_vs_in == 1'b1) begin
                pix_count <= 'b0;
            end
            else if(wr_en_2) begin
                if(pix_count == 4'd3) begin
                    pix_count <= 4'd0;
                end
                else begin
                    pix_count <= pix_count + 1'b1;
                end
            end
            else begin
                pix_count <= 4'b0;
            end
        end
    end
endgenerate


// 最终的写使能信号
generate
    if(SEL_MODE == 2'd1) begin
        always @(posedge clk or negedge rst) begin
            if(!rst) begin
                wr_en_tr <= 'b0;
            end
            else if((wr_en_1 == 1'b1) && (pix_count == 4'd0)) begin
                wr_en_tr <= 1'b1;
            end
            else begin
                wr_en_tr <= 1'b0;
            end
        end
    end
    else if(SEL_MODE == 2'd2) begin
        always @(posedge clk or negedge rst) begin
            if(!rst) begin
                wr_en_tr <= 'b0;
            end
            else if((wr_en_2 == 1'b1) && (pix_count < 2'd3)) begin
                wr_en_tr <= 1'b1;
            end
            else begin
                wr_en_tr <= 1'b0;
            end
        end
    end
endgenerate


// 写数据信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        wr_data_temp <= 'b0;
        wr_data <= 'b0;
    end
    else begin
        wr_data_temp <= rgb565_in;
        wr_data <= wr_data_temp;
    end
end


// 使用 fifo 存储满足两次突发长度的数据，almost_full 为标志信号
fifo_wr_buf axi_wr_buf(
    .wr_clk         (clk                    ),    
    .wr_rst         ((~rst) || (pose_vs_in) ),    
    .wr_en          (wr_en_tr               ),    
    .wr_data        (wr_data                ),    
    .wr_full        (burst_emergency        ),    
    .almost_full    (almost_full            ),    
    .rd_clk         (rd_clk                 ),    
    .rd_rst         ((~rst) || (pose_vs_in) ),    
    .rd_en          ((rd_en) || (pre_en)    ),    
    .rd_data        (rd_data                ),    
    .rd_empty       (),           
    .almost_empty   ()    
);


 //数据准备好条件和信号 ID 
always @(posedge rd_clk or negedge rst) begin
    if(!rst) begin
        data_out_ready <= 'b0;
        trans_id <= 'b0;
    end
    else if(almost_full == 1'b1) begin
        data_out_ready <= 1'b1;
        trans_id <= IMAGE_TAG;
    end
    else if(almost_full == 1'b0) begin
        data_out_ready <= 1'b0;
        trans_id <= 4'b0;
    end
    else begin
        data_out_ready <= data_out_ready;
        trans_id <= trans_id;
    end
end


endmodule