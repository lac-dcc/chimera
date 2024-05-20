// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module maxnet_cellular (
    input clk, rst, 
    input [4:0] one, epsilon,
    input [4:0] x1,x2,x3,x4,

    output done,
    output [4:0] pu_out1, pu_out2, pu_out3, pu_out4
);

wire input_en, load_in, sel_old_or_new, mul_en, sum_en;

datapath DP(
    .clk(clk),
    .rst(rst),
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .one(one), 
    .epsilon(epsilon),
    .input_en(input_en), 
    .load_in(load_in), 
    .sel_old_or_new(sel_old_or_new), 
    .mul_en(mul_en), 
    .sum_en(sum_en),

    .S(s),
    .pu_out1(pu_out1),
    .pu_out2(pu_out2),
    .pu_out3(pu_out3),
    .pu_out4(pu_out4)
);

controller CU(
    .clk(clk),
    .rst(rst),
    .s(s),

    .input_en(input_en),
    .load_in(load_in), 
    .sel_old_or_new(sel_old_or_new), 
    .mul_en(mul_en), 
    .sum_en(sum_en), 
    .done(done)
);
    
endmodule