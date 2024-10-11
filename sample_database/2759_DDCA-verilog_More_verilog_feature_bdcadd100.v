// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [3:0] sum0;
    wire [99:0] cout100;
    
    bcd_fadd add1( 
                .a(a[3:0]),
                .b(b[3:0]),
                .cin(cin),
                .cout(cout100[0]),
                .sum(sum[3:0])
                );

    // 生成变量 用于后面for循环控制
    genvar i ;
    // generate for loop 控制生成实例
    generate
        for(i=4;i<400;i=i+4)
            begin:adder
                bcd_fadd inst(
                    .a(a[i+3:i]),
                    .b(b[i+3:i]),
                    .cin(cout100[i/4-1]),
                    .cout(cout100[i/4]),
                    .sum(sum[i+3:i])
                );
            end
    endgenerate
/*
    代码实现了一个400位的加法器，采用了二进制编码的十进制（BCD）加法器。下面详细解释这段代码的逻辑：
    顶层模块接口：
    input [399:0] a, b：两个400位的输入操作数。
    input cin：初始进位输入。
    output cout：最终的进位输出。
    output [399:0] sum：400位的加法结果。
    初始化加法器：
        bcd_fadd add1(...)：这是第一个BCD全加器，用于计算最低的4位（a[3:0]和b[3:0]）并产生最低位的和与进位。
    循环生成加法器：
        循环从i=4开始，每次增加4，直到i<400，为每个4位组生成一个BCD全加器实例。
        每个加法器实例inst使用a[i+3:i]和b[i+3:i]作为输入，
        并将前一个加法器的进位输出cout100[i/4-1]作为本加法器的进位输入，
        输出连接到sum[i+3:i]和下一个进位cout100[i/4]。
    最终进位输出：
    assign cout = cout100[99];
    //将最后一个加法器的进位输出作为整个400位加法器的最终进位输出。
*/
    assign cout = cout100[99];

endmodule


module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
    
endmodule