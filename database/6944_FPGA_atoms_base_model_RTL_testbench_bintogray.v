// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 自然 2 进制转 4 位格雷码验证平台代码
//

`timescale 1ns/1ps
module testbench_bintogray(

);

parameter CLK_PERIOD = 10;

reg         clk;
reg         rst;
reg  [3:0]  data;
wire [3:0]  gray_data;

// 连接测试模块
bin_to_Gray bin_to_Gray_test(
    .clk            (clk),
    .rst            (rst),
    .data           (data),
    .gray_data      (gray_data)
);

// 初始化时钟和复位
initial begin
    clk <= 0;
    rst <= 0;
    data <= 0;
    #1000;
    rst <= 1;

end

always begin
    #(CLK_PERIOD/2)
    clk = ~clk;
end

// 产生测试激励
integer i;
initial begin

    @(posedge rst);

    @(posedge clk) begin
        for(i=0;i<50;i=i+1) begin
            #500;
            data <= {$random} % 15;

            #300
            data <= 0;
        end
    end

    data <= 0;
    
    #10000;

    $stop;

end

endmodule