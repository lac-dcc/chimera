// This program was cloned from: https://github.com/Mavvenger/Matrix_Multiplication_Hardwre_Accelerator_with_Fault_Tolerance_Logic
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/18 12:35:36
// Design Name: 
// Module Name: FSM_for_Baseline_with_Fault_Tolerance_Logic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//连续赋值语句assign的左值必须是线网类型
//过程赋值语句(阻塞=，非阻塞<=，常在initial和always中使用)的对象是寄存器，整数，实数或时间变量，不能是线网数据类型
//过程赋值语句（阻塞=）在initial块中常用
//时序电路中，clk视为各动作的指挥棒，通常设置一些内部寄存器型变量或外部输入信号屏蔽某个时间的clk指挥棒，达到控制的作用
//always块的触发条件是边沿触发时，非阻塞赋值符的左值在信号沿之后改变，在条件判断处的信号值使用的是信号沿之前的旧值，并且多个always块并行执行（为常见的硬件电路行为建立模型，一个事件发生后，多个数据并发传输的行为），这就是Verilog设计中基本的时序理解
//always@(*)表示对其后语句块中的所有输入变量的变化是敏感的（注意这里的描述，不是所有模块端口信号，故而在tb中也可使用）
//现在前端RTL级时序分析能力，设计能力(注意不要多个always块驱动一个变量），验证能力已经登堂入室
module FSM_for_Baseline_with_Fault_Tolerance_Logic(
    //input ports
    input clk,
    input rst_n, //rst_n低有效，这里的其它输入信号都是高有效
    //来自testbench
    input start,
    input store_C_ready,
    //来自MACs
    input MACs_ready,
    //来自校验和产生模块
    input fetch_A_ready,
    input fetch_B_ready,
    input [2:0] full,
    //来自循环移位器模块
    input shift_ready,
    //来自校验和验证模块
    input [32:0] column_indicator, //没用到
    input error,
    input column_verify_ready,  //没用到
    
    // output ports
    //校验和产生模块
    output [1:0] detect_correct,
    output generate_enable,
    output fetch_A,
    output fetch_B,
    //循环移位器模块
    output shift_enable,
    output shift_direction,
    output [5:0] step_size,
    output direct_connection,
    //校验和验证模块
    output verify_enable,
    //MACs模块
    output MACs_enable,
    //给到testbench
    output store_C,
    output finish
    );
    //////////////////////////////变量定义/////////////////////////////////
    ////////////内部寄存器变量/////////////////////////////////////////////
    ////存数据//////////////////////////////////////////////////////////////
    
    ////现态和次态寄存器///////////////////////////////////////////////////////////
    reg [9:0] state,
              next_state;
    ////状态编码///////////////////////////////////////////////////////////
    //根据状态机个数确定状态机编码,使用OneHot编码，多消耗一些面积，实现状态切换时的最低延迟
    parameter   IDLE = 10'b00000_00001,
                Buffer_row_A = 10'b00000_00010,
                Multiply_accumulate = 10'b00000_00100,
                Write_row_C =10'b00000_01000,
                Buffer_row_A_Correct1 = 10'b00000_10000,
                Multiply_Accumulate_Correct1 = 10'b00001_00000,
                Write_row_C_Correct1 = 10'b00010_00000,
                Buffer_row_A_Correct2 = 10'b00100_00000,
                Multiply_Accumulate_Correct2 = 10'b01000_00000,
                Write_row_C_Correct2 = 10'b10000_00000;
    ////计数器/////////////////////////////////////////////////////////////

    ///////////连接到输出端口的寄存器型变量/////////////////////////////////
    reg [1:0] O_detect_correct;
    reg [5:0] O_step_size;
    reg O_generate_enable,
        O_fetch_A,
        O_fetch_B,
        O_shift_enable,
        O_shift_direction,
        O_direct_connection,
        O_verify_enable,
        O_MACs_enable,
        O_store_C,
        O_finish;

    ///////////////////////////////////状态机控制逻辑：三段式写法///////////////////////////////////////////////////////////////////
    //第一段，时序逻辑，非阻塞赋值，传递寄存器状态
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end
    //第二段，组合逻辑，阻塞赋值，根据当前状态和当前输入，确定下一个状态机状态
    always@(*) begin
      case(state)
        IDLE: 
            next_state = (start) ? Buffer_row_A : IDLE;
        Buffer_row_A:
            if(fetch_A_ready == 1'b1) begin
                next_state = Multiply_accumulate;
            end else begin
                next_state = Buffer_row_A;
            end
            // next_state = (fetch_A_ready) ? Multiply_accumulate : Buffer_row_A;
        Multiply_accumulate:
            if(MACs_ready&&fetch_B_ready&&shift_ready == 1'b1) begin
                next_state = Write_row_C;
            end else begin
                next_state = Multiply_accumulate;
            end
            // next_state = (MACs_ready&&fetch_B_ready) ? Write_row_C : Multiply_accumulate;
        Write_row_C:
            next_state = (!store_C_ready) ? Write_row_C : ((~(full[2:0]==3'd1)) ? Buffer_row_A : ((~error) ? IDLE : Buffer_row_A_Correct1));
        Buffer_row_A_Correct1:
            next_state = (fetch_A_ready) ? Multiply_Accumulate_Correct1 : Buffer_row_A_Correct1;
        Multiply_Accumulate_Correct1:
            next_state = (MACs_ready&&fetch_B_ready&&shift_ready) ? Write_row_C_Correct1 : Multiply_Accumulate_Correct1;
        Write_row_C_Correct1:
            next_state = (!store_C_ready) ? Write_row_C_Correct1 : ((~(full[2:0]==3'd2)) ? Buffer_row_A_Correct1 : Buffer_row_A_Correct2);
        Buffer_row_A_Correct2:
            next_state = (!fetch_A_ready) ? Buffer_row_A_Correct2 : Multiply_Accumulate_Correct2;
        Multiply_Accumulate_Correct2:
            next_state = (MACs_ready&&fetch_B_ready&&shift_ready) ? Write_row_C_Correct2 : Multiply_Accumulate_Correct2;
        Write_row_C_Correct2:
            next_state = (!store_C_ready) ? Write_row_C_Correct2 : ((~(full[2:0]==3'd4)) ? Buffer_row_A_Correct2 : IDLE);
        default:
            next_state = IDLE;
      endcase
    end
    //第三段，时序逻辑，非阻塞赋值，根据当前状态和当前输入，确定输出信号
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n)begin //进入IDLE状态
            //校验和产生模块
            O_detect_correct <= 2'd0;
            O_generate_enable <= 1'd0;
            O_fetch_A <= 1'd0;
            O_fetch_B <= 1'd0;
            //循环移位器模块
            O_shift_enable <= 1'd0;
            O_shift_direction <= 1'd0;
            O_step_size <= 6'd0;
            O_direct_connection <= 1'd0;
            //校验和验证模块
            O_verify_enable <= 1'd0;
            //MACs模块
            O_MACs_enable <= 1'd0;
            //给到testbench
            O_store_C <= 1'd0;
            O_finish <= 1'd0;
        end
        else begin
          case(state) //在时钟上升沿，状态寄存器state的值需要刷新，但在执行case(state)语句时，state仍使用旧值，这符合状态机跳转到新状态后输出值刷新这一特点，即这些输出信号是状态机跳转到新状态的输出信号值
                IDLE: //这一点是前端RTL级时序分析中可以说是最重要的一点
                    begin
                      if(start)begin //在添加容错逻辑的状态机设计中，缓冲矩阵A的对应行和取矩阵B的各行乘累加都需要使能校验和产生模块，这两个过程在校验和产生模块分时进行，MACs模块的数据端口A输入就是通过校验和产生模块的一个mux输出，输入是mux_sel信号
                          //校验和产生模块
                            O_detect_correct <= 2'd1;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd1;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end
                      else begin //进入IDLE状态
                            //校验和产生模块
                            O_detect_correct <= 2'd0;
                            O_generate_enable <= 1'd0;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd0;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end
                    end
                Buffer_row_A:
                    begin
                      if(fetch_A_ready)begin   //进入Multiply_accumulate状态
                            //校验和产生模块
                            O_detect_correct <= 2'd1;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd1;
                            //循环移位器模块
                            O_shift_enable <= 1'd1;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd1;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end
                      else begin    //进入Buffer_row_A状态
                            //校验和产生模块
                            O_detect_correct <= 2'd1;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd1;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end
                    end
                Multiply_accumulate:
                    begin
                      if(MACs_ready&&fetch_B_ready&&shift_ready)begin  //进入Write_row_C状态
                            //校验和产生模块
                            O_detect_correct <= 2'd1;
                            O_generate_enable <= 1'd0;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd1;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd1;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd1;
                            O_finish <= 1'd0;
                      end
                      else begin            //进入Multiply_accumulate状态
                            //校验和产生模块
                            O_detect_correct <= 2'd1;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd1;
                            //循环移位器模块
                            O_shift_enable <= 1'd1;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd1;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end
                    end
                Write_row_C:
                    begin
                      if(!store_C_ready)begin //仍然回到Write_row_C这个状态
                            //校验和产生模块
                            O_detect_correct <= 2'd1;
                            O_generate_enable <= 1'd0;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd1;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd1;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd1;
                            O_finish <= 1'd0;
                      end
                      else if(store_C_ready&&~(full==3'd1)) begin//跳转到Buffer_row_A状态
                            //校验和产生模块
                            O_detect_correct <= 2'd1;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd1;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end
                      else if(store_C_ready&&(full==3'd1)&&~error) begin//跳转到IDLE状态
                            //校验和产生模块
                            O_detect_correct <= 2'd0;
                            O_generate_enable <= 1'd0;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd0;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd1;
                      end
                      else if(store_C_ready&&(full==3'd1)&&error) begin //进入Buffer_row_A_Correct1状态
                            //校验和产生模块
                            O_detect_correct <= 2'd2;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd1;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end
                    end
                Buffer_row_A_Correct1:
                    begin
                      if(!fetch_A_ready) begin    //回到Buffer_row_A_Correct1状态
                            //校验和产生模块
                            O_detect_correct <= 2'd2;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd1;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end else begin          //进入Multiply_Accumulate_Correct1状态
                            //校验和产生模块
                            O_detect_correct <= 2'd2;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd1;
                            //循环移位器模块
                            O_shift_enable <= 1'd1;
                            O_shift_direction <= 1'd1;//给到下循环移位器模块，连接反向器再给到上循环移位器模块
                            O_step_size <= 6'd1;//由于是单故障，所以移位步长只是1，双故障另当别论
                            O_direct_connection <= 1'd0;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd1;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end
                    end  
                Multiply_Accumulate_Correct1:
                    begin
                      if(MACs_ready&&fetch_B_ready&&shift_ready)begin    //进入Write_row_C_Correct1状态
                            //校验和产生模块
                            O_detect_correct <= 2'd2;
                            O_generate_enable <= 1'd0;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd0;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd1;
                            O_finish <= 1'd0;
                      end
                      else begin    //回到Multiply_Accumulate_Correct1状态
                            //校验和产生模块
                            O_detect_correct <= 2'd2;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd1;
                            //循环移位器模块
                            O_shift_enable <= 1'd1;
                            O_shift_direction <= 1'd1;//给到下循环移位器模块，连接反向器再给到上循环移位器模块
                            O_step_size <= 6'd1;//由于是单故障，所以移位步长只是1，双故障另当别论
                            O_direct_connection <= 1'd0;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd1;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end
                    end
                Write_row_C_Correct1:
                    begin
                      if(!store_C_ready) begin     //回到Write_row_C_Correct1状态
                            //校验和产生模块
                            O_detect_correct <= 2'd2;
                            O_generate_enable <= 1'd0;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd0;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd1;
                            O_finish <= 1'd0;
                      end else if(store_C_ready&&~(full==3'd2)) begin   //进入Buffer_row_A_Correct1状态
                            //校验和产生模块
                            O_detect_correct <= 2'd2;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd1;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end else if(store_C_ready&&(full==3'd2)) begin //目前来看，这里输出信号和Buffer_row_A_Correct1状态一样，但是状态名不一样，就拿循环移位器的循环移位方向信号来说，这两个状态不一样
                            //校验和产生模块                          //进入Buffer_row_A_Correct2状态
                            O_detect_correct <= 2'd3;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd1;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end
                    end
                Buffer_row_A_Correct2:
                    begin
                      if(!fetch_A_ready) begin   //进入Buffer_row_A_Correct2状态
                            //校验和产生模块    
                            O_detect_correct <= 2'd3;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd1;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end else begin       //进入Multiply_Accumulate_Correct2状态
                            //校验和产生模块    
                            O_detect_correct <= 2'd3;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd1;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd1;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end
                    end
                Multiply_Accumulate_Correct2:
                    begin
                      if(fetch_B_ready&&MACs_ready&&shift_ready) begin //进入Write_row_C_Correct2状态
                            //校验和产生模块    
                            O_detect_correct <= 2'd3;
                            O_generate_enable <= 1'd0;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd0;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd1;
                            O_finish <= 1'd0;
                      end else begin  //返回Multiply_Accumulate_Correct2状态
                            //校验和产生模块    
                            O_detect_correct <= 2'd3;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd1;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd1;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end 
                    end
                Write_row_C_Correct2:
                    begin
                      if(!store_C_ready) begin //进入Write_row_C_Correct2状态
                            //校验和产生模块    
                            O_detect_correct <= 2'd3;
                            O_generate_enable <= 1'd0;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd1;
                            O_finish <= 1'd0;
                      end else if(store_C_ready&&~(full==3'd4)) begin //进入Buffer_row_A_Correct2状态
                            //校验和产生模块    
                            O_detect_correct <= 2'd3;
                            O_generate_enable <= 1'd1;
                            O_fetch_A <= 1'd1;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd1;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                      end else if(store_C_ready&&(full==3'd4)) begin //进入IDLE状态
                            //校验和产生模块
                            O_detect_correct <= 2'd0;
                            O_generate_enable <= 1'd0;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd0;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd1;
                      end
                    end
              default :
                    begin //进入IDLE状态
                            //校验和产生模块
                            O_detect_correct <= 2'd0;
                            O_generate_enable <= 1'd0;
                            O_fetch_A <= 1'd0;
                            O_fetch_B <= 1'd0;
                            //循环移位器模块
                            O_shift_enable <= 1'd0;
                            O_shift_direction <= 1'd0;
                            O_step_size <= 6'd0;
                            O_direct_connection <= 1'd0;
                            //校验和验证模块
                            O_verify_enable <= 1'd0;
                            //MACs模块
                            O_MACs_enable <= 1'd0;
                            //给到testbench
                            O_store_C <= 1'd0;
                            O_finish <= 1'd0;
                    end
          endcase
        end
    end
    
    assign  detect_correct = O_detect_correct,
            generate_enable = O_generate_enable,
            fetch_A = O_fetch_A,
            fetch_B = O_fetch_B,
            
            shift_enable = O_shift_enable,
            shift_direction = O_shift_direction,
            step_size = O_step_size,
            direct_connection = O_direct_connection,

            verify_enable = O_verify_enable,

            MACs_enable = O_MACs_enable,

            store_C = O_store_C,
            finish = O_finish;
endmodule
