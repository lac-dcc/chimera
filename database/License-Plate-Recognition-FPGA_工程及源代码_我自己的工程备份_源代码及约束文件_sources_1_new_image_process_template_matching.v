`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 虎慕
// Create Date: 2023/04/25 16:47:07
// Description: 本模块实现同或模板匹配。
// 由于特征值已经预设好，本模块默认水平切割成8个区域、垂直切割成5个区域。
//////////////////////////////////////////////////////////////////////////////////

module template_matching#(
    parameter HOR_SPLIT = 8, //水平切割成几个区域
    parameter VER_SPLIT = 5  //垂直切割成几个区域
)(
    //时钟及复位
    input               clk             ,   // 时钟信号
    input               rst_n           ,   // 复位信号（低有效）
    //输入视频流
    input               per_frame_vsync     ,
    input               per_frame_href      ,
    input               per_frame_clken     ,
    input               per_frame_bit       ,
    //输入的车牌候选区域
    input    [9:0]      plate_boarder_up 	,
    input    [9:0]      plate_boarder_down	,
    input    [9:0]      plate_boarder_left  ,   
    input    [9:0]      plate_boarder_right ,
    input               plate_exist_flag    ,
    //输入7个字符的特征值
    input [(HOR_SPLIT*VER_SPLIT-1'b1):0] char1_eigenvalue  ,
    input [(HOR_SPLIT*VER_SPLIT-1'b1):0] char2_eigenvalue  ,
    input [(HOR_SPLIT*VER_SPLIT-1'b1):0] char3_eigenvalue  ,
    input [(HOR_SPLIT*VER_SPLIT-1'b1):0] char4_eigenvalue  ,
    input [(HOR_SPLIT*VER_SPLIT-1'b1):0] char5_eigenvalue  ,
    input [(HOR_SPLIT*VER_SPLIT-1'b1):0] char6_eigenvalue  ,
    input [(HOR_SPLIT*VER_SPLIT-1'b1):0] char7_eigenvalue  ,
    //输出视频流
    output               post_frame_vsync, 
    output               post_frame_href , 
    output               post_frame_clken, 
    output               post_frame_bit  , 
    //输出模板匹配结果
    output reg [5:0] match_index_char1,//匹配后的字符1编号
    output reg [5:0] match_index_char2,//匹配后的字符2编号
    output reg [5:0] match_index_char3,//匹配后的字符3编号
    output reg [5:0] match_index_char4,//匹配后的字符4编号
    output reg [5:0] match_index_char5,//匹配后的字符5编号
    output reg [5:0] match_index_char6,//匹配后的字符6编号
    output reg [5:0] match_index_char7 //匹配后的字符7编号
);
//------------------------------------------
//给出预设好的特征值——注意这里默认水平切割成8个区域、垂直切割成5个区域。
//parameter NUM_EIGEN_CHAR1      = 2  ;   //EIGEN_CHAR1的个数
//parameter NUM_EIGEN_CHAR2      = 11 ;   //EIGEN_CHAR2的个数
//parameter NUM_EIGEN_CHAR2_num  = 4  ;   //EIGEN_CHAR2中数字的个数
//parameter NUM_EIGEN_CHAR2_char = NUM_EIGEN_CHAR2 - NUM_EIGEN_CHAR2_num;//EIGEN_CHAR2中字母的个数

//汉字的特征值
reg [39:0] EIGEN_CHAR1 [1:0];
always @(posedge clk) begin
    EIGEN_CHAR1[0] <= 40'b0110_0111_1011_1111_1111_1010_1101_0110_1010_1110;//"粤" 
    EIGEN_CHAR1[1] <= 40'b0001_1001_0100_1011_1111_1010_0101_0111_1000_1001;//"沪"
//    EIGEN_CHAR1[2] <= 40'b0010_0101_0100_1000_1110_0101_0011_1011_1110_0100;//"京"     
end
//数字及字母的特征值
reg [39:0] EIGEN_CHAR2 [10:0];
always @(posedge clk) begin
//    EIGEN_CHAR2[0]  <= 40'b0111_0100_1110_0011_0001_1000_1100_0111_0110_1110;//0
    EIGEN_CHAR2[0]  <= 40'b1111_1111_1111_1111_1111_1111_1111_1111_1111_1111;//1
    EIGEN_CHAR2[1]  <= 40'b1111_1000_1100_1100_1100_1100_0100_0011_0110_1110;//2
//    EIGEN_CHAR2[3]  <= 40'b0111_0110_1110_0001_1000_0111_0011_0011_0001_1111;//3
//    EIGEN_CHAR2[4]  <= 40'b0100_0111_1101_0110_1010_0111_0011_0001_0000_1000;//4
    EIGEN_CHAR2[2]  <= 40'b0111_0110_1110_0001_0000_0111_1000_1100_0111_1111;//5
//    EIGEN_CHAR2[6]  <= 40'b0111_0110_1110_0011_1111_0011_1000_1000_1000_1000;//6
//    EIGEN_CHAR2[7]  <= 40'b0010_0001_0000_1000_1100_0100_0010_0011_0001_1111;//7
//    EIGEN_CHAR2[8]  <= 40'b0111_0100_1110_0011_1011_1111_0100_1110_0110_1110;//8
    EIGEN_CHAR2[3]  <= 40'b0011_0011_0001_0001_1000_1111_1100_0110_0010_1110;//9
//    EIGEN_CHAR2[10] <= 40'b1100_1111_1101_0110_1010_0111_0011_1000_1100_0100;//A
    EIGEN_CHAR2[4] <= 40'b0111_1110_0110_0011_1001_0111_1110_0111_0010_1111;//B
    EIGEN_CHAR2[5] <= 40'b0111_0100_0110_0010_0001_0000_1000_0110_0010_1110;//C
//    EIGEN_CHAR2[13] <= 40'b0000_1000_0100_0010_1111_0111_1000_0100_0111_1111;//F
//    EIGEN_CHAR2[14] <= 40'b1111_0100_1110_0011_0001_1110_1000_0111_0111_1110;//G
    EIGEN_CHAR2[6] <= 40'b1111_0100_1110_0001_0000_1000_0100_0010_0001_0000;//J
//    EIGEN_CHAR2[16] <= 40'b1000_1110_0111_0110_1111_0111_1011_0101_0011_1001;//K
//    EIGEN_CHAR2[15] <= 40'b1111_1000_1100_0110_0011_0001_1000_1100_0110_0011;//L
//    EIGEN_CHAR2[18] <= 40'b1111_0111_1110_0011_0001_1000_1100_0110_0010_1110;//Q
    EIGEN_CHAR2[7] <= 40'b0010_0001_0000_1000_0100_0010_0001_0000_1001_1111;//T
    EIGEN_CHAR2[8] <= 40'b1111_0100_1110_0011_0001_1000_1100_0110_0011_0001;//U
    EIGEN_CHAR2[9] <= 40'b0010_0011_1001_1100_1010_0101_0110_1111_0111_0001;//V
    EIGEN_CHAR2[10] <= 40'b1111_1000_1100_0100_0100_0110_0010_0011_0001_1111;//Z
end

//------------------------------------------
//将输入信号进行两级延迟，并获取边沿
reg per_frame_vsync_r;
reg per_frame_href_r ;    
reg per_frame_clken_r;
reg per_frame_bit_r  ;

reg per_frame_vsync_r2;
reg per_frame_href_r2 ;    
reg per_frame_clken_r2;
reg per_frame_bit_r2  ;

wire vsyncr_pos_flag;
wire vsyncr_neg_flag;
wire hrefr_pos_flag;
wire hrefr_neg_flag;

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
    per_frame_vsync_r2 <= 1'b0;
    per_frame_href_r2  <= 1'b0;
    per_frame_clken_r2 <= 1'b0;
    per_frame_bit_r2   <= 1'b0;
    
    per_frame_vsync_r  <= 1'b0;
    per_frame_href_r   <= 1'b0;
    per_frame_clken_r  <= 1'b0;
    per_frame_bit_r    <= 1'b0;
end
else begin
    per_frame_vsync_r2 <= per_frame_vsync_r;
    per_frame_href_r2  <= per_frame_href_r ;
    per_frame_clken_r2 <= per_frame_clken_r;
    per_frame_bit_r2   <= per_frame_bit_r  ;
    
    per_frame_vsync_r <= per_frame_vsync;
    per_frame_href_r  <= per_frame_href ;
    per_frame_clken_r <= per_frame_clken;
    per_frame_bit_r   <= per_frame_bit  ;
end

assign vsyncr_pos_flag =   per_frame_vsync_r  & (~per_frame_vsync_r2);
assign vsyncr_neg_flag = (~per_frame_vsync_r) &   per_frame_vsync_r2;
assign hrefr_pos_flag =   per_frame_href_r  & (~per_frame_href_r2);
assign hrefr_neg_flag = (~per_frame_href_r) &   per_frame_href_r2;

assign post_frame_vsync = per_frame_vsync_r2;
assign post_frame_href  = per_frame_href_r2 ;
assign post_frame_clken = per_frame_clken_r2;
assign post_frame_bit   = per_frame_bit_r2  ;

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
//进行同或模板匹配-计算所有结果，找出最大值
//汉字最多容许4个错误、数字最多容许2个错误

//计算输入特征值与理想特征值的同或结果
reg [39:0] xnor_char1 [1:0] ;//[NUM_EIGEN_CHAR1-1:0]     ;//一定是汉字
reg [39:0] xnor_char2 [6:0] ;//[NUM_EIGEN_CHAR2_char-1:0];//一定是字母
reg [39:0] xnor_char3 [10:0];//[NUM_EIGEN_CHAR2-1:0]     ;//可能是数字、字母
reg [39:0] xnor_char4 [10:0];//[NUM_EIGEN_CHAR2-1:0]     ;//可能是数字、字母
reg [39:0] xnor_char5 [10:0];//[NUM_EIGEN_CHAR2-1:0]     ;//可能是数字、字母
reg [39:0] xnor_char6 [10:0];//[NUM_EIGEN_CHAR2-1:0]     ;//可能是数字、字母
reg [39:0] xnor_char7 [10:0];//[NUM_EIGEN_CHAR2-1:0]     ;//可能是数字、字母
integer i;
generate
always@(posedge clk or negedge rst_n)
if(!rst_n)begin
    for(i=0;i<2;i=i+1)begin: INI_XNOR_CHAR1
        xnor_char1[i] = 40'd0;
    end
    for(i=0;i<7;i=i+1)begin: INI_XNOR_CHAR2
        xnor_char2[i] = 40'd0;
    end
    for(i=0;i<11;i=i+1)begin: INI_XNOR_CHAR3
        xnor_char3[i] = 40'd0;
        xnor_char4[i] = 40'd0;
        xnor_char5[i] = 40'd0;
        xnor_char6[i] = 40'd0;
        xnor_char7[i] = 40'd0;
    end
end
else begin
    for(i=0;i<2;i=i+1)begin: CAL_XNOR_CHAR1
        xnor_char1[i] = char1_eigenvalue ^~ EIGEN_CHAR1[i];
    end
    for(i=0;i<7;i=i+1)begin: CAL_XNOR_CHAR2
        xnor_char2[i] = char2_eigenvalue ^~ EIGEN_CHAR2[i+4];
    end
    for(i=0;i<11;i=i+1)begin: CAL_XNOR_CHAR3
        xnor_char3[i] = char3_eigenvalue ^~ EIGEN_CHAR2[i];
        xnor_char4[i] = char4_eigenvalue ^~ EIGEN_CHAR2[i];
        xnor_char5[i] = char5_eigenvalue ^~ EIGEN_CHAR2[i];
        xnor_char6[i] = char6_eigenvalue ^~ EIGEN_CHAR2[i];
        xnor_char7[i] = char7_eigenvalue ^~ EIGEN_CHAR2[i];
    end
end
endgenerate

//将同或结果求和
reg [5:0] match_char1 [1:0]  [39:0];//[NUM_EIGEN_CHAR1-1:0]     
reg [5:0] match_char2 [6:0]  [39:0];//[NUM_EIGEN_CHAR2_char-1:0]
reg [5:0] match_char3 [10:0] [39:0];//[NUM_EIGEN_CHAR2-1:0]     
reg [5:0] match_char4 [10:0] [39:0];//[NUM_EIGEN_CHAR2-1:0]     
reg [5:0] match_char5 [10:0] [39:0];//[NUM_EIGEN_CHAR2-1:0]     
reg [5:0] match_char6 [10:0] [39:0];//[NUM_EIGEN_CHAR2-1:0]     
reg [5:0] match_char7 [10:0] [39:0];//[NUM_EIGEN_CHAR2-1:0]     
integer m,n,k,j;
generate
always@(posedge clk or negedge rst_n)
if(!rst_n)begin
    for(m=0;m<2;m=m+1)begin: INI1_MATCH_CHAR1
        for(j=0;j<40;j=j+1)begin
            match_char1[m][j] = 6'd0;
        end
    end
    for(n=0;n<7;n=n+1)begin: INI1_MATCH_CHAR2
        for(j=0;j<40;j=j+1)begin
            match_char2[n][j] = 6'd0;
        end
    end
    for(k=0;k<11;k=k+1)begin: INI1_MATCH_CHAR3
        for(j=0;j<40;j=j+1)begin
            match_char3[k][j] = 6'd0;
            match_char4[k][j] = 6'd0;
            match_char5[k][j] = 6'd0;
            match_char6[k][j] = 6'd0;
            match_char7[k][j] = 6'd0;
        end        
    end
end
else if(vsyncr_neg_flag || (y_cnt <= plate_boarder_down))begin
    for(m=0;m<2;m=m+1)begin: INI2_MATCH_CHAR1
        for(j=0;j<40;j=j+1)begin: EVERY_MATCH_CHAR1
            match_char1[m][j] = 6'd0;
        end
    end
    for(n=0;n<7;n=n+1)begin: INI2_MATCH_CHAR2
        for(j=0;j<40;j=j+1)begin
            match_char2[n][j] = 6'd0;
        end
    end
    for(k=0;k<11;k=k+1)begin: INI2_MATCH_CHAR3
        for(j=0;j<40;j=j+1)begin
            match_char3[k][j] = 6'd0;
            match_char4[k][j] = 6'd0;
            match_char5[k][j] = 6'd0;
            match_char6[k][j] = 6'd0;
            match_char7[k][j] = 6'd0;
        end
    end
end
else if(y_cnt <= plate_boarder_down+2)begin
    for(m=0;m<2;m=m+1)begin: CAL_MATCH_CHAR1
        for(j=0;j<40;j=j+1)begin
            if(j==0)
                match_char1[m][j] = xnor_char1[m][j];
            else
                match_char1[m][j] = match_char1[m][j-1] + xnor_char1[m][j];
        end
    end
    for(n=0;n<7;n=n+1)begin: CAL_MATCH_CHAR2
        for(j=0;j<40;j=j+1)begin
            if(j==0)
                match_char2[n][j] = xnor_char2[n][j];
            else
                match_char2[n][j] = match_char2[n][j-1] + xnor_char2[n][j];
        end
    end
    for(k=0;k<11;k=k+1)begin: CAL_MATCH_CHAR3
        for(j=0;j<40;j=j+1)begin
            if(j==0)begin
                match_char3[k][j] = xnor_char3[k][j];
                match_char4[k][j] = xnor_char4[k][j];
                match_char5[k][j] = xnor_char5[k][j];
                match_char6[k][j] = xnor_char6[k][j];
                match_char7[k][j] = xnor_char7[k][j];
            end
            else begin
                match_char3[k][j] = match_char3[k][j-1] + xnor_char3[k][j];
                match_char4[k][j] = match_char4[k][j-1] + xnor_char4[k][j];
                match_char5[k][j] = match_char5[k][j-1] + xnor_char5[k][j];
                match_char6[k][j] = match_char6[k][j-1] + xnor_char6[k][j];
                match_char7[k][j] = match_char7[k][j-1] + xnor_char7[k][j];
            end
        end
    end
end
endgenerate

////将同或结果求和
//reg [5:0] match_char1 [NUM_EIGEN_CHAR1-1:0]     ;//[2:0] ;
//reg [5:0] match_char2 [NUM_EIGEN_CHAR2_char-1:0];//[9:0] ;
//reg [5:0] match_char3 [NUM_EIGEN_CHAR2-1:0]     ;//[19:0];
//reg [5:0] match_char4 [NUM_EIGEN_CHAR2-1:0]     ;//[19:0];
//reg [5:0] match_char5 [NUM_EIGEN_CHAR2-1:0]     ;//[19:0];
//reg [5:0] match_char6 [NUM_EIGEN_CHAR2-1:0]     ;//[19:0];
//reg [5:0] match_char7 [NUM_EIGEN_CHAR2-1:0]     ;//[19:0];
//integer m,n,k,j;
//generate
//always@(posedge clk or negedge rst_n)
//if(!rst_n)begin
//    for(m=0;m<NUM_EIGEN_CHAR1;m=m+1)begin: INI1_MATCH_CHAR1
//        match_char1[m] = 6'd0;
//    end
//    for(n=0;n<NUM_EIGEN_CHAR2_char;n=n+1)begin: INI1_MATCH_CHAR2
//        match_char2[n] = 6'd0;
//    end
//    for(k=0;k<NUM_EIGEN_CHAR2;k=k+1)begin: INI1_MATCH_CHAR3
//        match_char3[k] = 6'd0;
//        match_char4[k] = 6'd0;
//        match_char5[k] = 6'd0;
//        match_char6[k] = 6'd0;
//        match_char7[k] = 6'd0;
//    end
//end
//else if(vsyncr_neg_flag || (y_cnt <= plate_boarder_down))begin
//    for(m=0;m<NUM_EIGEN_CHAR1;m=m+1)begin: INI2_MATCH_CHAR1
//        match_char1[m] = 6'd0;
//    end
//    for(n=0;n<NUM_EIGEN_CHAR2_char;n=n+1)begin: INI2_MATCH_CHAR2
//        match_char2[n] = 6'd0;
//    end
//    for(k=0;k<NUM_EIGEN_CHAR2;k=k+1)begin: INI2_MATCH_CHAR3
//        match_char3[k] = 6'd0;
//        match_char4[k] = 6'd0;
//        match_char5[k] = 6'd0;
//        match_char6[k] = 6'd0;
//        match_char7[k] = 6'd0;
//    end
//end
//else if(y_cnt == plate_boarder_down+2)begin
//    for(m=0;m<NUM_EIGEN_CHAR1;m=m+1)begin: CAL_MATCH_CHAR1
//        case(x_cnt)
//            10'd0 : match_char1[m] <= xnor_char1[m][0];
//            10'd1 : match_char1[m] <= match_char1[m] + xnor_char1[m][1];
//            10'd2 : match_char1[m] <= match_char1[m] + xnor_char1[m][2];
//            10'd3 : match_char1[m] <= match_char1[m] + xnor_char1[m][3];
//            10'd4 : match_char1[m] <= match_char1[m] + xnor_char1[m][4];
//            10'd5 : match_char1[m] <= match_char1[m] + xnor_char1[m][5];
//            10'd6 : match_char1[m] <= match_char1[m] + xnor_char1[m][6];
//            10'd7 : match_char1[m] <= match_char1[m] + xnor_char1[m][7];
//            10'd8 : match_char1[m] <= match_char1[m] + xnor_char1[m][8];
//            10'd9 : match_char1[m] <= match_char1[m] + xnor_char1[m][9];
//            10'd10: match_char1[m] <= match_char1[m] + xnor_char1[m][10];
//            10'd11: match_char1[m] <= match_char1[m] + xnor_char1[m][11];
//            10'd12: match_char1[m] <= match_char1[m] + xnor_char1[m][12];
//            10'd13: match_char1[m] <= match_char1[m] + xnor_char1[m][13];
//            10'd14: match_char1[m] <= match_char1[m] + xnor_char1[m][14];
//            10'd15: match_char1[m] <= match_char1[m] + xnor_char1[m][15];
//            10'd16: match_char1[m] <= match_char1[m] + xnor_char1[m][16];
//            10'd17: match_char1[m] <= match_char1[m] + xnor_char1[m][17];
//            10'd18: match_char1[m] <= match_char1[m] + xnor_char1[m][18];
//            10'd19: match_char1[m] <= match_char1[m] + xnor_char1[m][19];
//            10'd20: match_char1[m] <= match_char1[m] + xnor_char1[m][20];
//            10'd21: match_char1[m] <= match_char1[m] + xnor_char1[m][21];
//            10'd22: match_char1[m] <= match_char1[m] + xnor_char1[m][22];
//            10'd23: match_char1[m] <= match_char1[m] + xnor_char1[m][23];
//            10'd24: match_char1[m] <= match_char1[m] + xnor_char1[m][24];
//            10'd25: match_char1[m] <= match_char1[m] + xnor_char1[m][25];
//            10'd26: match_char1[m] <= match_char1[m] + xnor_char1[m][26];
//            10'd27: match_char1[m] <= match_char1[m] + xnor_char1[m][27];
//            10'd28: match_char1[m] <= match_char1[m] + xnor_char1[m][28];
//            10'd29: match_char1[m] <= match_char1[m] + xnor_char1[m][29];
//            10'd30: match_char1[m] <= match_char1[m] + xnor_char1[m][30];
//            10'd31: match_char1[m] <= match_char1[m] + xnor_char1[m][31];
//            10'd32: match_char1[m] <= match_char1[m] + xnor_char1[m][32];
//            10'd33: match_char1[m] <= match_char1[m] + xnor_char1[m][33];
//            10'd34: match_char1[m] <= match_char1[m] + xnor_char1[m][34];
//            10'd35: match_char1[m] <= match_char1[m] + xnor_char1[m][35];
//            10'd36: match_char1[m] <= match_char1[m] + xnor_char1[m][36];
//            10'd37: match_char1[m] <= match_char1[m] + xnor_char1[m][37];
//            10'd38: match_char1[m] <= match_char1[m] + xnor_char1[m][38];
//            10'd39: match_char1[m] <= match_char1[m] + xnor_char1[m][39];
//            default:;
//        endcase
//    end
//    for(n=0;n<NUM_EIGEN_CHAR2_char;n=n+1)begin: CAL_MATCH_CHAR2
//        case(x_cnt)
//            10'd0 : match_char2[n] <= xnor_char2[n][0];
//            10'd1 : match_char2[n] <= match_char2[n] + xnor_char2[n][1];
//            10'd2 : match_char2[n] <= match_char2[n] + xnor_char2[n][2];
//            10'd3 : match_char2[n] <= match_char2[n] + xnor_char2[n][3];
//            10'd4 : match_char2[n] <= match_char2[n] + xnor_char2[n][4];
//            10'd5 : match_char2[n] <= match_char2[n] + xnor_char2[n][5];
//            10'd6 : match_char2[n] <= match_char2[n] + xnor_char2[n][6];
//            10'd7 : match_char2[n] <= match_char2[n] + xnor_char2[n][7];
//            10'd8 : match_char2[n] <= match_char2[n] + xnor_char2[n][8];
//            10'd9 : match_char2[n] <= match_char2[n] + xnor_char2[n][9];
//            10'd10: match_char2[n] <= match_char2[n] + xnor_char2[n][10];
//            10'd11: match_char2[n] <= match_char2[n] + xnor_char2[n][11];
//            10'd12: match_char2[n] <= match_char2[n] + xnor_char2[n][12];
//            10'd13: match_char2[n] <= match_char2[n] + xnor_char2[n][13];
//            10'd14: match_char2[n] <= match_char2[n] + xnor_char2[n][14];
//            10'd15: match_char2[n] <= match_char2[n] + xnor_char2[n][15];
//            10'd16: match_char2[n] <= match_char2[n] + xnor_char2[n][16];
//            10'd17: match_char2[n] <= match_char2[n] + xnor_char2[n][17];
//            10'd18: match_char2[n] <= match_char2[n] + xnor_char2[n][18];
//            10'd19: match_char2[n] <= match_char2[n] + xnor_char2[n][19];
//            10'd20: match_char2[n] <= match_char2[n] + xnor_char2[n][20];
//            10'd21: match_char2[n] <= match_char2[n] + xnor_char2[n][21];
//            10'd22: match_char2[n] <= match_char2[n] + xnor_char2[n][22];
//            10'd23: match_char2[n] <= match_char2[n] + xnor_char2[n][23];
//            10'd24: match_char2[n] <= match_char2[n] + xnor_char2[n][24];
//            10'd25: match_char2[n] <= match_char2[n] + xnor_char2[n][25];
//            10'd26: match_char2[n] <= match_char2[n] + xnor_char2[n][26];
//            10'd27: match_char2[n] <= match_char2[n] + xnor_char2[n][27];
//            10'd28: match_char2[n] <= match_char2[n] + xnor_char2[n][28];
//            10'd29: match_char2[n] <= match_char2[n] + xnor_char2[n][29];
//            10'd30: match_char2[n] <= match_char2[n] + xnor_char2[n][30];
//            10'd31: match_char2[n] <= match_char2[n] + xnor_char2[n][31];
//            10'd32: match_char2[n] <= match_char2[n] + xnor_char2[n][32];
//            10'd33: match_char2[n] <= match_char2[n] + xnor_char2[n][33];
//            10'd34: match_char2[n] <= match_char2[n] + xnor_char2[n][34];
//            10'd35: match_char2[n] <= match_char2[n] + xnor_char2[n][35];
//            10'd36: match_char2[n] <= match_char2[n] + xnor_char2[n][36];
//            10'd37: match_char2[n] <= match_char2[n] + xnor_char2[n][37];
//            10'd38: match_char2[n] <= match_char2[n] + xnor_char2[n][38];
//            10'd39: match_char2[n] <= match_char2[n] + xnor_char2[n][39];
//            default:;
//        endcase
//    end
//    for(k=0;k<NUM_EIGEN_CHAR2;k=k+1)begin: CAL_MATCH_CHAR3
//        case(x_cnt)
//            10'd0 :begin match_char3[k] <= xnor_char3[k][0]; match_char4[k] <= xnor_char4[k][0];  match_char5[k] <= xnor_char5[k][0];  match_char6[k] <= xnor_char6[k][0]; match_char7[k] <= xnor_char7[k][0]; end
//            10'd1 :begin match_char3[k] <= match_char3[k] + xnor_char3[k][1] ; match_char4[k] <= match_char4[k] + xnor_char4[k][1] ; match_char5[k] <= match_char5[k] + xnor_char5[k][1] ; match_char6[k] <= match_char6[k] + xnor_char6[k][1] ; match_char7[k] <= match_char7[k] + xnor_char7[k][1] ;end
//            10'd2 :begin match_char3[k] <= match_char3[k] + xnor_char3[k][2] ; match_char4[k] <= match_char4[k] + xnor_char4[k][2] ; match_char5[k] <= match_char5[k] + xnor_char5[k][2] ; match_char6[k] <= match_char6[k] + xnor_char6[k][2] ; match_char7[k] <= match_char7[k] + xnor_char7[k][2] ;end
//            10'd3 :begin match_char3[k] <= match_char3[k] + xnor_char3[k][3] ; match_char4[k] <= match_char4[k] + xnor_char4[k][3] ; match_char5[k] <= match_char5[k] + xnor_char5[k][3] ; match_char6[k] <= match_char6[k] + xnor_char6[k][3] ; match_char7[k] <= match_char7[k] + xnor_char7[k][3] ;end
//            10'd4 :begin match_char3[k] <= match_char3[k] + xnor_char3[k][4] ; match_char4[k] <= match_char4[k] + xnor_char4[k][4] ; match_char5[k] <= match_char5[k] + xnor_char5[k][4] ; match_char6[k] <= match_char6[k] + xnor_char6[k][4] ; match_char7[k] <= match_char7[k] + xnor_char7[k][4] ;end
//            10'd5 :begin match_char3[k] <= match_char3[k] + xnor_char3[k][5] ; match_char4[k] <= match_char4[k] + xnor_char4[k][5] ; match_char5[k] <= match_char5[k] + xnor_char5[k][5] ; match_char6[k] <= match_char6[k] + xnor_char6[k][5] ; match_char7[k] <= match_char7[k] + xnor_char7[k][5] ;end
//            10'd6 :begin match_char3[k] <= match_char3[k] + xnor_char3[k][6] ; match_char4[k] <= match_char4[k] + xnor_char4[k][6] ; match_char5[k] <= match_char5[k] + xnor_char5[k][6] ; match_char6[k] <= match_char6[k] + xnor_char6[k][6] ; match_char7[k] <= match_char7[k] + xnor_char7[k][6] ;end
//            10'd7 :begin match_char3[k] <= match_char3[k] + xnor_char3[k][7] ; match_char4[k] <= match_char4[k] + xnor_char4[k][7] ; match_char5[k] <= match_char5[k] + xnor_char5[k][7] ; match_char6[k] <= match_char6[k] + xnor_char6[k][7] ; match_char7[k] <= match_char7[k] + xnor_char7[k][7] ;end
//            10'd8 :begin match_char3[k] <= match_char3[k] + xnor_char3[k][8] ; match_char4[k] <= match_char4[k] + xnor_char4[k][8] ; match_char5[k] <= match_char5[k] + xnor_char5[k][8] ; match_char6[k] <= match_char6[k] + xnor_char6[k][8] ; match_char7[k] <= match_char7[k] + xnor_char7[k][8] ;end
//            10'd9 :begin match_char3[k] <= match_char3[k] + xnor_char3[k][9] ; match_char4[k] <= match_char4[k] + xnor_char4[k][9] ; match_char5[k] <= match_char5[k] + xnor_char5[k][9] ; match_char6[k] <= match_char6[k] + xnor_char6[k][9] ; match_char7[k] <= match_char7[k] + xnor_char7[k][9] ;end
//            10'd10:begin match_char3[k] <= match_char3[k] + xnor_char3[k][10]; match_char4[k] <= match_char4[k] + xnor_char4[k][10]; match_char5[k] <= match_char5[k] + xnor_char5[k][10]; match_char6[k] <= match_char6[k] + xnor_char6[k][10]; match_char7[k] <= match_char7[k] + xnor_char7[k][10];end
//            10'd11:begin match_char3[k] <= match_char3[k] + xnor_char3[k][11]; match_char4[k] <= match_char4[k] + xnor_char4[k][11]; match_char5[k] <= match_char5[k] + xnor_char5[k][11]; match_char6[k] <= match_char6[k] + xnor_char6[k][11]; match_char7[k] <= match_char7[k] + xnor_char7[k][11];end
//            10'd12:begin match_char3[k] <= match_char3[k] + xnor_char3[k][12]; match_char4[k] <= match_char4[k] + xnor_char4[k][12]; match_char5[k] <= match_char5[k] + xnor_char5[k][12]; match_char6[k] <= match_char6[k] + xnor_char6[k][12]; match_char7[k] <= match_char7[k] + xnor_char7[k][12];end
//            10'd13:begin match_char3[k] <= match_char3[k] + xnor_char3[k][13]; match_char4[k] <= match_char4[k] + xnor_char4[k][13]; match_char5[k] <= match_char5[k] + xnor_char5[k][13]; match_char6[k] <= match_char6[k] + xnor_char6[k][13]; match_char7[k] <= match_char7[k] + xnor_char7[k][13];end
//            10'd14:begin match_char3[k] <= match_char3[k] + xnor_char3[k][14]; match_char4[k] <= match_char4[k] + xnor_char4[k][14]; match_char5[k] <= match_char5[k] + xnor_char5[k][14]; match_char6[k] <= match_char6[k] + xnor_char6[k][14]; match_char7[k] <= match_char7[k] + xnor_char7[k][14];end
//            10'd15:begin match_char3[k] <= match_char3[k] + xnor_char3[k][15]; match_char4[k] <= match_char4[k] + xnor_char4[k][15]; match_char5[k] <= match_char5[k] + xnor_char5[k][15]; match_char6[k] <= match_char6[k] + xnor_char6[k][15]; match_char7[k] <= match_char7[k] + xnor_char7[k][15];end
//            10'd16:begin match_char3[k] <= match_char3[k] + xnor_char3[k][16]; match_char4[k] <= match_char4[k] + xnor_char4[k][16]; match_char5[k] <= match_char5[k] + xnor_char5[k][16]; match_char6[k] <= match_char6[k] + xnor_char6[k][16]; match_char7[k] <= match_char7[k] + xnor_char7[k][16];end
//            10'd17:begin match_char3[k] <= match_char3[k] + xnor_char3[k][17]; match_char4[k] <= match_char4[k] + xnor_char4[k][17]; match_char5[k] <= match_char5[k] + xnor_char5[k][17]; match_char6[k] <= match_char6[k] + xnor_char6[k][17]; match_char7[k] <= match_char7[k] + xnor_char7[k][17];end
//            10'd18:begin match_char3[k] <= match_char3[k] + xnor_char3[k][18]; match_char4[k] <= match_char4[k] + xnor_char4[k][18]; match_char5[k] <= match_char5[k] + xnor_char5[k][18]; match_char6[k] <= match_char6[k] + xnor_char6[k][18]; match_char7[k] <= match_char7[k] + xnor_char7[k][18];end
//            10'd19:begin match_char3[k] <= match_char3[k] + xnor_char3[k][19]; match_char4[k] <= match_char4[k] + xnor_char4[k][19]; match_char5[k] <= match_char5[k] + xnor_char5[k][19]; match_char6[k] <= match_char6[k] + xnor_char6[k][19]; match_char7[k] <= match_char7[k] + xnor_char7[k][19];end
//            10'd20:begin match_char3[k] <= match_char3[k] + xnor_char3[k][20]; match_char4[k] <= match_char4[k] + xnor_char4[k][20]; match_char5[k] <= match_char5[k] + xnor_char5[k][20]; match_char6[k] <= match_char6[k] + xnor_char6[k][20]; match_char7[k] <= match_char7[k] + xnor_char7[k][20];end
//            10'd21:begin match_char3[k] <= match_char3[k] + xnor_char3[k][21]; match_char4[k] <= match_char4[k] + xnor_char4[k][21]; match_char5[k] <= match_char5[k] + xnor_char5[k][21]; match_char6[k] <= match_char6[k] + xnor_char6[k][21]; match_char7[k] <= match_char7[k] + xnor_char7[k][21];end
//            10'd22:begin match_char3[k] <= match_char3[k] + xnor_char3[k][22]; match_char4[k] <= match_char4[k] + xnor_char4[k][22]; match_char5[k] <= match_char5[k] + xnor_char5[k][22]; match_char6[k] <= match_char6[k] + xnor_char6[k][22]; match_char7[k] <= match_char7[k] + xnor_char7[k][22];end
//            10'd23:begin match_char3[k] <= match_char3[k] + xnor_char3[k][23]; match_char4[k] <= match_char4[k] + xnor_char4[k][23]; match_char5[k] <= match_char5[k] + xnor_char5[k][23]; match_char6[k] <= match_char6[k] + xnor_char6[k][23]; match_char7[k] <= match_char7[k] + xnor_char7[k][23];end
//            10'd24:begin match_char3[k] <= match_char3[k] + xnor_char3[k][24]; match_char4[k] <= match_char4[k] + xnor_char4[k][24]; match_char5[k] <= match_char5[k] + xnor_char5[k][24]; match_char6[k] <= match_char6[k] + xnor_char6[k][24]; match_char7[k] <= match_char7[k] + xnor_char7[k][24];end
//            10'd25:begin match_char3[k] <= match_char3[k] + xnor_char3[k][25]; match_char4[k] <= match_char4[k] + xnor_char4[k][25]; match_char5[k] <= match_char5[k] + xnor_char5[k][25]; match_char6[k] <= match_char6[k] + xnor_char6[k][25]; match_char7[k] <= match_char7[k] + xnor_char7[k][25];end
//            10'd26:begin match_char3[k] <= match_char3[k] + xnor_char3[k][26]; match_char4[k] <= match_char4[k] + xnor_char4[k][26]; match_char5[k] <= match_char5[k] + xnor_char5[k][26]; match_char6[k] <= match_char6[k] + xnor_char6[k][26]; match_char7[k] <= match_char7[k] + xnor_char7[k][26];end
//            10'd27:begin match_char3[k] <= match_char3[k] + xnor_char3[k][27]; match_char4[k] <= match_char4[k] + xnor_char4[k][27]; match_char5[k] <= match_char5[k] + xnor_char5[k][27]; match_char6[k] <= match_char6[k] + xnor_char6[k][27]; match_char7[k] <= match_char7[k] + xnor_char7[k][27];end
//            10'd28:begin match_char3[k] <= match_char3[k] + xnor_char3[k][28]; match_char4[k] <= match_char4[k] + xnor_char4[k][28]; match_char5[k] <= match_char5[k] + xnor_char5[k][28]; match_char6[k] <= match_char6[k] + xnor_char6[k][28]; match_char7[k] <= match_char7[k] + xnor_char7[k][28];end
//            10'd29:begin match_char3[k] <= match_char3[k] + xnor_char3[k][29]; match_char4[k] <= match_char4[k] + xnor_char4[k][29]; match_char5[k] <= match_char5[k] + xnor_char5[k][29]; match_char6[k] <= match_char6[k] + xnor_char6[k][29]; match_char7[k] <= match_char7[k] + xnor_char7[k][29];end
//            10'd30:begin match_char3[k] <= match_char3[k] + xnor_char3[k][30]; match_char4[k] <= match_char4[k] + xnor_char4[k][30]; match_char5[k] <= match_char5[k] + xnor_char5[k][30]; match_char6[k] <= match_char6[k] + xnor_char6[k][30]; match_char7[k] <= match_char7[k] + xnor_char7[k][30];end
//            10'd31:begin match_char3[k] <= match_char3[k] + xnor_char3[k][31]; match_char4[k] <= match_char4[k] + xnor_char4[k][31]; match_char5[k] <= match_char5[k] + xnor_char5[k][31]; match_char6[k] <= match_char6[k] + xnor_char6[k][31]; match_char7[k] <= match_char7[k] + xnor_char7[k][31];end
//            10'd32:begin match_char3[k] <= match_char3[k] + xnor_char3[k][32]; match_char4[k] <= match_char4[k] + xnor_char4[k][32]; match_char5[k] <= match_char5[k] + xnor_char5[k][32]; match_char6[k] <= match_char6[k] + xnor_char6[k][32]; match_char7[k] <= match_char7[k] + xnor_char7[k][32];end
//            10'd33:begin match_char3[k] <= match_char3[k] + xnor_char3[k][33]; match_char4[k] <= match_char4[k] + xnor_char4[k][33]; match_char5[k] <= match_char5[k] + xnor_char5[k][33]; match_char6[k] <= match_char6[k] + xnor_char6[k][33]; match_char7[k] <= match_char7[k] + xnor_char7[k][33];end
//            10'd34:begin match_char3[k] <= match_char3[k] + xnor_char3[k][34]; match_char4[k] <= match_char4[k] + xnor_char4[k][34]; match_char5[k] <= match_char5[k] + xnor_char5[k][34]; match_char6[k] <= match_char6[k] + xnor_char6[k][34]; match_char7[k] <= match_char7[k] + xnor_char7[k][34];end
//            10'd35:begin match_char3[k] <= match_char3[k] + xnor_char3[k][35]; match_char4[k] <= match_char4[k] + xnor_char4[k][35]; match_char5[k] <= match_char5[k] + xnor_char5[k][35]; match_char6[k] <= match_char6[k] + xnor_char6[k][35]; match_char7[k] <= match_char7[k] + xnor_char7[k][35];end
//            10'd36:begin match_char3[k] <= match_char3[k] + xnor_char3[k][36]; match_char4[k] <= match_char4[k] + xnor_char4[k][36]; match_char5[k] <= match_char5[k] + xnor_char5[k][36]; match_char6[k] <= match_char6[k] + xnor_char6[k][36]; match_char7[k] <= match_char7[k] + xnor_char7[k][36];end
//            10'd37:begin match_char3[k] <= match_char3[k] + xnor_char3[k][37]; match_char4[k] <= match_char4[k] + xnor_char4[k][37]; match_char5[k] <= match_char5[k] + xnor_char5[k][37]; match_char6[k] <= match_char6[k] + xnor_char6[k][37]; match_char7[k] <= match_char7[k] + xnor_char7[k][37];end
//            10'd38:begin match_char3[k] <= match_char3[k] + xnor_char3[k][38]; match_char4[k] <= match_char4[k] + xnor_char4[k][38]; match_char5[k] <= match_char5[k] + xnor_char5[k][38]; match_char6[k] <= match_char6[k] + xnor_char6[k][38]; match_char7[k] <= match_char7[k] + xnor_char7[k][38];end
//            10'd39:begin match_char3[k] <= match_char3[k] + xnor_char3[k][39]; match_char4[k] <= match_char4[k] + xnor_char4[k][39]; match_char5[k] <= match_char5[k] + xnor_char5[k][39]; match_char6[k] <= match_char6[k] + xnor_char6[k][39]; match_char7[k] <= match_char7[k] + xnor_char7[k][39];end
//            default:;
//        endcase
//    end
//end
//endgenerate


//找出上述求和结果中的最大值
reg [5:0] max_match_char1;//字符1的最大匹配值
reg [5:0] max_match_char2;//字符2的最大匹配值
reg [5:0] max_match_char3;//字符3的最大匹配值
reg [5:0] max_match_char4;//字符4的最大匹配值
reg [5:0] max_match_char5;//字符5的最大匹配值
reg [5:0] max_match_char6;//字符6的最大匹配值
reg [5:0] max_match_char7;//字符7的最大匹配值
reg [5:0] match_index_char1_t;//匹配后的字符1编号
reg [5:0] match_index_char2_t;//匹配后的字符2编号
reg [5:0] match_index_char3_t;//匹配后的字符3编号
reg [5:0] match_index_char4_t;//匹配后的字符4编号
reg [5:0] match_index_char5_t;//匹配后的字符5编号
reg [5:0] match_index_char6_t;//匹配后的字符6编号
reg [5:0] match_index_char7_t;//匹配后的字符7编号

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
    max_match_char1 <= 6'd0;
    max_match_char2 <= 6'd0;
    max_match_char3 <= 6'd0;
    max_match_char4 <= 6'd0;
    max_match_char5 <= 6'd0;
    max_match_char6 <= 6'd0;
    max_match_char7 <= 6'd0;
    match_index_char1_t <= 6'd0;
    match_index_char2_t <= 6'd0;
    match_index_char3_t <= 6'd0;
    match_index_char4_t <= 6'd0;
    match_index_char5_t <= 6'd0;
    match_index_char6_t <= 6'd0;
    match_index_char7_t <= 6'd0;
end
else if(vsyncr_neg_flag || (y_cnt <= plate_boarder_down))begin
    max_match_char1 <= 6'd0;
    max_match_char2 <= 6'd0;
    max_match_char3 <= 6'd0;
    max_match_char4 <= 6'd0;
    max_match_char5 <= 6'd0;
    max_match_char6 <= 6'd0;
    max_match_char7 <= 6'd0;
    match_index_char1_t <= 6'd0;
    match_index_char2_t <= 6'd0;
    match_index_char3_t <= 6'd0;
    match_index_char4_t <= 6'd0;
    match_index_char5_t <= 6'd0;
    match_index_char6_t <= 6'd0;
    match_index_char7_t <= 6'd0;
end
else if(y_cnt <= plate_boarder_down+2)begin
    if(match_char1[x_cnt%2][39] >max_match_char1)begin
        max_match_char1 <= match_char1[x_cnt%2][39];
        match_index_char1_t <= x_cnt%2;
    end
    if(match_char2[x_cnt%7][39] >max_match_char2)begin
        max_match_char2 <= match_char2[x_cnt%7][39];
        match_index_char2_t <= x_cnt%7;
    end
    if(match_char3[x_cnt%11][39] >max_match_char3)begin
        max_match_char3 <= match_char3[x_cnt%11][39];
        match_index_char3_t <= x_cnt%11;
    end
    if(match_char4[x_cnt%11][39] >max_match_char4)begin
        max_match_char4 <= match_char4[x_cnt%11][39];
        match_index_char4_t <= x_cnt%11;
    end
    if(match_char5[x_cnt%11][39] >max_match_char5)begin
        max_match_char5 <= match_char5[x_cnt%11][39];
        match_index_char5_t <= x_cnt%11;
    end
    if(match_char6[x_cnt%11][39] >max_match_char6)begin
        max_match_char6 <= match_char6[x_cnt%11][39];
        match_index_char6_t <= x_cnt%11;
    end
    if(match_char7[x_cnt%11][39] >max_match_char7)begin
        max_match_char7 <= match_char7[x_cnt%11][39];
        match_index_char7_t <= x_cnt%11;
    end
end
//else if(y_cnt==plate_boarder_down+2 && x_cnt>=10'd60)begin
//    if(match_char1[x_cnt%NUM_EIGEN_CHAR1] > max_match_char1)begin
//        max_match_char1 <= match_char1[x_cnt%NUM_EIGEN_CHAR1];
//        match_index_char1_t <= x_cnt%NUM_EIGEN_CHAR1;
//    end
//    if(match_char2[x_cnt%NUM_EIGEN_CHAR2_char] > max_match_char2)begin
//        max_match_char2 <= match_char2[x_cnt%NUM_EIGEN_CHAR2_char];
//        match_index_char2_t <= x_cnt%NUM_EIGEN_CHAR2_char;
//    end
//    if(match_char3[x_cnt%NUM_EIGEN_CHAR2] > max_match_char3)begin
//        max_match_char3 <= match_char3[x_cnt%NUM_EIGEN_CHAR2];
//        match_index_char3_t <= x_cnt%NUM_EIGEN_CHAR2;
//    end
//    if(match_char4[x_cnt%NUM_EIGEN_CHAR2] > max_match_char4)begin
//        max_match_char4 <= match_char4[x_cnt%NUM_EIGEN_CHAR2];
//        match_index_char4_t <= x_cnt%NUM_EIGEN_CHAR2;
//    end
//    if(match_char5[x_cnt%NUM_EIGEN_CHAR2] > max_match_char5)begin
//        max_match_char5 <= match_char5[x_cnt%NUM_EIGEN_CHAR2];
//        match_index_char5_t <= x_cnt%NUM_EIGEN_CHAR2;
//    end
//    if(match_char6[x_cnt%NUM_EIGEN_CHAR2] > max_match_char6)begin
//        max_match_char6 <= match_char6[x_cnt%NUM_EIGEN_CHAR2];
//        match_index_char6_t <= x_cnt%NUM_EIGEN_CHAR2;
//    end
//    if(match_char7[x_cnt%NUM_EIGEN_CHAR2] > max_match_char7)begin
//        max_match_char7 <= match_char7[x_cnt%NUM_EIGEN_CHAR2];
//        match_index_char7_t <= x_cnt%NUM_EIGEN_CHAR2;
//    end
//end

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
    match_index_char1 <= 6'd0;
    match_index_char2 <= 6'd0;
    match_index_char3 <= 6'd0;
    match_index_char4 <= 6'd0;
    match_index_char5 <= 6'd0;
    match_index_char6 <= 6'd0;
    match_index_char7 <= 6'd0;
end
else if(y_cnt == plate_boarder_down+3)begin
    match_index_char1 <= match_index_char1_t;
    match_index_char2 <= match_index_char2_t + 4;//因为第二个字符一定是字母
    match_index_char3 <= match_index_char3_t;
    match_index_char4 <= match_index_char4_t;
    match_index_char5 <= match_index_char5_t;
    match_index_char6 <= match_index_char6_t;
    match_index_char7 <= match_index_char7_t;
end


endmodule
