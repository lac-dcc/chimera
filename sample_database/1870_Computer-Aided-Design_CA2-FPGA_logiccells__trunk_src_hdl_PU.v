// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module PU (
    input clk, rst, mul_en, sum_en,
    input [4:0] x1,x2,x3,x4, w1,w2,w3,w4,

    output s,
    output [4:0] pu_out
    
);

wire [9:0] mul1, mul2, mul3, mul4,
           mul_reg_1, mul_reg_2, mul_reg_3, mul_reg_4;
wire [10:0] sum12, sum34;
wire [11:0] sum_final_res, act_func_in;     
wire or_01, or_012, or_0_3, or_0_4;       

Multiplier M0(.x(x1), .w(w1),.m_res(mul1)); 
Multiplier M1(.x(x2), .w(w2),.m_res(mul2));
Multiplier M2(.x(x3), .w(w3),.m_res(mul3));
Multiplier M3(.x(x4), .w(w4),.m_res(mul4));

Reg10 Reg_M0(.in(mul1), .ld(mul_en), .clk(clk), .rst(rst), .out(mul_reg_1));
Reg10 Reg_M1(.in(mul2), .ld(mul_en), .clk(clk), .rst(rst), .out(mul_reg_2));
Reg10 Reg_M2(.in(mul3), .ld(mul_en), .clk(clk), .rst(rst), .out(mul_reg_3));
Reg10 Reg_M3(.in(mul4), .ld(mul_en), .clk(clk), .rst(rst), .out(mul_reg_4));

Adder11 Add_M01 (.A(mul_reg_1), .B(mul_reg_2),.sum(sum12));
Adder11 Add_M23 (.A(mul_reg_3), .B(mul_reg_4),.sum(sum34));

Adder12 Add_T (.A(sum12), .B(sum34),.sum(sum_final_res));

Reg12 Reg_Add_T(.in(sum_final_res), .ld(sum_en), .clk(clk), .rst(rst), .out(act_func_in));

ActivationFunction Relu(.in(act_func_in), .out(pu_out));

Or OR1(.A(pu_out[0]), .B(pu_out[1]), .out(or_01));
Or OR2(.A(pu_out[2]), .B(or_01), .out(or_012));
Or OR3(.A(pu_out[3]), .B(or_012), .out(or_0_3));
Or OR4(.A(pu_out[4]), .B(or_0_3), .out(or_0_4));

C2 S(.D({3'b000,1'b1}), .A({1'b1,or_0_4}), .B(2'b11), .out(s));


endmodule