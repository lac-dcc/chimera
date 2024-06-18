// This program was cloned from: https://github.com/thoulee21/ADC-FPGA
// License: Apache License 2.0

module sigmadelta_adc #(
parameter ADC_WIDTH = 8,              // ADC精度，单位bit
parameter ACCUM_BITS = 10,            // 累加器位宽，analog_cmp进入此处，必须大于ADC精度
parameter LPF_DEPTH_BITS = 3         // 均值滤波器深度，2^LPF_DEPTH_BITS是抽取速率
)(
input   clk,            // 时钟
input   rstn,   // 复位，低电平有效
input   analog_cmp,        // 比较器输出，可用lvds替代
output  analog_out,// 反馈路径，RC滤波后进入比较器
output [ADC_WIDTH-1:0] digital_out,   // 结果输出
output  sample_rdy// 输出有效
);            





//**********************************************************************
//
//	内部连线，寄存器声明
//
//**********************************************************************
reg                         delta;          // 比较器输出打一拍寄存器
reg [ACCUM_BITS-1:0]	    sigma;          // 累加寄存器
reg [ADC_WIDTH-1:0]	        accum;          // 锁存占空比寄存器
reg [ACCUM_BITS-1:0]	    counter;        // 时序控制寄存器
reg							rollover;       // 锁存占空比指示
reg							accum_rdy;      // 占空比数据准备好指示




//***********************************************************************
//
//  比较器输出打一拍，反馈输出
//
//***********************************************************************

always @ (posedge clk)
begin
    delta <= analog_cmp;        // 比较器输出打一拍
end

assign analog_out = delta;      // 反馈输出至RC低通滤波

//***********************************************************************
//
//  将01序列转换为N位占空比
//
//***********************************************************************

always @ (posedge clk or negedge rstn)
begin
	if( ~rstn ) 
    begin
		sigma       <= 0;
		accum       <= 0;
		accum_rdy   <= 0;
    end else begin
        if (rollover) begin
            // 锁存累加寄存器的高位
            accum <= sigma[ACCUM_BITS-1:ACCUM_BITS-ADC_WIDTH];
            sigma <= delta;         // 寄存器灌入新的值
        end else begin
            if (&sigma != 1'b1)         // 累加器未饱和
                sigma <= sigma + delta; // 累加 
        end
        accum_rdy <= rollover;     // 锁存准备好信号
    end
end

//************************************************************************
//
// 采样转换时序控制
//  
//************************************************************************

always @(posedge clk or negedge rstn)
begin
    if( ~rstn ) begin
        counter <= 0;
        rollover <= 0;
        end
    else begin
        counter <= counter + 1;       // 计数器+1
        rollover <= &counter;         // 计数器全1时，生成锁存信号
        end
end

//***********************************************************************
//
//  低通滤波器，均值滤波
//
//***********************************************************************

box_ave #(
    .ADC_WIDTH(ADC_WIDTH),
    .LPF_DEPTH_BITS(LPF_DEPTH_BITS))
box_ave (
    .clk(clk),
    .rstn(rstn),
    .sample(accum_rdy),
    .raw_data_in(accum),
    .ave_data_out(digital_out),
    .data_out_valid(sample_rdy)
);



endmodule