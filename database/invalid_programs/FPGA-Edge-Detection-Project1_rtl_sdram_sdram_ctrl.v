//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                               
//----------------------------------------------------------------------------------------
// File name:           sdram_ctrl
// Last modified Date:  2018/3/18 8:41:06
// Last Version:        V1.0
// Descriptions:        SDRAM 状态控制模块
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/3/18 8:41:06
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module sdram_ctrl(
    input            clk,			    //系统时钟
    input            rst_n,			    //复位信号，低电平有效
    
    input            sdram_wr_req,	    //写SDRAM请求信号
    input            sdram_rd_req,	    //读SDRAM请求信号
    output           sdram_wr_ack,	    //写SDRAM响应信号
    output           sdram_rd_ack,	    //读SDRAM响应信号
    input      [9:0] sdram_wr_burst,	//突发写SDRAM字节数（1-512个）
    input      [9:0] sdram_rd_burst,	//突发读SDRAM字节数（1-256个）	
    output           sdram_init_done,   //SDRAM系统初始化完毕信号

    output reg [4:0] init_state,	    //SDRAM初始化状态
    output reg [3:0] work_state,	    //SDRAM工作状态
    output reg [9:0] cnt_clk,	        //时钟计数器
    output reg       sdram_rd_wr 		//SDRAM读/写控制信号，低电平为写，高电平为读
    );

`include "sdram_para.v"		            //包含SDRAM参数定义模块
                                        
//parameter define                      
parameter  TRP_CLK	  = 10'd4;	        //预充电有效周期
parameter  TRC_CLK	  = 10'd6;	        //自动刷新周期
parameter  TRSC_CLK	  = 10'd6;	        //模式寄存器设置时钟周期
parameter  TRCD_CLK	  = 10'd2;	        //行选通周期
parameter  TCL_CLK	  = 10'd3;	        //列潜伏期
parameter  TWR_CLK	  = 10'd2;	        //写入校正
                                        
//reg define                            
reg [14:0] cnt_200us;                   //SDRAM 上电稳定期200us计数器
reg [10:0] cnt_refresh;	                //刷新计数寄存器
reg        sdram_ref_req;		        //SDRAM 自动刷新请求信号
reg        cnt_rst_n;		            //延时计数器复位信号，低有效	
reg [ 3:0] init_ar_cnt;                 //初始化过程自动刷新计数器
                                        
//wire define                           
wire       done_200us;		            //上电后200us输入稳定期结束标志位
wire       sdram_ref_ack;		        //SDRAM自动刷新请求应答信号	

//*****************************************************
//**                    main code
//***************************************************** 

//SDRAM上电后200us稳定期结束后,将标志信号拉高
assign done_200us = (cnt_200us == 15'd20_000);

//SDRAM初始化完成标志 
assign sdram_init_done = (init_state == `I_DONE);

