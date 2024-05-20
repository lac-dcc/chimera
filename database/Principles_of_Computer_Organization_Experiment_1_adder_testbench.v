// This program was cloned from: https://github.com/Men1scus/Principles_of_Computer_Organization
// License: MIT License

`timescale 1ns / 1ps   //仿真单位时间为1ns，精度为1ps
module testbench;

    // Inputs
    // reg [31:0] operand1;
    // reg [31:0] operand2;

    reg [31:0] operand1_H;
    reg [31:0] operand1_L;
    reg [31:0] operand2_H;
    reg [31:0] operand2_L;

    reg cin;

    // Outputs
    // wire [31:0] result;
    wire [31:0] result_H;
    wire [31:0] result_L;
    
    wire cout;
    
    // Instantiate the Unit Under Test (UUT)
    // adder uut (
    //     .operand1(operand1), 
    //     .operand2(operand2), 
    //     .cin(cin), 
    //     .result(result), 
    //     .cout(cout)
    // );

    adder uut(
        .operand1_H(operand1_H),
        .operand1_L(operand1_L),
        .operand2_H(operand2_H),
        .operand2_L(operand2_L),
        .cin     (cin     ),
        .result_H(result_H),
        .result_L(result_L),
        .cout    (cout    )
    );

    initial begin
        // Initialize Inputs
        // operand1 = 0;
        // operand2 = 0;
        operand1_H = 0;
        operand1_L = 0;
        operand2_H = 0;
        operand2_L = 0;

        cin = 0;
        // Wait 100 ns for global reset to finish
        #100;
        // Add stimulus here
    end
    // always #10 operand1 = $random;  //$random为系统任务，产生一个随机的32位数
    always #10 operand1_H = $random;  //$random为系统任务，产生一个随机的32位数
    always #10 operand1_L = $random;  //$random为系统任务，产生一个随机的32位数
    // always #10 operand2 = $random;  //#10 表示等待10个单位时间(10ns)，即每过10ns，赋值一个随机的32位数
    always #10 operand2_H = $random;  //#10 表示等待10个单位时间(10ns)，即每过10ns，赋值一个随机的32位数
    always #10 operand2_L = $random;  //#10 表示等待10个单位时间(10ns)，即每过10ns，赋值一个随机的32位数
    always #10 cin = {$random} % 2; //加了拼接符，{$random}产生一个非负数，除2取余得到0或1
endmodule

