// This program was cloned from: https://github.com/thoulee21/ADC-FPGA
// License: Apache License 2.0

module ADC_top #(
parameter ADC_WIDTH = 8     // ADC精度，单位bit
)(
input	clk_in,				// 时钟输入
input	rstn,				// 低电平复位
input	analog_cmp,			// 比较器输出，可用lvds替代
output	analog_out,			// 反馈路径，RC滤波后进入比较器
output [ADC_WIDTH-1:0] digital_out,  // 滤波器并行输出
output  wire sample_rdy_i 		//输出数据有效
);

parameter 
ACCUM_BITS = 10,            // 累加器位宽，analog_cmp进入此处，必须大于ADC精度?2^ACCUM_BITS 是信号累加器大小
LPF_DEPTH_BITS = 3,         // 低通滤波器深度，2^LPF_DEPTH_BITS是抽取率
INPUT_TOPOLOGY = 0;         // 反馈参数配置
/* 
*0: DIRECT: Analog input directly connected to + input of comparitor
*模拟信号+端输入，反馈信号RC滤波后从-输入
*适合测量0-VCC的模拟信号
1: NETWORK:Analog input connected through R divider to - input of comp.
*模拟信号与反馈信号经过加法器，连接积分器
*扩大了电压测量范围
*/


//**********************************************************************
//
//	内部连线
//
//**********************************************************************
wire							clk;
wire							analog_out_i;
wire [ADC_WIDTH-1:0]			digital_out_i;
wire [ADC_WIDTH-1:0]			digital_out_abs;

assign clk=clk_in;

//***********************************************************************
//
//  Sigma-Delta ADC 主模块
//
//***********************************************************************
sigmadelta_adc #(
	.ADC_WIDTH(ADC_WIDTH),
	.ACCUM_BITS(ACCUM_BITS),
	.LPF_DEPTH_BITS(LPF_DEPTH_BITS)
	)
SSD_ADC(
	.clk(clk),
	.rstn(rstn),
	.analog_cmp(analog_cmp),
	.digital_out(digital_out_i),
	.analog_out(analog_out_i),
	.sample_rdy(sample_rdy_i)
	);

assign digital_out_abs = INPUT_TOPOLOGY ? ~digital_out_i : digital_out_i;  //反馈参数选择

//***********************************************************************
//
//  输出连线
//
//***********************************************************************


assign digital_out   =  digital_out_abs;	 // 数字输出
assign analog_out    =  analog_out_i;
assign sample_rdy    =  sample_rdy_i;

endmodule