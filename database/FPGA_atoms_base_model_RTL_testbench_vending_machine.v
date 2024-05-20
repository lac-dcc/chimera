// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 自动贩卖机状态机设计的验证平台代码
//

`timescale 1ns/1ps
module testbench_vending_machine(

);

parameter CLK_PEROID = 10;

reg         clk;
reg         rst;
reg         i_one_cny;
reg         i_two_cny;
reg         i_five_cny;

wire        o_done;


// 连接测试平台
vending_machine vending_machine_test(
    .clk        (clk),
    .rst        (rst),
    .i_one_cny  (i_one_cny),
    .i_two_cny  (i_two_cny),
    .i_five_cny (i_five_cny),
    .o_done     (o_done)
);


// 初始化时钟和复位
initial begin
    clk <= 0;
    rst <= 0;
    i_one_cny <= 0;
    i_two_cny <= 0;
    i_five_cny <= 0;
    #1000;
    rst <= 1;

end
always #(CLK_PEROID/2) clk=~clk;


// 产生测试激励
initial begin
    @(posedge rst);
    @(posedge clk);

    #100;
    i_one_cny <= 1;

    #1000;
    i_two_cny <= 1;

    #1000;
    i_five_cny <= 1;

    #1000;
    rst <= 0;

    #1000;
    i_five_cny <= 1;

    #1000;
    i_one_cny <= 1;

end

endmodule

