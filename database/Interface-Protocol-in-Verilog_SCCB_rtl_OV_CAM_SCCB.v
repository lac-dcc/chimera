// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Author: halftop
// Github: https://github.com/halftop
// Email: yu.zh@live.com
// Description: 
// Dependencies: 
// Since: 2019-08-02 10:48:19
// LastEditors: halftop
// LastEditTime: 2019-08-02 10:48:19
// ********************************************************************
// Module Function:
`timescale 1ns / 1ps
//`define DOUBLE_WIDTH_REG
module OV_CAM_SCCB
#(
	parameter SYS_CLOCK = 50_000_000,	//系统时钟默认采用50MHz
    parameter SCL_CLOCK = 200_000		//scl总线时钟默认采用200kHz
)
(
    input					clk		,   //系统时钟
    input					rst_n	,   //异步复位信号
    input					iic_en	,   //使能信号
    input		[7:0]		devaddr	,   //器件选择地址
    input		[7:0]		regaddr	,   //reg地址
    input		[7:0]		wrdata	,   //写数据
    output reg	[7:0]		rddata	,	//读数据
    output reg 				scl		,   //IIC时钟信号
    inout 					sda		,	//IIC数据总线
    output reg 				done	,	//一次IIC读写完成
    //debug
    output reg             sda_en
);
    
    //状态
`ifdef SIMULATION
    localparam 
        Idle      = "Idle    ",
        Wr_start  = "Wr_start",
        Wr_ctrl   = "Wr_ctrl ",
        Ack1      = "Ack1    ",
        Wr_addr1  = "Wr_addr1",
        Ack2      = "Ack2    ",
        Wr_addr2  = "Wr_addr2",
        Ack3      = "Ack3    ",
        Wr_data   = "Wr_data ",
        Ack4      = "Ack4    ",
        Rd_start  = "Rd_start",
        Rd_ctrl   = "Rd_ctrl ",
        Ack5      = "Ack5    ",
        Rd_data   = "Rd_data ",
        Nack      = "Nack    ",
        Stop      = "Stop    ";
localparam	MAX_WD = 128;
`else
    localparam 
        Idle      = 16'b0000_0000_0000_0001,
        Wr_start  = 16'b0000_0000_0000_0010,
        Wr_ctrl   = 16'b0000_0000_0000_0100,
        Ack1      = 16'b0000_0000_0000_1000,
        Wr_addr1  = 16'b0000_0000_0001_0000,
        Ack2      = 16'b0000_0000_0010_0000,
        Wr_addr2  = 16'b0000_0000_0100_0000,
        Ack3      = 16'b0000_0000_1000_0000,
        Wr_data   = 16'b0000_0001_0000_0000,
        Ack4      = 16'b0000_0010_0000_0000,
        Rd_start  = 16'b0000_0100_0000_0000,
        Rd_ctrl   = 16'b0000_1000_0000_0000,
        Ack5      = 16'b0001_0000_0000_0000,
        Rd_data   = 16'b0010_0000_0000_0000,
        Nack      = 16'b0100_0000_0000_0000,
        Stop      = 16'b1000_0000_0000_0000;
