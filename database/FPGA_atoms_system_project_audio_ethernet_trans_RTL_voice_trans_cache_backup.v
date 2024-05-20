// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

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
// 在传输之前的数据缓冲，并生成行有效和帧同步信号
//
module voice_trans_cache(
    input               sck         /*synthesis PAP_MARK_DEBUG="1"*/,
    input               dlrc        /*synthesis PAP_MARK_DEBUG="1"*/,
    input               rst         ,

    input [15:0]        ldata_in    /*synthesis PAP_MARK_DEBUG="1"*/,
    input [15:0]        rdata_in    ,

    output              voice_href  /*synthesis PAP_MARK_DEBUG="1"*/,
    output              voice_vsync /*synthesis PAP_MARK_DEBUG="1"*/,
    output [7:0]        ldata_out   /*synthesis PAP_MARK_DEBUG="1"*/,
    output [7:0]        rdata_out   
);

parameter VSYNC_WIDTH = 32;          // 场同步信号宽度
parameter HREF_INTERVAL = 16;        // 行同步信号间隔宽度
parameter HREF_WIDTH = 1024;         // 行同步信号宽度
parameter HREF_NUM = 128;           // 一帧中行的数量
// 状态机参数
parameter   GEN_INIT = 4'd0,
            GEN_VSYNC = 4'd1,
            GEN_INTERVAL = 4'd2,
            GEN_HREF = 4'd3;

wire            almost_full     /*synthesis PAP_MARK_DEBUG="1"*/;
wire [7:0]      rd_data         ;
wire            pose_href       ;
wire            nege_href       ;
wire            wr_full         /*synthesis PAP_MARK_DEBUG="1"*/;
wire            rd_empty        /*synthesis PAP_MARK_DEBUG="1"*/;

reg [10:0]      cnt_vsync_w     ;
reg [10:0]      cnt_interval    ;
reg [10:0]      cnt_href_w      ;
reg [10:0]      cnt_href        ;
reg             generate_en     ;
reg [3:0]       generate_state  ;
reg             href_d1         ;
reg             href_d2         ;
reg             href            ;
reg             vsync           ;
reg             vsync_d1        ;
reg             rd_en           ;
reg [7:0]       data_out        ;

assign voice_href = href;
assign voice_vsync = vsync;
assign ldata_out = data_out;

// 存储数据
voice_cache_fifo u_voice_cache_fifo(
    .wr_clk         (dlrc),                // input
    .wr_rst         (!rst),                // input
    .wr_en          (rst),                  // input
    .wr_data        (ldata_in),              // input [15:0]
    .wr_full        (wr_full),              // output
    .almost_full    (almost_full),      // output       512
    .rd_clk         (sck),                // input
    .rd_rst         (!rst),                // input
    .rd_en          (rd_en),                  // input
    .rd_data        (rd_data),              // output [7:0]
    .rd_empty       (rd_empty),            // output
    .almost_empty   ()     // output
);


