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
// 将 ddr 的数据读出，可使用 outstanding 机制
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
    input       [3:0]                   rotate_mode     ,

    output reg                          buf_wr_en       ,
    output reg  [DQ_WIDTH*8-1:0]        buf_wr_data     ,

    // 输出数据给 buffer
    input                               frame_instruct  ,       // 0 为 1,2 帧，1 为 3,4 帧   
    
    // AXI READ INTERFACE
    output                              axi_arvalid     /*synthesis PAP_MARK_DEBUG="1"*/,  
    input                               axi_arready     /*synthesis PAP_MARK_DEBUG="1"*/, 
    output [CTRL_ADDR_WIDTH-1:0]        axi_araddr      /*synthesis PAP_MARK_DEBUG="1"*/,  
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
            WR1_PRE = 4'b0001,
            WR1_ADDR = 4'b0010,
            WR2_PRE = 4'b0011,
            WR2_ADDR = 4'b0100,
            WR3_PRE = 4'b0101,
            WR3_ADDR = 4'b0110,
            WR4_PRE = 4'b0111,
            WR4_ADDR = 4'b1000,
            WR5_PRE = 4'b1001,
            WR5_ADDR = 4'b1010;
// 地址偏移量
parameter FRAME_ADDR_OFFSET_1 = 'd30_000;
parameter FRAME_ADDR_OFFSET_2 = 'd260_000;
parameter   ADDR_OFFSET_1 = 'd0,                    
            ADDR_OFFSET_2 = FRAME_ADDR_OFFSET_1 * 2,  
            ADDR_OFFSET_3 = ADDR_OFFSET_2 + 2 * (FRAME_ADDR_OFFSET_1),      // 
            ADDR_OFFSET_4 = ADDR_OFFSET_3 + 2 * (FRAME_ADDR_OFFSET_1),
            ADDR_OFFSET_5 = ADDR_OFFSET_4 + 2 * (FRAME_ADDR_OFFSET_1);
parameter ADDR_STEP = BURST_LEN * 8;       // 首地址自增步长，1 个地址 32 位数据，这与芯片的 DQ 宽度有关

wire                            nege_vsync      ;
wire                            pose_vsync      ;
wire                            nege_href       ;
wire                            pose_arvalid    ;

reg  [3:0]                      addr_cnt        ;
reg [CTRL_ADDR_WIDTH-1:0]       reg_axi_araddr  /*synthesis PAP_MARK_DEBUG="1"*/;
reg                             reg_axi_arvalid ;
reg                             reg_axi_rready  ;
reg [DQ_WIDTH*8-1:0]            reg_axi_rdata   ;
reg                             processing_wait ;

reg                             reg_vsync_d1        ;
reg                             reg_vsync_d2        ;
reg                             reg_href_d1         ;
reg                             reg_href_d2         ;
reg                             axi_arvalid_temp    ;
reg                             axi_rd_en           ;
reg [3:0]                       addr_state          /*synthesis PAP_MARK_DEBUG="1"*/;
reg [15:0]                      reg_axi_araddr_1    ;
reg [15:0]                      reg_axi_araddr_2    ;
reg [15:0]                      reg_axi_araddr_3    ;
reg [15:0]                      reg_axi_araddr_4    ;
reg [19:0]                      reg_axi_araddr_5    ;
reg                             row_end_flag        ;
reg [10:0]                      row_count_1         ;
reg [10:0]                      row_count_2         ;
reg [15:0]                      rlast_count         /*synthesis PAP_MARK_DEBUG="1"*/;

assign axi_arvalid  = reg_axi_arvalid       ;
assign axi_araddr   = reg_axi_araddr        ;
assign axi_arlen    = BURST_LEN - 1'b1      ;   // 突发长度
assign axi_arsize   = DQ_WIDTH*8/8          ;   // DATA_LEN = 256
assign axi_arburst  = 2'b01                 ;
assign axi_rready   = 1'b1                  ;

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


