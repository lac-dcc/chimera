// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module pow_5_pipe_struct
# (
    parameter w = 8
)
(
    input                clk,
    input                rst_n,
    input                arg_vld,
    input  [    w - 1:0] arg,
    output [        4:0] res_vld,
    output [5 * w - 1:0] res
);

    wire           arg_vld_q_1;
    wire [w - 1:0] arg_q_1;

    reg_rst_n        i0_arg_vld (clk, rst_n, arg_vld, arg_vld_q_1);
    reg_no_rst # (w) i0_arg     (clk, arg, arg_q_1);

    assign res_vld [4         ] = arg_vld_q_1;
    assign res     [4 * w +: w] = arg_q_1;

    //------------------------------------------------------------------------

    wire [w - 1:0] mul_d_1 = arg_q_1 * arg_q_1;

    wire           arg_vld_q_2;
    wire [w - 1:0] arg_q_2;
    wire [w - 1:0] mul_q_2;

    reg_rst_n        i1_arg_vld ( clk , rst_n  , arg_vld_q_1 , arg_vld_q_2 );
    reg_no_rst # (w) i1_arg     ( clk ,          arg_q_1     , arg_q_2     );
    reg_no_rst # (w) i1_mul     ( clk ,          mul_d_1     , mul_q_2     );

    assign res_vld [3         ] = arg_vld_q_2;
    assign res     [3 * w +: w] = mul_q_2;
    
    //------------------------------------------------------------------------

    wire [w - 1:0] mul_d_2 = mul_q_2 * arg_q_2;

    wire           arg_vld_q_3;
    wire [w - 1:0] arg_q_3;
    wire [w - 1:0] mul_q_3;

    reg_rst_n        i2_arg_vld ( clk , rst_n  , arg_vld_q_2 , arg_vld_q_3 );
    reg_no_rst # (w) i2_arg     ( clk ,          arg_q_2     , arg_q_3     );
    reg_no_rst # (w) i2_mul     ( clk ,          mul_d_2     , mul_q_3     );

    assign res_vld [2         ] = arg_vld_q_3;
    assign res     [2 * w +: w] = mul_q_3;

    //------------------------------------------------------------------------

    wire [w - 1:0] mul_d_3 = mul_q_3 * arg_q_3;

    wire           arg_vld_q_4;
    wire [w - 1:0] arg_q_4;
    wire [w - 1:0] mul_q_4;

    reg_rst_n        i3_arg_vld ( clk , rst_n  , arg_vld_q_3 , arg_vld_q_4 );
    reg_no_rst # (w) i3_arg     ( clk ,          arg_q_3     , arg_q_4     );
    reg_no_rst # (w) i3_mul     ( clk ,          mul_d_3     , mul_q_4     );

    assign res_vld [1         ] = arg_vld_q_4;
    assign res     [1 * w +: w] = mul_q_4;

    //------------------------------------------------------------------------

    wire [w - 1:0] mul_d_4 = mul_q_4 * arg_q_4;

    wire           arg_vld_q_5;
    wire [w - 1:0] arg_q_5;
    wire [w - 1:0] mul_q_5;

    reg_rst_n        i4_arg_vld ( clk , rst_n  , arg_vld_q_4 , arg_vld_q_5 );
    reg_no_rst # (w) i4_arg     ( clk ,          arg_q_4     , arg_q_5     );
    reg_no_rst # (w) i4_mul     ( clk ,          mul_d_4     , mul_q_5     );

    assign res_vld [0         ] = arg_vld_q_5;
    assign res     [0 * w +: w] = mul_q_5;

endmodule
