//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           picture_size
// Last modified Date:  2020/05/04 9:19:08
// Last Version:        V1.0
// Descriptions:        摄像头输出图像尺寸及帧率配置
//                      
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2019/05/04 9:19:08
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module picture_size (
    input              rst_n         ,
    input              clk           ,         
    input       [15:0] ID_lcd        ,
             
    output      [12:0] cmos_h_pixel  ,
    output      [12:0] cmos_v_pixel  ,   
    output      [12:0] total_h_pixel ,
    output      [12:0] total_v_pixel ,
    output      [23:0] sdram_max_addr
);

reg [12:0] cmos_h_pixel;
reg [12:0] cmos_v_pixel;   
reg [12:0] total_h_pixel;
reg [12:0] total_v_pixel;
reg [23:0] sdram_max_addr;

//parameter define
parameter  ID_4342 =   16'h4342;
parameter  ID_7084 =   16'h7084;
parameter  ID_7016 =   16'h7016;
parameter  ID_1018 =   16'h1018;

//*****************************************************
//**                    main code                      
//*****************************************************

//配置摄像头输出尺寸的大小
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin
        cmos_h_pixel <= 13'b0;
        cmos_v_pixel <= 13'd0;
        sdram_max_addr <= 23'd0;        
    end 
    else begin    
        case(ID_lcd ) 
            16'h4342 : begin
                cmos_h_pixel   = 13'd480;    
                cmos_v_pixel   = 13'd272;
                sdram_max_addr = 23'd130560;
            end 
            16'h7084 : begin
                cmos_h_pixel   = 13'd800;    
                cmos_v_pixel   = 13'd480;           
                sdram_max_addr = 23'd384000;
            end 
            16'h7016 : begin
                cmos_h_pixel   = 13'd1024;    
                cmos_v_pixel   = 13'd600;           
                sdram_max_addr = 23'd614400;
            end    
            16'h1018 : begin
                cmos_h_pixel   = 13'd1280;    
                cmos_v_pixel   = 13'd800;           
                sdram_max_addr = 23'd1024000;
            end 
        default : begin
                cmos_h_pixel   = 13'd800;    
                cmos_v_pixel   = 13'd480;           
                sdram_max_addr = 23'd384000;
        end
        endcase
    end    
end 

//对HTS及VTS的配置会影响摄像头输出图像的帧率
always @(*) begin
    case(ID_lcd)
        ID_4342 : begin 
            total_h_pixel = 13'd1800;
            total_v_pixel = 13'd1000;
        end 
        ID_7084 : begin  
            total_h_pixel = 13'd1800;
            total_v_pixel = 13'd1000;
        end 
        ID_7016 : begin  
            total_h_pixel = 13'd2200;
            total_v_pixel = 13'd1000;
        end 
        ID_1018 : begin 
            total_h_pixel = 13'd2570;
            total_v_pixel = 13'd980;
        end 
    default : begin
            total_h_pixel = 13'd1800;
            total_v_pixel = 13'd1000;
    end 
    endcase
end 

endmodule 