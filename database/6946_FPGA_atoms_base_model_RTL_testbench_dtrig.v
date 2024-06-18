// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

////////////////////////////////////
// 将一个信号经过两级 D 触发器的验证平台代码
/////////////////////////////////////

`timescale 1ns/1ps
module testbench_dtrig(

);

parameter CLK_PERIOD = 10;

reg         clk;
reg         rst;
reg  [3:0]  d;
wire [3:0]  q;

// 连接测试模块
dtrig dtrig_test(
    .clk        (clk),
    .rst        (rst),
    .d          (d),
    .q          (q)
);

// 初始化时钟、复位和输入信号
initial begin
    clk <= 0;
    rst <= 0;
    # 1000;
    rst <= 1;
    
    @(posedge clk);
    # 2;
    d <= 4'd1;
    @(posedge clk);
    # 2;
    d <= 4'd2;
    @(posedge clk);
    # 2;
    d <= 4'd3;
    @(posedge clk);
    # 2;
    d <= 4'd4;

end

always #(CLK_PERIOD/2) clk <= ~clk;

initial begin
    @(posedge rst);     // 等待第一个 initial 块的复位完成
    
    @(posedge clk);     // 在复位完成的基础上等待时钟上升沿

    repeat(10) begin
        @(posedge clk);
    end

    #10_000;

    $stop;
end

endmodule
