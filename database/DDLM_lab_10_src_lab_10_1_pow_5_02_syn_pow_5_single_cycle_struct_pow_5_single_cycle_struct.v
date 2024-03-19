module pow_5_single_cycle_struct
# (
    parameter w = 8
)
(
    input            clk,
    input            rst_n,
    input            arg_vld,
    input  [w - 1:0] arg,
    output           res_vld,
    output [w - 1:0] res
);

    wire             arg_vld_q;
    wire   [w - 1:0] arg_q;

    reg_rst_n        i_arg_vld (clk, rst_n, arg_vld, arg_vld_q);
    reg_no_rst # (w) i_arg     (clk, arg, arg_q);

    wire             res_vld_d = arg_vld_q;
    wire   [w - 1:0] res_d     = arg_q * arg_q * arg_q * arg_q * arg_q;

    reg_rst_n        i_res_vld (clk, rst_n, res_vld_d, res_vld);
    reg_no_rst # (w) i_res     (clk, res_d, res);

endmodule
