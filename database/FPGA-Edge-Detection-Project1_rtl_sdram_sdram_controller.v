//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                               
//----------------------------------------------------------------------------------------
// File name:           sdram_controller
// Last modified Date:  2018/3/18 8:41:06
// Last Version:        V1.0
// Descriptions:        SDRAM 控制器
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/3/18 8:41:06
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module sdram_controller(
    input         clk,              //SDRAM控制器时钟，100MHz
    input         rst_n,            //系统复位信号，低电平有效
    
    //SDRAM 控制器写端口  
    input         sdram_wr_req,     //写SDRAM请求信号
    output        sdram_wr_ack,     //写SDRAM响应信号
    input  [23:0] sdram_wr_addr,    //SDRAM写操作的地址
    input  [ 9:0] sdram_wr_burst,   //写sdram时数据突发长度
    input  [15:0] sdram_din,        //写入SDRAM的数据
    
    //SDRAM 控制器读端口  
    input         sdram_rd_req,     //读SDRAM请求信号
    output        sdram_rd_ack,     //读SDRAM响应信号
    input  [23:0] sdram_rd_addr,    //SDRAM写操作的地址
    input  [ 9:0] sdram_rd_burst,   //读sdram时数据突发长度
    output [15:0] sdram_dout,       //从SDRAM读出的数据
    
    output        sdram_init_done,  //SDRAM 初始化完成标志
                                     
    // FPGA与SDRAM硬件接口
    output        sdram_cke,        // SDRAM 时钟有效信号
    output        sdram_cs_n,       // SDRAM 片选信号
    output        sdram_ras_n,      // SDRAM 行地址选通脉冲
    output        sdram_cas_n,      // SDRAM 列地址选通脉冲
    output        sdram_we_n,       // SDRAM 写允许位
    output [ 1:0] sdram_ba,         // SDRAM L-Bank地址线
    output [12:0] sdram_addr,       // SDRAM 地址总线
    inout  [15:0] sdram_data        // SDRAM 数据总线
    );

//wire define
wire [4:0] init_state;              // SDRAM初始化状态
wire [3:0] work_state;              // SDRAM工作状态
wire [9:0] cnt_clk;                 // 延时计数器
wire       sdram_rd_wr;             // SDRAM读/写控制信号,低电平为写，高电平为读

//*****************************************************
//**                    main code
//*****************************************************     

// SDRAM 状态控制模块                
sdram_ctrl u_sdram_ctrl(            
    .clk                (clk),                      
    .rst_n              (rst_n),

    .sdram_wr_req       (sdram_wr_req), 
    .sdram_rd_req       (sdram_rd_req),
    .sdram_wr_ack       (sdram_wr_ack),
    .sdram_rd_ack       (sdram_rd_ack),                     
    .sdram_wr_burst     (sdram_wr_burst),
    .sdram_rd_burst     (sdram_rd_burst),
    .sdram_init_done    (sdram_init_done),
    
    .init_state         (init_state),
    .work_state         (work_state),
    .cnt_clk            (cnt_clk),
    .sdram_rd_wr        (sdram_rd_wr)
    );

// SDRAM 命令控制模块
sdram_cmd u_sdram_cmd(              
    .clk                (clk),
    .rst_n              (rst_n),

    .sys_wraddr         (sdram_wr_addr),            
    .sys_rdaddr         (sdram_rd_addr),
    .sdram_wr_burst     (sdram_wr_burst),
    .sdram_rd_burst     (sdram_rd_burst),
    
    .init_state         (init_state),   
    .work_state         (work_state),
    .cnt_clk            (cnt_clk),
    .sdram_rd_wr        (sdram_rd_wr),
    
    .sdram_cke          (sdram_cke),        
    .sdram_cs_n         (sdram_cs_n),   
    .sdram_ras_n        (sdram_ras_n),  
    .sdram_cas_n        (sdram_cas_n),  
    .sdram_we_n         (sdram_we_n),   
    .sdram_ba           (sdram_ba),         
    .sdram_addr         (sdram_addr)
    );

// SDRAM 数据读写模块
sdram_data u_sdram_data(        
    .clk                (clk),
    .rst_n              (rst_n),
    
    .sdram_data_in      (sdram_din),
    .sdram_data_out     (sdram_dout),
    .work_state         (work_state),
    .cnt_clk            (cnt_clk),
    
    .sdram_data         (sdram_data)
    );

endmodule 