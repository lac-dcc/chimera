//***********************************************************
//信号叠加

module wave_add(clk,rst_n,data_out,data_change);
`define OUT_WIDTH 8
`define ADDR_WIDTH 10

input clk;      //定义系统时钟
input rst_n;    //复位信号
output data_change;
output [`OUT_WIDTH-1:0] data_out;      //最终输出波形数据

parameter     fword1 = `ADDR_WIDTH'd4,//f=2e5
              fword2 = `ADDR_WIDTH'd20,//f=10e5
              pword1 = `ADDR_WIDTH'd0,//p=0
	           pword2 = `ADDR_WIDTH'd0,//p=0
				  aword1 = 3'd1,//通过移位来控制幅度大小
              aword2 = 3'd1;//各移位1等于占比50%

wire [`OUT_WIDTH-1:0] data_out1;      //输出波形数据1
wire [`OUT_WIDTH-1:0] data_out2;      //输出波形数据2

assign data_out = (data_out1>>aword1) + (data_out2>>aword2);//按照移位加权相加
// always @ (posedge clk or negedge rst_n) begin 
// 	if(!rst_n)
// 		data_out <= `OUT_WIDTH'd0;
// 	else
// 		data_out <= (data_out1>>aword1) + (data_out2>>aword2);//相位累加
// end

wire data_change1,data_change2;          //波形数据发生改变标志位
sin_dds i1 (
	.clk(clk),
	.data_change(data_change1),
	.data_out(data_out1),
	.fword(fword1),
	.pword(pword1),
	.rst_n(rst_n)
);

sin_dds i2 (
	.clk(clk),
	.data_change(data_change2),
	.data_out(data_out2),
	.fword(fword2),
	.pword(pword2),
	.rst_n(rst_n)
);
assign data_change = data_change1 || data_change2;//波形改变标志位

endmodule 