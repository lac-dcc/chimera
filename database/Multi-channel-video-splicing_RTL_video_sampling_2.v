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
// 对下 3/4 高度画面进行操作，将画面缩小到 9/16
// 输入规格：1280x720
module video_sampling_2 #(
    parameter WR_ADDR_LEN = 'd8, 
    parameter RD_ADDR_LEN = 'd5,
    parameter IMAGE_TAG = 4'd1,
    parameter DQ_WIDTH = 12'd32,
    parameter VIDEO_WIDTH = 'd1280,
    parameter VIDEO_HEIGHT = 'd720
)(
    input               clk,
    input               rst,
    // 信号输入
    input                                   de_in           /*synthesis PAP_MARK_DEBUG="1"*/,
    input                                   vs_in           /*synthesis PAP_MARK_DEBUG="1"*/,
    input       [15:0]                      rgb565_in       ,
    input       [3:0]                       scale_mode      ,
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

wire        pose_row_en ;
wire        nege_row_en ;
wire        pose_vs_in  ;
wire        nege_vs_in  ;
wire        almost_full ;

reg                             vs_in_d1        ; 
reg                             de_in_d1        ; 
reg [10:0]                      href_count      /*synthesis PAP_MARK_DEBUG="1"*/; 
reg [3:0]                       pix_count       /*synthesis PAP_MARK_DEBUG="1"*/;
reg                             raw_data_valid  /*synthesis PAP_MARK_DEBUG="1"*/ ;     
reg [15:0]                      wr_data_temp_1  ;
reg [15:0]                      wr_data_temp_2  ;
wire [15:0]                     wr_data         /*synthesis PAP_MARK_DEBUG="1"*/;
reg [10:0]                      pix_count_act   /*synthesis PAP_MARK_DEBUG="1"*/;
reg [10:0]                      pix_count_act1  /*synthesis PAP_MARK_DEBUG="1"*/;
reg                             pre_en          /*synthesis PAP_MARK_DEBUG="1"*/;
reg [4:0]                       scale_value     ;
reg                             wr_en_2         /*synthesis PAP_MARK_DEBUG="1"*/ ;
reg                             wr_en_2_d1      ;
reg                             wr_en_final     /*synthesis PAP_MARK_DEBUG="1"*/;
reg [10:0]                      href_count_act  /*synthesis PAP_MARK_DEBUG="1"*/;
reg                             wr_en_add       /*synthesis PAP_MARK_DEBUG="1"*/;
reg                             wr_en_add_pre   /*synthesis PAP_MARK_DEBUG="1"*/;
reg [8:0]                       wr_en_add_cnt   /*synthesis PAP_MARK_DEBUG="1"*/;
reg                             row_en          /*synthesis PAP_MARK_DEBUG="1"*/;
reg                             row_en_d1       ;
reg [9:0]                       pix_add         ; //需补充的像素
reg [9:0]                       zoom_mod        ; // 取余的参数


// 缩放倍率选择
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        pix_add = 'd1 ;
        zoom_mod = 'd1000;
    end
    else if(scale_mode == 'd0) begin
        pix_add = 'd1 ;
        zoom_mod = 'd1000 ;
    end
    else if (scale_mode == 'd1) begin  //20抽1；
        pix_add = 'd48 ;
        zoom_mod = 'd20 ;       
    end
    else if (scale_mode == 'd2) begin  //15抽1；
        pix_add = 'd64 ;
        zoom_mod = 'd15 ;       
    end
    else if (scale_mode == 'd3) begin  //10抽1；
        pix_add = 'd96 ;
        zoom_mod = 'd10 ;  
    end 
    else if (scale_mode == 'd4) begin  //9抽1；
        pix_add = 'd107 ;
        zoom_mod = 'd9 ;    
   end
    else if (scale_mode == 'd5) begin  //8抽1；
        pix_add = 'd120 ;
        zoom_mod = 'd8 ;       
    end
    else if (scale_mode == 'd6) begin  //7抽1；
        pix_add = 'd138 ;
        zoom_mod = 'd7 ;       
    end
    else if (scale_mode == 'd7) begin  //6抽1；
        pix_add = 'd160 ;
        zoom_mod = 'd6 ;  
    end 
    else if (scale_mode == 'd8) begin  //5抽1；
        pix_add = 'd192 ;
        zoom_mod = 'd5  ;    
    end
    else if (scale_mode == 'd9) begin  //4抽1；
        pix_add = 'd240 ;
        zoom_mod = 'd4  ;    
   end
    else if (scale_mode == 'd10) begin  //3抽1；
        pix_add = 'd320 ;
        zoom_mod = 'd3  ;    
    end
    else if (scale_mode == 'd11) begin  //2抽1；
        pix_add = 'd480 ;
        zoom_mod = 'd2  ;    
   end
end


// 当前写入有效的像素个数计数
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        pix_count_act <= 'b0;
    end
    else if((pose_vs_in) || (nege_de_in)) begin
        pix_count_act <= 'd0;
    end
    else if(raw_data_valid == 1'b1) begin
        if(pix_count_act == 'd960 - 1'b1) begin
            pix_count_act <= pix_count_act;
        end
        else begin
            pix_count_act <= pix_count_act + 1'b1;
        end
    end
    else begin
        pix_count_act <= pix_count_act;
    end
end


// 真正写入 fifo 有效显示像素计数,作为 pre_en 的拉高信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        pix_count_act1 <= 'b0;
    end
    else if(pose_vs_in) begin
        pix_count_act1 <= 'd0;
    end
    else if (wr_en_final == 1'b1 && pix_count_act1 < 'd30) begin
        pix_count_act1 <= pix_count_act1 + 1'b1;
    end
    else if (pix_count_act1 >= 'd30)begin
        pix_count_act1 <= pix_count_act1;
    end
end


// 每帧图像预读一个256位的数据使能，在读时钟下
always @(posedge rd_clk or negedge rst) begin
    if(!rst) begin
        pre_en <= 'b0;
    end
    else if (pix_count_act1 == 'd20) begin
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
    else if(pose_vs_in) begin
        href_count <= 'b0;
    end 
    else if(nege_de_in) begin
        href_count <= href_count + 1'b1;
    end
    else begin
        href_count <= href_count;
    end
end


// 满足行抽取要求的使能信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        wr_en_2 <= 'b0;
    end
    else if(href_count % 4 == 'd0)begin
        wr_en_2 <= 1'b0;
    end
    else begin
        wr_en_2 <= de_in;
    end
end


// 每四个像素丢一个
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        pix_count <= 'b0;
    end
    else if(pose_vs_in == 1'b1) begin
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


// 数据实际有效信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        raw_data_valid <= 'b0;
    end
    else if((wr_en_2 == 1'b1) && (pix_count != 4'd3)) begin
        raw_data_valid <= 1'b1;
    end
    else begin
        raw_data_valid <= 1'b0;
    end
end

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        wr_en_2_d1 <= 'b0;
    end
    else begin
        wr_en_2_d1 <= wr_en_2;
    end
end
assign nege_wr_en_2 = ((~wr_en_2) && (wr_en_2_d1)) ? 1'b1 : 1'b0;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        href_count_act <= 'b0;
    end
    else if(pose_vs_in) begin
        href_count_act <= 'd0;
    end
    else if(wr_en_2_d1) begin
        if(nege_de_in) begin
            if(href_count_act == HEIGHT_TC - 1'b1) begin
                href_count_act <= 11'd0;
            end
            else begin
                href_count_act <= href_count_act + 1'b1;
            end
        end
        else begin
            href_count_act <= href_count_act;
        end
    end
    else begin
        href_count_act <= href_count_act;
    end
end


// 在经过四丢一后的 wr_en_2 信号重新抽行,当前 10 丢 1
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        row_en <= 1'b0;
    end
    else if((href_count_act % zoom_mod == 'd0) && (href_count_act != 'd0)) begin
        row_en <= 1'b0;
    end
    else begin
        row_en <= wr_en_2;
    end
end


//在经过四丢1的 raw_data_valid 行像素使能信号 使用10丢1,剩下的都是一行内要显示的有用的像素数据
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        wr_en_final <= 1'b0 ;
    end
    else if ((pix_count_act % zoom_mod != 'd0) && row_en == 1'b1) begin
        wr_en_final <= raw_data_valid;
    end
    else begin
        wr_en_final <= 1'b0;
    end
end

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        row_en_d1 <= 'd0;
    end
    else begin
        row_en_d1 <= row_en;
    end
end

assign pose_row_en = ((row_en) && (~row_en_d1)) ? 1'b1 : 1'b0;
assign nege_row_en = ((~row_en) && (row_en_d1)) ? 1'b1 : 1'b0;


// 一行的下降沿到下一行的上升沿期间拉高，
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        wr_en_add_pre <= 1'b0;
    end
    else if (pose_row_en == 1'b1 || pose_vs_in == 1'b1 || href_count > 'd719) begin
        wr_en_add_pre <= 1'b0;
    end
    else if (nege_row_en) begin
        wr_en_add_pre <= 1'b1;
    end
    else begin
       wr_en_add_pre <= wr_en_add_pre; 
    end
end


//
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        wr_en_add_cnt <= 'd0;
    end
    else if (href_count >= 'd718) begin
        wr_en_add_cnt <= 'd0;
    end
    else if (wr_en_add_pre == 1'b1) begin
        if (wr_en_add_cnt <= 'd500) begin
            wr_en_add_cnt <= wr_en_add_cnt +1'b1;           
        end
        else begin
            wr_en_add_cnt <= wr_en_add_cnt;
        end
    end
    else begin
        wr_en_add_cnt <= 'd0;
    end
end


// 一行抽像素结束补充像素点
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        wr_en_add <= 1'b0 ;
    end
    else if (wr_en_add_pre == 1'b0 || wr_en_add_cnt >= pix_add) begin
         wr_en_add <= 1'b0 ;      
    end
    else if (wr_en_add_pre == 1'b1) begin
        wr_en_add <= 1'b1 ;
    end
    else begin
        wr_en_add <= 1'b0;
    end
end

assign wr_data = (wr_en_add_pre) ? 'd0 : rgb565_in ;


// 使用 fifo 存储满足两次突发长度的数据，almost_full 为标志信号
fifo_wr_buf axi_wr_buf(
    .wr_clk         (clk                    ),      
    .wr_rst         ((~rst) || (pose_vs_in) ),      
    .wr_en          ((wr_en_final) || (wr_en_add)), 
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


// 数据准备好条件和信号 ID 
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