localparam	MAX_WD = 16;
`endif
        
    //sda数据总线控制位
    //reg sda_en;
    
    //sda数据输出寄存器
    reg sda_reg;
    
    assign sda = sda_en ? sda_reg : 1'bz;
        
    //状态寄存器
    reg [MAX_WD-1:0]state;
    
    //读写数据标志位
    reg W_flag;
    reg R_flag;
    
    //写数据到sda总线缓存器
    reg [7:0]sda_data_out;
    reg [7:0]sda_data_in;
    reg [3:0]bit_cnt;
        
    
    localparam SCL_CNT_M = SYS_CLOCK/SCL_CLOCK;  //计数最大值
    reg [log2(SCL_CNT_M)-1:0]scl_cnt;
    reg scl_cnt_state;
    
    //产生SCL时钟状态标志scl_cnt_state，为1表示IIC总线忙，为0表示总线闲
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            scl_cnt_state <= 1'b0;
        else if(iic_en)
            scl_cnt_state <= 1'b1;
        else if(done)
            scl_cnt_state <= 1'b0;
        else
            scl_cnt_state <= scl_cnt_state;
    end
    
    //scl时钟总线产生计数器
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            scl_cnt <= 8'b0;
        else if(scl_cnt_state)
        begin
            if(scl_cnt == SCL_CNT_M - 1)
                scl_cnt <= 8'b0;
            else
                scl_cnt <= scl_cnt + 8'b1;
        end
        else
            scl_cnt <= 8'b0;
    end
    
    //scl时钟总线产生
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            scl <= 1'b1;
        else if(scl_cnt == (SCL_CNT_M>>1)-1)
            scl <= 1'b0;
        else if(scl_cnt == SCL_CNT_M - 1)
            scl <= 1'b1;
        else
            scl <= scl;
    end
    
    //scl时钟电平中部标志位
    reg scl_high;
    reg scl_low;
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            scl_high <= 1'b0;
            scl_low  <= 1'b0;
        end         
        else if(scl_cnt == (SCL_CNT_M>>2))
            scl_high <= 1'b1;
        else if(scl_cnt == (SCL_CNT_M>>1)+(SCL_CNT_M>>2))
            scl_low  <= 1'b1;
        else
        begin
            scl_high <= 1'b0;
            scl_low  <= 1'b0;       
        end
    end 
    
    //状态机
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            state <= Idle;
            sda_en <= 1'b0;
            sda_reg <= 1'b1;
            W_flag <= 1'b0;
            R_flag <= 1'b0;         
            done <= 1'b0;
        end
        else        
        case(state)
            Idle:
            begin   
                done <= 1'b0;
                W_flag <= 1'b0;       
                R_flag <= 1'b0;
                sda_en <= 1'b0;         
                sda_reg <= 1'b1;
				if (iic_en) begin
					sda_en <= 1'b1;     //设置SDA为输出模式
					sda_reg <= 1'b1;    //SDA输出高电平
					state <= Wr_start;  //跳转到起始状态
				end else begin
					state <= Idle;
				end            
            end         
            
            Wr_start:
            begin
                if(scl_high)
                begin
                    sda_reg <= 1'b0;
                    state <= Wr_ctrl;
                    sda_data_out <= devaddr;  
                    bit_cnt <= 4'd8;
					if (devaddr[0]) begin
						W_flag <= 1'b0;
						R_flag <= 1'b1;
					end else begin
						W_flag <= 1'b1;
						R_flag <= 1'b0;
					end
                end
                else
                begin
                    sda_reg <= 1'b1;
                    state <= Wr_start;
                end 
            end
            
            Wr_ctrl:    
            begin
                if(scl_low)
                begin
                    bit_cnt <= bit_cnt -4'b1;
                    sda_reg <= sda_data_out[7];
                    sda_data_out <= {sda_data_out[6:0],1'b0};
                    if(bit_cnt == 0)
                    begin
                        state <= Ack1;
                        sda_en <= 1'b0;
                    end
                    else 
                        state <= Wr_ctrl;                   
                end
                else
                    state <= Wr_ctrl;   
            end
            
            Ack1:      //don't care bit
            begin               
                if(scl_high)
                    // if(sda == 1'b0)
                    begin
                        state <= Wr_addr1;                      
                        sda_data_out <= regaddr;
                        bit_cnt <= 4'd8;
                    end
                    /* else
                        state <= Idle; */
                else
                    state <= Ack1;                  
            end
            
            Wr_addr1:  
            begin
                if(scl_low)
                begin
                    sda_en <= 1'b1;
                    bit_cnt <= bit_cnt -4'b1;
                    sda_reg <= sda_data_out[7];
                    sda_data_out <= {sda_data_out[6:0],1'b0};
                    if(bit_cnt == 0)
                    begin
                        state <= Ack2;                      
                        sda_en <= 1'b0;                     
                    end
                    else 
                        state <= Wr_addr1;                  
                end
                else
                    state <= Wr_addr1;
            end
            
            Ack2:   //don't care bit
/*             begin               
                if(scl_high)
                    if(sda == 1'b0)
                    begin
                        state <= Wr_addr2;
                        sda_data_out <= regaddr[7:0];
                        bit_cnt <= 4'd8;
                    end
                    else
                        state <= Idle;
                else
                    state <= Ack2;                  
            end */
			begin                   
                if(scl_high)
                    // if(sda == 1'b0)  //有响应就判断是读还是写操作
                    begin                           
                        if(W_flag)        //如果是写数据操作，进入写数据状态
                        begin                           
                            sda_data_out <= wrdata;
                            bit_cnt <= 4'd8;
                            state <= Wr_data;
                        end
                        else if(R_flag)  //如果是读数据操作，进入读数据开始状态
                        begin
                            state <= Rd_start;
                            sda_reg <= 1'b1;
                        end
                    end
                    /* else
                        state <= Idle; */
                else
                    state <= Ack2;              
            end
            
            Wr_addr2:  //写2字节地址中的低地址字节
            begin
                if(scl_low)
                begin
                    sda_en <= 1'b1;
                    bit_cnt <= bit_cnt -4'b1;
                    sda_reg <= sda_data_out[7];
                    sda_data_out <= {sda_data_out[6:0],1'b0};
                    if(bit_cnt == 0)
                    begin
                        state <= Ack3;                      
                        sda_en <= 1'b0;                     
                    end
                    else 
                        state <= Wr_addr2;                  
                end
                else
                    state <= Wr_addr2;
            end
            
            Ack3:  //don't care bit
            begin                   
                if(scl_high)
                    //if(sda == 1'b0)  //有响应就判断是读还是写操作
                    begin                           
                        if(W_flag)        //如果是写数据操作，进入写数据状态
                        begin                           
                            sda_data_out <= wrdata;
                            bit_cnt <= 4'd8;
                            state <= Wr_data;
                        end
                        else if(R_flag)  //如果是读数据操作，进入读数据开始状态
                        begin
                            state <= Rd_start;
                            sda_reg <= 1'b1;
                        end
                    end
                    /* else
                        state <= Idle; */
                else
                    state <= Ack3;              
            end
            
            Wr_data:         //写数据状态
            begin           
                if(scl_low)
                begin
                    sda_en <= 1'b1;
                    bit_cnt <= bit_cnt -4'b1;
                    sda_reg <= sda_data_out[7];
                    sda_data_out <= {sda_data_out[6:0],1'b0};
                    if(bit_cnt == 0)
                    begin
                        state <= Ack4;
                        sda_en <= 1'b0;
                    end
                    else 
                        state <= Wr_data;                   
                end
                else
                    state <= Wr_data;
            end         
            
            Ack4:   //don't care bit
            begin
                if(scl_high)
                    // if(sda == 1'b0)    //有响应就进入停止状态
                    begin
                        sda_reg <= 1'b0;
                        state <= Stop;                                              
                    end
                    /* else
                        state <= Idle; */
                else
                    state <= Ack4;
            end
            
            Rd_start:    //读数据的开始操作       
            begin
                if(scl_low)
                begin
                    sda_en <= 1'b1;
                end
                else if(scl_high)
                begin
                    sda_reg <= 1'b0;
                    state <= Rd_ctrl;
                    sda_data_out <= devaddr;
                    bit_cnt <= 4'd8;
                end
                else
                begin
                    sda_reg <= 1'b1;
                    state <= Rd_start;
                end 
            end
            
            
            Rd_ctrl:      //   
            begin
                if(scl_low)
                begin
                    bit_cnt <= bit_cnt -4'b1;
                    sda_reg <= sda_data_out[7];
                    sda_data_out <= {sda_data_out[6:0],1'b0};
                    if(bit_cnt == 0)
                    begin
                        state <= Ack5;
                        sda_en <= 1'b0;
                    end
                    else 
                        state <= Rd_ctrl;                   
                end
                else
                    state <= Rd_ctrl;   
            end         
            
            Ack5:     //don't care bit     
            begin               
                if(scl_high)
                    //if(sda == 1'b0)   //有响应就进入读数据状态
                    begin
                        state <= Rd_data;
                        sda_en <= 1'b0;   //SDA总线设置为3态输入
                        bit_cnt <= 4'd8;
                    end
                    /* else
                        state <= Idle; */
                else
                    state <= Ack5;                  
            end     
            
            Rd_data:          //读数据状态
            begin
                if(scl_high)  //在时钟高电平读取数据
                begin
                    sda_data_in <= {sda_data_in[6:0],sda};
                    bit_cnt <= bit_cnt - 4'd1;
                    state <= Rd_data;
                end
                else if(scl_low && bit_cnt == 0) //数据接收完成进入无应答响应状态
                begin
                    state <= Nack;                  
                end
                else
                    state <= Rd_data;                   
            end
            
            Nack:   //不做应答响应
            begin
                rddata <= sda_data_in;
                sda_en <= 1'b1;
                sda_reg <= 1'b1;
                if(scl_high)
                begin
                    state <= Stop;  
                end
                else
                    state <= Nack;          
            end
            
            Stop:   //停止操作，在时钟高电平，SDA上升沿
            begin
                if(scl_low)
                begin
                    sda_en <= 1'b1;
                    sda_reg <= 1'b0;                 
                end             
                else if(scl_high)
                begin
                    sda_en <= 1'b1;
                    sda_reg <= 1'b1;                
                    state <= Idle;
                    done <= 1'b1;
                end             
                else
                    state <= Stop;
            end
    
            default:
            begin
                state <= Idle;
                sda_en <= 1'b0;
                sda_reg <= 1'b1;
                W_flag <= 1'b0;
                R_flag <= 1'b0;
                done <= 1'b0;
            end     
        endcase     
    end 

function integer log2(input integer v);
  begin
	log2=0;
	while(v>>log2) 
	  log2=log2+1;
  end
endfunction
endmodule 