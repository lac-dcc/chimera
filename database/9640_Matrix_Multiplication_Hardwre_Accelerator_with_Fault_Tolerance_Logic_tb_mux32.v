// This program was cloned from: https://github.com/Mavvenger/Matrix_Multiplication_Hardwre_Accelerator_with_Fault_Tolerance_Logic
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/24 20:08:02
// Design Name: 
// Module Name: tb_mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//写testbench离不开四个部分：变量信号说明，代码复用（实例引用），控制结构（循环，条件),配置环境（初始化）

module tb_mux32;

// mux32 Parameters
parameter PERIOD  = 10;
// mux32 Inputs
reg   [4:0]  mux_sel                           = 0 ;
reg   [1023:0]  mux_data_in                    = 0 ;
// mux32 Outputs
wire  [31:0]  mux_data_out                     ;

reg clk;

initial
begin
    clk = 1'b0;
   // rst_n = 1'b0;
end

initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
  //  #(PERIOD*2) rst_n  =  1;
end

mux32  u_mux32 (
    .mux_sel                     ( mux_sel       [4:0]    ),
    .mux_data_in                 ( mux_data_in   [1023:0] ),
    .mux_data_out                ( mux_data_out  [31:0]   )
);

reg [31:0] data_values [31:0];//data_values变量的设置是为了最后一个$display任务的打印，在波形图上无效
integer i;
initial
begin
    //下面三个for循环依次按顺序执行，给mux_data_in赋初值
    for(i = 0;i<32;i = i+1)begin
      mux_data_in[i*32+:32]=i+1;
    end

    for(mux_sel = 0;mux_sel<32;mux_sel= mux_sel+1)begin
      @(posedge clk)begin //@后面的语句是一个时序控制
      data_values[mux_sel]=mux_data_in[mux_sel*32+:32];
        if(mux_data_out!==(mux_sel+1))begin
          $display ("Error: mux_sel = %d,mux_data_out = %d,expected = %d",mux_sel,mux_data_out,(mux_sel+1));
        end
      end
    end
    //以下语句在波形图上是无效语句
    for(mux_sel=0;mux_sel<32;mux_sel=mux_sel+1)begin
      $display("mux_data_in[%0d:%0d] = %0d",(mux_sel*32+31),(mux_sel*32),data_values[mux_sel]);
    end
end

initial begin
    # 315 $finish;
end
endmodule
