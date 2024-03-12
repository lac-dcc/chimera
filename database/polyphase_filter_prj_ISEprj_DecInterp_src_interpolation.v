//Interpolation,滤波器采用与将采样相同的滤波器，以避免系数的重复繁琐操作。

module interpolation(clk,rst_n,data_out,clk_data,fir_out,clk_fir);
`define OUT_WIDTH 8
`define FIR_OUTS_SIZE 20
`define FIR_OUT_SIZE 23 //20为每个FIR输出位宽，+3表示8相叠加后的位宽，在data_fir中定义过了，但是这里文件要覆盖它！
`define PHASE_NUM 8
`define PHASE_BIT 3

input clk;      //定义升采样后的时钟
input rst_n;    //复位信号
output [`OUT_WIDTH-1:0] data_out;      //输出波形数据
output [`OUT_WIDTH-1:0] fir_out;      //输出波形数据
output clk_data;      //输出波形数据时钟
output clk_fir;      //输出波形数据时钟
assign clk_fir = clk;

wire data_change;
wire [`OUT_WIDTH-1:0] data_reg;      //输出波形数据

reg clk_org;//输入信号时钟
assign clk_data = clk_org;
//时钟产生用于产生原始信号
reg  [`PHASE_BIT-1:0]  cnt;
always @(posedge clk or negedge rst_n)  begin
	if(~rst_n) begin
  		cnt <= `PHASE_BIT'd0;
  		clk_org <= 0;
		end
	else begin
		cnt <= cnt + 1'b1;
		if (cnt == (`PHASE_NUM -1)>>1 || cnt == (`PHASE_NUM -1))
			clk_org <= ~clk_org;//时钟分频必须这么操作，防止分频加倍
	end
end


//----------输出信号产生模块----------
wave_add 
 #( .fword1(10'd8), .fword2(10'd41))
iadd2 (
	.clk(clk_org),
	.rst_n(rst_n),
	.data_change(data_change),
	.data_out(data_reg)
);
assign data_out = data_reg - `OUT_WIDTH'd128;//数据滤波前先归一化为有符号数

//----------滤波器映射----------
wire [`FIR_OUTS_SIZE-1:0] fir_outs[0:`PHASE_NUM-1];//二维数组，保持各相滤波器的输输出数据
hdec_1_Verilog hn1(
	.clk(clk),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[0])
	);

hdec_2_Verilog hn2(
	.clk(clk),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[1])
	);

hdec_3_Verilog hn3(
	.clk(clk),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[2])
	);

hdec_4_Verilog hn4(
	.clk(clk),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[3])
	);

hdec_5_Verilog hn5(
	.clk(clk),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[4])
	);

hdec_6_Verilog hn6(
	.clk(clk),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[5])
	);

hdec_7_Verilog hn7(
	.clk(clk),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[6])
	);

hdec_8_Verilog hn8(
	.clk(clk),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[7])
	);

reg [`FIR_OUT_SIZE-1:0] fir_out_reg;//二维数组，保持各相滤波器的输输出数据
wire [`FIR_OUT_SIZE-1:0] fir_outs_reg[0:`PHASE_NUM-1];//二维数组，保持各相滤波器的输输出数据
//符号位扩展，VERILOG傻傻无法综合负数
assign fir_outs_reg[0] = fir_outs[0][`FIR_OUTS_SIZE-1]==0?{`PHASE_BIT'b000, fir_outs[0]}:{`PHASE_BIT'b111, fir_outs[0]};
assign fir_outs_reg[1] = fir_outs[1][`FIR_OUTS_SIZE-1]==0?{`PHASE_BIT'b000, fir_outs[1]}:{`PHASE_BIT'b111, fir_outs[1]};
assign fir_outs_reg[2] = fir_outs[2][`FIR_OUTS_SIZE-1]==0?{`PHASE_BIT'b000, fir_outs[2]}:{`PHASE_BIT'b111, fir_outs[2]};
assign fir_outs_reg[3] = fir_outs[3][`FIR_OUTS_SIZE-1]==0?{`PHASE_BIT'b000, fir_outs[3]}:{`PHASE_BIT'b111, fir_outs[3]};
assign fir_outs_reg[4] = fir_outs[4][`FIR_OUTS_SIZE-1]==0?{`PHASE_BIT'b000, fir_outs[4]}:{`PHASE_BIT'b111, fir_outs[4]};
assign fir_outs_reg[5] = fir_outs[5][`FIR_OUTS_SIZE-1]==0?{`PHASE_BIT'b000, fir_outs[5]}:{`PHASE_BIT'b111, fir_outs[5]};
assign fir_outs_reg[6] = fir_outs[6][`FIR_OUTS_SIZE-1]==0?{`PHASE_BIT'b000, fir_outs[6]}:{`PHASE_BIT'b111, fir_outs[6]};
assign fir_outs_reg[7] = fir_outs[7][`FIR_OUTS_SIZE-1]==0?{`PHASE_BIT'b000, fir_outs[7]}:{`PHASE_BIT'b111, fir_outs[7]};

//对于抽取而言，这里需要保持每一个新的采样时钟才输出累加值，因此必须等到时钟累加到`PHASE_NUM -1再抽取
always @(posedge clk or negedge rst_n)  begin
	if(~rst_n)
  		fir_out_reg <= `FIR_OUT_SIZE'd0;
	else 
		fir_out_reg <= fir_outs_reg[cnt];//插值的操作
end

assign fir_out = (fir_out_reg>>(`FIR_OUT_SIZE - `OUT_WIDTH - `PHASE_BIT -2));//移位,去除HN的放大作用，将插值滤波的衰减放大回去，这个2是仿真后调节的参数

endmodule 