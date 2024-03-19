//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          VIP_Gray_Median_Filter
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        中值滤波
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//
module VIP_Gray_Median_Filter(
    //时钟
    input       clk,  //50MHz
    input       rst_n,
    
    //预处理图像数据
    input       pe_frame_vsync,  //预图像数据列有效信号  
    input       pe_frame_href,   //预图像数据行有效信号  
    input       pe_frame_clken,  //预图像数据输入使能效信号
    input [7:0] pe_img_Y,        //灰度数据             
    
    //处理后的图像数据
    output       pos_frame_vsync, //处理后的图像数据列有效信号   
    output       pos_frame_href,  //处理后的图像数据行有效信号   
    output       pos_frame_clken, //处理后的图像数据输出使能效信号
    output [7:0] pos_img_Y        //处理后的灰度数据           
);


//wire define
wire        matrix_frame_vsync;
wire        matrix_frame_href;
wire        matrix_frame_clken;
wire [7:0]  matrix_p11; //3X3 阵列输出
wire [7:0]  matrix_p12; 
wire [7:0]  matrix_p13;
wire [7:0]  matrix_p21; 
wire [7:0]  matrix_p22; 
wire [7:0]  matrix_p23;
wire [7:0]  matrix_p31; 
wire [7:0]  matrix_p32; 
wire [7:0]  matrix_p33;

//*****************************************************
//**                    main code
//*****************************************************

assign pos_img_Y = pos_frame_href ? mid_value : 8'd0;

VIP_Matrix_Generate_3X3_8Bit u_VIP_Matrix_Generate_3X3_8Bit_median(
    .clk        (clk), 
    .rst_n      (rst_n),
    
    //预处理图像数据
    .per_frame_vsync    (pe_frame_vsync),
    .per_frame_href     (pe_frame_href), 
    .per_frame_clken    (pe_frame_clken),
    .per_img_Y          (pe_img_Y),
    
    //处理后的图像数据
    .matrix_frame_vsync (matrix_frame_vsync),
    .matrix_frame_href  (matrix_frame_href),
    .matrix_frame_clken (matrix_frame_clken),
    .matrix_p11         (matrix_p11),    
    .matrix_p12         (matrix_p12),    
    .matrix_p13         (matrix_p13),
    .matrix_p21         (matrix_p21),    
    .matrix_p22         (matrix_p22),    
    .matrix_p23         (matrix_p23),
    .matrix_p31         (matrix_p31),    
    .matrix_p32         (matrix_p32),    
    .matrix_p33         (matrix_p33)
);

//3x3阵列的中值滤波，需要3个时钟
wire    [7:0]   mid_value;
Median_Filter_3X3 u_Median_Filter_3X3_8Bit_median(
    .clk        (clk),
    .rst_n      (rst_n),
    
    .median_frame_vsync (matrix_frame_vsync),
    .median_frame_href  (matrix_frame_href),
    .median_frame_clken (matrix_frame_clken),
    
    //第一行
    .data11           (matrix_p11), 
    .data12           (matrix_p12), 
    .data13           (matrix_p13),
    //第二行              
    .data21           (matrix_p21), 
    .data22           (matrix_p22), 
    .data23           (matrix_p23),
    //第三行              
    .data31           (matrix_p31), 
    .data32           (matrix_p32), 
    .data33           (matrix_p33),
    
    .pos_median_vsync (pos_frame_vsync),
    .pos_median_href  (pos_frame_href),
    .pos_median_clken (pos_frame_clken),
    .target_data      (mid_value)
);

endmodule 