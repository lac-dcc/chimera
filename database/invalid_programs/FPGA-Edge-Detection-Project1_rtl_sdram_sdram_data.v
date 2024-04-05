//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                               
//----------------------------------------------------------------------------------------
// File name:           sdram_data
// Last modified Date:  2018/3/18 8:41:06
// Last Version:        V1.0
// Descriptions:        SDRAM 数据读写模块
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/3/18 8:41:06
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module sdram_data(
    input             clk,              //系统时钟
    input             rst_n,            //低电平复位信号

    input   [15:0]    sdram_data_in,    //写入SDRAM中的数据
    output  [15:0]    sdram_data_out,   //从SDRAM中读取的数据
    input   [ 3:0]    work_state,       //SDRAM工作状态寄存器
    input   [ 9:0]    cnt_clk,          //时钟计数
    
    inout   [15:0]    sdram_data        //SDRAM数据总线
    );

`include "sdram_para.v"                 //包含SDRAM参数定义模块

//reg define
reg        sdram_out_en;                //SDRAM数据总线输出使能
reg [15:0] sdram_din_r;                 //寄存写入SDRAM中的数据
reg [15:0] sdram_dout_r;                //寄存从SDRAM中读取的数据

//*****************************************************
//**                    main code
//***************************************************** 

//SDRAM 双向数据线作为输入时保持高阻态
assign sdram_data = sdram_out_en ? sdram_din_r : 16'hzzzz;

//输出SDRAM中读取的数据
assign sdram_data_out = sdram_dout_r;

//SDRAM 数据总线输出使能
always @ (posedge clk or negedge rst_n) begin 
    if(!rst_n) 
       sdram_out_en <= 1'b0;
   else if((work_state == `W_WRITE) | (work_state == `W_WD)) 
       sdram_out_en <= 1'b1;            //向SDRAM中写数据时,输出使能拉高
   else 
       sdram_out_en <= 1'b0;
end

//将待写入数据送到SDRAM数据总线上
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) 
        sdram_din_r <= 16'd0;
    else if((work_state == `W_WRITE) | (work_state == `W_WD))
        sdram_din_r <= sdram_data_in;   //寄存写入SDRAM中的数据
end

//读数据时,寄存SDRAM数据线上的数据
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) 
        sdram_dout_r <= 16'd0;
    else if(work_state == `W_RD) 
        sdram_dout_r <= sdram_data;     //寄存从SDRAM中读取的数据
end

endmodule 