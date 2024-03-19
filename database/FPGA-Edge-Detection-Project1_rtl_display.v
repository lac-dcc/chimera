//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          display
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        数码管显示
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module display(
    //mudule clock
    input                   clk  ,      // 时钟信号
    input                   rst_n,      // 复位信号
    input         [7:0]     Sobel_Threshold,      // 信号
    input         [19:0]    fpsdata,
    //user interface
    output   reg [19:0]     data ,      // 6个数码管要显示的数值
    output   reg [ 5:0]     point,      // 小数点的位置,高电平点亮对应数码管位上的小数点
    input            en   ,      // 数码管使能信号
    output   reg            sign        // 符号位，高电平时显示负号，低电平不显示负号
);

//parameter define
//parameter test=4'd15;
//reg define

//*****************************************************
//**                    main code
//*****************************************************

//数码管需要显示的数据，从0累加到999999


//数码管需要显示的数据，从0累加到999999

always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
        data  <= Sobel_Threshold;
        point <=6'b000000;
       // en    <= 1'b0;
        sign  <= 1'b0;
    end 
    else begin
        
        point <= 6'b000000;             //不显示小数点
        //en    <= 1'b1;                  //打开数码管使能信号
        sign  <= 1'b0;                  //不显示负号
        //data <= Sobel_Threshold;
        if (en==1)
            data <= fpsdata;
        //data[7:0]<=Sobel_Threshold;
        //data[11:8]<=test;
    end 
end 

endmodule 