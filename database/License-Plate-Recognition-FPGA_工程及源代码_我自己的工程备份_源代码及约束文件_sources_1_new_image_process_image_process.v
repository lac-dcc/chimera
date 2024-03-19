//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           vip
// Last modified Date:  2019/03/22 16:33:40
// Last Version:        V1.0
// Descriptions:        数字图像处理模块封装层
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2019/03/22 16:33:56
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module image_process(
    //module clock
    input           clk            ,   // 时钟信号
    input           rst_n          ,   // 复位信号（低有效）

    //图像处理前的数据接口
    input           pre_frame_vsync,
    input           pre_frame_hsync,
    input           pre_frame_de   ,
    input    [15:0] pre_rgb        ,
    input    [10:0] xpos           ,
    input    [10:0] ypos           ,

    //图像处理后的数据接口
    output          post_frame_vsync,  // 场同步信号
    output          post_frame_hsync,  // 行同步信号
    output          post_frame_de   ,  // 数据输入使能
    output   [15:0] post_rgb           // RGB565颜色数据
);

//wire define
//-----------------第一部分-----------------
//RGB转YCbCr
wire                  ycbcr_vsync;
wire                  ycbcr_hsync;
wire                  ycbcr_de   ;
wire   [ 7:0]         img_y      ;
wire   [ 7:0]         img_cb     ;
wire   [ 7:0]         img_cr     ;
//二值化
wire                  binarization_vsync;
wire                  binarization_hsync;
wire                  binarization_de   ;
wire                  binarization_bit  ;
//腐蚀
wire                  erosion_vsync;
wire                  erosion_hsync;
wire                  erosion_de   ;
wire                  erosion_bit  ;
//中值滤波1
wire                  median1_vsync;
wire                  median1_hsync;
wire                  median1_de   ;
wire                  median1_bit  ;
//Sobel边缘检测
wire                  sobel_vsync;
wire                  sobel_hsync;
wire                  sobel_de   ;
wire                  sobel_bit  ;
//中值滤波2
wire                  median2_vsync;
wire                  median2_hsync;
wire                  median2_de   ;
wire                  median2_bit  ;
//膨胀
wire                  dilation_vsync;
wire                  dilation_hsync;
wire                  dilation_de   ;
wire                  dilation_bit  ;
//投影
wire                  projection_vsync;
wire                  projection_hsync;
wire                  projection_de   ;
wire                  projection_bit  ;
wire [9:0] max_line_up  ;//水平投影结果
wire [9:0] max_line_down;
wire [9:0] max_line_left ;//垂直投影结果
wire [9:0] max_line_right;
//调整车牌的宽高
wire [9:0] plate_boarder_up   ;
wire [9:0] plate_boarder_down ;
wire [9:0] plate_boarder_left ;
wire [9:0] plate_boarder_right;
wire       plate_exist_flag   ;
//-----------------第二部分-----------------
//字符二值化
wire                  char_bin_vsync;
wire                  char_bin_hsync;
wire                  char_bin_de   ;
wire                  char_bin_bit  ;
//腐蚀
wire                  char_ero_vsync;
wire                  char_ero_hsync;
wire                  char_ero_de   ;
wire                  char_ero_bit  ;
//膨胀
wire                  char_dila_vsync;
wire                  char_dila_hsync;
wire                  char_dila_de   ;
wire                  char_dila_bit  ;
//投影
wire char_proj_vsync;
wire char_proj_hsync;
wire char_proj_de   ;
wire char_proj_bit  ;
wire [9:0] char_line_up  ;//水平投影结果
wire [9:0] char_line_down;
wire [9:0] char1_line_left ;//垂直投影结果
wire [9:0] char1_line_right;
wire [9:0] char2_line_left ;
wire [9:0] char2_line_right;
wire [9:0] char3_line_left ;
wire [9:0] char3_line_right;
wire [9:0] char4_line_left ;
wire [9:0] char4_line_right;
wire [9:0] char5_line_left ;
wire [9:0] char5_line_right;
wire [9:0] char6_line_left ;
wire [9:0] char6_line_right;
wire [9:0] char7_line_left ;
wire [9:0] char7_line_right;

