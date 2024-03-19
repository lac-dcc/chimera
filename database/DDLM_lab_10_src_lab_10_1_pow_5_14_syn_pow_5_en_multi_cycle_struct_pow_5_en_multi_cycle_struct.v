module pow_5_en_multi_cycle_struct
# (
    parameter w = 8
)
(
    input            clk,
    input            rst_n,
    input            clk_en,
    input            arg_vld,
    input  [w - 1:0] arg,
    output           res_vld,
    output [w - 1:0] res
);

    wire           arg_vld_q;
    wire [w - 1:0] arg_q;

    reg_rst_n_en        i_arg_vld (clk, rst_n, clk_en, arg_vld, arg_vld_q);
    reg_no_rst_en # (w) i_arg     (clk, clk_en & arg_vld, arg, arg_q);

    wire [3:0] shift_q;
    wire [3:0] shift_d = arg_vld_q ? 4'b1000 : shift_q >> 1;
   
    reg_rst_n_en # (4) i_shift (clk, rst_n, clk_en, shift_d, shift_q);
    
    assign res_vld = shift_q [0];

    wire [w - 1:0] mul_q;
    wire [w - 1:0] mul_d = (arg_vld_q ? arg_q : mul_q) * arg_q;

    wire mul_en = clk_en && (arg_vld_q || shift_q [3:1] != 3'b0);

    reg_no_rst_en # (w) i_mul (clk, mul_en, mul_d, mul_q);
    
    assign res = mul_q;

endmodule
