//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          sdram_top
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        SDRAM 控制器顶层模块
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//


module  sdram_top(
    input         ref_clk,                  //sdram 控制器参考时钟
    input         out_clk,                  //用于输出的相位偏移时钟
    input         rst_n,                    //系统复位
    
    //用户写端口         
    input         wr_clk,                   //写端口FIFO: 写时钟
    input         wr_en,                    //写端口FIFO: 写使能
    input  [15:0] wr_data,                  //写端口FIFO: 写数据
    input  [23:0] wr_min_addr,              //写SDRAM的起始地址
    input  [23:0] wr_max_addr,              //写SDRAM的结束地址
    input  [ 9:0] wr_len,                   //写SDRAM时的数据突发长度
    input         wr_load,                  //写端口复位: 复位写地址,清空写FIFO
    
    //用户读端口
    input         rd_clk,                   //读端口FIFO: 读时钟
    input         rd_en,                    //读端口FIFO: 读使能
    output [15:0] rd_data,                  //读端口FIFO: 读数据
    input  [23:0] rd_min_addr,              //读SDRAM的起始地址
    input  [23:0] rd_max_addr,              //读SDRAM的结束地址
    input  [ 9:0] rd_len,                   //从SDRAM中读数据时的突发长度
    input         rd_load,                  //读端口复位: 复位读地址,清空读FIFO
    
    //用户控制端口  
    input         sdram_read_valid,         //SDRAM 读使能
    input         sdram_pingpang_en,        //SDRAM 乒乓操作使能
    output        sdram_init_done,          //SDRAM 初始化完成标志
    
    //SDRAM 芯片接口
    output        sdram_clk,                //SDRAM 芯片时钟
    output        sdram_cke,                //SDRAM 时钟有效
    output        sdram_cs_n,               //SDRAM 片选
    output        sdram_ras_n,              //SDRAM 行有效
    output        sdram_cas_n,              //SDRAM 列有效
    output        sdram_we_n,               //SDRAM 写有效
    output [ 1:0] sdram_ba,                 //SDRAM Bank地址
    output [12:0] sdram_addr,               //SDRAM 行/列地址
    inout  [15:0] sdram_data,               //SDRAM 数据
    output [ 1:0] sdram_dqm                 //SDRAM 数据掩码
    );

//wire define
wire        sdram_wr_req;                   //sdram 写请求
wire        sdram_wr_ack;                   //sdram 写响应
wire [23:0] sdram_wr_addr;                  //sdram 写地址
wire [15:0] sdram_din;                      //写入sdram中的数据

wire        sdram_rd_req;                   //sdram 读请求
wire        sdram_rd_ack;                   //sdram 读响应
wire [23:0] sdram_rd_addr;                   //sdram 读地址
wire [15:0] sdram_dout;                     //从sdram中读出的数据

//*****************************************************
//**                    main code
//***************************************************** 
assign  sdram_clk = out_clk;                //将相位偏移时钟输出给sdram芯片
assign  sdram_dqm = 2'b00;                  //读写过程中均不屏蔽数据线
            
//SDRAM 读写端口FIFO控制模块
sdram_fifo_ctrl u_sdram_fifo_ctrl(
    .clk_ref            (ref_clk),          //SDRAM控制器时钟
    .rst_n              (rst_n),            //系统复位

    //用户写端口
    .clk_write          (wr_clk),           //写端口FIFO: 写时钟
    .wrf_wrreq          (wr_en),            //写端口FIFO: 写请求
    .wrf_din            (wr_data),          //写端口FIFO: 写数据  
    .wr_min_addr        (wr_min_addr),      //写SDRAM的起始地址
    .wr_max_addr        (wr_max_addr),      //写SDRAM的结束地址
    .wr_length          (wr_len),           //写SDRAM时的数据突发长度
    .wr_load            (wr_load),          //写端口复位: 复位写地址,清空写FIFO    
    
    //用户读端口                                                 
    .clk_read           (rd_clk),           //读端口FIFO: 读时钟
    .rdf_rdreq          (rd_en),            //读端口FIFO: 读请求
    .rdf_dout           (rd_data),          //读端口FIFO: 读数据
    .rd_min_addr        (rd_min_addr),      //读SDRAM的起始地址
    .rd_max_addr        (rd_max_addr),      //读SDRAM的结束地址
    .rd_length          (rd_len),           //从SDRAM中读数据时的突发长度
    .rd_load            (rd_load),          //读端口复位: 复位读地址,清空读FIFO
   
    //用户控制端口    
    .sdram_read_valid   (sdram_read_valid), //sdram 读使能
    .sdram_init_done    (sdram_init_done),  //sdram 初始化完成标志
    .sdram_pingpang_en  (sdram_pingpang_en),//sdram 乒乓操作使能
    
    //SDRAM 控制器写端口
    .sdram_wr_req       (sdram_wr_req),     //sdram 写请求
    .sdram_wr_ack       (sdram_wr_ack),     //sdram 写响应
    .sdram_wr_addr      (sdram_wr_addr),    //sdram 写地址
    .sdram_din          (sdram_din),        //写入sdram中的数据
    
    //SDRAM 控制器读端口
    .sdram_rd_req       (sdram_rd_req),     //sdram 读请求
    .sdram_rd_ack       (sdram_rd_ack),     //sdram 读响应
    .sdram_rd_addr      (sdram_rd_addr),    //sdram 读地址
    .sdram_dout         (sdram_dout)        //从sdram中读出的数据
    );

//SDRAM控制器
sdram_controller u_sdram_controller(
    .clk                (ref_clk),          //sdram 控制器时钟
    .rst_n              (rst_n),            //系统复位
    
    //SDRAM 控制器写端口  
    .sdram_wr_req       (sdram_wr_req),     //sdram 写请求
    .sdram_wr_ack       (sdram_wr_ack),     //sdram 写响应
    .sdram_wr_addr      (sdram_wr_addr),    //sdram 写地址
    .sdram_wr_burst     (wr_len),           //写sdram时数据突发长度
    .sdram_din          (sdram_din),        //写入sdram中的数据
    
    //SDRAM 控制器读端口
    .sdram_rd_req       (sdram_rd_req),     //sdram 读请求
    .sdram_rd_ack       (sdram_rd_ack),     //sdram 读响应
    .sdram_rd_addr      (sdram_rd_addr),    //sdram 读地址
    .sdram_rd_burst     (rd_len),           //读sdram时数据突发长度
    .sdram_dout         (sdram_dout),       //从sdram中读出的数据
    
    .sdram_init_done    (sdram_init_done),  //sdram 初始化完成标志

    //SDRAM 芯片接口
    .sdram_cke          (sdram_cke),        //SDRAM 时钟有效
    .sdram_cs_n         (sdram_cs_n),       //SDRAM 片选
    .sdram_ras_n        (sdram_ras_n),      //SDRAM 行有效 
    .sdram_cas_n        (sdram_cas_n),      //SDRAM 列有效
    .sdram_we_n         (sdram_we_n),       //SDRAM 写有效
    .sdram_ba           (sdram_ba),         //SDRAM Bank地址
    .sdram_addr         (sdram_addr),       //SDRAM 行/列地址
    .sdram_data         (sdram_data)        //SDRAM 数据  
    );
    
endmodule 