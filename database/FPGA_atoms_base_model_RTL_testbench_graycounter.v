// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 格雷码计数器验证平台代码
//

`timescale 1ns/1ps
module testbench_graycounter(

);

parameter CLK_PERIOD = 10;
parameter PULSE_PERIOD = 32'd1_000_000_000;         // 使 pulse 的周期为 1 秒

reg         clk;
reg         rst;
reg         pulse;
wire [3:0]  count;

// 连接测试平台
graycounter graycounter_test(
    .clk        (clk),
    .rst        (rst),
    .pulse      (pulse),
    .count      (count)
);

// 初始化时钟和复位
initial begin
    clk <= 0;
    rst <= 0;
    pulse <= 0;
    #1000;
    rst <= 1;

end

always #(CLK_PERIOD/2) clk=~clk;

// 产生激励信号
integer i;
initial begin
    @(posedge rst)
    pulse <= 1;
    for(i=0;i<50;i=i+1) begin
        @(posedge clk);
        #(PULSE_PERIOD/5000000);
        pulse <= ~pulse;
        $monitor("counter is %b, time is %d.",count,$time);
    end

    #10000;
    $stop;
end

endmodule