//-----------------第三部分-----------------
//计算特征值
wire [39:0] char1_eigenvalue;
wire [39:0] char2_eigenvalue;
wire [39:0] char3_eigenvalue;
wire [39:0] char4_eigenvalue;
wire [39:0] char5_eigenvalue;
wire [39:0] char6_eigenvalue;
wire [39:0] char7_eigenvalue;
wire        cal_eigen_vsync;
wire        cal_eigen_hsync;
wire        cal_eigen_de   ;
wire        cal_eigen_bit  ;
//模板匹配
wire        template_vsync;
wire        template_hsync;
wire        template_de   ;
wire        template_bit  ;
wire [5:0]  match_index_char1;
wire [5:0]  match_index_char2;
wire [5:0]  match_index_char3;
wire [5:0]  match_index_char4;
wire [5:0]  match_index_char5;
wire [5:0]  match_index_char6;
wire [5:0]  match_index_char7;
//添加边框
wire           add_grid_vsync;
wire           add_grid_href ;
wire           add_grid_de   ;
wire   [15:0]  add_grid_rgb  ;
//最终结果
wire           post_frame_vsync;
wire           post_frame_href ;
wire           post_frame_de   ;
wire   [15:0]  post_rgb;
//*****************************************************
//**                    main code
//*****************************************************

//---------------------------第一部分-----------------------------
//第一部分根据蓝色，识别画面中的车牌区域，并输出边界。
//依次进行：
//  1.1 RGB转YCbCr
//  1.2 二值化
//  1.3 腐蚀
//  1.4 Sobel边缘检测
//  1.5 膨胀
//  1.6 水平投影&垂直投影-->输出车牌边界

//RGB转YCbCr模块
rgb2ycbcr u1_rgb2ycbcr(
    //module clock
    .clk             (clk    ),            // 时钟信号
    .rst_n           (rst_n  ),            // 复位信号（低有效）
    //图像处理前的数据接口
    .pre_frame_vsync (pre_frame_vsync),    // vsync信号
    .pre_frame_hsync (pre_frame_hsync),    // href信号
    .pre_frame_de    (pre_frame_de   ),    // data enable信号
    .img_red         (pre_rgb[15:11] ),
    .img_green       (pre_rgb[10:5 ] ),
    .img_blue        (pre_rgb[ 4:0 ] ),
    //图像处理后的数据接口
    .post_frame_vsync(ycbcr_vsync),   // vsync信号
    .post_frame_hsync(ycbcr_hsync),   // href信号
    .post_frame_de   (ycbcr_de   ),   // data enable信号
    .img_y           (img_y ),
    .img_cb          (img_cb),
    .img_cr          (img_cr)
);

