// This program was cloned from: https://github.com/Mavvenger/Matrix_Multiplication_Hardwre_Accelerator_with_Fault_Tolerance_Logic
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/16 12:40:16
// Design Name: 
// Module Name: tb_CheckSum_Generation
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
module tb_CheckSum_Generation;
//验证功能点：大功能，添加容错逻辑的矩阵乘法硬件加速器实现一个MAC故障时的容错功能，MAC别标号为0,1,2,3,~~~,31,32,设第32个MAC发生故障，在经过一次错误检测和两次错误纠正运算后实现正确的Cf输出
//对于校验和产生模块，三点功能：(1)正确产生校验和行，观察dataBr_out端口，dataAc_out端口
/////////////////////////////(2)内部存储器memAc,memBr的值在过程中被正确刷新
/////////////////////////////(3)full信号在错误检测计算，第一次错误纠正运算以及第二次错误纠正运算结束时正确输出
// CheckSum_Generation Parameters
parameter PERIOD  = 10;
//我已经吃了世界上最大最蠢的亏，没有什么亏是我不能吃的，记住了20231207

// CheckSum_Generation Inputs
reg   [1023:0]  data_in                    = 0 ;
reg   [4:0]  mux_sel                       = 0 ;
reg   clk                                  = 0 ;
reg   [1:0]  detect_correct                = 0 ;
reg   generate_enable                      = 0 ;
reg   fetch_A                              = 0 ;
reg   fetch_B                              = 0 ;

// CheckSum_Generation Outputs
wire  [31:0]  dataAc_out                   ;
wire  [1055:0]  dataBr_out                 ;
wire  dataBr_out_ready                     ;
wire  fetch_A_ready                        ;
wire  fetch_B_ready                        ;
wire  [2:0]   full                         ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

CheckSum_Generation  u_CheckSum_Generation (
    //Input
    .data_in                 ( data_in           [1023:0] ),
    .mux_sel                 ( mux_sel           [4:0]    ),
    .clk                     ( clk                        ),
    .detect_correct          ( detect_correct    [2:0]    ),
    .generate_enable         ( generate_enable            ),
    .fetch_A                 ( fetch_A                    ),
    .fetch_B                 ( fetch_B                    ),
    //Output
    .dataAc_out              ( dataAc_out        [31:0]   ),
    .dataBr_out              ( dataBr_out        [1055:0] ),
    .dataBr_out_ready        ( dataBr_out_ready           ),
    .fetch_A_ready           ( fetch_A_ready              ),
    .fetch_B_ready           ( fetch_B_ready              ),
    .full                    ( full              [2:0]    )
);

reg [31:0] dataA_value [0:31][0:31];
reg [31:0] dataB_value [0:31][0:31];
reg [31:0] dataAc_value [0:32][0:31];
reg [31:0] dataBr_value [0:31][0:32];
//给dataA_value，dataB_value,dataAc_value,dataBr_value赋初值
integer i,j;
initial begin
    for (i = 0;i < 32;i = i + 1)begin
        for(j = 0;j < 32;j = j + 1)begin
            dataA_value[i][j] = 32'd1;
            if(i == j)begin
                dataB_value[i][j] = 32'd2;
            end else begin
                dataB_value[i][j] = 32'd0;
            end
        end
    end
    //将dataAc_value配置成零值
    for (i = 0;i < 33 ;i = i + 1 ) begin
        for (j = 0;j < 32 ;j = j + 1 ) begin
            dataAc_value[i][j] = 32'd0;
        end
    end
    //将dataBr_value配置成零值
    for (i = 0;i < 32 ;i = i + 1 ) begin
        for (j = 0;j < 33 ;j = j + 1 ) begin
            dataBr_value[i][j] = 32'd0;
        end
    end
end

// `define Verify_A 1'b0;

