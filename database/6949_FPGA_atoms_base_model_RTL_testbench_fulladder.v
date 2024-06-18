// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

`timescale 1ns/1ps
module testbench_fulladder(

);

  reg  [3:0]    A;
  reg  [3:0]    B;
  reg           Cin;
  wire [3:0]    Sum;
  wire          Cout;

  FourBitAdder DUT (
    .A      (A),
    .B      (B),
    .Cin    (Cin),
    .Sum    (Sum),
    .Cout   (Cout)
  );

  initial begin
    // 输入初始值
    A = 4'b0;
    B = 4'b0;
    Cin = 1'b0;

    // 等待一些时间，以确保电路稳定
    #1000;

    A = 4'b0101;
    B = 4'b0010;

    #500;

    A = 4'b1111;
    B = 4'b1100;
    Cin = 1'b1;

    #500;

    
    #10;

    // 结束仿真
    $stop;

  end

endmodule
