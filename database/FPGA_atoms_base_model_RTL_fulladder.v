// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

////////////////////////////////////////////////
// 全加器
////////////////////////////////////////////////

module FullAdder(
  input     A,
  input     B,
  input     Cin,
  output    Sum,
  output    Cout
);

  // 计算和位
  assign Sum = A ^ B ^ Cin;
  // 计算进位位
  assign Cout = (A & B) | (Cin & (A ^ B));

endmodule

module FourBitAdder(
  input     [3:0]   A,
  input     [3:0]   B,
  input             Cin,
  output    [3:0]   Sum,
  output            Cout
);

  // 定义四个输入位和一个输出进位位
wire  [3:0] X;
wire        Cout1, Cout2, Cout3;

// 第一个全加器
FullAdder FA1(
    .A      (A[0]), 
    .B      (B[0]), 
    .Cin    (Cin), 
    .Sum    (X[0]), 
    .Cout   (Cout1)
);

// 第二个全加器
FullAdder FA2(
    .A      (A[1]), 
    .B      (B[1]), 
    .Cin    (Cout1), 
    .Sum    (X[1]), 
    .Cout   (Cout2)
);

// 第三个全加器
FullAdder FA3(
    .A      (A[2]), 
    .B      (B[2]), 
    .Cin    (Cout2), 
    .Sum    (X[2]), 
    .Cout   (Cout3)
);
  
// 第四个全加器
FullAdder FA4(
    .A      (A[3]), 
    .B      (B[3]), 
    .Cin    (Cout3), 
    .Sum    (X[3]), 
    .Cout   (Cout)
);

// 输出结果和进位位
assign Sum = X;
//assign Cout = Cout;

endmodule