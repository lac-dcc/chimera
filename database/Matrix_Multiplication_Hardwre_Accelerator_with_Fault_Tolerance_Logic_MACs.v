// This program was cloned from: https://github.com/Mavvenger/Matrix_Multiplication_Hardwre_Accelerator_with_Fault_Tolerance_Logic
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/15 17:19:16
// Design Name: 
// Module Name: MACs
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
//代码修改成可综合的原则：（1）多驱动问题解决，将critical warning解决到只剩几个,这个代码critical warning 为0
//                      （2）

module MACs(
    input [31:0] dataA_in,
    input [1055:0] dataB_in,
    // input [1:0] detect_correct, //模式选择输入
    input fetch_Br_row, //第一次纠正模式下，该信号上升沿表示有新数据
    //MACs_reset信号在计算矩阵C对应行时只在最开始时有效（高电平有效）
    input MACs_enable,//MACs_enable信号在计算矩阵C对应行时一直有效，直到MACs_ready信号拉高，状态机跳转，拉低MACs_enable信号，此时MACs_reset信号亦被拉低
    input clk,
    output [1055:0] dataC_out,
    output MACs_ready,
    //拉出MUX选择信号控制MUX选通
    output [4:0] mux_sel
    );
    //修改
    //这样做时序性能下降了，这一版本完成一次计算需要680ns,之前版本完成一次计算需要350ns,所以这里时序可以优化，与MACs_reset信号无关,后面联合仿真完成在功能不变的基础上进行优化，//明天第一件事将MACs模块拆分为小块
    //////////////////////////////变量定义/////////////////////////////////
    ////////////内部寄存器变量/////////////////////////////////////////////
    ////存数据//////////////////////////////////////////////////////////////
    reg [31:0] I_dataA; // 用于保存dataA_in的寄存器
    reg [31:0] I_dataB [32:0]; // 用于保存dataB_in的寄存器
    //下面的变量mult_result和add_result是将本模块32个MAC拆分成一个个的关键
    reg [31:0] mult_result [32:0]; // 单次乘法结果
    reg [31:0] add_result [32:0];  // 单次累加结果
    ////存标志位///////////////////////////////////////////////////////////
    reg flag_fetch_over ;//用于控制MACs_reset信号的有效时间
    reg MACs_enable_last,
        MACs_enable_rising_edge;
    reg fetch_Br_row_last,
        fetch_Br_row_rising_edge;
    reg flag_control_ready_delay;//值为1时，开始控制ready信号高电平时间
    ////计数器/////////////////////////////////////////////////////////////
    reg [5:0] count; // 用于计数乘法累加次数的寄存器 
    reg [4:0] count_for_mux_sel;//用于拉出mux_控制信号
    reg [2:0] count_for_control_ready_delay;
    integer i;
    ///////////连接到输出端口的寄存器型变量/////////////////////////////////
    reg [31:0] O_dataC [32:0]; // 用于存储乘累加结果的寄存器
    reg O_MACs_ready;//用于指示乘累加完成的寄存器

    ///////////////////////////////////同步复位逻辑，乘法累加控制逻辑：分取数和算数部分///////////////////////////////////////////////////////////////////
    always @(posedge clk) begin
        /////////////////////////同步复位逻辑////////////////////////////////////////////////////////////////////////////////////
        // 同步复位逻辑
        MACs_enable_last <= MACs_enable;
        MACs_enable_rising_edge <= (!MACs_enable_last&&MACs_enable);
        if(MACs_enable_rising_edge) begin
            // flag_fetch_over <= 1'b1; //给区分取数和算数的信号flag_fetch_over赋初值
            I_dataA <= 32'd0;
            count <= 6'd0;
            count_for_mux_sel <= 5'd0;
            O_MACs_ready <= 1'b0;
            for (i = 0;i < 33;i = i + 1) begin
                I_dataB[i] <= 32'd0;
                O_dataC[i] <= 32'd0;
            end
            ///控制ready信号高电平持续时间
            flag_control_ready_delay <= 1'b0;
            count_for_control_ready_delay <= 3'd0;
        end
        
        //部署到检测shift_ready信号上升沿的电路逻辑
        fetch_Br_row_last <= fetch_Br_row;
        fetch_Br_row_rising_edge <= (!fetch_Br_row_last&&fetch_Br_row);
        //类似于CG模块的使能和fetch_A,fetch_B的写法
        if(MACs_enable) begin
            //////////////////////////////////////////////////////取数//////////////////////////////////////////////////////
            if(fetch_Br_row_rising_edge) begin
                //count的值表示取数次数，比如count等于1,表示取了一次数，一次j循环需要取数32次
                for(i = 0;i < 33; i = i+1) begin// 更新dataB_reg的寄存器
                    I_dataB[i] <= dataB_in[32*i+:32];
                end
                    I_dataA <= dataA_in; // 更新dataA_reg的寄存器
                    flag_fetch_over <= 1'b1;
                if (count < 6'd34) begin //count的值表示之前取了几次数，如果count = 1说明设计逻辑已经取了一次数
                    count <= count + 1'b1; // 计数加1
                end
                //count_for_mux_sel这个计数器
                if(count_for_mux_sel < 6'd31) begin
                    count_for_mux_sel <= count_for_mux_sel + 1'b1; //count_for_mux_sel非阻塞赋值前的值选择的MUX输出为当次取数I_dataA寄存器打入的值，这里没问题
                end
            end
            ////////////////////////////////////////////////////////算数////////////////////////////////////////////////////////
            ////在系统实际工作时，算数时MACs模块吞入的Br对应行
            // count的值表示取了多少次数
            // 每个时钟周期执行一次乘法累加操作，后执行乘法累加操作，乘法32次，累加32次（因为第一次复位清零）
            if(flag_fetch_over) begin
                if (count == 6'd0) begin //6'b000_000 = 6'd0 表示前面没有数送过来，刚刚那个clk复位过
                    for(i = 0;i <33;i = i + 1) begin
                        mult_result[i] <= 32'd0; //配置
                        add_result[i] <= 32'd0;//配置
                        O_dataC[i] <= 32'd0;//配置
                    end
                end else if(count == 6'd1) begin//6'b000_001 = 6'd1表示前面有一组数取过来
                    for(i = 0;i <33;i = i + 1) begin
                        mult_result[i] <= I_dataA * I_dataB[i]; //计算乘法结果
                        add_result[i] <= 32'd0;//配置
                        O_dataC[i] <= 32'd0;//配置
                    end
                end else if(count == 6'd2) begin //6'b000_010 = 6'd2表示前面有两组数取过来
                    for(i = 0;i <33;i = i + 1) begin
                        mult_result[i] <= I_dataA * I_dataB[i]; //计算乘法结果
                        add_result[i] <= O_dataC[i] + mult_result[i];//计算加法结果
                        O_dataC[i] <= 32'd0;//配置
                    end
                end else if((count > 6'd2) && (count < 6'd33)) begin//6'b100_010 = 6'd34，这里代表前面取了33次数
                    for(i = 0;i <33;i = i + 1) begin
                        mult_result[i] <= I_dataA * I_dataB[i]; //计算乘法结果
                        add_result[i] <= O_dataC[i] + mult_result[i];//计算加法结果
                        O_dataC[i] <= add_result[i];//更新O_dataC相应的子元素
                    end
                end else if(count == 6'd33) begin//这里代表前面取了33次数，但是第33次没取到，所以置mult_result值为32'd0，这里计数的值有问题，边界应该是6'd33
                    for(i = 0;i <33;i = i + 1) begin
                        mult_result[i] <= 32'd0; //配置
                        add_result[i] <= O_dataC[i] + mult_result[i];//计算加法结果
                        O_dataC[i] <= add_result[i];//更新O_dataC相应的子元素
                    end
                end else if(count == 6'd34) begin
                    O_MACs_ready <= 1'b1;
                    for(i = 0;i <33;i = i + 1) begin
                        mult_result[i] <= 32'd0; //配置
                        add_result[i] <= 32'd0;//配置
                        O_dataC[i] <= add_result[i] + O_dataC[i];//更新O_dataC相应的子元素,循环尾端需要做特殊处理
                    end
                    flag_control_ready_delay <= 1'b1;
                end
                flag_fetch_over <= 1'b0;
            end
        end
        //考虑到MACs_enable信号可能在MACs_ready信号之前拉低，所以控制MACs_ready信号高电平时间的逻辑写在MACs_enable外面
        if(flag_control_ready_delay) begin
            if(count_for_control_ready_delay == 3'd5) begin
                flag_control_ready_delay <= 1'b0;
                count_for_control_ready_delay <= 3'd0;
                O_MACs_ready <= 1'b0;
            end else begin
                count_for_control_ready_delay <= count_for_control_ready_delay + 1'b1;
            end
        end
    end

    //使用generate语句生成连续赋值语句实例
    genvar j;
    generate for (j = 0;j < 33 ;j = j + 1 ) begin:gen_dataC_out
        assign dataC_out[32*j+:32] = O_dataC[j]; // dataC_out的最高32位是矩阵行中列号最高的元素，输入端口dataB_in也是
    end
    endgenerate
    
    assign MACs_ready = O_MACs_ready;
    assign mux_sel = count_for_mux_sel;
    
endmodule
