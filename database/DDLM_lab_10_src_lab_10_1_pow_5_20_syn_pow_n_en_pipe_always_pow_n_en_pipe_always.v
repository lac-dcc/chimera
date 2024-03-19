module pow_n_en_pipe_always
# (
    parameter w = 8, n = 5
)
(
    input                      clk,
    input                      rst_n,
    input                      clk_en,
    input                      arg_vld,
    input      [     w - 1:0 ] arg,
    output reg [ n     - 1:0 ] res_vld,
    output reg [ n * w - 1:0 ] res
);

    reg [ w - 1 : 0 ] arg_reg [ 1 : n - 1 ];
    reg [ w - 1 : 0 ] pow     [ 2 : n     ];
    reg [     1 : n ] arg_vld_reg;

    integer i;

    always @ (posedge clk or negedge rst_n)

        if (! rst_n)
        begin
            for (i = 1; i <= n; i = i + 1)
                arg_vld_reg [i] <= 1'b0;
        end
        else if (clk_en)
        begin
            arg_vld_reg [1] <= arg_vld;

            for (i = 1; i <= n - 1; i = i + 1)
                arg_vld_reg [i + 1] <= arg_vld_reg [i];
        end

    always @ (posedge clk)

        if (clk_en)
        begin
            arg_reg [1] <= arg;

            for (i = 1; i <= n - 2; i = i + 1)
                arg_reg [i + 1] <= arg_reg [i];

            pow [2] <= arg_reg [1] * arg_reg [1];

            for (i = 2; i <= n - 1; i = i + 1)
                pow [i + 1] <= pow [i] * arg_reg [i];
        end

    always @*
    begin
        for (i = 1; i <= n; i = i + 1)
            res_vld [n - i] = arg_vld_reg [i];

        res [(n - 1) * w +: w] = arg_reg [1];

        for (i = 2; i <= n; i = i + 1)
            res [(n - i) * w +: w] = pow [i];
    end

endmodule
