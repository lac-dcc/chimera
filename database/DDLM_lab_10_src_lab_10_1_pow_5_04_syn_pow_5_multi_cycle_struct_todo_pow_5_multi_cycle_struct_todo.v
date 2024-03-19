module pow_5_multi_cycle_struct_todo
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

    wire [4:0] shift_q;
    wire [4:0] shift_d = arg_vld_q ? 5'b10000 : shift_q >> 1;
   
    reg_rst_n # (5) i_shift (clk, rst_n, shift_d, shift_q);
    
    assign res_vld = shift_q [0];

    // TODO: save cycle
    // TODO: reduce switching

    wire [w - 1:0] mul_q;
    wire [w - 1:0] mul_d = arg_vld_q ? arg_q : mul_q * arg_q;

    reg_no_rst # (w) i_mul (clk, mul_d, mul_q);
    
    assign res = mul_q;

endmodule
