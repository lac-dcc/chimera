// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module datapath (
    input clk,rst,
    input [4:0] x1,x2,x3,x4,
    input [4:0] one, epsilon,
    input input_en, load_in, sel_old_or_new, mul_en, sum_en,

    output S,
    output [4:0] pu_out1, pu_out2, pu_out3, pu_out4
);

wire [4:0] reg_x [3:0];
wire [4:0] reg_pu_in [3:0];
wire [4:0] pu_in[3:0];

Reg5 RegX_IN1(.in(x1), .ld(input_en), .clk(clk), .rst(rst), .out(reg_x[0]));
Reg5 RegX_IN2(.in(x2), .ld(input_en), .clk(clk), .rst(rst), .out(reg_x[1]));
Reg5 RegX_IN3(.in(x3), .ld(input_en), .clk(clk), .rst(rst), .out(reg_x[2]));
Reg5 RegX_IN4(.in(x4), .ld(input_en), .clk(clk), .rst(rst), .out(reg_x[3]));

mux5bit2to1 mux1(.a(reg_x[0]), .b(pu_out1), .s(sel_old_or_new), .w(reg_pu_in[0]));
mux5bit2to1 mux2(.a(reg_x[1]), .b(pu_out2), .s(sel_old_or_new), .w(reg_pu_in[1]));
mux5bit2to1 mux3(.a(reg_x[2]), .b(pu_out3), .s(sel_old_or_new), .w(reg_pu_in[2]));
mux5bit2to1 mux4(.a(reg_x[3]), .b(pu_out4), .s(sel_old_or_new), .w(reg_pu_in[3]));

Reg5 Reg_IN1(.in(reg_pu_in[0]), .ld(load_in), .clk(clk), .rst(rst), .out(pu_in[0]));
Reg5 Reg_IN2(.in(reg_pu_in[1]), .ld(load_in), .clk(clk), .rst(rst), .out(pu_in[1]));
Reg5 Reg_IN3(.in(reg_pu_in[2]), .ld(load_in), .clk(clk), .rst(rst), .out(pu_in[2]));
Reg5 Reg_IN4(.in(reg_pu_in[3]), .ld(load_in), .clk(clk), .rst(rst), .out(pu_in[3]));

PU pu1(
    .clk(clk), .rst(rst), .mul_en(mul_en), .sum_en(sum_en),
    .x1(pu_in[0]),.x2(pu_in[1]),.x3(pu_in[2]),.x4(pu_in[3]), .w1(one),.w2(epsilon),.w3(epsilon),.w4(epsilon),

    .s(s0),
    .pu_out(pu_out1)  
);
PU pu2(
    .clk(clk), .rst(rst), .mul_en(mul_en), .sum_en(sum_en),
    .x1(pu_in[0]),.x2(pu_in[1]),.x3(pu_in[2]),.x4(pu_in[3]), .w1(epsilon),.w2(one),.w3(epsilon),.w4(epsilon),

    .s(s1),
    .pu_out(pu_out2)  
);
PU pu3(
    .clk(clk), .rst(rst), .mul_en(mul_en), .sum_en(sum_en),
    .x1(pu_in[0]),.x2(pu_in[1]),.x3(pu_in[2]),.x4(pu_in[3]), .w1(epsilon),.w2(epsilon),.w3(one),.w4(epsilon),

    .s(s2),
    .pu_out(pu_out3)  
);
PU pu4(
    .clk(clk), .rst(rst), .mul_en(mul_en), .sum_en(sum_en),
    .x1(pu_in[0]),.x2(pu_in[1]),.x3(pu_in[2]),.x4(pu_in[3]), .w1(epsilon),.w2(epsilon),.w3(epsilon),.w4(one),

    .s(s3),
    .pu_out(pu_out4)  
);


s_cal S_CAL(.s0(s0), .s1(s1), .s2(s2), .s3(s3), .s(S));
    
endmodule