//二值化
binarization u1_binarization(
    .clk     (clk    ),   // 时钟信号
    .rst_n   (rst_n  ),   // 复位信号（低有效）

	.per_frame_vsync   (ycbcr_vsync),
	.per_frame_href    (ycbcr_hsync),	
	.per_frame_clken   (ycbcr_de   ),
	.per_img_Y         (img_cb     ),		

	.post_frame_vsync  (binarization_vsync),	
	.post_frame_href   (binarization_hsync),	
	.post_frame_clken  (binarization_de   ),	
	.post_img_Bit      (binarization_bit  ),		

	.Binary_Threshold  (8'd150)//这个阈值的设置非常重要
);

//腐蚀
VIP_Bit_Erosion_Detector # (
    .IMG_HDISP (10'd640),    //640*480
    .IMG_VDISP (10'd480)
)u1_VIP_Bit_Erosion_Detector(
    //Global Clock
    .clk     (clk    ),   //cmos video pixel clock
    .rst_n   (rst_n  ),   //global reset

    //Image data prepred to be processd
    .per_frame_vsync   (binarization_vsync), //Prepared Image data vsync valid signal
    .per_frame_href    (binarization_hsync), //Prepared Image data href vaild  signal
    .per_frame_clken   (binarization_de   ), //Prepared Image data output/capture enable clock
    .per_img_Bit       (binarization_bit  ), //Prepared Image Bit flag outout(1: Value, 0:inValid)
    
    //Image data has been processd
    .post_frame_vsync  (erosion_vsync),    //Processed Image data vsync valid signal
    .post_frame_href   (erosion_hsync),    //Processed Image data href vaild  signal
    .post_frame_clken  (erosion_de   ),    //Processed Image data output/capture enable clock
    .post_img_Bit      (erosion_bit  )     //Processed Image Bit flag outout(1: Value, 0:inValid)
);

////中值滤波去除噪点
//VIP_Gray_Median_Filter # (
//	.IMG_HDISP(10'd640),	//640*480
//	.IMG_VDISP(10'd480)
//)u1_Gray_Median_Filter(
//	//global clock
//	.clk   (clk    ),  				//100MHz
//	.rst_n (rst_n  ),				//global reset

//	//Image data prepred to be processd
//	.per_frame_vsync   (erosion_vsync   ),	//Prepared Image data vsync valid signal
//	.per_frame_href    (erosion_hsync   ),	//Prepared Image data href vaild  signal
//	.per_frame_clken   (erosion_de      ),	//Prepared Image data output/capture enable clock
//	.per_img_Y         ({8{erosion_bit}}),	//Prepared Image brightness input
	
//	//Image data has been processd
//	.post_frame_vsync  (median1_vsync),	//Processed Image data vsync valid signal
//	.post_frame_href   (median1_hsync),	//Processed Image data href vaild  signal
//	.post_frame_clken  (median1_de   ),	//Processed Image data output/capture enable clock
//	.post_img_Y	   	   (median1_bit  )	//Processed Image brightness input
//);

//Sobel边缘检测
Sobel_Edge_Detector #(
    .SOBEL_THRESHOLD   (8'd128) //Sobel 阈值
) u1_Sobel_Edge_Detector (
    //global clock
    .clk               (clk    ),              //cmos video pixel clock
    .rst_n             (rst_n  ),                //global reset
    //Image data prepred to be processd
    .per_frame_vsync  (erosion_vsync   ),    //Prepared Image data vsync valid signal
    .per_frame_href   (erosion_hsync   ),    //Prepared Image data href vaild  signal
    .per_frame_clken  (erosion_de      ),    //Prepared Image data output/capture enable clock
    .per_img_y        ({8{erosion_bit}}),    //Prepared Image brightness input  
    //Image data has been processd
    .post_frame_vsync (sobel_vsync),    //Processed Image data vsync valid signal
    .post_frame_href  (sobel_hsync),    //Processed Image data href vaild  signal
    .post_frame_clken (sobel_de   ),    //Processed Image data output/capture enable clock
    .post_img_bit     (sobel_bit  )     //Processed Image Bit flag outout(1: Value, 0 inValid)
);

//////中值滤波去除噪点
////VIP_Gray_Median_Filter # (
////	.IMG_HDISP(10'd640),	//640*480
////	.IMG_VDISP(10'd480)
////)u2_Gray_Median_Filter(
////	//global clock
////	.clk   (clk    ),  				//100MHz
////	.rst_n (rst_n  ),				//global reset

////	//Image data prepred to be processd
////	.per_frame_vsync   (sobel_vsync   ),	//Prepared Image data vsync valid signal
////	.per_frame_href    (sobel_hsync   ),	//Prepared Image data href vaild  signal
////	.per_frame_clken   (sobel_de      ),	//Prepared Image data output/capture enable clock
////	.per_img_Y         ({8{sobel_bit}}),	//Prepared Image brightness input
	
////	//Image data has been processd
////	.post_frame_vsync  (post_frame_vsync),	//Processed Image data vsync valid signal
////	.post_frame_href   (post_frame_hsync),	//Processed Image data href vaild  signal
////	.post_frame_clken  (post_frame_de   ),	//Processed Image data output/capture enable clock
////	.post_img_Y	   	   (post_img_bit    )	//Processed Image brightness input
////);

//膨胀
VIP_Bit_Dilation_Detector#(
	.IMG_HDISP(10'd640),	//640*480
	.IMG_VDISP(10'd480)
)u1_VIP_Bit_Dilation_Detector(
	//global clock
	.clk   (clk    ),  				//cmos video pixel clock
	.rst_n (rst_n  ),				//global reset

	//Image data prepred to be processd
	.per_frame_vsync   (sobel_vsync   ),	//Prepared Image data vsync valid signal
	.per_frame_href    (sobel_hsync   ),	//Prepared Image data href vaild  signal
	.per_frame_clken   (sobel_de      ),	//Prepared Image data output/capture enable clock
	.per_img_Bit       (sobel_bit     ),	//Prepared Image Bit flag outout(1: Value, 0:inValid)
	
	//Image data has been processd
	.post_frame_vsync  (dilation_vsync),	//Processed Image data vsync valid signal
	.post_frame_href   (dilation_hsync),	//Processed Image data href vaild  signal
	.post_frame_clken  (dilation_de   ),	//Processed Image data output/capture enable clock
	.post_img_Bit  	   (dilation_bit  )   //Processed Image Bit flag outout(1: Value, 0:inValid)
);

//水平投影
VIP_horizon_projection # (
	.IMG_HDISP(10'd640),	//640*480
	.IMG_VDISP(10'd480)
)u1_VIP_horizon_projection(
	//global clock
	.clk   (clk    ),  				//cmos video pixel clock
	.rst_n (rst_n  ),				//global reset

	//Image data prepred to be processd
	.per_frame_vsync   (dilation_vsync),//Prepared Image data vsync valid signal
	.per_frame_href    (dilation_hsync),//Prepared Image data href vaild  signal
	.per_frame_clken   (dilation_de   ),//Prepared Image data output/capture enable clock
	.per_img_Bit       (dilation_bit  ),//Prepared Image Bit flag outout(1: Value, 0:inValid)
	
	//Image data has been processd
	.post_frame_vsync  (projection_vsync),//Processed Image data vsync valid signal
	.post_frame_href   (projection_hsync),//Processed Image data href vaild  signal
	.post_frame_clken  (projection_de   ),//Processed Image data output/capture enable clock
	.post_img_Bit      (projection_bit  ),//Processed Image Bit flag outout(1: Value, 0:inValid)

    .max_line_up  (max_line_up  ),//边沿坐标
    .max_line_down(max_line_down),
	
    .horizon_start  (10'd10 ),//投影起始列
    .horizon_end    (10'd630) //投影结束列  
);

//垂直投影
VIP_vertical_projection # (
	.IMG_HDISP(10'd640),	//640*480
	.IMG_VDISP(10'd480)
)u1_VIP_vertical_projection(
	//global clock
	.clk   (clk    ),//cmos video pixel clock
	.rst_n (rst_n  ),//global reset

	//Image data prepred to be processd
	.per_frame_vsync   (dilation_vsync),//Prepared Image data vsync valid signal
	.per_frame_href    (dilation_hsync),//Prepared Image data href vaild  signal
	.per_frame_clken   (dilation_de   ),//Prepared Image data output/capture enable clock
	.per_img_Bit       (dilation_bit  ),//Prepared Image Bit flag outout(1: Value, 0:inValid)
	
	//Image data has been processd
	.post_frame_vsync  (),//Processed Image data vsync valid signal
	.post_frame_href   (),//Processed Image data href vaild  signal
	.post_frame_clken  (),//Processed Image data output/capture enable clock
	.post_img_Bit      (),//Processed Image Bit flag outout(1: Value, 0:inValid)

    .max_line_left (max_line_left ),		//边沿坐标
    .max_line_right(max_line_right),
	
    .vertical_start(10'd10 ),//投影起始行
    .vertical_end  (10'd470) //投影结束行	     
);

////调整车牌的边框，调整后仅包含字符
//plate_boarder_adjust u_plate_boarder_adjust(
//    //global clock
//    .clk   (clk    ),                  
//    .rst_n (rst_n  ),                

//    .per_frame_vsync (post_frame_vsync),    

//    .max_line_up     (max_line_up   ), //输入的车牌候选区域
//    .max_line_down   (max_line_down ),
//    .max_line_left   (max_line_left ),     
//    .max_line_right  (max_line_right),
    
//    .plate_boarder_up     (plate_boarder_up   ), //调整后的边框
//    .plate_boarder_down   (plate_boarder_down ), 
//    .plate_boarder_left   (plate_boarder_left ),
//    .plate_boarder_right  (plate_boarder_right),
//    .plate_exist_flag     (plate_exist_flag   )  //根据输入的边框宽高比，判断是否存在车牌    
//);
//----------------------------------------------------------------


//---------------------------第二部分-----------------------------
//第二部分利用第一部分提取的车牌边界，提取边界内每个字符的区域。
//依次进行：
//  2.1 二值化
//  2.2 腐蚀
//  2.3 膨胀
//  2.4 水平投影&垂直投影-->输出所有字符的边界

//2.1 在车牌边界内，对RGB中的R进行二值化，车牌边界外不关心
char_binarization # (
    .BIN_THRESHOLD   (8'd160    ) //二值化阈值
)u2_char_binarization(
    .clk             (clk       ),   // 时钟信号
    .rst_n           (rst_n     ),   // 复位信号（低有效）
    //输入视频流
	.per_frame_vsync(pre_frame_vsync),
	.per_frame_href (pre_frame_hsync),	
	.per_frame_clken(pre_frame_de   ),
	.per_frame_Red  ({pre_rgb[15:11],3'b111} ),
    //车牌边界
    .plate_boarder_up 	 (max_line_up   +10'd10),//输入的车牌候选区域
    .plate_boarder_down  (max_line_down -10'd10),
    .plate_boarder_left  (max_line_left +10'd10),   
    .plate_boarder_right (max_line_right-10'd10),
    .plate_exist_flag    (1'b1   ),
    //输出视频流
	.post_frame_vsync(char_bin_vsync),	
	.post_frame_href (char_bin_hsync),	
	.post_frame_clken(char_bin_de   ),	
	.post_frame_Bit  (char_bin_bit  )
);

//2.2 腐蚀
VIP_Bit_Erosion_Detector # (
    .IMG_HDISP (10'd640),    //640*480
    .IMG_VDISP (10'd480)
)u2_VIP_Bit_Erosion_Detector(
    //Global Clock
    .clk     (clk    ),   //cmos video pixel clock
    .rst_n   (rst_n  ),   //global reset

    //Image data prepred to be processd
    .per_frame_vsync   (char_bin_vsync), //Prepared Image data vsync valid signal
    .per_frame_href    (char_bin_hsync), //Prepared Image data href vaild  signal
    .per_frame_clken   (char_bin_de   ), //Prepared Image data output/capture enable clock
    .per_img_Bit       (char_bin_bit  ), //Prepared Image Bit flag outout(1: Value, 0:inValid)
    
    //Image data has been processd
    .post_frame_vsync  (char_ero_vsync),    //Processed Image data vsync valid signal
    .post_frame_href   (char_ero_hsync),    //Processed Image data href vaild  signal
    .post_frame_clken  (char_ero_de   ),    //Processed Image data output/capture enable clock
    .post_img_Bit      (char_ero_bit  )     //Processed Image Bit flag outout(1: Value, 0:inValid)
);

//2.3 膨胀
VIP_Bit_Dilation_Detector#(
	.IMG_HDISP(10'd640),	//640*480
	.IMG_VDISP(10'd480)
)u2_VIP_Bit_Dilation_Detector(
	//global clock
	.clk   (clk    ),  				//cmos video pixel clock
	.rst_n (rst_n  ),				//global reset

	//Image data prepred to be processd
	.per_frame_vsync   (char_ero_vsync ),	//Prepared Image data vsync valid signal
	.per_frame_href    (char_ero_hsync ),	//Prepared Image data href vaild  signal
	.per_frame_clken   (char_ero_de    ),	//Prepared Image data output/capture enable clock
	.per_img_Bit       (char_ero_bit   ),	//Prepared Image Bit flag outout(1: Value, 0:inValid)
	
	//Image data has been processd
	.post_frame_vsync  (char_dila_vsync),	//Processed Image data vsync valid signal
	.post_frame_href   (char_dila_hsync),	//Processed Image data href vaild  signal
	.post_frame_clken  (char_dila_de   ),	//Processed Image data output/capture enable clock
	.post_img_Bit  	   (char_dila_bit  )   //Processed Image Bit flag outout(1: Value, 0:inValid)
);


//2.4.1 字符区域的水平投影
char_horizon_projection # (
	.IMG_HDISP(10'd640),	//640*480
	.IMG_VDISP(10'd480)
)u2_char_horizon_projection(
	//global clock
	.clk   (clk         ),  			//cmos video pixel clock
	.rst_n (rst_n       ),				//global reset

	//Image data prepred to be processd
	.per_frame_vsync   (char_dila_vsync),//Prepared Image data vsync valid signal
	.per_frame_href    (char_dila_hsync),//Prepared Image data href vaild  signal
	.per_frame_clken   (char_dila_de   ),//Prepared Image data output/capture enable clock
	.per_img_Bit       (char_dila_bit  ),//Prepared Image Bit flag outout(1: Value, 0:inValid)
	
	//Image data has been processd
	.post_frame_vsync  (char_proj_vsync),//Processed Image data vsync valid signal
	.post_frame_href   (char_proj_hsync),//Processed Image data href vaild  signal
	.post_frame_clken  (char_proj_de   ),//Processed Image data output/capture enable clock
	.post_img_Bit      (char_proj_bit   ),//Processed Image Bit flag outout(1: Value, 0:inValid)

    .max_line_up    (char_line_up  ),//边沿坐标
    .max_line_down  (char_line_down),
	
    .horizon_start  (10'd10 ),//投影起始列
    .horizon_end    (10'd630) //投影结束列  
);


//2.4.2 字符区域的垂直投影
char_vertical_projection # (
	.IMG_HDISP(10'd640),	//640*480
	.IMG_VDISP(10'd480)
)u2_char_vertical_projection(
	//global clock
	.clk   (clk    ),//cmos video pixel clock
	.rst_n (rst_n  ),//global reset
	//Image data prepred to be processd
	.per_frame_vsync   (char_dila_vsync),//Prepared Image data vsync valid signal
	.per_frame_href    (char_dila_hsync),//Prepared Image data href vaild  signal
	.per_frame_clken   (char_dila_de   ),//Prepared Image data output/capture enable clock
	.per_img_Bit       (char_dila_bit  ),//Prepared Image Bit flag outout(1: Value, 0:inValid)
	//边沿检测范围
	.vertical_start  (10'd10 ),//投影起始列
    .vertical_end    (10'd630),//投影结束列    
    //输出边沿坐标
	.char1_line_left   (char1_line_left ),
    .char1_line_right  (char1_line_right),
    .char2_line_left   (char2_line_left ),
    .char2_line_right  (char2_line_right),
    .char3_line_left   (char3_line_left ),
    .char3_line_right  (char3_line_right),
    .char4_line_left   (char4_line_left ),
    .char4_line_right  (char4_line_right),
    .char5_line_left   (char5_line_left ),
    .char5_line_right  (char5_line_right),
    .char6_line_left   (char6_line_left ),
    .char6_line_right  (char6_line_right),
    .char7_line_left   (char7_line_left ),
    .char7_line_right  (char7_line_right),
	//Image data has been processd
	.post_frame_vsync  (),//Processed Image data vsync valid signal
	.post_frame_href   (),//Processed Image data href vaild  signal
	.post_frame_clken  (),//Processed Image data output/capture enable clock
	.post_img_Bit      () //Processed Image Bit flag outout(1: Value, 0:inValid)   
);

//----------------------------------------------------------------


//---------------------------第三部分-----------------------------
//第三部分根据第二部分给出的每个字符的边界，进行模板匹配。
//依次进行：
//  3.1 提取特征值
//  3.2 模板匹配
//  3.3 添加边框
//  3.4 添加字符

// 3.1 提取特征值
Get_EigenValue#(
    .HOR_SPLIT(8), //水平切割成几个区域
    .VER_SPLIT(5)  //垂直切割成几个区域
)u3_Get_EigenValue(
    //时钟及复位
    .clk             (clk     ),   // 时钟信号
    .rst_n           (rst_n   ),   // 复位信号（低有效）
    //输入视频流
    .per_frame_vsync     (char_dila_vsync    ),//char_dila_vsync
    .per_frame_href      (char_dila_hsync    ),//char_dila_hsync
    .per_frame_clken     (char_dila_de       ),//char_dila_de   
    .per_frame_bit       (char_dila_bit      ),//char_dila_bit  
    //输入字符边界
    .char_line_up 	     (char_line_up       ),
    .char_line_down      (char_line_down     ),
    .char1_line_left     (char1_line_left    ),
    .char1_line_right    (char1_line_right   ),
    .char2_line_left     (char2_line_left    ),
    .char2_line_right    (char2_line_right   ),
    .char3_line_left     (char3_line_left    ),
    .char3_line_right    (char3_line_right   ),
    .char4_line_left     (char4_line_left    ),
    .char4_line_right    (char4_line_right   ),
    .char5_line_left     (char5_line_left    ),
    .char5_line_right    (char5_line_right   ),
    .char6_line_left     (char6_line_left    ),
    .char6_line_right    (char6_line_right   ),
    .char7_line_left     (char7_line_left    ),
    .char7_line_right    (char7_line_right   ),
    //输出视频流
	.post_frame_vsync    (cal_eigen_vsync    ),	
	.post_frame_href     (cal_eigen_hsync    ),	
	.post_frame_clken    (cal_eigen_de       ),	
	.post_frame_bit      (cal_eigen_bit      ),
    //输出7个特征值
    .char1_eigenvalue    (char1_eigenvalue   ),
    .char2_eigenvalue    (char2_eigenvalue   ),
    .char3_eigenvalue    (char3_eigenvalue   ),
    .char4_eigenvalue    (char4_eigenvalue   ),
    .char5_eigenvalue    (char5_eigenvalue   ),
    .char6_eigenvalue    (char6_eigenvalue   ),
    .char7_eigenvalue    (char7_eigenvalue   ) 
);

//3.2 同或模板匹配
template_matching#(
    .HOR_SPLIT(8), //水平切割成几个区域
    .VER_SPLIT(5)  //垂直切割成几个区域
)u3_template_matching(
    //时钟及复位
    .clk             (clk     ),   // 时钟信号
    .rst_n           (rst_n   ),   // 复位信号（低有效）
    //输入视频流
    .per_frame_vsync     (cal_eigen_vsync),
    .per_frame_href      (cal_eigen_hsync),
    .per_frame_clken     (cal_eigen_de   ),
    .per_frame_bit       (cal_eigen_bit  ),
    //车牌边界
    .plate_boarder_up    (max_line_up   ),
    .plate_boarder_down  (max_line_down ),
    .plate_boarder_left  (max_line_left ),   
    .plate_boarder_right (max_line_right),
    .plate_exist_flag    (1'b1  ),        
    //输入7个字符的特征值
    .char1_eigenvalue  (char1_eigenvalue),
    .char2_eigenvalue  (char2_eigenvalue),
    .char3_eigenvalue  (char3_eigenvalue),
    .char4_eigenvalue  (char4_eigenvalue),
    .char5_eigenvalue  (char5_eigenvalue),
    .char6_eigenvalue  (char6_eigenvalue),
    .char7_eigenvalue  (char7_eigenvalue),
    //输出视频流
    .post_frame_vsync  (template_vsync  ), 
    .post_frame_href   (template_hsync  ), 
    .post_frame_clken  (template_de     ), 
    .post_frame_bit    (template_bit    ), 
    //输出模板匹配结果
    .match_index_char1 (match_index_char1),//匹配后的字符1编号
    .match_index_char2 (match_index_char2),//匹配后的字符2编号
    .match_index_char3 (match_index_char3),//匹配后的字符3编号
    .match_index_char4 (match_index_char4),//匹配后的字符4编号
    .match_index_char5 (match_index_char5),//匹配后的字符5编号
    .match_index_char6 (match_index_char6),//匹配后的字符6编号
    .match_index_char7 (match_index_char7) //匹配后的字符7编号
);

//ila_eigenvalue u_ila_eigenvalue (
//	.clk(clk), // input wire clk
//	.probe0 (match_index_char1), // input wire [5:0]  probe0  
//	.probe1 (match_index_char2), // input wire [5:0]  probe1 
//	.probe2 (match_index_char3), // input wire [5:0]  probe2 
//	.probe3 (match_index_char4), // input wire [5:0]  probe3 
//	.probe4 (match_index_char5), // input wire [5:0]  probe4 
//	.probe5 (match_index_char6), // input wire [5:0]  probe5 
//	.probe6 (match_index_char7), // input wire [5:0]  probe6
//	.probe7 (char1_eigenvalue ), // input wire [39:0]  probe7 
//	.probe8 (char2_eigenvalue ), // input wire [39:0]  probe8 
//	.probe9 (char3_eigenvalue ), // input wire [39:0]  probe9 
//	.probe10(char4_eigenvalue ), // input wire [39:0]  probe10 
//	.probe11(char5_eigenvalue ), // input wire [39:0]  probe11 
//	.probe12(char6_eigenvalue ), // input wire [39:0]  probe12 
//	.probe13(char7_eigenvalue )  // input wire [39:0]  probe13
//);

//将车牌边框、字符边框添加到图像中
add_grid # (
	.PLATE_WIDTH(10'd5),
	.CHAR_WIDTH (10'd2)
)u4_add_grid(
    .clk             (clk   ),   // 时钟信号
    .rst_n           (rst_n ),   // 复位信号（低有效）
    //输入视频流
	.per_frame_vsync     (pre_frame_vsync),//char_dila_vsync     //pre_frame_vsync
	.per_frame_href      (pre_frame_hsync),//char_dila_hsync     //pre_frame_hsync	
	.per_frame_clken     (pre_frame_de   ),//char_dila_de        //pre_frame_de   
	.per_frame_rgb       (pre_rgb        ),//{16{char_dila_bit}} //pre_rgb        		
    //车牌边界
    .plate_boarder_up 	 (max_line_up   ),//(10'd200),
    .plate_boarder_down	 (max_line_down ),//(10'd300),
    .plate_boarder_left  (max_line_left ),//(10'd200),   
    .plate_boarder_right (max_line_right),//(10'd500),
    .plate_exist_flag    (1'b1  ),        //(1'b1   ),
    //字符边界
    .char_line_up 	      (char_line_up    ),//(10'd210),
    .char_line_down	      (char_line_down  ),//(10'd290),
    .char1_line_left      (char1_line_left ),//(10'd210),
    .char1_line_right     (char1_line_right),//(10'd230),
    .char2_line_left      (char2_line_left ),//(10'd250),
    .char2_line_right     (char2_line_right),//(10'd270),
    .char3_line_left      (char3_line_left ),//(10'd290),
    .char3_line_right     (char3_line_right),//(10'd310),
    .char4_line_left      (char4_line_left ),//(10'd330),
    .char4_line_right     (char4_line_right),//(10'd350),
    .char5_line_left      (char5_line_left ),//(10'd370),
    .char5_line_right     (char5_line_right),//(10'd390),
    .char6_line_left      (char6_line_left ),//(10'd410),
    .char6_line_right     (char6_line_right),//(10'd430),
    .char7_line_left      (char7_line_left ),//(10'd450),
    .char7_line_right     (char7_line_right),//(10'd470),
    //输出视频流
	.post_frame_vsync     (add_grid_vsync),	
	.post_frame_href      (add_grid_href ),	
	.post_frame_clken     (add_grid_de   ),	
	.post_frame_rgb       (add_grid_rgb  )
);

add_char u4_add_char(
    //时钟及复位
    .clk             (clk     ),   // 时钟信号
    .rst_n           (rst_n   ),   // 复位信号（低有效）
    //输入视频流
    .per_frame_vsync     (add_grid_vsync),
    .per_frame_href      (add_grid_href ),
    .per_frame_clken     (add_grid_de   ),
    .per_frame_rgb       (add_grid_rgb  ),
    //车牌边界
    .plate_boarder_up    (max_line_up   ),
    .plate_boarder_down  (max_line_down ),
    .plate_boarder_left  (max_line_left ),   
    .plate_boarder_right (max_line_right),
    .plate_exist_flag    (1'b1          ),        
    //输入模板匹配结果
    .match_index_char1   (match_index_char1),//(6'd2),//(match_index_char1)//(char1_eigenvalue[5:0])
    .match_index_char2   (match_index_char2),//(6'd2),//(match_index_char2)//(char2_eigenvalue[5:0])
    .match_index_char3   (match_index_char3),//(6'd2),//(match_index_char3)//(char3_eigenvalue[5:0])
    .match_index_char4   (match_index_char4),//(6'd2),//(match_index_char4)//(char4_eigenvalue[5:0])
    .match_index_char5   (match_index_char5),//(6'd2),//(match_index_char5)//(char5_eigenvalue[5:0])
    .match_index_char6   (match_index_char6),//(6'd2),//(match_index_char6)//(char6_eigenvalue[5:0])
    .match_index_char7   (match_index_char7),//(6'd2),//(match_index_char7)//(char7_eigenvalue[5:0])
    //输出视频流
    .post_frame_vsync    (post_frame_vsync ),  // 场同步信号
    .post_frame_href     (post_frame_hsync ),  // 行同步信号
    .post_frame_clken    (post_frame_de    ),  // 数据输入使能
    .post_frame_rgb      (post_rgb         )   // RGB565颜色数据
);


//----------------------------------------------------------------

endmodule
