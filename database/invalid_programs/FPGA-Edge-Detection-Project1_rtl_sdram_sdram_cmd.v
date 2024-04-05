//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                               
//----------------------------------------------------------------------------------------
// File name:           sdram_cmd
// Last modified Date:  2018/3/18 8:41:06
// Last Version:        V1.0
// Descriptions:        SDRAM 命令控制模块
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/3/18 8:41:06
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module sdram_cmd(
    input             clk,              //系统时钟
    input             rst_n,            //低电平复位信号

    input      [23:0] sys_wraddr,       //写SDRAM时地址
    input      [23:0] sys_rdaddr,       //读SDRAM时地址
    input      [ 9:0] sdram_wr_burst,   //突发写SDRAM字节数
    input      [ 9:0] sdram_rd_burst,   //突发读SDRAM字节数
    
    input      [ 4:0] init_state,       //SDRAM初始化状态
    input      [ 3:0] work_state,       //SDRAM工作状态
    input      [ 9:0] cnt_clk,          //延时计数器 
    input             sdram_rd_wr,      //SDRAM读/写控制信号，低电平为写
    
    output            sdram_cke,        //SDRAM时钟有效信号
    output            sdram_cs_n,       //SDRAM片选信号
    output            sdram_ras_n,      //SDRAM行地址选通脉冲
    output            sdram_cas_n,      //SDRAM列地址选通脉冲
    output            sdram_we_n,       //SDRAM写允许位
    output reg [ 1:0] sdram_ba,         //SDRAM的L-Bank地址线
    output reg [12:0] sdram_addr        //SDRAM地址总线
    );

`include "sdram_para.v"                 //包含SDRAM参数定义模块

//reg define
reg  [ 4:0] sdram_cmd_r;                //SDRAM操作指令

//wire define
wire [23:0] sys_addr;                   //SDRAM读写地址 

//*****************************************************
//**                    main code
//***************************************************** 

//SDRAM 控制信号线赋值
assign {sdram_cke,sdram_cs_n,sdram_ras_n,sdram_cas_n,sdram_we_n} = sdram_cmd_r;

//SDRAM 读/写地址总线控制
assign sys_addr = sdram_rd_wr ? sys_rdaddr : sys_wraddr;
    
//SDRAM 操作指令控制
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
            sdram_cmd_r <= `CMD_INIT;
            sdram_ba    <= 2'b11;
            sdram_addr  <= 13'h1fff;
    end
    else
        case(init_state)
                                        //初始化过程中,以下状态不执行任何指令
            `I_NOP,`I_TRP,`I_TRF,`I_TRSC: begin
                    sdram_cmd_r <= `CMD_NOP;
                    sdram_ba    <= 2'b11;
                    sdram_addr  <= 13'h1fff;    
                end
            `I_PRE: begin               //预充电指令
                    sdram_cmd_r <= `CMD_PRGE;
                    sdram_ba    <= 2'b11;
                    sdram_addr  <= 13'h1fff;
                end 
            `I_AR: begin
                                        //自动刷新指令
                    sdram_cmd_r <= `CMD_A_REF;
                    sdram_ba    <= 2'b11;
                    sdram_addr  <= 13'h1fff;                        
                end                 
            `I_MRS: begin               //模式寄存器设置指令
                    sdram_cmd_r <= `CMD_LMR;
                    sdram_ba    <= 2'b00;
                    sdram_addr  <= {    //利用地址线设置模式寄存器,可根据实际需要进行修改
                        3'b000,         //预留
                        1'b0,           //读写方式 A9=0，突发读&突发写
                        2'b00,          //默认，{A8,A7}=00
                        3'b011,         //CAS潜伏期设置，这里设置为3，{A6,A5,A4}=011
                        1'b0,           //突发传输方式，这里设置为顺序，A3=0
                        3'b111          //突发长度，这里设置为页突发，{A2,A1,A0}=011
                    };
                end 
            `I_DONE:                    //SDRAM初始化完成
                    case(work_state)    //以下工作状态不执行任何指令
                        `W_IDLE,`W_TRCD,`W_CL,`W_TWR,`W_TRP,`W_TRFC: begin
                                sdram_cmd_r <= `CMD_NOP;
                                sdram_ba    <= 2'b11;
                                sdram_addr  <= 13'h1fff;
                            end
                        `W_ACTIVE: begin//行有效指令
                                sdram_cmd_r <= `CMD_ACTIVE;
                                sdram_ba    <= sys_addr[23:22];
                                sdram_addr  <= sys_addr[21:9];
                            end
                        `W_READ: begin  //读操作指令
                                sdram_cmd_r <= `CMD_READ;
                                sdram_ba    <= sys_addr[23:22];
                                sdram_addr  <= {4'b0000,sys_addr[8:0]};
                            end
                        `W_RD: begin    //突发传输终止指令
                                if(`end_rdburst) 
                                    sdram_cmd_r <= `CMD_B_STOP;
                                else begin
                                    sdram_cmd_r <= `CMD_NOP;
                                    sdram_ba    <= 2'b11;
                                    sdram_addr  <= 13'h1fff;
                                end
                            end                             
                        `W_WRITE: begin //写操作指令
                                sdram_cmd_r <= `CMD_WRITE;
                                sdram_ba    <= sys_addr[23:22];
                                sdram_addr  <= {4'b0000,sys_addr[8:0]};
                            end     
                        `W_WD: begin    //突发传输终止指令
                                if(`end_wrburst) 
                                    sdram_cmd_r <= `CMD_B_STOP;
                                else begin
                                    sdram_cmd_r <= `CMD_NOP;
                                    sdram_ba    <= 2'b11;
                                    sdram_addr  <= 13'h1fff;
                                end
                            end
                        `W_PRE:begin    //预充电指令
                                sdram_cmd_r <= `CMD_PRGE;
                                sdram_ba    <= sys_addr[23:22];
                                sdram_addr  <= 13'h0400;
                            end             
                        `W_AR: begin    //自动刷新指令
                                sdram_cmd_r <= `CMD_A_REF;
                                sdram_ba    <= 2'b11;
                                sdram_addr  <= 13'h1fff;
                            end
                        default: begin
                                sdram_cmd_r <= `CMD_NOP;
                                sdram_ba    <= 2'b11;
                                sdram_addr  <= 13'h1fff;
                            end
                    endcase
            default: begin
                    sdram_cmd_r <= `CMD_NOP;
                    sdram_ba    <= 2'b11;
                    sdram_addr  <= 13'h1fff;
                end
        endcase
end

endmodule 