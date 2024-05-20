// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

///////////////////////////////////
// 四位加法器验证平台代码
///////////////////////////////////

`timescale 1ns/1ps
module testbench_sumfour(

);

parameter CLK_PERIORD = 10;

reg         clk;
reg         rst;
wire [3:0]  o_cnt_1;
wire [3:0]  o_cnt_2;

// 连接模块
sumfour sumfour_test(
    .clk        (clk),
    .rst        (rst),
    .o_cnt_1    (o_cnt_1),
    .o_cnt_2    (o_cnt_2)
);

// 初始化时钟
initial begin
    clk <= 0;
    rst <= 0;
    #1000;
    rst <= 1;
end

always #(CLK_PERIORD / 2) clk = ~clk;

// 产生测试信号
initial begin

	@(posedge rst);	        	// 等待复位完成
	
	@(posedge clk);				// 等待时钟上升沿
	

	repeat(10) begin
		@(posedge clk);         // 重复 10 下时钟上升沿判断，那么也就是产生 10 次分频信号
	end
	
	#10_000;                    // 仿真时间为 10000 个时间单位，也即 10000*1ns=10000ns
	
	$stop;
end

endmodule

