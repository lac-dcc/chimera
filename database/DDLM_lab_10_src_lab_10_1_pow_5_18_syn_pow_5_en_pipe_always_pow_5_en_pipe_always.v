module pow_5_en_pipe_always
# (
    parameter w = 8
)
(
    input                clk,
    input                rst_n,
    input                clk_en,
    input                arg_vld,
    input  [    w - 1:0] arg,
    output [        4:0] res_vld,
    output [5 * w - 1:0] res
);

    reg [w - 1:0] arg1, arg2, arg3, arg4;
    reg [w - 1:0] pow2, pow3, pow4, pow5;
    reg arg_vld_1, arg_vld_2, arg_vld_3, arg_vld_4, arg_vld_5;

    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
        begin
            arg_vld_1 <= 1'b0;
            arg_vld_2 <= 1'b0;
            arg_vld_3 <= 1'b0;
            arg_vld_4 <= 1'b0;
            arg_vld_5 <= 1'b0;
        end
        else if (clk_en)
        begin
            arg_vld_1 <= arg_vld;
            arg_vld_2 <= arg_vld_1;
            arg_vld_3 <= arg_vld_2;
            arg_vld_4 <= arg_vld_3;
            arg_vld_5 <= arg_vld_4;
        end

    always @ (posedge clk)
        if (clk_en)
        begin
            arg1 <= arg;
            arg2 <= arg1;
            arg3 <= arg2;
            arg4 <= arg3;

            pow2 <= arg1 * arg1;
            pow3 <= pow2 * arg2;
            pow4 <= pow3 * arg3;
            pow5 <= pow4 * arg4;
        end

    assign res_vld = { arg_vld_1 , arg_vld_2 , arg_vld_3 , arg_vld_4 , arg_vld_5 };
    assign res     = { arg1      , pow2      , pow3      , pow4      , pow5      };

endmodule
