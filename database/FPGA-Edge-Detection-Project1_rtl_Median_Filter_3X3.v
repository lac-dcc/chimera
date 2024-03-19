//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          Median_Filter_3X3
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        Median_Filter_3X3
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//
module Median_Filter_3X3(
    input       clk,
    input       rst_n,
    input       median_frame_vsync,
    input       median_frame_href,
    input       median_frame_clken,
   
    input [7:0]  data11, 
    input [7:0]  data12, 
    input [7:0]  data13,
    input [7:0]  data21, 
    input [7:0]  data22, 
    input [7:0]  data23,
    input [7:0]  data31, 
    input [7:0]  data32, 
    input [7:0]  data33,
   
    output [7:0] target_data,
    output       pos_median_vsync,
    output       pos_median_href,
    output       pos_median_clken
);


//--------------------------------------------------------------------------------------
//FPGA Median Filter Sort order
//       Pixel -- Sort1 -- Sort2 -- Sort3
// [ P1  P2  P3 ]	[   Max1  Mid1   Min1 ]
// [ P4  P5  P6 ]	[   Max2  Mid2   Min2 ]	[Max_min, Mid_mid, Min_max]	mid_valid
// [ P7  P8  P9 ]	[   Max3  Mid3   Min3 ]

//reg define
reg [2:0]   median_frame_vsync_r;
reg [2:0]   median_frame_href_r;
reg [2:0]   median_frame_clken_r;

wire [7:0] max_data1; 
wire [7:0] mid_data1; 
wire [7:0] min_data1;
wire [7:0] max_data2; 
wire [7:0] mid_data2; 
wire [7:0] min_data2;
wire [7:0] max_data3; 
wire [7:0] mid_data3; 
wire [7:0] min_data3;
wire [7:0] max_min_data; 
wire [7:0] mid_mid_data; 
wire [7:0] min_max_data;

//*****************************************************
//**                    main code
//*****************************************************

assign pos_median_vsync = median_frame_vsync_r[2];
assign pos_median_href  = median_frame_href_r[2];
assign pos_median_clken = median_frame_clken_r[2];

//Step1 对stor3进行三次例化操作
Sort3  u_Sort3_1(     //第一行数据排序
    .clk      (clk),
    .rst_n    (rst_n),
    
    .data1    (data11), 
    .data2    (data12), 
    .data3    (data13),
    
    .max_data (max_data1),
    .mid_data (mid_data1),
    .min_data (min_data1)
);

Sort3  u_Sort3_2(      //第二行数据排序
    .clk      (clk),
    .rst_n    (rst_n),
        
    .data1    (data21), 
    .data2    (data22), 
    .data3    (data23),
    
    .max_data (max_data2),
    .mid_data (mid_data2),
    .min_data (min_data2)
);

Sort3  u_Sort3_3(      //第三行数据排序
    .clk      (clk),
    .rst_n    (rst_n),
        
    .data1    (data31), 
    .data2    (data32), 
    .data3    (data33),
    
    .max_data (max_data3),
    .mid_data (mid_data3),
    .min_data (min_data3)
);

//Step2 对三行像素取得的排序进行处理
Sort3 u_Sort3_4(        //取三行最大值的最小值
    .clk      (clk),
    .rst_n    (rst_n),
          
    .data1    (max_data1), 
    .data2    (max_data2), 
    .data3    (max_data3),
    
    .max_data (),
    .mid_data (),
    .min_data (max_min_data)
);

Sort3 u_Sort3_5(        //取三行中值的最小值
    .clk      (clk),
    .rst_n    (rst_n),
          
    .data1    (mid_data1), 
    .data2    (mid_data2), 
    .data3    (mid_data3),
    
    .max_data (),
    .mid_data (mid_mid_data),
    .min_data ()
);

Sort3 u_Sort3_6(        //取三行最小值的最大值
    .clk      (clk),
    .rst_n    (rst_n),
          
    .data1    (min_data1), 
    .data2    (min_data2), 
    .data3    (min_data3),
    
    .max_data (min_max_data),
    .mid_data (),
    .min_data ()
);

//step3 将step2 中得到的三个值，再次取中值
Sort3 u_Sort3_7(
    .clk      (clk),
    .rst_n    (rst_n),
          
    .data1    (max_min_data), 
    .data2    (mid_mid_data), 
    .data3    (min_max_data),
    
    .max_data (),
    .mid_data (target_data),
    .min_data ()
);

//延迟三个周期进行同步
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        median_frame_vsync_r <= 0;
        median_frame_href_r  <= 0;
        median_frame_clken_r <= 0;
    end
    else begin
        median_frame_vsync_r <= {median_frame_vsync_r[1:0],median_frame_vsync};
        median_frame_href_r  <= {median_frame_href_r [1:0], median_frame_href};
        median_frame_clken_r <= {median_frame_clken_r[1:0],median_frame_clken};
    end
end

endmodule 