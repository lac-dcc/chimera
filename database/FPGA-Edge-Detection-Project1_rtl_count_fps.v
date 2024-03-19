//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          count_fps
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        count_fps
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module count_fps(
    //mudule clock
    input                   clk  ,      // 时钟信号
    input                   rst_n,      // 复位信号
    input                   fps,
    //user interface
    output   reg [19:0]     data       // 6个数码管要显示的数值
);

//parameter define
parameter  MAX_NUM = 31'd5000_0000;      // 计数器计数的最大值

//reg define
reg    [31:0]   cnt ;                   // 计数器，用于计时100ms
reg             flag;                   // 标志信号
reg    [31:0]   fpscnt;
reg fpsreg;
//*****************************************************
//**                    main code
//*****************************************************

//计数器对系统时钟计数达10ms时，输出一个时钟周期的脉冲信号
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt <= 31'b0;
        flag<= 1'b0;
    end
    else if (cnt < MAX_NUM - 1'b1) begin
        cnt <= cnt + 1'b1;
        flag<= 1'b0;
    end
    else begin
        cnt <= 31'b0;
        flag <= 1'b1;
    end
end 

//数码管需要显示的数据，从0累加到999999
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n)begin
        data  <= 20'b0;
        fpscnt<=0;
        fpsreg<=0;
    end 
    else begin
        fpsreg<=fps;
        if (flag) begin                 //显示数值每隔0.01s累加一次
            data<=fpscnt;
            fpscnt<=0;
        end 
        else
            begin
                if((fps==1'b1)&&(fpsreg!=fps))
                    fpscnt<=fpscnt+1;
                else
                    fpscnt<=fpscnt;
            end
    end 
end 

endmodule 