// 读使能信号，在场同步下降沿或者行有效下降沿开始读，读一行后停止
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        axi_rd_en <= 'b0;
    end
    else if((nege_vsync == 1'b1) || (nege_href == 1'b1)) begin
        axi_rd_en <= 1'b1;
    end
    else if((((reg_axi_araddr_4 + ADDR_STEP) % (WIDTH_QD / 2) == 'b0) 
            || (((reg_axi_araddr_5 + ADDR_STEP) % (WIDTH_TC / 2) == 'b0) && rotate_mode == 'd0) || ((((reg_axi_araddr_5 - ADDR_STEP) % (WIDTH_TC / 2) == 'b0) && rotate_mode == 'd1) || (reg_axi_araddr_5 == 'd0 && addr_cnt == 'd5))) 
            && ((axi_arvalid == 1'b1) && (axi_arready == 1'b1))) begin
        axi_rd_en <= 1'b0;
    end
    else begin
        axi_rd_en <= axi_rd_en;
    end
end


// 使用状态机生成地址
// 状态机跳转条件
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        addr_state <= 'b0;
    end
    else if(pose_vsync==1'b1) begin
        addr_state <= 'b0;
    end
    else if(axi_rd_en) begin
        case(addr_state)
            INIT_WAIT: begin
                if(processing_wait) begin
                    addr_state <= INIT_WAIT;
                end
                else begin
                    addr_state <= WR1_PRE;
                end
            end
            WR1_PRE: begin
                addr_state <= WR1_ADDR;
            end
            WR1_ADDR: begin
                if(((reg_axi_araddr_1 + ADDR_STEP) % (WIDTH_QD / 2) == 'b0)
                    && ((axi_arvalid == 1'b1) && (axi_arready == 1'b1))) begin
                    addr_state <= WR2_PRE;
                end
                else begin
                    addr_state <= addr_state;
                end
            end
            WR2_PRE: begin
                addr_state <= WR2_ADDR;
            end
            WR2_ADDR: begin
                if(((reg_axi_araddr_2 + ADDR_STEP) % (WIDTH_QD / 2) == 'b0)
                    && ((axi_arvalid == 1'b1) && (axi_arready == 1'b1))) begin
                    addr_state <= WR3_PRE;
                end
                else begin
                    addr_state <= addr_state;
                end
            end
            WR3_PRE: begin
                addr_state <= WR3_ADDR;
            end
            WR3_ADDR: begin
                if(((reg_axi_araddr_3 + ADDR_STEP) % (WIDTH_QD / 2) == 'b0)
                    && ((axi_arvalid == 1'b1) && (axi_arready == 1'b1))) begin
                    addr_state <= WR4_PRE;
                end
                else begin
                    addr_state <= addr_state;
                end
            end
            WR4_PRE: begin
                addr_state <= WR4_ADDR;
            end
            WR4_ADDR: begin
                if(((reg_axi_araddr_4 + ADDR_STEP) % (WIDTH_QD / 2) == 'b0) 
                    && ((axi_arvalid == 1'b1) && (axi_arready == 1'b1))
                    && (processing_wait == 1'b0)) begin
                    if(reg_axi_araddr_4 == (WIDTH_QD * HEIGHT_QD / 2) - ADDR_STEP) begin
                        addr_state <= WR5_PRE;
                    end
                    else begin
                        addr_state <= INIT_WAIT;
                    end
                end
                else if((reg_axi_araddr_4 % (WIDTH_QD / 2) == 'b0)&&(axi_arvalid == 1'b1) && (axi_arready == 1'b1)
                    && (processing_wait == 1'b1)) begin
                    addr_state <= INIT_WAIT;
                end
                else begin
                    addr_state <= addr_state;
                end
            end
            WR5_PRE: begin
                addr_state <= WR5_ADDR;
            end
            WR5_ADDR: begin
                if(((reg_axi_araddr_5 + ADDR_STEP) % (WIDTH_TC / 2) == 'b0) 
                    && ((axi_arvalid == 1'b1) && (axi_arready == 1'b1))
                    && (processing_wait == 1'b0) && (rotate_mode == 'd0)) begin
                    if(reg_axi_araddr_5 == (WIDTH_TC * HEIGHT_TC / 2)-ADDR_STEP) begin
                        addr_state <= INIT_WAIT;
                    end
                    else begin
                        addr_state <= WR5_PRE;
                    end
                end
                else if((((reg_axi_araddr_5 - ADDR_STEP) % (WIDTH_TC / 2) == 'b0) 
                    && ((axi_arvalid == 1'b1) && (axi_arready == 1'b1))
                    && (processing_wait == 1'b0) && (rotate_mode == 'd1)) || ((reg_axi_araddr_5 == 'd0 && addr_cnt == 'd5) && (axi_arvalid == 1'b1) && (axi_arready == 1'b1)) ) begin
                        addr_state <= WR5_PRE;
                end
                else begin
                    addr_state <= addr_state;
                end
            end
            default: begin
                addr_state <= INIT_WAIT;
            end
        endcase
    end
    else begin
        addr_state <= addr_state;
    end
end


// 状态机内部信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin 
        reg_axi_araddr <= 'b0;
        reg_axi_araddr_1 <= 'b0;
        reg_axi_araddr_2 <= 'b0;
        reg_axi_araddr_3 <= 'b0;
        reg_axi_araddr_4 <= 'b0;
        reg_axi_araddr_5 <= 'b0;
        reg_axi_arvalid <= 'b0;
        row_end_flag <= 'b0;
        addr_cnt     <= 'd0;
    end
    else if(pose_vsync == 1'b1) begin
        reg_axi_araddr_1 <= 'b0;
        reg_axi_araddr_2 <= 'b0;
        reg_axi_araddr_3 <= 'b0;
        reg_axi_araddr_4 <= 'b0;
        addr_cnt         <= 'd0;
        if (rotate_mode == 4'd0) begin
            reg_axi_araddr_5 <= 'b0;
        end
        else begin
            reg_axi_araddr_5 <= 'd259200 - 'd6*ADDR_STEP ;
        end
    end
    else if(axi_rd_en) begin
        case(addr_state)
            WR1_PRE: begin                      // 预先送进去一个地址
                if(frame_instruct == 1'b0) begin
                    reg_axi_araddr <= ADDR_OFFSET_1 + reg_axi_araddr_1;
                end
                else if(frame_instruct == 1'b1) begin
                    reg_axi_araddr <= ADDR_OFFSET_1 + FRAME_ADDR_OFFSET_1 + reg_axi_araddr_1;
                end
            end
            WR1_ADDR: begin
                if((axi_arvalid == 1'b1) && (axi_arready == 1'b1)) begin
                    if((reg_axi_araddr_1 + ADDR_STEP) % (WIDTH_QD / 2) == 'b0) begin
                        reg_axi_arvalid <= 1'b0;
                    end
                    reg_axi_araddr <= reg_axi_araddr + ADDR_STEP;
                    reg_axi_araddr_1 <= reg_axi_araddr_1 + ADDR_STEP;
                end
                else begin
                    reg_axi_araddr <= reg_axi_araddr;
                    reg_axi_araddr_1 <= reg_axi_araddr_1;
                    reg_axi_arvalid <= 1'b1;
                end
            end
            WR2_PRE: begin
                if(frame_instruct == 1'b0) begin
                    reg_axi_araddr <= ADDR_OFFSET_2 + reg_axi_araddr_2;
                end
                else if(frame_instruct == 1'b1) begin
                    reg_axi_araddr <= ADDR_OFFSET_2 + FRAME_ADDR_OFFSET_1 + reg_axi_araddr_2;
                end
            end
            WR2_ADDR: begin
                if((axi_arvalid == 1'b1) && (axi_arready == 1'b1)) begin
                    if((reg_axi_araddr_2 + ADDR_STEP) % (WIDTH_QD / 2) == 'b0) begin
                        reg_axi_arvalid <= 1'b0;
                    end
                    reg_axi_araddr <= reg_axi_araddr + ADDR_STEP;
                    reg_axi_araddr_2 <= reg_axi_araddr_2 + ADDR_STEP;
                end
                else begin
                    reg_axi_araddr <= reg_axi_araddr;
                    reg_axi_araddr_2 <= reg_axi_araddr_2;
                    reg_axi_arvalid <= 1'b1;
                end
            end
            WR3_PRE: begin
                if(frame_instruct == 1'b0) begin
                    reg_axi_araddr <= ADDR_OFFSET_3 + reg_axi_araddr_3;
                end
                else if(frame_instruct == 1'b1) begin
                    reg_axi_araddr <= ADDR_OFFSET_3 + FRAME_ADDR_OFFSET_1 + reg_axi_araddr_3;
                end
            end
            WR3_ADDR: begin
                if((axi_arvalid == 1'b1) && (axi_arready == 1'b1)) begin
                    if((reg_axi_araddr_3 + ADDR_STEP) % (WIDTH_QD / 2) == 'b0) begin
                        reg_axi_arvalid <= 1'b0;
                    end
                    reg_axi_araddr <= reg_axi_araddr + ADDR_STEP;
                    reg_axi_araddr_3 <= reg_axi_araddr_3 + ADDR_STEP;
                end
                else begin
                    reg_axi_araddr <= reg_axi_araddr;
                    reg_axi_araddr_3 <= reg_axi_araddr_3;
                    reg_axi_arvalid <= 1'b1;
                end
            end
            WR4_PRE: begin
                if(frame_instruct == 1'b0) begin
                    reg_axi_araddr <= ADDR_OFFSET_4 + reg_axi_araddr_4;
                end
                else if(frame_instruct == 1'b1) begin
                    reg_axi_araddr <= ADDR_OFFSET_4 + FRAME_ADDR_OFFSET_1 + reg_axi_araddr_4;
                end
            end
            WR4_ADDR: begin
                if((axi_arvalid == 1'b1) && (axi_arready == 1'b1)) begin
                    if((reg_axi_araddr_4 + ADDR_STEP) % (WIDTH_QD / 2) == 'b0)  begin
                        reg_axi_arvalid <= 1'b0;
                    end
                    reg_axi_araddr <= reg_axi_araddr + ADDR_STEP;
                    reg_axi_araddr_4 <= reg_axi_araddr_4 + ADDR_STEP;
                end
                else begin
                    reg_axi_araddr <= reg_axi_araddr;
                    reg_axi_araddr_4 <= reg_axi_araddr_4;
                    reg_axi_arvalid <= 1'b1;
                end
            end
            WR5_PRE: begin
                if(frame_instruct == 1'b0) begin
                    reg_axi_araddr <= ADDR_OFFSET_5 + reg_axi_araddr_5;
                end
                else if(frame_instruct == 1'b1) begin
                    reg_axi_araddr <= ADDR_OFFSET_5 + FRAME_ADDR_OFFSET_2 + reg_axi_araddr_5;
                end
            end
            WR5_ADDR: begin
                if((axi_arvalid == 1'b1) && (axi_arready == 1'b1)) begin
                    if (rotate_mode == 'd0) begin
                        reg_axi_araddr <= reg_axi_araddr + ADDR_STEP;
                        reg_axi_araddr_5 <= reg_axi_araddr_5 + ADDR_STEP;
                    end
                    else begin
                        if (addr_cnt == 'd5) begin
                            addr_cnt <= 'd0;
                        end
                        else begin
                            addr_cnt <= addr_cnt + 1'b1;
                        end
                        reg_axi_araddr <= reg_axi_araddr + ADDR_STEP;
                        if (reg_axi_araddr_5 == 'd0) begin
                            reg_axi_araddr_5 <= reg_axi_araddr_5 ;
                        end
                        else begin
                            reg_axi_araddr_5 <= reg_axi_araddr_5 - ADDR_STEP;
                        end
                    end

                    if (((reg_axi_araddr_5 + ADDR_STEP) % (WIDTH_TC / 2) == 'b0) && rotate_mode == 'd0) begin
                        reg_axi_arvalid <= 1'b0;
                    end
                    else if((((reg_axi_araddr_5 - ADDR_STEP) % (WIDTH_TC / 2) == 'b0) && rotate_mode == 'd1) || (reg_axi_araddr_5 == 'd0 && addr_cnt == 'd5)) begin
                        reg_axi_arvalid <= 1'b0;
                    end
                end
                else begin
                    reg_axi_araddr <= reg_axi_araddr;
                    reg_axi_araddr_5 <= reg_axi_araddr_5;
                    reg_axi_arvalid <= 1'b1;
                end
            end
            default: begin
                reg_axi_araddr <= reg_axi_araddr;
                reg_axi_araddr_1 <= reg_axi_araddr_1;
                reg_axi_araddr_2 <= reg_axi_araddr_2;
                reg_axi_araddr_3 <= reg_axi_araddr_3;
                reg_axi_araddr_4 <= reg_axi_araddr_4;
                reg_axi_araddr_5 <= reg_axi_araddr_5;
                reg_axi_arvalid <= reg_axi_arvalid;
                row_end_flag <= row_end_flag;
            end
        endcase
    end
end


// 输出使能信号
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        buf_wr_en <= 'b0;
        buf_wr_data <= 'b0;
    end
    else begin
        buf_wr_en <= axi_rvalid;
        buf_wr_data <= axi_rdata;
    end
end


endmodule