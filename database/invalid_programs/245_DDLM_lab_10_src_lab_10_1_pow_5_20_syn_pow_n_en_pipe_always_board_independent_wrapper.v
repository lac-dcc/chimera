// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`include "pow_n_en_pipe_always.v"

module board_independent_wrapper
(
    input         fast_clk,
    input         slow_clk,
    input         rst_n,
    input         fast_clk_en,
    input  [ 3:0] key,
    input  [ 7:0] sw,
    output [ 7:0] led,
    output [ 7:0] disp_en,
    output [31:0] disp,
    output [ 7:0] disp_dot
);

    wire [ 4:0] res_vld;
    wire [39:0] res;

    pow_n_en_pipe_always
    # (.w (8), .n (5))
    i_pow_5
    (
        .clk     ( fast_clk    ),
        .rst_n   ( rst_n       ),
        .clk_en  ( fast_clk_en ),
        .arg_vld ( key [0]     ),
        .arg     ( sw          ),
        .res_vld ( res_vld     ),
        .res     ( res         )
    );

    assign disp_en  =
    {
        res_vld [3], res_vld [3],
        res_vld [2], res_vld [2],
        res_vld [1], res_vld [1],
        res_vld [0], res_vld [0]
    };

    assign disp = res [31:0];

    assign disp_dot = 8'b0;

endmodule
