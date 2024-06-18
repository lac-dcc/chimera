// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

// https://hdlbits.01xz.net/wiki/Module_fadd

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

wire [15:0] z1;
wire [15:0] z2;
wire coutbig;
add16 s1(a[15:0],b[15:0],1'b0,z1,coutbig);
add16 s2(a[31:16],b[31:16],coutbig,z2,);

assign sum = {z2,z1};
// 这个不是我们担心的 add16内部已经实现完成 只需要模块化组


// 1 top_module


endmodule

module add1( 
        input a, input b, input cin,
        output sum, output cout );

// Full adder module here
assign sum = a^b^cin;
assign cout = a&b | a&cin | b&cin;

endmodule

module add16 ( 
    input[15:0] a, input[15:0] b, input cin, 
    output[15:0] sum, output cout );
endmodule

// ---------------------
// 这块不是不能用 但是HDl 跑不通过 不知道为啥
// 先定义一个半加器
module halfadder (
    input a,input b,
    output s,output c
);
    assign s = a ^ b;
    // 异或门
    assign c = a & b;
    // 与门
endmodule