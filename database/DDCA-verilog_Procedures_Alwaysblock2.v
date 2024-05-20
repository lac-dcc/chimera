// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

// synthesis verilog_input_version verilog_2001
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );

assign out_assign = a ^ b;
// assign 只能用于非procedures

always @(*) out_always_comb = a^b;
// always @(*) 类似于loop 或者while 也是寄存器保存 
// 因为有电平持续输入 只需要对接就好 

// always @(clk) 特殊之处在于需要一个寄存器保存 也就是flip-flop
// 因为电平需要变化 所以就需要一个寄存器来保存之前的内容
// <= 当做一种传送吧

always @(posedge clk ) begin
    out_always_ff <= a^b;
end
endmodule
