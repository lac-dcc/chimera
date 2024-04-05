//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          Video_Image_Processor
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        Video_Image_Processor图像处理主要模块
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//
module Video_Image_Processor
    (
    input   clk,    //cmos 像素时钟
    input   rst_n,  
    
    //预处理图像数据
    input        in_frame_vsync, //预图像数据列有效信号  
    input        in_frame_href,  //预图像数据行有效信号  
    input        in_frame_clken, //预图像数据输入使能效信号
    input        [15:0] in_img_Y, //输入RGB565数据
    input        [7:0]Sobel_Threshold ,
	input		[3:0]	out_a,		//key control data
    //处理后的图像数据  sobel
    output  reg      post_frame_clken_median,        
    output  reg [7:0]post_img_Y_median,          
    output  reg      post_frame_clken_sobel,         
    output  reg      post_img_Y_sobel,  
    output  reg      post_frame_clken_sobel_erosion,   
   
    output  reg      post_img_Y_sobel_erosion,  
    output  reg      post_frame_clken_sobel_erosion2 ,              
    output  reg      post_img_Y_sobel_erosion2,                 
    output  reg      post_frame_clken_sobel_erosion2_dilation ,     
    output  reg      post_img_Y_sobel_erosion2_dilation,             
    output       out_frame_vsync_prewitt, //prewitt算法   
    output       out_frame_href_prewitt,  //prewitt算法
    output       out_frame_clken_prewitt, //prewitt算法
    output       out_img_Bit_prewitt,       
    
    
    output       [7:0]data_tx,      
    output       data_tx_en,
    output       out_frame_vsync, //处理后的图像数据列有效信号  
    output       out_frame_href,  //处理后的图像数据行有效信号  
    output       out_frame_clken, //处理后的图像数据输出使能效信号
    output       out_img_Bit,        //处理后的灰度数据
    output      [11:0]  x_min,
    output      [11:0]  x_max,
    output      [11:0]  y_min,
    output      [11:0]  y_max, 
    output       [19:0]  fingertip_data, 
    input 			[11:0]	lcd_x,
	input 			[11:0]	lcd_y,
	output		[15:0]	post_img,

    output       reg [7:0]out_img_imy,
    output       reg out_frame_clken_imy
);
parameter	[10:0]	IMG_HDISP = 11'd1024;	//640*480
parameter	[10:0]	IMG_VDISP = 11'd768;
//wire define 
wire [7:0] img_y ;
wire       frame_vsync;
wire       frame_hsync;
wire       post_frame_de;

//*****************************************************
//**                    main code
//*****************************************************
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
       out_frame_clken_imy<=post_frame_de;
       out_img_imy<=img_y;
    end 
    else begin
       out_frame_clken_imy<=post_frame_de;
       out_img_imy<=img_y;
    end 
end
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
       post_frame_clken_median<=post_frame_clken;
       post_img_Y_median<=post_img_Y;
    end 
    else begin
       post_frame_clken_median<=post_frame_clken;
       post_img_Y_median<=post_img_Y;
    end 
end
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
       post_frame_clken_sobel<=post1_frame_clken;
       post_img_Y_sobel<=post1_img_Bit;
    end 
    else begin
       post_frame_clken_sobel<=post1_frame_clken;
       post_img_Y_sobel<=post1_img_Bit;
    end 
end
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
       post_frame_clken_sobel_erosion<=post2_frame_clken;
       post_img_Y_sobel_erosion<=post2_img_Bit;
    end 
    else begin
       post_frame_clken_sobel_erosion<=post2_frame_clken;
       post_img_Y_sobel_erosion<=post2_img_Bit;
    end 
end
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
       post_frame_clken_sobel_erosion2<=post4_frame_clken;
       post_img_Y_sobel_erosion2<=post4_img_Bit;
    end 
    else begin
       post_frame_clken_sobel_erosion2<=post4_frame_clken;
       post_img_Y_sobel_erosion2<=post4_img_Bit;
    end 
end
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
       post_frame_clken_sobel_erosion2_dilation<=out_frame_clken;
       post_img_Y_sobel_erosion2_dilation<=out_img_Bit;
    end 
    else begin
       post_frame_clken_sobel_erosion2_dilation<=out_frame_clken;
       post_img_Y_sobel_erosion2_dilation<=out_img_Bit;
    end 