// 开始生成行场同步信号
always @(posedge sck or negedge rst) begin
    if(!rst) begin
        generate_en <= 'b0;
    end
    else begin
        if(almost_full == 1'b1) begin
            generate_en <= 1'b1;
        end
        else begin
            generate_en <= generate_en;
        end
    end
end


// 场同步信号宽度计数
always @(posedge sck or negedge rst) begin
    if(!rst) begin
        cnt_vsync_w <= 'b0;
    end
    else if(generate_state == GEN_VSYNC) begin
        cnt_vsync_w <= cnt_vsync_w + 1'b1;
    end
    else begin
        cnt_vsync_w <= 'd0;
    end
end


// 场同步与行有效、行有效之间的间隔计数
always @(posedge sck or negedge rst) begin
    if(!rst) begin
        cnt_interval <= 'b0;
    end
    else if(generate_state == GEN_INTERVAL) begin
        cnt_interval <= cnt_interval + 1'b1;
    end
    else begin
        cnt_interval <= 'd0;
    end
end


// 行有效信号宽度计数
always @(posedge sck or negedge rst) begin
    if(!rst) begin
        cnt_href_w <= 'b0;
    end
    else if(generate_state == GEN_HREF) begin
        cnt_href_w <= cnt_href_w + 1'b1;
    end
    else begin
        cnt_href_w <= 'd0;
    end
end


// 行计数信号
always @(posedge sck or negedge rst) begin
    if(!rst) begin
        href_d1 <= 'b0;
        href_d2 <= 'b0;
    end
    else begin
        href_d1 <= href;
        href_d2 <= href_d1;
    end
end
assign pose_href = ((href_d1) && (!href_d2)) ? 1'b1 : 1'b0;
assign nege_href = ((!href_d1) && (href_d2)) ? 1'b1 : 1'b0;

always @(posedge sck or negedge rst) begin
    if(!rst) begin
        cnt_href <= 'b0;
    end
    else if(pose_href == 1'b1) begin
        cnt_href <= cnt_href + 1'b1;
    end
    else if(vsync == 1'b1) begin
        cnt_href <= 'd0;
    end
    else begin
        cnt_href <= cnt_href;
    end
end


// 生成状态机
always @(posedge sck or negedge rst) begin
    if(!rst) begin
        generate_state <= 'b0;
    end
    else if(generate_en == 1'b1) begin
        case(generate_state)
            GEN_INIT: begin
                generate_state <= GEN_VSYNC;
            end
            GEN_VSYNC: begin
                if(cnt_vsync_w >= VSYNC_WIDTH - 1'b1) begin
                    generate_state <= GEN_INTERVAL;
                end
                else begin
                    generate_state <= generate_state;
                end
            end
            GEN_INTERVAL: begin
                //if(cnt_interval >= HREF_INTERVAL - 1'b1) begin
                if(almost_full == 1'b1) begin
                    if(cnt_href < HREF_NUM) begin
                        generate_state <= GEN_HREF;
                    end
                    else begin
                        generate_state <= GEN_INIT;
                    end
                end
                else begin
                    generate_state <= generate_state;
                end
            end
            GEN_HREF: begin
                if(cnt_href_w >= HREF_WIDTH - 1'b1) begin
                    generate_state <= GEN_INTERVAL;
                end
                else begin
                    generate_state <= generate_state;
                end
            end
            default: begin
                generate_state <= GEN_INIT;
            end
        endcase
    end
    else begin
        generate_state <= 'd0;
    end
end


// 状态机内部信号
always @(posedge sck or negedge rst) begin
    if(!rst) begin
        vsync <= 'b0;
        href <= 'b0;
    end
    else begin
        case(generate_state)
            GEN_VSYNC: begin
                vsync <= 1'b1;
                href <= 1'b0;
            end 
            GEN_INTERVAL: begin
                vsync <= 1'b0;
                href <= 1'b0;
            end
            GEN_HREF: begin
                vsync <= 1'b0;
                href <= 1'b1;
            end
            default: begin
                vsync <= 1'b0;
                href <= 1'b0;
            end
        endcase
    end
end


// fifo 读使能信号
always @(*) begin
    if((cnt_href == HREF_NUM) && (href == 1'b1) && (cnt_href_w >= HREF_WIDTH - 'd2)) begin
        rd_en <= 1'b0;
    end
    else if((cnt_href == 'd0) && (href == 1'b1) && (cnt_href_w == 'd1)) begin
        rd_en <= 1'b0;
    end
    else begin
        rd_en <= href;
    end
end


// 输出数据，在每帧开头和结尾加入起始标识符：\xff\xb3，结束标识符：\xff\xb4
always @(*) begin
    if((href == 1'b1) && (cnt_href == 'd0) && (cnt_href_w == 'd1)) begin
        data_out <= 8'hff;
    end
    else if((href == 1'b1) && (cnt_href == 'd0) && (cnt_href_w == 'd2)) begin
        data_out <= 8'hb3;
    end
    else if((href == 1'b1) && (cnt_href == HREF_NUM) && (cnt_href_w == HREF_WIDTH - 1'b1)) begin
        data_out <= 8'hff;
    end
    else if((href == 1'b1) && (cnt_href == HREF_NUM) && (cnt_href_w == HREF_WIDTH)) begin
        data_out <= 8'hb4;
    end
    else begin
        data_out <= rd_data;
    end
end


// 场同步信号延迟几个周期
always @(posedge sck or negedge rst) begin
    if(!rst) begin
        vsync_d1 <= 'b0;
    end
    else begin
        vsync_d1 <= vsync;
    end
end

endmodule