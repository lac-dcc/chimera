// This program was cloned from: https://github.com/Mavvenger/Matrix_Multiplication_Hardwre_Accelerator_with_Fault_Tolerance_Logic
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/16 13:01:40
// Design Name: 
// Module Name: CheckSum_Verification
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


module CheckSum_Verification(
    input [1055:0] dataCf_in,//33个32位宽的元素
    input clk,
    input verify_enable,
    input [1:0] detect_correct,
    input fetch_Cf_row,
    
    output [32:0] column_indicator,
    output error,
    output column_verify_ready
    );
    //////////////////////////////变量定义//////////////////////////////////
    ////////////内部寄存器变量//////////////////////////////////////////////
    ////存数据/////////////////////////////////////////////////////////////
    //从数据输入端口暂时取得全编码矩阵Cf的对应行时的暂存寄存器////////////////
    reg [31:0] I_dataCf_in [32:0];
    //存储参考列编码矩阵行/////////////////////////////////////////////////
    reg [31:0] ref_column_encode_matrixrow [32:0];
    //存储参考行编码矩阵列/////////////////////////////////////////////////
    // reg [31:0] ref_row_encode_matrixcolumn [32:0];
    /////为计算Cf的参考存储器而设置的加法结果和累加结果/////////////////////
    // reg [31:0] add_result,
            //    accumulation_result;
    ////存标志位///////////////////////////////////////////////////////////
    reg verify_enable_last,
        verify_enable_rising_edge;
    reg flag_fetch_Cf_over; //标志取Cf的一行完毕
    reg flag_ref_column_encode_matrixrow_over;//当这两个寄存器值为1'b1时，表示参考的存储器已经编码完成，下一步进行比较
    reg [1:0] detect_correct_last;
    reg flag_detect_correct;//值为1时，表示detect_correct信号发生变化
    reg fetch_Cf_row_last,
        flag_fetch_Cf_row;
    reg flag_control_ready_delay;//值为1，表示，开始控制输出拉高的时间
    ///计数器/////////////////////////////////////////////////////////////
    integer i;//常规计数器
    reg [5:0] count_for_Cf_row;//确定当前取数全编码矩阵Cf取哪一行的计数器
    reg [2:0] count_for_control_ready_delay;//控制输出拉高时间的计数器
    ///////////连接到输出端口的寄存器型变量/////////////////////////////////
    reg [32:0] O_column_indicator;
    reg        O_column_verify_ready;

    always @(posedge clk) begin
        ///////////////同步复位功能/////////////////////////////////////////////////////复位的目的是让电路进入一个最安全的状态
        verify_enable_last <= verify_enable;
        verify_enable_rising_edge <= (!verify_enable_last&&verify_enable);
        if(verify_enable_rising_edge) begin
            O_column_verify_ready <= 1'b0;
            flag_fetch_Cf_over <= 1'b0;
            ///////同步复位控制输出拉高时间的标志寄存器和计数器
            count_for_control_ready_delay <= 3'd0;
            flag_control_ready_delay <= 1'b0;
        end
        /////////////检测detect_correct信号是否发生变化////////////////////////////////////////////////////////////////////
        ////这里不需要考虑verify_enable和detect_correct信号同时变化问题////////////
        detect_correct_last <= detect_correct;
        flag_detect_correct <= (detect_correct !== detect_correct_last)&&(detect_correct_last !== 2'bxx);//!==也用于逻辑比较，可以检测到x和z,//这里依据波形仿真，确定是用!==还是!=,隔天结果不一样
        //首次进入才能有初始化，需要对detect_correct信号进行判断
        //////////////初始化：针对原来detect_correct[1:0]输入信号进行修改////////////////////////////////////////////////////////////////初始化选择进入的模式
        if(flag_detect_correct) begin
            case(detect_correct)
                2'd1://这个很好解释，每次对矩阵乘法的正常运算和容错期间的两次计算是针对特定的矩阵A和矩阵B的，也就是说每次矩阵A和矩阵B都不同的话，ref_column_encode_matrixrow,ref_row_encode_matrixcolumn复位是合理的，反映在代码上就是从IDLE状态跳转到Buffer_row_A状态
                    //ref_column_encode_matrixrow,ref_row_encode_matrixcolumn每次都需要被改变
                    begin
                        for (i = 0;i < 33 ;i = i + 1 ) begin //刚刚进入错误检测，正常计算状态时，detect_correct = 2'd1
                            ref_column_encode_matrixrow[i] <= 32'd0;
                        end
                            count_for_Cf_row <= 6'd0;
                            flag_ref_column_encode_matrixrow_over <= 1'b0;
                            O_column_indicator <= 33'd0;
                    end
                2'd2: //
                    begin
                            count_for_Cf_row <= 6'd0;
                    end
                2'd3:
                    begin
                            count_for_Cf_row <= 6'd0;
                    end
                default:
                    begin
                            count_for_Cf_row <= count_for_Cf_row;
                    end
            endcase
        end
        fetch_Cf_row_last <= fetch_Cf_row;
        flag_fetch_Cf_row <= (!fetch_Cf_row_last&&fetch_Cf_row);
        /////////校验和验证电路动作规范描述////////////////////////////////////
        /////每个verify_enable信号上升沿打入新的全编码矩阵对应行，可以先进行行编码，等到前32行都打入后，进行列编码，所以需要两个向量数组存储对应的参考行编码值和列编码值
        ////前面那个detect_correct输入信号也要在该模块引入，目的是清晰地将本模块内部相关寄存器计数器复位成原样
        if(verify_enable) begin
        /////////////////取数逻辑////////////////////////////////////////////
            //用MACs那边的思想,flag_fetch_Cf_row
            if(flag_fetch_Cf_row) begin
                for(i = 0;i < 33;i = i + 1) begin
                    I_dataCf_in[i] <= dataCf_in[32*i+:32];
                end
                if(count_for_Cf_row == 6'd33) begin
                    count_for_Cf_row <= count_for_Cf_row;
                end else begin
                    count_for_Cf_row <= count_for_Cf_row + 1'b1;
                end
                flag_fetch_Cf_over <= 1'b1;
            end
        ////////////////算数逻辑////////////////////////////////////////////
        ////一个 always 块中不要存在多个并行或不相关的条件语句，使用多个 always 分别描述（这时候不能产生多个always块对同一个变量赋值的情况，这是一个很严重的问题，会产生多驱动问题（关键警告））。
        ////仿真过程顺序执行，综合的实际电路并行执行，存在延迟信息可能会导致不可以预知的错误结果。且该写法可读性较差，功能结构划分不明显。

            //参考列编码矩阵行编码未完成
            if(flag_fetch_Cf_over&&!flag_ref_column_encode_matrixrow_over) begin
                if(count_for_Cf_row < 6'd33) begin
                    for(i = 0; i < 33; i = i + 1)begin
                        ref_column_encode_matrixrow[i] <= ref_column_encode_matrixrow[i] + I_dataCf_in[i];
                    end
                end
                flag_fetch_Cf_over <= 1'b0;
                // flag_ref_column_encode_matrixrow_over <= (count_for_Cf_row == 6'd33) ? 1'b1 : 1'b0;  这一行注释掉是应为校验和验证模块只在Write_row_C过程中启用
                if(count_for_Cf_row == 6'd33) begin
                    flag_ref_column_encode_matrixrow_over <= 1'b1;
                    for(i = 0; i < 33; i = i + 1) begin
                        O_column_indicator[i] <= ~(ref_column_encode_matrixrow[i] == I_dataCf_in[i]);
                    end
                    O_column_verify_ready <= 1'b1;//给到模块外部，而flag_ref_column_encode_matrixrow_over是模块内部控制是否对参考列编码矩阵行生成寄存器值刷新的变量
                    flag_control_ready_delay <= 1'b1;
                end
            end
            //参考列编码矩阵行编码完成
            //下面这段逻辑是没有用的，因为flag_ref_column_encode_matrix_over信号拉高后，CV模块的功能就已经结束了
            if(flag_fetch_Cf_over&&flag_ref_column_encode_matrixrow_over) begin
                flag_fetch_Cf_over <= 1'b0;
                O_column_verify_ready <= 1'b1;
            end
        end
        //控制输出拉高时间的标志寄存器和计数器
        if(flag_control_ready_delay) begin
            if(count_for_control_ready_delay == 3'd5) begin
                flag_control_ready_delay <= 1'b0;
                count_for_control_ready_delay <= 3'd0;
                // O_column_indicator <= 33'd0; 注释掉这一行保证column_indicator[32:0]正确保存下去在第一次纠正和第二次纠正模式下
                O_column_verify_ready <= 1'b0;
            end else begin
                count_for_control_ready_delay <= count_for_control_ready_delay + 1'b1;
            end
        end
    end

    assign    error = |O_column_indicator;//这是一个缩减或操作符
    //////连接内部寄存器变量到输出端口/////////////////////////////////////
    
    assign    column_indicator[32:0] = O_column_indicator[32:0];
    assign    column_verify_ready = O_column_verify_ready;

endmodule
