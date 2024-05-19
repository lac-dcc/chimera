// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module pow_5_single_cycle_always
# (
    parameter w = 8
)
(
    input                clk,
    input                rst_n,
    input                arg_vld,
    input      [w - 1:0] arg,
    output reg           res_vld,
    output reg [w - 1:0] res
);

    reg           arg_vld_q;
    reg [w - 1:0] arg_q;

    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            arg_vld_q <= 1'b0;
        else
            arg_vld_q <= arg_vld;
    
    always @ (posedge clk)
        arg_q <= arg;

    wire           res_vld_d = arg_vld_q;
    wire [w - 1:0] res_d     = arg_q  * arg_q * arg_q * arg_q * arg_q;

    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            res_vld <= 1'b0;
        else
            res_vld <= res_vld_d;

    always @ (posedge clk)
        res <= res_d;

endmodule
