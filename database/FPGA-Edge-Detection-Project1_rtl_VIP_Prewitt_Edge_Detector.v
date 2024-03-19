//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          VIP_Prewitt_Edge_Detector
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        VIP_Prewitt_Edge_Detector prewitt算子
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//
module VIP_Prewitt_Edge_Detector
    (
    input   clk,    //cmos 像素时钟
    input   rst_n,  
    //预处理数据
    input       per_frame_vsync, 
    input       per_frame_href,  
    input       per_frame_clken, 
    input [7:0] per_img_Y,  
    input [7:0]Sobel_Threshold,    
    //处理后的数据
    output      post_frame_vsync, 
    output      post_frame_href,  
    output      post_frame_clken, 
    output      post_img_Bit    
);
//reg define 
reg [9:0]  Gx_temp2; //第三列值
reg [9:0]  Gx_temp1; //第一列值
reg [9:0]  Gx_data;  //x方向的偏导数
reg [9:0]  Gy_temp1; //第一行值
reg [9:0]  Gy_temp2; //第三行值
reg [9:0]  Gy_data;  //y方向的偏导数
reg [20:0] Gxy_square;
reg [4:0]  per_frame_vsync_r;
reg [4:0]  per_frame_href_r; 
reg [4:0]  per_frame_clken_r;

//wire define 
wire        matrix_frame_vsync; 
wire        matrix_frame_href;  
wire        matrix_frame_clken; 
wire [10:0] Dim;
//输出3X3 矩阵
wire [7:0]  matrix_p11; 
wire [7:0]  matrix_p12; 
wire [7:0]  matrix_p13; 
wire [7:0]  matrix_p21; 
wire [7:0]  matrix_p22; 
wire [7:0]  matrix_p23;
wire [7:0]  matrix_p31; 
wire [7:0]  matrix_p32; 
wire [7:0]  matrix_p33;

assign post_frame_vsync = per_frame_vsync_r[4];
assign post_frame_href  = per_frame_href_r[4] ;
assign post_frame_clken = per_frame_clken_r[4];
assign post_img_Bit     = post_frame_href ? post_img_Bit_r : 1'b0;

//3x3矩阵
VIP_Matrix_Generate_3X3_8Bit u_VIP_Matrix_Generate_3X3_8Bit_Prewitt(
    .clk  (clk),    
    .rst_n  (rst_n),
    //预处理数据
    .per_frame_vsync (per_frame_vsync), 
    .per_frame_href  (per_frame_href),  
    .per_frame_clken (per_frame_clken), 
    .per_img_Y       (per_img_Y),       
    
    //处理后的数据
    .matrix_frame_vsync (matrix_frame_vsync), 
    .matrix_frame_href  (matrix_frame_href),  
    .matrix_frame_clken (matrix_frame_clken), 
    .matrix_p11         (matrix_p11), 
    .matrix_p12         (matrix_p12), 
    .matrix_p13         (matrix_p13), //输出 3X3 矩阵
    .matrix_p21         (matrix_p21), 
    .matrix_p22         (matrix_p22),  
    .matrix_p23         (matrix_p23),
    .matrix_p31         (matrix_p31), 
    .matrix_p32         (matrix_p32),  
    .matrix_p33         (matrix_p33)
);

//Sobel 算子
//         Gx                  Gy                  像素点
// [   -1  0   +1  ]   [   -1  -1   -1 ]     [   P11  P12   P13 ]
// [   -1  0   +1  ]   [   0   0    0  ]     [   P21  P22   P23 ]
// [   -1  0   +1  ]   [   +1  +1   +1 ]     [   P31  P32   P33 ]

//Step 1 计算x方向的偏导数
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        Gy_temp1 <= 10'd0;
        Gy_temp2 <= 10'd0;
        Gy_data <=  10'd0;
    end
    else begin
        Gy_temp1 <= matrix_p13 + (matrix_p23  ) + matrix_p33; 
        Gy_temp2 <= matrix_p11 + (matrix_p21 ) + matrix_p31; 
        Gy_data <= (Gy_temp1 >= Gy_temp2) ? Gy_temp1 - Gy_temp2 : 
                   (Gy_temp2 - Gy_temp1);
    end
end

//Step 2 计算y方向的偏导数
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        Gx_temp1 <= 10'd0;
        Gx_temp2 <= 10'd0;
        Gx_data <=  10'd0;
    end
    else begin
        Gx_temp1 <= matrix_p11 + (matrix_p12 ) + matrix_p13; 
        Gx_temp2 <= matrix_p31 + (matrix_p32 ) + matrix_p33; 
        Gx_data <= (Gx_temp2 >= Gx_temp1) ? Gx_temp2 - Gx_temp1 : 
                   (Gx_temp1 - Gx_temp2);
    end
end

//Step 3 计算平方和
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        Gxy_square <= 21'd0;
    else
        Gxy_square <= Gx_data * Gx_data + Gy_data * Gy_data;
end

//Step 4 开平方（梯度向量的大小）
SQRT  u_SQRT_Prewitt
(
    .radical   (Gxy_square),
    .q         (Dim),
    .remainder ()
);

//Step 5 将开平方后的数据与预设阈值比较
reg post_img_Bit_r;
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        post_img_Bit_r <= 1'b0; //初始值
    else if(Dim >= Sobel_Threshold)
        post_img_Bit_r <= 1'b1; //检测到边缘1
    else
    post_img_Bit_r <= 1'b0; //不是边缘 0
end

//延迟5个周期同步
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        per_frame_vsync_r <= 0;
        per_frame_href_r <= 0;
        per_frame_clken_r <= 0;
    end
    else begin
        per_frame_vsync_r  <=  {per_frame_vsync_r[3:0],matrix_frame_vsync};
        per_frame_href_r  <=  {per_frame_href_r[3:0],matrix_frame_href};
        per_frame_clken_r  <=  {per_frame_clken_r[3:0],matrix_frame_clken};
    end
end

endmodule 