integer k = 0;
integer p = 0;
initial begin
    mux_sel = 5'd20;
    # 15
    detect_correct = 2'd1;
    generate_enable = 1'b1;
    `ifdef Verify_A
    //取数矩阵A
    fetch_A = 1'b1;
    #20
    @(negedge clk) begin
        for (j = 0 ; j < 32 ; j = j + 1 ) begin
            data_in[32*j+:32] = dataA_value [k][j];
        end
        k = k + 1;
    end
    # 17 fetch_A = 1'b0;
    # 12 fetch_A = 1'b1;
    
    repeat(31) begin
        # 38 fetch_A = 1'b0;
        # 12 fetch_A = 1'b1;
        @(negedge clk) begin
            for (j = 0;j < 32 ; j = j + 1 ) begin
                data_in[32*j+:32] = dataA_value[k][j];
            end
            k = k + 1;
        end
    end
    
    //错误检测&&正常计算模式下取Ac的最后一行，不用送数
    # 37 fetch_A = 1'b0;
    //在full等于001后的第二个时钟上升沿同时拉高fetch_A信号并改变detect_correct信号
    # 18 fetch_A = 1'b1;
         detect_correct = 2'd2;
    //错误检测&&正常计算模式与错误纠正&&第一次纠正计算之间的切换，包括复位计数器
    k = 0;/////////////////////////////////////////////////////////////
    //等到错误检测&&正常计算模式下第33次取数fetch_A拉低后改变detect_correct信号的值
    # 45 fetch_A = 1'b0;
    # 26 fetch_A = 1'b1;
    @(negedge clk) begin
        for (j = 0 ; j < 32 ; j = j + 1 ) begin
            data_in[32*j+:32] = dataA_value [k][j];
        end
        k = k + 1;
    end
    //错误纠正&&第一次纠正计算的中间31次取数
    // # 38 fetch_A = 1'b0;
    // # 12 fetch_A = 1'b1;
    repeat(31) begin
        # 38 fetch_A = 1'b0;
        # 12 fetch_A = 1'b1;//这里的意思是fetch_A拉高后的第一个时钟下降沿给端口送数，
        @(negedge clk) begin
            for (j = 0;j < 32 ; j = j + 1 ) begin
                data_in[32*j+:32] = dataA_value[k][j];
            end
            k = k + 1;
        end
    end
    #38 fetch_A = 1'b0;
    //在full等于010后的第二个时钟上升沿同时拉高fetch_A信号并改变detect_correct信号
    #17 detect_correct = 3'd3;
        fetch_A = 1'b1;
    //错误纠正&&第一次纠正计算与错误纠正&&第二次纠正计算之间的切换，包括复位计数器
    k = 0;/////////////////////////////////////////////////////////////
    # 45 fetch_A = 1'b0;
    # 26 fetch_A = 1'b1;
    @(negedge clk) begin
        for (j = 0 ; j < 32 ; j = j + 1 ) begin
            data_in[32*j+:32] = dataA_value [k][j];
        end
        k = k + 1;
    end
    //中间31次取数
    repeat(31) begin
        # 38 fetch_A = 1'b0;
        # 12 fetch_A = 1'b1;//这里的意思是fetch_A拉高后的第一个时钟下降沿给端口送数，
        @(negedge clk) begin
            for (j = 0;j < 32 ; j = j + 1 ) begin
                data_in[32*j+:32] = dataA_value[k][j];
            end
            k = k + 1;
        end
    end

    //下面这个代码是为了测试取数矩阵A完成后取数算数矩阵B对CG模块关于取数算数矩阵A的输出端口是否有影响，发现没有影响
    /*
    #40 fetch_B = 1'b1;
    */
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    `else
        fetch_B = 1'b1;
        @(negedge clk) begin
            for (j = 0 ; j < 32 ; j = j + 1 ) begin
                data_in[32*j+:32] = dataB_value [k][j];
            end
            k = k + 1;
        end
        repeat(30) begin
            @(posedge dataBr_out_ready) begin
                @(negedge clk)
                    for ( j = 0 ; j < 32 ; j = j + 1 ) begin
                        data_in[32*j+:32] = dataB_value [k][j];
                    end
                k = k + 1;
            end
        end

         @(posedge dataBr_out_ready) begin
             @(negedge clk)
                 for ( j = 0 ; j < 32 ; j = j + 1 ) begin
                     data_in[32*j+:32] = dataB_value [k][j];
                 end
             k = k + 1;
         end

        @(posedge dataBr_out_ready) begin
            # 35
            fetch_B = 1'b0;
            # 20
            fetch_B = 1'b1;
        end
    `endif 
end


initial
begin
    # 1000
    $finish;
end
endmodule