//SDRAM 自动刷新应答信号
assign sdram_ref_ack = (work_state == `W_AR);

//写SDRAM响应信号
assign sdram_wr_ack = ((work_state == `W_TRCD) & ~sdram_rd_wr) | 
					  ( work_state == `W_WRITE)|
					  ((work_state == `W_WD) & (cnt_clk < sdram_wr_burst - 2'd2));
                      
//读SDRAM响应信号
assign sdram_rd_ack = (work_state == `W_RD) & 
					  (cnt_clk >= 10'd1) & (cnt_clk < sdram_rd_burst + 2'd1);
                      
//上电后计时200us,等待SDRAM状态稳定
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) 
        cnt_200us <= 15'd0;
	else if(cnt_200us < 15'd20_000) 
        cnt_200us <= cnt_200us + 1'b1;
    else
        cnt_200us <= cnt_200us;
end
 
//刷新计数器循环计数7812ns (60ms内完成全部8192行刷新操作)
always @ (posedge clk or negedge rst_n)
	if(!rst_n) 
        cnt_refresh <= 11'd0;
	else if(cnt_refresh < 11'd781)      // 64ms/8192 =7812ns
        cnt_refresh <= cnt_refresh + 1'b1;	
	else 
        cnt_refresh <= 11'd0;	

//SDRAM 刷新请求
always @ (posedge clk or negedge rst_n)
	if(!rst_n) 
        sdram_ref_req <= 1'b0;
	else if(cnt_refresh == 11'd780) 
        sdram_ref_req <= 1'b1;	        //刷新计数器计时达7812ns时产生刷新请求
	else if(sdram_ref_ack) 
        sdram_ref_req <= 1'b0;		    //收到刷新请求响应信号后取消刷新请求 

//延时计数器对时钟计数
always @ (posedge clk or negedge rst_n) 
	if(!rst_n) 
        cnt_clk <= 10'd0;
	else if(!cnt_rst_n)                 //在cnt_rst_n为低电平时延时计数器清零
        cnt_clk <= 10'd0;
	else 
        cnt_clk <= cnt_clk + 1'b1;
        
//初始化过程中对自动刷新操作计数
always @ (posedge clk or negedge rst_n) 
	if(!rst_n) 
        init_ar_cnt <= 4'd0;
	else if(init_state == `I_NOP) 
        init_ar_cnt <= 4'd0;
	else if(init_state == `I_AR)
        init_ar_cnt <= init_ar_cnt + 1'b1;
    else
        init_ar_cnt <= init_ar_cnt;
	
//SDRAM的初始化状态机
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) 
        init_state <= `I_NOP;
	else 
		case (init_state)
                                        //上电复位后200us结束则进入下一状态
            `I_NOP:  init_state <= done_200us  ? `I_PRE : `I_NOP;
                                        //预充电状态
			`I_PRE:  init_state <= `I_TRP;
                                        //预充电等待，TRP_CLK个时钟周期
			`I_TRP:  init_state <= (`end_trp)  ? `I_AR  : `I_TRP;
                                        //自动刷新
			`I_AR :  init_state <= `I_TRF;	
                                        //等待自动刷新结束,TRC_CLK个时钟周期
			`I_TRF:  init_state <= (`end_trfc) ? 
                                        //连续8次自动刷新操作
                                   ((init_ar_cnt == 4'd8) ? `I_MRS : `I_AR) : `I_TRF;
                                        //模式寄存器设置
			`I_MRS:	 init_state <= `I_TRSC;	
                                        //等待模式寄存器设置完成，TRSC_CLK个时钟周期
			`I_TRSC: init_state <= (`end_trsc) ? `I_DONE : `I_TRSC;
                                        //SDRAM的初始化设置完成标志
			`I_DONE: init_state <= `I_DONE;
			default: init_state <= `I_NOP;
		endcase
end

//SDRAM的工作状态机,工作包括读、写以及自动刷新操作
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) 
		work_state <= `W_IDLE;          //空闲状态
	else
		case(work_state)
                                        //定时自动刷新请求，跳转到自动刷新状态
            `W_IDLE: if(sdram_ref_req & sdram_init_done) begin
						 work_state <= `W_AR; 		
					     sdram_rd_wr <= 1'b1;
				     end 		        
                                        //写SDRAM请求，跳转到行有效状态
					 else if(sdram_wr_req & sdram_init_done) begin
						 work_state <= `W_ACTIVE;
						 sdram_rd_wr <= 1'b0;	
					 end                
                                        //读SDRAM请求，跳转到行有效状态
					 else if(sdram_rd_req && sdram_init_done) begin
						 work_state <= `W_ACTIVE;
						 sdram_rd_wr <= 1'b1;	
					 end                
                                        //无操作请求，保持空闲状态
					 else begin 
						 work_state <= `W_IDLE;
						 sdram_rd_wr <= 1'b1;
					 end
                     
            `W_ACTIVE:                  //行有效，跳转到行有效等待状态
                         work_state <= `W_TRCD;
            `W_TRCD: if(`end_trcd)      //行有效等待结束，判断当前是读还是写
						 if(sdram_rd_wr)//读：进入读操作状态
                             work_state <= `W_READ;
						 else           //写：进入写操作状态
                             work_state <= `W_WRITE;
					 else 
                         work_state <= `W_TRCD;
                         
            `W_READ:	                //读操作，跳转到潜伏期
                         work_state <= `W_CL;	
            `W_CL:		                //潜伏期：等待潜伏期结束，跳转到读数据状态
                         work_state <= (`end_tcl) ? `W_RD:`W_CL;	                                        
            `W_RD:		                //读数据：等待读数据结束，跳转到预充电状态
                         work_state <= (`end_tread) ? `W_PRE:`W_RD;
                         
            `W_WRITE:	                //写操作：跳转到写数据状态
                         work_state <= `W_WD;
            `W_WD:		                //写数据：等待写数据结束，跳转到写回周期状态
                         work_state <= (`end_twrite) ? `W_TWR:`W_WD;                         
            `W_TWR:	                    //写回周期：写回周期结束，跳转到预充电状态
                         work_state <= (`end_twr) ? `W_PRE:`W_TWR;
                         
            `W_PRE:		                //预充电：跳转到预充电等待状态
                         work_state <= `W_TRP;
            `W_TRP:	                //预充电等待：预充电等待结束，进入空闲状态
                         work_state <= (`end_trp) ? `W_IDLE:`W_TRP;
                         
            `W_AR:		                //自动刷新操作，跳转到自动刷新等待
                         work_state <= `W_TRFC;             
            `W_TRFC:	                //自动刷新等待：自动刷新等待结束，进入空闲状态
                         work_state <= (`end_trfc) ? `W_IDLE:`W_TRFC;
            default: 	 work_state <= `W_IDLE;
		endcase
end

//计数器控制逻辑
always @ (*) begin
	case (init_state)
        `I_NOP:	 cnt_rst_n <= 1'b0;     //延时计数器清零(cnt_rst_n低电平复位)
                                        
        `I_PRE:	 cnt_rst_n <= 1'b1;     //预充电：延时计数器启动(cnt_rst_n高电平启动)
                                        //等待预充电延时计数结束后，清零计数器
        `I_TRP:	 cnt_rst_n <= (`end_trp) ? 1'b0 : 1'b1;
                                        //自动刷新：延时计数器启动
        `I_AR:
                 cnt_rst_n <= 1'b1;
                                        //等待自动刷新延时计数结束后，清零计数器
        `I_TRF:
                 cnt_rst_n <= (`end_trfc) ? 1'b0 : 1'b1;	
                                        
        `I_MRS:  cnt_rst_n <= 1'b1;	    //模式寄存器设置：延时计数器启动
                                        //等待模式寄存器设置延时计数结束后，清零计数器
        `I_TRSC: cnt_rst_n <= (`end_trsc) ? 1'b0:1'b1;
                                        
        `I_DONE: begin                  //初始化完成后,判断工作状态
		    case (work_state)
				`W_IDLE:	cnt_rst_n <= 1'b0;
                                        //行有效：延时计数器启动
				`W_ACTIVE: 	cnt_rst_n <= 1'b1;
                                        //行有效延时计数结束后，清零计数器
				`W_TRCD:	cnt_rst_n <= (`end_trcd)   ? 1'b0 : 1'b1;
                                        //潜伏期延时计数结束后，清零计数器
				`W_CL:		cnt_rst_n <= (`end_tcl)    ? 1'b0 : 1'b1;
                                        //读数据延时计数结束后，清零计数器
				`W_RD:		cnt_rst_n <= (`end_tread)  ? 1'b0 : 1'b1;
                                        //写数据延时计数结束后，清零计数器
				`W_WD:		cnt_rst_n <= (`end_twrite) ? 1'b0 : 1'b1;
                                        //写回周期延时计数结束后，清零计数器
				`W_TWR:	    cnt_rst_n <= (`end_twr)    ? 1'b0 : 1'b1;
                                        //预充电等待延时计数结束后，清零计数器
				`W_TRP:	cnt_rst_n <= (`end_trp) ? 1'b0 : 1'b1;
                                        //自动刷新等待延时计数结束后，清零计数器
				`W_TRFC:	cnt_rst_n <= (`end_trfc)   ? 1'b0 : 1'b1;
				default:    cnt_rst_n <= 1'b0;
		    endcase
        end
		default: cnt_rst_n <= 1'b0;
	endcase
end
 
endmodule 