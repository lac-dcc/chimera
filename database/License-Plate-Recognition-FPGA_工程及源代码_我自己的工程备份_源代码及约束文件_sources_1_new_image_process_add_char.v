`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 虎慕
// Create Date: 2023/04/28 11:55:13
// Description: 将模板匹配出来的结果添加进图像中。
// 添加的字符大小统一为32*32，添加的位置就是字符边框左上角的上方。
//////////////////////////////////////////////////////////////////////////////////

module add_char(
    //时钟及复位
    input               clk             ,   // 时钟信号
    input               rst_n           ,   // 复位信号（低有效）
    //输入视频流
    input               per_frame_vsync     ,
    input               per_frame_href      ,
    input               per_frame_clken     ,
    input    [15:0]     per_frame_rgb       ,
    //输入车牌边框
    input    [9:0]      plate_boarder_up 	,//输入的车牌候选区域
    input    [9:0]      plate_boarder_down	,
    input    [9:0]      plate_boarder_left  ,   
    input    [9:0]      plate_boarder_right ,
    input               plate_exist_flag    ,
    //输入模板匹配结果
    input    [5:0]      match_index_char1   ,
    input    [5:0]      match_index_char2   ,
    input    [5:0]      match_index_char3   ,
    input    [5:0]      match_index_char4   ,
    input    [5:0]      match_index_char5   ,
    input    [5:0]      match_index_char6   ,
    input    [5:0]      match_index_char7   ,
    //输出视频流
    output               post_frame_vsync,  // 场同步信号
    output               post_frame_href ,  // 行同步信号
    output               post_frame_clken,  // 数据输入使能
    output reg [15:0]    post_frame_rgb     // RGB565颜色数据
);
//------------------------------------------
//给出各字符对应的像素数据--注意顺序与特征值相同
parameter NUM_DISPLAY_CHAR1 = 2 ; //EIGEN_CHAR1的个数
parameter NUM_DISPLAY_CHAR2 = 11 ; //EIGEN_CHAR2的个数

//汉字的显示数据32*32
reg [1023:0] DISPLAY_CHAR1[NUM_DISPLAY_CHAR1-1:0];
always @(posedge clk) begin
    //"粤"
    DISPLAY_CHAR1[0] <= 1024'h00_00_00_00__00_00_00_00__00_07_00_00__00_06_00_00__07_FF_FF_E0__07_FF_FF_E0__07_11_90_E0__07_19_98_E0__07_11_90_E0__07_7F_FE_E0__07_7F_FE_E0__07_0D_98_E0__07_39_9C_E0__07_31_84_E0__07_FF_FF_E0__07_FF_FF_E0__00_00_00_00__00_00_00_00__7F_FF_FF_FE__7F_FF_FF_FE__00_60_00_00__00_60_00_00__00_FF_FF_C0__00_FF_FF_80__00_00_01_80__00_00_03_80__00_00_03_80__00_00_03_00__00_00_0F_00__00_00_7E_00__00_00_7C_00__00_00_00_00;
    //"沪"
    DISPLAY_CHAR1[1] <= 1024'h00_00_00_00__00_00_00_00__00_00_18_00__0C_00_1C_00__1F_00_1C_00__07_80_0E_00__03_C0_0C_00__01_80_00_00__00_03_FF_FC__00_03_FF_FC__00_03_00_1C__38_03_00_1C__7E_03_00_1C__1F_83_00_1C__07_03_00_1C__00_03_00_1C__00_03_FF_FC__00_03_FF_FC__00_83_00_1C__00_C7_00_00__01_C7_00_00__01_87_00_00__03_87_00_00__07_06_00_00__07_0E_00_00__0E_0E_00_00__0E_1C_00_00__1C_1C_00_00__3C_38_00_00__08_78_00_00__00_30_00_00__00_00_00_00;
    //"京"
//    DISPLAY_CHAR1[2] <= 1024'h00_00_00_00__00_00_00_00__00_03_00_00__00_03_80_00__00_03_80_00__00_01_C0_00__3F_FF_FF_FC__3F_FF_FF_FC__00_00_00_00__00_00_00_00__00_00_00_00__01_FF_FF_80__01_FF_FF_80__01_C0_01_80__01_C0_01_80__01_C0_01_80__01_C0_01_80__01_C0_01_80__01_FF_FF_80__01_FF_FF_80__00_01_C0_00__00_41_C0_00__00_E1_C7_00__01_E1_C7_80__03_C1_C3_C0__07_81_C1_F0__0F_01_C0_F8__3E_01_C0_38__18_03_C0_10__00_1F_80_00__00_0F_00_00__00_00_00_00;
end
//数字及字母的显示数据32*16
reg [511:0] DISPLAY_CHAR2[NUM_DISPLAY_CHAR2-1:0];
always @(posedge clk) begin
    //0
//    DISPLAY_CHAR2[0] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__07_E0_0F_F0__1C_38_38_38__38_1C_30_1C__70_0C_70_0C__70_0C_70_0C__70_0C_70_0C__70_0C_70_0C__70_0C_30_1C__38_1C_38_18__1C_38_1F_F0__07_E0_01_80__00_00_00_00__00_00_00_00;
    //1
    DISPLAY_CHAR2[0] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__01_C0_01_C0__03_C0_07_C0__1D_C0_19_C0__11_C0_01_C0__01_C0_01_C0__01_C0_01_C0__01_C0_01_C0__01_C0_01_C0__01_C0_01_C0__01_C0_01_C0__01_C0_00_00__00_00_00_00__00_00_00_00;
    //2
    DISPLAY_CHAR2[1] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__0F_E0_1F_F8__3C_38_38_1C__70_1C_00_1C__00_1C_00_18__00_38_00_38__00_70_00_E0__00_C0_01_C0__03_80_07_00__0E_00_1C_00__3C_00_3F_FC__3F_FC_00_00__00_00_00_00__00_00_00_00;
    //3
//    DISPLAY_CHAR2[3] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__07_E0_0F_F8__1C_38_38_1C__30_1C_10_1C__00_1C_00_18__00_78_03_E0__03_F0_00_78__00_1C_00_1C__00_1C_10_0C__70_1C_38_1C__3C_38_1F_F8__0F_E0_01_80__00_00_00_00__00_00_00_00;
    //4
//    DISPLAY_CHAR2[4] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__00_30_00_70__00_70_00_F0__01_F0_01_B0__03_B0_07_30__0E_30_0C_30__1C_30_38_30__30_30_70_30__FF_FE_FF_FE__FF_FE_00_30__00_30_00_30__00_30_00_00__00_00_00_00__00_00_00_00;
    //5
    DISPLAY_CHAR2[2] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__1F_F8_1F_F8__18_00_18_00__18_00_38_00__30_00_37_C0__3F_F0_78_78__70_38_00_1C__00_1C_00_0C__00_0C_20_1C__60_1C_70_1C__70_78_3F_F0__1F_E0_07_80__00_00_00_00__00_00_00_00;
    //6
//    DISPLAY_CHAR2[6] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__00_E0_00_E0__01_C0_03_80__03_80_07_00__0E_00_0E_00__1F_F0_1F_F8__3C_1C_38_0E__70_0E_70_0E__70_0E_70_0E__70_0E_38_0E__3C_1C_1F_F8__0F_F0_01_C0__00_00_00_00__00_00_00_00;
    //7
//    DISPLAY_CHAR2[7] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__7F_FE_7F_FE__00_0E_00_1C__00_18_00_38__00_30_00_70__00_60_00_E0__00_C0_01_C0__01_C0_01_80__03_80_03_80__03_00_07_00__07_00_06_00__0E_00_00_00__00_00_00_00__00_00_00_00;
    //8
//    DISPLAY_CHAR2[8] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__0F_E0_1F_F0__38_38_30_1C__30_1C_30_1C__30_1C_38_38__3C_78_0F_E0__1F_F0_3C_78__78_1C_70_1C__60_0C_60_0C__70_0C_70_1C__78_3C_3F_F8__1F_F0_03_80__00_00_00_00__00_00_00_00;
    //9
    DISPLAY_CHAR2[3] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__0F_E0_1F_F0__3C_78_70_3C__70_1C_60_1C__60_1C_60_1C__60_1C_70_38__78_78_3F_F8__1F_F0_00_E0__00_E0_01_C0__01_C0_03_80__03_80_07_00__06_00_0E_00__00_00_00_00__00_00_00_00;
    //A
//    DISPLAY_CHAR2[10] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__03_80_03_C0__03_C0_03_C0__07_C0_07_E0__06_E0_0E_60__0E_70_0E_70__0C_30_1C_38__1F_F8_1F_F8__3F_F8_38_1C__38_1C_70_1C__70_0E_70_0E__70_0E_00_00__00_00_00_00__00_00_00_00;
    //B
    DISPLAY_CHAR2[4] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__7F_E0_7F_F0__70_78_70_1C__70_1C_70_1C__70_1C_70_1C__70_38_7F_F0__7F_F0_70_78__70_1C_70_0E__70_0E_70_0E__70_0E_70_1C__70_3C_7F_F8__7F_F0_00_00__00_00_00_00__00_00_00_00;
    //C
    DISPLAY_CHAR2[5] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__07_E0_0F_F8__1E_3C_1C_1C__38_0C_38_0E__38_0E_70_0E__70_00_70_00__70_00_70_00__70_00_70_0E__70_0E_38_0E__38_0C_38_1C__1C_3C_0F_F8__07_F0_01_C0__00_00_00_00__00_00_00_00;
    //F
//    DISPLAY_CHAR2[13] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__7F_FE_7F_FE__70_00_70_00__70_00_70_00__70_00_70_00__70_00_7F_F0__7F_F0_7F_F0__70_00_70_00__70_00_70_00__70_00_70_00__70_00_70_00__70_00_00_00__00_00_00_00__00_00_00_00;
    //G
    //DISPLAY_CHAR2[13] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__07_E0_0F_F0__1E_38_1C_1C__38_1C_38_1C__30_1C_70_00__70_00_70_00__70_00_70_FC__70_FC_70_0C__70_0C_38_0C__38_0C_38_1C__1C_3C_1F_FC__07_EC_01_8C__00_00_00_00__00_00_00_00;
    //J
    DISPLAY_CHAR2[6] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__00_1C_00_1C__00_1C_00_1C__00_1C_00_1C__00_1C_00_1C__00_1C_00_1C__00_1C_00_1C__00_1C_38_1C__38_1C_38_1C__38_1C_38_1C__3C_38_1F_F8__0F_F0_03_80__00_00_00_00__00_00_00_00;
    //K
    //DISPLAY_CHAR2[15] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__70_1C_70_3C__70_78_70_70__70_E0_71_C0__73_C0_73_80__77_00_7F_80__7F_80_7D_C0__79_C0_70_E0__70_E0_70_70__70_78_70_38__70_3C_70_1C__70_0E_00_00__00_00_00_00__00_00_00_00;
    //L
//    DISPLAY_CHAR2[15] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__70_00_70_00__70_00_70_00__70_00_70_00__70_00_70_00__70_00_70_00__70_00_70_00__70_00_70_00__70_00_70_00__70_00_70_00__70_00_7F_FE__7F_FE_00_00__00_00_00_00__00_00_00_00;
    //Q
    //DISPLAY_CHAR2[17] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__07_E0_1F_F0__1C_78_38_3C__38_1C_70_1C__70_0C_70_0E__70_0E_70_0E__70_0E_70_0E__70_0E_70_4E__70_CE_70_FC__38_7C_38_7C__3C_38_1F_F8__0F_FC_01_98__00_00_00_00__00_00_00_00;
    //T
    DISPLAY_CHAR2[7] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__7F_FC_7F_FC__03_80_03_80__03_80_03_80__03_80_03_80__03_80_03_80__03_80_03_80__03_80_03_80__03_80_03_80__03_80_03_80__03_80_03_80__03_80_00_00__00_00_00_00__00_00_00_00;
    //U
    DISPLAY_CHAR2[8] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__70_1C_70_1C__70_1C_70_1C__70_1C_70_1C__70_1C_70_1C__70_1C_70_1C__70_1C_70_1C__70_1C_70_1C__70_1C_70_1C__70_1C_38_1C__3C_3C_1F_F8__0F_F0_03_C0__00_00_00_00__00_00_00_00;
    //V
    DISPLAY_CHAR2[9] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__E0_0E_70_0E__70_0E_70_1C__30_1C_38_1C__38_18_38_38__1C_38_1C_38__1C_70_0C_70__0E_70_0E_60__0E_E0_06_E0__07_C0_07_C0__03_C0_03_C0__03_80_03_80__00_00_00_00__00_00_00_00;
    //Z
    DISPLAY_CHAR2[10] <= 512'h00_00_00_00__00_00_00_00__00_00_00_00__3F_FC_3F_FC__00_1C_00_18__00_38_00_70__00_70_00_E0__00_C0_01_C0__03_80_03_80__07_00_0E_00__0E_00_1C_00__1C_00_38_00__70_00_7F_FE__7F_FE_00_00__00_00_00_00__00_00_00_00;
end

//------------------------------------------
//将输入信号进行两级延迟，并获取边沿
reg        per_frame_vsync_r;
reg        per_frame_href_r ;    
reg        per_frame_clken_r;
reg [15:0] per_frame_rgb_r  ;

reg        per_frame_vsync_r2;
reg        per_frame_href_r2 ;    
reg        per_frame_clken_r2;
reg [15:0] per_frame_rgb_r2  ;

wire vsyncr_pos_flag;
wire vsyncr_neg_flag;
wire hrefr_pos_flag;
wire hrefr_neg_flag;

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
    per_frame_vsync_r2 <= 1'b0;
    per_frame_href_r2  <= 1'b0;
    per_frame_clken_r2 <= 1'b0;
    per_frame_rgb_r2   <= 16'd0;
    
    per_frame_vsync_r  <= 1'b0;
    per_frame_href_r   <= 1'b0;
    per_frame_clken_r  <= 1'b0;
    per_frame_rgb_r    <= 16'd0;
end
else begin
    per_frame_vsync_r2 <= per_frame_vsync_r;
    per_frame_href_r2  <= per_frame_href_r ;
    per_frame_clken_r2 <= per_frame_clken_r;
    per_frame_rgb_r2   <= per_frame_rgb_r  ;
    
    per_frame_vsync_r <= per_frame_vsync;
    per_frame_href_r  <= per_frame_href ;
    per_frame_clken_r <= per_frame_clken;
    per_frame_rgb_r   <= per_frame_rgb  ;
end

assign vsyncr_pos_flag =   per_frame_vsync_r  & (~per_frame_vsync_r2);
assign vsyncr_neg_flag = (~per_frame_vsync_r) &   per_frame_vsync_r2;
assign hrefr_pos_flag =   per_frame_href_r  & (~per_frame_href_r2);
assign hrefr_neg_flag = (~per_frame_href_r) &   per_frame_href_r2;

assign post_frame_vsync = per_frame_vsync_r2;
assign post_frame_href  = per_frame_href_r2 ;
assign post_frame_clken = per_frame_clken_r2;

//------------------------------------------
//对输入的像素进行"行/场"方向计数，得到其纵横坐标
reg [9:0] x_cnt;
reg [9:0] y_cnt;
always@(posedge clk or negedge rst_n)
if(!rst_n)begin
    x_cnt <= 10'd0;
    y_cnt <= 10'd0;
end
else if(vsyncr_neg_flag)begin
    x_cnt <= 10'd0;
    y_cnt <= 10'd0;
end
else if(hrefr_neg_flag)begin
    x_cnt <= 10'd0;
    y_cnt <= y_cnt + 1'b1;
end
else if(per_frame_clken_r) begin
    x_cnt <= x_cnt + 1'b1;
end

//------------------------------------------
//寄存"行/场"方向计数
reg [9:0]   x_cnt_r1;
reg [9:0]   y_cnt_r1;
reg [9:0]   x_cnt_r2;
reg [9:0]   y_cnt_r2;

always@(posedge clk or negedge rst_n)
if(!rst_n)
begin
    x_cnt_r1 <= 10'd0;
    y_cnt_r1 <= 10'd0;
    x_cnt_r2 <= 10'd0;
    y_cnt_r2 <= 10'd0;
end
else begin
    x_cnt_r1 <= x_cnt;
    y_cnt_r1 <= y_cnt;
    x_cnt_r2 <= x_cnt_r1;
    y_cnt_r2 <= y_cnt_r1;
end

//------------------------------------------
//定义显示边界
reg [9:0] char_up    ;
reg [9:0] char_down  ;
reg [9:0] char_board0;
reg [9:0] char_board1;
reg [9:0] char_board2;
reg [9:0] char_board3;
reg [9:0] char_board4;
reg [9:0] char_board5;
reg [9:0] char_board6;
reg [9:0] char_board7;
always @(posedge clk) begin
    char_up     = plate_boarder_up - 10'd32;
    char_down   = plate_boarder_up;
    char_board0 = plate_boarder_left;
    char_board1 = plate_boarder_left + 10'd32;
    char_board2 = plate_boarder_left + 10'd32 + 10'd16;
    char_board3 = plate_boarder_left + 10'd32 + 10'd16 + 10'd16;
    char_board4 = plate_boarder_left + 10'd32 + 10'd16 + 10'd16 + 10'd16;
    char_board5 = plate_boarder_left + 10'd32 + 10'd16 + 10'd16 + 10'd16 + 10'd16;
    char_board6 = plate_boarder_left + 10'd32 + 10'd16 + 10'd16 + 10'd16 + 10'd16 + 10'd16;
    char_board7 = plate_boarder_left + 10'd32 + 10'd16 + 10'd16 + 10'd16 + 10'd16 + 10'd16 + 10'd16;
end

//定义当前像素是各个字符的哪一位
reg [9:0]  char1_pixel_index;
reg [9:0]  char2_pixel_index;
reg [9:0]  char3_pixel_index;
reg [9:0]  char4_pixel_index;
reg [9:0]  char5_pixel_index;
reg [9:0]  char6_pixel_index;
reg [9:0]  char7_pixel_index;
//always@(posedge clk or negedge rst_n)
always@(*)
if(!rst_n)begin
    char1_pixel_index <= 10'd0;
    char2_pixel_index <= 10'd0;
    char3_pixel_index <= 10'd0;
    char4_pixel_index <= 10'd0;
    char5_pixel_index <= 10'd0;
    char6_pixel_index <= 10'd0;
    char7_pixel_index <= 10'd0;
end
else if(y_cnt>=char_up && y_cnt<char_down && x_cnt>=char_board0)begin
    char1_pixel_index <= 10'd1023 - (((y_cnt-char_up)<<5) + x_cnt - char_board0);
    char2_pixel_index <= 10'd512  - (((y_cnt-char_up)<<4) + x_cnt - char_board1);
    char3_pixel_index <= 10'd512  - (((y_cnt-char_up)<<4) + x_cnt - char_board2);
    char4_pixel_index <= 10'd512  - (((y_cnt-char_up)<<4) + x_cnt - char_board3);
    char5_pixel_index <= 10'd512  - (((y_cnt-char_up)<<4) + x_cnt - char_board4);
    char6_pixel_index <= 10'd512  - (((y_cnt-char_up)<<4) + x_cnt - char_board5);
    char7_pixel_index <= 10'd512  - (((y_cnt-char_up)<<4) + x_cnt - char_board6);
end

//------------------------------------------
//在数据流中添加字符像素（黄色）
always@(posedge clk or negedge rst_n)
if(!rst_n)
    post_frame_rgb <= 16'd0;
else if(y_cnt>=char_up && y_cnt<char_down)begin
    if(((x_cnt>=char_board0) && (x_cnt<char_board1) && DISPLAY_CHAR1[match_index_char1][char1_pixel_index]) || //字符1
       ((x_cnt>=char_board1) && (x_cnt<char_board2) && DISPLAY_CHAR2[match_index_char2][char2_pixel_index]) || //字符2
       ((x_cnt>=char_board2) && (x_cnt<char_board3) && DISPLAY_CHAR2[match_index_char3][char3_pixel_index]) || //字符3
       ((x_cnt>=char_board3) && (x_cnt<char_board4) && DISPLAY_CHAR2[match_index_char4][char4_pixel_index]) || //字符4
       ((x_cnt>=char_board4) && (x_cnt<char_board5) && DISPLAY_CHAR2[match_index_char5][char5_pixel_index]) || //字符5
       ((x_cnt>=char_board5) && (x_cnt<char_board6) && DISPLAY_CHAR2[match_index_char6][char6_pixel_index]) || //字符6
       ((x_cnt>=char_board6) && (x_cnt<char_board7) && DISPLAY_CHAR2[match_index_char7][char7_pixel_index])    //字符7
      )                   
        post_frame_rgb <= 16'hffe0;//11111_111111_00000
    else
        post_frame_rgb <= per_frame_rgb_r;
end    
else begin
    post_frame_rgb <= per_frame_rgb_r;
end

endmodule