end
rgb2ycbcr u_rgb2ycbcr(
    .clk             (clk),
    .rst_n           (rst_n),
    
    .out_a           (out_a),
    .pre_frame_vsync (in_frame_vsync),
    .pre_frame_hsync (in_frame_href),
    .pre_frame_de    (in_frame_clken),
    .img_red         (in_img_Y[15:11]),
    .img_green       (in_img_Y[10:5]),
    .img_blue        (in_img_Y[4:0]),
    
    
    .post_frame_vsync(frame_vsync),
    .post_frame_hsync(frame_hsync),
    .post_frame_de   (post_frame_de),
    .img_y           (img_y),
    .img_cb          (),
    .img_cr          ()
);
wire [7:0] post_img_Y ;
wire       post_frame_vsync;
wire       post_frame_href;
wire       post_frame_clken;
//灰度图中值滤波
VIP_Gray_Median_Filter u_VIP_Gray_Median_Filter(
    .clk    (clk),   
    .rst_n  (rst_n), 
    
    //预处理图像数据
    .pe_frame_vsync (frame_vsync),
    .pe_frame_href  (frame_hsync),
    .pe_frame_clken (post_frame_de),
    .pe_img_Y       (img_y),
    
    //处理后的图像数据
    .pos_frame_vsync (post_frame_vsync),
    .pos_frame_href  (post_frame_href),
    .pos_frame_clken (post_frame_clken),
    .pos_img_Y       (post_img_Y)        
);

VIP_Sobel_Edge_Detector 
u_VIP_Sobel_Edge_Detector(
    .clk (clk),   
    .rst_n (rst_n),  
    
    //预处理数据
    .per_frame_vsync (post_frame_vsync), //预处理帧有效信号
    .per_frame_href  (post_frame_href), //预处理行有效信号
    .per_frame_clken (post_frame_clken), //预处理图像使能信号
    .per_img_Y       (post_img_Y),        //输入灰度数据
    
    //处理后的数据
    .post_frame_vsync (post1_frame_vsync), //处理后帧有效信号
    .post_frame_href  (post1_frame_href),	 //处理后行有效信号
    .post_frame_clken (post1_frame_clken), //输出使能信号
    .post_img_Bit     (post1_img_Bit),	 //输出像素有效标志(1: Value, 0:inValid)
    
    //用户接口
    .Sobel_Threshold  (Sobel_Threshold) //Sobel 阈值
);
wire			post1_frame_vsync;	//Processed Image data vsync valid signal
wire			post1_frame_href;	//Processed Image data href vaild  signal
wire			post1_frame_clken;	//Processed Image data output/capture enable clock
wire			post1_img_Bit;		//Processed Image Bit flag outout(1: Value, 0:inValid)
wire			post2_frame_vsync;	//Processed Image data vsync valid signal
wire			post2_frame_href;	//Processed Image data href vaild  signal
wire			post2_frame_clken;	//Processed Image data output/capture enable clock
wire			post2_img_Bit;		//Processed Image Bit flag outout(1: Value, 0:inValid)
wire			post3_frame_vsync;	//Processed Image data vsync valid signal
wire			post3_frame_href;	//Processed Image data href vaild  signal
wire			post3_frame_clken;	//Processed Image data output/capture enable clock
wire			post3_img_Bit;		//Processed Image Bit flag outout(1: Value, 0:inValid)
VIP_Bit_Erosion_Detector
#(
	.IMG_HDISP	(IMG_HDISP),	//640*480
	.IMG_VDISP	(IMG_VDISP)
)
u_VIP_Bit_Erosion_Detector
(
	//global clock
	.clk					(clk),  				//cmos video pixel clock
	.rst_n					(rst_n),				//global reset

	//Image data prepred to be processd
	.per_frame_vsync		(post1_frame_vsync),	//Prepared Image data vsync valid signal
	.per_frame_href			(post1_frame_href),		//Prepared Image data href vaild  signal
	.per_frame_clken		(post1_frame_clken),	//Prepared Image data output/capture enable clock
	.per_img_Bit			(post1_img_Bit),		//Processed Image Bit flag outout(1: Value, 0:inValid)

	//Image data has been processd
	.post_frame_vsync		(post2_frame_vsync),		//Processed Image data vsync valid signal
	.post_frame_href		(post2_frame_href),		//Processed Image data href vaild  signal
	.post_frame_clken		(post2_frame_clken),		//Processed Image data output/capture enable clock
	.post_img_Bit			(post2_img_Bit),		//Processed Image Bit flag outout(1: Value, 0:inValid)
);
/*VIP_Bit_Erosion_Detector
#(
	.IMG_HDISP	(IMG_HDISP),	//640*480
	.IMG_VDISP	(IMG_VDISP)
)
u_VIP_Bit_Erosion_Detector1
(
	//global clock
	.clk					(clk),  				//cmos video pixel clock
	.rst_n					(rst_n),				//global reset

	//Image data prepred to be processd
	.per_frame_vsync		(post2_frame_vsync),	//Prepared Image data vsync valid signal
	.per_frame_href			(post2_frame_href),		//Prepared Image data href vaild  signal
	.per_frame_clken		(post2_frame_clken),	//Prepared Image data output/capture enable clock
	.per_img_Bit			(post2_img_Bit),		//Processed Image Bit flag outout(1: Value, 0:inValid)

	//Image data has been processd
	.post_frame_vsync		(post3_frame_vsync),		//Processed Image data vsync valid signal
	.post_frame_href		(post3_frame_href),		//Processed Image data href vaild  signal
	.post_frame_clken		(post3_frame_clken),		//Processed Image data output/capture enable clock
	.post_img_Bit			(post3_img_Bit),		//Processed Image Bit flag outout(1: Value, 0:inValid)
);*/
VIP_Bit_Dilation_Detector
#(
	.IMG_HDISP	(IMG_HDISP),	//640*480
	.IMG_VDISP	(IMG_VDISP)
)
u_VIP_Bit_Dilation_Detector
(
	//global clock
	.clk					(clk),  				//cmos video pixel clock
	.rst_n					(rst_n),				//global reset

	//Image data prepred to be processd
	.per_frame_vsync		(post2_frame_vsync),	//Prepared Image data vsync valid signal
	.per_frame_href			(post2_frame_href),		//Prepared Image data href vaild  signal
	.per_frame_clken		(post2_frame_clken),	//Prepared Image data output/capture enable clock
	.per_img_Bit			(post2_img_Bit),		//Processed Image Bit flag outout(1: Value, 0:inValid)

	//Image data has been processd
	.post_frame_vsync		(post4_frame_vsync),	//Processed Image data vsync valid signal
	.post_frame_href		(post4_frame_href),		//Processed Image data href vaild  signal
	.post_frame_clken		(post4_frame_clken),	//Processed Image data output/capture enable clock
	.post_img_Bit			(post4_img_Bit),		//Processed Image Bit flag outout(1: Value, 0:inValid)
);
wire			post4_frame_vsync;	//Processed Image data vsync valid signal
wire			post4_frame_href;	//Processed Image data href vaild  signal
wire			post4_frame_clken;	//Processed Image data output/capture enable clock
wire			post4_img_Bit;		//Processed Image Bit flag outout(1: Value, 0:inValid)
wire			post5_frame_vsync;	//Processed Image data vsync valid signal
wire			post5_frame_href;	//Processed Image data href vaild  signal
wire			post5_frame_clken;	//Processed Image data output/capture enable clock
wire	[15:0]	post5_img;		//Processed Image Bit flag outout(1: Value, 0:inValid)

