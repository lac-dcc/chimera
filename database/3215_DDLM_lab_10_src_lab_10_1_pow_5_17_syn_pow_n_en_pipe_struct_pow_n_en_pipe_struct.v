// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module pow_n_en_pipe_struct
# (
    parameter w = 8, n = 5
)
(
    input                  clk,
    input                  rst_n,
    input                  clk_en,
    input                  arg_vld,
    input  [     w - 1:0 ] arg,
    output [ n     - 1:0 ] res_vld,
    output [ n * w - 1:0 ] res
);

    wire [w - 1:0] mul_d     [ 1 : n - 1     ];

    wire           arg_vld_q [ 0 : n ];
    wire [w - 1:0] arg_q     [ 0 : n ];
    wire [w - 1:0] mul_q     [ 2 : n ];

    assign arg_vld_q [0] = arg_vld;
    assign arg_q     [0] = arg;
    
    assign mul_d     [1] = arg_q [1] * arg_q [1];

    generate
    
        genvar i;
    
        for (i = 2; i <= n - 1; i = i + 1)
        begin : b_mul
            assign mul_d [i] = mul_q [i] * arg_q [i];
        end

        for (i = 1; i <= n - 1; i = i + 1)
        begin : b_mul_reg
            reg_no_rst_en # (w) i_mul
                (clk, clk_en, mul_d [i], mul_q [i + 1]);
        end

        for (i = 0; i <= n - 1; i = i + 1)
        begin : b_regs
            reg_rst_n_en i_arg_vld
                (clk, rst_n, clk_en, arg_vld_q [i], arg_vld_q [i + 1]);

            reg_no_rst_en # (w) i_arg
                (clk, clk_en, arg_q [i], arg_q [i + 1]);
        end
        
        for (i = 2; i <= n; i = i + 1)
        begin : b_res
            assign res_vld [   n - i            ] = arg_vld_q [i];
            assign res     [ ( n - i ) * w +: w ] = mul_q     [i];
        end
    
    endgenerate

    assign res_vld [   n - 1            ] = arg_vld_q [1];
    assign res     [ ( n - 1 ) * w +: w ] = arg_q     [1];

endmodule
