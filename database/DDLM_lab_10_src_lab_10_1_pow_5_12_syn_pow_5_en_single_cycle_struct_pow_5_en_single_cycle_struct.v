module pow_5_en_single_cycle_struct
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
    reg_no_rst_en # (w) i_arg     (clk, clk_en, arg, arg_q);

    wire           res_vld_d = arg_vld_q;
    wire [w - 1:0] res_d     = arg_q * arg_q * arg_q * arg_q * arg_q;

    reg_rst_n_en        i_res_vld (clk, rst_n, clk_en, res_vld_d, res_vld);
    reg_no_rst_en # (w) i_res     (clk, clk_en, res_d, res);

endmodule