Gesture_Posion u_Gesture_Posion(//画出手势框图
    .clk                    (clk             ),
    .rst_n                  (rst_n           ),
    .per_frame_vsync        (post4_frame_vsync),
    .per_frame_href         (post4_frame_href),	
    .per_frame_clken        (post4_frame_clken),
    .per_img_Bit            (post4_img_Bit),	
    .post_frame_vsync       (post5_frame_vsync),
    .post_frame_href        (post5_frame_href ),
    .post_frame_clken       (post5_frame_clken),
    .x_min                  (x_min),
    .x_max                  (x_max),
    .y_min                  (y_min),
    .y_max                  (y_max),
    .oDATA_length           (oDATA_length1),
    .oDATA_area             (oDATA_area1),
 
    .fingertip_data	        (figuredata),
    .en                     (gesture_en) ,
    //.lcd_x                  (lcd_x),
	//.lcd_y                  (lcd_y),
    .post_img               (post5_img        )
    );

//-------------------------------------------------------
//assign  post_img = {16{post3_img_Bit}};    //Gray
assign   out_img_Bit= post5_img;//  post_img
//Gray
/*
assign  post_frame_vsync    = post3_frame_vsync;
assign  post_frame_href     = post3_frame_href;
assign  post_frame_clken    = post3_frame_clken;
*/
assign  out_frame_vsync    = post5_frame_vsync;
assign  out_frame_href     = post5_frame_href;
assign  out_frame_clken    = post5_frame_clken;

wire[19:0] oDATA_length1;		// 输出像素计数周长
wire[19:0] oDATA_area1;			// 输出像素计数面积
wire[19:0] figuredata;			// 输出像素计数面积
wire gesture_en;



VIP_Prewitt_Edge_Detector 
u_VIP_Prewitt_Edge_Detector(
    .clk (clk),   
    .rst_n (rst_n),  
    
    //预处理数据
    .per_frame_vsync (post_frame_vsync), //预处理帧有效信号
    .per_frame_href  (post_frame_href),  //预处理行有效信号
    .per_frame_clken (post_frame_clken), //预处理图像使能信号
    .per_img_Y       (post_img_Y),       //输入灰度数据
    
    //处理后的数据
    .post_frame_vsync (out_frame_vsync_prewitt), //处理后帧有效信号
    .post_frame_href  (out_frame_href_prewitt),  //处理后行有效信号
    .post_frame_clken (out_frame_clken_prewitt), //输出使能信号
    .post_img_Bit     (out_img_Bit_prewitt ),      //输出像素有效标志(1: Value, 0:inValid)
    
    //用户接口
    .Sobel_Threshold  (Sobel_Threshold) //Sobel 阈值
);
endmodule 