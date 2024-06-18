// This program was cloned from: https://github.com/Mavvenger/Matrix_Multiplication_Hardwre_Accelerator_with_Fault_Tolerance_Logic
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/16 13:13:12
// Design Name: 
// Module Name: Circular_Shifter
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

//这个模块是故障纠正的主要功能实现单元，受到状态机模块的控制
module Circular_Shifter(
    input [1055:0] dataBr_Cf_in, // 行编码矩阵Br的对应行输入
    input shift_direction, // 移位方向控制信号,1左移，0右移
    input [5:0] step_size, // 循环移位步长信号
    input clk, // 时钟
    //input rst_n, // 复位
    input shift_enable, // 使能,要求在使能信号拉高后的第一个时钟上升沿，shift_ready信号拉低
    input direct_connection,//1表示输入输出端口直接连接，0表示进行移位操作

    output [1055:0] dataBr_Cf_out, // 行编码矩阵Br移位后对应行的输出
    output shift_ready // 行编码矩阵Br对应行移位完成，dataBr_out[1055:0]端口数据有效信号
    );
    //////////////////////////////变量定义/////////////////////////////////
    ////////////内部寄存器变量/////////////////////////////////////////////
    ////存数据//////////////////////////////////////////////////////////////
    reg [31:0] I_dataBr_Cf_in [32:0];

    ////存标志位///////////////////////////////////////////////////////////
    reg shift_enable_last,  //实现shift_enable信号拉高后的第一个时钟上升沿，shift_ready信号拉低的代码,同步复位功能
        shift_enable_rising_edge;
    reg direct_connection_last,
        direct_connection_rising_edge;
    ////控制这两个信号上升沿复位之后移位功能延迟的计数器
    reg rising_edge_last_shift_enable;
        // rising_edge_rising_edge_shife_enable;
    reg rising_edge_last_direct_connection;
        // rising_edge_rising_edge_direct_connection;
    reg flag_control_ready_delay;//值为1时，开始控制shift_ready信号拉高时间，预期5个时钟周期自动拉低
    ///计数器//////////////////////////////////////////////////////////////
    reg [2:0] count_for_control_ready_delay;//控制输出ready信号延时的计数器
    // reg [1:0] count_for_shift_enable_direct_connection_rising_edge;//控制这两个信号上升沿复位之后移位功能延迟的计数器
    ///////////连接到输出端口的寄存器型变量/////////////////////////////////
    reg O_shift_ready;
    
     /////////////////////////////////////依据移位方向控制信号shift_direction和移位步长控制信号step_size进行循环移位(分组编码)操作的逻辑//////////////////////////////////
    integer k;//实现移位逻辑
    always @(posedge clk) begin
        //同步复位
        shift_enable_last <= shift_enable;
        shift_enable_rising_edge <= (!shift_enable_last&&shift_enable);
        direct_connection_last <= direct_connection;
        direct_connection_rising_edge <= (!direct_connection_last&&direct_connection);
        if(shift_enable_rising_edge)begin
            O_shift_ready <= 1'b0;
            flag_control_ready_delay <= 1'b0;
            count_for_control_ready_delay <= 3'd0;
        end
        if(direct_connection_rising_edge)begin
            O_shift_ready <= 1'b0;
            flag_control_ready_delay <= 1'b0;
            count_for_control_ready_delay <= 3'd0;
        end

        rising_edge_last_shift_enable <= shift_enable_rising_edge;
        // rising_edge_rising_edge_shife_enable <= (rising_edge_last_shift_enable&&!shift_enable_rising_edge);

        rising_edge_last_direct_connection <= direct_connection_rising_edge;
        // rising_edge_rising_edge_direct_connection <= (!direct_connection_rising_edge&&rising_edge_last_direct_connection);
        //移位模式
        if(rising_edge_last_shift_enable&&shift_enable)begin
            if(shift_direction)begin //下移位，最高组移到最低组
                for(k = 0;k < 33;k = k+1)begin
                    if(k > (step_size-1))begin
                        I_dataBr_Cf_in[k] <= dataBr_Cf_in[32*(k-step_size)+:32];
                    end else begin
                        I_dataBr_Cf_in[k] <= dataBr_Cf_in[32*(33+k-step_size)+:32];//这里写错导致上循环移位出错，这导致仿真出了个大bug,写到项目经历里面
                    end
                end
                O_shift_ready <= 1'b1;
                flag_control_ready_delay <= 1'b1;
            end else begin//上移位，最低组移到最高组
                for(k = 0;k < 33;k = k+1)begin
                    if(k < (32 - step_size + 1))begin
                        I_dataBr_Cf_in[k] <= dataBr_Cf_in[32*(k+step_size)+:32];
                    end else begin
                        I_dataBr_Cf_in[k] <= dataBr_Cf_in[32*(k+step_size-33)+:32];
                    end
                end
                O_shift_ready <= 1'b1;
                flag_control_ready_delay <= 1'b1;
            end
        end 
        //直连模式
        if(direct_connection&&rising_edge_last_direct_connection) begin
            for (k = 0;k < 33 ;k = k+1 ) begin
                I_dataBr_Cf_in[k] <= dataBr_Cf_in[32*k+:32];
            end
            O_shift_ready <= 1'b1;
            flag_control_ready_delay <= 1'b1;
        end

        if(flag_control_ready_delay) begin
            if(~shift_enable_rising_edge&&~direct_connection_rising_edge) begin
                if(count_for_control_ready_delay == 3'd5) begin
                    flag_control_ready_delay <= 1'b0;
                    O_shift_ready <= 1'b0;
                end else begin
                    count_for_control_ready_delay <= count_for_control_ready_delay +1'b1;
                end
            end else begin //如果同步复位，立马停止ready信号延迟的行为//这行代码有效解决了CSFront 输出shift_ready信号被斩波的问题
                flag_control_ready_delay <= 1'b0;
                count_for_control_ready_delay <= 3'd0;
            end
        end


    end
    genvar i;
    generate for (i = 0;i < 33 ;i = i + 1 ) begin : gen_dataBr_Cf_out
        assign dataBr_Cf_out[32*i+:32] = I_dataBr_Cf_in[i];
    end
    endgenerate
    
    assign shift_ready = O_shift_ready;

endmodule
