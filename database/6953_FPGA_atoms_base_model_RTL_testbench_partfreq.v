// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 分频时钟的验证平台代码
//

`timescale 1ns/1ps                  // 时间单位为 1 ns，时间精度为 1 ps
module testbench_partfreq(

);

parameter CLK_PERIORD = 10;         // 100MHz 周期为 10ns，对应 10 个时间单位

reg         clk;
reg         rst;
wire        clk_out;


partfreq    partfreq_test(			// 前者是 设计模块 名称，后者是 例化模块 名称
    .clk        (clk),
    .rst        (rst),
    .clk_out    (clk_out)
);

//////////////////////////////////
// 时钟和复位信号的产生
//////////////////////////////////
initial begin
	clk <= 0;
	rst <= 0;
	#1000;
	rst <= 1;
end
	
// 时钟产生，周期符合 100MHz 的要求
always #(CLK_PERIORD / 2) clk = ~clk;


////////////////////////////////////////////////////////////
// 测试激励产生
////////////////////////////////////////////////////////////
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