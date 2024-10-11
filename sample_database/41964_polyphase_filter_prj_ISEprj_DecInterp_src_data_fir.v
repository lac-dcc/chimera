// This program was cloned from: https://github.com/HeLiangHIT/polyphase_filter_prj
// License: MIT License

//***********************************************************
//信号叠加

module data_fir(clk,rst_n,data_out,clk_data,fir_out,clk_fir);
`define OUT_WIDTH 8
`define FIR_OUT_SIZE 23

input clk;      //定义系统时钟
input rst_n;    //复位信号
output [`OUT_WIDTH-1:0] data_out;      //输出波形数据
output [`OUT_WIDTH-1:0] fir_out;      //输出波形数据
output clk_data;      //输出波形数据时钟
output clk_fir;      //输出波形数据时钟

assign clk_data = clk;
assign clk_fir = clk;

wire data_change;
wire data_change1,data_change2;          //波形数据发生改变标志位
wire [`OUT_WIDTH-1:0] data_reg;      //输出波形数据

wave_add 
 #( .fword1(10'd8), .fword2(10'd41))
iadd1 (
	.clk(clk),
	.rst_n(rst_n),
	.data_change(data_change),
	.data_out(data_reg)
);
assign data_out = data_reg - `OUT_WIDTH'd128;//数据滤波前先归一化为有符号数

wire [`FIR_OUT_SIZE-1:0] fir_out_reg;
radix_fir_65 fir1(
	.clk(clk),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_out_reg)
	);
assign fir_out = fir_out_reg>>(`FIR_OUT_SIZE - `OUT_WIDTH - 3);//移位,去除HN的放大作用

endmodule 