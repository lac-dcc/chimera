// This program was cloned from: https://github.com/HeLiangHIT/polyphase_filter_prj
// License: MIT License

//decimation

module polypase_fir(clk,rst_n,data_out,clk_data,fir_out,clk_fir);
`define OUT_WIDTH 8
`define FIR_OUTS_SIZE 20
`define FIR_OUT_SIZE 23 //20为每个FIR位宽，+3表示8相叠加后的位宽，在data_fir中定义过了，但是这里文件要覆盖它！
`define PHASE_NUM 8
`define PHASE_BIT 3

input clk;      //定义系统时钟
input rst_n;    //复位信号
output [`OUT_WIDTH-1:0] data_out;      //输出波形数据
output [`OUT_WIDTH-1:0] fir_out;      //输出波形数据
output clk_data;      //输出波形数据时钟
output clk_fir;      //输出波形数据时钟
assign clk_data = clk;
assign clk_fir = clk;

wire data_change;
wire [`OUT_WIDTH-1:0] data_reg;      //输出波形数据


//----------输出信号产生模块----------
wave_add 
 #( .fword1(10'd8), .fword2(10'd41))
iadd2 (
	.clk(clk),
	.rst_n(rst_n),
	.data_change(data_change),
	.data_out(data_reg)
);
assign data_out = data_reg - `OUT_WIDTH'd128;//数据滤波前先归一化为有符号数

//----------相位分解模块----------
reg [0:0] clks[0:`PHASE_NUM-1];//二维数组，保持各相滤波器的输输入时钟
//时钟产生用于产生下采样和抽取信号
reg  [`PHASE_BIT-1:0]  cnt;
always @(posedge clk or negedge rst_n)  begin
	if(~rst_n)begin
  		cnt <= `PHASE_BIT'd0;
		clks[0] <= 1'b0;
		end
	else begin
		cnt <= cnt + 1'b1;
		clks[1]<=clks[0];//时钟延迟
		clks[2]<=clks[1];
		clks[3]<=clks[2];
		clks[4]<=clks[3];
		clks[5]<=clks[4];
		clks[6]<=clks[5];
		clks[7]<=clks[6];
		if (cnt == `PHASE_BIT'd3)//【需要根据实际分频更改参数】
			clks[0] <= 1'b0;//时钟分频必须这么操作，防止分频加倍
		else if (cnt == (`PHASE_NUM -1))
			clks[0] <= 1'b1;//时钟分频必须这么操作，防止分频加倍
		else
			clks[0] <= clks[0];
		end
end

//----------滤波器映射----------
wire [`FIR_OUTS_SIZE-1:0] fir_outs[0:`PHASE_NUM-1];//二维数组，保持各相滤波器的输输出数据
hdec_1_Verilog hn1(
	.clk(clks[0]),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[0])
	);

hdec_2_Verilog hn2(
	.clk(clks[1]),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[1])
	);

hdec_3_Verilog hn3(
	.clk(clks[2]),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[2])
	);

hdec_4_Verilog hn4(
	.clk(clks[3]),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[3])
	);

hdec_5_Verilog hn5(
	.clk(clks[4]),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[4])
	);

hdec_6_Verilog hn6(
	.clk(clks[5]),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[5])
	);

hdec_7_Verilog hn7(
	.clk(clks[6]),
	.reset(rst_n),
	.X(data_out),
	.Y(fir_outs[6])
	);

hdec_8_Verilog hn8(
	.clk(clks[7]),
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
		fir_out_reg <= (fir_outs_reg[0] + fir_outs_reg[1]
				 + fir_outs_reg[2] + fir_outs_reg[3])
				 + (fir_outs_reg[4] + fir_outs_reg[5]
				 + fir_outs_reg[6] + fir_outs_reg[7]);
end

assign fir_out = (fir_out_reg>>(`FIR_OUT_SIZE - `OUT_WIDTH - `PHASE_BIT));//移位,去除HN的放大作用

endmodule 