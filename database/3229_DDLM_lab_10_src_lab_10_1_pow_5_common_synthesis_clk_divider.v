// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module clk_divider
# (
    parameter w = 24
)
(
    input  clk,
    input  rst_n,
    output divided_clk
);

    reg [w - 1:0] cnt;

    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            cnt <= { w { 1'b0 } };
        else
            cnt <= cnt + 1'b1;

    assign divided_clk = cnt [w - 1];

endmodule
 